Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFF9DFC2D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:42:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4749D22A9;
	Mon,  2 Dec 2024 09:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4749D22A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128929;
	bh=pFghbaWtd/STyIfc/3CL7MtyUPysSEDZeYSKOSqu2+o=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uD6cQLCVmNhyPku7gJ93xwkBQmyKjj6uK3QR28O4soECZN9TDKYjFo4mF9M+OHONU
	 FhiAMNNhCPKufK14KD+neX6aJCTXY8t2xSM5YwYYavG16noVI92OGVUFpUWM3aIXyj
	 WqpVaxfXSIgJBvquEX2NPqi0EHjXYKUE+Km71gdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E26A5F805EB; Mon,  2 Dec 2024 09:41:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8683CF8052E;
	Mon,  2 Dec 2024 09:41:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A1AAF80236; Wed, 27 Nov 2024 02:34:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1-04.simnet.is (smtp-out1-04.simnet.is
 [194.105.232.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5BDBF800F0
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 02:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5BDBF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=e0NM6WHa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1732671240; x=1764207240;
  h=date:from:to:subject:message-id:mime-version;
  bh=z9UTy1QTtayTq+0bwyuQ2PeETDJ6V1U7dIP85o3SJS8=;
  b=e0NM6WHaxYWFmNOsZXjAX4PshuJiUhA7LoiEgGXHVMQjh5nOR6lU31JZ
   BjQBIi4vtKl6Z5AUgzPRtDYnhI/8MT3oQSfOLDxxLANBKDJMhD1rK7LbE
   Ny6oj6q4AzxmZaEx2mjNrLFiRQFa1IP2Y0kuBcqo2wzorI5SChYjL0X0E
   5KjHwlvXzObprawak+bYzhDVbrlhv4n41h+vwjKLxxGORk3d8Qil6f7Ie
   1w7mxlp3bUEccoNVXbR1euHTSJsvBJRHgl2/jCdfxvEBBrFziHUV8ng1h
   3BQddOSdWzit4uYKTZwEfOnc5QCb8PD1q8fOfEDZc1CaQDz8T4FH6qWQd
   Q==;
X-CSE-ConnectionGUID: /Z1TLSvoS2qOODMWu/wi+g==
X-CSE-MsgGUID: OfKPyDkYSq+e8qEaLkXiFA==
Authentication-Results: smtp-out-04.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2GZAgDMb0ZnhVjoacJaHQEBAQEJARIBBQUBQIFTgkR9g?=
 =?us-ascii?q?WSIJY4fgRaeWjAHAQEBDzkLBAEBAwEDgVCDMIpeKDgTAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQEBDgEBBgEBAQEBAQYHAhABAQEBQA47hTVGDYMWcYElAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBARcCAgs0KgGBEzh8JwmCeAGCZBQGsQeBNIEBgxzbF4FdEIFIh?=
 =?us-ascii?q?WqCYgGFaYR3PAaCDYEVMgOBBm1KB2+CYQECAYFGRIYYBIIkHHk6B4EsDIILE?=
 =?us-ascii?q?iWCGoENgV+CD16BDYN+hByCVYFKgRaCP4IQiUVIgSEDWSERAVUTDQoLBwWBd?=
 =?us-ascii?q?gOCTHorgQuBFzqBfoETSoNKgUJGPTeCE2lLNwINAjaCJH2CTYMYgX+EaYRbh?=
 =?us-ascii?q?jAdNgoDCxgNSBEsNxQbRG4HoDQBRoJNCWAMBgEBMCIEDBgTKgJYLRMDMAYPH?=
 =?us-ascii?q?gUCGh4LBpJoWI9PgUShXIQkhluDMIILlUczIoNigVeLLoY6DDqSSJh7jgCVc?=
 =?us-ascii?q?hk3hGaBfoF/LAcaCDA7gmcJSRkPjgcjAxaDWIReNsM6eAIBOAIHCwEBAwmSa?=
 =?us-ascii?q?QEB?=
IronPort-PHdr: A9a23:ab99BByo/yc9nVHXCzPyngc9DxPP2p3vOxINr506l/cWLuK4/pHkM
 VCZ5O4+xFPKXICO7fVChqKWtq37QmUP7N6Ht2xKa51DURIJyI0WkgUsDdTDCBj9K/jnBxE=
IronPort-Data: A9a23:u5Da46ncbhr4igseuKwDmQno5gxjIURdPkR7XQ2eYbSJt16W5oEne
 lBvCjHdVaLbPHygOZtoOdH1pBhX/YjU/mJQOFdvpC8wE35DoJuaC9rEcBv7ZX7Id5XJExlst
 ZkTN9WZcM1lQC+Nrx7ybeCw9SZx2/vZGef3UueYanEhHVFuQy1JZX6P4wIcqtcAbY+RXl7W4
 7se2vH3J0C6nTR1KmdS7LiM7x5p++zvsjcZtVUiZPdNpxjFljwfFpUUJbyrIhPErvJv8ruHq
 5zrl/fhll7kwivBYz/dftzTe0kRS7TbIU7XzHZXVabKbnNq93Y4i/tlOKFBZxcMgWXSzowpm
 Y0S6JLvGVZ2Nf3FxrlHXkcEQn8hMKYep+KcLXHvu5fOxBWfLiK3nq8+UxBvM+X0lgoP7URmr
 JT0fxhSMkna7w7P/Jq7VvV0nZZka9LsIZkUtzdpyz3DCvcqB5vERuLG6MFZ1zorwclTEffZI
 M4ebiJlZR/DJR1TP1N/NH5Fpwveu5WFW2Ee9zqomJcKD0jvIC1ZjuThPYPcK4zXFJUKzhrCr
 D6eoDWpC0FKPozAw2Hc/i6Fi76Ul0sXeqpLT+TgqaQCbH5/Z4A3IEdLPbduiaDh0iZSY/oGd
 gpMvHJo9PBunKCSZoGVdwWip3KZtQIrVdNVEukrgCmA0aO8DzyxXwDodRYfLoV83CMKbWZyj
 APQxom3XWcHXIC9EBpxyJ/F/FteBgBNRYMyTXdsZRcI5dDlvLYygnrnJjq0OPfo5jFdMWiYL
 wGi9EDStZ1K5SI4//nTEWT8vt6ZjsOhojjZSengdjnNAgtRPOZJbmEzgLTRxa4owI2xFjFts
 JWY8iQ3AS9n4ZylzUSwrOsx8L6BoMTcDBnnn1lURYAG0BiIxGPkYoET72QrTKtpGp5slT7Bf
 k7IpUZD5ZpLJny6fOovOcSvCt82i6n7fTjnfqmFMpwXOsU3LlTdunE+DaKT9zmFfEwEm64XI
 paed8uwS3cBYUhi5GDpHbxMi+Jzrsw47UTdZqjq4xeW6qPdaS6MZL4hM2uPQMlsuctopy2Or
 4YOaJrWo/lFa8X3ZjLetIIeM10OBXE/Hpmzs9ZQdOOIPkxhAm5JNhPK6a0gYJAgjaVQjv3P7
 mD4AhUe1lvkmTvGMm1md0yPdpuob89DiUklOhd2JHGP910cfMGw7eQQIs5fkaYcyMRvyvt9T
 v8gcsqGA+hSRjmvx9j7RcWixGCFXEj67T9iLxaYjC4Dk4lIZjehxzMJVhXu7zVLHCuyrdE5s
 6zljlmdX5sYW0JjF646ic5DLXvv5BDxe8orDiMkx+W/nm23qeCGzASq15cKzzkkc0mr+9dj/
 1/+7e0kjefMuZQp19LCmLqJqYyke8MnQREAQTWGvO7vbHCCloZG/WOmeLrYFdw6fD6skJhOm
 c0PkqyU3AAvxQoR7dMie1qV5f1ivoWHS0BmIvRMRymbPgv6VtuM01GD3M1G/q1DroK1SiPrM
 n9jDuJyYO3TUOu8SQJ5DFR+NIyri6pL8gQ+GNxuey0WEgcsp+LfCS2//nCk1ERgEVeCGNl4m
 7t45J5LtmRSSHMCa767s8ydzEzURlRobkntnshy7FPD4ubz9mx/XA==
IronPort-HdrOrdr: A9a23:tSOpy67/dtNlPE+IqAPXwN3XdLJyesId70hD6qlUc20yTiX4rb
 HIoB11737JYVoqOE3I+urwXJVoI0mskKKdiLN5VdzJMWWI1ldAR7sSj7cKrQeQeBEWjtQtrJ
 tdTw==
X-Talos-CUID: 9a23:/ACqrWCAVx/kSOL6E25VrXIwId4iSSfE61D8BnClTnloC7LAHA==
X-Talos-MUID: 9a23:K6J/0Aqj64UpYqYlcGMezxZsF/95z6efM1lOnMUflsCgNhxxFR7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,188,1728950400";
   d="1'?diff'?scan'208";a="27239250"
Received: from vist-zimproxy-02.vist.is ([194.105.232.88])
  by smtp-out-04.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 01:33:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id 025BD401057B
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 01:33:57 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id egim8jrzOukI for <alsa-devel@alsa-project.org>;
 Wed, 27 Nov 2024 01:33:56 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTP id 18F7543D59A7
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 01:33:56 +0000 (GMT)
Received: from vist-zimproxy-02.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-02.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id LsAkX3l1jyJ6 for <alsa-devel@alsa-project.org>;
 Wed, 27 Nov 2024 01:33:55 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-02.vist.is (Postfix) with ESMTPS id EA9AD401057B
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 01:33:55 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1tG6wI-000000002bJ-1gJE
	for alsa-devel@alsa-project.org;
	Wed, 27 Nov 2024 01:33:58 +0000
Date: Wed, 27 Nov 2024 01:33:58 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: alsabat.1: Some remarks and editorial changes for this man page
Message-ID: 
 <173267102821.9901.14592571103118715184.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="KiFdB+TBweoewYi8"
Content-Disposition: inline
X-Mailer: reportbug 13.0.2
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YD2TNQJLBSOF7LW3WSRILZFYLC2XZD3C
X-Message-ID-Hash: YD2TNQJLBSOF7LW3WSRILZFYLC2XZD3C
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:41:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YD2TNQJLBSOF7LW3WSRILZFYLC2XZD3C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KiFdB+TBweoewYi8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Package: alsa-utils
Version: 1.2.12-1 (Debian testing)
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


troff: backtrace: file '<stdin>':175
troff:<stdin>:175: warning: trailing space in the line


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

Kernel: Linux 6.11.9-amd64 (SMP w/2 CPU threads; PREEMPT)
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

--KiFdB+TBweoewYi8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.alsabat.1"

Input file is alsabat.1

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

Output from "mandoc -T lint  alsabat.1 ": (shortened list)

      1 skipping paragraph macro

-.-.

Output from "test-groff -mandoc -t -ww -b -z alsabat.1 ": (shortened list)

      1 trailing space in the line

-.-.

Output from "mandoc -T lint  alsabat.1 ":

mandoc: alsabat.1:163:2: WARNING: skipping paragraph macro: br after SH

-.-.

Change - to \- if it shall be printed as a minus sign.

alsabat.1:166:If no peak be detected, returns -1001;
alsabat.1:168:If only DC be detected, returns -1002;
alsabat.1:170:If peak frequency does not match with the target frequency, returns -1003.

-.-.

Change a HYPHEN-MINUS (code 0x2D) to a minus(-dash) (\-),
if it
is in front of a name for an option,
is a symbol for standard input,
is a single character used to indicate an option,
or is in the NAME section (man-pages(7)).
N.B. - (0x2D), processed as a UTF-8 file, is changed to a hyphen
(0x2010, groff \[u2010] or \[hy]) in the output.

37:of alsabat, with configure option "--enable-alsabat-backend-tiny".
134:"--standalone".

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

11:human interaction. ALSABAT can be used to test audio quality, stress test
14:ALSABAT's design is relatively simple. ALSABAT plays an audio stream and
15:captures the same stream in either a digital or analog loop back. It then
21:target and runs as a server on a separate tester machine. The client/server
30:jacks to create a loopback. If only headphone and mic jacks (or combo jack)
68:The number of channels. The default is one channel.
72:Sampling rate in Hertz. The default rate is 44100 Hertz.
79:1. Decimal integer, means number of frames;
81:2. Floating point with suffix 's', means number of seconds.
90:value and standard deviation of frequency vectors. After that, we define
123:Playback, capture and analysis internal to ALSABAT only. This is intended
139:There are many kinds of audio latency metrics. One useful metric is the
143:Noise detection threshold in SNR (dB). 26dB indicates 5% noise in amplitude.
178:Currently only support RIFF WAV format with PCM data. Please report any bugs to

-.-.

Use the name of units in text; use symbols in tables and
calculations.
The rule is to have a (no-break, \~) space between a number and
its units (see "www.bipm.org/en/publications/si-brochure")

143:Noise detection threshold in SNR (dB). 26dB indicates 5% noise in amplitude.

-.-.

Name of a manual is set in bold, the section in roman.
See man-pages(7).

174:aplay(1)

-.-.

Change a HYPHEN-MINUS (code 0x55, 2D) to a dash
(\-, minus) if it matches "[[:alph:]]-[[:alpha:]]" in the name of an
option).
Facilitates the copy and paste of
a) an option in UTF-8 text
b) web addresses (URL).

