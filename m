Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CA6F6C61
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 14:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F7C21BE;
	Thu,  4 May 2023 14:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F7C21BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683204700;
	bh=MxgEs/GzsVB7WZOqXAmFEVCgcruFbbjrFwApm8C6NZI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XYd4uJtWlzA55aYfuZ4IXnASwFS31wisc1Vq7HBAAfvCFYuqZPlyaFZCKN4BIycV+
	 otx8CEyhOYWce+A91ALb14ze4Kt4ZcmLRezwCOdIJSs+/lRQn2wpz+UKgzN7eZygjO
	 2isAy/FYJyv5G6pXDM9hAHS0PvvFFmhFWp/j2hkM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FD3F80520;
	Thu,  4 May 2023 14:50:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71098F8052E; Thu,  4 May 2023 14:50:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F029EF80114
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 14:50:36 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C2D3D11E7;
	Thu,  4 May 2023 14:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C2D3D11E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683204635; bh=/XTriyDwjp3UvA7ORDvIjhf6kGmAe6UslfVjHjjphJc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=LKihB8bebSU8ejuGORFsGq6GoLH3NkDQuPcdvAQrOlzwJpuvNZ7Iqu246zEZRTcag
	 vhBwaDp9WmzlESNs2MwxrZSXmSgAhoJCQfbltlvIasPolybgv/Vyax1Rta0dl8CZba
	 qJcL36AuiH/Vyx9FwryzXVKrzAGPvj1jbzttKBx8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  4 May 2023 14:50:33 +0200 (CEST)
Message-ID: <3a20cc56-f9e8-a5b1-9cd4-d2fd83ecf999@perex.cz>
Date: Thu, 4 May 2023 14:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: How to mix multiple pcm capture stream into one and save to wav
 file as if it's from one single multi channel alsa card device
Content-Language: en-US
To: semiydsemiyd@163.com, alsa-devel@alsa-project.org
References: <168257479762.20.3215919601496636554@mailman-web.alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: 
 <168257479762.20.3215919601496636554@mailman-web.alsa-project.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MD7OIDLQSPSCQB5EUOWUE7BUTZJHTYAM
X-Message-ID-Hash: MD7OIDLQSPSCQB5EUOWUE7BUTZJHTYAM
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MD7OIDLQSPSCQB5EUOWUE7BUTZJHTYAM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27. 04. 23 7:53, semiydsemiyd@163.com wrote:
> Hi
> 
> I have 8 alsa capture devices for one card.
> Each capture device support 1 channel only:
> 
> root@light-a-val:~# arecord -l
> **** List of CAPTURE Hardware Devices ****
> card 0: LightSoundCard [Light-Sound-Card], device 0: light-tdm-dai-slot1-ES7210 ADC 0 es7210.5-0042-1 [light-tdm-dai-slot1-ES7210 ADC 0 es7210.5-0042-1]
>    Subdevices: 1/8
>    Subdevice #0: subdevice #0
> card 0: LightSoundCard [Light-Sound-Card], device 1: light-tdm-dai-slot2-ES7210 ADC 0 es7210.5-0042-1 [light-tdm-dai-slot1-ES7210 ADC 0 es7210.5-0042-1]
>    Subdevices: 2/8
>    Subdevice #1: subdevice #1
> ...
> card 0: LightSoundCard [Light-Sound-Card], device 7: light-tdm-dai-slot8-ES7210 ADC 1 es7210.5-0042-1 [light-tdm-dai-slot1-ES7210 ADC 0 es7210.5-0042-1]
>    Subdevices: 8/8
>    Subdevice #7: subdevice #7
> 
> the signal comes in TDM format from external codec ES7210 to my soc's TDM controller.
> each capture device has 1 channel that correspond to one of the slot in TDM. i have 8 TDM slots in configuration. so i have 8 devices in total.
> 
> 
> the reason that i have so many capture devices with 1 channel each is that, our tdm IC design decides that each tdm slot data_register would be assigned a
> dedicated dma channel. this is quite uncommon. thus i have 8 dma channels for 8 tdm slots.
> since i can only register one rx dma channel and one tx using devm_snd_dmaengine_pcm_register().
> like:
> struct dmaengine_pcm {
> 	struct dma_chan *chan[SNDRV_PCM_STREAM_LAST + 1];    // there can be only one tx + one rx dma for struct dmaengine_pcm
> 	...
> };
> i have to register like 8 times to create 8 devices.
> the dts for the cpu dai driver for tdm slot1 would look like:
> 		tdm: audio_tdm@0xffcb000000 {
> 			#sound-dai-cells = <0>;
> ...
> 			dmas = <&dmac2 31>;
> 			dma-names = "rx";
> ...
> 		};
> 
> now...i want to open all the devices at the same time. and have them save to one single wav file. As if i'm opening one single alsa capture device with  8 channels.
> the saved wav file should look something like this (take this 8 channel wav file for example)

You may use the multi plugin from alsa-lib, just google "alsa multi plugin" 
for details.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

