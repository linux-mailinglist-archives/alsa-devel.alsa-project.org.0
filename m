Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C581846B7
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 13:19:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83CD1803;
	Fri, 13 Mar 2020 13:18:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83CD1803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584101984;
	bh=AZO01oN46GyI0PrBJcn2yxaV9nQ+LiVN2TtlFSUnxd4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQlfM1SowarXKdCA2k5DPpKPfARzQE0UqbgoyHmf/FEwIq2gnaC9pV++5Xn3r8EMG
	 EfMAwWM6sBn5WnUAL6k6Okby0R/Ld8I6GFH8+tqa+APo8FtHv1cZoflfdDAwDp/HhQ
	 6ShkJHEaKWAgEgrK3mKX2SbusMYgWFf8UiA1090U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC26F8029A;
	Fri, 13 Mar 2020 13:16:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59E57F801EB; Fri, 13 Mar 2020 13:16:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42A87F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:16:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A87F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uyl+0f2v"
Received: by mail-wm1-x343.google.com with SMTP id m3so10051111wmi.0
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cos0z2ZnLdhgTrKzYZS98WN2zx2uM2u3a3GtghXGyMM=;
 b=uyl+0f2vW+990e+EP5QFGafFeKSM6QnC39sXPkUFRtsjZ8lFkyt4cSw06tKYg+HK7Y
 ynoknG21PmZ/TvatDsuQn4GliguyX86GIMXfgnhFutfl7vOniKKVsLMrfD9rdpt2TCD8
 2XSGU05a343XbQ053KCylLmfd4HvmfJJwI+lCaNqsBjSRDKvmEiCiTfBnG6v3OHXQVbU
 +PzDGeqBKdSEpj9Sny7kT4D4AfaPxX2rsSFn/TT9htkqy0nCSD+c2ZF47PDzlkVedeH9
 ie3gDjsv5pz23lWzXBqZ7LGQn38y+td+eu7eC7m4WMAh9PGuGuN40zOkP7/cfHhILCED
 6Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cos0z2ZnLdhgTrKzYZS98WN2zx2uM2u3a3GtghXGyMM=;
 b=PznD4TdJ2WLbTbWjkb2ZBhM7YjXcAFjO8lillbGl9N/J5JG5MkiDq8mP9u4AM2LSR0
 hP6aZrBgEPtXUm3mw3XPaP7ZmKM4PsNWRxEu33KdjluZjmuaXTSWiXBS3vR7dm5K8oiO
 5FN3DlCBx6UCtNrsomE+gjpqLD8PsHpKZ7xFXlVsoTCgU1qu3/AltSOPWuLzRpzMpKhY
 SanWWm22x7fxhmWjup9SOdw2sAHvY+R3klnSK+AbIi6CjMr5lLJSvB99ex/ByzzPH7+r
 2q3IBMQ4rLlCqVhpDPAH0Tk7lqEXkpCEGtOIeLrtsMiIkvGnFJ3m8tkkTdrDmKmXfHg+
 2cWA==
X-Gm-Message-State: ANhLgQ3sDRFsi7u94dbELbV5AVm+TK5VSTxQox/A9x/oVIJcpG5xLoFE
 E53glbn3PrT3eGI14xSDnnCrDA==
X-Google-Smtp-Source: ADFU+vuDGoIAUIxQUpdgjLTOoFE9zMYRNI6MCt6NH/LR8YP5yQH95VtC4/lS6iAKjJPkWVF1MOmOMg==
X-Received: by 2002:a1c:5585:: with SMTP id j127mr10605018wmb.35.1584101761142; 
 Fri, 13 Mar 2020 05:16:01 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id v14sm43278354wrr.34.2020.03.13.05.15.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 05:16:00 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 8/9] ASoC: qcom: q6asm-dai: add support for ALAC
 and APE decoders
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20200313101627.1561365-1-vkoul@kernel.org>
 <20200313101627.1561365-9-vkoul@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <fcee2779-fee8-e3d9-590f-e28fc5880ea0@linaro.org>
Date: Fri, 13 Mar 2020 12:15:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200313101627.1561365-9-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
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



On 13/03/2020 10:16, Vinod Koul wrote:
> Qualcomm DSPs also supports the ALAC and APE decoders, so add support
> for these and convert the snd_codec_params to qdsp format.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
One minor nit, other that,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/qdsp6/q6asm-dai.c | 67 +++++++++++++++++++++++++++++++-
>   1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 53c250778eea..948710759824 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -628,12 +628,16 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
>   	struct q6asm_dai_data *pdata;
>   	struct q6asm_flac_cfg flac_cfg;
>   	struct q6asm_wma_cfg wma_cfg;
> +	struct q6asm_alac_cfg alac_cfg;
> +	struct q6asm_ape_cfg ape_cfg;
>   	unsigned int wma_v9 = 0;
>   	struct device *dev = c->dev;
>   	int ret;
>   	union snd_codec_options *codec_options;
>   	struct snd_dec_flac *flac;
>   	struct snd_dec_wma *wma;
> +	struct snd_dec_alac *alac;
> +	struct snd_dec_ape *ape;
>   
>   	codec_options = &(prtd->codec_param.codec.options);
>   
> @@ -756,6 +760,65 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
>   			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
>   			return -EIO;
>   		}
> +		break;
> +
> +	case SND_AUDIOCODEC_ALAC:
> +		memset(&alac_cfg, 0x0, sizeof(alac_cfg));
> +		alac = &codec_options->alac_d;
> +
> +		alac_cfg.sample_rate = params->codec.sample_rate;
> +		alac_cfg.avg_bit_rate = params->codec.bit_rate;
> +		alac_cfg.bit_depth = prtd->bits_per_sample;
> +		alac_cfg.num_channels = params->codec.ch_in;
> +
> +		alac_cfg.frame_length = alac->frame_length;
> +		alac_cfg.pb = alac->pb;
> +		alac_cfg.mb = alac->mb;
> +		alac_cfg.kb = alac->kb;
> +		alac_cfg.max_run = alac->max_run;
> +		alac_cfg.compatible_version = alac->compatible_version;
> +		alac_cfg.max_frame_bytes = alac->max_frame_bytes;
> +
> +		switch (params->codec.ch_in) {
> +		case 1:
> +			alac_cfg.channel_layout_tag = (100 << 16) | 1;

We should probably define this layout tag in asm.h
something like:

#define ALAC_CHANNEL_LAYOUT_TAG_Mono (100<<16) | 1
#define ALAC_CHANNEL_LAYOUT_TAG_STEREO (100<<16) | 2

--srini

> +			break;
> +		case 2:
> +			alac_cfg.channel_layout_tag = (101 << 16) | 2;
> +			break;
> +		}