Is not needed in ordinary words like "mother-in-law", that are not
copied and pasted to a command line (which needs ASCII code)

37:of alsabat, with configure option "--enable-alsabat-backend-tiny".

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -ww -b -z ":

troff: backtrace: file '<stdin>':175
troff:<stdin>:175: warning: trailing space in the line

-.-

Additionally:

  Use a hyphen between a number and the unit (name) "bit",
see "man-pages(7)", item "Terms to avoid".

--KiFdB+TBweoewYi8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="alsabat.1.diff"

--- alsabat.1	2024-11-27 00:33:40.281656673 +0000
+++ alsabat.1.new	2024-11-27 01:03:49.731607405 +0000
@@ -7,34 +7,41 @@ alsabat \- command\-line sound tester fo
 
 .SH DESCRIPTION
 \fBALSABAT(ALSA Basic Audio Tester)\fP is a simple command\-line utility
-intended to help automate audio driver and sound server testing with little
-human interaction. ALSABAT can be used to test audio quality, stress test
-features and test audio before and after PM state changes.
-
-ALSABAT's design is relatively simple. ALSABAT plays an audio stream and
-captures the same stream in either a digital or analog loop back. It then
-compares the captured stream using a FFT to the original to determine if
-the test case passes or fails.
-
-ALSABAT can either run wholly on the target machine being tested (standalone
-mode) or can run as a client/server mode where by alsabat client runs on the
-target and runs as a server on a separate tester machine. The client/server
-mode still requires some manual interaction for synchronization, but this
-is actively being developed for future releases.
+intended to help automate audio driver
+and sound server testing with little human interaction.
+ALSABAT can be used to test audio quality,
+stress test features
+and test audio before and after PM state changes.
+
+ALSABAT's design is relatively simple.
+ALSABAT plays an audio stream
+and captures the same stream in either a digital or analog loop back.
+It then compares the captured stream using a FFT to the original
+to determine if the test case passes or fails.
+
+ALSABAT can either run wholly on the target machine being tested
+(standalone mode)
+or can run as a client/server mode where by alsabat client runs on the
+target
+and runs as a server on a separate tester machine.
+The client/server mode still requires some manual interaction for
+synchronization,
+but this is actively being developed for future releases.
 
 The hardware testing configuration may require the use of an analog cable
 connecting target to tester machines or a cable to create an analog
 loopback if no loopback mode is available on the sound hardware that is
 being tested.
 An analog loopback cable can be used to connect the "line in" to "line out"
