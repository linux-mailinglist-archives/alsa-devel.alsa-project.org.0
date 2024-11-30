Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AF49DFC3C
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:44:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D982BD7;
	Mon,  2 Dec 2024 09:43:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D982BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733129045;
	bh=PXqhSPgpUqCEp38iP89PHDt5AAr7v7b5FBdGF0ftKFY=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gq4qLQY3jf+SyjYIl4FMakQb/xuhU4ip9bXoVw3Ql8CMTKlO7I5KsaW5zBnfqlmy7
	 jh1ASJKSy+o+8WQhcyunY4YdGrrsxFC5cSJvc/wXPESXDgp0XVB+4RIRm4lC+P+wsC
	 L5NaQ1I27yWzeskDTs2OGu/RR8pGZcfH7XCouomw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1E23F80676; Mon,  2 Dec 2024 09:42:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 276DEF80612;
	Mon,  2 Dec 2024 09:42:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A0C9F80236; Sat, 30 Nov 2024 04:19:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1-06.simnet.is (smtp-out1-06.simnet.is
 [194.105.231.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E86F6F80073
	for <alsa-devel@alsa-project.org>; Sat, 30 Nov 2024 04:18:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E86F6F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=HL3z4pj1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1732936740; x=1764472740;
  h=date:from:to:subject:message-id:mime-version;
  bh=o9dUYuQgSDRJRISh0LxG/ccBcJztQQIiPeVb51t6cdo=;
  b=HL3z4pj1T45mxUUKPGeQDhu/XLfzmrTAupbjIM/mpxnevjTi9qh7+kNf
   uc6uwCn9DEbsHwf6oItQwFDnfrYCogp+hQMPoOcbVOwyyIoHfaBnFQYla
   yfTIu04TzQBLogzd8p8h+m7DYmeAiIS8WEH0Asi9TIMKePOQHMObDNd3z
   N+ujQbn+8nd3GrS/Rzglg2wwHv+1h5MuMW6Ob1kXcFXUqX6LcYu6dtVYd
   pq15OG+YI/Y/dR9v36IyByMx7edMEAwIvWrfadQIaH9gl6XBSGzHDDltw
   T0cvE4II1YeXlxS3O/TwzjrECL0QumGqoivHf4t/CcOLwe/EzSFTIfQ0a
   g==;
X-CSE-ConnectionGUID: Yac2mPUJS/eX+8AmbUJOeQ==
X-CSE-MsgGUID: 4mg3tXRQR2aEks48K12aBA==
Authentication-Results: smtp-out-06.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2HkAwCFgUpnhVfoacJaHgEBCxIMQIQXfYFkiCWOH6AgB?=
 =?us-ascii?q?wEBAQ81DwQBAQMBA4FQgzCKZSg4EwECBAEBAQEDAgMBAQEBAQEBAQ4BAQYBA?=
 =?us-ascii?q?QEBAQEGBwIQAQEBAUAOO4U1Rg2DFoIWLAKCNXwngwEBgmSxVYE0gQGDHNsXg?=
 =?us-ascii?q?V0QgUiFaoJiAYVphHc8BoINgRUyA4FzUW+EJUqGGASCJAoSeYFtDIILEiWCG?=
 =?us-ascii?q?oENgV+Deogak3NIgSEDWSERAVUTDQoLBwWBdgOCTHorgQuBFzqBfoETSoNKg?=
 =?us-ascii?q?UJGPTeCE2lLOgINAjaCJH2CTYMYgX+EaYRchi5CHTYKAwsYDUgRLDcUG0RuB?=
 =?us-ascii?q?6BZAUaCTwlzATAMUU42LRMDMAYPHQGUEI9RgUShXIQkhlyDMIILlUczIoNig?=
 =?us-ascii?q?VeRaAw6kkiYe6N0GTeEZoF+gX8sBxoIMDuCZwlJGQ9WjTEjAxaINsF2eDwCB?=
 =?us-ascii?q?wsBAQMJkzIBAQ?=
IronPort-PHdr: A9a23:1+4MCRZeCVlLZYBIoPEJ3NT/LTAChN3EVzX9i7I8jq5WN6O+49G6Y
 grE5PBrgUOPXJ6Io/5Hiu+DtafmVCRA5Juaq3kNfdRKUANNksQZmQEsQYaFBET3IeSsbnk8G
 8JPPGI=
IronPort-Data: A9a23:VaXBaq3cRyd4vKP+XfbD5bl2kn2cJEfYwER7XKvMYbSIYBqW5UVUl
 jlwBDjYJKrIIHykOYwlN8/iqBNS4IjU/mJQOAs9r3o0H34T+ZCVW4rHdRf5YyqbJ5fKHB5qs
 Z4TZ9eQfZw9ESCFq03xP+S5pyQsi/yCTOGiUOXKMHwgHAY1FXhJZX6P4wIcqtcAbY+RX1vU6
 bse2vHiBWNJstIM3gg84riOoxR1sPHztDJe5xoyZP5F1LO1vyVNBZhFevm8JXGgHYVYR7brG
 7nPkb/jrm2HpEsmUYyuw+2gLBUDT+7eYVTRhCENBqH8jxVI/Hw72P0yb/AXOEw/Z1ll5zxU4
 IwlWcuYE1twZcUg4dggbiS0Mx2SHIUX9eefLCm0v8XKlhDMK3Cwz6k0UR1pNoQTpLt6DzFH+
 NUVeWsHBvyhr7vtmerkEIGApSiCwO3DZt53VqRIlGmBZRoeacmeBf2MvZkBhGtYavlmRZ72f
 9AeZSdkcCPOahhOPkZ/IJ8llY9EvFGmG9FjgAzT/PBfD1T7llQrjOG0aouNIbRmeO0M9qqmj
 jOXl4jGKkly2Oy3kVKt7n+qj+nTqiL3MKp6+GqQr6MCbPW7nwT/OTVOPbeJiaDRZn2WB7qzH
 3cpFh8G9sDewqAEou7VBHVUqFbc1vIVtkE5/+cSsGlhwYKMi+qV6/Rtopesp7XKuedvLQHG2
 GNlkPvYDDc1tYWoa0na+4fX/Rq3MxU3CmI7MHpsoQstu7EPoaktjwnTC8RiFbavic3kXGmph
 S6LtzR4hq57YcwjjvTnuwmf3nT2/cKPHlFdCgb/BwpJ6itza6a+Zomu5ESd7O0owIOxFAnb5
 iZVw5n2AOYmUZSCzzC9etw3RriE5O3ZYB6F21dFNsx0n9iq0yX/LdEPsW0WyF1SGs8AYjasb
 ELNtAd57ZtINT6yd6h1bomtTcMwwsDd+c/NSPHPcp9cY51pbgiX7WQ2PAiO3nvx1kk3+U0iB
 XuFWfelBiwfMZlF9327d6RN+Loh+wIZyFqGEPgX0C+b+baZYXeUT5IMP12Pcv014cu4TOP9r
 4c32yyil0Q3bQHuXhQ757L/OngrFhAG6X3etc1MaquRIw9+AmYxGrqJmPU/epd52aVO/gspw
 p1fchEBoLYcrSSWQelvVpyFQOi2NXqYhSliVRHAxX7yhxAejX+Htc/zjacfc7g97/BExvVpV
 fQDcMjoKq0QEW6Wo2lFPcas/dAKmPGXaeSmY3vNjN8XIsYIeuA10oW5I2MDCQFXUnHp7JVWT
 0OIiV+CEPLvuDiO/O6NNKL+kALt1ZTssOdzW0KAItc7Rakf2NUCFsAFtddue5tkAUyamlOyi
 V3MaT9G/ralnmPA2IKS7Uxyh9zyS7MmdqebdkGHhYuL2d7yrjD4kdYbCLrTFd0fPUutkJifi
 Sxu56mUGJU6cJxi6uKQz54DIXoC2ubS
IronPort-HdrOrdr: A9a23:BKdosK8OA6vYzGcDVfxuk+DNI+orL9Y04lQ7vn2ZbSYlFPBw9v
 re+8jzuiWUtN98YhEdcLO7Sc29qBHnhPtICOAqVN/INmSL1wWVxepZnOnfKlPbak7DH5ZmpN
 5dT5Q=
X-Talos-CUID: 9a23:ZTtMe29naknoRQ6Q7d+Vv38dEZogSkD/9zDdEwzoIGNjdZ+yRGbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AEUbNqQ78ykGGReBMyKQQamE2xow05qv1FHA3qK9?=
 =?us-ascii?q?csuSHLnAgGG7HhR6eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,197,1728950400";
   d="1'?diff'?scan'208";a="28226909"
Received: from vist-zimproxy-01.vist.is ([194.105.232.87])
  by smtp-out-06.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2024 03:18:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id CD695401091D
	for <alsa-devel@alsa-project.org>; Sat, 30 Nov 2024 03:18:56 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10032)
 with ESMTP id PmHGf7zGzaJN for <alsa-devel@alsa-project.org>;
 Sat, 30 Nov 2024 03:18:56 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTP id 1139D401091E
	for <alsa-devel@alsa-project.org>; Sat, 30 Nov 2024 03:18:56 +0000 (GMT)
Received: from vist-zimproxy-01.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-01.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id BI77YuVpR3Tg for <alsa-devel@alsa-project.org>;
 Sat, 30 Nov 2024 03:18:56 +0000 (GMT)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-01.vist.is (Postfix) with ESMTPS id F0977401091D
	for <alsa-devel@alsa-project.org>; Sat, 30 Nov 2024 03:18:55 +0000 (GMT)
Received: from bg by kassi.invalid.is with local (Exim 4.98)
	(envelope-from <bg@kassi.invalid.is>)
	id 1tHE0Y-000000001Kz-3lR9
	for alsa-devel@alsa-project.org;
	Sat, 30 Nov 2024 03:18:58 +0000
Date: Sat, 30 Nov 2024 03:18:58 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: arecordmidi.1: Some remarks and editorial changes for this man page
Message-ID: <173293654339.5079.9034847255158350049.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="pET57yk5/eMnCV7S"
Content-Disposition: inline
X-Mailer: reportbug 13.0.2
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZNTC4PLAIXEXXWOJEYJKSYBQENFKEBER
X-Message-ID-Hash: ZNTC4PLAIXEXXWOJEYJKSYBQENFKEBER
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:42:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNTC4PLAIXEXXWOJEYJKSYBQENFKEBER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pET57yk5/eMnCV7S
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


troff: backtrace: file '<stdin>':69
troff:<stdin>:69: warning: trailing space in the line
troff: backtrace: file '<stdin>':77
troff:<stdin>:77: warning: trailing space in the line

Output from "test-nroff  -mandoc -t -K utf8 -rF0 -rHY=0 -ww -b -z ":

troff: backtrace: file '<stdin>':69
troff:<stdin>:69: warning: trailing space in the line
troff: backtrace: file '<stdin>':77
troff:<stdin>:77: warning: trailing space in the line


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

--pET57yk5/eMnCV7S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.arecordmidi.1"

Input file is arecordmidi.1

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

Output from "mandoc -T lint  arecordmidi.1 ": (shortened list)

      2 whitespace at end of input line

-.-.

Output from "test-groff -mandoc -t -ww -b -z arecordmidi.1 ": (shortened list)

      2 trailing space in the line

-.-.

Output from "mandoc -T lint  arecordmidi.1 ":

mandoc: arecordmidi.1:69:73: STYLE: whitespace at end of input line
mandoc: arecordmidi.1:77:67: STYLE: whitespace at end of input line

-.-.

Remove space characters at the end of lines.

Use "git apply ... --whitespace=fix" to fix extra space issues, or use
global configuration "core.whitespace".

69:Metronome sounds are played on channel 10, MIDI notes 33 & 34 (GM2/GS/XG 
77:the numerator and denominator of the time signature as it would be 

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

36:name. A port is specified by its number; for port 0 of a client, the
78:notated. The denominator must be a power of two. Both numbers should be
79:separated by a colon. The time signature is 4:4 by default.

-.-.

Split a punctuation from a single argument, if a two-font macro is meant

32:.I \-p,\-\-port=client:port,...

-.-.

Put a parenthetical sentence, phrase on a separate line,
if not part of a code.
See man-pages(7), item "semantic newline".

arecordmidi.1:47:Possible values are 24, 25, 29.97 (for 30 drop-frame), and 30.
arecordmidi.1:52:in ticks per beat (when using musical tempo) or ticks per frame

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -ww -b -z ":

troff: backtrace: file '<stdin>':69
troff:<stdin>:69: warning: trailing space in the line
troff: backtrace: file '<stdin>':77
troff:<stdin>:77: warning: trailing space in the line


--pET57yk5/eMnCV7S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="arecordmidi.1.diff"

--- arecordmidi.1	2024-11-30 02:53:12.480984416 +0000
+++ arecordmidi.1.new	2024-11-30 03:01:19.447146661 +0000
@@ -29,12 +29,14 @@ Prints the current version.
 Prints a list of possible input ports.
 
 .TP
-.I \-p,\-\-port=client:port,...
+.IR \-p , \-\-port=client:port ,...
 Sets the sequencer port(s) from which events are recorded.
 
-A client can be specified by its number, its name, or a prefix of its
-name. A port is specified by its number; for port 0 of a client, the
-":0" part of the port specification can be omitted.
+A client can be specified by its number,
+its name, or a prefix of its name.
+A port is specified by its number;
+for port 0 of a client,
+the ":0" part of the port specification can be omitted.
 
 .TP
 .I \-b,\-\-bpm=beats
@@ -44,12 +46,16 @@ The default value is 120 BPM.
 .TP
 .I \-f,\-\-fps=frames
 Sets the SMPTE resolution, in frames per second.
-Possible values are 24, 25, 29.97 (for 30 drop-frame), and 30.
+Possible values are 24, 25, 29.97
+(for 30 drop-frame),
+and 30.
 
 .TP
 .I \-t,\-\-ticks=ticks
 Sets the resolution of timestamps (ticks) in the MIDI file,
-in ticks per beat (when using musical tempo) or ticks per frame
+in ticks per beat
+(when using musical tempo)
+or ticks per frame
 (when using SMPTE timing).
 The default value is 384 ticks/beat or 40 ticks/frame, respectively.
 
@@ -66,17 +72,19 @@ will generate a "format 0" file.
 .I \-m,\-\-metronome=client:port
 Plays a metronome signal on the specified sequencer port.
 
-Metronome sounds are played on channel 10, MIDI notes 33 & 34 (GM2/GS/XG 
+Metronome sounds are played on channel 10, MIDI notes 33 & 34 (GM2/GS/XG
 metronome standard notes), with velocity 100 and duration 1.
 
 .TP
 .I \-i,\-\-timesig=numerator:denominator
 Sets the time signature for the MIDI file and metronome.
 
-The time signature is specified as usual with two numbers, representing
-the numerator and denominator of the time signature as it would be 
-notated. The denominator must be a power of two. Both numbers should be
-separated by a colon. The time signature is 4:4 by default.
+The time signature is specified as usual with two numbers,
+representing the numerator and denominator of the time signature
+as it would be notated.
+The denominator must be a power of two.
+Both numbers should be separated by a colon.
+The time signature is 4:4 by default.
 
 .SH AUTHOR
 Clemens Ladisch <clemens@ladisch.de>

--pET57yk5/eMnCV7S--
