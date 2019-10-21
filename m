Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC505DE822
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 11:34:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 162DB1660;
	Mon, 21 Oct 2019 11:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 162DB1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571650454;
	bh=jcuIP+QLMfQ+0V+SpbpXRWaxfRJBs3hQ6D/dxprz6Mg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbA4XFZrOcu5umPVcazQNCcgelBYE97OIhbrVXa39QIgCS0dOJDZKSfZDxIX3Ko74
	 QEV3OwDJOwG26ZjYkyBlwbp3og3gSEfZQawFnjY3aZBz2231CxKgpJAkQi/7AKh0qw
	 wlxaCBnoGPykHTzIopMV8OTxYBTY5Uov9WUE21Y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0982DF803A6;
	Mon, 21 Oct 2019 11:32:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1256EF80368; Mon, 21 Oct 2019 11:32:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFFD4F800C0
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 11:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFFD4F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IaF4ypP3"
Received: by mail-wr1-x443.google.com with SMTP id c2so7830739wrr.10
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AAXNz7vVHfFXnP1eEpy3LNCgCSK23fgU+35qD5p60UI=;
 b=IaF4ypP3bMxI0JR5MZ2sfcBnNn1CxW3GIB4oe34nHE++QPiW/s00/4aWEyKteEL2JX
 gyoTI5kEW8/42IoZ11vscCKjqEaL4yNDXFIUtuc+PsRn9NxtzI0kOQ0aYN00K4JM51N8
 Y6XY2mOtL97V6wZ1146/iQd1c7/tCJmmJmweoNxlpkLyjLRgECMnyh1q3gLF4TbCY1AX
 v3bw1EeW5iIAsUUZCVWzEaTODzPtAkKARC4R0wKtr6px1AzIoecy2Ugtft2pT5OYdBaq
 46mM0XASD5ncywecJ76HF5XTCbZvjDORFIYrDShC8v5fb0kZ75lCKmxQ8x0fSg5tLd+F
 tYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AAXNz7vVHfFXnP1eEpy3LNCgCSK23fgU+35qD5p60UI=;
 b=jXAaLkRDNarVyEqsTOZ4W81q5n4QX73kWnl7JuGq5uFx/i0y3sGhj5ZncazlR5qxXr
 1bZldYOLEgNHVF2bb10gbMosvqFmEIDujxTOeJwHbCyAvdC8svH4p2zT6pPivy+77CLt
 SA7hYl3mKDpjnTE67LQuLBPtvLk0KfIjr/JDHRsanTsSEsef8a9PbY1trb6fG3a9jGWI
 tHK7W2R5biB092OyaWlmtzsNvvk0PmnOULNuqCYiwvz6ChpLKjPl9+2x9gsG5VfOB0Te
 JXLfl89hkJGLqvUIFV0Sp67Ha2DycdZx1AfCUjyK+XL4WnUzLcWcSv93JOPbCH4836EJ
 /YtA==
X-Gm-Message-State: APjAAAXqDk9BYBE4mz7ikjYYd6yDiB8q+BvNxu9S59yKCWVXu2J0E193
 n+2yltOTHndIaotWLA8b8vMSpg==
X-Google-Smtp-Source: APXvYqwP6mKIl38iChJ4LAdJ9oa6iPRZPGV59hK/v1mpi95I+8DB8H+5eb3ZIUA9Xb5lwwMAVL8xjg==
X-Received: by 2002:adf:aacc:: with SMTP id i12mr18844723wrc.15.1571650339339; 
 Mon, 21 Oct 2019 02:32:19 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id z15sm14617882wrr.19.2019.10.21.02.32.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 02:32:18 -0700 (PDT)
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20191020153007.206070-1-stephan@gerhold.net>
 <20191020153007.206070-2-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d24a3c05-b5c5-1fd2-b10d-281f99d5e585@linaro.org>
Date: Mon, 21 Oct 2019 10:32:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191020153007.206070-2-stephan@gerhold.net>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: msm8916-wcd-analog: Add earpiece
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



On 20/10/2019 16:30, Stephan Gerhold wrote:
> PM8916 supports an earpiece as another (small) speaker.
> The earpiece is routed through RX MIX1 similarly to
> the headphones, except that RDAC2 MUX is set to RX1.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>


