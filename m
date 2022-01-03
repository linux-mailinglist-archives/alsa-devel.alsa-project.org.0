Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B548302C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 12:05:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E2F174F;
	Mon,  3 Jan 2022 12:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E2F174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641207946;
	bh=yQilxRowzrBaF1cxJ8GrfO6I1VAGCUTa0mgm7LPcPto=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txYV7SVodVW243NM3x0CEdIYSRTpLXVnOX9Qn5tGRYE741uiQVrINv5ERqnIyYDq0
	 5COC2WBGjJhQYNowaPcPeKyyMddaSNhLUvPv4ktuPxDMhgKtjNYJ+qdJWUyHmtbMMp
	 4qe6Kf5itzwZeFt6Zkc+NBHfTUZbR+4ROCbGzX0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D07E9F800C8;
	Mon,  3 Jan 2022 12:04:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB0DEF800FF; Mon,  3 Jan 2022 12:04:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6025F800E3
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 12:04:31 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8A67DA0040;
 Mon,  3 Jan 2022 12:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8A67DA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1641207870; bh=GIn5qlEVCWBIAaoD4oBCR6gQxmLPVO8QWfOiMKhwDDI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e8xrVub84fBtS6Hnng+zBk9JGj3clZn3ZGO56jp1Aw6ICI0aSLXYH9svhh6DUR8bW
 rLlcO4CqA2yMzGG+e8afkq/5CzHPVTicn8r3zTvQFrGPoRi/wJox5qyMFzrOElONql
 4vl6xCWzA2Ud884GOLopYlW6Q8reRNy6Hxu6wCis=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  3 Jan 2022 12:04:25 +0100 (CET)
Message-ID: <125f4abc-a85e-7a8c-594c-4cf7ddee1d78@perex.cz>
Date: Mon, 3 Jan 2022 12:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RESEND] Amlogic DPCM audio card(s) speaker placement issue
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, alsa-devel@alsa-project.org
References: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
 <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
 <1jk0fh86yj.fsf@starbuckisacylon.baylibre.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <1jk0fh86yj.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Matthias Reichl <hias@horus.com>, linux-amlogic@lists.infradead.org
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

On 03. 01. 22 10:57, Jerome Brunet wrote:
> 
> On Sun 26 Dec 2021 at 18:30, Jaroslav Kysela <perex@perex.cz> wrote:
> 
>> On 26. 12. 21 12:43, Christian Hewitt wrote:
>>
>>> **** List of PLAYBACK Hardware Devices ****
>>> card 0: LIBRETECHCC [LIBRETECH-CC], device 0: fe.dai-link-0 (*) []
>>>    Subdevices: 1/1
>>>    Subdevice #0: subdevice #0
>>
>>> numid=12,iface=PCM,name='ELD',device=2
>>> numid=11,iface=PCM,name='IEC958 Playback Default',device=2
>>> numid=10,iface=PCM,name='IEC958 Playback Mask',device=2
>>> numid=9,iface=PCM,name='Playback Channel Map',device=2
>>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#L136-L188
>>
>> Have you tried to reorder the dai-link-# sections in DT? It appears to me that sound/soc/codecs/hdmi-codec.c / hdmi_codec_pcm_new() gets the internal PCM
>> device rather than the exported PCM device for the user space.
>>
>> If the DAI routing cannot be changed, then the hdmi-codec.c should be modified to export the correct device number for the user space:
>>
> 
> The DAI routing is dynamic, especially on the AXG series.
> There is actually two routing stages:
> 
> 1) Between the user interfaces (DMA) and the i2s/TDM encoders/decoders:
>     -> This is using DPCM
> 
> 2) Between the i2s/TDM encoders and the HDMI controller:
>     -> This is using Codec-to-Codec links
> 
> The problem exposed here is
>   - How to get the get the "Playback Channel Map" related to the pcm
>   device of a given playback ?

The PCM device exported to the user space should be able to export this 
information correctly. The kcontrols in hdmi-codec.c refers to an unknown 
(internal) PCM codec2codec device (from the user space view) which is created 
in the SoC layer.

It seems that kcontrols in hdmi-codec.c should not be created for the internal 
SoC PCMs. A new layer which translate the kcontrol handling between the 
exported (user space) PCM device and internal (SoC) PCM device is required.

Problematic code in hdmi_codec_pcm_new() / hdmi-codec.c:

- snd_pcm_add_chmap_ctls()
- kctl->id.device = rtd->pcm->device

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
