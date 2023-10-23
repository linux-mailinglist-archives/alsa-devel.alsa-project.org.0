Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D05117D2D03
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 10:43:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F81A84B;
	Mon, 23 Oct 2023 10:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F81A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698050612;
	bh=9LRGm67VKDy7KTHn79vHx9M5dSqiafahFdfH3F+gDnw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XRhNA1pL/Y/VrK3PE/x5BNAuEws4wlVUiaYpvnADA3YWhzWy0kSf7FPDEDoQzEji4
	 gM2Ch8PpIX9nnY5pBP5hfCRCvF0mVMcnvrzChvjOa9Oh0N28hS7YzLt5Nm/RWcxNPX
	 XuwNQU5QSEXapf6aKfuGjviyI5Gk54/vkkaeEGh0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF45BF80134; Mon, 23 Oct 2023 10:42:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60B80F8032D;
	Mon, 23 Oct 2023 10:42:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A476F804F3; Mon, 23 Oct 2023 10:42:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AFD9F80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 10:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AFD9F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=omX+Zjdt
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40859c46447so11836935e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 01:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698050551; x=1698655351;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikJXXD4nCot/7ZdxIzEXxNGZwix+QfZwpIvhbz0HTEg=;
        b=omX+Zjdt5LYciSS2nPX8clkB0kKDNY7tVQuk6Bo88v5cc71D/MRmunsnArH3Lz7Fxv
         YIMLV/uRoVIwFGynnebZaq2R5O2HzRsuYYxTtOuUOomQtOqMh2hmpNb30ZGQbWsWCfGf
         bouhivSo65dy6Dd+Sx1K9JYAdY3+6OI79iKdPoFnCBSkD+llqVEnHt8JV6h3pf0XFENB
         wqwd+h4oiVvPcp9dOnWeQdETB0WwX/fqeMDitY4r28ZxHMNiPWTe01SS0QjLZGRMw1bd
         EqLqknYxLFZMH09jM8woXV5AY8kcwtACEW64C/7nd11tfWSWDmA8Lh2imScFlQ4B2cgm
         O1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698050551; x=1698655351;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikJXXD4nCot/7ZdxIzEXxNGZwix+QfZwpIvhbz0HTEg=;
        b=ARnZYTvVNpY3H2XQBBiQrcPDjOQtDNOx/JULPa9Wgno/IZsxNcM2zKzTFZ7vL/u3rp
         azTbhtgPvFYK7dDOhoY+Z1KiEQ0gV0WB5z38n7IaI2SexWfd7DNLX1FpJRLjDf5lY7Mb
         Z+XdhL7EqdNWiRFNnw8F1K7LXeCPjxvCwBTtNGttPj0CPCNxapHH+XtQW9y/wLDHfGGU
         hz4HakZUGtINQMj3+iIMR9nWnD/n3NMbibPnfCambmm/72xB0+ctBDTbTOZ4+mHZtNju
         ZS9MziBs3rCY1znXm6QZtgbwOozR2PIEZx8b2sE43JDzbTWpBk4rqUnKpMrIdC69x6u4
         vpMA==
X-Gm-Message-State: AOJu0Yz5zp9+lC26SvTAa9dtQ135fvJBCSespWtWP32uluBKSiphTnyI
	CziEm/mJuSvqorvEeilDcHD35w==
X-Google-Smtp-Source: 
 AGHT+IGbjC803OKFjmD9fXv2m4GNealji5lyvQv0lU9QHvhBHK1BefFG3amc4POEJpiMP3omf+9KeA==
X-Received: by 2002:a5d:6392:0:b0:32d:827e:7bd8 with SMTP id
 p18-20020a5d6392000000b0032d827e7bd8mr7171371wru.70.1698050551160;
        Mon, 23 Oct 2023 01:42:31 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 d17-20020a5d6451000000b0032da022855fsm7244090wrw.111.2023.10.23.01.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 01:42:30 -0700 (PDT)
