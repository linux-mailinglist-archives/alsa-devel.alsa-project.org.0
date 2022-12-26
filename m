Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4293F6562D7
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 14:27:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BFBA5726;
	Mon, 26 Dec 2022 14:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BFBA5726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672061239;
	bh=wL7NYT8/SibbMEZOhC/v2fMqD5ZC85zFzePjK2gh53c=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FsHkvhkAIPBUCcuK1YcQgVAfvYu8J69KR2IPWnmp4i/3kH41bhJ2y2ziepDH7+46X
	 UB0Gb55Pd0Nu5ss0mr2l8gGmkyHquJaOFphavH/PfozJ63WErPWjQ2N0RLdulprfpN
	 RqCgUX2NH5IKe+zsd2d3MGjPi1+xq0eGR3vYQ4JU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB4AAF800F0;
	Mon, 26 Dec 2022 14:26:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6314BF80310; Mon, 26 Dec 2022 14:26:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFEF4F8027B
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 14:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFEF4F8027B
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1p9nUa-0005in-9g; Mon, 26 Dec 2022 14:26:12 +0100
Message-ID: <163d5366-35d9-f7db-cf50-796d6b011c0a@leemhuis.info>
Date: Mon, 26 Dec 2022 14:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ALSA: hda/hdmi: Use only dynamic PCM device allocation
 #forregzbot
Content-Language: en-US, de-DE
To: ALSA development <alsa-devel@alsa-project.org>
References: <20220922084017.25925-1-perex@perex.cz>
 <1c9c00dec72c241a399b3b7c0a305382a5712529.camel@bi-co.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <1c9c00dec72c241a399b3b7c0a305382a5712529.camel@bi-co.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1672061174;
 839a19c5; 
X-HE-SMSGID: 1p9nUa-0005in-9g
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
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 25.12.22 13:14, Michael Laß wrote:
> CC'ing amd-gfx as this might be an issue in the amd driver.
> 
> This change causes a regression in Linux 6.1 at least on some AMD APUs.
> There are reports from users with Ryzen 4750U, 5800U and 5850U chips
> where the HDMI sound devices don't show up anymore. I'm affected by
> this as well.
> 
> Reverting this commit (ef6f5494) makes the HDMI audio devices show up
> again. I verified that this is still an issue in current Linux git
> (72a85e2b).

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced ef6f5494faf6a37c74990689a
#regzbot title alsa: hda/hdmi: HDMI sound devices don't show up anymore
with some AMD APUs
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.


> Am Donnerstag, dem 22.09.2022 um 10:40 +0200 schrieb Jaroslav Kysela:
>>> Per discussion on the alsa-devel mailing list [1], the legacy PIN to PCM
>>> device mapping is obsolete nowadays. The maximum number of the simultaneously
>>> usable PCM devices is equal to the HDMI codec converters.
>>>
>>> Remove the extra PCM devices (beyond the detected converters) and force
>>> the use of the dynamic PCM device allocation. The legacy code is removed.
>>>
>>> I believe that all HDMI codecs have the jack sensing feature. Move the check
>>> to the codec probe function and print a warning, if a codec without this
>>> feature is detected.
> 
> The corresponding message ("jack not detectable") is not shown on the
> affected system.
> 
>>> [1] https://lore.kernel.org/alsa-devel/2f37e0b2-1e82-8c0b-2bbd-1e5038d6ecc6@perex.cz/
> 
> Links to some reports of this issue:
> https://bugzilla.kernel.org/show_bug.cgi?id=216836
> https://bbs.archlinux.org/viewtopic.php?pid=2075700
> https://bugs.archlinux.org/task/76917
> https://www.reddit.com/r/archlinux/comments/zsqq7i/hdmi_audio_is_broken_after_updating_kernel_to_611
> 
> Best regards,
> Michael
