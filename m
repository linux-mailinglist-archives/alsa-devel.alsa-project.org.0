Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D433039B8AA
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 14:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F78A172E;
	Fri,  4 Jun 2021 14:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F78A172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622808241;
	bh=bOIzWxV6sVnvxRUB8h82eqtcWKzP8hdDtcj4BhW909c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NGwJWvk6+aGrjgRL84HuZChx5htkD0SRn73sDizFwJfX5ZaotziBE9Jpj7X7HSdqr
	 zMSkf8B2haL0/6P2qV5vkuXJJVC/BOGl8GGeTWgNwKt8Sshpp2n7xFQoJ2CgxBBswH
	 +L+y3hZOnQo7ntZpaQ0Lk0xoe1GKDNPYkIsKVYVc=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B25CF80103;
	Fri,  4 Jun 2021 14:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21B93F802A9; Fri,  4 Jun 2021 14:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B671F800CC
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 14:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B671F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="T4y++vOf"
Received: by mail-ej1-x633.google.com with SMTP id ce15so14106726ejb.4
 for <alsa-devel@alsa-project.org>; Fri, 04 Jun 2021 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oP96C38SDoTMjU+A2utOAj1qiHO0/0r8SsRHbo7atTg=;
 b=T4y++vOf17QU2tn7jkYxwilJWHZJuUbfb9JDkPPDX5LTGL0K+Q9oF8i367jhGuuCvS
 PFCsSWQtCyOWn/LdGXpmHc8+TEkaZjQht4r/ZCS/o0+Q1hjw1mXwYP8b1s87MO8g0ZlT
 /90ecEKWXXTQ/z1u+VjRaapvmH94URMYTmIBhwt9rPijQAbbBLenH5m19GQAWdGS4FZN
 terIxVPnvXWkkj3FKQHeMnqrIIJtIpp96wTjgaFGA+lutOGeBzIH22f5oKDNfh0aaUeO
 AzBmIzhd8PqbMqoUg++GZgghXKFQUWYO4vxpAPRzcxZ4DstEB+SGF1RICYD6m6stVhDu
 dacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oP96C38SDoTMjU+A2utOAj1qiHO0/0r8SsRHbo7atTg=;
 b=OZ5DoP5EGqNOJC/fQo4EYTTXeotv1kLBMTfOqLaxL0+IZnHyN9j+tOeG0tQb0EaE+M
 oZrqd6+A0G+ohKEsIOkmnjs/SwMj32BidBBqssP6eNM9/mBC2VzmCLCBX4deGZiGYHlM
 KFOEXsGJMIIab0eM5xfevWFdySzSsA2INU+RThlsJl7LyuBu/2NyLmLY0oYhkOZWNtPA
 hCBjAoOozK/j+OktVHw2miMYY/mEdqD9WLuPHfcaTwEr4sqHBIfjcU5ARO/tzJGy2eQp
 GjG1D8NpiFdzHSfZgCamO/FVXKHZbhw+atmoj0DkFie6pkLMfFLeTjNFoHoelRNwnjTZ
 Iuwg==
X-Gm-Message-State: AOAM5337jcKrbE1N5VyCRbWGGxPBlEy1g0MIKvs0LqdPZrEJxHTk/kD2
 Owdt1AUQ31dXUBWFrrLigaWuwA==
X-Google-Smtp-Source: ABdhPJxfR0xZZWORr/bcRyDdNh84a2izyVQmSbwrKppEsbmRV3ipU2JANstENVC4PiAMhgrdw8D8Cw==
X-Received: by 2002:a17:906:71d2:: with SMTP id
 i18mr3990765ejk.373.1622808137577; 
 Fri, 04 Jun 2021 05:02:17 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u1sm3089541edv.91.2021.06.04.05.02.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Jun 2021 05:02:16 -0700 (PDT)
Subject: Re: [v6] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
 begin
To: Judy Hsiao <judyhsiao@chromium.org>, broonie@kernel.org
References: <20210604071112.1055911-1-judyhsiao@chromium.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <74ab7274-1e6d-a82e-bae9-bc887aa34baa@linaro.org>
Date: Fri, 4 Jun 2021 13:02:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210604071112.1055911-1-judyhsiao@chromium.org>
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



On 04/06/2021 08:11, Judy Hsiao wrote:
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
> +			clk_disable(drvdata->mi2s_osr_clk[id]);

This disable is not required, as failure of prepare will result in 
calling shutdown which should take care of this. If not you will be 
disabling clk twice.

Other than that patch looks good to me!

--srini


> +			return ret;
> +		}
> +		drvdata->mi2s_was_prepared[dai->driver->id] = true;
> +	}
> +	return 0;
> +}
> +
