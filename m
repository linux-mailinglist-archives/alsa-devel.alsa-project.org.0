Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D1FAEB8CB
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6119760205;
	Fri, 27 Jun 2025 15:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6119760205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030624;
	bh=t84B5zUtb8yEC4vaK8I+qVHLlpCOm4ZKFphBdavyz5E=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rusFjp8FhVId1DlRUpn0Cwi3PbPXdL5BlCFRksfrpFg3kzJiTLfMZLWtpqyOIZ1d7
	 JCvFPyH2/qpju4kavo5WliAINzN/d1MDI15vhCe/7kEdcmJRK7r4mp3E/Uo3KqEw6z
	 Llq9Br3H2iAPIX5vsE9dIcoShcd3iDC12rICxXqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1239FF80606; Fri, 27 Jun 2025 15:22:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABAB4F80605;
	Fri, 27 Jun 2025 15:22:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4541F804B2; Fri, 20 Jun 2025 12:38:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2-06.simnet.is (smtp-out2-06.simnet.is
 [194.105.231.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACFB7F800D2
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 12:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACFB7F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=Klhohaze
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1750415928; x=1781951928;
  h=date:from:to:subject:message-id:mime-version;
  bh=42xYEP1k5tAJNRT1bo5FbuVv0JprkoyxAgKW1RsIUV4=;
  b=Klhohazetk9Je4D8KV+uoPAtGutyw8gpgkKd+7xRp8dgJikNsAtyDUWD
   32f6YKYAeEiZrgRW+6MD8VBBr0vd8RNuO768+oXAzTQuFpYIKglD+01AT
   lIu7hT5lkhOECVAfF44gMFie4k4d0lli50oIFG9P72vt7jHH4D6pQyiLf
   BlAWg0WHVmSNR4pM2gmOPaU8mhzTE4P5ZncXUs0GrPq9phSmcKBk8Bf/p
   I/313e9zO+QgQssl7YFwA9VWyfGkkwIlbPx7VW0StsZyDW0hQkxth01W1
   +1F8xuWhyemTPjU6ae4Xz9ThPAmMDOA85o41tdzLwTInbSQB2FAQqsEsK
   Q==;
X-CSE-ConnectionGUID: GgmunebPSMSRojtxMlBrgA==
X-CSE-MsgGUID: BLH65kqLSnWaPOqFVSFGhA==
Authentication-Results: smtp-out-06.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2GeAACQOFVohdRiq09aHQEBAQEJARIBBQUBQIFCBQELA?=
 =?us-ascii?q?YIbKIEAgWWIJI4ioCAHAQEBDzEgBAEBAwEDhQCLayg3Bg4BAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEGAQEBAQEBBgcCEAEBAQFADjuFNUYNgxaCFiwCLoFNC?=
 =?us-ascii?q?jB8J4MCAYJurW6BNIEBgxzbG4FeEIFJAYVsgmQBhWyEdzwGgg2BFTIDgXNRb?=
 =?us-ascii?q?4RvhhgEgg0XgQIUgREZgRgdEoMnglyQDUiBHgNZLAFVEw0KCwcFgWMDNQwLL?=
 =?us-ascii?q?hUyPDIdgSeHK4RFK0+FIIEmg14kcA8GgTA2CgMLGA1IESw3FBtEbgeRaYIrC?=
 =?us-ascii?q?S82AQ0BMAwaDCsBgQMjChMDMAIEBAseDSGTZ49hgUSgKYE+hCWGXYMzgg2VU?=
 =?us-ascii?q?DMig2KBV5FwDDuST5kElwyMdRk3hGmBfoIALAcaCDA7gmcJSRkPjgcjAxaBE?=
 =?us-ascii?q?gEHhyE2skR4PAIHCwEBAwmSCQEB?=
IronPort-PHdr: A9a23:W4PCHhArx9bRuEfv+AWTUyQVQxdPi9zP1m898Z87k/dJb7jmp8qkJ
 03a4/hxyl7SDs3X6PNB3uzRta2oGWkN+o2Iv31KdptQHwQEhsMbk01oAMOMBUDhav+/aSs8E
 ax/
IronPort-Data: A9a23:Dr2R5q2a9tynoxVEfvbD5TN2kn2cJEfYwER7XKvMYbSIYBqW5UVUl
 jlwBDjYJKrIIHykJ5onO8nq60s2DaWlxodiQAo+pHsyHikU9JKaW97GcU2oNCibccDOQBJqs
 5QQZoieIMlsESTQ+R3yaOnqpCAghfyESrCiAeecM3l9TmeIJMtZZTdLwobV1aY00ITla+/0h
 e7PnyG21CdJsRZ9Nnkd4L6H7kopsPX8tlv01XRkPaFB5wPVzCYZB8oRfay8dnClHYVeTrTqF
 +uZnLu19DiEo0xzUd78nLr2eEBSGLXYZgKDgCoJVfCojkhO/Sc7ukpX2ILwTG8O49net4sum
 L2hzKCNdDvFV0G0dI41XBReHjt3OetM5bDcSZTUmcXJkBPMKyPmn64xBxA8YoARoesuWDgSp
 PEReW1cMk6J1ry4kbjmRrZhi8kvdJKzNtwVsS9qwTrXUqgqH5nKGv+iCbO0pNsVrpkm8aH2P
 ptIOVKDFSj9XiCjGmv7Kbpukrj01ijxeTRU8AOc/fRvsziCx1wo27W8YISFIY3UT+xYzx2Sz
 o7k1z2iW0lFbrRz6tYkHlaE3LKncfbTAdpKfFGA3qc0xgXVnipLVUF+uWKT+ZGRklS5V89UN
 3sa8y8vqbla3EGwR7ERZTXhyJK/lkBaAoQ4/9ESslnXl/KKuV7BWgDocxYYADAYnJ5nLdAV/
 gfhc+PBXVRHrLCTQHSBwbaYxRvaETQVN2ILeRgfRgID5dT5yKlr5v4YZo8+eEIdpoSd9QDYm
 1hmngBn71kgpZJjO5GAwLzyq2nESq4l4eICzl6/smqNtmuVbWM+DmCiwQCzAf1odO51QrQd1
 ZStdgf3AO0mVPmweCKxrOolM76s+vCIOgXnpGVVGJs95xGp0WSsVNUFiN1+DB8B3scsZz7yf
 ArBuAZJ/phDLT7yMOlpYpmtTcUxpUTiPYu0EKmLN5wfMt4rLVXvECJGPCZ820jnn2A3kKQ5N
 IvdcN3E4XMyVP4+k2HmGb91PbkD7AQemz7QXLTAySuu6Z2HSkCuZ5gFGQ7bBgw+xPnf/lmEr
 I8329Gx4xxbS+S7biTJ/Io7JFQRJD0jH5f0psdLMOmZLWJb9HoJFf7K3fYzeol9haNFh6KQo
 zejW1REjlvk7ZHaFemUQl9sba7pUJxHllcABysuIUaN31I5bq/6uc/zaKALVbUg8eViy9t9Q
 P8EZ9iMD5xzptLvoGR1gX7V99wKSfi7uT9iKRZJdxAeRPZdq+Hh5N7/Yk799SwWFC2npI5m/
 vu+1xjHB5sYL+iDMCo0QK7wp79SlSJE8A6XY6cuCoMCEKkL2NI7QxEddtdtf6kxxezrn1N2L
 Tq+DxYCvvXqqIQo6tTPjq3sh972TrMlQxULRzeGs+ne2czmEoyLmt8ovAGgJmC1aY8I0Pz4D
 Qmo56ylaqVvcKhi6dUke1qU8U7Oz4G0+eMLkV0M8ITjdFmtEbooL3mItfSjRYURroK1TTCeA
 xrVkvEDYOnhEJ2+SjY5elF6BtlvINlPwVE+G9xuex2ivEeaPdOvDS1vAvV7oHMCduAqYN90n
 o/Meqc+smSCt/bjCf7e5gg8yohGBiVov3kP3n3CPLLWtw==
IronPort-HdrOrdr: A9a23:eT8Vs6xw+3YCiSQd3FJtKrPwF71zdoMgy1knxilNoHtuA7Wlfq
 GV7ZImPHrP4wr5N0tPpTntAtjifZqjz+8T3WBhB9aftWDd0QPEEGgF1/qG/9SJIVybygdz78
 hdmsNFaOEYY2IK7/oTqGGDf+rJirG8mpyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AXzDqW2mglMb2TL+IHSur+UuTKqzXOVLSyWrWLkW?=
 =?us-ascii?q?AMkNScrqXVU+1/Il+nOM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A2eZ0XQ3YBT1lCjKIEv6CIpgZQDUjyYCOVh0OiLE?=
 =?us-ascii?q?9vfaNDQtpFQmmohu3a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.16,251,1744070400";
   d="1'?diff'?bugs'?scan'208";a="52173860"
Received: from vist-zimproxy-05.vist.is ([79.171.98.212])
  by smtp-out-06.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 10:38:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-05.vist.is (Postfix) with ESMTP id 95C8420984C7
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 10:38:45 +0000 (UTC)
Received: from vist-zimproxy-05.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-05.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id IVM9ey_Q3peU for <alsa-devel@alsa-project.org>;
 Fri, 20 Jun 2025 10:38:45 +0000 (UTC)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-05.vist.is (Postfix) with ESMTPS id 743DB2098B60
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 10:38:45 +0000 (UTC)
Received: from bg by kassi.invalid.is with local (Exim 4.98.2)
	(envelope-from <bg@kassi.invalid.is>)
	id 1uSZ8v-000000000vG-03X2
	for alsa-devel@alsa-project.org;
	Fri, 20 Jun 2025 10:38:45 +0000
Date: Fri, 20 Jun 2025 10:38:44 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: alsactl.1: Some remarks and a patch with editorial changes for this
 man page
Message-ID: 
 <175041570941.3435.10086363233558543062.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="TARVIl6wqq9daVka"
Content-Disposition: inline
X-Mailer: reportbug 13.2.0
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4NE6EEWM64EMIVGNOAK7H5KR23UUAU77
X-Message-ID-Hash: 4NE6EEWM64EMIVGNOAK7H5KR23UUAU77
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:22:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4NE6EEWM64EMIVGNOAK7H5KR23UUAU77/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TARVIl6wqq9daVka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Package: alsa-utils
Version: 1.2.14-1
Severity: minor
Tags: patch

   * What led up to the situation?

     Checking for defects with a new version

test-[g|n]roff -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z < "man page"

  [Use 

grep -n -e ' $' -e '\\~$' -e ' \\f.$' -e ' \\"' <file>

  to find (most) trailing spaces.]

  ["test-groff" is a script in the repository for "groff"; is not shipped]
(local copy and "troff" slightly changed by me).

  [The fate of "test-nroff" was decided in groff bug #55941.]

   * What was the outcome of this action?

troff:<stdin>:224: warning: trailing space in the line

   * What outcome did you expect instead?

     No output (no warnings).

-.-

  General remarks and further material, if a diff-file exist, are in the
attachments.


-- System Information:
Debian Release: 13.0
  APT prefers testing-security
  APT policy: (500, 'testing-security'), (500, 'testing')
Architecture: amd64 (x86_64)

Kernel: Linux 6.12.32-amd64 (SMP w/2 CPU threads; PREEMPT)
Locale: LANG=is_IS.iso88591, LC_CTYPE=is_IS.iso88591 (charmap=ISO-8859-1), LANGUAGE not set
Shell: /bin/sh linked to /usr/bin/dash
Init: sysvinit (via /sbin/init)

Versions of packages alsa-utils depends on:
ii  kmod              34.2-2
ii  libasound2t64     1.2.14-1
ii  libatopology2t64  1.2.14-1
ii  libc6             2.41-8
ii  libfftw3-single3  3.3.10-2+b1
ii  libncursesw6      6.5+20250216-2
ii  libsamplerate0    0.2.2-4+b2
ii  libtinfo6         6.5+20250216-2

alsa-utils recommends no packages.

Versions of packages alsa-utils suggests:
pn  dialog  <none>

-- no debconf information

--TARVIl6wqq9daVka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.alsactl.1"

Input file is alsactl.1

Output from "mandoc -T lint  alsactl.1": (shortened list)

      2 input text line longer than 80 bytes

-.-.

Output from
test-nroff -mandoc -t -ww -z alsactl.1: (shortened list)

      1 line(s) with a trailing space

-.-.

Add a "\&" (or a comma (Oxford comma)) after an abbreviation
or use English words
(man-pages(7)).
Abbreviation points should be marked as such and protected against being
interpreted as an end of sentence, if they are not, and that independent
of the current place on the line.

214:necessary for some soundcard features (e.g. enabling/disabling

-.-.

Wrong distance (not two spaces) between sentences in the input file.

  Separate the sentences and subordinate clauses; each begins on a new
line.  See man-pages(7) ("Conventions for source file layout") and
"info groff" ("Input Conventions").

  The best procedure is to always start a new sentence on a new line,
at least, if you are typing on a computer.

Remember coding: Only one command ("sentence") on each (logical) line.

E-mail: Easier to quote exactly the relevant lines.

Generally: Easier to edit the sentence.

Patches: Less unaffected text.

Search for two adjacent words is easier, when they belong to the same line,
and the same phrase.

  The amount of space between sentences in the output can then be
controlled with the ".ss" request.

Mark a final abbreviation point as such by suffixing it with "\&".

Some sentences (etc.) do not begin on a new line.

Split (sometimes) lines after a punctuation mark; before a conjunction.

  Lines with only one (or two) space(s) between sentences could be split,
so latter sentences begin on a new line.

Use

#!/usr/bin/sh

sed -e '/^\./n' \
-e 's/\([[:alpha:]]\)\.  */\1.\n/g' $1

to split lines after a sentence period.
Check result with the difference between the formatted outputs.
See also the attachment "general.bugs"

17:soundcard drivers. It supports multiple soundcards. If your card has
25:The \fI<card>\fP argument is optional. If no soundcards are specified,
36:configuration file. If restoring fails (eventually partly), the init
46:This command tries to initialize all devices to a default state. If device
76:The optional element identifiers are accepted as a filter. One extra
106:Select the configuration file to use. The default is /var/lib/alsa/asound.state.
110:Select the boot / hotplug ALSA configuration directory to use. The default is /var/lib/alsa.
133:Used with store, restore and init commands. Do not show 'No soundcards found'
152:Save restore and init state to this file. The file will contain only errors.
167:The configuration file for init. By default, PREFIX/share/alsa/init/00main
196:Execute also the 'defaults' section from the UCM configuration. The standard
201:Skip the UCM init even if available. It may be useful for the test the
207:soundcards. The settings include all the usual soundcard mixer
213:\fBalsactl store\fP. Editing the configuration file by hand may be
214:necessary for some soundcard features (e.g. enabling/disabling
231:<abramo@alsa\-project.org>. This document is by Paul Winkler <zarmzarm@erols.com>.

-.-.

Split lines longer than 80 characters into two or more lines.
Appropriate break points are the end of a sentence and a subordinate
clause; after punctuation marks.
Add "\:" to split the string for the output, "\<newline>" in the source.  

Line 7, length 93

\fBalsactl\fP [\fIoptions\fP] [\fIstore\fP|\fIrestore\fP|\fIinit\fP] <card # or id or device>

Line 110, length 92

Select the boot / hotplug ALSA configuration directory to use. The default is /var/lib/alsa.

Line 231, length 82

<abramo@alsa\-project.org>. This document is by Paul Winkler <zarmzarm@erols.com>.

Longest line is number 7 with 93 characters

-.-.

Use \(en (en-dash) for a dash at the beginning (end) of a line,
or between space characters,
not a minus (\-) or a hyphen (-), except in the NAME section.

alsactl.1:162:ALSA_CONFIG_PATH to read different or optimized configuration - may be

-.-.

The name of a man page is typeset in bold and the section in roman
(see man-pages(7)).

220:amixer(1),
221:alsamixer(1),
222:aplay(1),
223:alsactl_init(7)

-.-.

Put a parenthetical sentence, phrase on a separate line,
if not part of a code.
See man-pages(7), item "semantic newline".

alsactl.1:36:configuration file. If restoring fails (eventually partly), the init
alsactl.1:70:collected from the given control device (sound card).
alsactl.1:83:This command dumps the current state (all cards) to stdout.
alsactl.1:87:This command dumps the current configuration (all cards) to stdout.
alsactl.1:120:file (including the global state file).
alsactl.1:188:Set the process priority (see 'man nice')

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=0 -ww -z ":

troff:<stdin>:224: warning: trailing space in the line

-.-

Generally:

Split (sometimes) lines after a punctuation mark; before a conjunction.

--TARVIl6wqq9daVka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="alsactl.1.diff"

--- alsactl.1	2025-06-18 23:16:43.957871692 +0000
+++ alsactl.1.new	2025-06-20 10:23:01.378898947 +0000
@@ -216,12 +216,11 @@ automatic mic gain, digital output, joys
 routing options, etc).
 
 .SH SEE ALSO
-\fB
-amixer(1),
-alsamixer(1),
-aplay(1),
-alsactl_init(7)
-\fP
+.BR \
+amixer "(1), " \
+alsamixer "(1), " \
+aplay "(1), " \
+alsactl_init (7)
 
 .SH BUGS
 None known.

--TARVIl6wqq9daVka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="general.bugs"

  Any program (person), that produces man pages, should check the output
for defects by using (both groff and nroff)

[gn]roff -mandoc -t -ww -b -z -K utf8 <man page>

  To find trailing space use

grep -n -e ' $' -e ' \\f.$' -e ' \\"' <man page>

  The same goes for man pages that are used as an input.

  For a style guide use

  mandoc -T lint

-.-

  Any "autogenerator" should check its products with the above mentioned
'groff', 'mandoc', and additionally with 'nroff ...'.

  It should also check its input files for too long (> 80) lines.

  This is just a simple quality control measure.

  The "autogenerator" may have to be corrected to get a better man page,
the source file may, and any additional file may.

  Common defects:

  Not removing trailing spaces (in in- and output).
  The reason for these trailing spaces should be found and eliminated.

  "git" has a "tool" to point out whitespace,
see for example "git-apply(1)" and git-config(1)")

  Not beginning each input sentence on a new line.
Line length and patch size should thus be reduced.

  The script "reportbug" uses 'quoted-printable' encoding when a line is
longer than 1024 characters in an 'ascii' file.

  See man-pages(7), item "semantic newline".

-.-

The difference between the formatted output of the original and patched file
can be seen with:

  nroff -mandoc <file1> > <out1>
  nroff -mandoc <file2> > <out2>
  diff -d -u <out1> <out2>

and for groff, using

\"printf '%s\n%s\n' '.kern 0' '.ss 12 0' | groff -mandoc -Z - \"

instead of 'nroff -mandoc'

  Add the option '-t', if the file contains a table.

  Read the output from 'diff -d -u ...' with 'less -R' or similar.

-.-.

  If 'man' (man-db) is used to check the manual for warnings,
the following must be set:

  The option "-warnings=w"

  The environmental variable:

export MAN_KEEP_STDERR=yes (or any non-empty value)

  or

  (produce only warnings):

export MANROFFOPT="-ww -b -z"

export MAN_KEEP_STDERR=yes (or any non-empty value)

-.-

--TARVIl6wqq9daVka--