-jacks to create a loopback. If only headphone and mic jacks (or combo jack)
-are available then the following simple circuit can be used to create an
-analog loopback :-
+jacks to create a loopback.
+If only headphone and mic jacks (or combo jack) are available
+then the following simple circuit can be used to create an analog loopback
+:-
 
 https://source.android.com/devices/audio/loopback.html
 
 If tinyalsa is installed in system, user can choose tinyalsa as backend lib
-of alsabat, with configure option "--enable-alsabat-backend-tiny".
+of alsabat, with configure option "\-\-enable-alsabat-backend-tiny".
 
 .SH OPTIONS
 .TP
@@ -59,26 +66,28 @@ Some of these may not be available on se
 .br
 The available format shortcuts are:
 .nf
-\-f cd (16 bit little endian, 44100, stereo) [\-f S16_LE \-c2 \-r44100]
-\-f dat (16 bit little endian, 48000, stereo) [\-f S16_LE \-c2 \-r48000]
+\-f cd (16-bit little endian, 44100, stereo) [\-f S16_LE \-c2 \-r44100]
+\-f dat (16-bit little endian, 48000, stereo) [\-f S16_LE \-c2 \-r48000]
 .fi
 If no format is given S16_LE is used.
 .TP
 \fI\-c\fP
-The number of channels. The default is one channel.
+The number of channels.
+The default is one channel.
 Valid values at the moment are 1 or 2.
 .TP
 \fI\-r\fP
