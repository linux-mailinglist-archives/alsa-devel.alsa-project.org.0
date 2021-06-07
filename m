Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E483839DED9
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 16:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A7D9166E;
	Mon,  7 Jun 2021 16:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A7D9166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623076445;
	bh=+VVc72r0EnJKudgBeWhjQFZiio8Ss0zgIbtA2y1ZvKs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDcNWGeGDwrGRvwjI8GGyDm5bquho4+wzUiiaLZTcxWPd4saol8ew5M4aKm27Ycld
	 kSqwa4+K7auOSl/HVDGxS5IDHzP85tFTXLVQgFBOvk8OjoYzLk7gxVU15zcPHvcL/G
	 QlwwZFfdtaUpuYXFUUWQ8B2LA3cr0CArRw67bQTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33CA9F8026C;
	Mon,  7 Jun 2021 16:32:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FC53F80212; Mon,  7 Jun 2021 16:32:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FCD8F800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 16:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FCD8F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wuBUUMPo"
Received: by mail-wm1-x32b.google.com with SMTP id d184so411449wmd.0
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nS6m0FoskpK8ycN8QLA4hdqiDT6/K9kbC4GMmw4lEgg=;
 b=wuBUUMPo7j+sLLFtnqKUaB82pFJHv99qGo7ClXfEqsZSvuaJUB5BF/A35SoVioEQ//
 XHgydv395SYMXvt+cNyaJQHl+CJ/2O5Dpwb975geOr0WhIe/z0AdvzIg/GVzlngBPhLh
 iOal7WLi6KppWqsBkqrcMdh56ZhC/7MNI7F8VIdv/czQqpkmRqQwt6pamieTWHJpDCW0
 NhiSsOnT0BVvweBvIEbrXcCPArp9x/rAEpRsOfSvHOuuZcmBSted+rUGMieDzYzmQwgO
 Cx53J1e06Edwmn+SniXjCexCf+0r+Pr5IWfHPmPNTuM76ErJiuDtD4Z5Uo2Mi5XjPXQX
 MhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nS6m0FoskpK8ycN8QLA4hdqiDT6/K9kbC4GMmw4lEgg=;
 b=CpAKCRF0RrbX7xMOY4W1f9B2dkRP1EoS8hNzxFznbXoI8qN6mJNAWrNvz+8Mwd/KgY
 SDSGMKHK5nEgX/b6c/U1htBc1XDiEwX4HIQca8B7RZCy7HIxQRWWI+XKs+I+qz/s3eLv
 qvBEUmGdPJthU98/qEvicFsCr/3559qfylXCQyHnMjD+4URJ06rwrKLdd3/xU5RApXXM
 DoVQ/0HUe5VbzfZ5kK74mDnC8zE0JxWZwsi6Z9iYt0FPl1aHBksbZlGKx/lJ0T7S74W+
 h0wNzLAinKb1XzZ+oFlmicB1wfuHYb9yaih5ejun5feG0DYTI2Wb5TrH0NsdREEYuGUA
 7BTA==
X-Gm-Message-State: AOAM5320T0+7AXYk2zNE67DFOl7CPtoH6lJV5Pdy+mQONZOgYAvKM6YV
 wTYb/xU/9SPIfjdT+eLgti7TZg==
X-Google-Smtp-Source: ABdhPJxb4K8fj18KdVF7Jxi2taqHp0HFH+pigd0oQiE21oW8Svcam6ppkiB16UL1xyG+N6jay4+0Zg==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr2594914wmq.31.1623076344662; 
 Mon, 07 Jun 2021 07:32:24 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 125sm18884963wmb.34.2021.06.07.07.32.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jun 2021 07:32:24 -0700 (PDT)
Subject: Re: [v7] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
 begin
To: Judy Hsiao <judyhsiao@chromium.org>, broonie@kernel.org
References: <20210604154545.1198337-1-judyhsiao@chromium.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0085836e-20d5-d74f-5a1e-1a6ea8252d02@linaro.org>
Date: Mon, 7 Jun 2021 15:32:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210604154545.1198337-1-judyhsiao@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, judyhsiao@google.com, tzungbi@chromium.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 cychiang@google.com, Takashi Iwai <tiwai@suse.com>
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



