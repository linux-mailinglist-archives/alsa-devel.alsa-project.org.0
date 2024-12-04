Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273D9E9B80
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 17:23:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAC8285D;
	Mon,  9 Dec 2024 17:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAC8285D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733761437;
	bh=FJMolZnZxcrs9i8wGvoxsKWxJj3yN+mFPWlLh83YONQ=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eqWbjGnHrLWgmUyuQJ+qBRBYNtE7RubPCdSnhSgu37987/GLVXX1q77YKJUeXpFdu
	 FYry7OzBbjcce3NLpFep3JlbB7Vm8BtLxVN5Bow27QvbuRLGU4h/TRzItIvV1EF5vz
	 eLW1nDdXmZghFOjz1Iewjz8R6XF/ij6+4RzifnIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BD52F805B0; Mon,  9 Dec 2024 17:23:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE07F805AF;
	Mon,  9 Dec 2024 17:23:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8392F80272; Wed,  4 Dec 2024 03:36:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1-03.simnet.is (smtp-out1-03.simnet.is
 [194.105.232.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FC78F80116
	for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2024 03:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FC78F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=dODZMSJv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1733279767; x=1764815767;
  h=date:from:to:subject:message-id:mime-version;
  bh=IPShadnOkVElHcB1ksElO4ecVUa5Eln7Jm+ytxtE+dQ=;
  b=dODZMSJvHmUfMLCE0J5UaYOUHEi7OQbk71bKN2fByQoPWsecTc7LcUyE
   qIzB7WP9hTURGMn7IYoZIRz2GCvCOy5jASKJuRurUBTgzCpiJq4HsqCT1
   AjhcQ32PCxEWWJux4fXSLw4G+Q+Vu1Z0jKkUxHgdBFGJszuoipnlq7Bad
   A2FlPc2jKXtMVLPwPJi0ejAQ4q5RLMXiGKVGiJe0g9Qj6YpBuxVSEx8GG
   mBKXStriEV/JJcQdymtFSTgsnjffJG8DL52CZ3wcKOBtivIzvWs8QmSKO
   Fw2lmtiKPp8E+t4aSsL+eo7lnGrNKVW8jXemQpX6gvflemJx3vB9RLIaU
   g==;
X-CSE-ConnectionGUID: bR+WJlGLRy6rsnWQn62VOw==
X-CSE-MsgGUID: nNZ5nx8oTZC+ivFaY/whww==
Authentication-Results: smtp-out-03.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2EXAABGuk9nhVjoacJaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?T8HAQELAYIbKH2BZIglhE6JUYEWkDeMTRSBcgcBAQEPNQ8EAQEDAQOBawEgg?=
 =?us-ascii?q?nSKayg0CQ4BAgQBAQEBAwIDAQEBAQEBAQEOAQEGAQEBAQEBBgcCEAEBAQFAD?=
 =?us-ascii?q?juFNQwBAQQCMg2DFoIWLAKBKQEMfyNZHgmCKVgBgmSxQYEBM4EBgxzbF4FdE?=
 =?us-ascii?q?IFIAYVpgmIBhWmEdzwGgg2BFAEyA4EGbUoHb4QFASVEhhgEgiMceYFwDIILE?=
 =?us-ascii?q?iV3gSOBDYFfgg+Ba4dEVoZmgQ+MMEiBIQNZIREBVRMNCgsHBYF3A4JNeiuBC?=
 =?us-ascii?q?4EXOoF+gRNKg0qBQkY9N4ITaU06Ag0CNoIkfYJNgxiBf4RphFuGLIEgHTYKA?=
 =?us-ascii?q?wsYDUgRLDcUG0RuB6ELAUaCUwk/LQYBAQ0fBAwWBR0ZARsZGQ0eCyMKEwMYG?=
 =?us-ascii?q?AIEBAsIEAYGAQgkDA0eBwuSPRQRAQEHKgmPSIFEoB+BPoQkhlyDMIILlUczI?=
 =?us-ascii?q?oNijQWGOgw6kkiScoYJglegUgcpBA8JGTeEZoFnghYsBxoIMDuCZwlJGQ+EU?=
 =?us-ascii?q?IdZCIFWIwMWgQwBAocnu3h4PAIHCwEBAwmGS4ofK4FUAQE?=
IronPort-PHdr: A9a23:+7TUtRIdfWz7v8pvk9mcuUoyDhhOgF2VFhUQ9oJijK9SN/z4uY/jO
 UrS+bNslwyBUYba7qdCjOzb++DlVHcb6JmM+HYFbNRXVhADhMlX1wwtCcKIEwv6efjtaSFSI
 Q==
IronPort-Data: A9a23:UVkfiqvi5ZACxqr4hjuDBuf64ufnVLVeMUV32f8akzHdYApBs4E2e
 kKraxnVYqTlPzOrZYw0KpPnvRxT+4uRjIc9C1Q57zc0J54hgZCVWInCfh+uMynNcpXOE0xrt
 JsSMYWadsw5Fi6N+k6gYuC98iMii6jYGLbwBOLPZX54SFFuFn19g0M4w7Bn3d4AbbRVe++ok
 YqaT5r3YQ/6gGcc3hso1p+/RHqDxBiYkDoIsFEkIOxRtVnFmXQPSstZKaC/IRMUKaELEOWwH
 bjKxenipmnS9BsnU9r0yOmlKBZVE+aPYwSF1SsOUfb8jBId+CU8jP01OqtDORwPgjjQwtssw
 thBv8C8IetF0tUgvcxEO/UPO3gkZPEZkFO+HUWCjCCz86HnW3C0yqoxUx1rM9IRqrwnCmwf/
 6UVc28DNkrfiu7ny7+3Y+Q93c5LwOvDZdhG4i46pd364VfKZbiZHs0mMPcBhG9YavhmRKuYP
 4xBL2M3MHwsWjUXUn8PEpUygey0sXf2djxcuTq9qLE+i4Tp5FUZPIPFbpyMILRmee0PxhzE/
 ziepDylav0nHIX3JQStoyPEatDnxUsXaKpKfJWk+/hjhkGkx2B7IHX6gnPi/JFVImbnMz5uA
 xR8FhgG9MDex2T3JjXJZCBUlVbf1vIqt3W8JMVhgO2F4vK8Dw90nQHoRBYZADAtnJdeqTDHS
 jZlNj4mbNBimOT9dJ6TylubhTmIehc3KUAmXz5aVxAD3ODl/tsNqQ2aG76PEIbt5jH0MS/x2
 CzPvik7n68Und9Oj//941Hcn3StvfAlTCZst1mRBzr4qFkiPsj1N+RE6nCChRpEBIyWZkKAu
 X4Jh46f94jiCLnXxHHXHLtRQtlF4d6DFg+Bh04/GKUT3Hes5VCqTMdP4C5hcRIB3sEsPGaBj
 FXokQpV/5YWMHa0YKtfaoaqAoEy16/iGN/5EPfOYbJzjoNZag6c4GR8ZEuIxWf9gQ10y+chO
 IyHN8e3ZZoHNUh55DCMBNg/1ZAP/DFg33jVeqn9kU6Z9qXLMRZ5Vow5GFeJa+k46oaNrwPU7
 8tTOqO29vmyePP/eTWS448WNUoNPWl+Xcqwtc1MaqiCOWKK+V3N6dePm9vNnrCJeYwPx48kG
 VnmAydl9bYGrSSvxf+2V5yXU5u2BcwXhStiYUQEYw3ys1B9OtnH0UvqX8BsFVXR3Lc4laYsJ
 xTEEu3caslypsPvp2xBMcas/dI8LnxGR2umZkKYXdT2RLY4LyShxzMuVlKHGPUmZsZvifYDn
 g==
IronPort-HdrOrdr: A9a23:90QCx69HP1/VGXcSO8puk+DnI+orL9Y04lQ7vn2ZLiYlC/Bw9v
 re+sjzsCWetN9/YhAdcLy7VZVoOEm9yXct2/hzAV7AZniAhILLFvAG0WKK+VSJJ8SZzIBgPI
 hbHJSWY+ebMbEVt6rHCB7RKadD/DFYm5rY4dvj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AQWu/X2tjzsn/tRBhil6I0zPI6IsvSD7i7nP/B3W?=
 =?us-ascii?q?pV3xyToKsTwHKxoR7xp8=3D?=
X-Talos-MUID: 9a23:7juKBgpFbjRBRLS//XEezzdEBppu8/SpNHIm0pQYlcC1cjNwJCjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,206,1728950400";
   d="1'?diff'?scan'208";a="28524646"
Received: from vist-zimproxy-02.vist.is ([194.105.232.88])
  by smtp-out-03.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 02:36:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id F292743D59D2
	for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2024 02:36:02 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id BV8Y3tWsBn5O for <alsa-devel@alsa-project.org>;
 Wed,  4 Dec 2024 02:36:01 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id 5107640105BE
	for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2024 02:36:01 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 1kPjVHa7RQ_t for <alsa-devel@alsa-project.org>;
 Wed,  4 Dec 2024 02:36:01 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTPS id 347EE40165CE
	for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2024 02:36:01 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1tIfFA-000000001Va-2hpg
	for alsa-devel@alsa-project.org;
	Wed, 04 Dec 2024 02:36:00 +0000
Date: Wed, 4 Dec 2024 02:36:00 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: axfer-transfer.1: Some remarks and editorial changes for this man
 page
Message-ID: <173327954445.5726.1446988294813860059.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UDkURBZ1cWpPKP6c"
Content-Disposition: inline
X-Mailer: reportbug 13.0.2
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GFEHVCYPR36UK4EMKYZMD4KH7LR2W4NK
X-Message-ID-Hash: GFEHVCYPR36UK4EMKYZMD4KH7LR2W4NK
X-Mailman-Approved-At: Mon, 09 Dec 2024 16:23:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFEHVCYPR36UK4EMKYZMD4KH7LR2W4NK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--UDkURBZ1cWpPKP6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Package: alsa-utils
Version: 1.2.12-1
Severity: minor
Tags: patch

   * What led up to the situation?

     Checking for defects with

test-[g|n]roff -mandoc -t -K utf8 -rF0 -rHY=0 -ww -b -z < "man page"

  [Use "groff -e ' $' <file>" to find trailing spaces.]

  ["test-groff" is a script in the repository for "groff"; is not shipped]
(local copy and "troff" slightly changed by me).

  [The fate of "test-nroff" was decided in groff bug #55941.]

   * What was the outcome of this action?

troff: backtrace: file '<stdin>':1006
troff:<stdin>:1006: warning: trailing space in the line

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

Kernel: Linux 6.11.10-amd64 (SMP w/2 CPU threads; PREEMPT)
Locale: LANG=is_IS.iso88591, LC_CTYPE=is_IS.iso88591 (charmap=ISO-8859-1), LANGUAGE not set
Shell: /bin/sh linked to /usr/bin/dash
Init: sysvinit (via /sbin/init)

Versions of packages alsa-utils depends on:
ii  kmod              33+20240816-2
ii  libasound2t64     1.2.12-1+b1
ii  libatopology2t64  1.2.12-1+b1
ii  libc6             2.40-3
ii  libfftw3-single3  3.3.10-1+b3
ii  libncursesw6      6.5-2+b1
ii  libsamplerate0    0.2.2-4+b2
ii  libtinfo6         6.5-2+b1

alsa-utils recommends no packages.

Versions of packages alsa-utils suggests:
pn  dialog  <none>

-- no debconf information

--UDkURBZ1cWpPKP6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.axfer-transfer.1"

Input file is axfer-transfer.1

  Any program (person), that produces man pages, should check the output
for defects by using (both groff and nroff)

[gn]roff -mandoc -t -ww -b -z -K utf8  <man page>

  The same goes for man pages that are used as an input.

  For a style guide use

  mandoc -T lint

-.-

  So any 'generator' should check its products with the above mentioned
'groff', 'mandoc',  and additionally with 'nroff ...'.

  This is just a simple quality control measure.

  The 'generator' may have to be corrected to get a better man page,
the source file may, and any additional file may.

  Common defects:

  Input text line longer than 80 bytes.

  Not removing trailing spaces (in in- and output).
  The reason for these trailing spaces should be found and eliminated.

  Not beginning each input sentence on a new line.
Lines should thus be shorter.

  See man-pages(7), item 'semantic newline'.

-.-

The difference between the formatted output of the original and patched file
can be seen with:

  nroff -mandoc <file1> > <out1>
  nroff -mandoc <file2> > <out2>
  diff -u <out1> <out2>

and for groff, using

"printf '%s\n%s\n' '.kern 0' '.ss 12 0' | groff -mandoc -Z - "

instead of 'nroff -mandoc'

  Add the option '-t', if the file contains a table.

  Read the output of 'diff -u' with 'less -R' or similar.

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


-.-.

Output from "mandoc -T lint  axfer-transfer.1 ": (shortened list)

      2 input text line longer than 80 bytes
      6 skipping paragraph macro

-.-.

Output from "test-groff -mandoc -t -ww -b -z axfer-transfer.1 ": (shortened list)

      1 trailing space in the line

-.-.

Output from "mandoc -T lint  axfer-transfer.1 ":

mandoc: axfer-transfer.1:238:2: WARNING: skipping paragraph macro: br before text line with leading blank
mandoc: axfer-transfer.1:378:104: STYLE: input text line longer than 80 bytes: any I/O operation re...
mandoc: axfer-transfer.1:513:103: STYLE: input text line longer than 80 bytes: communicate to units...
mandoc: axfer-transfer.1:600:2: WARNING: skipping paragraph macro: PP after SH
mandoc: axfer-transfer.1:607:1: WARNING: skipping paragraph macro: sp after PP
mandoc: axfer-transfer.1:629:1: WARNING: skipping paragraph macro: sp after PP
mandoc: axfer-transfer.1:647:1: WARNING: skipping paragraph macro: sp after PP
mandoc: axfer-transfer.1:662:1: WARNING: skipping paragraph macro: sp after PP

-.-.

Change '-' (\-) to '\(en' (en-dash) for a numeric range.
GNU gnulib has recently (2023-06-18) updated its
"build_aux/update-copyright" to recognize "\(en" in man pages.

axfer-transfer.1:529:(0\-9, a\-f, A\-F). Neither this option nor

-.-.

Add a comma (or \&) after "e.g." and "i.e.", or use English words
(man-pages(7)).
Abbreviation points should be protected against being interpreted as
an end of sentence, if they are not, and that independent of the
current place on the line.

696:notification should be emulated by any timer; e.g. hrtimer, kernel timer.
723:without periodical operation of the drivers; e.g. according to auto\-triggered

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

N.B.

  The number of lines affected can be too large to be in a patch.

52:backends. This program is essentially designed to use alsa\-lib APIs
80:channels, rate, duration. If nothing detected, content of given file path is
81:handled as raw data. In this case, the parameters should be indicated as
90:option. In this case, standard input and output is not available. The same
107:Quiet mode. Suppress messages (not sound :))
111:Verbose mode. Runtime dumps supplemental information according to the number of
116:Interrupt after # seconds. A value of zero means infinity. The default is zero,
118:killed. Either
126:Interrupt after transmission of # number of data frames. A value of zero means
127:infinity. The default is zero, so if this options is omitted then the
128:transmission process will run until it is killed. Either
136:Indicate format of audio sample. This is required for capture transmission, or
163:is used as a default. Actual available formats are restricted by each
166:Unavailable sample format is listed below. These format has size of data frame
180:Indicate the number of audio data samples per frame. This is required for
182:data. The value should be between
185:\&. If omitted,
191:Indicate the number of audio data frame per second. This is required for
193:data. If the value is less than
197:unit. The value should be between
201:\&. If omitted,
207:Indicate the type of file. This is required for capture transmission. Available
211: - voc: Creative Tech. voice format
223:Indicate this option when several files are going to be handled. For capture
237:Select backend of transmission from a list below. The default is libasound.
257:With this option, PCM substream is opened in non\-blocking mode. When audio
259:immediately returns without blocking process. This option implicitly uses
267:substream if selected node supports this operation. Without the option,
278:hardware parameter of PCM substream. The parameter indicates the number of audio
279:data frame per period in buffer of the PCM substream. Actual number is decided
284:one I/O operation. Actually, it is not, depending on implementation of the PCM
285:plugins, in\-kernel driver, PCM I/O plugins and scheduling model. For \(aqhw\(aq
295:hardware parameter of PCM substream. This option is similar to
304:hardware parameter of PCM substream. The parameter indicates the number of audio
305:data frame in buffer of PCM substream. Actual number is decided as a result of
310:the size of period. Actually, it is not, depending on implementation of the PCM
318:hardware parameter of PCM substream. This option is similar to
325:This option indicates the type of waiter for event notification. At present,
334:\&. With
336:type, \(aqsnd_pcm_wait()\(aq is used. With
338:type, \(aqselect(2)\(aq system call is used. With
340:type, \(aqpoll(2)\(aq system call is used. With
360:This option selects scheduling model for process of this program. One of
364:is available. In detail, please read \(aqSCHEDULING MODEL\(aq section.
375:software parameter of PCM substream. In blocking mode, the value is used as
377:substream to wake up process blocked by I/O operation. In non\-blocking mode,
393:software parameter of PCM substream. The value is used as threshold to start
394:PCM substream automatically. At present, this option has an effect in cases
409:For capture transmission, this option is useless. The number of
427:software parameter of PCM substream. The value is used as threshold to stop PCM
428:substream automatically. At present, this option has an effect in cases neither
441:to the PCM substream. This is a case that this program leaves the audio data
448:to the PCM substream. This is a case that this program leaves the audio data
492:This option disables any waiter for I/O event notification. I/O operations are
493:iterated till any of audio data frame is available. The option brings heavy
506:communicate. When Linux system has two 1394 OHCI controllers,
510:are available. Neither this option nor
512:is available at the same time. If nothing specified, libffado performs to
518:This option uses given value to decide which unit is used to communicate. This
527:This option uses given value to decide a target unit to communicate. The value
529:(0\-9, a\-f, A\-F). Neither this option nor
531:is available at the same time. If nothing specified, libffado performs to
539:read/write operation. The operation is blocked till the number of available
540:audio data frame exceeds the given value. As a default, 512 audio data frames
547:this program and libffado. As a default, 2 periods per buffer is used.
552:This option allows this program to run slave mode. In this mode, libffado
554:system runs. The unit directory can be found by the other node on the same bus.
556:data frame to the unit. This program can receive the packet and demultiplex the
562:This option allows this program to run snoop mode. In this mode, libffado
563:listens isochronous channels to which device transfers isochronous packet. When
579:parameter of process. Please read
593:will resume it. No XRUNs are expected. With libffado backend, the suspend/resume
611:RIFF/Wave, Sparc AU, Creative Tech. voice formats. If nothing detected,
632:bit little endian PCM for playback. The transmission continues till catching
650:10 seconds. The file format is Microsoft/IBM RIFF/Wave according to suffix of
679:mode is used. In this mode, in\-kernel drivers should operate hardware to
680:generate periodical notification for transmission of audio data frame. The
690:Inter\-IC sound is typically used. In this case, the controller generates the
691:IRQ according to transmission on the serial audio bus. In the handler assigned
696:notification should be emulated by any timer; e.g. hrtimer, kernel timer.
701:operations. They execute blocking system calls to read/write audio data frame
703:data frame is available. In
707:scheduling model and a default behaviour. Users can explicitly configure this
718:mode is an optional mode of runtime of PCM substream. The mode assumes a
720:applications. In this mode, in\-kernel drivers don't operate hardware to
723:without periodical operation of the drivers; e.g. according to auto\-triggered
727:should be programmed without any blocking operation. For this reason, this mode
732:audio data frame in buffer of the PCM substream for lapse of time. Furthermore,
743:runtime. Users should explicitly set this mode by usage of
751:rescheduling. For the yielding, timeout is calculated for preferable amount of
752:PCM frames to process. This is convenient to a kind of applications, like sound
753:servers. when an I/O thread of the server wait for the timeout, the other
754:threads can process audio data frames for server clients. Furthermore, with
762:scheduling model. At first, no interrupt context runs for PCM substream. The
763:PCM substream is handled in any process context only. No need to care of race
764:conditions between IRQ and process contexts. This reduces some concerns for
765:some developers of drivers and applications. Secondary, CPU time is not used
766:for handlers on the interrupt context. The CPU time can be dedicated for the
767:other tasks. This is good in a point of Time Sharing System. Thirdly, hardware
768:is not configured to generate interrupts. This is good in a point of reduction
773:device memory for audio serial bus. However, in timer\-based scheduling model,
774:fine granularity and accuracy of the value is important. Actually hardware
776:batch of audio data frames or bytes. In a view of PCM applications, the
778:each I/O operation. As of Linux kernel v4.21, ALSA PCM interface between
787:is designed to keep compatibility to aplay(1). However some options below are
793:to each channel. In aplay(1) implementation, this option has an additional
795:supports. As of 2018, PCM buffer of non\-interleaved order is hardly used by
801:audio data frame. Against aplay(1) implementation, this option has no effect
813:audio data frame. Against aplay(1) implementation, this option has no effect
825:audio data frame. Against aplay(1) implementation, this option has no effect
836:This option is unsupported. In aplay(1) implementation, the option has an
839:supported by used file format. When reaching to the limitation, used file is
840:closed, then new file is opened and audio data frames are written. However, this
846:This option is unsupported. In aplay(1) implementation, the option has an effect
849:strftime(3). However, this option requires extra string processing for file
854:This option is unsupported. In aplay(1) implementation, the option has an effect
855:to create a file for given value and write out process ID to it. This file
862:This option is not supported at present. In aplay(1) implementation, this option
864:vumeter for monaural and stereo channels. However, some problems lay; this
870:This option is not supported at present. In aplay(1) implementation, this option
872:according to pushed enter key. However, this feature requires an additional
879:remapping should be done in userspace. This brings overhead to align audio
880:data frames, especially for mmap operation. Furthermore, as of alsa-lib v1.1.8,
882:of transparent operation. At present, this option is not supported yet not to
887:This performs suspend/resume of PCM substream. In aplay(1) implementation,
889:in interactive mode in the above. Some developers use the signal for recovery
890:test from XRUN. At present, no alternative is supported for the test.
894:This is not supported. In aplay(1) implementation, this signal is assigned to a
896:to continue processing. However, as well as
925:module performs actual transmission to devices and nodes. The module can have
926:several transmission backends. As a default backend,
928:backend is used to perform transmission via alsa\-lib APIs. The module allows
934:of multimedia container or raw data. The module automatically detect type of
935:multimedia container and parse parameters in its metadata of data header. At
943:). Additionally, a special container is prepared for raw audio data (
957:backend uses one container to construct the buffer. The
967:module, a pointer to buffer including audio data frames is passed. This buffer
968:has two shapes for interleaved and non\-interleaved order. For the former, the
969:pointer points to one buffer. For the latter, the pointer points to an array in
970:which each element points to one buffer. Between the
978:copying between a buffer to another buffer as much as possible. For example, in
990:module, unit test is available. To run the tests, execute below command:
997:takes long time to finish. Please take care of the execution time if running on

-.-.

Split lines longer than 80 characters into two or more lines.
Appropriate break points are the end of a sentence and a subordinate
clause; after punctuation marks.

Line 378, length 104

any I/O operation returns \-EAGAIN until the available number of audio data frame reaches the threshold.

Line 513, length 103

communicate to units on IEEE 1394 bus managed by all of 1394 OHCI controller available in Linux system.

Line 658, length 83

.B $ axfer transfer capture \-s 1024 \-r 48000 \-c 2 \-f S32_BE \-I \-t au channels


-.-.

Use \(en (en-dash) for a dash between space characters,
not a minus (\-) or a hyphen (-), except in the NAME section.

axfer-transfer.1:140: - [S8|U8|S16|U16|S32|U32][_LE|_BE]
axfer-transfer.1:141: - [S24|U24][_LE|_BE]
axfer-transfer.1:142: - FLOAT[_LE|_BE]
axfer-transfer.1:143: - FLOAT64[_LE|_BE]
axfer-transfer.1:144: - IEC958_SUBFRAME[_LE|_BE]
axfer-transfer.1:145: - MU_LAW
axfer-transfer.1:146: - A_LAW
axfer-transfer.1:147: - [S20|U20][_LE|_BE]
axfer-transfer.1:148: - [S24|U24][_3LE|_3BE]
axfer-transfer.1:149: - [S20|U20][_3LE|_3BE]
axfer-transfer.1:150: - [S18|U18][_3LE|_3BE]
axfer-transfer.1:151: - DSD_U8
axfer-transfer.1:152: - DSD_[U16|U32][_LE|_BE]
axfer-transfer.1:157: - cd (16 bit little endian, 44100, stereo) [= \-f S16_LE \-c 2 \-r 44100]
axfer-transfer.1:158: - cdr (16 bit big endian, 44100, stereo) [= \-f S16_BE \-c 2 \-f 44100]
axfer-transfer.1:159: - dat (16 bit little endian, 48000, stereo) [= \-f S16_LE \-c 2 \-r 48000]
axfer-transfer.1:169: - IMA_ADPCM
axfer-transfer.1:170: - MPEG
axfer-transfer.1:171: - GSM
axfer-transfer.1:172: - SPECIAL
axfer-transfer.1:173: - G723_24
axfer-transfer.1:174: - G723_24_1B
axfer-transfer.1:175: - G723_40
axfer-transfer.1:176: - G723_40_1B
axfer-transfer.1:209: - wav: Microsoft/IBM RIFF/Wave format
axfer-transfer.1:210: - au, sparc: Sparc AU format
axfer-transfer.1:211: - voc: Creative Tech. voice format
axfer-transfer.1:212: - raw: raw data
axfer-transfer.1:239: - libasound
axfer-transfer.1:240: - libffado (optional if compiled)
axfer-transfer.1:981: - xfer(mmap/interleaved), mapper(single), container(any)
axfer-transfer.1:982: - xfer(mmap/non\-interleaved), mapper(multiple), containers(any)

-.-.

The section part for a manual page is set in roman font.

580:.I getrlimit(2)
637:.I kill(1)

-.-.

Split a punctuation from a single argument, if a two-font macro is meant

672:.I no\-period\-wakeup.

-.-.

Name of a manual is set in bold, the section in roman.
See man-pages(7).

580:.I getrlimit(2)
637:.I kill(1)
1005:amixer(1)

-.-.

Use a hyphen between a number and the unit (name) "bit",
see "man-pages(7)", item "Terms to avoid".

157: - cd (16 bit little endian, 44100, stereo) [= \-f S16_LE \-c 2 \-r 44100]
158: - cdr (16 bit big endian, 44100, stereo) [= \-f S16_BE \-c 2 \-f 44100]
159: - dat (16 bit little endian, 48000, stereo) [= \-f S16_LE \-c 2 \-r 48000]
649:sample format of 44.1 kHz, 2 channels, signed 16 bit little endian PCM, during
664:channels, signed 32 bit big endian PCM for 1,024 number of data frames to files

-.-.

Two or more space charaters between printable characters.

When the distance is between sentences,
start the beginning of the second one on a separate line
("semantic newline", see man-pages(7)).

N.B.
  The number of lines affected can be too large to be in a patch.

609:during 1 second.  The sample format is detected automatically as a result to
914:           --------     ----------     -------------
916:           --------     ----------     -------------
917:            libasound    single         wav
918:            libffado     multiple       au
919:                                        voc
920:                                        raw

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -ww -b -z ":

troff: backtrace: file '<stdin>':1006
troff:<stdin>:1006: warning: trailing space in the line

--UDkURBZ1cWpPKP6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="axfer-transfer.1.diff"

--- axfer-transfer.1	2024-12-04 01:07:17.640624893 +0000
+++ axfer-transfer.1.new	2024-12-04 02:13:27.201543086 +0000
@@ -71,8 +71,7 @@ Filepath is handled as a path relative t
 if it\(aqs not full path from root directory.
 
 The standard input or output is used if filepath is not specified or given as
-.I \(aq\-\(aq
-\&.
+.IR \(aq\-\(aq .
 
 For playback transmission, container format of given
 .I filepath
@@ -90,11 +89,11 @@ are allowed with
 option. In this case, standard input and output is not available. The same
 .I filepath
 is not allowed except for paths listed below:
- \- /dev/null
- \- /dev/zero
- \- /dev/full
- \- /dev/random
- \- /dev/urandom
+ \(en /dev/null
+ \(en /dev/zero
+ \(en /dev/full
+ \(en /dev/random
+ \(en /dev/urandom
 
 .SS Common options
 
@@ -137,26 +136,26 @@ Indicate format of audio sample. This is
 playback transmission with files including raw audio data.
 
 Available sample format is listed below:
- - [S8|U8|S16|U16|S32|U32][_LE|_BE]
- - [S24|U24][_LE|_BE]
- - FLOAT[_LE|_BE]
- - FLOAT64[_LE|_BE]
- - IEC958_SUBFRAME[_LE|_BE]
- - MU_LAW
- - A_LAW
- - [S20|U20][_LE|_BE]
- - [S24|U24][_3LE|_3BE]
- - [S20|U20][_3LE|_3BE]
- - [S18|U18][_3LE|_3BE]
- - DSD_U8
- - DSD_[U16|U32][_LE|_BE]
+ \(en [S8|U8|S16|U16|S32|U32][_LE|_BE]
+ \(en [S24|U24][_LE|_BE]
+ \(en FLOAT[_LE|_BE]
+ \(en FLOAT64[_LE|_BE]
+ \(en IEC958_SUBFRAME[_LE|_BE]
+ \(en MU_LAW
+ \(en A_LAW
+ \(en [S20|U20][_LE|_BE]
+ \(en [S24|U24][_3LE|_3BE]
+ \(en [S20|U20][_3LE|_3BE]
+ \(en [S18|U18][_3LE|_3BE]
+ \(en DSD_U8
+ \(en DSD_[U16|U32][_LE|_BE]
 
 If endian\-ness is omitted, host endian\-ness is used.
 
 Some special formats are available:
- - cd (16 bit little endian, 44100, stereo) [= \-f S16_LE \-c 2 \-r 44100]
- - cdr (16 bit big endian, 44100, stereo) [= \-f S16_BE \-c 2 \-f 44100]
- - dat (16 bit little endian, 48000, stereo) [= \-f S16_LE \-c 2 \-r 48000]
+ \(en cd (16 bit little endian, 44100, stereo) [= \-f S16_LE \-c 2 \-r 44100]
+ \(en cdr (16 bit big endian, 44100, stereo) [= \-f S16_BE \-c 2 \-f 44100]
+ \(en dat (16 bit little endian, 48000, stereo) [= \-f S16_LE \-c 2 \-r 48000]
 
 If omitted,
 .I U8
@@ -166,14 +165,14 @@ transmission backend.
 Unavailable sample format is listed below. These format has size of data frame
 unaligned to byte unit.
 
- - IMA_ADPCM
- - MPEG
- - GSM
- - SPECIAL
- - G723_24
- - G723_24_1B
- - G723_40
- - G723_40_1B
+ \(en IMA_ADPCM
+ \(en MPEG
+ \(en GSM
+ \(en SPECIAL
+ \(en G723_24
+ \(en G723_24_1B
+ \(en G723_40
+ \(en G723_40_1B
 
 .TP
 .B \-c, \-\-channels=#
@@ -181,8 +180,8 @@ Indicate the number of audio data sample
 capture transmission, or playback transmission with files including raw audio
 data. The value should be between
 .I 1 to
-.I 256
-\&. If omitted,
+.IR 256 .
+If omitted,
 .I 1
 is used as a default.
 
@@ -197,8 +196,8 @@ data. If the value is less than
 unit. The value should be between
 .I 2000
 and
-.I 192000
-\&. If omitted,
+.IR 192000 .
+If omitted,
 .I 8000
 is used as a default.
 
@@ -206,10 +205,10 @@ is used as a default.
 .B \-t, \-\-file\-type=TYPE
 Indicate the type of file. This is required for capture transmission. Available
 types are listed below:
- - wav: Microsoft/IBM RIFF/Wave format
- - au, sparc: Sparc AU format
- - voc: Creative Tech. voice format
- - raw: raw data
+ \(en wav: Microsoft/IBM RIFF/Wave format
+ \(en au, sparc: Sparc AU format
+ \(en voc: Creative Tech. voice format
+ \(en raw: raw data
 
 When nothing is indicated, for capture transmission, the type is decided
 according to suffix of
@@ -235,9 +234,8 @@ Dump hardware parameters and finish run
 .TP
 .B \-\-xfer\-backend=BACKEND
 Select backend of transmission from a list below. The default is libasound.
-.br
- - libasound
- - libffado (optional if compiled)
+ \(en libasound
+ \(en libffado (optional if compiled)
 
 .SS Backend options for libasound
 
@@ -324,14 +322,12 @@ option, however its unit is micro\-secon
 
 This option indicates the type of waiter for event notification. At present,
 four types are available;
-.I default
-,
-.I select
-,
+.IR default ,
+.IR select ,
 .I poll
 and
-.I epoll
-\&. With
+.IR epoll .
+With
 .I default
 type, \(aqsnd_pcm_wait()\(aq is used. With
 .I select
@@ -375,7 +371,8 @@ This option configures given value to
 software parameter of PCM substream. In blocking mode, the value is used as
 threshold of the number of available audio data frames in buffer of PCM
 substream to wake up process blocked by I/O operation. In non\-blocking mode,
-any I/O operation returns \-EAGAIN until the available number of audio data frame reaches the threshold.
+any I/O operation returns \-EAGAIN
+until the available number of audio data frame reaches the threshold.
 
 This option has an effect in cases neither
 .I \-\-mmap
@@ -509,8 +506,10 @@ or
 .I 1
 are available. Neither this option nor
 .I \-g
-is available at the same time. If nothing specified, libffado performs to
-communicate to units on IEEE 1394 bus managed by all of 1394 OHCI controller available in Linux system.
+is available at the same time.
+If nothing specified,
+libffado performs to communicate to units on IEEE 1394 bus
+managed by all of 1394 OHCI controller available in Linux system.
 
 .TP
 .B \-n, \-\-node=#
@@ -526,7 +525,7 @@ specified unit.
 
 This option uses given value to decide a target unit to communicate. The value
 should be prefixed with '0x' and consists of hexadecimal literal letters
-(0\-9, a\-f, A\-F). Neither this option nor
+(0\(en9, a\(enf, A\(enF). Neither this option nor
 .I \-p
 is available at the same time. If nothing specified, libffado performs to
 communicate to units on IEEE 1394 bus managed by all of 1394 OHCI controller
@@ -577,7 +576,7 @@ isochronous communication.
 The given value should be within
 .I RLIMIT_RTPRIO
 parameter of process. Please read
-.I getrlimit(2)
+.BR getrlimit (2)
 for details.
 
 .SH POSIX SIGNALS
@@ -597,20 +596,18 @@ The other signals perform default behavi
 
 .SH EXAMPLES
 
-.PP
 .in +4n
 .EX
 .B $ axfer transfer playback \-d 1 something
 .EE
 .in
 .PP
-
 The above will transfer audio data frame in \(aqsomething\(aq file for playback
-during 1 second.  The sample format is detected automatically as a result to
+during 1 second.
+The sample format is detected automatically as a result to
 parse \(aqsomething\(aq as long as it\(aqs compliant to one of Microsoft/IBM
 RIFF/Wave, Sparc AU, Creative Tech. voice formats. If nothing detected,
-.I \-r
-,
+.IR \-r ,
 .I \-c
 and
 .I \-f
@@ -626,7 +623,6 @@ should be given with special format.
 .EE
 .in
 .PP
-
 The above will transfer audio data frame in \(aqsomething\(aq file including no
 information of sample format, as sample format of 22050 Hz, monaural, signed 16
 bit little endian PCM for playback. The transmission continues till catching
@@ -634,8 +630,7 @@ bit little endian PCM for playback. The
 from keyboard or
 .I SIGTERM
 by
-.I kill(1)
-\&.
+.BR kill (1).
 
 .PP
 .in +4n
@@ -644,36 +639,32 @@ by
 .EE
 .in
 .PP
-
 The above will transfer audio data frame to \(aqsomething.wav\(aq file as
 sample format of 44.1 kHz, 2 channels, signed 16 bit little endian PCM, during
 10 seconds. The file format is Microsoft/IBM RIFF/Wave according to suffix of
 the given
-.I filepath
-\&.
+.IR filepath .
 
 .PP
 .in +4n
 .EX
-.B $ axfer transfer capture \-s 1024 \-r 48000 \-c 2 \-f S32_BE \-I \-t au channels
+.B $ axfer transfer capture \-s 1024 \-r 48000 \-c 2 \-f S32_BE \-I \-t au \
+channels
 .EE
 .in
 .PP
-
 The above will transfer audio data frame as sample format of 48.0 kHz, 2
 channels, signed 32 bit big endian PCM for 1,024 number of data frames to files
 named \(aqchannels\-1.au\(aq and \(aqchannels\-2.au\(aq.
 
 .SH SCHEDULING MODEL
-
 In a design of ALSA PCM core, runtime of PCM substream supports two modes;
 .I period\-wakeup
 and
-.I no\-period\-wakeup.
+.IR no\-period\-wakeup .
 These two modes are for different scheduling models.
 
 .SS IRQ\-based scheduling model
-
 As a default,
 .I period\-wakeup
 mode is used. In this mode, in\-kernel drivers should operate hardware to
@@ -693,7 +684,7 @@ to the IRQ, direct media access (DMA) tr
 dedicated host memory and device memory.
 
 If target hardware doesn't support this kind of mechanism, the periodical
-notification should be emulated by any timer; e.g. hrtimer, kernel timer.
+notification should be emulated by any timer; e.g., hrtimer, kernel timer.
 External PCM plugins generated by PCM plugin SDK in alsa\-lib should also
 emulate the above behaviour.
 
@@ -701,8 +692,8 @@ In this mode, PCM applications are progr
 operations. They execute blocking system calls to read/write audio data frame
 in buffer of PCM substream, or blocking system calls to wait until any audio
 data frame is available. In
-.I axfer
-, this is called
+.IR axfer ,
+this is called
 .I IRQ\-based
 scheduling model and a default behaviour. Users can explicitly configure this
 mode by usage of
@@ -712,7 +703,6 @@ option with
 value.
 
 .SS Timer\-based scheduling model
-
 The
 .I no\-period\-wakeup
 mode is an optional mode of runtime of PCM substream. The mode assumes a
@@ -720,7 +710,7 @@ specific feature of hardware and assist
 applications. In this mode, in\-kernel drivers don't operate hardware to
 generate periodical notification for transmission of audio data frame.
 The hardware should automatically continue transmission of audio data frame
-without periodical operation of the drivers; e.g. according to auto\-triggered
+without periodical operation of the drivers; e.g., according to auto\-triggered
 DMA transmission, a chain of registered descriptors.
 
 In this mode, nothing wakes up blocked processes, therefore PCM applications
@@ -735,8 +725,8 @@ PCM core to update a position to head of
 XRUN.
 
 In
-.I axfer
-, this is called
+.IR axfer ,
+this is called
 .I timer\-based
 scheduling model and available as long as hardware/driver assists
 .I no\-period\-wakeup
@@ -757,7 +747,6 @@ transmission position and handling posit
 PCM buffers.
 
 .SS Advantages and issues
-
 Ideally, timer\-based scheduling model has some advantages than IRQ\-based
 scheduling model. At first, no interrupt context runs for PCM substream. The
 PCM substream is handled in any process context only. No need to care of race
@@ -779,7 +768,6 @@ each I/O operation. As of Linux kernel v
 kernel/userspace has no feature to report it.
 
 .SH COMPATIBILITY TO APLAY
-
 The
 .B transfer
 subcommand of
@@ -902,22 +890,22 @@ option, this option should increase comp
 .SS Modular structure
 
 This program consists of three modules;
-.I xfer
-,
+.IR xfer ,
 .I mapper
 and
-.I container
-\&.
+.IR container .
 Each module has an abstraction layer to enable actual implementation.
 
 .nf
+.ft CR
            --------     ----------     -------------
-device <-> | xfer | <-> | mapper | <-> | container | <-> file
+device <\-> | xfer | <\-> | mapper | <\-> | container | <\-> file
            --------     ----------     -------------
             libasound    single         wav
             libffado     multiple       au
                                         voc
                                         raw
+.ft
 .fi
 
 The
@@ -950,8 +938,7 @@ module handles buffer layout and alignme
 The module has two implementations;
 .I single
 and
-.I multiple
-\&.
+.IR multiple .
 The
 .I single
 backend uses one container to construct the buffer. The
@@ -978,8 +965,8 @@ In passing audio data frame between the
 copying between a buffer to another buffer as much as possible. For example, in
 some scenarios below, no copying occurs between modules.
 
- - xfer(mmap/interleaved), mapper(single), container(any)
- - xfer(mmap/non\-interleaved), mapper(multiple), containers(any)
+ \(en xfer(mmap/interleaved), mapper(single), container(any)
+ \(en xfer(mmap/non\-interleaved), mapper(multiple), containers(any)
 
 .SS Unit test
 
@@ -998,12 +985,11 @@ takes long time to finish. Please take c
 any CI environment.
 
 .SH SEE ALSO
-\fB
-axfer(1),
-axfer\-list(1),
-alsamixer(1),
-amixer(1)
-\fP
+.BR \
+axfer "(1), " \
+axfer\-list "(1), " \
+alsamixer "(1), " \
+amixer (1)
 
 .SH AUTHOR
 Takashi Sakamoto <o\-takashi@sakamocchi.jp>

--UDkURBZ1cWpPKP6c--
