Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E53113B219
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 19:27:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9791B1801;
	Tue, 14 Jan 2020 19:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9791B1801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579026458;
	bh=KPfE4KdbR6txSGePuFgrXilsEG2It/igea+7xe+bWk8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=odg5kYwt1S5SMBHqRCyyesinKB8JPEdoP+6ZGoy60GdTZ+fD7sT1Yu+uJe/1M8QQP
	 /zKtrnsqAoqEPpzQQLjwQAt4Lo999dIDho2oGR7cWhkm37nM5fpquryWIHrtVlma2D
	 kWNd37llqUFw0YR7vaCnRaOBouj0fWkthAGNYNC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F55EF80171;
	Tue, 14 Jan 2020 19:25:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3368F8014E; Tue, 14 Jan 2020 19:25:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E1F9F800E9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 19:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1F9F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q/U5zvc8"
Received: by mail-wr1-x442.google.com with SMTP id c9so13209740wrw.8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 10:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lcX+hrUx98YTU8cdyZyDKh6e70lHkCDDnyoUnw4K9dI=;
 b=Q/U5zvc8npkYkLy5UkP+HGg736BtktcRdF3G0hPV8bdr29iyUt5MbJN1Xx4Ez7AwMH
 PestHl1MWVhvAbyQJlb9ElQLnMPzBxPKNHF97gmbBkfqmVz0FIEutjg5ojLdGoiCZkAr
 tNRgHZZlknYDtpJ2NkQ8omo5lfz1qvSyqZFZ2WdyBhSav5CTrxNR5rc8CxJdBhAuZirl
 5eRQmvU93y8T8IqjDQ0oYKIaVsU/hZk8aPsJGE2FJ+q4KpmoHdaamAjLdXyiWkQJPkGL
 w3bYTweydh2d/EVXQnUbNIsq1pDXdROaxa0JGKMIUZ62DWAKt3vTtP34vxiLstOPAnG5
 zeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lcX+hrUx98YTU8cdyZyDKh6e70lHkCDDnyoUnw4K9dI=;
 b=MIFz3mc6YMB+Ar/AI/hLQGVzz8wD53jVpOtTXUW4wc/5ySEZ7zof1mQk0OPT+0Tkp/
 pkK7RfstWn8xErsUx0RWBIUJeyS4YvV0GYthzVbgIoJIWyuu98lV2V7wWlLOulxaLcB4
 8FPedKllyJTksMKZCv58eaa9yDI3DVnw1NGb344WkoN3yk/srZMhNpqW5JmgGbG9s11k
 V/pUCietHbFORkBQc96tRs5Lyg+U0tQeNzmxRC/5Rx7lmVhxo5if2BFnpfw5tbY1FqQr
 TjokFbOS+7QsbnZUrkyFZ9mIBNlShmUftFpKc9Bd/e/1JHy/Nw2veyqUDhbxdhbhQR07
 dn6g==
X-Gm-Message-State: APjAAAXoJPniL8KzlYIbWLKFO16VTonLn2E7b/RDxUdfvzHNu6uGYeOH
 lSB7/bVBJ/2t6WZET5byPGKdmQ==
X-Google-Smtp-Source: APXvYqwwEUcYusGRMg5j0uNFtD0hXAb2/5LMf1z5yw0wev/M4GXnBjm5xZ17WytkALTlvmXiQq6F7g==
X-Received: by 2002:adf:8541:: with SMTP id 59mr26434768wrh.307.1579026348450; 
 Tue, 14 Jan 2020 10:25:48 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id
 z187sm20467095wme.16.2020.01.14.10.25.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jan 2020 10:25:47 -0800 (PST)
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200114181229.42302-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1e3dadd5-9908-74a5-caed-6e8bd091c48e@linaro.org>
Date: Tue, 14 Jan 2020 18:25:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200114181229.42302-1-stephan@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht,
 Nikita Travkin <nikitos.tr@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: msm8916-wcd-analog: Simplify
 MIC BIAS Internal
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



