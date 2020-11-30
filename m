Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAFC2C82E5
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 12:10:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CDE91756;
	Mon, 30 Nov 2020 12:10:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CDE91756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606734655;
	bh=mGnUH1Ha+G2Arf7CtkAdI+FCG48+ZFM169hUnztiRk0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tjTG06SPsgyAIWWTtk59pk76HNj6vyv7q+MIVBFfqoIdfcBsphL4veyj9zCiBDT4y
	 skoKByPKhXDHKcUM/C2zpxySD3cyQae4AP+xZnIiVnkUJUv/sKM+kw7DzpRNvo30qL
	 Gn3WoUkAmCtJkaeUQe24CdgWeaBPFrgKj+PtPXaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F20F9F80254;
	Mon, 30 Nov 2020 12:10:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D36A1F804A9; Mon, 30 Nov 2020 12:10:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62AC0F80146
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 12:09:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62AC0F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aFUJMrQq"
Received: by mail-wm1-x343.google.com with SMTP id c198so18020665wmd.0
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 03:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=og3JaCFKA1hxe7Er/aULg3U2LUsICgsDGCZfViXEnss=;
 b=aFUJMrQqeG5iB9VwHdntb4vtkcGLRzJBFixJyb8WAuQ/TlJ2e2cypFJkIBARBnQw4j
 ekg3X58hskXvhpwXY7gvmm7Ss21BowKL4WAxZ+gxShspWpZ5v6kk+AGF4OOL7vx+vpiv
 Wd3frz3wCKf+GnU6JSWTxrl/vsckKrH4l7Jb6t2E70VF2G1KL658EwfVcaRLusuUyvJU
 wOBo6l00x0Mk2EHjFl5AnNO9DtWV2L62fQ33vlhiWVvsZ7W7cxgxhjwR9pm4vWkuursA
 WYDvxx/xfK9GsyMy3uX5SbUIdrCUkVJepUhRzR/4Y+Stz/W5rox9xDSMIuFjb8bS0Zk9
 QGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=og3JaCFKA1hxe7Er/aULg3U2LUsICgsDGCZfViXEnss=;
 b=n8t+vEBFpyKDK37kQiUSXEHiUq1Th18+Hygkxhxzzr6Ojnqn/5JJmCKefkN6thu+rz
 2uit00ynTt2Il0NgJjoqrmCzH932NFZc1CDoheMWYnJYGn1JM6x8FTaVii/n5ATGggdX
 7YxSVz4x8don56nJk7shTCK66xTi2CaguTQicco5qt/8zpGf9ajuPUP8iqK+lWZlTcxJ
 ++c10+E8nUQ/4CwSXTg1K07eNyn53SdGgswQI+TgCQ69nTK6379k1hmnb78ch2tT87GD
 rMaIZYipsfmqZviEY65rYCejwWreOeqmYw7l8vphBTvNw3z79jb2ZFQ1bNkSSm7CaioN
 ytXA==
X-Gm-Message-State: AOAM531rI90EE2E8NH83SjhuHymF3Gt92ORQpDQJSA9i4gt5M5GD0pa9
 Qv4vrf2X1mVyvp/z49bLsw5jHA==
X-Google-Smtp-Source: ABdhPJx6vvpCbL6tab1OUGiXTI002xSMilMhovTRPRdlcjtCL4zc3yZHcjJTAqw26ffLwV9N4Mz3yg==
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr23115058wmi.35.1606734593807; 
 Mon, 30 Nov 2020 03:09:53 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id e3sm28205394wro.90.2020.11.30.03.09.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 03:09:53 -0800 (PST)
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK and
 LRCLK in LPAIF invalid state
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4b680d9a-23eb-9746-e11e-1506d35e72c4@linaro.org>
Date: Mon, 30 Nov 2020 11:09:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
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
> This reverts part of commit b1824968221c
> ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")

This should probably go to Fixes tag!

> 

> To identify LPAIF invalid state after device suspend and resume,
> made I2S and DMA control registers not volatile, which is not necessary.
This comment is bit confusing!

Basically it should be something like
"DMA control registers are not volatile, so remove these from volatile 
registers list"

--srini


> Instead invalid reg state can be handled with regcache APIs.
> The BCLK ref count is necessary to enable clock only it's in disable state.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cpu.c      | 20 ++------------------
>   sound/soc/qcom/lpass-platform.c | 11 -----------
>   2 files changed, 2 insertions(+), 29 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index af684fd..c5e99c2 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -270,18 +270,6 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
>   	unsigned int id = dai->driver->id;
>   	int ret = -EINVAL;
> -	unsigned int val = 0;
> -
> -	ret = regmap_read(drvdata->lpaif_map,
> -				LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id), &val);
> -	if (ret) {
> -		dev_err(dai->dev, "error reading from i2sctl reg: %d\n", ret);
> -		return ret;
> -	}
> -	if (val == LPAIF_I2SCTL_RESET_STATE) {
> -		dev_err(dai->dev, "error in i2sctl register state\n");
> -		return -ENOTRECOVERABLE;
> -	}
>   
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
> @@ -454,20 +442,16 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
>   	struct lpass_variant *v = drvdata->variant;
>   	int i;
>   
> -	for (i = 0; i < v->i2s_ports; ++i)
> -		if (reg == LPAIF_I2SCTL_REG(v, i))
> -			return true;
>   	for (i = 0; i < v->irq_ports; ++i)
>   		if (reg == LPAIF_IRQSTAT_REG(v, i))
>   			return true;
>   
>   	for (i = 0; i < v->rdma_channels; ++i)
> -		if (reg == LPAIF_RDMACURR_REG(v, i) || reg == LPAIF_RDMACTL_REG(v, i))
> +		if (reg == LPAIF_RDMACURR_REG(v, i))
>   			return true;
>   
>   	for (i = 0; i < v->wrdma_channels; ++i)
> -		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start) ||
> -			reg == LPAIF_WRDMACTL_REG(v, i + v->wrdma_channel_start))
> +		if (reg == LPAIF_WRDMACURR_REG(v, i + v->wrdma_channel_start))
>   			return true;
>   
>   	return false;
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 80b09de..0e71899 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -452,7 +452,6 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   	unsigned int reg_irqclr = 0, val_irqclr = 0;
>   	unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
>   	unsigned int dai_id = cpu_dai->driver->id;
> -	unsigned int dma_ctrl_reg = 0;
>   
>   	ch = pcm_data->dma_ch;
>   	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
> @@ -469,17 +468,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>   		id = pcm_data->dma_ch - v->wrdma_channel_start;
>   		map = drvdata->lpaif_map;
>   	}
> -	ret = regmap_read(map, LPAIF_DMACTL_REG(v, ch, dir, dai_id), &dma_ctrl_reg);
> -	if (ret) {
> -		dev_err(soc_runtime->dev, "error reading from rdmactl reg: %d\n", ret);
> -		return ret;
> -	}
>   
> -	if (dma_ctrl_reg == LPAIF_DMACTL_RESET_STATE ||
> -		dma_ctrl_reg == LPAIF_DMACTL_RESET_STATE + 1) {
> -		dev_err(soc_runtime->dev, "error in rdmactl register state\n");
> -		return -ENOTRECOVERABLE;
> -	}
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
> 
