Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5613AAF3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:27:13 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14D822E3D;
	Tue, 14 Jan 2020 11:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14D822E3D
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8220AF8014D;
	Tue, 14 Jan 2020 11:54:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4E5AF8014E; Tue, 14 Jan 2020 11:54:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 407EFF800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 11:54:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 407EFF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eflrhLDz"
Received: by mail-wr1-x444.google.com with SMTP id j42so11637138wrj.12
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 02:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oPMc/NGNLzDTRSDkELxyTAt8x5FkQRKHitrR232eXBs=;
 b=eflrhLDzJpmSslGsETwItnS4fkxpV1de0GUt8eapHr5GZXZS/hPfSj6jFqzs3+F62t
 lJh00YkveDIoVCaNU34YZUzcuoT/oghVTFrE9nFDzcGv8OZ79sVtnJxOSe/6+tRv29gc
 1rcznCuyWMg2vE+q+A4eIRzDfXUl53Kmx4SFJIZFCzIF5qwQPMTPFnfFJAT9ozXhSowq
 ga7QuaV+Rg1QnOu+Miz/7erMDEWFfz03gJAT1r1d96LeS9fIZt4OaNB2xIjavEso3tZO
 8dsVg7daRYQq4fKYRwfkBIEmEs34v1nQQ027nOPQQhJAKtB382chantVLPvGIJUdFLTK
 0tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oPMc/NGNLzDTRSDkELxyTAt8x5FkQRKHitrR232eXBs=;
 b=NAvQuviLm/JApKDhVmwuoYDF04qIR1T2cNUlW1iZGLC3YRpzZmOxU9fBQvhsdjOCq5
 WtLdvHQ5vmL2ZDonGyccKrVnizXFG6pmp9sCcYj8BfM9GNzk1LDc6GMwHlf5Nefk9Sxz
 mIEBveR3BV6EL2Gg/yQKcSxzuv4TZSkcoc5aFwcDzh53/cKCHvE65LLfIl/o3IvSBB3e
 33iMP4B2S8nBmt/gbeY0QfU19vB3lDI6sAcTgoA//Vy9Mzn4U3rVrgrQCLXL9mVhcIxb
 QW3rKjh2bv4wNuqCSeVPh5xll9rB4yBumU6FV+Y+j2jFvjgc305uumfJE0z/2c4yYE/B
 tPLg==
X-Gm-Message-State: APjAAAWgs+XttWd9WQMIxYjnxkyRQk2/1HIHrlaRMhPKAf2HoR+tLCRN
 37BXdyv3yfqCjxM8pmdMWJvWww==
X-Google-Smtp-Source: APXvYqzeWi65shFPI05d7mFKFiFvNthK8g3hnb2zJYgsfdm4fhyy0B53v+Vs+4PMM000sAtNO5l/og==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr24134573wro.128.1578999286239; 
 Tue, 14 Jan 2020 02:54:46 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t8sm19284320wrp.69.2020.01.14.02.54.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jan 2020 02:54:45 -0800 (PST)
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200111164006.43074-1-stephan@gerhold.net>
 <20200111164006.43074-4-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <314b9a9b-13cd-94f5-0967-f0d4e66d65a1@linaro.org>
Date: Tue, 14 Jan 2020 10:54:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200111164006.43074-4-stephan@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht,
 Nikita Travkin <nikitos.tr@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/4] ASoC: msm8916-wcd-analog: Simplify MIC
	BIAS Internal
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 11/01/2020 16:40, Stephan Gerhold wrote:
> At the moment, MIC BIAS Internal* and MIC BIAS External* both reference
> the same register, and have a part of their initialization sequence
> duplicated.
> 
> In general, the sequence for enabling MIC BIAS InternalX seems to be:
>    1. Enable MIC BIAS ExternalX
>    2. Enable internal RBIAS resistor

Does not sound correct to me.

What external means here is if the MICBIAS has external pull up resistor 
or not. And this is very much board specific. In order for driver to 
enable/disable internal pull up resistor in such cases we use two dapm 
paths to differentiate it.


--srini




