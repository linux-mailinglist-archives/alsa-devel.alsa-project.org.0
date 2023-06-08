Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34967285C8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 18:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6BEE822;
	Thu,  8 Jun 2023 18:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6BEE822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686243018;
	bh=SVz2f+sEsfH02QxNg3O9FU2qxfkkWZibtld7G/1WxWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qfZClEk2fkfNMoO7xzssmglPNurI1A1J3huHYSWK29I4/UbkoLkOosCvWLymPx9O2
	 oVoYB05Q0eCFhnwQeJMn00PjEfEOSduRzMv7jQEJIrQw4MWBL4MZt/waSUEfespeak
	 aQ3IZQPI87JXKyCxsBN1HlIoFCR4QIlgmjqHcrZ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ED4CF80563; Thu,  8 Jun 2023 18:49:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E246AF80290;
	Thu,  8 Jun 2023 18:49:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1A2AF804DA; Thu,  8 Jun 2023 18:49:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 351D8F800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 18:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 351D8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=S+ZYjzMR
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30e3caa6aa7so901524f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 09:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686242956; x=1688834956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNPS/7M38Nz5+BxtavsFAB/Ran6aZSE4F1torzsLy44=;
        b=S+ZYjzMReZv+Fa4/OK0AfYtiJ58HD4NXFwHpZKe+y9QUC3S6B3mNIkv6dJz7KYQthI
         pJ8MDyFe9Ci6KH5SoljgPyqRcLL5gl2h7L/VGyrnJBsWzNqI+OtEqd5ujibPkeJCJb7F
         BNsooxHfoaPkVRiFh6ZKUlDDHUxpVkg73LacJAVjRScco9rwRjBD3M/xyvaFgiOhdJ2/
         xa0Xsny5n6i/5cxka/V1b4UvixcRKz6pu/wDJ3yZ6nvWeZqUPRYbviyG55IoMmfpYAFc
         lUVu62dXNmQgVSGY0YmQYPrDZ/kuz8nBfJqc5CUH6bgQNZKTD49e6woImHADs6bs2Xf2
         eOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242956; x=1688834956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNPS/7M38Nz5+BxtavsFAB/Ran6aZSE4F1torzsLy44=;
        b=XhP195sKSbIB7rwx83CXNVb7xnN6AyibDmIkKf6ZARqg7KkitxGQIodHo8vyK1jrbh
         XFvgYB5fCJzDdO8UA38udVTC+2oSZ/Q36SO15D6eB8sV7yCDOFIhQOrnwpNsEHtE+KwH
         M+55Te5/prDdkjzBJLaxsFMQarjejaKP5AOmmGk3ANg+x4e2HyOyuXccEBg+7CcIcriR
         BUk23T7CV4IrAg0WU0jMbwvO/4sldACqDlYsKkm8kTbAH38rqty75yJ5iCy8MtQhK8rC
         rfEtGPDxJzWKKDDz5Gwljkba7SBESNg0aNSpRxNW+yxBL5aZlejXZak82z4oygJuTv95
         9EyQ==
X-Gm-Message-State: AC+VfDwfkiIn2kcDbMO9g3L/BihIS6GYDlqU3ASlMbDrJp+sH8ULkQTl
	3ILfjfP5RI9IDBTSQOzXNLA=
X-Google-Smtp-Source: 
 ACHHUZ77CeU9LlusWbTYX/0bQN+RqGpPsH5qayXpKqdIVOBhbDFoXVf1dKOoEkCu5uTSC/6Yr7C0oA==
X-Received: by 2002:adf:fd46:0:b0:30e:5c55:3e42 with SMTP id
 h6-20020adffd46000000b0030e5c553e42mr4107354wrs.56.1686242956394;
        Thu, 08 Jun 2023 09:49:16 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id
 a9-20020a5d5089000000b0030ae973c2e7sm2059546wrt.83.2023.06.08.09.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:49:15 -0700 (PDT)
Message-ID: <2ea8d3cf-40d3-3409-5f53-e2eb117ffd9c@gmail.com>
Date: Thu, 8 Jun 2023 18:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/5] ASoC: mediatek: mt8188-mt6359: Cleanup return 0
 disguised as return ret
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, amergnat@baylibre.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-4-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230608084727.74403-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WMED7S6MMMY6TTYYAITGD5762NFBJOHW
X-Message-ID-Hash: WMED7S6MMMY6TTYYAITGD5762NFBJOHW
X-MailFrom: matthias.bgg@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMED7S6MMMY6TTYYAITGD5762NFBJOHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> Change all instances of `return ret` to `return 0` at the end of
> functions where ret is always zero and also change functions
> mt8188_{hdmi,dptx}_codec_init to be consistent with how other
> functions are returning errors
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index b2735496d140..260cace408b9 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -491,11 +491,13 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
>   	}
>   
>   	ret = snd_soc_component_set_jack(component, &priv->hdmi_jack, NULL);
> -	if (ret)
> +	if (ret) {
>   		dev_info(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
>   			 __func__, component->name, ret);
> +		return ret;
> +	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
> @@ -513,11 +515,13 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
>   	}
>   
>   	ret = snd_soc_component_set_jack(component, &priv->dp_jack, NULL);
> -	if (ret)
> +	if (ret) {
>   		dev_info(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
>   			 __func__, component->name, ret);
> +		return ret;
> +	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int mt8188_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
> @@ -539,7 +543,7 @@ static int mt8188_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
>   		return ret;
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int mt8188_max98390_hw_params(struct snd_pcm_substream *substream,
> @@ -612,7 +616,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
>   		return ret;
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
> @@ -660,7 +664,7 @@ static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
>   		return ret;
>   	}
>   
> -	return ret;
> +	return 0;
>   };
>   
>   static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
> @@ -697,7 +701,7 @@ static int mt8188_nau8825_hw_params(struct snd_pcm_substream *substream,
>   		return ret;
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static const struct snd_soc_ops mt8188_nau8825_ops = {
