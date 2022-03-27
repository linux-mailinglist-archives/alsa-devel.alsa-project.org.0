Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46C4E8A80
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 00:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A3BB822;
	Mon, 28 Mar 2022 00:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A3BB822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648420166;
	bh=LMGacrObIHkOfB/x5xSFuhvBNVmEH+gCzEkH/9J5GaQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RC4HnemOI2AicDIIcURrIvlyN8f2lZKclFDTik+0DMtPDYC0E8l3gJUDGHTR3w7fq
	 Kzs4xwWGAF4E+Er7CHziJhsm/XnY4UTatlTFTtf/or/capzZAoYy04afeO+2j5Y/hS
	 7l9dOjiBW9fUlmMbPOz+saUrHA4wBS+W9M8UrTMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7384AF800F8;
	Mon, 28 Mar 2022 00:28:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76B24F80161; Mon, 28 Mar 2022 00:28:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 87473F800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 00:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87473F800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1648420089770205975-webhooks-bot@alsa-project.org>
References: <1648420089770205975-webhooks-bot@alsa-project.org>
Subject: Audio only working after stopping PulseAudio and setting the UCM -
 kblda7219max on the ChromeOS Kernel, 5.10.70
Message-Id: <20220327222816.76B24F80161@alsa1.perex.cz>
Date: Mon, 28 Mar 2022 00:28:16 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #142 was edited from MilkyDeveloper:

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
