Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B816E1846B0
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 13:18:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59DFB17FB;
	Fri, 13 Mar 2020 13:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59DFB17FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584101928;
	bh=DvONzNZQuBFJ2LNOY0m2EHP88qh7oufrh1hPXYJrNcA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JtvZ7PcMHqxrxD8bLrcAOkLGnEKdv8gBy9D8EqzExKEeH4fWBTmL6BoQXcL2ROM9D
	 H2TX1T8APKYhDge63Xqfdj0NnNdMqSKdAV7UKd1o68Ju5RyF5x5UK48aKdCc9cNJJm
	 qasrbyiPsxcTfH1/WAiKAca+fciVx4Ab2BUbWO7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A840DF8028D;
	Fri, 13 Mar 2020 13:16:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FE48F801F7; Fri, 13 Mar 2020 13:15:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1243AF80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1243AF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ivrnIzrt"
Received: by mail-wm1-x344.google.com with SMTP id f7so10037147wml.4
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bEk7S7Dnd0BzCyFDN1a5hqfpt0sia9NmxQj/OgqMtaY=;
 b=ivrnIzrtSb317R27s6UIuB8l1eRMFATY6xEueaZ9KFH+WmhD6bTED40vT+v2Iw+RIT
 +EVGP7Dblt0JJSWK97d1PnXU9wER9/oKLqyqwtD7B84efCSQtQCHA8jaJBpnSf66/qIY
 3HS86wRhMXfS7F4BHpu5Njizex3YV3/kwUq5iDgd/6OJ/vAh5NP7Z3VvwEC5UMeEIiyf
 vtvv1LEKrW/DZIVP6V+anPSt97bHI6iGJRqYCzc5ErM6NJmnZwMy0S9J79jfjq6IXtFj
 UcAVJXqKp5P/6bMtMdWPXl86CIF3O4K/FxOCeXjs1v1/ZrRN08Toh4KimCwUjhdsF8Bp
 BfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bEk7S7Dnd0BzCyFDN1a5hqfpt0sia9NmxQj/OgqMtaY=;
 b=KWCG4FFGMaItuczg36vq0umPF8Dzxlh4qn5hMuXig5gWsBZ3J8Y+h4d+ZXHz4hy+L+
 JljAg1xvX9k0pciAT8Nv31T7KxhD4sLApK1sX+lbiARVnVFVJESCaoLqdzGrjihb/4Ts
 BQUUUhxa1OJOG+dlIYns3eT3yotoZl6DkDQ6Czy0bA8v+F8swSstPjIqbSFuqXrTGeD4
 pdcjfZpRoB3t1ti0Ik5ba1FoUSLv8zfYqILeSg/Uw3jck+KswgMCvn0PywX7xu0q8yBu
 VEVBtiJk212a/ugtMj+jR7nZvTeeYHNvpW5CG+ScUfzkmGLj19kqJ7/2SlVQt+2Hu9pX
 ZrlQ==
X-Gm-Message-State: ANhLgQ1bd3KNj7UPbtNaTVawsbPbt5Y6jhmdC80zb6eIlHE2gd+caiwc
 0HYzLSr2US3MXn/I0QPz6bbqug==
X-Google-Smtp-Source: ADFU+vsU8bP/cl627H526e80+fYdUA5wijE1PisL9EbmsVGYHyWfszDXSnlk7wtJ3xCHDtXQZgg1/Q==
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr10952728wmi.79.1584101735900; 
 Fri, 13 Mar 2020 05:15:35 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id x9sm40720370wrx.0.2020.03.13.05.15.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 05:15:35 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 5/9] ASoC: qcom: q6asm-dai: add support to wma
 decoder
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20200313101627.1561365-1-vkoul@kernel.org>
 <20200313101627.1561365-6-vkoul@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bb1923d8-8374-4e1b-e211-372406196e09@linaro.org>
