Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B714C2B950C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 15:47:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD7416F5;
	Thu, 19 Nov 2020 15:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD7416F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605797223;
	bh=2o/aCuKaUDQJCxjw9zmaMjArPWIuow8RAI3PAiTmDEU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qdCeFYVSUK/zBlW68FBfLxODNu17iBK7c9xqGIa6ZofPIAiRei8PeBLHiosjeTCbn
	 HqrZre8rD7SQ6SJQ2xiLImDgYs8j52rFD6wxY2YzLBPekvdNW76CcGfxuqvuWdEIMd
	 zT7vGuv1j5rdx6eaZGskokMt8+GTr/hTmcDEuTcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9541F80169;
	Thu, 19 Nov 2020 15:45:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28AC3F801ED; Thu, 19 Nov 2020 15:45:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BA7EF800EE
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 15:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BA7EF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Z7aZA1OA"
Received: by mail-wm1-x341.google.com with SMTP id a186so4641833wme.1
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 06:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jFYDkK+9+9rtp4yicJead5iuEA75yIxa6yds7cG1Fi8=;
 b=Z7aZA1OAXc4Ng4OopJU87r9TmN7qyRblJJ6G1fuHBmlPvP0xHar7CSA8UyY3XqtKO9
 LKaeEnDw7O1f5uxm1qdWTBdgMEmLLAjVV1GTvgPqBUjQmC6Afu+tIOi0G/h+WOeiPeHV
 Ywpqho3n1vR7KF1mhLlAxRL2xaOHIw0dj7uL1U5L9UjTrCOoLMdGW+zpQgS4bxMhNOSM
 mOskM+Yv2e0MlI69XyUFA6nGicbLd1K8Ix1QLIZqPQO20HIzqK6aNi8vdUjXOEVwTzP2
 EcaVxOcNycpkiI7I76X0wnLUy5j155TiftWF1JxmHjveNukbYuiBFoYlX98EpJBiLUuo
 tQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jFYDkK+9+9rtp4yicJead5iuEA75yIxa6yds7cG1Fi8=;
 b=FEy/+T4q0mVeCbrlfqBFBUY0iDfCbQPS+kSU5VsIisOX6UYPKRoPQQ+CiclXJcsrr4
 A+Qe5W4IfFHKJhMsaKSmlnjWPFlR5GLi2GZVDuA7B7za/d+XaojCoxtSO5bgdVTway2n
 A2nSxroqaflqMTVNmbJCjHsEaP3w2sJmpzKnITw3JwuHpwgOl5kBNlwll0G3qVIHf6Mh
 qVWUeIQ5qHmfPjB9X23hju8pAAexvQNZXuM7mQraUa1nlY/PJldogUwJIXpnq2LMtljA
 R7SeLky5U2mOWdSuUzqs0eZafLQHRGPHer83MgTq68HqAc1PJuxPGlStycamuYxsn72Q
 sOdw==
X-Gm-Message-State: AOAM533gFjkyc1C3PYqnvEAzGMaMoFmVXQy+uDLMl3dnCNwWLXgoyRk7
 eebYThBlBoLCLJnMTXg9k6jAhg==
X-Google-Smtp-Source: ABdhPJzit2MRl9F+dgB+mIICFCBRyTGiTGsg97qsv99NEkJnLL2IVy7VbD37fNSiLgsMKUccG7uriQ==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr4866098wmc.36.1605797114545; 
 Thu, 19 Nov 2020 06:45:14 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n123sm73946wmn.38.2020.11.19.06.45.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Nov 2020 06:45:13 -0800 (PST)
Subject: Re: [PATCH] ASoC: qcom: sm8250: fix HDMI audio playback
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Patrick Lai <plai@codeaurora.org>, Banajit Goswami
 <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <72b89b80-d548-4f4d-2da6-a83fd723366e@linaro.org>
Date: Thu, 19 Nov 2020 14:45:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
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



On 19/11/2020 12:31, Dmitry Baryshkov wrote:
> Current code does not setup CPU dai (causing -EIO errors on playback)
> and does not pass SND_SOC_DAIFMT_I2S to codec fmt (causing i2s-hifi
> errors). Fix both errors to enable HDMI audio playback on SM8250. Tested
> on RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: aa2e2785545a ("ASoC: qcom: sm8250: add sound card qrb5165-rb5 support")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


Thanks for the Patch, Looks good to me!

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/sm8250.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 35c9ad11edff..314e3e566d6d 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -36,6 +36,7 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   
>   static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>   {
> +	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
>   	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>   	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> @@ -43,10 +44,11 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>   
>   	switch (cpu_dai->id) {
>   	case TERTIARY_MI2S_RX:
> -		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF;
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>   		snd_soc_dai_set_sysclk(cpu_dai,
>   			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
>   			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
>   		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>   		break;
>   	default:
> 