On 14/01/2020 18:12, Stephan Gerhold wrote:
> At the moment, MIC BIAS Internal* and MIC BIAS External* both reference
> the same register, and have a part of their initialization sequence
> duplicated.
> 
> For example, the sequence for enabling MIC BIAS Internal1 is:
>    I1. Enable MIC_BIAS1 supply (MICB_EN bit in CDC_A_MICB_1_EN)
>    I2. Enable internal RBIAS (TX1_INT_RBIAS_EN bit in CDC_A_MICB_1_INT_RBIAS)
> 
> The sequence for enabling MIC BIAS External1 is:
>    E1. Enable MIC_BIAS1 supply (MICB_EN bit in CDC_A_MICB_1_EN)
>    (E2. Ideally, make sure internal RBIAS is disabled. However, this should
>     not happen in practice because DAPM will disable unused supplies...)
> 
> Right now we have:
>    SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_EN, 7, 0, ...) // I1
>    SND_SOC_DAPM_SUPPLY("MIC BIAS External1", CDC_A_MICB_1_EN, 7, 0, ...) // E1
> and I2 is done in the PM event handler (pm8916_wcd_analog_enable_micbias_int1).
> 
> We can simplify this by defining a common DAPM supply for I1/E1 ("MIC_BIAS1"),
> and one DAPM supply for I2 ("MIC BIAS Internal1"). Additional DAPM routes
> ensure that we also enable the MIC_BIAS1 supply for the internal and external
> pull up resistor.
> 
> Another advantage of this is that we now disable the internal RBIAS
> when it is not needed. This makes it much easier to add support for
> MIC BIAS Internal3 as a next step.
> 
> Tested-by: Nikita Travkin <nikitos.tr@gmail.com> # longcheer-l8150
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Thanks for the patch, routing looks much better now!


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
> v1: https://lore.kernel.org/alsa-devel/20200111164006.43074-4-stephan@gerhold.net/
> Changes in v2:
>    - Use an extra DAPM supply for MIC_BIASX that is referenced by
>      MIC BIAS InternalX and MIC BIAS ExternalX, instead of combining it with
>      MIC BIAS ExternalX
>    - Clarify commit message
> ---
>   sound/soc/codecs/msm8916-wcd-analog.c | 112 ++++++++++----------------
>   1 file changed, 42 insertions(+), 70 deletions(-)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
> index 1f7964beb20c..d6d727f5bae5 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
> @@ -374,9 +374,8 @@ static void pm8916_wcd_analog_micbias_enable(struct snd_soc_component *component
>   
>   }
>   
> -static int pm8916_wcd_analog_enable_micbias_ext(struct snd_soc_component
> -						 *component, int event,
> -						 int reg, unsigned int cap_mode)
> +static int pm8916_wcd_analog_enable_micbias(struct snd_soc_component *component,
> +					    int event, unsigned int cap_mode)
>   {
>   	switch (event) {
>   	case SND_SOC_DAPM_POST_PMU:
> @@ -389,72 +388,44 @@ static int pm8916_wcd_analog_enable_micbias_ext(struct snd_soc_component
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
>   	return 0;
>   }
>   
> -static int pm8916_wcd_analog_enable_micbias_ext1(struct
> -						  snd_soc_dapm_widget
> -						  *w, struct snd_kcontrol
> -						  *kcontrol, int event)
> +static int pm8916_wcd_analog_enable_micbias1(struct snd_soc_dapm_widget *w,
> +					     struct snd_kcontrol *kcontrol,
> +					     int event)
>   {
>   	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>   	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
>   
> -	return pm8916_wcd_analog_enable_micbias_ext(component, event, w->reg,
> -						     wcd->micbias1_cap_mode);
> +	return pm8916_wcd_analog_enable_micbias(component, event,
> +						wcd->micbias1_cap_mode);
>   }
>   
> -static int pm8916_wcd_analog_enable_micbias_ext2(struct
> -						  snd_soc_dapm_widget
> -						  *w, struct snd_kcontrol
> -						  *kcontrol, int event)
> -{
> -	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
> -
> -	return pm8916_wcd_analog_enable_micbias_ext(component, event, w->reg,
> -						     wcd->micbias2_cap_mode);
> -
> -}
> -
> -static int pm8916_wcd_analog_enable_micbias_int1(struct
> -						  snd_soc_dapm_widget
> -						  *w, struct snd_kcontrol
> -						  *kcontrol, int event)
> +static int pm8916_wcd_analog_enable_micbias2(struct snd_soc_dapm_widget *w,
> +					     struct snd_kcontrol *kcontrol,
> +					     int event)
>   {
>   	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>   	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
>   
> -	switch (event) {
> -	case SND_SOC_DAPM_PRE_PMU:
> -		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
> -				    MICB_1_INT_TX1_INT_RBIAS_EN_MASK,
> -				    MICB_1_INT_TX1_INT_RBIAS_EN_ENABLE);
> -		break;
> -	}
> +	return pm8916_wcd_analog_enable_micbias(component, event,
> +						wcd->micbias2_cap_mode);
>   
> -	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
> -						     wcd->micbias1_cap_mode);
>   }
>   
>   static int pm8916_mbhc_configure_bias(struct pm8916_wcd_analog_priv *priv,
> @@ -564,9 +535,8 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
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
> @@ -576,8 +546,7 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
>   		break;
>   	}
>   
> -	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
> -						     wcd->micbias2_cap_mode);
> +	return pm8916_wcd_analog_enable_micbias_int(w, kcontrol, event);
>   }
>   
>   static int pm8916_wcd_analog_enable_adc(struct snd_soc_dapm_widget *w,
> @@ -878,14 +847,15 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
>   	{"SPK PA", NULL, "SPK DAC"},
>   	{"SPK DAC", "Switch", "PDM_RX3"},
>   
> -	{"MIC BIAS Internal1", NULL, "INT_LDO_H"},
> -	{"MIC BIAS Internal2", NULL, "INT_LDO_H"},
> -	{"MIC BIAS External1", NULL, "INT_LDO_H"},
> -	{"MIC BIAS External2", NULL, "INT_LDO_H"},
> -	{"MIC BIAS Internal1", NULL, "vdd-micbias"},
> -	{"MIC BIAS Internal2", NULL, "vdd-micbias"},
> -	{"MIC BIAS External1", NULL, "vdd-micbias"},
> -	{"MIC BIAS External2", NULL, "vdd-micbias"},
> +	{"MIC_BIAS1", NULL, "INT_LDO_H"},
> +	{"MIC_BIAS2", NULL, "INT_LDO_H"},
> +	{"MIC_BIAS1", NULL, "vdd-micbias"},
> +	{"MIC_BIAS2", NULL, "vdd-micbias"},
> +
> +	{"MIC BIAS External1", NULL, "MIC_BIAS1"},
> +	{"MIC BIAS Internal1", NULL, "MIC_BIAS1"},
> +	{"MIC BIAS External2", NULL, "MIC_BIAS2"},
> +	{"MIC BIAS Internal2", NULL, "MIC_BIAS2"},
>   };
>   
>   static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
> @@ -937,22 +907,24 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
>   	SND_SOC_DAPM_SUPPLY("RX_BIAS", CDC_A_RX_COM_BIAS_DAC, 7, 0, NULL, 0),
>   
>   	/* TX */
> -	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_EN, 7, 0,
> -			    pm8916_wcd_analog_enable_micbias_int1,
> -			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> -			    SND_SOC_DAPM_POST_PMD),
> -	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal2", CDC_A_MICB_2_EN, 7, 0,
> +	SND_SOC_DAPM_SUPPLY("MIC_BIAS1", CDC_A_MICB_1_EN, 7, 0,
> +			    pm8916_wcd_analog_enable_micbias1,
> +			    SND_SOC_DAPM_POST_PMU),
> +	SND_SOC_DAPM_SUPPLY("MIC_BIAS2", CDC_A_MICB_2_EN, 7, 0,
> +			    pm8916_wcd_analog_enable_micbias2,
> +			    SND_SOC_DAPM_POST_PMU),
> +
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS External1", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS External2", SND_SOC_NOPM, 0, 0, NULL, 0),
> +
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_INT_RBIAS, 7, 0,
> +			    pm8916_wcd_analog_enable_micbias_int,
> +			    SND_SOC_DAPM_PRE_PMU),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal2", CDC_A_MICB_1_INT_RBIAS, 4, 0,
>   			    pm8916_wcd_analog_enable_micbias_int2,
>   			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>   			    SND_SOC_DAPM_POST_PMD),
>   
> -	SND_SOC_DAPM_SUPPLY("MIC BIAS External1", CDC_A_MICB_1_EN, 7, 0,
> -			    pm8916_wcd_analog_enable_micbias_ext1,
> -			    SND_SOC_DAPM_POST_PMU),
> -	SND_SOC_DAPM_SUPPLY("MIC BIAS External2", CDC_A_MICB_2_EN, 7, 0,
> -			    pm8916_wcd_analog_enable_micbias_ext2,
> -			    SND_SOC_DAPM_POST_PMU),
> -
>   	SND_SOC_DAPM_ADC_E("ADC1", NULL, CDC_A_TX_1_EN, 7, 0,
>   			   pm8916_wcd_analog_enable_adc,
>   			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
