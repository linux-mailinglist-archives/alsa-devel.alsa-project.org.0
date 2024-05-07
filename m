Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D518BE39F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 15:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4831082C;
	Tue,  7 May 2024 15:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4831082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715088088;
	bh=mamtRdpVuLvc5n7H5rO8CzIxnBOX+3m2jzq6NAnyw8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hGEvbT6fCYLu2JAOA/DOVh8U48KQ4YyuBe0rzNjDFo4eLtzuWN0ffPOn+cZ6lH0LZ
	 Qb4kiOz4LRFip7ki75LDl/dAeXQr6ro3pz6KfaxN8SNzvW4jD6tYoeVaD26vvxZATm
	 NxrlTLNg4EYRvSqJXfoQwrxW5MdpoMWR7d2bUavk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C0A3F80570; Tue,  7 May 2024 15:20:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E6BAF805A0;
	Tue,  7 May 2024 15:20:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D02B8F8049C; Tue,  7 May 2024 15:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 236B1F8024C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 15:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 236B1F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bmm1pxF7
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52006fbae67so4377666e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715088044; x=1715692844;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K752O0Pcm3pbK7QoMDyqSQ3O3yzgRSedQhsNAlMKLtQ=;
        b=bmm1pxF72NhQ27AZEIWtDpM03yQCYNygxS/HkWpx+P1GIesBGctzUIzkgcyprAqTC7
         vnhSUWtMLQVsloyMo69tyZ+81dYReo72cjRAYifs79O4TAYJ/Lt2AZZRNwNO7vlsn69b
         ZPRX33pnDAsSWqaGoKnyKUPH4Q9DJraB+a+jpBmJUpjhpTs+IgWDeWOlqfETnot1kP4I
         rDvYFDd8os4thqhsMQlMoDzyyOwHFEnm/UlgASqv29l8Uo+ttmgGfgRY+ioPN4cUE0Jj
         Xfn7Y2IumenhK7l8Sy90AyPFk16DsLCp4phVT0tY7K3ZiHfnP03+VQ4YystwtY6OwuDI
         km+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715088044; x=1715692844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K752O0Pcm3pbK7QoMDyqSQ3O3yzgRSedQhsNAlMKLtQ=;
        b=avULFc5YAHNruz3QymLdLIfkFcLLZh+jH6SAkSHstFOfSJP6HUL6PQOAwwvV90cwQF
         Un+wkgDey13Qh3zfiuYDLjE6HlIwiQszz9wVtuCVN7gKp07FZEPAyau2y/eXgUlfzRMo
         ji6T9Id10Xe0sIQTG/i8ByifLtD9Gv0bS/M38aMgCFeHpIjfbSxC9lXvk2PktG5WjenV
         I/itp7S5Iazo8ztrgjVDxYG7TSz4CkppasFyVJ70zCIn1D2pSJTGSwEe1S6Hko4jfrhs
         +8PTqfqdiTWd3dx2ko+ccLeOp08c19MtEVmtMs6LfOU3fo0kBEqeu9sR7mj7vWeOk8uy
         uFKQ==
X-Gm-Message-State: AOJu0YyC5zA2qlXlXXLavOcTzVt8gWnCKv/fTL9mswxdHlZKji4PA51Q
	Lpczv/6Ur5ki9Zz6mOFSKxsFM8rIC9ayird0lxOHkU7J1UiUT8MAe3FQSvGH1yA=
X-Google-Smtp-Source: 
 AGHT+IEGgqheSj5TrFbScUYvwODCUxXLu8LisrOI8dAlAhc9ZxNegHyZOZbMATbWnAgxeOagu8p+xA==
X-Received: by 2002:ac2:490b:0:b0:51e:fd97:af89 with SMTP id
 n11-20020ac2490b000000b0051efd97af89mr8145136lfi.16.1715088043422;
        Tue, 07 May 2024 06:20:43 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 a6-20020a05600c348600b0041c14e42e2bsm19558165wmq.44.2024.05.07.06.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 06:20:42 -0700 (PDT)
