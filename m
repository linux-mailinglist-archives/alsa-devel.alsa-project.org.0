Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C552AAEB8CD
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:24:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A6860219;
	Fri, 27 Jun 2025 15:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A6860219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030646;
	bh=y5DwzlYEKcqa2/c/4R+iRRkS+6VDCljORpq7qH5U9rc=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q487y465ZI65CM2MlDB67ioBsbizsQCo7WZhsuJVcjJMLo4I1kuQHqT+K14hvuOF3
	 s+RmFIAKm4JELoavND4NirHqc2YxWP48FmUnIsnTB/fkZUMI+gcRgTsvuh8QlZg1rS
	 +Lm9/sCJAHVN28RweuuASWFVcWinuiChXjKBZ5SQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58A97F80630; Fri, 27 Jun 2025 15:23:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5097AF8024C;
	Fri, 27 Jun 2025 15:23:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD378F804B2; Fri, 20 Jun 2025 20:44:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2-04.simnet.is (smtp-out2-04.simnet.is
 [194.105.232.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74809F80038
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 20:44:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74809F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=simnet.is header.i=@simnet.is header.a=rsa-sha256
 header.s=sel1 header.b=ZPFwAZ+L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=simnet.is; i=@simnet.is; q=dns/txt; s=sel1;
  t=1750445052; x=1781981052;
  h=date:from:to:subject:message-id:mime-version;
  bh=9I5YOYx7YnGWOS4NFc2enG8WXaxDaI358Nc3AXCbva0=;
  b=ZPFwAZ+LUwWb8t8XygKTPJaXv6OiH9Rk0LoYkLqs/KIBHwAzMJp/3qmV
   vEy9w+kAI9y0/rPiIZk/wvW5gLia3Jn3dR+X7GtLqfNYY1O0tHcBppL4R
   V+xO4yJkJRYNR0GGomARPeK2RGrhtNgBK4DGvkTFpIAQskvVKX5M+7QSo
   V6ko2dNmihZg0YxHmrPkdRM/6mVF7GIczBr82OxxMFJfPII1jV6IBRDd4
   JkDtSr6oqOfUMHSSCZnFd8fT5M+ET5l/Jcj1BZ3zrCdAkozM6toIIzC41
   EPBV4la4nN7kzMooPPFGg9Kz0fvI/r356+m/UrPSsqizQWgPE+DF5/K+r
   Q==;
X-CSE-ConnectionGUID: uUsT4chpTaCD8S7XZDi/ng==
X-CSE-MsgGUID: 4MpEsntnS+CuzHHb7bnEwA==
Authentication-Results: smtp-out-04.simnet.is;
 dkim=none (message not signed) header.i=none
X-SBRS: 3.3
X-IPAS-Result: =?us-ascii?q?A2FsAAClqVVohdNiq09aHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?UIEAQELAYIbKIEAgWWIJI4igRaQNY5VBwEBAQ8xIAQBAQMBA4UAi2soNwYOA?=
 =?us-ascii?q?QIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBgEBAQEBAQYHAhABAQEBQA47hTVGD?=
 =?us-ascii?q?YMWghYsAoI1fIMpAYJurkmBNIEBgxzbG4FeEIFJAYVsgmQBhWyEdzwGgg2BF?=
 =?us-ascii?q?TIDgQZQHUoHb4RvhhgEgg0XgQIUgkIdEpYWSIEeA1ksAVUTDQoLBwWBYwM1D?=
 =?us-ascii?q?AsuFTI8Mh2BJ4crhEUrT4UggSaDXiRwDwaBIRg2CgMLGA1IESw3FBtEbgeRb?=
 =?us-ascii?q?oIrCS8BDxQfAQEwDDUDGQEHfCMKDAcDBSsCBAQLDBIuIpJtWAmPWIFEjFGTW?=
 =?us-ascii?q?IE+hCWGXYMzgg2VUDMig2KBV5FwDDuST5kEpAEZN4RpgX6CACwHGggwO4JnC?=
 =?us-ascii?q?UkZD44HIwMWgRIBAocmsnp4PAIHCwEBAwmQDC2BUAEB?=
IronPort-PHdr: A9a23:xiyABR/LLghzx/9uWA7oyV9kXcBGk67xIhZQ7Yc7zuoSNL+i+pLvI
 Are/qYlgFzIWNDd7PRJw6rTvrv7UGMNqZCGrDgZcZNKWhNEwcUblgAtGoiEXEv8KvOCUg==
IronPort-Data: A9a23:LwhEEaBkx0cCiBVW/8/kw5YqxClBgxIJ4kV8jC+esSAN5kpxj25ok
 zNBRzzEeOHbIj6kMsd3WDmFhUMAvseAz99qTAFt+XxjRn5A8JuVCIrFcEn+MX+fdJOYR0g4s
 JRGMoiffM1uEy6N/xzxa7Hop3Ami/7UGOXyAuSs1kydPeNBYH5JZUVLxLJi3uaE+OSEPj9h0
 D+KT6f3MUeh0i8yayQY6qyNwP8ElP7/6GIR71E1PvoW5AXQm3QeXc1Gfqzscnb0S4cFErWwH
 uvKx7vnrm6G9EYhB46pzuuiLBBTGrCMNlHX1nAKAfPKbnSu3sAX+v9T2K00MhoN211l5uxM9
 emh3HDIpW0BMaDKlf4UV19SDi5lVUEt0Ladfia16ZSZkxaZeCrmnPhnV0xvZNREq+t+UDwfq
 aISeW4DPxrei727zb+3ErI0jJspJ5fhMIgR5S9skzjQVKxOrfwvO0nvzYYwMGAY35EfTZ4yH
 vYkVAeDTCgsQjUVNgkbUJxgxLij3iKhKzED9gye/vU6uGLawlMsiOmyaPPYK4eALSl3th/D/
 zqZpQwVIf272Pi3k2ftHqeE37eX9c/DcNtMUuX+rrgy3QH7KlU7UHU+TUG8reSylnmwUtdeL
 1180ic1pMDezmTyJjXGd0P++SDsUiI0AYIKTrVkslnVl8I43i7AboQ6Zm8QADAZnJdeqQwCj
 jehg97vDDpzh7yZIVr13quUtz67JR8OJmYEYyIeJSNdizU0iNhu5v5nZo8L/J+d1rUZKxmpq
 9y5hHRWa4EosCI+//7TEWYrLN6bjsOhogYdvm07V48+h+9zTNbNi4eAsTA34RvcRWowo5boU
 HUswqCjAO4y4Z6liRGWfLkGHKmV7t2pYAaDsWxDHt4n+GH4k5KjVdg4DDBWOkZyLoMWeDrxe
 kjDqEYJuNlNPWC2K65sC26zI5t7i/G/TJK0BraON4MmjptZLWdr+AlkamaL3mXrnVRqkLpX1
 ZKzLJz8XC5HUf0PIDyeG8IF/KQt2iYFhkjOV7DbxUut15eBTSvAIVsCGAHVMLxos/rsTB/u2
 99bLMLPxxhBXenWay3M+MsLN1cIIHMnQ5fspKRqmvWrPAt9BCQzCvrJ27Qxask9w+JLl/zUu
 HCmMqNF9LbhrWD6MjnWYXB7VLrEccZE8kIJES1rO1n9jhDPfr2TxKsYcpI2e5wu++pi0eN4Q
 pE5lyOoWaQnptPvoGR1UHXtkLGOYihHkiqvBEKYjNUXYZ97W0nb+9r8ZAz/5WxWUmyptNAi5
 by7vu86fXbhb1g9ZCo1QKj2p79UgZT7sLkrN6cvCoMCEHgACKAwd0TMYgYfeqng0ynryDqAz
 BqxChwFv+TLqIJd2ICW2Pjf8tj4S7UjQBUy84znAVCebnmyEo2Lmt8obQp0VWmHPI8J0Pj7P
 709Iw/UaqJf9Lq1j2aMO+wwk/5vuIKHS05y1QliB3yDYlSlYo6M0VHatfSjQpZln+cD0SPvA
 x7n0ocBY92hZpi6eGP90SJ+NYxvI9lPwWGKtZzY4SzSuEdKwVZweRkLZkPV2HIBfOod3UFM6
 b5JhfP6IjeX0nICWutqRAgNn4hQBhTsi5kai6w=
IronPort-HdrOrdr: A9a23:NYZM7639/i03d7T2HC25ywqjBKMkLtp133Aq2lEZdPVwSL39qy
 nOpoV/6faaslkssR0b9+xoW5PwI080l6QFgrX5VI3KNGKN1QeVxepZjbcKrQeAJ8SHzJ876Z
 td
X-Talos-CUID: 9a23:r6l2xGCiR6/Acdj6EzRa73JIEcA9TnT24CfrfH+KJWcuTrLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AgXwwWw0F1JqTl8ikt8BHbu4x+DUjv4G2JVsLjZM?=
 =?us-ascii?q?9+OKZJwxQMWiXihmoa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.16,252,1744070400";
   d="1'?diff'?bugs'?scan'208";a="52890501"
Received: from vist-zimproxy-04.vist.is ([79.171.98.211])
  by smtp-out-04.simnet.is with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 18:44:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by vist-zimproxy-04.vist.is (Postfix) with ESMTP id 1AC036101661
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 18:44:09 +0000 (UTC)
Received: from vist-zimproxy-04.vist.is ([127.0.0.1])
 by localhost (vist-zimproxy-04.vist.is [127.0.0.1]) (amavis, port 10026)
 with ESMTP id mDEaLMduISEj for <alsa-devel@alsa-project.org>;
 Fri, 20 Jun 2025 18:44:09 +0000 (UTC)
Received: from kassi.invalid.is (85-220-33-163.dsl.dynamic.simnet.is
 [85.220.33.163])
	by vist-zimproxy-04.vist.is (Postfix) with ESMTPS id ED2386101660
	for <alsa-devel@alsa-project.org>; Fri, 20 Jun 2025 18:44:08 +0000 (UTC)
Received: from bg by kassi.invalid.is with local (Exim 4.98.2)
	(envelope-from <bg@kassi.invalid.is>)
	id 1uSgie-000000000nE-2Qrb
	for alsa-devel@alsa-project.org;
	Fri, 20 Jun 2025 18:44:08 +0000
Date: Fri, 20 Jun 2025 18:44:08 +0000
From: Bjarni Ingi Gislason <bjarniig@simnet.is>
To: alsa-devel@alsa-project.org
Subject: aplay.1: Some remarks and a patch with editorial changes for this
 man page
Message-ID: 
 <175044479544.2970.15183943430208400496.reportbug@kassi.invalid.is>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="N5rAd374ARKcZ3DE"
Content-Disposition: inline
X-Mailer: reportbug 13.2.0
X-MailFrom: bg@simnet.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 74XXVTIJUCM2YTEODZ6YOJDW5VCO56JU
X-Message-ID-Hash: 74XXVTIJUCM2YTEODZ6YOJDW5VCO56JU
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:23:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74XXVTIJUCM2YTEODZ6YOJDW5VCO56JU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--N5rAd374ARKcZ3DE
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

troff:<stdin>:258: warning: trailing space in the line

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

--N5rAd374ARKcZ3DE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="chk_man.err.aplay.1"

Input file is aplay.1

Output from "mandoc -T lint  aplay.1": (shortened list)

      9 input text line longer than 80 bytes

-.-.

Output from
test-nroff -mandoc -t -ww -z aplay.1: (shortened list)

      1 line(s) with a trailing space

-.-.

Change (or include a "FIXME" paragraph about) misused SI (metric)
numeric prefixes (or names) to the binary ones, like Ki (kibi), Mi
(mebi), Gi (gibi), or Ti (tebi), if indicated.
If the metric prefixes are correct, add the definitions or an
explanation to avoid misunderstanding.

14:automatically split before the 2GB filesize.

-.-.

Reduce space between words.

aplay.1:187:This option has no effect if  \-\-separate\-channels is

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

Add a "\&" (or a comma (Oxford comma)) after an abbreviation
or use English words
(man-pages(7)).
Abbreviation points should be marked as such and protected against being
interpreted as an end of sentence, if they are not, and that independent
of the current place on the line.

211:Disables recovery attempts when errors (e.g. xrun) are encountered; the

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
Add "\:" to split the string for the output, "\<newline>" in the source.  

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

Longest line is number 20 with 119 characters

-.-.

The name of a man page is typeset in bold and the section in roman
(see man-pages(7)).

256:alsamixer(1),
257:amixer(1)

-.-.

Put a parenthetical sentence, phrase on a separate line,
if not part of a code.
See man-pages(7), item "semantic newline".

aplay.1:40:Quiet mode. Suppress messages (not sound :))
aplay.1:43:File type (voc, wav, raw or au).
aplay.1:64:\-f cd (16 bit little endian, 44100, stereo) [\-f S16_LE \-c2 \-r44100]
aplay.1:65:\-f cdr (16 bit big endian, 44100, stereo) [\-f S16_BE \-c2 \-r44100]
aplay.1:66:\-f dat (16 bit little endian, 48000, stereo) [\-f S16_LE \-c2 \-r48000]
aplay.1:176:Expression for validation is: coef * (buffer_size / 2).
aplay.1:211:Disables recovery attempts when errors (e.g. xrun) are encountered; the

-.-.

Use a no-break space between a number and a (SI) unit

101:If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.
109:If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.

-.-.

Only one space character is after a possible end of sentence
(after a punctuation, that can end a sentence).

aplay.1:12:driver. It supports several file formats and multiple soundcards with
aplay.1:13:multiple devices. If recording with interleaved mode samples the file is
aplay.1:16:\fBaplay\fP is much the same, only it plays instead of recording. For
aplay.1:20:If filename is not specified, the standard output or input is used. The \fBaplay\fP utility accepts multiple filenames.
aplay.1:40:Quiet mode. Suppress messages (not sound :))
aplay.1:71:Sampling rate in Hertz. The default rate is 8000 Hertz.
aplay.1:92:Open the audio device in non\-blocking mode. If the device is busy the program will exit immediately.
aplay.1:204:Dump hw_params of the device preconfigured status to stderr. The dump
aplay.1:211:Disables recovery attempts when errors (e.g. xrun) are encountered; the

