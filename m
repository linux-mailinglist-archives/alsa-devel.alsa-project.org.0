Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF31D2DF9CF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Dec 2020 09:17:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D3D172B;
	Mon, 21 Dec 2020 09:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D3D172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608538624;
	bh=SJzfuW5RA3xA47YYNnf9zSzFvatXEMZKH1QazhOXPOc=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQ43XJYMArazDj/EC5IWWscGwaAZOPS8C7lqvtC13Iy3Je+JSopYMbr+/e/VTr2qR
	 qKYXmMvG0+ZMR1aN0bjpviK+LMcz+rATTJQsM7mXVRCg2ojfe1NZDLfhGfLR2O5xTG
	 O55b6BGJZvu6kqQzopVi2nOWOJeG2PyELvZsW9Dk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9B3F801EB;
	Mon, 21 Dec 2020 09:15:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB59DF801D5; Mon, 21 Dec 2020 09:15:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C3EDF800EC
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 09:15:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C3EDF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="hVl/2TgZ"
Received: by mail-ej1-x62c.google.com with SMTP id d17so12173911ejy.9
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 00:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=xUsvdR/WeGTYf9wm0poC0ggXriA18BQWFkluydsdRYs=;
 b=hVl/2TgZ+0fHUReuJsBEZJ4FWb1VN4U9nO7+L2RWPGo/XxeapDTlLbgvt6onHI2jYI
 M1NEA33irdr0Z8U7rKcsogkfv9Hibo22pIHLnl7NNE1dUcaFZ8b9iDy/lOyEqWJHOiV+
 ZXfyE3MOqPXNW9Tmsp6CoqPv4DRqc1XoV1sAAVXJ6O8hUJRuSaJOphZBzJUSjAfwcucV
 CbzXTMDCtsXriukK2L7yCwSPjYMSSrZo0MDmSNFqxFp3gRt9iv5Zr7bpM5iQUqQSx+zC
 ohbml5gOQwXsPFPNzG/qgzWP7p0o9eBlvKyKjdCz2R99QhqjJYmkYtioBpjJOAMbLMyX
 ovOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=xUsvdR/WeGTYf9wm0poC0ggXriA18BQWFkluydsdRYs=;
 b=OnK7Mp/wRwIQ2nZGrwHPtKG9hNpicA8OnxvPVcNV07lMH5gTardOsEIhhtmcG3un1w
 v3fUYSlD9SsCi4Akewe65n5vdfbMLgpsEpq7QVIgm1zWqPh3lD2drEp66jcipDt+JUu5
 ticPsAyXd/s4h75AG+ysJtuQDmlyidA0jKS0pdAG+zwghQ2+B3XV7nhScuJJnnymQV7M
 BTyg4FJ/2+iK3Xen27VOTopz5FNrifhxjs6cdUegOJa67hoVgaBBvLe+qLb7Ql8OAoxD
 TOasEBH8+k3Wsjs0UL352THyp0LuprEIYIBiqt3iQqxpSTx8u1IIBBbP1x34p+61uk+f
 Y7kA==
X-Gm-Message-State: AOAM531GYtFPesZ61HeIguIv2k7WSwfgu/jgc0mB5oRu1HFMcHQ5Ynrn
 gLUi4QVl8qWI83pH0bmw9O5HOg==
X-Google-Smtp-Source: ABdhPJwon213LIfdCYvAOzDUqZYJfH9VYNfLieHDt76eK9jdAu/WN2Tc3bo0+Cu83Kc4apAyMMxsYw==
X-Received: by 2002:a17:906:94d4:: with SMTP id
 d20mr14194179ejy.475.1608538513189; 
 Mon, 21 Dec 2020 00:15:13 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id r7sm21421717edh.86.2020.12.21.00.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 00:15:12 -0800 (PST)
References: <20201218154544.25513-1-lars@metafoo.de>
 <1jeejnnko5.fsf@starbuckisacylon.baylibre.com>
 <fa1f3bcc-885a-9258-6653-3d5a5dc4708e@metafoo.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: meson: Use managed DMA buffer allocation
In-reply-to: <fa1f3bcc-885a-9258-6653-3d5a5dc4708e@metafoo.de>
Message-ID: <1jbleno9rk.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 21 Dec 2020 09:15:11 +0100
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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


On Fri 18 Dec 2020 at 18:41, Lars-Peter Clausen <lars@metafoo.de> wrote:

