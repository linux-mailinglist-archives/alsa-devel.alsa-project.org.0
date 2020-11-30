Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE92C8316
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 12:21:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D9711757;
	Mon, 30 Nov 2020 12:20:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D9711757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606735264;
	bh=73tnbC4P3Sba2rcI/y5qK1USlm3af4bYNqmje9cY1Lo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IwvAs1gq7YdKY/ozbuF4mgoZeLiqR+ZG8vFn8A2HQtzRgZxiMkYylwH6tNQmZnmy4
	 GNF1TvF1BU/JD5luxm5gCFM/q/phE8tu8cWFmMlEG98q9TS0PzvAVLt0FSFRa0UMEQ
	 cJty6Qx8IrhfrpybbLXaRSX2JQgKG6v2ELVfLt30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 078BAF8049C;
	Mon, 30 Nov 2020 12:19:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26BFDF80146; Mon, 30 Nov 2020 12:19:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB242F80146
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 12:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB242F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kXGC/hkX"
Received: by mail-wm1-x344.google.com with SMTP id d3so14950886wmb.4
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 03:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kA1B+3YWtsqZLdoP/PFm3M4IJcbU3ZY5uXa3zxL9D5U=;
 b=kXGC/hkXw3WUjUW8dyzi+KxMgQfPrY9PpqKHsi6N9ndZtsG6e1wl8Up32s/Q/MNzp/
 TG9HDjXySSC8sE2voSaQHmDaGs9ApE6cX2ZNK53ZPBiJ241946+2OdCXXwPPnyrB2g+I
 28BidxQ1k8Au44U2UvYUWh31ljl4YB44MmNzpBNIHXAKL2MNDa3DHBIzbXfbexLzRLoV
 LZWfLOWLBxWYNWAFbrN54yQ203hMABfhBDAabKVsALajqJXsZNN2leThKFjssZbpiSiw
 Z+c5ECJwrCHcsmjolzUkNOdA8OGjcKfgivWeo2E9oLtTVUs9KWRQwfWxaBSN1NwZ9fYe
 bEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kA1B+3YWtsqZLdoP/PFm3M4IJcbU3ZY5uXa3zxL9D5U=;
 b=GUrjF70hOaUkjpFfJc8Y3W2Nm0sOMi3+NFtz7iEneI5MOPrN7uCcBZVWzcYjFZpcP+
 +uRfb1vGTzfgTig4xGNTZAEuV4w0Ne9bFtk77YRhIwPaqyFB32XHncmNyPbLNfX75CZL
 BQcqpVrpxlFmIbkoz+bnJQLTOcqWFtqbFnAqg90oC6/r+3NK7N1fUsaso/aFS1Z2/S0I
 eRA2JI8Smi9fW/Hvx4oeEt83Y0RdyayvmKW8Xog0wME5OFaparPUU2v7bx5HtiogbI9x
 QUjl0xCT0L8NXdKXbR/s+hf3vEfB3O2zXSEzZQ2RX0WO8+IvtX5U9I82DxbRN3PPC+o7
 SCPw==
X-Gm-Message-State: AOAM532RB908Jvch8VHxKXorQd7CeXi3XzQHCE/WjMZE7ay8apgsl2fL
 CYG0ciPf28yjG38QjgYInehaPw==
X-Google-Smtp-Source: ABdhPJx7hVSTJ3o2Q+DoAP6jkZgpwx9aW3qQbrc5tsnfxpODLxn1PpVJnz6LFK/zs2NdbZFgj3iJPw==
X-Received: by 2002:a1c:4802:: with SMTP id v2mr14690593wma.13.1606735155159; 
 Mon, 30 Nov 2020 03:19:15 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id j14sm26432119wrs.49.2020.11.30.03.19.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 03:19:14 -0800 (PST)
Subject: Re: [PATCH v4 2/2] ASoC: qcom: Add support for playback recover after
 resume
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-3-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <76b8d52f-4f54-734f-683a-72fe62fdd8e4@linaro.org>
Date: Mon, 30 Nov 2020 11:19:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1606539559-4277-3-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 28/11/2020 04:59, Srinivasa Rao Mandadapu wrote:
> To support playback continuation after hard suspend(bypass powerd)
> and resume add component driver ops and do regcache sync.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/qcom/lpass-platform.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 0e71899..12764a8 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -827,6 +827,39 @@ static void lpass_platform_pcm_free(struct snd_soc_component *component,
>   	}
>   }
>   
> +static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
> +{
> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct regmap *map;
> +	unsigned int dai_id = component->id;
> +
> +	if (dai_id == LPASS_DP_RX)
> +		map = drvdata->hdmiif_map;
> +	else
> +		map = drvdata->lpaif_map;
> +
> +	regcache_cache_only(map, true);
> +	regcache_mark_dirty(map);
> +
> +	return 0;
> +}
> +
> +static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
> +{
> +	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> +	struct regmap *map;
> +	unsigned int dai_id = component->id;
> +
> +	if (dai_id == LPASS_DP_RX)
> +		map = drvdata->hdmiif_map;
> +	else
> +		map = drvdata->lpaif_map;
> +
> +	regcache_cache_only(map, false);
> +	return regcache_sync(map);
> +}
> +
> +
>   static const struct snd_soc_component_driver lpass_component_driver = {
>   	.name		= DRV_NAME,
>   	.open		= lpass_platform_pcmops_open,
> @@ -839,6 +872,8 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>   	.mmap		= lpass_platform_pcmops_mmap,
>   	.pcm_construct	= lpass_platform_pcm_new,
>   	.pcm_destruct	= lpass_platform_pcm_free,
> +	.suspend		= lpass_platform_pcmops_suspend,
> +	.resume			= lpass_platform_pcmops_resume,
>   
>   };
>   
> 