-.-.

Output from "test-groff  -mandoc -t -K utf8 -rF0 -rHY=0 -rCHECKSTYLE=0 -ww -z ":

troff:<stdin>:258: warning: trailing space in the line

-.-

Generally:

Split (sometimes) lines after a punctuation mark; before a conjunction.

--N5rAd374ARKcZ3DE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="aplay.1.diff"

--- aplay.1	2025-06-20 10:46:13.551368006 +0000
+++ aplay.1.new	2025-06-20 18:27:14.304560168 +0000
@@ -11,7 +11,7 @@ soundcard driver
 \fBarecord\fP is a command\-line soundfile recorder for the ALSA soundcard
 driver. It supports several file formats and multiple soundcards with
 multiple devices. If recording with interleaved mode samples the file is
-automatically split before the 2GB filesize.
+automatically split before the 2\~GiB filesize.
 
 \fBaplay\fP is much the same, only it plays instead of recording. For
 supported soundfile formats, the sampling rate, bit depth, and so
@@ -76,13 +76,13 @@ Valid values are 2000 through 192000 Her
 Interrupt after # seconds.
 A value of zero means infinity.
 The default is zero, so if this option is omitted then the record/playback process will run until it is killed.
-Either '-d' or '-s' option is available exclusively.
+Either '\-d' or '\-s' option is available exclusively.
 .TP
 \fI\-s, \-\-samples=#\fP
 Interrupt after transmission of # PCM frames.
 A value of zero means infinity.
 The default is zero, so if this options is omitted then the record/playback process will run until it is killed.