-Sampling rate in Hertz. The default rate is 44100 Hertz.
+Sampling rate in Hertz.
+The default rate is 44100 Hertz.
 Valid values depends on hardware support.
 .TP
 \fI\-n\fP
 Duration of generated signal.
 The value could be either of the two forms:
 .br
-1. Decimal integer, means number of frames;
+1.\& Decimal integer, means number of frames;
 .br
-2. Floating point with suffix 's', means number of seconds.
+2.\& Floating point with suffix 's', means number of seconds.
 .br
 The default is 2 seconds.
 .TP
@@ -87,8 +96,8 @@ Sigma k value for analysis.
 .br
 The analysis function reads data from WAV file, run FFT against the data
 to get magnitude of frequency vectors, and then calculates the average
-value and standard deviation of frequency vectors. After that, we define
-a threshold:
+value and standard deviation of frequency vectors.
+After that, we define a threshold:
 .br
 threshold = k * standard_deviation + mean_value
 .br
@@ -120,9 +129,9 @@ Target WAV file to save capture test con
 .TP
 \fI\-\-local\fP
 Internal loopback mode.
-Playback, capture and analysis internal to ALSABAT only. This is intended
-for developers to test new ALSABAT features as no audio is routed outside
-of ALSABAT.
+Playback, capture and analysis internal to ALSABAT only.
+This is intended for developers to test new ALSABAT features
+as no audio is routed outside of ALSABAT.
 .TP
 \fI\-\-standalone\fP
 Add support for standalone mode where ALSABAT will run on a different machine