On 04/06/2021 16:45, Judy Hsiao wrote:
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> This patch fixes PoP noise of around 15ms observed during audio
> capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for
> introducing some delay before capture start.
> 
> Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> (am from https://patchwork.kernel.org/patch/12276369/)
> (also found at https://lore.kernel.org/r/20210524142114.18676-1-srivasam@codeaurora.org)
> 

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
> Changes Since V6:
> 	-- Removed clk_disable OSR clock in lpass_cpu_daiops_prepare error case as failure
>             of prepare will result in calling shutdown which should take care of this.
> Changes Since V5:
>          -- Fixed nit.
>          -- Updated `mi2s_was_prepared[dai->driver->id] = true;` after checking for errors.
> Changes Since V4:
>          -- Replaced the __clk_is_enabled(BCLK) check by the self maintained.
>             mi2s_was_prepared bool state.
>          -- Removed unrelated changes.
>          -- Refined comments.
> Changes Since V3:
>          -- Checked BCLK is off before enabling it in lpass_cpu_daiops_prepare as
>             lpass_cpu_daiops_prepare can be called multiple times
>          -- Checked BCLK is on before disabling it in lpass_cpu_daiops_shutdown to
>             fix the WARN. It is because BCLK may not be enabled if
>             lpass_cpu_daiops_prepare is not called before lpass_cpu_daiops_shutdown
>          -- Added more comments
> Changes Since V2:
>          -- Updated comments as per linux style
>          -- Removed unrelated changes
> Changes Since V1:
>          -- Enabled BCLK and LRCLK in dai ops prepare API instead of startup API
>          -- Added comments
> 
>   sound/soc/qcom/lpass-cpu.c | 79 ++++++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass.h     |  4 ++
>   2 files changed, 83 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index af8cb64924a0..647423a6cb57 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -93,8 +93,30 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>   		struct snd_soc_dai *dai)
>   {
>   	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +	unsigned int id = dai->driver->id;
>   
>   	clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
> +	/*
> +	 * Ensure LRCLK is disabled even in device node validation.
> +	 * Will not impact if disabled in lpass_cpu_daiops_trigger()
> +	 * suspend.
> +	 */
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
> +	else
> +		regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
> +
> +	/*
> +	 * BCLK may not be enabled if lpass_cpu_daiops_prepare is called before
> +	 * lpass_cpu_daiops_shutdown. It's paired with the clk_enable in
> +	 * lpass_cpu_daiops_prepare.
> +	 */
> +	if (drvdata->mi2s_was_prepared[dai->driver->id]) {
> +		drvdata->mi2s_was_prepared[dai->driver->id] = false;
> +		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
> +	}
> +
>   	clk_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
>   }
>   
> @@ -275,6 +297,18 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		/*
> +		 * Ensure lpass BCLK/LRCLK is enabled during
> +		 * device resume as lpass_cpu_daiops_prepare() is not called
> +		 * after the device resumes. We don't check mi2s_was_prepared before
> +		 * enable/disable BCLK in trigger events because:
> +		 *  1. These trigger events are paired, so the BCLK
> +		 *     enable_count is balanced.
> +		 *  2. the BCLK can be shared (ex: headset and headset mic),
> +		 *     we need to increase the enable_count so that we don't
> +		 *     turn off the shared BCLK while other devices are using
> +		 *     it.
> +		 */
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   			ret = regmap_fields_write(i2sctl->spken, id,
>   						 LPAIF_I2SCTL_SPKEN_ENABLE);
> @@ -296,6 +330,10 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
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
> @@ -315,12 +353,53 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   	return ret;
>   }
>   
> +static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
> +		struct snd_soc_dai *dai)
> +{
> +	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +	unsigned int id = dai->driver->id;
> +	int ret;
> +
> +	/*
> +	 * Ensure lpass BCLK/LRCLK is enabled bit before playback/capture
> +	 * data flow starts. This allows other codec to have some delay before
> +	 * the data flow.
> +	 * (ex: to drop start up pop noise before capture starts).
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
> +	/*
> +	 * Check mi2s_was_prepared before enabling BCLK as lpass_cpu_daiops_prepare can
> +	 * be called multiple times. It's paired with the clk_disable in
> +	 * lpass_cpu_daiops_shutdown.
> +	 */
> +	if (!drvdata->mi2s_was_prepared[dai->driver->id]) {
> +		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +		if (ret) {
> +			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +			return ret;
> +		}
> +		drvdata->mi2s_was_prepared[dai->driver->id] = true;
> +	}
> +	return 0;
> +}
> +
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
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 83b2e08ade06..7f72214404ba 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -67,6 +67,10 @@ struct lpass_data {
>   	/* MI2S SD lines to use for playback/capture */
>   	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
>   	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
> +
> +	/* The state of MI2S prepare dai_ops was called */
> +	bool mi2s_was_prepared[LPASS_MAX_MI2S_PORTS];
> +
>   	int hdmi_port_enable;
>   
>   	/* low-power audio interface (LPAIF) registers */
> 