Message-ID: <738045d2-a445-4f93-abfd-203348a538d1@linaro.org>
Date: Tue, 7 May 2024 14:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: qcom: x1e80100: Correct channel mapping
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
 <20240507-asoc-x1e80100-4-channel-mapping-v1-4-b12c13e0a55d@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-4-b12c13e0a55d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KPH6QG7OX7KCTBW22EYVFUWA637SXKCY
X-Message-ID-Hash: KPH6QG7OX7KCTBW22EYVFUWA637SXKCY
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPH6QG7OX7KCTBW22EYVFUWA637SXKCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Krzystof for the patch.

On 07/05/2024 11:27, Krzysztof Kozlowski wrote:
> X1E80100 CRD board comes with four speakers arranged as left front+back
> and then right front+back.  Using default channel mapping causes front
> right speaker to play left back stream.
> 
> Adjust the channel maps for frontend DAIs to fix stereo and four-channel
> playback.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   sound/soc/qcom/x1e80100.c | 37 +++++++++++++++++++++++++++++++++++--
>   1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
> index c3c8bf7ffb5b..e90c68815b5c 100644
> --- a/sound/soc/qcom/x1e80100.c
> +++ b/sound/soc/qcom/x1e80100.c
> @@ -12,6 +12,7 @@
>   
>   #include "common.h"
>   #include "qdsp6/q6afe.h"
> +#include "qdsp6/q6dsp-common.h"
>   #include "sdw.h"
>   
>   struct x1e80100_snd_data {
> @@ -74,7 +75,7 @@ static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
>   	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
>   }
>   
> -static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
> +static int x1e80100_snd_be_prepare(struct snd_pcm_substream *substream)
>   {
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>   	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> @@ -96,12 +97,34 @@ static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
>   				    &data->stream_prepared[cpu_dai->id]);
>   }
>   
> +static int x1e80100_snd_fe_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		const unsigned int rx_slot[4] = { PCM_CHANNEL_FL,
> +						  PCM_CHANNEL_LB,
> +						  PCM_CHANNEL_FR,
> +						  PCM_CHANNEL_RB };
> +
> +		snd_soc_dai_set_channel_map(cpu_dai, 0, NULL, ARRAY_SIZE(rx_slot),
> +					    rx_slot);

Channel mapping are specific to backend dais rather than front end pcm dais.

This will set all the playback pcms with this channel maps, which is a 
problem.

example the 2 channel headset we will endup with data of front channel 
and zeros on the right channel, however a speaker might work as you have 
4 speakers in your system.


So No for this approach.


--srini

> +	}
> +
> +	return 0;
> +}
> +
>   static const struct snd_soc_ops x1e80100_be_ops = {
>   	.startup = qcom_snd_sdw_startup,
>   	.shutdown = x1e80100_snd_shutdown,
>   	.hw_params = x1e80100_snd_hw_params,
>   	.hw_free = x1e80100_snd_hw_free,
> -	.prepare = x1e80100_snd_prepare,
> +	.prepare = x1e80100_snd_be_prepare,
> +};
> +
> +static const struct snd_soc_ops x1e80100_fe_ops = {
> +	.prepare = x1e80100_snd_fe_prepare,
>   };
>   
>   static void x1e80100_add_be_ops(struct snd_soc_card *card)
> @@ -118,6 +141,15 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
>   	}
>   }
>   
> +static int x1e80100_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
> +{
> +	/* Add ops for Frontend DAIs coming from Topology */
> +	if (link->dynamic && !link->no_pcm && !link->ops)
> +		link->ops = &x1e80100_fe_ops;
> +
> +	return 0;
> +}
> +
>   static int x1e80100_platform_probe(struct platform_device *pdev)
>   {
>   	struct snd_soc_card *card;
> @@ -135,6 +167,7 @@ static int x1e80100_platform_probe(struct platform_device *pdev)
>   
>   	card->owner = THIS_MODULE;
>   	card->dev = dev;
> +	card->add_dai_link = x1e80100_add_dai_link;
>   	dev_set_drvdata(dev, card);
>   	snd_soc_card_set_drvdata(card, data);
>   
> 