> On 12/18/20 5:28 PM, Jerome Brunet wrote:
>> On Fri 18 Dec 2020 at 16:45, Lars-Peter Clausen <lars@metafoo.de> wrote:
>>
>>> Using a managed buffer will pre-allocate the buffer using
>>> snd_pcm_lib_preallocate_pages() and automatically free it when the PCM is
>>> destroyed.
>>>
>>> In addition it will call snd_pcm_lib_malloc_pages() before the driver's
>>> hw_params() callback and snd_pcm_lib_free_pages() after the driver's
>>> hw_free() callback.
>>>
>>> This slightly reduces the boilerplate code of the driver.
>>>
>>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>>> ---
>>>   sound/soc/meson/aiu-fifo-i2s.c   |  1 -
>>>   sound/soc/meson/aiu-fifo-spdif.c |  1 -
>>>   sound/soc/meson/aiu-fifo.c       | 18 ++----------------
>>>   3 files changed, 2 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
>>> index d91b0d874342..2388a2d0b3a6 100644
>>> --- a/sound/soc/meson/aiu-fifo-i2s.c
>>> +++ b/sound/soc/meson/aiu-fifo-i2s.c
>>> @@ -124,7 +124,6 @@ const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops = {
>>>   	.trigger	= aiu_fifo_i2s_trigger,
>>>   	.prepare	= aiu_fifo_i2s_prepare,
>>>   	.hw_params	= aiu_fifo_i2s_hw_params,
>>> -	.hw_free	= aiu_fifo_hw_free,
>>>   	.startup	= aiu_fifo_startup,
>>>   	.shutdown	= aiu_fifo_shutdown,
>>>   };
>>> diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
>>> index 44eb6faacf44..2fb30f89bf7a 100644
>>> --- a/sound/soc/meson/aiu-fifo-spdif.c
>>> +++ b/sound/soc/meson/aiu-fifo-spdif.c
>>> @@ -158,7 +158,6 @@ const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops = {
>>>   	.trigger	= fifo_spdif_trigger,
>>>   	.prepare	= fifo_spdif_prepare,
>>>   	.hw_params	= fifo_spdif_hw_params,
>>> -	.hw_free	= aiu_fifo_hw_free,
>>>   	.startup	= aiu_fifo_startup,
>>>   	.shutdown	= aiu_fifo_shutdown,
>>>   };
>>> diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
>>> index aa88aae8e517..4ad23267cace 100644
>>> --- a/sound/soc/meson/aiu-fifo.c
>>> +++ b/sound/soc/meson/aiu-fifo.c
>>> @@ -99,11 +99,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>>>   	struct snd_soc_component *component = dai->component;
>>>   	struct aiu_fifo *fifo = dai->playback_dma_data;
>>>   	dma_addr_t end;
>>> -	int ret;
>>> -
>>> -	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
>>> -	if (ret < 0)
>>> -		return ret;
>>>     	/* Setup the fifo boundaries */
>>>   	end = runtime->dma_addr + runtime->dma_bytes - fifo->fifo_block;
>>> @@ -124,12 +119,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>>>   	return 0;
>>>   }
>>>   -int aiu_fifo_hw_free(struct snd_pcm_substream *substream,
>>> -		     struct snd_soc_dai *dai)
>>> -{
>>> -	return snd_pcm_lib_free_pages(substream);
>>> -}
>>> -
>>>   static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
>>>   {
>>>   	struct snd_pcm_substream *playback = dev_id;
>>> @@ -187,15 +176,12 @@ void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
>>>   int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
>>>   		     struct snd_soc_dai *dai)
>>>   {
>>> -	struct snd_pcm_substream *substream =
>>> -		rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>>>   	struct snd_card *card = rtd->card->snd_card;
>>>   	struct aiu_fifo *fifo = dai->playback_dma_data;
>>>   	size_t size = fifo->pcm->buffer_bytes_max;
>>>   -	snd_pcm_lib_preallocate_pages(substream,
>>> -				      SNDRV_DMA_TYPE_DEV,
>>> -				      card->dev, size, size);
>>> +	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
>>> +				       card->dev, size, size);
>> Hi Lars-Peter,
>>
>> These FIFOs only do playback so to avoid wasting memory
>> s/snd_pcm_set_managed_buffer_all/snd_pcm_set_managed_buffer ?
>
> snd_pcm_set_managed_buffer_all() will skip substreams that do not
> exist. E.g. if the there is not capture support it wont allocate
> memory for it.

Indeed, Thanks !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

>
> To keep things simple I prefer snd_pcm_set_managed_buffer_all(). snd_pcm_set_managed_buffer() only makes sense if you have a different DMA device for capture and playback or you want different buffer sizes.

