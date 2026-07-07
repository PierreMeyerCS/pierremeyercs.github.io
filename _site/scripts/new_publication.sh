#!/usr/bin/env bash
#
# new_publication.sh
#
# Interactively creates a new entry in _publications/ for the AcademicPages
# Jekyll site. Conference papers and journal articles share a single
# "reverse-enumerate" index (see _pages/publications.html): the newest
# addition gets the highest number, and both sections are sorted by it,
# with Conference Papers displayed first.
#
# Filename convention: <index>_<acronym><year>.md
#   index   = (count of existing .md files in _publications/) + 1
#   acronym and year are concatenated directly (no separator between them)
#
# Usage: scripts/new_publication.sh

set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PUB_DIR="$BASE_DIR/_publications"
mkdir -p "$PUB_DIR"

# ---- small helpers ---------------------------------------------------------

# Loops until the user provides a non-empty value.
prompt_required() {
  local prompt_text="$1" __resultvar="$2" input=""
  while [[ -z "$input" ]]; do
    read -rp "$prompt_text" input
    [[ -z "$input" ]] && echo "  This field is required." >&2
  done
  printf -v "$__resultvar" '%s' "$input"
}

# Escapes backslashes then double quotes, so values can sit safely inside
# double-quoted YAML strings.
escape_yaml() {
  printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g'
}

echo "=== New publication entry ==="
echo

# ---- category ---------------------------------------------------------
# Not one of the 8 requested fields, but required to know which of the two
# sections (and which shared-index slot) this entry belongs to.
category=""
while [[ -z "$category" ]]; do
  echo "Is this a:"
  echo "  1) Conference paper"
  echo "  2) Journal article"
  read -rp "Enter 1 or 2: " choice
  case "$choice" in
    1) category="conferences" ;;
    2) category="manuscripts" ;;
    *) echo "  Please enter 1 or 2." ;;
  esac
done
echo

# ---- the 8 requested fields ------------------------------------------------
prompt_required "Paper acronym (used only in the filename, e.g. NDSS): " acronym

year=""
while [[ -z "$year" ]]; do
  read -rp "Paper year (4 digits, e.g. 2026): " year
  if ! [[ "$year" =~ ^[0-9]{4}$ ]]; then
    echo "  Please enter a 4-digit year." >&2
    year=""
  fi
done

prompt_required "Paper title: " title
read -rp "Co-authors (comma-separated, excluding yourself; blank if none): " coauthors
prompt_required "Venue (journal or conference name): " venue

echo "Abstract (paste the text; press Enter on an empty line when done):"
abstract=""
while IFS= read -r line; do
  [[ -z "$line" ]] && break
  if [[ -z "$abstract" ]]; then abstract="$line"; else abstract="$abstract $line"; fi
done

read -rp "Permalink / DOI of the published version (blank if none yet): " doi
read -rp "Eprint link, e.g. arXiv (blank if none): " eprint
echo

# ---- compute the shared reverse-enumerate index ----------------------------
# Counts every .md file directly in _publications/, regardless of category,
# so conference papers and journal articles draw from one shared sequence.
current_count=$(find "$PUB_DIR" -maxdepth 1 -name "*.md" -type f | wc -l | tr -d ' ')
index=$((current_count + 1))

# ---- filename: <index>_<acronym><year>.md ----------------------------------
safe_acronym=$(printf '%s' "$acronym" | tr -cd '[:alnum:]')
if [[ -z "$safe_acronym" ]]; then
  echo "Error: acronym must contain at least one letter or digit." >&2
  exit 1
fi
slug="${index}_${safe_acronym}${year}"
filename="${slug}.md"
filepath="$PUB_DIR/$filename"

if [[ -e "$filepath" ]]; then
  echo "Error: $filepath already exists. Aborting so nothing gets overwritten." >&2
  exit 1
fi

# ---- write front matter (this IS the whole file now - no body needed,
#      since publications no longer render as their own page; the abstract
#      lives entirely in the excerpt field, shown in the collapsible box) --
{
  echo "---"
  echo "title: \"$(escape_yaml "$title")\""
  echo "collection: publications"
  echo "category: ${category}"
  echo "pub_index: ${index}"
  echo "date: ${year}-01-01"
  echo "venue: \"$(escape_yaml "$venue")\""
} > "$filepath"

# Optional fields are omitted entirely when blank. An empty "" string is
# still truthy in Liquid, so leaving the key out entirely is what makes
# `{% if post.doi %}`-style checks in the templates behave as expected.
[[ -n "$abstract" ]]  && echo "excerpt: \"$(escape_yaml "$abstract")\"" >> "$filepath"
[[ -n "$coauthors" ]] && echo "coauthors: \"$(escape_yaml "$coauthors")\"" >> "$filepath"
[[ -n "$doi" ]]       && echo "doi: \"$(escape_yaml "$doi")\"" >> "$filepath"
[[ -n "$eprint" ]]    && echo "eprint: \"$(escape_yaml "$eprint")\"" >> "$filepath"

echo "---" >> "$filepath"

echo "Created: $filepath"
echo "Index:   $index   (category: $category)"
echo "Edit the file directly if you need to fix the exact date."
