Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8156D53AB9E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 19:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 277FB170B;
	Wed,  1 Jun 2022 19:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 277FB170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654103755;
	bh=lI5R66GfQGhjI3ykE/16n0jDCwPyCO3u327MffeGynY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dn/rDWNeVZZuTSwOswZwB9f0VKDit7ydKG58JcktkmbEKoY+XJH6ecESrJ5m+nPbU
	 nm9gYZvcF/cXJVgX8heF1BbV5O1WnOyitqIwbu3aDy/dI6K4O7Af1UwUcWWz5ccPeM
	 5cJqaAAfvgjFU40/sxYqSLeneGqbrokeAythlxto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E07EF8025A;
	Wed,  1 Jun 2022 19:14:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6133F80238; Wed,  1 Jun 2022 19:14:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A09DF80149
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 19:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A09DF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xQe5YN2v"
Received: by mail-wr1-x430.google.com with SMTP id e2so3274982wrc.1
 for <alsa-devel@alsa-project.org>; Wed, 01 Jun 2022 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LhUFrQ5UG2Nb37jLcNo11kNsIx0xWSZ7PTaDdV+Er+o=;
 b=xQe5YN2vahuAL7lM+XXLrl615HO/Q7ysxGuCxKbaQXEna2rnUqS977dwnxRrd/S80I
 lPYlZ832E9x7nhBk+zL7UHfJWn1NBPG4dWXx+IL1Qaz2nILmQ1mf9tez5+a3OhWK7f1u
 z7/iLOzUenPO3I19m5EO84dT4S50cr87Hf2hbgMWKqUc8iB5Ga6eSBO+ZRGxtUH0HWZx
 G2X1kcMflVz5IQ7s5wF93oMSx9yJyeUSNMaZ0oiO0EYuIbzBjEcyIeTK++cdwJA0doRf
 pLS4tBx16rfi0cNi2MxfzhhdyhZnrB3YjnsOiXBo1lnqKGf6p33upS0bh9RrfgXQJZ74
 dBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LhUFrQ5UG2Nb37jLcNo11kNsIx0xWSZ7PTaDdV+Er+o=;
 b=TeU6Se1cKSogjZ7PfvvZ3l67jqrNpb9JmkM7oZKhV3OwP08ki2XFIPriAPABXDW0w6
 3Owag/gDrdLXwrwXJW92a3+RxpvfXq+Nlqe6NuO6TTTRxlY5plrsoXhxSLokkd19Bash
 oViUG+RFYT09vFrsPpj8D3wcOCpVqVtpMzp8kMlbbnKUV/p/GgIbgx5P9KnHvx2vVfIA
 CpNfw9W0euxjQ7ls9A5IJoH2WNrOrY7ws77ZrhjIBINGsV/py5lJNbbEYO4p1qdGS9ok
 iCRF8srhjHzxWmP50HZViHJF0wGYiPwTbvh7TFZ7gOYbW1Ddne2UXTPnYfimg7WQQJ0k
 KEAQ==
X-Gm-Message-State: AOAM531LxraV5ZAiX2ZVz6RWMjzRD+JxA/IgyZVoCHefpkTWtlE7Gy/M
 wqIaBlNEbHrfMROrDOh2jQbQterZ5qZ2GwD5
X-Google-Smtp-Source: ABdhPJwJvCfZjIft/G2W/uFt6WVeTLB1jYlivkhI0aA7x0ezCoIFg4QemEQRwdIcHumlsOtkwH0R6g==
X-Received: by 2002:a05:6000:1e0a:b0:210:32e1:3b03 with SMTP id
 bj10-20020a0560001e0a00b0021032e13b03mr386105wrb.642.1654103689133; 
 Wed, 01 Jun 2022 10:14:49 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 o4-20020a05600c510400b0039748be12dbsm6362792wms.47.2022.06.01.10.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 10:14:48 -0700 (PDT)
Message-ID: <6adf0ba3-485e-fc73-7f86-6a063a373b68@linaro.org>
Date: Wed, 1 Jun 2022 18:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Semantics for _SX controls
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Tan_Nay=c4=b1r?=
 <tannayir@gmail.com>, Banajit Goswami <bgoswami@codeaurora.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <YpeElAslQxfajbdq@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YpeElAslQxfajbdq@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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



