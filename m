Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD32213AA63
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:13:49 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38A8F3047;
	Tue, 14 Jan 2020 14:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38A8F3047
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B51F80121;
	Tue, 14 Jan 2020 14:03:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79C82F8014E; Tue, 14 Jan 2020 14:03:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A12FF80121
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 14:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A12FF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Z7Ko514H"
Received: by mail-wm1-x343.google.com with SMTP id t14so13620769wmi.5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 05:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ne9NACA672chQa7X11bqdLEexdMYzlalTEIPWtVQggs=;
 b=Z7Ko514HvIubhMYXUMnHaRCpdjKd9eAc8UCxhk2TDeCNijQDRMsNDgnUYRogLO/LKM
 obCRyox6VO4YwNG+Adm6AuVCknF9WHQw4o/PB0RmfYSFyeGgRszwHuEI2BN8OS4qxeKS
 pyMyNUxr+8Dpjqr1pZHpj/xCHU21WgKI7vo0UcuJ8of4ZGLCYrmrl0p+L/Bgyt3ofkHk
 OkGecQMdYAWjE/zWTFTGI2hO5eBSern54X37ogBJJJQb59tLYv4+kJ1oCECLhxWTu6wJ
 54JATnNx7qRb9GM8ChGUFzu/6z0P8+g1owNe/tLJS3bCS48qGqMX1PFu0nZuUujYV2bD
 GDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ne9NACA672chQa7X11bqdLEexdMYzlalTEIPWtVQggs=;
 b=aWhuOA70usWNcrg49X+EF0J5itcmq7Wb5Id2z5A2vreyMuVeBp7plDpw5KYOdNQrJv
 YLg0g7tNwAc6gykJOnHZO3LcWn3JxLKz+DhsmWFJBHom9Jns9m9qUpoSLYE2g+Z7u7+4
 LsA+mgnWRdhEHAmKhaYjIL81do0PwWLG1nPVOSspQb7QfUsSqjz9TtfMlAJTNKUgUOvO
 9F8fU87IajUitvwy9EF6pgBvhnF3fDdZsj6taHjjWOwEVOdK2uWp8C3UutSDJ+DvbnLc
 e0Ofm9dRqb3fYVfDjeJIQeaymTyPAnQ/fKtZzSYwgrtFxrCbXT29/fTXjzcYH08rM0FS
 YHPQ==
X-Gm-Message-State: APjAAAVl8ERAnBHl3B/B9BJayWu9gGjC82F50LcNOEznWQUzADsYWDrE
 0Y0lxpo/2XTRFr5ZRTKG5OkFSw==
X-Google-Smtp-Source: APXvYqwWFoc/VSqrRAsujmyUZznG2K+v+Bd2mbnDl8ZK83mFmrtmyAIJLQDRVuyy0p743SEWVV/HYw==
X-Received: by 2002:a05:600c:118a:: with SMTP id
 i10mr25895588wmf.142.1579007004461; 
 Tue, 14 Jan 2020 05:03:24 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id e18sm19806714wrr.95.2020.01.14.05.03.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jan 2020 05:03:23 -0800 (PST)
To: Stephan Gerhold <stephan@gerhold.net>
References: <20200111164006.43074-1-stephan@gerhold.net>
 <20200111164006.43074-4-stephan@gerhold.net>
 <314b9a9b-13cd-94f5-0967-f0d4e66d65a1@linaro.org>
 <20200114120817.GA52379@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2b2a7407-d0be-224c-706a-ab193956ae80@linaro.org>
Date: Tue, 14 Jan 2020 13:03:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200114120817.GA52379@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Nikita Travkin <nikitos.tr@gmail.com>
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