-Either '-d' or '-s' option is available exclusively.
+Either '\-d' or '\-s' option is available exclusively.
 .TP
 \fI\-M, \-\-mmap\fP
 Use memory\-mapped (mmap) I/O mode for the audio stream.
@@ -98,7 +98,8 @@ If no period time and no period size is
 .TP
 \fI\-B, \-\-buffer\-time=#\fP
 Buffer duration is # microseconds
-If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.
+If no buffer time and no buffer size is given
+then the maximal allowed buffer time but not more than 500\~ms is set.
 .TP
 \fI\-\-period\-size=#\fP
 Distance between interrupts is # frames
@@ -106,7 +107,8 @@ If no period size and no period time is
 .TP
 \fI\-\-buffer\-size=#\fP
 Buffer duration is # frames
-If no buffer time and no buffer size is given then the maximal allowed buffer time but not more than 500ms is set.
+If no buffer time and no buffer size is given then the maximal allowed
+buffer time but not more than 500\~ms is set.
 .TP
 \fI\-A, \-\-avail\-min=#\fP
 Min available space for wakeup is # microseconds
@@ -145,7 +147,7 @@ by typing arecord.
 Allow interactive operation via stdin.
 Currently only pause/resume via space or enter key is implemented.
 .TP
-\fI-m, \-\-chmap=ch1,ch2,...\fP
+\fI\-m, \-\-chmap=ch1,ch2,...\fP
 Give the channel map to override or follow.  Pass channel position
 strings like \fIFL\fP, \fIFR\fP, etc.
 
@@ -184,7 +186,7 @@ While recording, when the output file ha
 sound for this long,
 close it and open a new output file.  Default is the maximum
 size supported by the file format: 2 GiB for WAV files.
-This option has no effect if  \-\-separate\-channels is
+This option has no effect if \-\-separate\-channels is
 specified.
 .TP
 \fI\-\-process\-id\-file <file name>\fP
@@ -208,7 +210,7 @@ For raw device hw:X this option basicall
 the soundcard.
 .TP
 \fI\-\-fatal\-errors\fP
-Disables recovery attempts when errors (e.g. xrun) are encountered; the
+Disables recovery attempts when errors (e.g.\& xrun) are encountered; the
 aplay process instead aborts immediately.
 
 .SH SIGNALS
@@ -252,10 +254,9 @@ every hour.  The files are placed in dir
 and have names which include their start times and file numbers.
 
 .SH SEE ALSO
-\fB
-alsamixer(1),
-amixer(1)
-\fP
+.BR \
+alsamixer "(1), " \
+amixer (1)
 
 .SH BUGS
 Note that .aiff files are not currently supported.

--N5rAd374ARKcZ3DE
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

--N5rAd374ARKcZ3DE--