Looks good to me.

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
> This patch is based on code from the downstream driver
> (msm8x16-wcd.c, [1]) with some cleanup.
> 
> This enables the earpiece on the Samsung Galaxy A5 (2015),
> which has recently gained mainline support in [2].
> 
> [1]: https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/sound/soc/codecs/msm8x16-wcd.c?h=LA.BR.1.2.9.1-02310-8x16.0
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1329c1ab0730b521e6cd3051c56a2ff3d55f21e6
> ---
>   sound/soc/codecs/msm8916-wcd-analog.c | 54 ++++++++++++++++++++++++++-
>   1 file changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
> index e3d311fb510e..f53235be77d9 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
> @@ -228,6 +228,10 @@
>   #define CDC_A_RX_EAR_CTL			(0xf19E)
>   #define RX_EAR_CTL_SPK_VBAT_LDO_EN_MASK		BIT(0)
>   #define RX_EAR_CTL_SPK_VBAT_LDO_EN_ENABLE	BIT(0)
> +#define RX_EAR_CTL_PA_EAR_PA_EN_MASK		BIT(6)
> +#define RX_EAR_CTL_PA_EAR_PA_EN_ENABLE		BIT(6)
> +#define RX_EAR_CTL_PA_SEL_MASK			BIT(7)
> +#define RX_EAR_CTL_PA_SEL			BIT(7)
>   
>   #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
>   #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
> @@ -312,6 +316,7 @@ static const char *const hph_text[] = { "ZERO", "Switch", };
>   static const struct soc_enum hph_enum = SOC_ENUM_SINGLE_VIRT(
>   					ARRAY_SIZE(hph_text), hph_text);
>   
> +static const struct snd_kcontrol_new ear_mux = SOC_DAPM_ENUM("EAR_S", hph_enum);
>   static const struct snd_kcontrol_new hphl_mux = SOC_DAPM_ENUM("HPHL", hph_enum);
>   static const struct snd_kcontrol_new hphr_mux = SOC_DAPM_ENUM("HPHR", hph_enum);
>   
> @@ -685,6 +690,34 @@ static int pm8916_wcd_analog_enable_spk_pa(struct snd_soc_dapm_widget *w,
>   	return 0;
>   }
>   
> +static int pm8916_wcd_analog_enable_ear_pa(struct snd_soc_dapm_widget *w,
> +					    struct snd_kcontrol *kcontrol,
> +					    int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component, CDC_A_RX_EAR_CTL,
> +				    RX_EAR_CTL_PA_SEL_MASK, RX_EAR_CTL_PA_SEL);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		snd_soc_component_update_bits(component, CDC_A_RX_EAR_CTL,
> +				    RX_EAR_CTL_PA_EAR_PA_EN_MASK,
> +				    RX_EAR_CTL_PA_EAR_PA_EN_ENABLE);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		snd_soc_component_update_bits(component, CDC_A_RX_EAR_CTL,
> +				    RX_EAR_CTL_PA_EAR_PA_EN_MASK, 0);
> +		/* Delay to reduce ear turn off pop */
> +		usleep_range(7000, 7100);
> +		snd_soc_component_update_bits(component, CDC_A_RX_EAR_CTL,
> +				    RX_EAR_CTL_PA_SEL_MASK, 0);
> +		break;
> +	}
> +	return 0;
> +}
> +
>   static const struct reg_default wcd_reg_defaults_2_0[] = {
>   	{CDC_A_RX_COM_OCP_CTL, 0xD1},
>   	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
> @@ -801,12 +834,20 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
>   	{"PDM_TX", NULL, "A_MCLK2"},
>   	{"A_MCLK2", NULL, "A_MCLK"},
>   
> +	/* Earpiece (RX MIX1) */
> +	{"EAR", NULL, "EAR_S"},
> +	{"EAR_S", "Switch", "EAR PA"},
> +	{"EAR PA", NULL, "RX_BIAS"},
> +	{"EAR PA", NULL, "HPHL DAC"},
> +	{"EAR PA", NULL, "HPHR DAC"},
> +	{"EAR PA", NULL, "EAR CP"},
> +
>   	/* Headset (RX MIX1 and RX MIX2) */
>   	{"HEADPHONE", NULL, "HPHL PA"},
>   	{"HEADPHONE", NULL, "HPHR PA"},
>   
> -	{"HPHL PA", NULL, "EAR_HPHL_CLK"},
> -	{"HPHR PA", NULL, "EAR_HPHR_CLK"},
> +	{"HPHL DAC", NULL, "EAR_HPHL_CLK"},
> +	{"HPHR DAC", NULL, "EAR_HPHR_CLK"},
>   
>   	{"CP", NULL, "NCP_CLK"},
>   
> @@ -847,11 +888,20 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
>   	SND_SOC_DAPM_INPUT("AMIC1"),
>   	SND_SOC_DAPM_INPUT("AMIC3"),
>   	SND_SOC_DAPM_INPUT("AMIC2"),
> +	SND_SOC_DAPM_OUTPUT("EAR"),
>   	SND_SOC_DAPM_OUTPUT("HEADPHONE"),
>   
>   	/* RX stuff */
>   	SND_SOC_DAPM_SUPPLY("INT_LDO_H", SND_SOC_NOPM, 1, 0, NULL, 0),
>   
> +	SND_SOC_DAPM_PGA_E("EAR PA", SND_SOC_NOPM,
> +			   0, 0, NULL, 0,
> +			   pm8916_wcd_analog_enable_ear_pa,
> +			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MUX("EAR_S", SND_SOC_NOPM, 0, 0, &ear_mux),
> +	SND_SOC_DAPM_SUPPLY("EAR CP", CDC_A_NCP_EN, 4, 0, NULL, 0),
> +
>   	SND_SOC_DAPM_PGA("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0),
>   	SND_SOC_DAPM_MUX("HPHL", SND_SOC_NOPM, 0, 0, &hphl_mux),
>   	SND_SOC_DAPM_MIXER("HPHL DAC", CDC_A_RX_HPH_L_PA_DAC_CTL, 3, 0, NULL,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