On 14/01/2020 12:08, Stephan Gerhold wrote:
> On Tue, Jan 14, 2020 at 10:54:44AM +0000, Srinivas Kandagatla wrote:
>>
>>
>> On 11/01/2020 16:40, Stephan Gerhold wrote:
>>> At the moment, MIC BIAS Internal* and MIC BIAS External* both reference
>>> the same register, and have a part of their initialization sequence
>>> duplicated.
>>>
>>> In general, the sequence for enabling MIC BIAS InternalX seems to be:
>>>     1. Enable MIC BIAS ExternalX
>>>     2. Enable internal RBIAS resistor
>>
>> Does not sound correct to me.
>>
>> What external means here is if the MICBIAS has external pull up resistor or
>> not. And this is very much board specific. In order for driver to
>> enable/disable internal pull up resistor in such cases we use two dapm paths
>> to differentiate it.
>>
> 
> You are right. Maybe the naming is a bit confusing here.
> Let me try to clarify it:
> 
> If I understand it correctly, setting the MICB_EN bit in CDC_A_MICB_1_EN
> enables the MIC_BIAS1 supply. This supply can be either used with an
> external pull up resistor ("MIC BIAS External1") or with the internal
> pull up resistor ("MIC BIAS Internal1"). Which one of them, is board-specific.
> 
> To use the internal pull up resistor, we need to set the TX1_INT_RBIAS_EN
> bit in CDC_A_MICB_1_INT_RBIAS additionally.
> 
> In other words, the sequence for enabling MIC BIAS Internal1 is:
>    I1. Enable MIC_BIAS1 supply (MICB_EN bit in CDC_A_MICB_1_EN)
>    I2. Enable internal RBIAS (TX1_INT_RBIAS_EN bit in CDC_A_MICB_1_INT_RBIAS)
> 
> The sequence for enabling MIC BIAS External1 is:
>    E1. Enable MIC_BIAS1 supply (MICB_EN bit in CDC_A_MICB_1_EN)

In theory, We should also disable the internal pull up here. if not we 
end up in two parallel resistors, effectively 1/2 the value of external 
resistor.



> 
> Right now we have:
>    SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_EN, 7, 0, ...) // I1
>    SND_SOC_DAPM_SUPPLY("MIC BIAS External1", CDC_A_MICB_1_EN, 7, 0, ...) // E1
> 
> I2 is done in the PM event handler (pm8916_wcd_analog_enable_micbias_int1).
> 
> The idea of this patch is to simplify this, and use one DAPM supply
> that handles the common (I1/E1), and one DAPM supply that handles (I2).
> 
> Translated to code we get:
>    SND_SOC_DAPM_SUPPLY("MIC BIAS1", CDC_A_MICB_1_EN, 7, 0, ...) // I1/E1
>    SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_INT_RBIAS, 7, 0, ...) // I2
>    SND_SOC_DAPM_SUPPLY("MIC BIAS External1", SND_SOC_NOPM, ...) // dummy
> 
> And the routes:
>    {"MIC BIAS Internal1", NULL, "MIC BIAS1"} // If I2, also do I1
>    {"MIC BIAS External1", NULL, "MIC BIAS1"} // Only do E1

This should work! and makes it much clear too.


> 
> As you can see, for "MIC BIAS External1" we just do "MIC BIAS1".
> The confusing element of this patch might be that I simplified it a bit
> further and combined "MIC BIAS1" with "MIC BIAS External1".
> This works because we don't do anything extra for "MIC BIAS External1".
Should we not make sure that internal resistor switch is disabled here?

--srini

