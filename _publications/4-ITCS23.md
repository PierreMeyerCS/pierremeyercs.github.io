---
title: "On Low-End Obfuscation and Learning"
collection: publications
category: conferences
permalink: 
excerpt:
date: 2023-1-1
venue: 'ITCS 2023'
slidesurl:
paperurl: 'https://drops.dagstuhl.de/opus/volltexte/2023/17526/pdf/LIPIcs-ITCS-2023-23.pdf'
bibtexurl:
---

<details>
<summary>Abstract</summary>
Most recent works on cryptographic obfuscation focus on the high-end regime of obfuscating general circuits while guaranteeing computational indistinguishability between functionally equivalent circuits. Motivated by the goals of simplicity and efficiency, we initiate a systematic study of "low-end" obfuscation, focusing on simpler representation models and information-theoretic notions of security. We obtain the following results.<br><br>
[Positive results via “white-box” learning.] We present a general technique for obtaining perfect indistinguishability obfuscation from exact learning algorithms that are given restricted access to the representation of the input function. We demonstrate the usefulness of this approach by obtaining simple obfuscation for decision trees and multilinear read-k arithmetic formulas.<br><br>
[Negative results via PAC learning.] A proper obfuscation scheme obfuscates programs from a class C by programs from the same class. Assuming the existence of one-way functions, we show that there is no proper indistinguishability obfuscation scheme for k-CNF formulas for any constant k ≥ 3; in fact, even obfuscating 3-CNF by k-CNF is impossible. This result applies even to computationally secure obfuscation, and makes an unexpected use of PAC learning in the context of negative results for obfuscation.<br><br>
[Separations.] We study the relations between different information-theoretic notions of indistinguishability obfuscation, giving cryptographic evidence for separations between them.
</details>
