Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843A66596A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 11:53:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 051E0E4A0;
	Wed, 11 Jan 2023 11:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 051E0E4A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673434419;
	bh=0UTMCj+OVp0GgbXDDNXm9jl8IyOcVST/LXjJwbu1c1E=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:Cc:From;
	b=FHZEWG8yIUtLKAj1c00eui/j0t1q0eN2iQTIMEKgjq2hhirLmZXMk6IQd6D53zuMn
	 kAmQJXLFHGUBVbdk3Aex9oHCDN5XrCvIAG3ROBUZ89Ttj60DqZtK/AKcLTp6gAbe3o
	 G1dFMN8euOv+dzzGnG+0MXDJjxWY9Id8qMLLTo9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6ED4F80424;
	Wed, 11 Jan 2023 11:52:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 251C7F803DC; Wed, 11 Jan 2023 11:52:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3C87F8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 11:52:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3C87F8019B
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pFYif-0004pr-Ti; Wed, 11 Jan 2023 11:52:33 +0100
Message-ID: <f5beb73a-4306-fc04-8ab1-e5fc06c9f40f@leemhuis.info>
Date: Wed, 11 Jan 2023 11:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Takashi Iwai <tiwai@suse.de>
Subject: =?UTF-8?Q?=5bregression=5d_Bug=c2=a0216909_-_Avantree_Leaf_USB_audi?=
 =?UTF-8?Q?o_device_does_not_play_sound_in_applications_run_via_wine?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1673434355;
 10df087c; 
X-HE-SMSGID: 1pFYif-0004pr-Ti
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 Bernd Steinhauser <linux@bernd-steinhauser.de>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216909 :

>  Bernd Steinhauser 2023-01-10 14:45:18 UTC
> 
> Created attachment 303568 [details]
> lsusb -v -d 0a12:1004
> 
> On my second PC, I'm using a USB audio device called "Avantree Leaf" to pass audio via bluetooth to a receiver. About 1-2 months ago, I noticed that I have no audio with this device when playing sounds via wine applications (e.g. foobar2000 or any kind of game via proton/wine), neither via the pulseaudio output, nor alsa.
> Native Linux applications work fine (or at least I haven't found one yet that doesn't work) via both pulse or alsa output.
> If I select another audio device (e.g. the speakers of the screen via HDMI) in winecfg for the respective wine prefix, then the audio does work.
> Also, if I "prime" the device by playing audio via a native application and then the audio works.
> 
> I'm using pipewire-0.3.63 with pipewire-pulse as an audio server, but I've also tried with recent pulseaudio and they are both affected.
> For pipewire, I played a bit with the settings and found:
> Brings back audio:
> clock.min-quantum 512 (lower values don't work)
> 
> Doesn't change the outcome:
> ["api.alsa.period-size"] = 16 up to 1024
> ["api.alsa.disable-batch"] = true/false (in combination with the above)
> ["api.alsa.headroom"] = 64 up to 1024
> 
> The output I get from `cat /proc/asound/Leaf/pcm0p/sub0/hw_params`:
> Native application:
> access: MMAP_INTERLEAVED
> format: S16_LE
> subformat: STD
> channels: 2
> rate: 48000 (48000/1)
> period_size: 256
> buffer_size: 32768
> 
> foobar2000 via wine:
> access: MMAP_INTERLEAVED
> format: S16_LE
> subformat: STD
> channels: 2
> rate: 48000 (48000/1)
> period_size: 128
> buffer_size: 32768
> 
> So they are the same, except for the period_size.
> 
> Yesterday, I finally made some effort to track this down and I had to go back all the way to v5.14 to find the commit that is responsible:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.2-rc3&id=307cc9baac5c07b23da78d75c3d4755e9cffab26
> 
> If I test the revision before that commit, everything works as expected. If I test this revision, then the audio fails.
> Of course with such an old commit, I'm not 100% sure that this is the only thing, as I can't simply revert it on a newer kernel. Too much change happened in sound/usb since then.
> I did however test every mainline kernel version since 5.10 and the behavior was consistent.
> Please let me know if you need any further information.

See the ticket for more details.

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: 307cc9baac5c07b23d
https://bugzilla.kernel.org/show_bug.cgi?id=216909
#regzbot title: sound: avantree Leaf USB audio device stopped playing
sound in applications run via wine
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
