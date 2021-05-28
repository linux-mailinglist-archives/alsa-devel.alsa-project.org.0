Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C86393EFA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 10:49:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14F7516E6;
	Fri, 28 May 2021 10:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14F7516E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622191782;
	bh=ukHp60Q5ZW4yaLFYCHm1zpePwIJyk8NPsoY7s+rt8L0=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d3iijEBQwW/JhOAGIKy/DTXtiRvWZoVo7ezlNw9wPaL9LhXKJVrWQJ5hiywksJl1I
	 5eDJQBEvL37zQMrxNT51g9WqfaXdG6l7WrpUQ2o6gI4yzSj/znuEUcNaA7GhBj58VM
	 5LrSPttpl5odgiHDzSxYY8KbbV5EMYcV+8U2WbPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62AC2F80260;
	Fri, 28 May 2021 10:48:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E64DF80264; Fri, 28 May 2021 10:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDD2DF8013A
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 10:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDD2DF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="m3WX96qI"
Received: by mail-wm1-x32a.google.com with SMTP id h3so1660665wmq.3
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WikFeXUsmrrkxHoqNQkeIN24f6mCbXXF6hqcFhk6uOo=;
 b=m3WX96qICHaTwGdy1NTiEy0Bor5LJzIqd0AP7gvFdxjoHxm2NxhtUULDF+9lQOSw3Y
 wm4U2se5OJH6V8mzypZm1OGQngILCHudP6E82dzKt1S1V5RcsTTE/k4kgMZz4caIIhET
 Ob9PhEEtEAQYiFx7Z/Sq2yj5GedDe7Px/ozVUTDyZkuGMhGy+jxnlhG6ROQMVvdsWSmp
 IT2kPqeKN14BTJdDze23+I0GigtrfJ2WrDQE3A1wtx8tzMIIY0iH+GEgVUTcjr/YQ6X/
 YIRmEy2wgLbQT4CNB9MC6NxyRFy6dATRINmmsosVlGlX6L+7d14bBW4AO7nEJXN3giaj
 RH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WikFeXUsmrrkxHoqNQkeIN24f6mCbXXF6hqcFhk6uOo=;
 b=cV5y9EKfPACaqy/2EfqaC042IIh0ze+yxXQ5NtGHnI3G9AIg26Ylj5Ze3VDvVapTMK
 co77zD2bUud+nLj5URkJlxhK457qCR4Ios1dJHgiKl/9Raf6ja66m9tLW7aGIFHhN0rW
 rQ8h0kNW6iVvqgy3G1J3FKNp+WqnXcscciE4oWtyR7w3qEzRpVRrdsXFA3fLtCucZ7yJ
 h4uqmBfOtyvIM89O/ywDNj/c6TUfk78NUGjpeO2/uHfdq5t9+QzeNWXbQku7wQk4jxR7
 fAyKPWmSG5nsuHWpwmkTUxKgFMZdB705CR6vTIEJub9oxcWGzPLBoGHqtvCRxxYx+9YO
 LBXQ==
X-Gm-Message-State: AOAM530V3hMD3P6iG8JJdD4FPfl7NQ8Y5p840fuGGMpuIMZKWCbj1fbE
 EmkqqN0Ali3oSBuU6AynZLwu2Q==
X-Google-Smtp-Source: ABdhPJy2OXUhLfKhJDP5StESemM6f4/xQULoj6x8UA0x3F5G/hfVlS7HFPZ/uPFHeo3V6lLxbvIwbQ==
X-Received: by 2002:a05:600c:2219:: with SMTP id
 z25mr7450903wml.78.1622191677970; 
 Fri, 28 May 2021 01:47:57 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id f8sm5547546wmg.43.2021.05.28.01.47.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 May 2021 01:47:57 -0700 (PDT)
Subject: Re: [PATCH v3] ASoC: qcom: lpass-cpu: Fix pop noise during audio
 capture begin
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210524142114.18676-1-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9a4bbab8-91a2-f195-b77a-5234d46a2c0a@linaro.org>
Date: Fri, 28 May 2021 09:47:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210524142114.18676-1-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 24/05/2021 15:21, Srinivasa Rao Mandadapu wrote:
> This patch fixes PoP noise of around 15ms observed during audio capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for introducing some delay
> before capture start and clock enable.
> 
> Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> Changes Since V2:
> 	-- Updated comments as per linux style
> 	-- Removed unrelated changes.
> Changes Since V1:
> 	-- Enableed BCLK and LRCLK in dai ops prepare API instead of startup API
> 	-- Added comments
> 
>   sound/soc/qcom/lpass-cpu.c | 54 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 28c7497344e3..1855eae22aad 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -93,9 +93,21 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>   		struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +	unsigned int id = dai->driver->id;
>   
>   	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
> -	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
> +	/*
> +	 * To ensure BCLK/LRCLK disabled even in device node validation
> +	 * Will not impact if disabled in lpass_cpu_daiops_trigger()
> +	 * suspend.
> +	 */
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
> +	else
> +		regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
> +
> +	clk_disable_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
>   }
>   
>   static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
> @@ -275,6 +287,10 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		/*
> +		 * To ensure lpass BCLK/LRCLK is enabled during
> +		 * device resume. Will not impact if enabled in lpass_cpu_daiops_prepare().
> +		 */

prepare should have already ensured that isn't it?


>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   			ret = regmap_fields_write(i2sctl->spken, id,
>   						 LPAIF_I2SCTL_SPKEN_ENABLE);
> @@ -296,6 +312,10 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	case SNDRV_PCM_TRIGGER_STOP:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		/*
> +		 * To ensure lpass BCLK/LRCLK is disabled during
> +		 * device suspend.
> +		 */
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   			ret = regmap_fields_write(i2sctl->spken, id,
>   						 LPAIF_I2SCTL_SPKEN_DISABLE);
> @@ -315,12 +335,44 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	return ret;
>   }
>   


[Snip ...
> +static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
> +		struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +	unsigned int id = dai->driver->id;
> +	int ret;
> +	/*
> +	 * To ensure lpass BCLK/LRCLK is enabled bit before
> +	 * playback/capture data flow starts.
> +	 */
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
> +	else
> +		ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
> +
> +	if (ret) {
> +		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +
> +	if (ret) {
> +		dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +		clk_disable(drvdata->mi2s_osr_clk[id]);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
----]

If prepare is enabling the clk and the i2s enable bits, then why do we 
need to do the same thing in trigger?

Also the clk enable count is going up twice (once in prepare and 
trigger) and we can never be able to disable the clk as there is is no 
corresponding disable for this prepare path.

Also note that prepare can be called multiple times.

--srini

>   const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>   	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
>   	.startup	= lpass_cpu_daiops_startup,
>   	.shutdown	= lpass_cpu_daiops_shutdown,
>   	.hw_params	= lpass_cpu_daiops_hw_params,
>   	.trigger	= lpass_cpu_daiops_trigger,
> +	.prepare	= lpass_cpu_daiops_prepare,
>   };
>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
>   
> 