> 
> This means that we can simplify the code by modelling MIC BIAS InternalX
> as supply connected to MIC BIAS ExternalX. MIC BIAS InternalX is only
> responsible for enabling the internal RBIAS resistor (2). The DAPM enable
> sequence will automatically enable MIC BIAS ExternalX (1).
> 
> This makes it much easier to add support for MIC BIAS Internal3
> as a next step.
> 
> Tested-by: Nikita Travkin <nikitos.tr@gmail.com> # longcheer-l8150
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>   sound/soc/codecs/msm8916-wcd-analog.c | 57 ++++++---------------------
>   1 file changed, 13 insertions(+), 44 deletions(-)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
> index 1f7964beb20c..930baae6eff5 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
> @@ -389,23 +389,17 @@ static int pm8916_wcd_analog_enable_micbias_ext(struct snd_soc_component
>   	return 0;
>   }
>   
> -static int pm8916_wcd_analog_enable_micbias_int(struct snd_soc_component
> -						 *component, int event,
> -						 int reg, u32 cap_mode)
> +static int pm8916_wcd_analog_enable_micbias_int(struct snd_soc_dapm_widget *w,
> +						struct snd_kcontrol *kcontrol,
> +						int event)
>   {
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>   
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
> -		snd_soc_component_update_bits(component, reg, MICB_1_EN_PULL_DOWN_EN_MASK, 0);
>   		snd_soc_component_update_bits(component, CDC_A_MICB_1_EN,
>   				    MICB_1_EN_OPA_STG2_TAIL_CURR_MASK,
>   				    MICB_1_EN_OPA_STG2_TAIL_CURR_1_60UA);
> -
> -		break;
> -	case SND_SOC_DAPM_POST_PMU:
> -		pm8916_wcd_analog_micbias_enable(component);
> -		snd_soc_component_update_bits(component, CDC_A_MICB_1_EN,
> -				    MICB_1_EN_BYP_CAP_MASK, cap_mode);
>   		break;
>   	}
>   
> @@ -437,26 +431,6 @@ static int pm8916_wcd_analog_enable_micbias_ext2(struct
>   
>   }
>   
> -static int pm8916_wcd_analog_enable_micbias_int1(struct
> -						  snd_soc_dapm_widget
> -						  *w, struct snd_kcontrol
> -						  *kcontrol, int event)
> -{
> -	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
> -
> -	switch (event) {
> -	case SND_SOC_DAPM_PRE_PMU:
> -		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
> -				    MICB_1_INT_TX1_INT_RBIAS_EN_MASK,
> -				    MICB_1_INT_TX1_INT_RBIAS_EN_ENABLE);
> -		break;
> -	}
> -
> -	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
> -						     wcd->micbias1_cap_mode);
> -}
> -
>   static int pm8916_mbhc_configure_bias(struct pm8916_wcd_analog_priv *priv,
>   				      bool micbias2_enabled)
>   {
> @@ -564,9 +538,8 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
>   
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
> -		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
> -				    MICB_1_INT_TX2_INT_RBIAS_EN_MASK,
> -				    MICB_1_INT_TX2_INT_RBIAS_EN_ENABLE);
> +		snd_soc_component_update_bits(component, CDC_A_MICB_2_EN,
> +					      CDC_A_MICB_2_PULL_DOWN_EN_MASK, 0);
>   		break;
>   	case SND_SOC_DAPM_POST_PMU:
>   		pm8916_mbhc_configure_bias(wcd, true);
> @@ -576,8 +549,7 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
>   		break;
>   	}
>   
> -	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
> -						     wcd->micbias2_cap_mode);
> +	return pm8916_wcd_analog_enable_micbias_int(w, kcontrol, event);
>   }
>   
>   static int pm8916_wcd_analog_enable_adc(struct snd_soc_dapm_widget *w,
> @@ -878,12 +850,10 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
>   	{"SPK PA", NULL, "SPK DAC"},
>   	{"SPK DAC", "Switch", "PDM_RX3"},
>   
> -	{"MIC BIAS Internal1", NULL, "INT_LDO_H"},
> -	{"MIC BIAS Internal2", NULL, "INT_LDO_H"},
> +	{"MIC BIAS Internal1", NULL, "MIC BIAS External1"},
> +	{"MIC BIAS Internal2", NULL, "MIC BIAS External2"},
>   	{"MIC BIAS External1", NULL, "INT_LDO_H"},
>   	{"MIC BIAS External2", NULL, "INT_LDO_H"},
> -	{"MIC BIAS Internal1", NULL, "vdd-micbias"},
> -	{"MIC BIAS Internal2", NULL, "vdd-micbias"},
>   	{"MIC BIAS External1", NULL, "vdd-micbias"},
>   	{"MIC BIAS External2", NULL, "vdd-micbias"},
>   };
> @@ -937,11 +907,10 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
>   	SND_SOC_DAPM_SUPPLY("RX_BIAS", CDC_A_RX_COM_BIAS_DAC, 7, 0, NULL, 0),
>   
>   	/* TX */
> -	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_EN, 7, 0,
> -			    pm8916_wcd_analog_enable_micbias_int1,
> -			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> -			    SND_SOC_DAPM_POST_PMD),
> -	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal2", CDC_A_MICB_2_EN, 7, 0,
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_INT_RBIAS, 7, 0,
> +			    pm8916_wcd_analog_enable_micbias_int,
> +			    SND_SOC_DAPM_PRE_PMU),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal2", CDC_A_MICB_1_INT_RBIAS, 4, 0,
>   			    pm8916_wcd_analog_enable_micbias_int2,
>   			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>   			    SND_SOC_DAPM_POST_PMD),
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
