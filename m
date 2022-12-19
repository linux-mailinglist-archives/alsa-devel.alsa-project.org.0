Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80F65093E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 10:18:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE3EDF3;
	Mon, 19 Dec 2022 10:17:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE3EDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671441485;
	bh=PdsZH7PNp6cVHYpx9vFv8hp/d3LpGOmZ0NsrECLZIcI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Q0UuNHcx/1HAHvkOKCol8mPEssktPxEUCWyewcIMDQvs4p7NeNLWaA3oUgS94jCEj
	 Yci+rlMBn/oO6GjExTX9UMfUMllK7Beircv9Yl1jJwFVjogo1HLbKak3HXkAEo5AaX
	 E+iXXaCrIjPUa+XfG1+cWTTSewDHc2TK3C/XriC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAC12F800DF;
	Mon, 19 Dec 2022 10:17:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5601F800DF; Mon, 19 Dec 2022 10:17:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E545F800DF
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 10:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E545F800DF
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1p7CGb-0002bX-Sv; Mon, 19 Dec 2022 10:17:01 +0100
Message-ID: <bf52f4c5-5cca-26d7-7fb2-ac8ecb5b24c5@leemhuis.info>
Date: Mon, 19 Dec 2022 10:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: =?UTF-8?Q?=5bregression=5d_Bug=c2=a0216818_-_The_microphone_mute_le?=
 =?UTF-8?Q?d_not_working_after_linux_6?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1671441424;
 71e230b6; 
X-HE-SMSGID: 1p7CGb-0002bX-Sv
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: LKML <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 plum <plumerlis@gmail.com>, sonic82003@gmail.com,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216818 :

>  sonic82003@gmail.com 2022-12-18 08:52:32 UTC
> 
> The mic mute led of my ThinkPad X1 Carbon Gen 9 doesn't work anymore after updating linux to version 6.
> I can still turn it on by  running 
> 
> echo 1 > /sys/class/leds/platform::micmute/brightness
> 
> With linux-lts it still works fine.

See the ticket for more details.

Note, I found a similar report that (despite my attempts to prevent
things like this from happening) fell through the cracks here:
https://bugzilla.kernel.org/show_bug.cgi?id=216355

>  plum 2022-08-13 02:11:01 UTC
> 
> I upgrade to kernel 5.19.1 but found my thinkpad x1 carbon 2021's mute led stop working.
> 
> Function is okay but LED won't light up.
> 
> Back to kernel 5.18 and it's normal and working again.
> 
> Fedora 36 64 bit 
> Gnome-shell 42

From a quick research it looks to me like this is an issue for the
sounds maintainers, as the LED itself apparently works. If that is
something for the platform people instead please speak up.

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v5.18..v5.19
https://bugzilla.kernel.org/show_bug.cgi?id=216818
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
