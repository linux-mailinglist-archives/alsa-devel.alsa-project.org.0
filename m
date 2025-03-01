Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1CA4FA52
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:38:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACEF96039F;
	Wed,  5 Mar 2025 10:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACEF96039F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167510;
	bh=EQUVc7K4+rsYCxbvA9Pbncis5xjKkoQjPxZxnM4pPz8=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e/oWkvUmuLyHkaOW75LxV9qM8ng8nQukwxHspVN8daK45GWCvAyznOjSeV9jTawUZ
	 kf2SEyssoxcoOKtH10CvMl/ZBd7QCgrXbVUL68o5+Ew9Sp/sXjuSol2Dpj6csi/njo
	 kAcw2rHtKGVMdvXVeRC4L9cqX9VamG/CChvHlqck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FE4CF806CB; Wed,  5 Mar 2025 10:36:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73BB7F806CB;
	Wed,  5 Mar 2025 10:36:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8F3CF8014B; Sat,  1 Mar 2025 15:17:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1-06.simnet.is (smtp-out1-06.simnet.is
 [194.105.231.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16B42F800C1
	for <alsa-devel@alsa-project.org>; Sat,  1 Mar 2025 15:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B42F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=G58kVKVx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1740838664; x=1772374664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37dzZNPzQAwgDOnXF1fA9Qee478rdxyjO+3WvKFWuPw=;
  b=G58kVKVxy/REEuhrJsBLohg3sRMIwaOuLMvxOmIoToTobwVTlVp0J7or
   jRRVizektYgaXerAdkDRzWhOeKy1V8eYndiDFniCCieoWrlDSryawhRX8
   cg5S82j5z7cYuTNu6S+I/1lKLyexWwsVr/Pns+VPisr/FWSTPFEGEdhGo
   ZDbmcEQqZjHu19XYKMKZcuS/RJD4aamCXpZ9MHuttrqOyD0REFVe1T2Y1
   MPF27/6RU9nHWLoPsRvuxP3unkTL+9BrXwQvy2xITC3t29Gp99SwqtGoH
   1IopgJJQ9Mzdzs33mzT/DpIqnooTVdkDXojbW94JsaoniyNwCFh43ZEr+
   A==;
X-CSE-ConnectionGUID: c/+33RWCRMiivedtHyT8vg==
X-CSE-MsgGUID: 5jK7yGkAQ/m3OzDRKvERKw==
Authentication-Results: smtp-out-06.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2EEAABLFMNnhVfoacJaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIFABAEBAQELAYJDfYFkBIghjiGRSoxNggYHAQEBDzsJBAEBA?=
 =?us-ascii?q?wEDggyCdIsXKDUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQYBAQEBAQEGB?=
 =?us-ascii?q?wIQAQEBAUAOO4U1Rg2DFoFlAQEBAQEBAQEBAQEBAQEiASoCAoIILXwngwIBg?=
 =?us-ascii?q?mQUBq86gTSBAYMc2xiBXhCBSAGFa4JjAYVrhHc8BoINgRUyA4FzUW+CFE0DA?=
 =?us-ascii?q?RiBcoYYBIIYF4E7ggKBaoZRVIYygQ6GMoE9IBKIVokNSIEhA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBcQM1DAsuFTKBFEM3N4IOaUk6Ag0CNYIefIIrgluBeYRDhECFUoIRizeEd?=
 =?us-ascii?q?R02CgMLGA1IESw3FBtEbgehAQE8g0UJAS42BwcBMAxRASkBIzYtEwMwBg8dA?=
 =?us-ascii?q?UE4klZEj1mBRKAkgT6EJYZcgzGCC5VKMyKDYYFXkWsMOpJLmH2CWIstlRlEC?=
 =?us-ascii?q?w0ZN4RngWgBghQsBxoIMDuCZwlJGQ+OByMDFog1w0B4AgE5AgcLAQEDCZFnA?=
 =?us-ascii?q?QE?=
IronPort-PHdr: A9a23:bC5aQRB5iCM+J/0Ma97iUyQVQxdPi9zP1m898Z87k/dJb7jmp8qkJ
 03a4/hxyl7SDs3X6PNB3uzRta2oGWkN+o2Iv31KdptQHwQEhsMbk01oAMOMBUDhav+/aSs8E
 ax/
IronPort-Data: A9a23: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
 a/4qtHFXEzakMn1IBtx6uSeYjV/4K5BvNQN
IronPort-HdrOrdr: A9a23:IX1Ok612/aqNsYRrebBy8wqjBSZyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4OxpOMG7MBDhHO1OkPEs1NaZLUDbUQ6TQL2KgrGSpAEIdxeeygc/79
 YpT0EdMqyXMbESt6+Tj2eF+r0bsbu6GdWT9IPjJgBWPGRXgs9bjztRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayAqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYD39vac7R6e031loqqu9jJxPr3MtiHTEESttu+cXvUvZ1RFhkF3nAjg0idprD
 CGmWZaAy060QKqQojym2qn5+Co6kdS11byjVCfmnftusr/WXYzDNdAn5tQdl/D51Mnp8wU6t
 M+44s3jesnMfrsplWO2zHzbWAeqmOk5X451eIDhX1WVoUTLLdXsIwE5UtQVJMNBjjz5owrGP
 RnSJi03ochTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2n0A6JU+QZ9Z4P
 msCNUeqJheCssNKa5tDuYIRsW6TmTLXBLXKWqXZU/qEakWUki92KIfII9FlN1CVKZ4sqfawq
 6xLG+wnVRCBH7TNQ==
X-Talos-CUID: 9a23:TA/oHG7UnLqiWR5Pqdss/wlXQZsfTVbn6XbRPUK0FUZ4dO2LRgrF
X-Talos-MUID: 9a23:IBUFzAapIBdjSOBT6j3P2yBNN+5RpKH1L1Ihq7YYlvOnKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,325,1732579200";
   d="1'?diff'?bugs'?scan'208";a="39179088"
Received: from vist-zimproxy-01.vist.is ([194.105.232.87])
  by smtp-out-06.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2025 14:17:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id A97DC41CE049;
	Sat,  1 Mar 2025 14:17:40 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id rQfMRG5_pY0j; Sat,  1 Mar 2025 14:17:39 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id D63DF41CE053;
	Sat,  1 Mar 2025 14:17:39 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 0WV6zeJDzil7; Sat,  1 Mar 2025 14:17:39 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTPS id AC3B441CE049;
	Sat,  1 Mar 2025 14:17:39 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1toNet-000000001Mq-0x2V;
	Sat, 01 Mar 2025 14:17:39 +0000
Date: Sat, 1 Mar 2025 14:17:39 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Cc: Debian Bug Tracking System <submit@bugs.debian.org>
Subject: alsatplg.1: Some remarks and a patch with editorial changes for this
 man page
Message-ID: 
 <174083815761.5182.13884024406662045415.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="kTjiL/ygvFL6XyT6"
Content-Disposition: inline
X-Mailer: reportbug 13.1.0
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HHNY552MGRY54NNV2BZ7OAZU5Z3Y6456
X-Message-ID-Hash: HHNY552MGRY54NNV2BZ7OAZU5Z3Y6456
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:36:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHNY552MGRY54NNV2BZ7OAZU5Z3Y6456/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kTjiL/ygvFL6XyT6
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


an.tmac:<stdin>:30: style: .TH missing fourth argument; consider package/project name and version (e.g., "groff 1.23.0")
an.tmac:<stdin>:108: style: 1 leading space(s) on input line
troff:<stdin>:108: warning: trailing space in the line
troff:<stdin>:112: warning: trailing space in the line


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

--kTjiL/ygvFL6XyT6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.alsatplg.1"

Input file is alsatplg.1

Output from "mandoc -T lint  alsatplg.1": (shortened list)

      1 input text line longer than 80 bytes: Topology Interface: ...
      5 skipping paragraph macro: sp after SH
      2 whitespace at end of input line

Remove trailing space with: sed -e 's/  *$//'

-.-.

Output from "test-groff -mandoc -t -ww -z alsatplg.1": (shortened list)

      2 trailing space in the line

Remove trailing space with: sed -e 's/  *$//'

-.-.

Show if generated from reStructuredText

Who is actually generating this man page?  Debian or upstream?

Is the generating software out of date?

1:.\" Man page generated from reStructuredText.

-.-.

Remove space characters (whitespace) at the end of lines.
Use "git apply ... --whitespace=fix" to fix extra space issues, or use
global configuration "core.whitespace".

Number of lines affected is

2

-.-.

Remove space in the first column, if not indented.
Use ".in +<number>n" and ".in" to end it; ".nf" and ".fi" to end
it, for an extra indention.

alsatplg.1:108: <http://git.alsa\-project.org/?p=alsa\-lib.git;a=blob;f=src/topology/parser.c> 

-.-.

Strings longer than 3/4 of a standard line length (80)
Use "\:" to split the string at the end of an output line, for example a
long URL (web address)

108  <http://git.alsa\-project.org/?p=alsa\-lib.git;a=blob;f=src/topology/parser.c> 
112 Topology Interface:  <http://www.alsa\-project.org/alsa\-doc/alsa\-lib/group__topology.html> 

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

N.B.

  The number of lines affected can be too large to be in a patch.

  Lines with only one (or two) space(s) between sentences could be split,
so latter sentences begin on a new line.

Use

#!/usr/bin/sh

sed -e '/^\./n' \
-e 's/\([[:alpha:]]\)\.  */\1.\n/g' $1

to split lines after a sentence period.
Check result with the difference between the formatted outputs.
See also the attachment "general.bugs"


44:a driver to work on a different devices. The driver is also
53:from the file system. Firmware updates can be pushed without
54:having to update the drivers. The new firmware just needs

-.-.

Put a parenthetical sentence, phrase on a separate line,
if not part of a code.
See man-pages(7), item "semantic newline".

alsatplg.1:38:alsatplg (ALSA Topology compiler) is a program to compile topology
alsatplg.1:88:sort the configuration identifiers (set for normalization)
alsatplg.1:94:do not sort DAPM graph items (like in version 1.2.1\-)

-.-.

No need for '\&' to be in front of a period (.),
if there is a character in front of it.

Remove with "sed -e 's/\\&\././g'".


101:\fB/usr/share/alsa/topology\fP\&.

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z ":

an.tmac:<stdin>:30: style: .TH missing fourth argument; consider package/project name and version (e.g., "groff 1.23.0")
an.tmac:<stdin>:108: style: 1 leading space(s) on input line
troff:<stdin>:108: warning: trailing space in the line
troff:<stdin>:112: warning: trailing space in the line

-.-.

Generally:

Split (sometimes) lines after a punctuation mark; before a conjunction.

--kTjiL/ygvFL6XyT6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="alsatplg.1.diff"

--- alsatplg.1	2025-03-01 12:35:10.985000507 +0000
+++ alsatplg.1.new	2025-03-01 14:06:41.961075582 +0000
@@ -31,17 +31,20 @@ level margin: \\n[rst2man-indent\\n[rst2
 .SH NAME
 alsatplg \- ALSA Topology Compiler
 .SH SYNOPSIS
-.sp
-\fIalsatplg\fP <options> [command]
+.BI alsatplg " <options>"
+.RI [ command ]
 .SH DESCRIPTION
-.sp
-alsatplg (ALSA Topology compiler) is a program to compile topology
+alsatplg
+(ALSA Topology compiler)
+is a program to compile topology
 configuration file to the binary file for the kernel drivers.
 .sp
 Current audio drivers typically hard code topology information
-in the driver sources: This tightly couples the audio driver
+in the driver sources:
+This tightly couples the audio driver
 to the development board making it time consuming to modify
-a driver to work on a different devices. The driver is also
+a driver to work on a different devices.
+The driver is also
 tightly coupled to the DSP firmware version meaning extra care
 is needed to keep the driver and firmware version in sync.
 New firmware features also mean driver updates.
@@ -50,11 +53,12 @@ The ALSA topology project removes the ne
 porting audio drivers to different devices or different firmwares:
 Drivers have no hard coded topology data meaning a single driver
 can be used on different devices by updating the topology data
-from the file system. Firmware updates can be pushed without
-having to update the drivers. The new firmware just needs
+from the file system.
+Firmware updates can be pushed without
+having to update the drivers.
+The new firmware just needs
 to include an updated topology file describing the update.
 .SH OPTIONS
-.sp
 Available options:
 .INDENT 0.0
 .INDENT 3.5
@@ -85,34 +89,38 @@ output file
 set verbose level
 .TP
 .B \fB\-s\fP, \fB\-\-sort\fP
-sort the configuration identifiers (set for normalization)
+sort the configuration identifiers
+(set for normalization)
 .TP
 .B \fB\-x\fP, \fB\-\-nocheck\fP
 save the configuration without additional integrity check
 .TP
 .B \fB\-z\fP, \fB\-\-dapm\-nosort\fP
-do not sort DAPM graph items (like in version 1.2.1\-)
+do not sort DAPM graph items
+(like in version 1.2.1\-)
 .UNINDENT
 .UNINDENT
 .UNINDENT
 .SH FILES
-.sp
 The master topology files for each supported sound card are in
-\fB/usr/share/alsa/topology\fP\&.
-.sp
-For example, the master use case file for the \fIbroadwell\fP card is in
-\fB/usr/share/alsa/topology/broadwell/broadwell.conf\fP, this file
-describes the audio hardware for the driver.
+\fB/usr/share/alsa/topology\fP.
 .sp
-For more details on the syntax of UCM files, see the alsa\-lib source code:
- <http://git.alsa\-project.org/?p=alsa\-lib.git;a=blob;f=src/topology/parser.c> 
+For example,
+the master use case file for the \fIbroadwell\fP card is in
+\fB/usr/share/alsa/topology/broadwell/broadwell.conf\fP,
+this file describes the audio hardware for the driver.
+.sp
+For more details on the syntax of UCM files,
+see the alsa\-lib source code:
+<http://git.alsa\-project.org/?p=alsa\-lib.git;a=blob;f=src/\:topology/\:parser.c>
 .SH SEE ALSO
 .INDENT 0.0
 .IP \(bu 2
-Topology Interface:  <http://www.alsa\-project.org/alsa\-doc/alsa\-lib/group__topology.html> 
+Topology Interface:
+.br
+<http://www.alsa\-project.org/\:alsa\-doc/\:alsa\-lib/\:group__topology.html>
 .UNINDENT
 .SH BUGS
-.sp
 None known.
 .SH AUTHOR
 Jaroslav Kysela <perex@perex.cz>

--kTjiL/ygvFL6XyT6
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

--kTjiL/ygvFL6XyT6--
