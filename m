Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B18A4FA00
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:28:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C632E6033C;
	Wed,  5 Mar 2025 10:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C632E6033C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741166915;
	bh=OFBXomb1N0/pjuPBYIcIITUCnd3aFX/uyKN32TW2NOA=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HQPB+0vuHWZ5ndHLfAwMrtPJfgX5bs8HA5L5uwG/97zQtrbOh3HPlngzyHegJGuRe
	 um9g7pkMMUeGFEsCCauKSek57RiSJNCc+jT97RdIpjGxJZUcvfyIaB1WTa7Ki36Uf2
	 cMPROQYfwmZxLHESSn1ZR+nIRjLoM3RRbDc/tjA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33C61F8001D; Wed,  5 Mar 2025 10:28:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A01D3F80544;
	Wed,  5 Mar 2025 10:28:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9D92F80424; Fri, 21 Feb 2025 22:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1-04.simnet.is (smtp-out1-04.simnet.is
 [194.105.232.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 696C1F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2025 22:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 696C1F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=MiPj5pRS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1740173471; x=1771709471;
  h=date:from:to:subject:message-id:mime-version;
  bh=PRuDhAq0eSet6tmKEh8i3UCqzEPAqbU3iEEdMUc5bPc=;
  b=MiPj5pRSv9ctR78Ov1NNFRJlPJTWtXkpdvVo4Isuz7SAVvaTD5TIxWgb
   FnoS+62vOilcCc0Nm9EGHA919IMzn1Vp4YwJCEMwoP9bR/tMBn9S1e/qw
   YpIMbz1PK4igpjTJR705g64I616BWfpuL4EMOKtrJM/+rKKJtvK8cRGCm
   kLFOA5U8cdBe8MZ1S+rFgAORDwFzjIOSWlwSxR3H1upD3gt24gHmIYMf9
   msGADYCbpmS2FbxRvhrycjBxWnkp97PEzlE5DA34a4xe/gMcbIdJrq++9
   cPvseEq9NdYnBqfnlDaoFo33XiadzA73fy3BR6rHAdtfKUcJXk9kwRKzV
   w==;
X-CSE-ConnectionGUID: uY2+uOtcQ4Cr7hHN8Emcig==
X-CSE-MsgGUID: c92p5o6nRPyhsyxeQu8n4Q==
Authentication-Results: smtp-out-04.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2FlCQAW67hnhVjoacJaHAECAgEHARQBBAQBQYFCBAEMA?=
 =?us-ascii?q?YJDfYFkiCWOIYEWnkFGBwEBAQ81DwQBAQMBA4FQgzCLEig3Bg4BAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEGAQEBAQEBBgcCEAEBAQFADjuFNQwGNA2DaR5lC?=
 =?us-ascii?q?TYBAQEBJwINgip8gykBgmSvMYE0gQGDHNsYgV4QgUgBhWuCYwGFa4R3PAaCD?=
 =?us-ascii?q?YEVMgOBc0oHb4QrRIYYBIIYF4FAggKBaoclg3eLOiCQHEiBIQNZLAFVEw0KC?=
 =?us-ascii?q?wcFgXEDNQwLLhUygRRDNzeCDmlJOgINAjWCHnyCK4JbgXuEQ4RHhVSCEYs3g?=
 =?us-ascii?q?xYdNgoDCxgNSBEsNxQbRG4HoAE9gzcJcgEBMF0BgQNAAzAGDx0BlBIOj0qBR?=
 =?us-ascii?q?KAigT6EJYZcgzGCC5VKMyKDYZNBDDqSS5h9o20NGTeEZoF9ggAsBxoIMDuCZ?=
 =?us-ascii?q?wlJGQ+KC4N8JhaINTbDF3g8AgcLAQEDCZF5AQE?=
IronPort-PHdr: A9a23:cxchgx0nktePHMMasmDPhFBlVkEcU9TcJQsJ8t8glq4LKvjl5JXnO
 kHDo/R23xfFXoTevvRDjeee86XtQncJ7pvJtnceOIdNWBkIhYRenwEpDMOfT0yuKvnsYkQH
IronPort-Data: A9a23:syC5Da64Ysw7P8XbIU3QrwxRtIrAchMFZxGqfqrLsTDasI4TYxWz/
 BJMATLpZ67UfDe3OccnNM7n6BNY78nLxubXe3JkrXs0RC1H8ZPIDovDIh6oZn6YIJ3IHB1ss
 8lGNIKdfck6QCCC9k30PrS/83At3q+EF+rwU7DKZXsvGlQ5FHl44f4Pd5bVp6Yx6TTuK1nQ5
 IqaT7TjEEC6xHh9NnkdrrqZrxFit+i0vykX1mDSHsunymIy7VFNSs13GJyME5eRrvG4dMazQ
 /3KibC/8GSfr1EhC92r+lqQWhEDHeOJNATUg3ALCvKo3EUS/Xc7gvdmOqZCMBsIgjzZkoF8w
 txA7ZXhQF95YfGck71DD0UIGix0Y6MYqeKbLCnXXaB/t6HjWyKEL6JGVR1qYOX0g9pfHn5Rs
 /UcMzlIdgqEhe+93PS8UOYEuihYFyWdAW9lkikmklnkMMsarfkvO0mgzdBV2joqj8QIF+vRf
 KL1AhI0MEvKak0UMVpHBZ4zlbn2jyTxLTdS+ArE9adm7jTdllN7j+jmPoWMI4PQH5oIwB6U+
 zPI8juoXBxGbIDOxzHdmp7AapcjuAuiMG5FPOTprKQCbCSv+1Eu5D0quXqTq/Xh0h+1VtgEc
 BYf8XIn/fVpqkelEImmVBfmqy/Z4EY1VosLGYXWyinUkfOMvFzx6kvo79JlQIZ73CPjbWVyj
 jdlp/uwW3o39uXTES/BnluthWvaETAPKmMfbjMzQwIA4t3yyKk+lRunouxLScZZtfWrX2irq
 9y2hHJm3ehL15RSj//TEW3v2lpAmLCYH2bZ2S2PNo6VxlsRTJKoYYWu9W/a4Z5oRK6FTkOMt
 WQzgMOX6uYDF/mlzERhl81UQdlFT97cWNHtqQYH86sJrlxByFb/FWxk2wySEW8yWioylZAFV
 2eI0e9ZzMc70HJH9sabaarpYygh5fCI+dgIypk4xzeBC3R8XFbvwc1gWaKf933cygsxtr00A
 Muwa5msLVBKJKFszTXjEo/x0Zdzrsw/7X3SXoy+3RWiyaCZdG/QEe1DLlqVcqY498tooi2Mo
 ooZbpPXjU8ECquuMkE78qZKRbwOBXI0LYv3rspaaqiCOWKKHUl6W6SLm+95JuSJmYxex73Qo
 3bjXHVg2VrklG3KEBjabCxaPeaHsZFX9i5rbHN9YT5EwUMLaIK05eITeoU6eZEu8PdqiOZuS
 PsIcNnGBe5AIgkr4BwDbILh6Z5jcQyxghKfenL/JiY+ZIImRhehFsLYkhXH6RhUTTeQqcAH/
 5a6iQP7Z8ouQg9jA5ODAB6w9G+ZsX8YkeN0ekLHJNhPZUnhmLSGzQSs15fbxOlRcX3+Kium6
 uqAPfsPjcj2y7LZHfHXhLuY6pWoFvNkGVpLWjGBq6i3LjWc/3HLLW58vASgI2m1uIDcofTKi
 QBpIxfUa6RvcLFi6NMULlqT5fhij+YDXpcDpuieIF3Fbk6wFpRrKWSc0M9Eu8Vln+AF4VPpB
 BnVpoUCZd1l3f8J9nZMf2LJiczejJkpdsX6t6RsSKkHzHYrp+TeDy2+wTHd03wCRFeKDG/V6
 bx96J9JulDXZusCN9eCh2hU+Qyxwo8oDs0aWmUhKNaz0GIDkwgeCbSCUXWeyM/UNL1x3rwCe
 WT8aFzq3O8EnhKqnrtaPSSl4Nexcrxf5kgalwdeewvhdxisrqZf4SC9OA8fFmx9piirGcoqU
 oS3HyWZ/Zmzwgo=
IronPort-HdrOrdr: A9a23:hljvG6Gu5sY5232QpLqE/ceALOsnbusQ8zAXPmRKOHpom62j5q
 eTdZsgtCMc5AxwZJhCo6HlBEDjewK4yXcd2+B4Vt3OMGaJhILCFvAB0WKN+UyCJ8SHzJ8l6Z
 td
X-Talos-CUID: 9a23:LjEHVWHutkX+jgniqmJ6xRRXB+c5eUSB522PI2+eWUtsQ7yaHAo=
X-Talos-MUID: 9a23:9yLFawaKpb5TT+BTvG62nGxlasFS27WuE1EdnKwb68/YDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,305,1732579200";
   d="8'?diff'?bugs'?scan'208";a="38322405"
Received: from vist-zimproxy-02.vist.is ([194.105.232.88])
  by smtp-out-04.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 21:31:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id F186F444632B
	for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2025 21:31:07 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id mFmNw6fgreXt for <alsa-devel@alsa-project.org>;
 Fri, 21 Feb 2025 21:31:07 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id 0636044464B0
	for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2025 21:31:07 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id yOF6tjSMtkgl for <alsa-devel@alsa-project.org>;
 Fri, 21 Feb 2025 21:31:06 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTPS id E1039444632B
	for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2025 21:31:06 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1tlaby-0000000017p-1H3R
	for alsa-devel@alsa-project.org;
	Fri, 21 Feb 2025 21:31:06 +0000
Date: Fri, 21 Feb 2025 21:31:06 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: alsa-info.8: Some remarks and a patch with editorial changes for
 this man page
Message-ID: <174017330409.4248.2998280625258055409.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="77osvO/tr4EO5orA"
Content-Disposition: inline
X-Mailer: reportbug 13.0.3
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WVBHUQTWZ5EXH7W7OVSYGLK5TFSGEHER
X-Message-ID-Hash: WVBHUQTWZ5EXH7W7OVSYGLK5TFSGEHER
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:27:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVBHUQTWZ5EXH7W7OVSYGLK5TFSGEHER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--77osvO/tr4EO5orA
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
troff:<stdin>:59: warning: trailing space in the line

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
ii  libc6             2.40-6
ii  libfftw3-single3  3.3.10-2+b1
ii  libncursesw6      6.5+20250125-2
ii  libsamplerate0    0.2.2-4+b2
ii  libtinfo6         6.5+20250125-2

alsa-utils recommends no packages.

Versions of packages alsa-utils suggests:
pn  dialog  <none>

-- no debconf information

--77osvO/tr4EO5orA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.alsa-info.8"

Input file is alsa-info.8

Output from "mandoc -T lint  alsa-info.8": (shortened list)


-.-.

Output from "test-groff -mandoc -t -ww -z alsa-info.8": (shortened list)

      1 trailing space in the line

Remove trailing space with: sed -e 's/  *$//'

-.-.

Change a HYPHEN-MINUS (code 0x2D) to a minus(-dash) (\-),
if it
is in front of a name for an option,
is a symbol for standard input,
is a single character used to indicate an option,
or is in the NAME section (man-pages(7)).
N.B. - (0x2D), processed as a UTF-8 file, is changed to a hyphen
(0x2010, groff \[u2010] or \[hy]) in the output.

31:Includes output from \fIaplay -l\fP.

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

  Lines with only one (or two) space(s) between sentences are split,
so latter sentences begin on a new line.

10:about the ALSA subsystem. It is used mostly for debugging purposes.

-.-.

The name of a man page is typeset in bold and the section in roman
(see man-pages(7)).

56:aplay(1)
57:amixer(1)
58:alsactl(1)

-.-.

Put a parenthetical sentence, phrase on a separate line,
if not part of a code.
See man-pages(7), item "semantic newline".

alsa-info.8:15:Upload contents to the server (www.alsa-project.org or pastebin.ca).

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=10 -ww -z ":

an.tmac:<stdin>:1: style: .TH missing fourth argument; consider package/project name and version (e.g., "groff 1.23.0")
troff:<stdin>:59: warning: trailing space in the line

-.-

Additionally:

Move a period (end of sentence) to the last string in the sentence.

-.-

Generally:

Split (sometimes) lines after a punctuation mark; before a conjunction.

--77osvO/tr4EO5orA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="alsa-info.8.diff"

--- alsa-info.8	2025-02-21 21:08:20.656049605 +0000
+++ alsa-info.8.new	2025-02-21 21:21:03.879165232 +0000
@@ -7,12 +7,14 @@ the ALSA subsystem
 
 .SH DESCRIPTION
 \fBalsa-info\fP is a command\-line utility gathering information
-about the ALSA subsystem. It is used mostly for debugging purposes.
+about the ALSA subsystem.
+It is used mostly for debugging purposes.
 
 .SH OPTIONS
 .TP
 \fI\-\-upload\fP
-Upload contents to the server (www.alsa-project.org or pastebin.ca).
+Upload contents to the server
+(www.alsa-project.org or pastebin.ca).
 .TP
 \fI\-\-no-upload\fP
 Do not upload contents to the remote server.
@@ -24,11 +26,11 @@ Print information to standard output.
 Specify file for output in no-upload mode.
 .TP
 \fI\-\-debug\fP
-Run utility as normal, but will not delete file (usually
-/tmp/alsa-info.txt).
+Run utility as normal, but will not delete file
+(usually /tmp/alsa-info.txt).
 .TP
 \fI\-\-with-aplay\fP
-Includes output from \fIaplay -l\fP.
+Includes output from \fIaplay \-l\fP.
 .TP
 \fI\-\-with-amixer\fP
 Includes output from \fIamixer\fP.
@@ -52,11 +54,10 @@ Print information about authors.
 Will gather all information and show the output file.
 
 .SH SEE ALSO
-\fB
-aplay(1)
-amixer(1)
-alsactl(1)
-\fP
+.BR \
+aplay "(1), " \
+amixer "(1), " \
+alsactl (1)
 
 .SH AUTHOR
-\fBalsa-info\fP was created by the ALSA team, see \fI\-\-about\fP .
+\fBalsa-info\fP was created by the ALSA team, see \fI\-\-about\fP.

--77osvO/tr4EO5orA
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

--77osvO/tr4EO5orA--