Date: Fri, 13 Mar 2020 12:15:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200313101627.1561365-6-vkoul@kernel.org>
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
> Qualcomm DSPs also supports the wma decoder, so add support for wma
> decoder and convert the snd_codec_params to qdsp format.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/qcom/qdsp6/q6asm-dai.c | 67 +++++++++++++++++++++++++++++++-
>   1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 8f245d03b6f5..53c250778eea 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -627,10 +627,13 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
>   	int dir = stream->direction;
>   	struct q6asm_dai_data *pdata;
>   	struct q6asm_flac_cfg flac_cfg;
> +	struct q6asm_wma_cfg wma_cfg;
> +	unsigned int wma_v9 = 0;
>   	struct device *dev = c->dev;
>   	int ret;
>   	union snd_codec_options *codec_options;
>   	struct snd_dec_flac *flac;
> +	struct snd_dec_wma *wma;
>   
>   	codec_options = &(prtd->codec_param.codec.options);
>   
> @@ -692,6 +695,67 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
>   			return -EIO;
>   		}
>   		break;
> +
> +	case SND_AUDIOCODEC_WMA:
> +		wma = &codec_options->wma_d;
> +
> +		memset(&wma_cfg, 0x0, sizeof(struct q6asm_wma_cfg));
> +
> +		wma_cfg.sample_rate =  params->codec.sample_rate;
> +		wma_cfg.num_channels = params->codec.ch_in;
> +		wma_cfg.bytes_per_sec = params->codec.bit_rate / 8;
> +		wma_cfg.block_align = params->codec.align;
> +		wma_cfg.bits_per_sample = prtd->bits_per_sample;
> +		wma_cfg.enc_options = wma->encoder_option;
> +		wma_cfg.adv_enc_options = wma->adv_encoder_option;
> +		wma_cfg.adv_enc_options2 = wma->adv_encoder_option2;
> +
> +		if (wma_cfg.num_channels == 1)
> +			wma_cfg.channel_mask = 4; /* Mono Center */
> +		else if (wma_cfg.num_channels == 2)
> +			wma_cfg.channel_mask = 3; /* Stereo FL/FR */
> +		else
> +			return -EINVAL;
> +
> +		/* check the codec profile */
> +		switch (params->codec.profile) {
> +		case SND_AUDIOPROFILE_WMA9:
> +			wma_cfg.fmtag = 0x161;
> +			wma_v9 = 1;
> +			break;
> +
> +		case SND_AUDIOPROFILE_WMA10:
> +			wma_cfg.fmtag = 0x166;
> +			break;
> +
> +		case SND_AUDIOPROFILE_WMA9_PRO:
> +			wma_cfg.fmtag = 0x162;
> +			break;
> +
> +		case SND_AUDIOPROFILE_WMA9_LOSSLESS:
> +			wma_cfg.fmtag = 0x163;
> +			break;
> +
> +		case SND_AUDIOPROFILE_WMA10_LOSSLESS:
> +			wma_cfg.fmtag = 0x167;
> +			break;
> +
> +		default:
> +			dev_err(dev, "Unknown WMA profile:%x\n",
> +				params->codec.profile);
> +			return -EIO;
> +		}
> +
> +		if (wma_v9)
> +			ret = q6asm_stream_media_format_block_wma_v9(
> +					prtd->audio_client, &wma_cfg);
> +		else
> +			ret = q6asm_stream_media_format_block_wma_v10(
> +					prtd->audio_client, &wma_cfg);
> +		if (ret < 0) {
> +			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
> +			return -EIO;
> +		}
>   	default:
>   		break;
>   	}
> @@ -791,9 +855,10 @@ static int q6asm_dai_compr_get_caps(struct snd_compr_stream *stream,
>   	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
>   	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
>   	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
> -	caps->num_codecs = 2;
> +	caps->num_codecs = 3;
>   	caps->codecs[0] = SND_AUDIOCODEC_MP3;
>   	caps->codecs[1] = SND_AUDIOCODEC_FLAC;
> +	caps->codecs[2] = SND_AUDIOCODEC_WMA;
>   
>   	return 0;
>   }
> 
