Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 191DF4E816C
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Mar 2022 15:35:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A635169E;
	Sat, 26 Mar 2022 15:34:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A635169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648305300;
	bh=G7Tz6zRWo9SzhrC4iRrW17Mi3bYUYRAwDkAg6bcnvVM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eaajyKt0/qiWFnMhyEsN+bkrhCrkJ/VkwCb4AUAOLrd7CLZAp81xsO2VD3BLCu781
	 UaM5x4m21D51+9UpvTwqJH2gNhvF/nLBp595Za+VFVrq1paXdEJ1q7yu9cU1+1Ey5a
	 Sq/yDk1DUM5uRXO6KZ5+mH3SifxUbNiJKNAMCp3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C612F801F5;
	Sat, 26 Mar 2022 15:33:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ADE8F8019D; Sat, 26 Mar 2022 15:33:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3D96DF800AA
 for <alsa-devel@alsa-project.org>; Sat, 26 Mar 2022 15:33:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D96DF800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1648305229716017008-webhooks-bot@alsa-project.org>
References: <1648305229716017008-webhooks-bot@alsa-project.org>
Subject: PulseAudio only working after setting the UCM - kblda7219max on the
 ChromeOS Kernel, 5.10.70
Message-Id: <20220326143353.3ADE8F8019D@alsa1.perex.cz>
Date: Sat, 26 Mar 2022 15:33:53 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf issue #142 was opened from MilkyDeveloper:

On my `kblda7219max` Chromebook (baseboard: NAMI), internal audio works properly when the following conditions are met:
* Kernel 5.10.70 (ChromeOS fork) is used (the latest ChromeOS kernel has some kind of topology-related kernel bug)
* FW is copied from the ChromeOS rootfs to Linux
* UCM is converted to UCM2
* Only ALSA is used

However, whenever I start PulseAudio (`pulseaudio -vvvv`), audio is disabled, going to a dummy output.

PulseAudio passes through probing for the UCM files but errors out in this particular spot:
```
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_PREPARE failed (-22)
I: [pulseaudio] alsa-util.c: snd_pcm_hw_params failed: Invalid argument
D: [pulseaudio] alsa-util.c: Trying hw:kblda7219max,0 without SND_PCM_NO_AUTO_FORMAT ...
D: [pulseaudio] alsa-util.c: Managed to open hw:kblda7219max,0
D: [pulseaudio] alsa-util.c: Maximum hw buffer size is 21845 ms
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_PREPARE failed (-22)
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_PREPARE failed (-22)
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_PREPARE failed (-22)
I: [pulseaudio] (alsa-lib)pcm_hw.c: SNDRV_PCM_IOCTL_PREPARE failed (-22)
```
which causes it to say:
```
E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="0" name="platform-kbl_da7219_mx98357a" card_name="alsa_card.platform-kbl_da7219_mx98357a" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
```

My `dmesg` gets filled with:
```
Kbl Audio Port: ASoC: no backend DAIs enabled for Kbl Audio Port
Kbl Audio Port: ASoC: dpcm_fe_dai_prepare() failed (-22)
```

However, once I kill PulseAudio and run `alsaucm -c kblda7219max set _verb HiFi set _enadev Speaker`, audio begins working again (but this is in pure ALSA and PA apps are not compatible) and the `no backend DAIs enabled for Kbl Audio Port` is no longer logged to `dmesg`.

I think this is a UCM issue because the audio is working fine kernel-level and with ALSA, but PulseAudio seems to mess something up with the UCM and the UCM needs to be set again.

Huge thanks for any help!
[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8355612/alsa-info.txt)
(My PulseAudio log is slightly different from the time I ran PulseAudio and got the PCM_IOCTL_PREPARE error)
[pulseaudio-log.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8355613/pulseaudio-log.txt)
[HiFi.conf.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8355631/HiFi.conf.txt)
[kblda7219max.conf.txt](https://github.com/alsa-project/alsa-ucm-conf/files/8355632/kblda7219max.conf.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/142
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
