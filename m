Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA636F008A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Apr 2023 07:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB6151008;
	Thu, 27 Apr 2023 07:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB6151008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682574981;
	bh=7iheqCmIdDA7DncSTW3uT0joaxyqLReaQQR1BFXfD5E=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AtJKamIW4CAtFPXR1bdnxMXLNm8lZE431y+63qKGpfDcuLm5I5y7/5UD/vZWuKAib
	 ICCiMCd63j7VIgQokUOzC0Ej7z6veCuHN3G4eSRjDdj1lvcicQBaytq05cu1r3TwPL
	 mLktWR1oa3pU7+FoUIdYZVPbT1em5+Ewvpq4JnR4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E52BF8018A;
	Thu, 27 Apr 2023 07:55:20 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id AD421F80137
	for <alsa-devel@alsa-project.org>; Thu, 27 Apr 2023 07:53:17 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: How to mix multiple pcm capture stream into one and save to wav file
 as if
 it's from one single multi channel alsa card device
From: semiydsemiyd@163.com
To: alsa-devel@alsa-project.org
Date: Thu, 27 Apr 2023 05:53:17 -0000
Message-ID: <168257479762.20.3215919601496636554@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: W2DORSSLMRTBOESUU7FPHB5V3WGC24YY
X-Message-ID-Hash: W2DORSSLMRTBOESUU7FPHB5V3WGC24YY
X-MailFrom: semiydsemiyd@163.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2DORSSLMRTBOESUU7FPHB5V3WGC24YY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi

I have 8 alsa capture devices for one card.
Each capture device support 1 channel only:

root@light-a-val:~# arecord -l
**** List of CAPTURE Hardware Devices ****
card 0: LightSoundCard [Light-Sound-Card], device 0: light-tdm-dai-slot1-ES7210 ADC 0 es7210.5-0042-1 [light-tdm-dai-slot1-ES7210 ADC 0 es7210.5-0042-1]
  Subdevices: 1/8
  Subdevice #0: subdevice #0
card 0: LightSoundCard [Light-Sound-Card], device 1: light-tdm-dai-slot2-ES7210 ADC 0 es7210.5-0042-1 [light-tdm-dai-slot1-ES7210 ADC 0 es7210.5-0042-1]
  Subdevices: 2/8
  Subdevice #1: subdevice #1
...
card 0: LightSoundCard [Light-Sound-Card], device 7: light-tdm-dai-slot8-ES7210 ADC 1 es7210.5-0042-1 [light-tdm-dai-slot1-ES7210 ADC 0 es7210.5-0042-1]
  Subdevices: 8/8
  Subdevice #7: subdevice #7

the signal comes in TDM format from external codec ES7210 to my soc's TDM controller.
each capture device has 1 channel that correspond to one of the slot in TDM. i have 8 TDM slots in configuration. so i have 8 devices in total.


the reason that i have so many capture devices with 1 channel each is that, our tdm IC design decides that each tdm slot data_register would be assigned a 
dedicated dma channel. this is quite uncommon. thus i have 8 dma channels for 8 tdm slots.
since i can only register one rx dma channel and one tx using devm_snd_dmaengine_pcm_register().
like:
struct dmaengine_pcm {
	struct dma_chan *chan[SNDRV_PCM_STREAM_LAST + 1];    // there can be only one tx + one rx dma for struct dmaengine_pcm
	...
};
i have to register like 8 times to create 8 devices.
the dts for the cpu dai driver for tdm slot1 would look like:
		tdm: audio_tdm@0xffcb000000 {
			#sound-dai-cells = <0>;
...
			dmas = <&dmac2 31>;
			dma-names = "rx";
...
		};

now...i want to open all the devices at the same time. and have them save to one single wav file. As if i'm opening one single alsa capture device with  8 channels.
the saved wav file should look something like this (take this 8 channel wav file for example)

 First Multichannel Sample 
 --------------------------
{BB FF FF}  3 bytes slot1
{A1 FF FF}  3 bytes slot2
{00 00 00}  3 bytes slot3
{00 00 00}  3 bytes slot4
{00 00 00}  3 bytes slot5
{00 00 00}  3 bytes slot6
{00 00 00}  3 bytes slot7
{00 00 00}  3 bytes slot8

Second Multichannel Sample
 --------------------------
{E6 FF FF}  3 bytes slot1
 .,.. etc ....


Is this possible and if yes how can i do that?

thank you guys


semiyd