> 
> Does that make sense?
> 
> Thanks for taking the time to review all my patches.
> Stephan
> 
>>
>> --srini
>>
>>
>>
>>
>>>
>>> This means that we can simplify the code by modelling MIC BIAS InternalX
>>> as supply connected to MIC BIAS ExternalX. MIC BIAS InternalX is only
>>> responsible for enabling the internal RBIAS resistor (2). The DAPM enable
>>> sequence will automatically enable MIC BIAS ExternalX (1).
>>>
>>> This makes it much easier to add support for MIC BIAS Internal3
>>> as a next step.
>>>
>>> Tested-by: Nikita Travkin <nikitos.tr@gmail.com> # longcheer-l8150
>>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>> ---
>>>    sound/soc/codecs/msm8916-wcd-analog.c | 57 ++++++---------------------
>>>    1 file changed, 13 insertions(+), 44 deletions(-)
>>>
>>> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
>>> index 1f7964beb20c..930baae6eff5 100644
>>> --- a/sound/soc/codecs/msm8916-wcd-analog.c
>>> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
>>> @@ -389,23 +389,17 @@ static int pm8916_wcd_analog_enable_micbias_ext(struct snd_soc_component
>>>    	return 0;
>>>    }
>>> -static int pm8916_wcd_analog_enable_micbias_int(struct snd_soc_component
>>> -						 *component, int event,
>>> -						 int reg, u32 cap_mode)
>>> +static int pm8916_wcd_analog_enable_micbias_int(struct snd_soc_dapm_widget *w,
>>> +						struct snd_kcontrol *kcontrol,
>>> +						int event)
>>>    {
>>> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>>>    	switch (event) {
>>>    	case SND_SOC_DAPM_PRE_PMU:
>>> -		snd_soc_component_update_bits(component, reg, MICB_1_EN_PULL_DOWN_EN_MASK, 0);
>>>    		snd_soc_component_update_bits(component, CDC_A_MICB_1_EN,
>>>    				    MICB_1_EN_OPA_STG2_TAIL_CURR_MASK,
>>>    				    MICB_1_EN_OPA_STG2_TAIL_CURR_1_60UA);
>>> -
>>> -		break;
>>> -	case SND_SOC_DAPM_POST_PMU:
>>> -		pm8916_wcd_analog_micbias_enable(component);
>>> -		snd_soc_component_update_bits(component, CDC_A_MICB_1_EN,
>>> -				    MICB_1_EN_BYP_CAP_MASK, cap_mode);
>>>    		break;
>>>    	}
>>> @@ -437,26 +431,6 @@ static int pm8916_wcd_analog_enable_micbias_ext2(struct
>>>    }
>>> -static int pm8916_wcd_analog_enable_micbias_int1(struct
>>> -						  snd_soc_dapm_widget
>>> -						  *w, struct snd_kcontrol
>>> -						  *kcontrol, int event)
>>> -{
>>> -	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>>> -	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
>>> -
>>> -	switch (event) {
>>> -	case SND_SOC_DAPM_PRE_PMU:
>>> -		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
>>> -				    MICB_1_INT_TX1_INT_RBIAS_EN_MASK,
>>> -				    MICB_1_INT_TX1_INT_RBIAS_EN_ENABLE);
>>> -		break;
>>> -	}
>>> -
>>> -	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
>>> -						     wcd->micbias1_cap_mode);
>>> -}
>>> -
>>>    static int pm8916_mbhc_configure_bias(struct pm8916_wcd_analog_priv *priv,
>>>    				      bool micbias2_enabled)
>>>    {
>>> @@ -564,9 +538,8 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
>>>    	switch (event) {
>>>    	case SND_SOC_DAPM_PRE_PMU:
>>> -		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
>>> -				    MICB_1_INT_TX2_INT_RBIAS_EN_MASK,
>>> -				    MICB_1_INT_TX2_INT_RBIAS_EN_ENABLE);
>>> +		snd_soc_component_update_bits(component, CDC_A_MICB_2_EN,
>>> +					      CDC_A_MICB_2_PULL_DOWN_EN_MASK, 0);
>>>    		break;
>>>    	case SND_SOC_DAPM_POST_PMU:
>>>    		pm8916_mbhc_configure_bias(wcd, true);
>>> @@ -576,8 +549,7 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
>>>    		break;
>>>    	}
>>> -	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
>>> -						     wcd->micbias2_cap_mode);
>>> +	return pm8916_wcd_analog_enable_micbias_int(w, kcontrol, event);
>>>    }
>>>    static int pm8916_wcd_analog_enable_adc(struct snd_soc_dapm_widget *w,
>>> @@ -878,12 +850,10 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
>>>    	{"SPK PA", NULL, "SPK DAC"},
>>>    	{"SPK DAC", "Switch", "PDM_RX3"},
>>> -	{"MIC BIAS Internal1", NULL, "INT_LDO_H"},
>>> -	{"MIC BIAS Internal2", NULL, "INT_LDO_H"},
>>> +	{"MIC BIAS Internal1", NULL, "MIC BIAS External1"},
>>> +	{"MIC BIAS Internal2", NULL, "MIC BIAS External2"},
>>>    	{"MIC BIAS External1", NULL, "INT_LDO_H"},
>>>    	{"MIC BIAS External2", NULL, "INT_LDO_H"},
>>> -	{"MIC BIAS Internal1", NULL, "vdd-micbias"},
>>> -	{"MIC BIAS Internal2", NULL, "vdd-micbias"},
>>>    	{"MIC BIAS External1", NULL, "vdd-micbias"},
>>>    	{"MIC BIAS External2", NULL, "vdd-micbias"},
>>>    };
>>> @@ -937,11 +907,10 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
>>>    	SND_SOC_DAPM_SUPPLY("RX_BIAS", CDC_A_RX_COM_BIAS_DAC, 7, 0, NULL, 0),
>>>    	/* TX */
>>> -	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_EN, 7, 0,
>>> -			    pm8916_wcd_analog_enable_micbias_int1,
>>> -			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>>> -			    SND_SOC_DAPM_POST_PMD),
>>> -	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal2", CDC_A_MICB_2_EN, 7, 0,
>>> +	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_INT_RBIAS, 7, 0,
>>> +			    pm8916_wcd_analog_enable_micbias_int,
>>> +			    SND_SOC_DAPM_PRE_PMU),
>>> +	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal2", CDC_A_MICB_1_INT_RBIAS, 4, 0,
>>>    			    pm8916_wcd_analog_enable_micbias_int2,
>>>    			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>>>    			    SND_SOC_DAPM_POST_PMD),
>>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