On 01/06/2022 16:24, Mark Brown wrote:
> Hi,
> 
> The fixes for input validation have highlighed a bunch of
> problems with the _SX controls.  These aren't widely used, it's
> just some Cirrus Logic and Qualcomm CODECs plus the obsolte
> ab8500 driver, but it has become apparent that at least some of
> the drivers were relying on the lack of validation we used to
> have to work.
> 
> For the Cirrus case 34198710f55b5f ("ASoC: Add info callback for
> SX_TLV controls") says that the intended semantic is
> 
>      Currently every CODEC implementing these controls specifies the minimum
>      as the non-zero value for the minimum and the maximum as the number of
>      gain settings available.
> 
> which was from Charles at Cirrus so hopefully that's the semantic
> used by Cirrus drivers.  However Tan Nayir pointed at some out of
> tree patches from Qualcomm which change the info callback such
> that max is instead the maximum register value that can be
> written and reports that since we started validating written
> values properly they can no longer set some valid values in some
> controls on at least some Qualcomm devices (this was a wcd9340)
> which clearly indicates that there's some problems that need
> fixing.
> 
> This isn't helped by the fact that snd_soc_info_volsw_sx() is
> implemented by calling snd_soc_info_volsw() and then applying an
> offset to the maximum value which makes things harder to follow -
> I think we should make snd_soc_info_volsw_sx() a standalone
> function, and we probably need some fixes in some combination of
> the shared functions and the drivers as well.
> 
> Can people please check how the values in the current drivers
> correspond to what the actual bitfields in the registers have so
> we can get a handle on what's going on here?  I've pasted a quick
> grep for _SX controls below:

 From Qualcomm codecs side of it usage of SOC_SINGLE_SX_TLV should be 
moved to SOC_SINGLE_S8_TLV() in sound/soc/codecs/msm8916-wcd-digital.c 
and sound/soc/codecs/wcd9335.c. using SOC_SINGLE_SX_TLV() will result in 
incorrect volume settings.

All of these gains have signed 7th bit in 8 bit register with gain range 
from -84dB to +40dB in 1dB steps.

Other WCD Codecs seems to have done correctly using S8_TLV.

I can send a patch to fix these.

Thanks,
Srini


> 
> sound/soc/codecs/ab8500-codec.c:	SOC_SINGLE_XR_SX("ANC Warp Delay Shift",
> sound/soc/codecs/ab8500-codec.c:	SOC_SINGLE_XR_SX("ANC FIR Output Shift",
> sound/soc/codecs/ab8500-codec.c:	SOC_SINGLE_XR_SX("ANC IIR Output Shift",
> sound/soc/codecs/ab8500-codec.c:	SOC_SINGLE_XR_SX("ANC Warp Delay",
> sound/soc/codecs/cs35l33.c:	SOC_SINGLE_SX_TLV("DAC Volume", CS35L33_DIG_VOL_CTL,
> sound/soc/codecs/cs35l34.c:	SOC_SINGLE_SX_TLV("Digital Volume", CS35L34_AMP_DIG_VOL,
> sound/soc/codecs/cs35l35.c:	SOC_SINGLE_SX_TLV("Digital Audio Volume", CS35L35_AMP_DIG_VOL,
> sound/soc/codecs/cs35l35.c:	SOC_SINGLE_SX_TLV("Digital Advisory Volume", CS35L35_ADV_DIG_VOL,
> sound/soc/codecs/cs35l36.c:	SOC_SINGLE_SX_TLV("Digital PCM Volume", CS35L36_AMP_DIG_VOL_CTRL,
> sound/soc/codecs/cs35l41.c:	SOC_SINGLE_SX_TLV("Digital PCM Volume", CS35L41_AMP_DIG_VOL_CTRL,
> sound/soc/codecs/cs4265.c:	SOC_DOUBLE_R_SX_TLV("PGA Volume", CS4265_CHA_PGA_CTL,
> sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("PCM Playback Volume",
> sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("Analog Playback Volume",
> sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("ADC Mixer Volume",
> sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("ADC Attenuator Volume",
> sound/soc/codecs/cs42l51.c:	SOC_DOUBLE_R_SX_TLV("PGA Volume",
> sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("Master Volume", CS42L52_MASTERA_VOL,
> sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("Headphone Volume", CS42L52_HPA_VOL,
> sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("Speaker Volume", CS42L52_SPKA_VOL,
> sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("Bypass Volume", CS42L52_PASSTHRUA_VOL,
> sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("ADC Volume", CS42L52_ADCA_VOL,
> sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("ADC Mixer Volume",
> sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("PGA Volume", CS42L52_PGAA_CTL,
> sound/soc/codecs/cs42l52.c:	SOC_DOUBLE_R_SX_TLV("PCM Mixer Volume",
> sound/soc/codecs/cs42l52.c:	SOC_SINGLE_SX_TLV("Beep Volume", CS42L52_BEEP_VOL,
> sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("Master Volume", CS42L56_MASTER_A_VOLUME,
> sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("ADC Mixer Volume", CS42L56_ADCA_MIX_VOLUME,
> sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("PCM Mixer Volume", CS42L56_PCMA_MIX_VOLUME,
> sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("PGA Volume", CS42L56_PGAA_MUX_VOLUME,
> sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("Headphone Volume", CS42L56_HPA_VOLUME,
> sound/soc/codecs/cs42l56.c:	SOC_DOUBLE_R_SX_TLV("LineOut Volume", CS42L56_LOA_VOLUME,
> sound/soc/codecs/cs42l56.c:	SOC_SINGLE_SX_TLV("Beep Volume", CS42L56_BEEP_FREQ_OFFTIME,
> sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("Headphone Analog Playback Volume",
> sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("LineOut Analog Playback Volume", CS42L73_LOAAVOL,
> sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("Input PGA Analog Volume", CS42L73_MICAPREPGAAVOL,
> sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("Input Path Digital Volume", CS42L73_IPADVOL,
> sound/soc/codecs/cs42l73.c:	SOC_DOUBLE_R_SX_TLV("HL Digital Playback Volume",
> sound/soc/codecs/cs42l73.c:	SOC_SINGLE_SX_TLV("Speakerphone Digital Volume",
> sound/soc/codecs/cs42l73.c:	SOC_SINGLE_SX_TLV("Ear Speaker Digital Volume",
> sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC1A PGA Volume",
> sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC1B PGA Volume",
> sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC2A PGA Volume",
> sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC2B PGA Volume",
> sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC1A Digital Volume",
> sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC1B Digital Volume",
> sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC2A Digital Volume",
> sound/soc/codecs/cs53l30.c:	SOC_SINGLE_SX_TLV("ADC2B Digital Volume",
> sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR1 INP1 Volume", LPASS_CDC_IIR1_GAIN_B1_CTL,
> sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR1 INP2 Volume", LPASS_CDC_IIR1_GAIN_B2_CTL,
> sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR1 INP3 Volume", LPASS_CDC_IIR1_GAIN_B3_CTL,
> sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR1 INP4 Volume", LPASS_CDC_IIR1_GAIN_B4_CTL,
> sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR2 INP1 Volume", LPASS_CDC_IIR2_GAIN_B1_CTL,
> sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR2 INP2 Volume", LPASS_CDC_IIR2_GAIN_B2_CTL,
> sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR2 INP3 Volume", LPASS_CDC_IIR2_GAIN_B3_CTL,
> sound/soc/codecs/msm8916-wcd-digital.c:	SOC_SINGLE_SX_TLV("IIR2 INP4 Volume", LPASS_CDC_IIR2_GAIN_B4_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX0 Digital Volume", WCD9335_CDC_RX0_RX_VOL_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX1 Digital Volume", WCD9335_CDC_RX1_RX_VOL_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX2 Digital Volume", WCD9335_CDC_RX2_RX_VOL_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX3 Digital Volume", WCD9335_CDC_RX3_RX_VOL_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX4 Digital Volume", WCD9335_CDC_RX4_RX_VOL_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX5 Digital Volume", WCD9335_CDC_RX5_RX_VOL_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX6 Digital Volume", WCD9335_CDC_RX6_RX_VOL_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX7 Digital Volume", WCD9335_CDC_RX7_RX_VOL_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX8 Digital Volume", WCD9335_CDC_RX8_RX_VOL_CTL,
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX0 Mix Digital Volume",
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX1 Mix Digital Volume",
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX2 Mix Digital Volume",
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX3 Mix Digital Volume",
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX4 Mix Digital Volume",
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX5 Mix Digital Volume",
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX6 Mix Digital Volume",
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX7 Mix Digital Volume",
> sound/soc/codecs/wcd9335.c:	SOC_SINGLE_SX_TLV("RX8 Mix Digital Volume",
> 
> Thanks,
> Mark
