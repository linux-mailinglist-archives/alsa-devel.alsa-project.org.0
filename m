Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFDD9DFC34
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:43:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FFB822A8;
	Mon,  2 Dec 2024 09:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FFB822A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733128995;
	bh=TjtFFUbmF9SvprmzbIAevGeM2ULLDyNU93I2yJpp9hM=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Le+jfZu/8YuFT9gEjVmzZ9ETFzH/ef8VAqOH9bDnB3Qu86mHvv7u1+xA2+yglP1Zz
	 ozU1MtiLP+O3o9a4ut6Syc3FDYENlUPPxO6Zhw4T1vL8YwcWMclSr/iztlTIYSfnzd
	 PwpEUt5xvv0yY9b1PgDS4HH+RQoxGakkQI0CtSFw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69730F805E4; Mon,  2 Dec 2024 09:42:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D9B9F805DF;
	Mon,  2 Dec 2024 09:42:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18072F80236; Wed, 27 Nov 2024 20:47:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1-03.simnet.is (smtp-out1-03.simnet.is
 [194.105.232.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61C10F80116
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 20:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61C10F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=ATRaKhFH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1732736850; x=1764272850;
  h=date:from:to:subject:message-id:mime-version;
  bh=CIQi66sBB1IZZlKCvfKXZHtIbXy7VPVLIncUloaXTzc=;
  b=ATRaKhFHOdoQor3bohePbSYuYpaxEIj0iPCYHVpchPX7R3KKaTTsl0XD
   nGK/sVU+4xeek52T/Rq8E22Bg7oXbTstBkfeC0zpkuWNdo9tXqZ4b00FA
   r2l60WcHy5uq5whxdYZuOgejG2tU6LzjY8x8cKF8DLK8ipVssz0+ru14W
   ks/Thk0+wsUx0heRHv8xXA0yQaBm6/dg9KS9t/gxn0MXKpXiu8KVrlesd
   Ei4bmOk21YDMwUc2VnT/XUktcR5FNtOXaBP6HH8tiwIYo1qvoLS5QBru6
   BVOrGass5mk0qJw4PeYUHzJBW0Unuh/QNqZ+ikDBVt/3x1zU3/wGej5Sk
   A==;
X-CSE-ConnectionGUID: br7mVZh+R32fVsNmrIfNrg==
X-CSE-MsgGUID: tkepOqnsTSmx8Q5rTeLNQg==
Authentication-Results: smtp-out-03.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2G7DwD7c0dnhVfoacJaHgEBCxIMQIFIC4IcKH2BZIglj?=
 =?us-ascii?q?h+BFpA3jlMHAQEBDzETBAEBAwEDgVCDMIpjKDcGDgECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEBAQ4BAQYBAQEBAQEGBwIQAQEBAUAOO4U1Rg2DFoIWLAKBKYEMfIMoAYJks?=
 =?us-ascii?q?WmBNIEBgxzbF4FdEIFIhWqCYgGFaYR3PAaCDYEVMgOBBlAdSgdvhG+GGASCJ?=
 =?us-ascii?q?Bx5OoEzDIEnZBIlgROBB4ENgV8ugWGBa4gaglWBISmCC4FKi2lIgSEDWSERA?=
 =?us-ascii?q?VUTDQoLBwWBdgOCTHorgQuBFzqBfoETSoNKgUJGPTeCE2lLNwINAjaCJH2CT?=
 =?us-ascii?q?YMYggGEaYRchjAoHTYKAwsYDUgRLDcUG0RuB6BIR4JQCTAPFB8BASwEDBwZA?=
 =?us-ascii?q?xkBB0Y2IwoMBwMFKwIEBAsMDAUBGxkLESkDkjxYCY9GgUShXIQkhluDMIILl?=
 =?us-ascii?q?UczIoNigVeRaAw6kkiYe6NWHBk3hGaBfYIALAcaCDA7gmcJSRkPjgcjAxaBD?=
 =?us-ascii?q?AEChyfDeng7AgcLAQEDCZEWLYFQAQE?=
IronPort-PHdr: A9a23:oWO6Txd8sItHCjPBiRwAgHJKlGM/noqcDmcuAvsPkLdSauGk4oinZ
 BeZ/vRoilLVG4TAuLpIiOvT5qbnX2FIoZOMq2sLf5EEURgZwd4XkAotDI/NCUDyIPPwKS1vG
 sNEWTdY
IronPort-Data: A9a23:pNlXDaj0BVqkjNHcpvFCrgiRX161AxcKZh0ujC45NGQN5FlGYwSz7
 tYtKTreYZDXMzzrLps0dtz2qRtPp5fleuUTHQNvrSE1RX8b9ZCVXtmUfx/5bnLJdsCaEEw+t
 MhBZISefJA4Q3LQrxyhObG4oSUtjfnQGuOkWL/IYCshGVBpQU/N5f4bd8sR2+aE1vDgWVrQ4
 bse2vHiBWNJstIM3gg84rqHoQIp5bL+uT0W1rBVTf4XsgbVyCdNXcJEdarvfnfySINYTrWzH
 rmakOywoGmHpU58UoL4yeylKkEBHrKONlHU0iJfUviu3BQc93w+gvpT2JbwEatyo2zhc4dZk
 Y8Q5cTYpX4VA5DxdMQhvzhwQnx3MfQcqeOcKHbn6sbCnkGbLSWzn/hjBRhrNoBApOheDDAV/
 5T0ChhUNUnb2LjeLJFX6wVIrp5+RCU+FNpH4hmM9RmAULB+B8iFGv2WjTNh9G9YrthUGvrDb
 NYuZzNqbRDRCzVCIV5/5KgWxY9EvVGhNWQCwL6pjfBvuTSKlVYuiOOF3Of9I7Rme+0Ezy50m
 Uqel4jJKklyHMCSzzOD7kWtiofn9c8scNtPfFEQ3qcCbGy7ngT/OjVPPbeIiaXRZnqFZj5qA
 xd8FhzCAkQF3BfDotHVB3VUqZMf1/IWc4I4/+YSsGlhxkdIiuow66dtojNpMbQbWMEKqTMC3
 EXWmu3bBX9V6+ebd2m78621oxWoNn1ARYMCTXdsoQot/dj4vMQhjxfXVNFzAevt15vrGCrsh
 TGRxMQ8r+xC0YhSj/j9pwudxWLzznTKZlddCgH/VG2N9QJ8YoO5IY2zgbTexawfd9zEFQTc1
 JQCs9Sd4fgpFJeWqBeIULU0QauV6tKjCTKJ1DaDGLF6q2T8pC//FWxK2xl3IFxgd8oJZzLtS
 EbXogoU/IVUPnahcelweY3ZNigx5bbhDsigRPHRdsBJcok0LFbB4iB1eQiRxAgBjXTAj4k1I
 8ieT/SsTkxBU6pZ1xyzXcYT96Ukk3VWKXzoebj3yBGu0Ly7bXGTSKsYPFbmUgzfxP/byOky2
 4oOX/Zm2ylivPvCjj7/0LV7ELznBWY6Hoyzuc1SbvSEMhsjQDhnFf7K3fUgYOSJfpi5dM+Wp
 hlRuWcBmTITYEErzy3RMxiPj5u0BP5CQYoTZ3BEALpR8yFLjXyTxKkebYArWrIs6fZuy/V5J
 9FcJJ7aXKgSG2yeom1FBXUYkGCEXEj77e5pF3f9CAXTg7Y6GlGhFiLMJ1e0qnBQZsZJnZRi+
 uPIOvznrWorHFgyXZmHNJpDPnu0vHwU0OJ8N3Yk0fEOEHgABLNCcnSr5tduep1kAUuYnFOyi
 V3JaSr0UMGW+OfZBvGS3vjc9+9E0oJWQiJnIoUsxezoZXCLpzL8mdcovSThVWm1aV4YMZ6KP
 Y19p8wQ+tVe9LqWm+KQy4pW8J8=
IronPort-HdrOrdr: A9a23:shuDiqiaUqhbkY1L2uej6UpLr3BQXs8ji2hC6mlwRA09TyW9rb
 HJoB17726StN9/YhAdcLy7WJVoIkmskaKdg7NhWItKNTOO0ADDQe0Mg7cKqAeQeREWmNQttp
 uIC5IOceHNMQ==
X-Talos-CUID: 9a23:RFssTWw8h8HYVmOVCTAmBgUeAJ8gTE/dj02LeUGGEkBsUpybb0WfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Ajh3yOA0wBwO0j/Ole/ilqToMTTUj/6ejEGcUl44?=
 =?us-ascii?q?6gMyUZRUtIQuQqBKOTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,190,1728950400";
   d="1'?diff'?scan'208";a="27325355"
Received: from vist-zimproxy-01.vist.is ([194.105.232.87])
  by smtp-out-03.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 19:47:27 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id D462D40108CA
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 19:47:26 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 6sfakQixKYnb for <alsa-devel@alsa-project.org>;
 Wed, 27 Nov 2024 19:47:25 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id 7987F40108D4
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 19:47:25 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id qnj6inl3FcDV for <alsa-devel@alsa-project.org>;
 Wed, 27 Nov 2024 19:47:25 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTPS id 56BCB40108CA
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 19:47:25 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1tGO0V-000000001KQ-32jl
	for alsa-devel@alsa-project.org;
	Wed, 27 Nov 2024 19:47:27 +0000
Date: Wed, 27 Nov 2024 19:47:27 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: aplay.1: Some remarks and editorial changes for this man page
Message-ID: <173273656524.5040.9496359435651431008.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EUNYVUbNaOBjYOdb"
Content-Disposition: inline
X-Mailer: reportbug 13.0.2
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XHVJE4FNPC6I7PYL4Z7DEUCZIJHZWQPC
X-Message-ID-Hash: XHVJE4FNPC6I7PYL4Z7DEUCZIJHZWQPC
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:42:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHVJE4FNPC6I7PYL4Z7DEUCZIJHZWQPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EUNYVUbNaOBjYOdb
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


troff: backtrace: file '<stdin>':3
troff:<stdin>:3: warning: trailing space in the line
troff: backtrace: file '<stdin>':87
troff:<stdin>:87: warning: trailing space in the line
troff: backtrace: file '<stdin>':91
troff:<stdin>:91: warning: trailing space in the line
troff: backtrace: file '<stdin>':95
troff:<stdin>:95: warning: trailing space in the line
troff: backtrace: file '<stdin>':99
troff:<stdin>:99: warning: trailing space in the line
troff: backtrace: file '<stdin>':103
troff:<stdin>:103: warning: trailing space in the line
troff: backtrace: file '<stdin>':107
troff:<stdin>:107: warning: trailing space in the line
troff: backtrace: file '<stdin>':111
troff:<stdin>:111: warning: trailing space in the line
troff: backtrace: file '<stdin>':114
troff:<stdin>:114: warning: trailing space in the line
troff: backtrace: file '<stdin>':115
troff:<stdin>:115: warning: trailing space in the line
troff: backtrace: file '<stdin>':118
troff:<stdin>:118: warning: trailing space in the line
troff: backtrace: file '<stdin>':121
troff:<stdin>:121: warning: trailing space in the line
troff: backtrace: file '<stdin>':131
troff:<stdin>:131: warning: trailing space in the line
troff: backtrace: file '<stdin>':215
troff:<stdin>:215: warning: trailing space in the line
troff: backtrace: file '<stdin>':225
troff:<stdin>:225: warning: trailing space in the line
troff: backtrace: file '<stdin>':258
troff:<stdin>:258: warning: trailing space in the line

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

--EUNYVUbNaOBjYOdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.aplay.1"

Input file is aplay.1

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

Output from "mandoc -T lint  aplay.1 ": (shortened list)

      9 input text line longer than 80 bytes
     16 whitespace at end of input line

-.-.

Output from "test-groff -mandoc -t -ww -b -z aplay.1 ": (shortened list)

     16 trailing space in the line

-.-.

Output from "mandoc -T lint  aplay.1 ":

mandoc: aplay.1:3:67: STYLE: whitespace at end of input line
mandoc: aplay.1:20:119: STYLE: input text line longer than 80 bytes: If filename is not s...
mandoc: aplay.1:78:111: STYLE: input text line longer than 80 bytes: The default is zero,...
mandoc: aplay.1:84:112: STYLE: input text line longer than 80 bytes: The default is zero,...
mandoc: aplay.1:87:31: STYLE: whitespace at end of input line
mandoc: aplay.1:91:33: STYLE: whitespace at end of input line
mandoc: aplay.1:92:101: STYLE: input text line longer than 80 bytes: Open the audio devic...
mandoc: aplay.1:93:91: STYLE: input text line longer than 80 bytes: If this option is no...
mandoc: aplay.1:95:34: STYLE: whitespace at end of input line
mandoc: aplay.1:97:87: STYLE: input text line longer than 80 bytes: If no period time an...
mandoc: aplay.1:99:34: STYLE: whitespace at end of input line
mandoc: aplay.1:101:114: STYLE: input text line longer than 80 bytes: If no buffer time an...
mandoc: aplay.1:103:29: STYLE: whitespace at end of input line
mandoc: aplay.1:105:87: STYLE: input text line longer than 80 bytes: If no period size an...
mandoc: aplay.1:107:29: STYLE: whitespace at end of input line
mandoc: aplay.1:109:114: STYLE: input text line longer than 80 bytes: If no buffer time an...
mandoc: aplay.1:111:34: STYLE: whitespace at end of input line
mandoc: aplay.1:114:34: STYLE: whitespace at end of input line
mandoc: aplay.1:115:48: STYLE: whitespace at end of input line
mandoc: aplay.1:118:34: STYLE: whitespace at end of input line
mandoc: aplay.1:121:33: STYLE: whitespace at end of input line
mandoc: aplay.1:131:34: STYLE: whitespace at end of input line
mandoc: aplay.1:215:66: STYLE: whitespace at end of input line
mandoc: aplay.1:225:43: STYLE: whitespace at end of input line
mandoc: aplay.1:260:10: STYLE: whitespace at end of input line

-.-.

Remove space characters at the end of lines.

Use "git apply ... --whitespace=fix" to fix extra space issues, or use
global configuration "core.whitespace".

3:arecord, aplay \- command\-line sound recorder and player for ALSA 
87:\fI\-M, \-\-mmap\fP            
91:\fI\-N, \-\-nonblock\fP          
95:\fI\-F, \-\-period\-time=#\fP     
99:\fI\-B, \-\-buffer\-time=#\fP     
103:\fI\-\-period\-size=#\fP     
107:\fI\-\-buffer\-size=#\fP     
111:\fI\-A, \-\-avail\-min=#\fP       
114:\fI\-R, \-\-start\-delay=#\fP     
115:Delay for automatic PCM start is # microseconds 
118:\fI\-T, \-\-stop\-delay=#\fP      
121:\fI\-v, \-\-verbose\fP           
131:\fI\-I, \-\-separate\-channels\fP 
215:When recording, SIGINT, SIGTERM and SIGABRT will close the output 
225:22050\-Hz, mono, 8\-bit, Mu\-Law .au file. 
260:.SH BUGS 

-.-.

Add a (no-break, "\ " or "\~") space between a number and a unit,
as these are not one entity.

14:automatically split before the 2GB filesize.

-.-.

Change a HYPHEN-MINUS (code 0x2D) to a minus(-dash) (\-),
if it
is in front of a name for an option,
is a symbol for standard input,
is a single character used to indicate an option,
or is in the NAME section (man-pages(7)).
N.B. - (0x2D), processed as a UTF-8 file, is changed to a hyphen
(0x2010, groff \[u2010] or \[hy]) in the output.

79:Either '-d' or '-s' option is available exclusively.
85:Either '-d' or '-s' option is available exclusively.
148:\fI-m, \-\-chmap=ch1,ch2,...\fP

-.-.

Add a comma (or \&) after "e.g." and "i.e.", or use English words
(man-pages(7)).
Abbreviation points should be protected against being interpreted as
an end of sentence, if they are not, and that independent of the
current place on the line.

211:Disables recovery attempts when errors (e.g. xrun) are encountered; the

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


12:driver. It supports several file formats and multiple soundcards with
13:multiple devices. If recording with interleaved mode samples the file is
16:\fBaplay\fP is much the same, only it plays instead of recording. For
20:If filename is not specified, the standard output or input is used. The \fBaplay\fP utility accepts multiple filenames.
40:Quiet mode. Suppress messages (not sound :))
71:Sampling rate in Hertz. The default rate is 8000 Hertz.
92:Open the audio device in non\-blocking mode. If the device is busy the program will exit immediately.
204:Dump hw_params of the device preconfigured status to stderr. The dump
211:Disables recovery attempts when errors (e.g. xrun) are encountered; the

-.-.

Split lines longer than 80 characters into two or more lines.
Appropriate break points are the end of a sentence and a subordinate
clause; after punctuation marks.


Line 20, length 119

If filename is not specified, the standard output or input is used. The \fBaplay\fP utility accepts multiple filenames.

Line 78, length 111

The default is zero, so if this option is omitted then the record/playback process will run until it is killed.

Line 84, length 112

The default is zero, so if this options is omitted then the record/playback process will run until it is killed.

Line 92, length 101

Open the audio device in non\-blocking mode. If the device is busy the program will exit immediately.

Line 93, length 91

If this option is not set the program will block until the audio device is available again.

Line 97, length 87

If no period time and no period size is given then a quarter of the buffer time is set.

Line 101, length 114

If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.

Line 105, length 87

If no period size and no period time is given then a quarter of the buffer size is set.

Line 109, length 114

If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.

Line 249, length 99

\fBarecord \-f cd \-t wav \-\-max\-file\-time 3600 \-\-use-strftime %Y/%m/%d/listen-%H-%M-%v.wav\fP


-.-.

Name of a manual is set in bold, the section in roman.
See man-pages(7).

257:amixer(1)

-.-.

Use a no-break space between a number and a (SI) unit

101:If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.
109:If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.

-.-.

Use a hyphen between a number and the unit (name) "bit",
see "man-pages(7)", item "Terms to avoid".

64:\-f cd (16 bit little endian, 44100, stereo) [\-f S16_LE \-c2 \-r44100]
65:\-f cdr (16 bit big endian, 44100, stereo) [\-f S16_BE \-c2 \-r44100]
66:\-f dat (16 bit little endian, 48000, stereo) [\-f S16_LE \-c2 \-r48000]

-.-.

Two or more space charaters between printable characters.

When the distance is between sentences,
start the beginning of the second one on a separate line
("semantic newline").

123:This option is accumulative.  The VU meter is displayed when this
132:One file for each channel.  This option disables max\-file\-time
133:and use\-strftime, and ignores SIGUSR1.  The stereo VU meter is
137:Playback.  This is the default if the program is invoked
141:Record.  This is the default if the program is invoked
149:Give the channel map to override or follow.  Pass channel position
185:close it and open a new output file.  Default is the maximum
187:This option has no effect if  \-\-separate\-channels is
196:the strftime facility whenever the output file is opened.  The
198:the month, %H hour, %M minute and %S second.  In addition, %v is
199:the file number, starting at 1.  When this option is specified,
216:file and exit.  SIGUSR1 will close the output file, open a new one,
217:and continue recording.  However, SIGUSR1 does not work with
244:per second, 8 bits per sample.  Start a new file every
245:30 seconds.  File names are mon\-nn.wav, where nn increases
246:from 01.  The file after mon\-99.wav is mon\-100.wav.
250:Record in stereo from the default audio source.  Create a new file
251:every hour.  The files are placed in directories based on their start dates

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -ww -b -z ":

troff: backtrace: file '<stdin>':3
troff:<stdin>:3: warning: trailing space in the line
troff: backtrace: file '<stdin>':87
troff:<stdin>:87: warning: trailing space in the line
troff: backtrace: file '<stdin>':91
troff:<stdin>:91: warning: trailing space in the line
troff: backtrace: file '<stdin>':95
troff:<stdin>:95: warning: trailing space in the line
troff: backtrace: file '<stdin>':99
troff:<stdin>:99: warning: trailing space in the line
troff: backtrace: file '<stdin>':103
troff:<stdin>:103: warning: trailing space in the line
troff: backtrace: file '<stdin>':107
troff:<stdin>:107: warning: trailing space in the line
troff: backtrace: file '<stdin>':111
troff:<stdin>:111: warning: trailing space in the line
troff: backtrace: file '<stdin>':114
troff:<stdin>:114: warning: trailing space in the line
troff: backtrace: file '<stdin>':115
troff:<stdin>:115: warning: trailing space in the line
troff: backtrace: file '<stdin>':118
troff:<stdin>:118: warning: trailing space in the line
troff: backtrace: file '<stdin>':121
troff:<stdin>:121: warning: trailing space in the line
troff: backtrace: file '<stdin>':131
troff:<stdin>:131: warning: trailing space in the line
troff: backtrace: file '<stdin>':215
troff:<stdin>:215: warning: trailing space in the line
troff: backtrace: file '<stdin>':225
troff:<stdin>:225: warning: trailing space in the line
troff: backtrace: file '<stdin>':258
troff:<stdin>:258: warning: trailing space in the line


--EUNYVUbNaOBjYOdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="aplay.1.diff"

--- aplay.1	2024-11-27 17:45:09.168911693 +0000
+++ aplay.1.new	2024-11-27 19:40:50.639709777 +0000
@@ -1,6 +1,6 @@
 .TH APLAY 1 "1 January 2010"
 .SH NAME
-arecord, aplay \- command\-line sound recorder and player for ALSA 
+arecord, aplay \- command\-line sound recorder and player for ALSA
 soundcard driver
 .SH SYNOPSIS
 \fBarecord\fP [\fIflags\fP] [filename]
@@ -9,15 +9,20 @@ soundcard driver
 
 .SH DESCRIPTION
 \fBarecord\fP is a command\-line soundfile recorder for the ALSA soundcard
-driver. It supports several file formats and multiple soundcards with
-multiple devices. If recording with interleaved mode samples the file is
-automatically split before the 2GB filesize.
-
-\fBaplay\fP is much the same, only it plays instead of recording. For
-supported soundfile formats, the sampling rate, bit depth, and so
-forth can be automatically determined from the soundfile header.
-
-If filename is not specified, the standard output or input is used. The \fBaplay\fP utility accepts multiple filenames.
+driver.
+It supports several file formats
+and multiple soundcards with multiple devices.
+If recording with interleaved mode samples
+the file is automatically split before the 2\~GB filesize.
+
+\fBaplay\fP is much the same, only it plays instead of recording.
+For supported soundfile formats,
+the sampling rate, bit depth, and so forth
+can be automatically determined from the soundfile header.
+
+If filename is not specified,
+the standard output or input is used.
+The \fBaplay\fP utility accepts multiple filenames.
 
 .SH OPTIONS
 .TP
@@ -61,100 +66,122 @@ Some of these may not be available on se
 .br
 The available format shortcuts are:
 .nf
-\-f cd (16 bit little endian, 44100, stereo) [\-f S16_LE \-c2 \-r44100]
-\-f cdr (16 bit big endian, 44100, stereo) [\-f S16_BE \-c2 \-r44100]
-\-f dat (16 bit little endian, 48000, stereo) [\-f S16_LE \-c2 \-r48000]
+\-f cd (16-bit little endian, 44100, stereo) [\-f S16_LE \-c2 \-r44100]
+\-f cdr (16-bit big endian, 44100, stereo) [\-f S16_BE \-c2 \-r44100]
+\-f dat (16-1251bit little endian, 48000, stereo) [\-f S16_LE \-c2 \-r48000]
 .fi
 If no format is given U8 is used.
 .TP
 \fI\-r, \-\-rate=#<Hz>\fP
-Sampling rate in Hertz. The default rate is 8000 Hertz.
-If the value specified is less than 300, it is taken as the rate in kilohertz.
-Valid values are 2000 through 192000 Hertz.
+Sampling rate in hertz.
+The default rate is 8000 hertz.
+If the value specified is less than 300,
+it is taken as the rate in kilohertz.
+Valid values are 2000 through 192000 hertz.
 .TP
 \fI\-d, \-\-duration=#\fP
 Interrupt after # seconds.
 A value of zero means infinity.
-The default is zero, so if this option is omitted then the record/playback process will run until it is killed.
-Either '-d' or '-s' option is available exclusively.
+The default is zero,
+so if this option is omitted
+then the record/playback process will run until it is killed.
+Either '\-d' or '\-s' option is available exclusively.
 .TP
 \fI\-s, \-\-samples=#\fP
 Interrupt after transmission of # PCM frames.
 A value of zero means infinity.
-The default is zero, so if this options is omitted then the record/playback process will run until it is killed.
-Either '-d' or '-s' option is available exclusively.
+The default is zero,
+so if this options is omitted
+then the record/playback process will run until it is killed.
+Either '\-d' or '\-s' option is available exclusively.
 .TP
-\fI\-M, \-\-mmap\fP            
+\fI\-M, \-\-mmap\fP
 Use memory\-mapped (mmap) I/O mode for the audio stream.
-If this option is not set, the read/write I/O mode will be used.
+If this option is not set,
+the read/write I/O mode will be used.
 .TP
-\fI\-N, \-\-nonblock\fP          
-Open the audio device in non\-blocking mode. If the device is busy the program will exit immediately.
-If this option is not set the program will block until the audio device is available again.
+\fI\-N, \-\-nonblock\fP
+Open the audio device in non\-blocking mode.
+If the device is busy the program will exit immediately.
+If this option is not set
+the program will block until the audio device is available again.
 .TP
-\fI\-F, \-\-period\-time=#\fP     
+\fI\-F, \-\-period\-time=#\fP
 Distance between interrupts is # microseconds.
-If no period time and no period size is given then a quarter of the buffer time is set.
-.TP
-\fI\-B, \-\-buffer\-time=#\fP     
-Buffer duration is # microseconds
-If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.
+If no period time and no period size is given
+then a quarter of the buffer time is set.
 .TP
-\fI\-\-period\-size=#\fP     
-Distance between interrupts is # frames
-If no period size and no period time is given then a quarter of the buffer size is set.
+\fI\-B, \-\-buffer\-time=#\fP
+Buffer duration is # microseconds.
+If no buffer time and no buffer size is given
+then the maximal allowed buffer time,
+but not more than 500\~ms,
+is set.
+.TP
+\fI\-\-period\-size=#\fP
+Distance between interrupts is # frames.
+If no period size and no period time is given
+then a quarter of the buffer size is set.
 .TP
-\fI\-\-buffer\-size=#\fP     
+\fI\-\-buffer\-size=#\fP
 Buffer duration is # frames
-If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.
+If no buffer time and no buffer size is given
+then the maximal allowed buffer time,
+but not more than 500\~ms,
+is set.
 .TP
-\fI\-A, \-\-avail\-min=#\fP       
+\fI\-A, \-\-avail\-min=#\fP
 Min available space for wakeup is # microseconds
 .TP
-\fI\-R, \-\-start\-delay=#\fP     
-Delay for automatic PCM start is # microseconds 
+\fI\-R, \-\-start\-delay=#\fP
+Delay for automatic PCM start is # microseconds
 (relative to buffer size if <= 0)
 .TP
-\fI\-T, \-\-stop\-delay=#\fP      
+\fI\-T, \-\-stop\-delay=#\fP
 Delay for automatic PCM stop is # microseconds from xrun
 .TP
-\fI\-v, \-\-verbose\fP           
+\fI\-v, \-\-verbose\fP
 Show PCM structure and setup.
-This option is accumulative.  The VU meter is displayed when this
-is given twice or three times.
+This option is accumulative.
+The VU meter is displayed
+when this is given twice or three times.
 .TP
 \fI\-V, \-\-vumeter=TYPE\fP
-Specifies the VU\-meter type, either \fIstereo\fP or \fImono\fP.
+Specifies the VU\-meter type,
+either \fIstereo\fP or \fImono\fP.
 The stereo VU\-meter is available only for 2\-channel stereo samples
 with interleaved format.
 .TP
-\fI\-I, \-\-separate\-channels\fP 
-One file for each channel.  This option disables max\-file\-time
-and use\-strftime, and ignores SIGUSR1.  The stereo VU meter is
-not available with separate channels.
+\fI\-I, \-\-separate\-channels\fP
+One file for each channel.
+This option disables max\-file\-time
+and use\-strftime, and ignores SIGUSR1.
+The stereo VU meter is not available with separate channels.
 .TP
 \fI\-P\fP
-Playback.  This is the default if the program is invoked
-by typing aplay.
+Playback.
+This is the default
+if the program is invoked by typing aplay.
 .TP
 \fI\-C\fP
-Record.  This is the default if the program is invoked
-by typing arecord.
+Record.
+This is the default
+if the program is invoked by typing arecord.
 .TP
 \fI\-i, \-\-interactive\fP
 Allow interactive operation via stdin.
 Currently only pause/resume via space or enter key is implemented.
 .TP
-\fI-m, \-\-chmap=ch1,ch2,...\fP
-Give the channel map to override or follow.  Pass channel position
-strings like \fIFL\fP, \fIFR\fP, etc.
-
-If a device supports the override of the channel map, \fBaplay\fP
-tries to pass the given channel map.
-If it doesn't support the channel map override but still it provides
-the channel map information, \fBaplay\fP tries to rearrange the
-channel order in the buffer to match with the returned channel map
-from the device.
+\fI\-m, \-\-chmap=ch1,ch2,...\fP
+Give the channel map to override or follow.
+Pass channel position strings like \fIFL\fP, \fIFR\fP, etc.
+
+If a device supports the override of the channel map,
+\fBaplay\fP tries to pass the given channel map.
+If it doesn't support the channel map override
+but still it provides the channel map information,
+\fBaplay\fP tries to rearrange the channel order in the buffer
+to match with the returned channel map from the device.
 .TP
 \fI\-\-disable\-resample\fP
 Disable automatic rate resample.
@@ -177,26 +204,31 @@ Expression for validation is: coef * (bu
 Minimum value is 1.
 .TP
 \fI\-\-test\-nowait\fP
-Do not wait for the ring buffer \(hy eats the whole CPU.
+Do not wait for the ring buffer \(en eats the whole CPU.
 .TP
 \fI\-\-max\-file\-time\fP
-While recording, when the output file has been accumulating
-sound for this long,
-close it and open a new output file.  Default is the maximum
-size supported by the file format: 2 GiB for WAV files.
-This option has no effect if  \-\-separate\-channels is
-specified.
+While recording,
+when the output file has been accumulating sound for this long,
+close it and open a new output file.
+Default is the maximum size supported by the file format:
+2\~GiB for WAV files.
+This option has no effect
+if  \-\-separate\-channels is specified.
 .TP
 \fI\-\-process\-id\-file <file name>\fP
-aplay writes its process ID here, so other programs can
-send signals to it.
+aplay writes its process ID here,
+so other programs can send signals to it.
 .TP
 \fI\-\-use\-strftime\fP
-When recording, interpret %\-codes in the file name parameter using
-the strftime facility whenever the output file is opened.  The
-important strftime codes are: %Y is the year, %m month, %d day of
-the month, %H hour, %M minute and %S second.  In addition, %v is
-the file number, starting at 1.  When this option is specified,
+When recording,
+interpret %\-codes in the file name parameter using the strftime facility
+whenever the output file is opened.
+The important strftime codes are:
+%Y is the year, %m month, %d day of the month,
+%H hour, %M minute and %S second.
+In addition,
+%v is the file number, starting at 1.
+When this option is specified,
 intermediate directories for the output file are created automatically.
 This option has no effect if \-\-separate\-channels is specified.
 .TP
@@ -208,21 +240,22 @@ For raw device hw:X this option basicall
 the soundcard.
 .TP
 \fI\-\-fatal\-errors\fP
-Disables recovery attempts when errors (e.g. xrun) are encountered; the
+Disables recovery attempts when errors (e.g., xrun) are encountered; the
 aplay process instead aborts immediately.
 
 .SH SIGNALS
-When recording, SIGINT, SIGTERM and SIGABRT will close the output 
-file and exit.  SIGUSR1 will close the output file, open a new one,
-and continue recording.  However, SIGUSR1 does not work with
-\-\-separate\-channels.
+When recording,
+SIGINT, SIGTERM and SIGABRT will close the output file and exit.
+SIGUSR1 will close the output file, open a new one,
+and continue recording.
+However, SIGUSR1 does not work with \-\-separate\-channels.
 
 .SH EXAMPLES
 
 .TP
 \fBaplay \-c 1 \-t raw \-r 22050 \-f mu_law foobar\fR
 will play the raw file "foobar" as a
-22050\-Hz, mono, 8\-bit, Mu\-Law .au file. 
+22050\-Hz, mono, 8\-bit, Mu\-Law .au file.
 
 .TP
 \fBarecord \-d 10 \-f cd \-t wav \-D copy foobar.wav\fP
@@ -240,24 +273,26 @@ pcm.copy {
 
 .TP
 \fBarecord \-t wav \-\-max\-file\-time 30 mon.wav\fP
-Record from the default audio source in monaural, 8,000 samples
-per second, 8 bits per sample.  Start a new file every
-30 seconds.  File names are mon\-nn.wav, where nn increases
-from 01.  The file after mon\-99.wav is mon\-100.wav.
+Record from the default audio source in monaural,
+8,000 samples per second, 8 bits per sample.
+Start a new file every 30 seconds.
+File names are mon\-nn.wav, where nn increases from 01.
+The file after mon\-99.wav is mon\-100.wav.
 
 .TP
-\fBarecord \-f cd \-t wav \-\-max\-file\-time 3600 \-\-use-strftime %Y/%m/%d/listen-%H-%M-%v.wav\fP
-Record in stereo from the default audio source.  Create a new file
-every hour.  The files are placed in directories based on their start dates
+\fBarecord \-f cd \-t wav \-\-max\-file\-time 3600 \-\-use-strftime \
+%Y/%m/%d/listen-%H-%M-%v.wav\fP
+Record in stereo from the default audio source.
+Create a new file every hour.
+The files are placed in directories based on their start dates
 and have names which include their start times and file numbers.
 
 .SH SEE ALSO
-\fB
-alsamixer(1),
-amixer(1)
-\fP
+.BR \
+alsamixer "(1), " \
+amixer (1)
 
-.SH BUGS 
+.SH BUGS
 Note that .aiff files are not currently supported.
 
 .SH AUTHOR

--EUNYVUbNaOBjYOdb--
