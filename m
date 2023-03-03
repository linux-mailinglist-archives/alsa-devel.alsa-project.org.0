Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 480026A9245
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 09:19:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37EA684D;
	Fri,  3 Mar 2023 09:18:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37EA684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677831548;
	bh=DQIKA2evRZq1VUsMW6K0OtfeaWwR/4GZ53tsZuemrLM=;
	h=Date:From:To:Subject:CC:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LXWggoVc/uWJeFy92+2RRD5QMpLYARFmojIhtwUZIH8mvhfpEX+hooDQyUdfxHrPb
	 MbTAF+ep6ISEE5KYoTIQGr59w45+cqslpZqLycKYyUTtc7lllCwrnObsS4ihF/p/Oz
	 ybuLrhpMezqY3wJe8ie8K2IW+A5acvq7Guaor7vo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 765D9F8025A;
	Fri,  3 Mar 2023 09:18:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10B21F80266; Fri,  3 Mar 2023 09:17:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10851F800DF
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 09:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10851F800DF
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pY0bG-0004AA-Q4; Fri, 03 Mar 2023 09:17:10 +0100
Message-ID: <19284aff-436a-5130-5126-8ccdd1af476d@leemhuis.info>
Date: Fri, 3 Mar 2023 09:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [regression] Bug 217084 - Roland VS-100 non working (snd_usb_audio)
 since kernel 5.11
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1677831433;ce9d483d;
X-HE-SMSGID: 1pY0bG-0004AA-Q4
Message-ID-Hash: QKRYTHQYJRIRYEVYRWAHOERHJNKNSGLB
X-Message-ID-Hash: QKRYTHQYJRIRYEVYRWAHOERHJNKNSGLB
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alsa-devel <alsa-devel@alsa-project.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKRYTHQYJRIRYEVYRWAHOERHJNKNSGLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217084 :

>  Alberto Zin 2023-02-24 18:11:31 UTC
> 
> The issue I encountered is on a Roland VS-100:
> 
> https://www.roland.com/global/products/v-studio_100/
> 
> it seems that snd_usb_audio module has broken the compatibility with the VS-100 at around kernel 5.11 time. After that kernel the interface is recognized only as a midi interface, on recent kernels there is only dummy audio device and no sound at all. 
> 
> I have two alsa-info reports, on the same desktop pc:
> 
> working (my current setup, linux kernel 5.6.0-1055-oem):
> http://alsa-project.org/db/?f=a3378ecb0a258b4745827c693f4c0045fdb83847
> 
> non working (live, avlinux, 6.0.x):
> http://alsa-project.org/db/?f=99bcdd5a60281110a93317d09a11b9f4831f9701 
> 
> in the non working case the interface is recognised by "lsusb", it is seen by "aconnect -l" but not by "aplay -l".
> 
> I'm willing to help testing as much as I can.
> Alberto

See the ticket for more details. There you noticed that Alberto retried
with a vanilla kernel later and the problem happens there, too.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v5.4.59..v5.4.233
https://bugzilla.kernel.org/show_bug.cgi?id=217084
#regzbot title: alsa: Roland VS-100 stopped working
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
this thread sees some discussion). See page linked in footer for details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