@@ -131,17 +140,20 @@ In standalone mode, the sound data can b
 just like in normal mode, but will not be analyzed.
 The ALSABAT being built without libfftw3 support is always in standalone mode.
 The ALSABAT in normal mode can also bypass data analysis using option
-"--standalone".
+"\-\-standalone".
 .TP
 \fI\-\-roundtriplatency\fP
 Round trip latency test.
 Audio latency is the time delay as an audio signal passes through a system.
-There are many kinds of audio latency metrics. One useful metric is the
-round trip latency, which is the sum of output latency and input latency.
+There are many kinds of audio latency metrics.
+One useful metric is the round trip latency,
+which is the sum of output latency and input latency.
 .TP
 \fI\-\-snr\-db=#\fP
-Noise detection threshold in SNR (dB). 26dB indicates 5% noise in amplitude.
-ALSABAT will return error if signal SNR is smaller than the threshold.
+Noise detection threshold in SNR (dB).
+26\~dB indicates 5% noise in amplitude.
+ALSABAT will return error
+if signal SNR is smaller than the threshold.
 .TP
 \fI\-\-snr\-pc=#\fP
 Noise detection threshold in percentage of noise amplitude (%).
@@ -160,26 +172,24 @@ Play the RIFF WAV file "500Hz.wav" which
 data, and then capture and analyze.
 
 .SH RETURN VALUE
-.br
 On success, returns 0.
 .br
-If no peak be detected, returns -1001;
+If no peak be detected, returns \-1001;
 .br
-If only DC be detected, returns -1002;
+If only DC be detected, returns \-1002;
 .br
-If peak frequency does not match with the target frequency, returns -1003.
+If peak frequency does not match with the target frequency, returns \-1003.
 
 .SH SEE ALSO
-\fB
-aplay(1)
-\fP
+.BR aplay (1)
 
 .SH BUGS
-Currently only support RIFF WAV format with PCM data. Please report any bugs to
-the alsa-devel mailing list.
+Currently only support RIFF WAV format with PCM data.
+Please report any bugs to the alsa-devel mailing list.
 
 .SH AUTHOR
-\fBalsabat\fP is by Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bernard
-Gautier <bernard.gautier@intel.com> and Han Lu <han.lu@intel.com>.
-This document is by Liam Girdwood <liam.r.girdwood@linux.intel.com> and Han Lu
-<han.lu@intel.com>.
+\fBalsabat\fP is by Liam Girdwood <liam.r.girdwood@linux.intel.com>,
+Bernard Gautier <bernard.gautier@intel.com>
+and Han Lu <han.lu@intel.com>.
+This document is by Liam Girdwood <liam.r.girdwood@linux.intel.com>
+and Han Lu <han.lu@intel.com>.

--KiFdB+TBweoewYi8--
