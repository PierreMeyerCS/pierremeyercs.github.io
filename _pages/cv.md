---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

<details markdown="1" class="cv-section">
<summary>Education</summary>

* Ph.D in Computer Science, Reichman University (Herzliya, Israel) & Université Paris Cité (Paris, France), 2023
* Diploma of the École Normale Supérieure de Lyon (confers a Master's degree), 2020
* M.Sc. in Computer Science, Université Claude Bernard Lyon 1 (Lyon, France), 2019
* B.Sc. in Computer Science, Université Claude Bernard Lyon 1 (Lyon, France), 2017

</details>

<details markdown="1" open class="cv-section">
<summary>Work experience</summary>

* 2026-...: Tenure-Track Faculty Member, CISPA, Saarbrücken, Germany

* 2023-2026: Postdoctoral Researcher
  * Aarhus University, Aarhus, Denmark
  * Host: Claudio Orlandi

* 2016-2020: Normalien élève
  * École Normale Supérieure de Lyon, Lyon, France

</details>

<details markdown="1" class="cv-section">
<summary>Research internships</summary>

* 2020 (6 months): Research intern, IDC Herzliya, Herzliya, Israel
  * FACT Center. Supervisor: Elette Boyle. Topic: Lower Bounds for Topology-Hiding Computation

* 2019 (3 months): Research intern, Université Paris Diderot, Paris, France
  * IRIF. Supervisor: Geoffroy Couteau. Topic: Secure Computation with Low Communication

* 2019 (6 months): Research intern, Aarhus University, Aarhus, Denmark
  * Crypto Group. Supervisors: Ivan Damgård and Daniel Tschudi. Topic: Topology-Hiding Computation

* 2018 (3 months): Research intern, Thalès Communications & Security, Gennevilliers, France
  * Supervisors: Binh-Minh Bui-Xuan and Antoine Roux. Topic: Performance Analysis of Rectangular Codes with Minimal Feedback Information

* 2018 (6 weeks): Research intern, Université Pierre & Marie Curie, Paris, France
  * LIP6. Supervisors: Binh-Minh Bui-Xuan and Clémence Magnien. Topic: Dynamic Connexity and Parameterised Complexity

</details>

<details markdown="1" open class="cv-section">
<summary>Publications</summary>

  <ul>{% assign sorted_publications = site.publications | sort: "pub_index" %}{% for post in sorted_publications reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>

</details>
  
<details markdown="1" open class="cv-section">
<summary>Selected Talks</summary>

  <ul>{% for post in site.talks reversed %}
    {% include archive-single-talk-cv.html  %}
  {% endfor %}</ul>

</details>
  
<details markdown="1" open class="cv-section">
<summary>Service and leadership</summary>

* Programme Committee member: TCC 2024, SCN 2024, Crypto 2025, Crypto 2026

</details>
