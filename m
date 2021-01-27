Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0E1305769
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 10:53:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1769173A;
	Wed, 27 Jan 2021 10:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1769173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611741205;
	bh=prvKIHRs+60Q3UEH18tDJUbaE0zkgnjPd/X++A0Rqls=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5gbxHO3hm22gRaq26aMSuP0rQn0oZJ1E/9HYhrv0QTl7E2qAmkHwX8VBgC7PC9SJ
	 w6f9i38QLp22yMiQOBunPLeJUmM35qAFGVt8ojdcNOVxgBh9M2nM6uP4iNi4bHZ0ww
	 E3bR7KNuLVuUocAYnq3USzTFleRVr17D1q6EiD7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE718F8025F;
	Wed, 27 Jan 2021 10:51:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 204D9F80259; Wed, 27 Jan 2021 10:51:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8B84F8011C
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 10:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8B84F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XM+7AUuC"
Received: by mail-wm1-x333.google.com with SMTP id 190so983632wmz.0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 01:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZsyXSLBpqyoZDJLOwz36YTbFMR5XUsNbF337fUqt2Cg=;
 b=XM+7AUuC9pRqUpcQ44jgThIg1R06D5+ODzaBzxFVy6O64Bfu3YlokaUj/qZWDDalUp
 H1tJpg6SXSRIcUkpK8HTmhqT1G6g0LpQNcjyvtx05XkcUMVACa4uGoKORoO9VkYU6F67
 XfJHrUU6dlCoDYzyHoGyp4Nd+ZobKt/vswc5d+m3eg9Ru/wvjBAKxow2DqBRLn4pD8T/
 CZCnXmjCH8jTugGpZVNvAV8VELYQhbTLew1vPcjbYx+fP36sZYMuFhhQCB52lR0c0zbo
 fpVdMahWflCeMErqu01wEo9kvYnyiiG4V7dKhoMB40f6EakwJIJnqz/mr/g3O7bMqNce
 bbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZsyXSLBpqyoZDJLOwz36YTbFMR5XUsNbF337fUqt2Cg=;
 b=IoiO55Ejt4a2w3EJ2WDYgQVYE6Vm78vLH/YmnpaNOhL+k14NATmbvlURbyx1sKG8nx
 6li94Zcjp4UGwVwCV43KBfE1DjnXueWwltOti0Fez5a6OIQQfrzBTyPMDEvjjXv8o0H/
 mtWiJII6eGoGOFNplNR0S2jtTjmuNw17Pz0+8rbk3bHzdQcQs83yo0ZGWZ9MrHqJzPQf
 KEr/2NnRjf4XSNbPkkT8ctCcECi9VUEXRX3GNMq9BxGhLZ4J6Vg9RO33XjQ4jaR2Oqam
 cJRA/C5AosCQzXdCSaOYO8qeYDjl2VQ74gzrSCNex7Z4aiV/Tg8Hjt0Qp861819CM0nF
 6nbg==
X-Gm-Message-State: AOAM531pAmqsSe9ED7ZXbn6ivgL0bQuuZvxRPSJL6aNQhii/Fwsf0LMI
 lFhsc+T1MAFrYewXMQT7HW6TGw==
X-Google-Smtp-Source: ABdhPJz/BXkWanv6XHkXGTic7kAcimSL/5joj2dCuqTeRbrnaMy0dPjNX+1atXk2Dz/Jdmydy0V3FA==
X-Received: by 2002:a7b:cb8a:: with SMTP id m10mr3359497wmi.127.1611741097661; 
 Wed, 27 Jan 2021 01:51:37 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o17sm2213535wrm.52.2021.01.27.01.51.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Jan 2021 01:51:36 -0800 (PST)
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Remove bit clock state check
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210127063038.1399-1-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <16199fa8-7a87-6e7f-9db6-1d5cd8493d4c@linaro.org>
Date: Wed, 27 Jan 2021 09:51:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210127063038.1399-1-srivasam@codeaurora.org>
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



On 27/01/2021 06:30, Srinivasa Rao Mandadapu wrote:
> No need of BCLK state maintenance from driver side as
> clock_enable and clk_disable API's maintaing state counter.
> 
> One of the major issue was spotted when Headset jack inserted
> while playback continues, due to same PCM device node opens twice
> for playaback/capture and closes once for capture and playback continues.
> 
> It can resolve the errors in such scenarios.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

Thanks for the cleanup, yes clk core will take care of this by 
enable_count check!

You should add

Fixes: b1824968221c ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF 
invalid state")


> ---
>   sound/soc/qcom/lpass-cpu.c       | 22 ++++++++--------------
>   sound/soc/qcom/lpass-lpaif-reg.h |  3 ---
>   sound/soc/qcom/lpass.h           |  1 -
>   3 files changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index ae8efbc89af2..a669202e0001 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -286,16 +286,12 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
>   				ret);
>   
> -		if (drvdata->bit_clk_state[id] == LPAIF_BIT_CLK_DISABLE) {
> -			ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> -			if (ret) {
> -				dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> -				clk_disable(drvdata->mi2s_osr_clk[id]);
> -				return ret;
> -			}
> -			drvdata->bit_clk_state[id] = LPAIF_BIT_CLK_ENABLE;
> +		ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +		if (ret) {
> +			dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +			clk_disable(drvdata->mi2s_osr_clk[id]);

Can you also remove this unnecessary disable here!


-srini

> +			return ret;
>   		}
> -
>   		break;
>   	case SNDRV_PCM_TRIGGER_STOP:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
> @@ -310,10 +306,9 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>   		if (ret)
>   			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
>   				ret);
> -		if (drvdata->bit_clk_state[id] == LPAIF_BIT_CLK_ENABLE) {
> -			clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
> -			drvdata->bit_clk_state[id] = LPAIF_BIT_CLK_DISABLE;
> -		}
> +
> +		clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);
> +
>   		break;
>   	}
>   
> @@ -861,7 +856,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>   			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>   		}
> -		drvdata->bit_clk_state[dai_id] = LPAIF_BIT_CLK_DISABLE;
>   	}
>   
>   	/* Allocation for i2sctl regmap fields */
> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 405542832e99..c8e1d75340b2 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -60,9 +60,6 @@
>   #define LPAIF_I2SCTL_BITWIDTH_24	1
>   #define LPAIF_I2SCTL_BITWIDTH_32	2
>   
> -#define LPAIF_BIT_CLK_DISABLE		0
> -#define LPAIF_BIT_CLK_ENABLE		1
> -
>   #define LPAIF_I2SCTL_RESET_STATE	0x003C0004
>   #define LPAIF_DMACTL_RESET_STATE	0x00200000
>   
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 2d68af0da34d..83b2e08ade06 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -68,7 +68,6 @@ struct lpass_data {
>   	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
>   	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
>   	int hdmi_port_enable;
> -	int bit_clk_state[LPASS_MAX_MI2S_PORTS];
>   
>   	/* low-power audio interface (LPAIF) registers */
>   	void __iomem *lpaif;
> 
