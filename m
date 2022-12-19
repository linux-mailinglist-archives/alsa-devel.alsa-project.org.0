Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6687650944
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 10:19:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 276912BD7;
	Mon, 19 Dec 2022 10:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 276912BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671441599;
	bh=MV9TYB75o8a9Yci2hY5X6RWZ3GETpZTjDoRYzRNb4mo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yu9uB3pcVfVsQ8oV8I7//wVYBcqriu1B+0kFJi1nuvKeGrFGbR2NtvJ5+pv1sab2M
	 rEww7wwkIDv+xKjkfTydH5S0dRYvpiKcizziR19c0NflBlK4Tg+UvMLB52zTWz84j5
	 gpAoOGfrPYhy+QJuChkCpZCLdzYxoPIfW8NpnEJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BAC5F8025E;
	Mon, 19 Dec 2022 10:18:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6477F80535; Mon, 19 Dec 2022 10:18:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 384F7F8025E
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 10:18:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 384F7F8025E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1671441527085860968-webhooks-bot@alsa-project.org>
References: <1671441527085860968-webhooks-bot@alsa-project.org>
Subject: Add rate limitation in a SectionDevice
Message-Id: <20221219091849.C6477F80535@alsa1.perex.cz>
Date: Mon, 19 Dec 2022 10:18:49 +0100 (CET)
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf issue #253 was edited from fchiby:

Hello  @perexg,

I created an alsa-ucm configuration to my board i350-evk (mt8365-evk). 
Here my configuration files:

[mt8365-evk.conf.txt](https://github.com/alsa-project/alsa-ucm-conf/files/10247428/mt8365-evk.conf.txt)
[HiFi.conf.txt](https://github.com/alsa-project/alsa-ucm-conf/files/10247429/HiFi.conf.txt)

However pulseaudio initialization failed because of hw:mt8365evk,2, this pcm device is connected to jack_mic and Amic.  

```
D: [pulseaudio] alsa-util.c: _buffer_size:4408 ,   _period_size:1102
I: [pulseaudio] pcm_hw.c: SNDRV_PCM_IOCTL_PREPARE failed (-22)
D: [pulseaudio] alsa-util.c: _buffer_size:4408 ,   _period_size:1102
I: [pulseaudio] pcm_hw.c: SNDRV_PCM_IOCTL_PREPARE failed (-22)
D: [pulseaudio] alsa-util.c: _buffer_size:4408 ,   _period_size:1102
I: [pulseaudio] pcm_hw.c: SNDRV_PCM_IOCTL_PREPARE failed (-22)
D: [pulseaudio] alsa-util.c: Set neither period nor buffer size.
I: [pulseaudio] pcm_hw.c: SNDRV_PCM_IOCTL_PREPARE failed (-22)
I: [pulseaudio] alsa-util.c: snd_pcm_hw_params failed: Invalid argument
D: [pulseaudio] alsa-util.c: Trying plug:SLAVE='_ucm0006.hw:mt8365evk,2' with SND_PCM_NO_AUTO_FORMAT ...
I: [pulseaudio] pcm.c: Unknown PCM _ucm0006.hw:mt8365evk,2
I: [pulseaudio] alsa-util.c: Error opening PCM device plug:SLAVE='_ucm0006.hw:mt8365evk,2': No such file or directory
D: [pulseaudio] alsa-mixer.c: Profile set 0xaaab0a13a700, auto_profiles=no, probed=yes, n_mappings=0, n_profiles=0, n_decibel_fixes=0
E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="0" name="platform-sound" card_name="alsa_card.platform-sound" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
```

Whith dmesg I got more details about pulseaudio failure: 

```
[  160.295717] mt8365-afe-pcm 11220000.audio-controller: mt8365_afe_fe_hw_params AWB period = 1102 rate = 44100 channels = 1
[  160.295865] mt8365-afe-pcm 11220000.audio-controller: mt8365_afe_int_adda_prepare 'Capture' rate = 44100
[  160.295881] mt8365-afe-pcm 11220000.audio-controller: ASoC: error at snd_soc_pcm_dai_prepare on INT ADDA: -22
[  160.295891]  MTK Codec: ASoC: soc_pcm_prepare() failed (-22)
[  160.295900]  AWB_FE: ASoC: dpcm_be_dai_prepare() failed (-22)
[  160.295908]  AWB_FE: ASoC: dpcm_fe_dai_prepare() failed (-22)
[  160.296395] mt8365-afe-pcm 11220000.audio-controller: mt8365_afe_fe_hw_params AWB period = 512 rate = 44100 channels = 1
[  160.296543] mt8365-afe-pcm 11220000.audio-controller: mt8365_afe_int_adda_prepare 'Capture' rate = 44100
[  160.296559] mt8365-afe-pcm 11220000.audio-controller: ASoC: error at snd_soc_pcm_dai_prepare on INT ADDA: -22
[  160.296569]  MTK Codec: ASoC: soc_pcm_prepare() failed (-22)
[  160.296577]  AWB_FE: ASoC: dpcm_be_dai_prepare() failed (-22)
[  160.296585]  AWB_FE: ASoC: dpcm_fe_dai_prepare() failed (-22)
```
 When I checked the machine driver, hw:mt8365evk,2 FE (AWB) has 8000_192000,  while hw:mt8365evk,2  BE (INT_ADDA) has only [8000, 16000, 32000, 48000] as sample rates.
Actually, the rate limitation is not on afe dai, it's on PMIC. So we prefer to not restrict hw:mt8365evk,2 FE AWB rates.  

My question is, **is it possible to specify the rate limitation in a** `SectionDevice` ?  I checked the alsa-ucm-conf documentation  and did not find any section for this :/ [alsa-ucm-conf docs](https://www.alsa-project.org/alsa-doc/alsa-lib/group__ucm__conf.htmll)

Thanks a bunch !

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/253
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
