Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA848A4FA59
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:39:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53AFA603C8;
	Wed,  5 Mar 2025 10:38:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53AFA603C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167544;
	bh=J74WhvPhRjAgNfxQELLA2D4gN96UgOUnuB5Z3fWRRhY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=es1Ahy/JNNQzJqu1e0udIdMZAn1Nh6vM52ceNVDsc1ccKtNcrodR4RYXxydJzT9WK
	 afITW+eIevSWdHnkHjoFaoP79gUtKtgJvhH3DTImgaSeJb5OW0cGwcjIpwJUJVVs2N
	 d0o/uY4zcsTFAZlT5tRKuhJtDgHLy2p9xf3YIqJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54A80F806E9; Wed,  5 Mar 2025 10:36:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C21AF80715;
	Wed,  5 Mar 2025 10:36:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20375F8014B; Sat,  1 Mar 2025 17:07:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1-03.simnet.is (smtp-out1-03.simnet.is
 [194.105.232.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8543F800C1
	for <alsa-devel@alsa-project.org>; Sat,  1 Mar 2025 17:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8543F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=RbDzUims
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1740845272; x=1772381272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pu5lDQp5iPzPA+eXGXOxuf4eantH9mLOi4QVMI6tEfA=;
  b=RbDzUimstwj0fs9Ve6CMmXy1VKdE4c2fyVkgtVnfbDQe1qSJ32AqQ0IF
   c/WG/N6VAziCx5ii5RgL9wkhk9GvvatKDsfDUIwquRCCXGmLzMKT3QfUM
   3Vb5Kds9/dDsFW8iJMiAGa2Oq/dpBLRQIQjxXd9MvEGZpcO7KU1wfy4xo
   BMcgPj2W+Uq+kalUE8dnDNolRhD7mblxE68+WVQbTfjus6I+IQSoKLf4R
   rK5HKHmhnXwbkekkS/w7jUrhn1YGQJqjfJCW8Qx5crFaxGG/BbunA0na2
   29mycLTHQVdMr+yKu9TWQLy+6FuiqxGWDyiF5mVk2uZXkJNEEqvrtB14K
   A==;
X-CSE-ConnectionGUID: rOu4utu3RZCaaFpYUORC9w==
X-CSE-MsgGUID: iQ2Vrb8wSqm7Mh8SMXVdww==
Authentication-Results: smtp-out-03.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2GbAgA2LcNnhVfoacJaHQEBAQEJARIBBQUBQIFTgkR9g?=
 =?us-ascii?q?WSIFg+OIaAdBwEBAQ85CwQBAQMBA4UAixcoOBMBAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEGAQEBAQEBBgcCEAEBAQFADjuFNUYNgxZxgSUBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBHQICPyoBgREKAy18JwmCeQGCZBSvWoE0gQGDHNsYgV4QgUiFbIJjAYVrh?=
 =?us-ascii?q?Hc8BoINgUcDgQZQHVFvgmEBA4IKhhgEghgXgTuCAl6BDIclhQaCOoF9hDUZg?=
 =?us-ascii?q?SQgEoNfgnWLD0iBIQNZLAFVEw0KCwcFgXEDNQwLLhUygRRDNzeCDmlJOgINA?=
 =?us-ascii?q?jWCHnyCK4JbgXmEQ4RAhVKCEYs3hHUdNgoDCxgNSBEsNxQbRG4HoQEBPINFC?=
 =?us-ascii?q?S8xBQ0BARUbDCYrARsZGTYjChMDMAYPHQEhk3KPWYFEgyqceoE+hCWGXIMxg?=
 =?us-ascii?q?guVSjMig2GBV5FrDDqSS5h9o20NGTeEZ4F+gX8sBxoIMDuCZwlJGQ+OByMDF?=
 =?us-ascii?q?og1NsJ+eDwCBwsBAQMJkWcBAQ?=
IronPort-PHdr: A9a23:TuBQaRaT39QVQfxZvbK2OhD/LTAChN3EVzX9i7I8jq5WN6O+49G6Z
 wrE5PBrgUOPXJ6Io/5Hiu+DtafmVCRA5Juaq3kNfdRKUANNksQZmQEsQYaFBET3IeSsbnk8G
 8JPPGI=
IronPort-Data: A9a23:2cWf0ajfXkT7VFhbZwkU8Tf/X1613RcKZh0ujC45NGQN5FlGYwSz7
 tYtKTreYZDXMzzrLps0dtzrrAJT+4jU/mJQOApqqXhnES0QpZeZWo7EckyuMSrDf8bPRxw+t
 5lCMYmcIp5sRy7R/0z2a+a/8nAh3/uFHrT3V77JYXh/GQE+Fy5JZX6P4wIcqtcAbY+RX1/V4
 rse2vH3J0C6nTR1KmdS7LiM7x5p++zvsjcZtVUiZPdNpxjFljwfFpUUJbyrIhPErvJv8ruHq
 5zrl/fhll7kwivBYz/dftzTe0gLUrPIe1HIhntYVcBO6TAerXc42/thaKYQOEpbhz/Sz417l
 4tGuZHpFg12MvbAxLgQXRQHTS9yNKNL9eCYeXGxuMDInxbILSO2na5iAB5rVWF0Fp6bJEkXn
 RBPAG1dNU7ra5uK/Y+HpoCA/ihJBMbmOo4Fs3UmxyzWFp7KKriYH/rA7I8D1zpgi8xDFKiAb
 pcXNzBlPEyRMxAeNwsZUs00w7ejiCamKmIC8g3I+/I7vjndwVMgjrWxaIaEdNfSLSk5cj50g
 0qfl4iuKkhLbob3JUO5z0+Ras/zcQLTBNMbGuzhra40iQ3MmmdJUBZHXAa3+aLi1hDiAIoAI
 UI993t1p8De1mTyFYClAEfQTF1oH/I4c4ANewHvwFjVksI42y7AWC5cCGYHMIF63CMPbWRC/
 keTmN/0DiBYvrSQSHaMnp+Ztjra1RI9dAfuXgdaC1JeizXfiNtr1E+XFY46SPTdYuDdQFkc/
 Rjb/UDSuJ1L5SI7//3T1UzKhTuquq/IQmYdji3LXnio5x9Of4WsYYql8zDztZ6s+67AEzFtF
 FBd8ySvxLhm4aOlzURhc81RdF2d3MtpBRWH6bJZ8zbNwBz2k5KrVdg4DDiTvy6FOO5cEdPiS
 Be7VQ+8ePa/lZZlBEN6S9vZNigk8UTvPc7CS6zJcscVWKpafQap5BBTQnS7jn+4xSDAkYlnU
 XuaWditFmpfG6Vi1CCxV/ZYieZt2CEl2SXSXvgXzTz+gObYPSbID+1eah3eMYjV74vdyOnR2
 9xQH9CLzhNSTKv/eUE79KZIfApTcCJjVfgareRWT7S9OAA2B1o4DqD0weMaXrxbk7tKw7KgE
 naVARMImQWu2RUrMz6iY3R4YfbjUIhyqVoyOTcleE6y3Houaprp670QH7MsYLMi9fBLx+N7V
 L8Jds+BC/IJTS7IkwnxdrHjrZd+MQaqgBqUODq0JWBmOYBhXBCP+8SMkhbTGDcmFA2q6dYiv
 uaa5CjSSLQbdjlFNu2Hd6f6p7+uhkQ1lOV3VkrOB9BcfkTw7YRnQxAdaNdqe6ngzj2enlOnO
 xaqPPsOmQXai64OmOQlaIiarpy1Vvl/G1JAGHnKqO7vczfb5XblwJQovAe0kdL1CjmcFEaKP
 LQ9IxTA3BsvxgYiX21USO8D8E7Gz4Gzz4K2Nyw9dJkxU3ylC6l7Pl6N1tRVu6tGy9dx4FTqA
 h3RpYQFae3SYKsJ9WL9wiJ4N4xvMtlJw1HvAQgdehqqjMOK1OPbChsLYXFgdgQMcOUuWG/a/
 QvRkJVKu13g20ZC3ieuiyFQ/iyMIBQ9v1YP6/kn7HvQolNzkDlqOMWAYgeou8vnQ4sXbSEXz
 sq83/Gqa0J0nRGaKyJb+Lmk9bY1uKniTzgUlQNTeQXRy4Wtaz1e9EQ5zAnbhz99ln1vu9+f8
 EAxX6GpDc1iJwtVufU=
IronPort-HdrOrdr: A9a23:61v5A6MptgfdTcBcTsqjsMiBIKoaSvp037Dk7TESdfVwSL3gqy
 nOpoV86faaslcssR0b+exoW5PwJk80l6QFhbX5VI3KNGKN1QfGQr2KhrGSpgEIdReOldK1rZ
 0QC5RDNA==
X-Talos-CUID: =?us-ascii?q?9a23=3AQuPGGmpWJem68/lr7XUC80PmUdoCbyHA0GqLGX2?=
 =?us-ascii?q?TAG9HUIyobmW7qbwxxg=3D=3D?=
X-Talos-MUID: 9a23:kT/CdgTor0ytYfcARXTtvWtcLs04/J+3DR8okcU9nvm6OTNvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,325,1732579200";
   d="1'?diff'?bugs'?scan'208";a="39215208"
Received: from vist-zimproxy-01.vist.is ([194.105.232.87])
  by smtp-out-03.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2025 16:07:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id 403AF41CE054;
	Sat,  1 Mar 2025 16:07:48 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id brefOpBkW9wP; Sat,  1 Mar 2025 16:07:47 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id 3AF6241CE055;
	Sat,  1 Mar 2025 16:07:47 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 16E4sbs59pMt; Sat,  1 Mar 2025 16:07:47 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTPS id 1113A41CE054;
	Sat,  1 Mar 2025 16:07:46 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1toPNS-0000000021T-3UDj;
	Sat, 01 Mar 2025 16:07:46 +0000
Date: Sat, 1 Mar 2025 16:07:46 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Cc: Debian Bug Tracking System <submit@bugs.debian.org>
Subject: amixer.1: Some remarks and a patch with editorial changes for this
 man page
Message-ID: 
 <174084508860.7708.12299328035330936393.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="KDdH5gMfg91zSpLK"
Content-Disposition: inline
X-Mailer: reportbug 13.1.0
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BTFG2NBE6EE5MGEN432ZX3ZWB3ONJGDV
X-Message-ID-Hash: BTFG2NBE6EE5MGEN432ZX3ZWB3ONJGDV
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:36:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTFG2NBE6EE5MGEN432ZX3ZWB3ONJGDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KDdH5gMfg91zSpLK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Package: alsa-utils
Version: 1.2.13-1
Severity: minor
Tags: patch

   * What led up to the situation?

     Checking for defects with a new version

test-[g|n]roff -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z < "man page"

  [Use "groff -e ' $' -e '\\~$' <file>" to find obvious trailing spaces.]

  ["test-groff" is a script in the repository for "groff"; is not shipped]
(local copy and "troff" slightly changed by me).

  [The fate of "test-nroff" was decided in groff bug #55941.]

   * What was the outcome of this action?


an.tmac:<stdin>:1: style: .TH missing fourth argument; consider package/project name and version (e.g., "groff 1.23.0")
troff:<stdin>:124: warning: trailing space in the line
troff:<stdin>:133: warning: trailing space in the line
troff:<stdin>:138: warning: trailing space in the line


   * What outcome did you expect instead?

     No output (no warnings).

-.-

  General remarks and further material, if a diff-file exist, are in the
attachments.


-- System Information:
Debian Release: trixie/sid
  APT prefers testing
  APT policy: (500, 'testing')
Architecture: amd64 (x86_64)

Kernel: Linux 6.12.12-amd64 (SMP w/2 CPU threads; PREEMPT)
Locale: LANG=is_IS.iso88591, LC_CTYPE=is_IS.iso88591 (charmap=ISO-8859-1), LANGUAGE not set
Shell: /bin/sh linked to /usr/bin/dash
Init: sysvinit (via /sbin/init)

Versions of packages alsa-utils depends on:
ii  kmod              33+20240816-2
ii  libasound2t64     1.2.13-1+b1
ii  libatopology2t64  1.2.13-1+b1
ii  libc6             2.40-7
ii  libfftw3-single3  3.3.10-2+b1
ii  libncursesw6      6.5+20250216-1
ii  libsamplerate0    0.2.2-4+b2
ii  libtinfo6         6.5+20250216-1

alsa-utils recommends no packages.

Versions of packages alsa-utils suggests:
pn  dialog  <none>

-- no debconf information

--KDdH5gMfg91zSpLK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.amixer.1"

Input file is amixer.1

Output from "mandoc -T lint  amixer.1": (shortened list)

      1 input text line longer than 80 bytes: This document is by ...
      4 whitespace at end of input line

Remove trailing space with: sed -e 's/  *$//'

-.-.

Output from "test-groff -mandoc -t -ww -z amixer.1": (shortened list)

      4 trailing space in the line

Remove trailing space with: sed -e 's/  *$//'

-.-.

Remove space characters (whitespace) at the end of lines.
Use "git apply ... --whitespace=fix" to fix extra space issues, or use
global configuration "core.whitespace".

Number of lines affected is

4

-.-.

Wrong distance between sentences in the input file.

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

12:for the default soundcard and device. This is a good way to see a list
35:Sets the simple mixer control contents. The parameter can be the volume
54:A simple mixer control must be specified. Only one device can be controlled
61:A simple mixer control must be specified. Only one device can be controlled
74:Sets the card control contents. The identifier has these components: iface,
75:name, index, device, subdevice, numid. The next argument specifies the value
80:Shows the card control contents. The identifier has same syntax as for
98:Select the card number to control. The device name created from this
104:Select the device name to control. The default control name is 'default'.
112:Only sset and cset are accepted.  Other commands are ignored.
121:Quiet mode. Do not show results of changes.
143:will set the master volume of the second card to \-20dB.  If the master
148:will increase the PCM volume of the second card with 2dB.  When both

-.-.

Split lines longer than 80 characters into two or more lines.
Appropriate break points are the end of a sentence and a subordinate
clause; after punctuation marks.
Add "\:" to split the string for the output, "\<newline>" in the source.  

Line 169, length 91

This document is by Paul Winkler <zarmzarm@erols.com> and Jaroslav Kysela <perex@perex.cz>.

-.-.

The name of a man page is typeset in bold and the section in roman
(see man-pages(7)).

161:alsamixer(1)

-.-.

Use the name of units in text; use symbols in tables and
calculations.
The rule is to have a (no-break, \~) space between a number and
its units (see "www.bipm.org/en/publications/si-brochure")

37:a dB gain with \fIdB\fP suffix (like \-12.5dB), or an exact hardware value.
148:will increase the PCM volume of the second card with 2dB.  When both

-.-.

Put a parenthetical sentence, phrase on a separate line,
if not part of a code.
See man-pages(7), item "semantic newline".

amixer.1:37:a dB gain with \fIdB\fP suffix (like \-12.5dB), or an exact hardware value.

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z ":

an.tmac:<stdin>:1: style: .TH missing fourth argument; consider package/project name and version (e.g., "groff 1.23.0")
troff:<stdin>:116: warning: trailing space in the line
troff:<stdin>:124: warning: trailing space in the line
troff:<stdin>:129: warning: trailing space in the line
troff:<stdin>:162: warning: trailing space in the line

-.-.

Generally:

Split (sometimes) lines after a punctuation mark; before a conjunction.

--KDdH5gMfg91zSpLK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="amixer.1.diff"

--- amixer.1	2025-03-01 15:39:10.554803625 +0000
+++ amixer.1.new	2025-03-01 16:00:13.654895906 +0000
@@ -9,7 +9,8 @@ soundcard driver.
 \fBamixer\fP supports multiple soundcards.
 
 \fBamixer\fR with no arguments will display the current mixer settings
-for the default soundcard and device. This is a good way to see a list
+for the default soundcard and device.
+This is a good way to see a list
 of the simple mixer controls you can use.
 
 .SH COMMANDS
@@ -32,34 +33,45 @@ Shows a complete list of simple mixer co
 
 .TP
 \fIset\fP or \fIsset\fP <\fISCONTROL\fP> <\fIPARAMETER\fP> ...
-Sets the simple mixer control contents. The parameter can be the volume
+Sets the simple mixer control contents.
+The parameter can be the volume
 either as a percentage from 0% to 100% with \fI%\fP suffix,
-a dB gain with \fIdB\fP suffix (like \-12.5dB), or an exact hardware value.
+a dB gain with \fIdB\fP suffix
+(like \-12.5\~dB),
+or an exact hardware value.
 The dB gain can be used only for the mixer elements with available
 dB information.
 When plus(+) or minus(\-) letter is appended after
 volume value, the volume is incremented or decremented from the current
 value, respectively.
 
-The parameters \fIcap, nocap, mute, unmute, toggle\fP are used to
+The parameters
+.BR cap ", " nocap ", " mute ", " unmute ", " toggle
+are used to
 change capture (recording) and muting for the group specified.
 
 The optional modifiers can be put as extra parameters before the value to
 specify the stream direction or channels to apply.
-The modifiers \fIplayback\fP and \fIcapture\fP specify the stream,
-and the modifiers \fIfront, frontleft, frontright, frontcenter, center,
-rear, rearright, rearleft, woofer\fP are used to specify channels to be
+The modifiers
+.B playback
+and
+.B capture
+specify the stream,
+and the modifiers
+.BR front ", " frontleft ", " frontright ", " frontcenter ", " center ", " \
+rear ", " rearright ", " rearleft ", " woofer
+are used to specify channels to be
 changed.
 
-A simple mixer control must be specified. Only one device can be controlled
-at a time.
+A simple mixer control must be specified.
+Only one device can be controlled at a time.
 
 .TP
 \fIget\fP or \fIsget\fP <\fISCONTROL\fP>
 Shows the simple mixer control contents.
 
-A simple mixer control must be specified. Only one device can be controlled
-at a time.
+A simple mixer control must be specified.
+Only one device can be controlled at a time.
 
 .TP
 \fIcontrols\fP
@@ -71,14 +83,15 @@ Shows a complete list of card controls w
 
 .TP
 \fIcset\fP <\fICONTROL\fP> <\fIPARAMETER\fP> ...
-Sets the card control contents. The identifier has these components: iface,
-name, index, device, subdevice, numid. The next argument specifies the value
-of control.
+Sets the card control contents.
+The identifier has these components:
+iface, name, index, device, subdevice, numid.
+The next argument specifies the value of control.
 
 .TP
 \fIcget\fP <\fICONTROL\fP>
-Shows the card control contents. The identifier has same syntax as for
-the \fIcset\fP command.
+Shows the card control contents.
+The identifier has same syntax as for the \fIcset\fP command.
 
 .SH ADVANCED COMMANDS
 
@@ -95,13 +108,15 @@ Shows the events for the mixer controls.
 .TP
 \fI\-c\fP card
 
-Select the card number to control. The device name created from this
-parameter has syntax 'hw:N' where N is specified card number.
+Select the card number to control.
+The device name created from this parameter has syntax 'hw:N'
+where N is specified card number.
 
 .TP
 \fI\-D\fP device
 
-Select the device name to control. The default control name is 'default'.
+Select the device name to control.
+The default control name is 'default'.
 
 .TP
 \fI\-s\fP | \fI\-\-stdin\fP
@@ -109,24 +124,26 @@ Select the device name to control. The d
 Read from stdin and execute the command on each line sequentially.
 When this option is given, the command in command\-line arguments is ignored.
 
-Only sset and cset are accepted.  Other commands are ignored.
+Only sset and cset are accepted.
+Other commands are ignored.
 The commands to unmatched ids are ignored without errors too.
 
 .TP
-\fI\-h\fP 
+\fI\-h\fP
 Help: show syntax.
 
 .TP
 \fI\-q\fP
-Quiet mode. Do not show results of changes.
+Quiet mode.
+Do not show results of changes.
 
 .TP
-\fI\-R\fP 
+\fI\-R\fP
 Use the raw value for evaluating the percentage representation.
 This is the default mode.
 
 .TP
-\fI\-M\fP 
+\fI\-M\fP
 Use the mapped volume for evaluating the percentage representation
 like \fBalsamixer\fR, to be more natural for human ear.
 
@@ -140,13 +157,15 @@ capture (recording).\fR
 
 .TP
 \fBamixer \-c 1 \-\- sset Master playback \-20dB\fR
-will set the master volume of the second card to \-20dB.  If the master
-has multiple channels, all channels are set to the same value.
+will set the master volume of the second card to \-20dB.
+If the master has multiple channels,
+all channels are set to the same value.
 
 .TP
 \fBamixer \-c 1 set PCM 2dB+\fR
-will increase the PCM volume of the second card with 2dB.  When both
-playback and capture volumes exist, this is applied to both volumes.
+will increase the PCM volume of the second card with 2\~dB.
+When both playback and capture volumes exist,
+this is applied to both volumes.
 
 .TP
 \fBamixer \-c 2 cset iface=MIXER,name='Line Playback Volume",index=1 40%\fR
@@ -157,13 +176,12 @@ will set the third soundcard's second li
 will set the 34th soundcard element to 40%
 
 .SH SEE ALSO
-\fB
-alsamixer(1)
-\fP
+.BR alsamixer (1)
 
-.SH BUGS 
+.SH BUGS
 None known.
 
 .SH AUTHOR
 \fBamixer\fP is by Jaroslav Kysela <perex@perex.cz>.
-This document is by Paul Winkler <zarmzarm@erols.com> and Jaroslav Kysela <perex@perex.cz>.
+This document is by Paul Winkler <zarmzarm@erols.com>
+and Jaroslav Kysela <perex@perex.cz>.

--KDdH5gMfg91zSpLK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="general.bugs"

  Any program (person), that produces man pages, should check the output
for defects by using (both groff and nroff)

[gn]roff -mandoc -t -ww -b -z -K utf8 <man page>

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

  The option \"-warnings=w\"

  The environmental variable:

export MAN_KEEP_STDERR=yes (or any non-empty value)

  or

  (produce only warnings):

export MANROFFOPT=\"-ww -b -z\"

export MAN_KEEP_STDERR=yes (or any non-empty value)

-.-

--KDdH5gMfg91zSpLK--
