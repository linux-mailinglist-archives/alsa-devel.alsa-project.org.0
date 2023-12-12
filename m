Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F080EACA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 12:48:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB91A4D;
	Tue, 12 Dec 2023 12:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB91A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702381705;
	bh=RpN04WpyILBfbPLnRM4vJIij3bJPtkTqcq/Cb0EFR1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JA//grlw385sdq9nQbuH7IiLaN662AYvPVb+p/6BIOf1VoG+FM4FHfN4nxQDzwsmd
	 tnu/KecltVDgfVlRaFls5mjUR7+RYdAZbtdKJNVFm4fE0VaNu3gg0CEvMpE1/jXFvD
	 lOqOqD4nXHJY+vimgXHFKS3iyE1oobNRLgThVGTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9CC1F8020D; Tue, 12 Dec 2023 12:47:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB9AF80570;
	Tue, 12 Dec 2023 12:47:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0936EF8016A; Tue, 12 Dec 2023 12:47:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A4EAF8001F
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 12:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A4EAF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OOPdfGxP
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-550dd0e3304so4288941a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Dec 2023 03:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702381658; x=1702986458;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeJt1SlvJ2BjVo+T8o9WuujZC5zAwSMZRcDz9J4jRUA=;
        b=OOPdfGxPiHuIDvrjfQAc2UjG4iM5inG0IIfEL409cIoRimcddVGMukS+Z7gC30LWzI
         Uow0M9CRnbfccjBX+r0mBVbjep3lmEOxiZ/w9ziNGbsPHU0xpns/XRe31ZtZq8iE8wbJ
         H0T0f72IU2z/j5CjMSlHsRE4rhfKoHfA44alPP/jDl8ABVpxlRQwOjqlooSBN7sQJpQY
         Y4rwGtWkMbdcNH4v3gi4dgAdwWreChfWRizTCEqo7o54/UUJ/c/1nKxE/6cvl8/cL9xD
         3CwCQJdG/PlLjcEs5xBfGGemsO/VhhH9l+CKV0jl9qSDdpE6kLPSrA+Hv41xJ0aTw8p0
         PwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702381658; x=1702986458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeJt1SlvJ2BjVo+T8o9WuujZC5zAwSMZRcDz9J4jRUA=;
        b=sgt6b34ycryZ7W0nGis3QJgnK6T3WgdkfITYpKq27VlvNqX9rbSRHSyzzImrFWX2zl
         k9LlbChQJFqQ4QFqL5Vd1YaVrlGSvD/ARg29iioqu5C2l2CTTsWpc5orKnJFSkohGchK
         ZpbpOkh8eXE/BUySB7zknik1V2u0RnpXMATUYONNsy+vZ2gF3OwJ+htaJCg7bagJZenV
         dMVbDF7CubObHJ4Cd+TcUGXc9hEed5C8OA/sSp/iPe+8+QextYPUOd1GkqYnTur/6b8w
         1+DVBubtDMzCrSIWYA0pvImIbKijSbooZ1OBcY8EhT+2ph6DYdlfVsM+XrlGieGroVji
         /XAQ==
X-Gm-Message-State: AOJu0YzClcTxI9modx2mB0lwgj5gtqI+MtCFgtI60oeMJjg9y1zPl1Et
	xlesMLsWeant5glirEsIWVzBeA==
X-Google-Smtp-Source: 
 AGHT+IFjELsRWgldVYuEXuwAZ8zX+ftLOkWb54t7FJjL6MAEhFL8aAHQRMir0ZoV8uzFjZ7aN4mCxw==
X-Received: by 2002:aa7:cc86:0:b0:54c:c464:5b5 with SMTP id
 p6-20020aa7cc86000000b0054cc46405b5mr3354740edt.46.1702381657928;
        Tue, 12 Dec 2023 03:47:37 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 k13-20020a50cb8d000000b0054cc7a4dc4csm4521908edi.13.2023.12.12.03.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 03:47:37 -0800 (PST)
Message-ID: <c43c4303-ed59-49e7-940a-62df6ad1b575@linaro.org>
Date: Tue, 12 Dec 2023 11:47:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC, PATCH v2 1/2] ASoC: qcom: sdw: Add TDM support
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231212095850.26482-1-lujianhua000@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231212095850.26482-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TNPKT4TAXZP37M3LBTICSMMUPPQVGIPT
X-Message-ID-Hash: TNPKT4TAXZP37M3LBTICSMMUPPQVGIPT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNPKT4TAXZP37M3LBTICSMMUPPQVGIPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thankyou for the patch,


On 12/12/2023 09:58, Jianhua Lu wrote:
> Add qcom TDM setup function to support TDM ports for qcom platform.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>    1. remove EXPORT_SYMBOL_GPL
>    2. remove static modifier
> 
>   sound/soc/qcom/sdw.c | 63 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
> index 77dbe0c28b29..948abbd2e0e3 100644
> --- a/sound/soc/qcom/sdw.c
> +++ b/sound/soc/qcom/sdw.c
> @@ -4,6 +4,7 @@
>   
>   #include <dt-bindings/sound/qcom,q6afe.h>
>   #include <linux/module.h>
> +#include <sound/pcm_params.h>
>   #include <sound/soc.h>
>   #include "sdw.h"
>   
> @@ -101,6 +102,65 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
>   }
>   EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
>   
> +int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params)
> +{

TBH, this should not be part of sdw.c file, its intended for more of 
soundwire specific helpers, pl consider moving this to common.c for now.
Because, Not all old qcom platforms have soundwire controllers.

> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	unsigned int tdm_slot_offset[8] = { 0, 4, 8, 12, 16, 20, 24, 28 };
> +	int channels, slot_width;
> +	int ret;
> +
> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		slot_width = 16;
> +		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		slot_width = 24;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		slot_width = 32;
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid param format 0x%x\n", __func__,
> +			params_format(params));
> +		return -EINVAL;
> +	}
> +
> +	channels = params_channels(params);
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3, 8, slot_width);

slot mask is always set to 2 channels in this case, should you not check 
the number of channels to determine the correct one?


These magic number 0, 0x3, 8 seems to make the code unreadable, can you 
do something like this:
snd_soc_dai_set_tdm_slot(cpu_dai, tx_mask, rx_mask, 
ARRAY_SIZE(tdm_slot_offset), slot_width);


> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
> +				__func__, ret);
> +			return ret;
> +		}
> +
> +		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL, channels,
> +						  tdm_slot_offset);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
> +				__func__, ret);
> +			return ret;
> +		}
> +	} else {
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0, 8, slot_width);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
> +				__func__, ret);
> +			return ret;
> +		}
> +
> +		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
> +						  tdm_slot_offset, 0, NULL);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
> +				__func__, ret);
> +			return ret;
> +		}
> +	}
Finally  ./sound/soc/qcom/sdm845.c does have exactly same code, can you 
consider removing this and make use of this new helper in that file too.


> +}
> +
>   int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
>   			   struct snd_pcm_hw_params *params,
>   			   struct sdw_stream_runtime **psruntime)
> @@ -125,6 +185,9 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
>   				*psruntime = sruntime;
>   		}
>   		break;
> +	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
> +		qcom_snd_tdm_hw_params(substream, params);
> +		break;
>   	}
>   
>   	return 0;