Message-ID: <f882b666-8a68-4341-a143-cb226ab7d22b@linaro.org>
Date: Mon, 23 Oct 2023 09:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: audioreach: Add 4 channel support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20231020084919.18628-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231020084919.18628-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UMLDBURPEULJG4VD25TJQ2HSBCF4L3CD
X-Message-ID-Hash: UMLDBURPEULJG4VD25TJQ2HSBCF4L3CD
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMLDBURPEULJG4VD25TJQ2HSBCF4L3CD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks for the patch,

On 20/10/2023 09:49, Krzysztof Kozlowski wrote:
> Add support four channel streams.  Map channel 3 and 4 to left/right
> surround ("quad(side)" from ffmpeg standard channel list) to match what
> is in qdsp6/q6dsp-common.c driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

> ---
> 
> quad(side):
> https://trac.ffmpeg.org/wiki/AudioChannelManipulation#Listchannelnamesandstandardchannellayouts
> ---
>   sound/soc/qcom/qdsp6/audioreach.c | 25 ++++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index 5974c7929dd3..4dd2a2e261c9 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -833,6 +833,11 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>   	} else if (num_channels == 2) {
>   		media_format->channel_mapping[0] = PCM_CHANNEL_L;
>   		media_format->channel_mapping[1] = PCM_CHANNEL_R;
> +	} else if (num_channels == 4) {
> +		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
> +		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
> +		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
> +		media_format->channel_mapping[3] = PCM_CHANNEL_RS;


These are fine, but duplicated from q6dsp_map_channels(), Please 
consider using q6dsp_map_channels().

Also when you do that pl get rid of PCM_CHANNEL_L and PCM_CHANNEL_R 
defines in audioreach.h


thanks,
--srini

>   	}
>   
>   	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
> @@ -869,6 +874,11 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
>   		} else if (mcfg->num_channels == 2) {
>   			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_L;
>   			mp3_cfg->channel_mapping[1] =  PCM_CHANNEL_R;
> +		} else if (mcfg->num_channels == 4) {
> +			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_FL;
> +			mp3_cfg->channel_mapping[1] =  PCM_CHANNEL_FR;
> +			mp3_cfg->channel_mapping[2] =  PCM_CHANNEL_LS;
> +			mp3_cfg->channel_mapping[3] =  PCM_CHANNEL_RS;
>   		}
>   		break;
>   	case SND_AUDIOCODEC_AAC:
> @@ -1057,7 +1067,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>   	int rc, payload_size;
>   	struct gpr_pkt *pkt;
>   
> -	if (num_channels > 2) {
> +	if (num_channels > 4) {
>   		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
>   		return -EINVAL;
>   	}
> @@ -1094,7 +1104,11 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>   	} else if (num_channels == 2) {
>   		media_cfg->channel_mapping[0] = PCM_CHANNEL_L;
>   		media_cfg->channel_mapping[1] = PCM_CHANNEL_R;
> -
> +	} else if (num_channels == 4) {
> +		media_cfg->channel_mapping[0] = PCM_CHANNEL_FL;
> +		media_cfg->channel_mapping[1] = PCM_CHANNEL_FR;
> +		media_cfg->channel_mapping[2] = PCM_CHANNEL_LS;
> +		media_cfg->channel_mapping[3] = PCM_CHANNEL_RS;
>   	}
>   
>   	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
> @@ -1116,7 +1130,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>   	struct gpr_pkt *pkt;
>   	void *p;
>   
> -	if (num_channels > 2) {
> +	if (num_channels > 4) {
>   		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
>   		return -EINVAL;
>   	}
> @@ -1158,6 +1172,11 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>   		else if (num_channels == 2) {
>   			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
>   			cfg->channel_mapping[1] =  PCM_CHANNEL_R;
> +		} else if (num_channels == 4) {
> +			cfg->channel_mapping[0] =  PCM_CHANNEL_FL;
> +			cfg->channel_mapping[1] =  PCM_CHANNEL_FR;
> +			cfg->channel_mapping[2] =  PCM_CHANNEL_LS;
> +			cfg->channel_mapping[3] =  PCM_CHANNEL_RS;
>   		}
>   	} else {
>   		rc = audioreach_set_compr_media_format(header, p, mcfg);
