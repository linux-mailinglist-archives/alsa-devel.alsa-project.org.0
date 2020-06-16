Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9E1FAEEF
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 13:13:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81032167C;
	Tue, 16 Jun 2020 13:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81032167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592306010;
	bh=BGOSeIOXVZpFTcC5omEXErbfuvy6fPyiKnsYh4ujJn4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LcQZVnB58EEJfHpZ+iFUqEMWuh+IMeXmGIacCEekZfYQ71p8lWZj9xVMYPk0zF0Cd
	 V444UKeb5e/ABhg6JCiswZ7jZarrXYvO8YEFas5o2bBNhc1bCrRLRFeDeUvIc8u4bG
	 yfOQqQuiOhBSaVqf2UrW5I7Cdn5elZ84mnHWWFL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A093FF80101;
	Tue, 16 Jun 2020 13:11:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9807F8022B; Tue, 16 Jun 2020 13:11:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32AD3F80101
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 13:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32AD3F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fpQT0Myw"
Received: by mail-wr1-x442.google.com with SMTP id p5so20292123wrw.9
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n+/jE5rC26UcvcTlleRqP8X35sBSlsK7GtdZmIrYebM=;
 b=fpQT0MywQm3k2lZ67atSboWIA09H//N9xtt36CR+W5808qR2EiLUtz/dMt426vB6gT
 vzXG9eBlIsbMTKiQGHfk/fV8aKCmI0n9tF5cK29BOEV+GKpiayeaoZMKZuPKwmbusV2b
 Te6L9o8H5/amzBQNS92wfAVzR0MfjCh4Msgyq2JmRVKydf7nA3kKxvTTvBORLfOre5rL
 Rpn0Q8A00RLijVfZ2gKMqPpNVKjoIPnTH5fH4tg7gINhvU23Q0EKawr+un6eZsfZohoN
 7LEUJxHINQn1993oMr95IytCNNoy1CEndszQ9FYKUo7hKbyxvSHwcpH/wbcfj5mVNNIr
 Mi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n+/jE5rC26UcvcTlleRqP8X35sBSlsK7GtdZmIrYebM=;
 b=DsZWVtHqtTzsSxb8iR1P0uYkkVtJeMLOkcMCUldZHR/HlZb488434q7O0eX04EcVcv
 F9WkIlA+/+5fgOBubETD1N5ssXZ99T1hPxw2GOK5G9CVxbLCxleKyp/YAHdtG+kAoVU/
 c1J+DQuKOerBjbgQkd7h8AOw7t31qu25HyD9L+MYxaegzJWPXbp5DaBXjPqNr5GKC1rj
 xzDIlfNHPjHwafSxe+2gZVfOaKDxxdu3IkBcB6d8wmg/NXZpeHKBwqmga8fsqsYjS0jV
 cTAU4eBcEnHmfIdgdTQJiLnPa/df7qqdjH9zhxWsxpVVMi+ZW+VArYq48aDr6GQeSqCE
 feZg==
X-Gm-Message-State: AOAM533PPBiMT8l5+YPRkos+seS4UwJHT2zbt2OYBnm82Iw54QQ1ngGJ
 aKaDYl9ZZovfPCRmrmcdyZpyQ2n7xq4=
X-Google-Smtp-Source: ABdhPJy+YeFuoetlGycd1lzI2q9RW6yAOtWyQW/FSZmtrM5CcoIyGIhBGLEx0DlLZEyHakC4H6oS6A==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr2409201wrm.181.1592305897717; 
 Tue, 16 Jun 2020 04:11:37 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id a3sm3454686wmb.7.2020.06.16.04.11.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 04:11:36 -0700 (PDT)
Subject: Re: [PATCH 06/16] ASoC: codecs: wcd*: rename to
 snd_soc_component_read()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87tuzb4mjg.wl-kuninori.morimoto.gx@renesas.com>
 <87lfkn4mdy.wl-kuninori.morimoto.gx@renesas.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <370c7c82-7e67-1318-69b6-6e78a49e85eb@linaro.org>
Date: Tue, 16 Jun 2020 12:11:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87lfkn4mdy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 16/06/2020 06:20, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We need to use snd_soc_component_read()
> instead of     snd_soc_component_read32()
> 
> This patch renames _read32() to _read()
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/codecs/wcd-clsh-v2.c |  2 +-
>   sound/soc/codecs/wcd9335.c     | 48 +++++++++++++++----------------
>   sound/soc/codecs/wcd934x.c     | 52 +++++++++++++++++-----------------
>   3 files changed, 51 insertions(+), 51 deletions(-)

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> 
> diff --git a/sound/soc/codecs/wcd-clsh-v2.c b/sound/soc/codecs/wcd-clsh-v2.c
> index cc5a9c9b918b..1be82113c59a 100644
> --- a/sound/soc/codecs/wcd-clsh-v2.c
> +++ b/sound/soc/codecs/wcd-clsh-v2.c
> @@ -119,7 +119,7 @@ static inline void wcd_enable_clsh_block(struct wcd_clsh_ctrl *ctrl,
>   
>   static inline bool wcd_clsh_enable_status(struct snd_soc_component *comp)
>   {
> -	return snd_soc_component_read32(comp, WCD9XXX_A_CDC_CLSH_CRC) &
> +	return snd_soc_component_read(comp, WCD9XXX_A_CDC_CLSH_CRC) &
>   					WCD9XXX_A_CDC_CLSH_CRC_CLK_EN_MASK;
>   }
>   
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index fb073f4dc7ed..f2d9d52ee171 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -1617,7 +1617,7 @@ static int wcd9335_set_mix_interpolator_rate(struct snd_soc_dai *dai,
>   
>   	list_for_each_entry(ch, &wcd->dai[dai->id].slim_ch_list, list) {
>   		for (j = 0; j < WCD9335_NUM_INTERPOLATORS; j++) {
> -			val = snd_soc_component_read32(component,
> +			val = snd_soc_component_read(component,
>   					WCD9335_CDC_RX_INP_MUX_RX_INT_CFG1(j)) &
>   					WCD9335_CDC_RX_INP_MUX_RX_INT_SEL_MASK;
>   
> @@ -1650,9 +1650,9 @@ static int wcd9335_set_prim_interpolator_rate(struct snd_soc_dai *dai,
>   		 * is connected
>   		 */
>   		for (j = 0; j < WCD9335_NUM_INTERPOLATORS; j++) {
> -			cfg0 = snd_soc_component_read32(comp,
> +			cfg0 = snd_soc_component_read(comp,
>   					WCD9335_CDC_RX_INP_MUX_RX_INT_CFG0(j));
> -			cfg1 = snd_soc_component_read32(comp,
> +			cfg1 = snd_soc_component_read(comp,
>   					WCD9335_CDC_RX_INP_MUX_RX_INT_CFG1(j));
>   
>   			inp0_sel = cfg0 &
> @@ -1826,7 +1826,7 @@ static int wcd9335_set_decimator_rate(struct snd_soc_dai *dai,
>   			return -EINVAL;
>   		}
>   
> -		tx_mux_sel = snd_soc_component_read32(comp, tx_port_reg) &
> +		tx_mux_sel = snd_soc_component_read(comp, tx_port_reg) &
>   						      (shift_val << shift);
>   
>   		tx_mux_sel = tx_mux_sel >> shift;
> @@ -2678,17 +2678,17 @@ static int wcd9335_codec_find_amic_input(struct snd_soc_component *comp,
>   	if (adc_mux_n < 4) {
>   		reg = WCD9335_CDC_TX_INP_MUX_ADC_MUX0_CFG1 + 2 * adc_mux_n;
>   		mreg = WCD9335_CDC_TX_INP_MUX_ADC_MUX0_CFG0 + 2 * adc_mux_n;
> -		mux_sel = snd_soc_component_read32(comp, reg) & 0x3;
> +		mux_sel = snd_soc_component_read(comp, reg) & 0x3;
>   	} else {
>   		reg = WCD9335_CDC_TX_INP_MUX_ADC_MUX4_CFG0 + adc_mux_n - 4;
>   		mreg = reg;
> -		mux_sel = snd_soc_component_read32(comp, reg) >> 6;
> +		mux_sel = snd_soc_component_read(comp, reg) >> 6;
>   	}
>   
>   	if (mux_sel != WCD9335_CDC_TX_INP_MUX_SEL_AMIC)
>   		return 0;
>   
> -	return snd_soc_component_read32(comp, mreg) & 0x07;
> +	return snd_soc_component_read(comp, mreg) & 0x07;
>   }
>   
>   static u16 wcd9335_codec_get_amic_pwlvl_reg(struct snd_soc_component *comp,
> @@ -2776,7 +2776,7 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
>   								       amic_n);
>   
>   		if (pwr_level_reg) {
> -			switch ((snd_soc_component_read32(comp, pwr_level_reg) &
> +			switch ((snd_soc_component_read(comp, pwr_level_reg) &
>   					      WCD9335_AMIC_PWR_LVL_MASK) >>
>   					      WCD9335_AMIC_PWR_LVL_SHIFT) {
>   			case WCD9335_AMIC_PWR_LEVEL_LP:
> @@ -2798,7 +2798,7 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
>   				break;
>   			}
>   		}
> -		hpf_coff_freq = (snd_soc_component_read32(comp, dec_cfg_reg) &
> +		hpf_coff_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
>   				   TX_HPF_CUT_OFF_FREQ_MASK) >> 5;
>   
>   		if (hpf_coff_freq != CF_MIN_3DB_150HZ)
> @@ -2830,10 +2830,10 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
>   		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
>   						0x10, 0x00);
>   		snd_soc_component_write(comp, tx_gain_ctl_reg,
> -			      snd_soc_component_read32(comp, tx_gain_ctl_reg));
> +			      snd_soc_component_read(comp, tx_gain_ctl_reg));
>   		break;
>   	case SND_SOC_DAPM_PRE_PMD:
> -		hpf_coff_freq = (snd_soc_component_read32(comp, dec_cfg_reg) &
> +		hpf_coff_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
>   				   TX_HPF_CUT_OFF_FREQ_MASK) >> 5;
>   		snd_soc_component_update_bits(comp, tx_vol_ctl_reg, 0x10, 0x10);
>   		snd_soc_component_update_bits(comp, dec_cfg_reg, 0x08, 0x00);
> @@ -3080,7 +3080,7 @@ static int wcd9335_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
>   
>   	switch (event) {
>   	case SND_SOC_DAPM_POST_PMU:
> -		val = snd_soc_component_read32(comp, gain_reg);
> +		val = snd_soc_component_read(comp, gain_reg);
>   		val += offset_val;
>   		snd_soc_component_write(comp, gain_reg, val);
>   		break;
> @@ -3208,7 +3208,7 @@ static int wcd9335_codec_enable_prim_interpolator(
>   		}
>   
>   		if ((reg != prim_int_reg) &&
> -			((snd_soc_component_read32(comp, prim_int_reg)) &
> +			((snd_soc_component_read(comp, prim_int_reg)) &
>   			 WCD9335_CDC_RX_PGA_MUTE_EN_MASK))
>   			snd_soc_component_update_bits(comp, reg,
>   						WCD9335_CDC_RX_PGA_MUTE_EN_MASK,
> @@ -3344,7 +3344,7 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
>   		break;
>   	case SND_SOC_DAPM_POST_PMU:
>   		wcd9335_config_compander(comp, w->shift, event);
> -		val = snd_soc_component_read32(comp, gain_reg);
> +		val = snd_soc_component_read(comp, gain_reg);
>   		val += offset_val;
>   		snd_soc_component_write(comp, gain_reg, val);
>   		break;
> @@ -3366,12 +3366,12 @@ static void wcd9335_codec_hph_mode_gain_opt(struct snd_soc_component *component,
>   	u8 hph_pa_status;
>   	bool is_hphl_pa, is_hphr_pa;
>   
> -	hph_pa_status = snd_soc_component_read32(component, WCD9335_ANA_HPH);
> +	hph_pa_status = snd_soc_component_read(component, WCD9335_ANA_HPH);
>   	is_hphl_pa = hph_pa_status >> 7;
>   	is_hphr_pa = (hph_pa_status & 0x40) >> 6;
>   
> -	hph_l_en = snd_soc_component_read32(component, WCD9335_HPH_L_EN);
> -	hph_r_en = snd_soc_component_read32(component, WCD9335_HPH_R_EN);
> +	hph_l_en = snd_soc_component_read(component, WCD9335_HPH_L_EN);
> +	hph_r_en = snd_soc_component_read(component, WCD9335_HPH_R_EN);
>   
>   	l_val = (hph_l_en & 0xC0) | 0x20 | gain;
>   	r_val = (hph_r_en & 0xC0) | 0x20 | gain;
> @@ -3542,7 +3542,7 @@ static int wcd9335_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
>   		/* Read DEM INP Select */
> -		dem_inp = snd_soc_component_read32(comp,
> +		dem_inp = snd_soc_component_read(comp,
>   				WCD9335_CDC_RX1_RX_PATH_SEC0) & 0x03;
>   		if (((hph_mode == CLS_H_HIFI) || (hph_mode == CLS_H_LOHIFI) ||
>   				(hph_mode == CLS_H_LP)) && (dem_inp != 0x01)) {
> @@ -3694,7 +3694,7 @@ static int wcd9335_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
>   	case SND_SOC_DAPM_PRE_PMU:
>   
>   		/* Read DEM INP Select */
> -		dem_inp = snd_soc_component_read32(comp,
> +		dem_inp = snd_soc_component_read(comp,
>   				WCD9335_CDC_RX2_RX_PATH_SEC0) &
>   				WCD9335_CDC_RX_PATH_DEM_INP_SEL_MASK;
>   		if (((hph_mode == CLS_H_HIFI) || (hph_mode == CLS_H_LOHIFI) ||
> @@ -3755,7 +3755,7 @@ static int wcd9335_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
>   					WCD9335_CDC_RX_PGA_MUTE_DISABLE);
>   
>   		/* Remove mix path mute if it is enabled */
> -		if ((snd_soc_component_read32(comp,
> +		if ((snd_soc_component_read(comp,
>   					WCD9335_CDC_RX1_RX_PATH_MIX_CTL)) &
>   					WCD9335_CDC_RX_PGA_MUTE_EN_MASK)
>   			snd_soc_component_update_bits(comp,
> @@ -3817,7 +3817,7 @@ static int wcd9335_codec_enable_lineout_pa(struct snd_soc_dapm_widget *w,
>   					WCD9335_CDC_RX_PGA_MUTE_DISABLE);
>   
>   		/* Remove mix path mute if it is enabled */
> -		if ((snd_soc_component_read32(comp, mix_vol_reg)) &
> +		if ((snd_soc_component_read(comp, mix_vol_reg)) &
>   					WCD9335_CDC_RX_PGA_MUTE_EN_MASK)
>   			snd_soc_component_update_bits(comp,  mix_vol_reg,
>   					WCD9335_CDC_RX_PGA_MUTE_EN_MASK,
> @@ -3902,7 +3902,7 @@ static int wcd9335_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
>   					WCD9335_CDC_RX_PGA_MUTE_EN_MASK,
>   					WCD9335_CDC_RX_PGA_MUTE_DISABLE);
>   		/* Remove mix path mute if it is enabled */
> -		if ((snd_soc_component_read32(comp,
> +		if ((snd_soc_component_read(comp,
>   					WCD9335_CDC_RX2_RX_PATH_MIX_CTL)) &
>   					WCD9335_CDC_RX_PGA_MUTE_EN_MASK)
>   			snd_soc_component_update_bits(comp,
> @@ -3942,7 +3942,7 @@ static int wcd9335_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
>   					WCD9335_CDC_RX_PGA_MUTE_EN_MASK,
>   					WCD9335_CDC_RX_PGA_MUTE_DISABLE);
>   		/* Remove mix path mute if it is enabled */
> -		if ((snd_soc_component_read32(comp,
> +		if ((snd_soc_component_read(comp,
>   					WCD9335_CDC_RX0_RX_PATH_MIX_CTL)) &
>   					WCD9335_CDC_RX_PGA_MUTE_EN_MASK)
>   			snd_soc_component_update_bits(comp,
> @@ -4808,7 +4808,7 @@ static int wcd9335_enable_efuse_sensing(struct snd_soc_component *comp)
>   	 */
>   	usleep_range(5000, 5500);
>   
> -	if (!(snd_soc_component_read32(comp,
> +	if (!(snd_soc_component_read(comp,
>   					WCD9335_CHIP_TIER_CTRL_EFUSE_STATUS) &
>   					WCD9335_CHIP_TIER_CTRL_EFUSE_EN_MASK))
>   		WARN(1, "%s: Efuse sense is not complete\n", __func__);
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index 531b8b79e55f..35697b072367 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -1464,9 +1464,9 @@ static int wcd934x_set_prim_interpolator_rate(struct snd_soc_dai *dai,
>   			if (j == INTERP_LO3_NA || j == INTERP_LO4_NA)
>   				continue;
>   
> -			cfg0 = snd_soc_component_read32(comp,
> +			cfg0 = snd_soc_component_read(comp,
>   					WCD934X_CDC_RX_INP_MUX_RX_INT_CFG0(j));
> -			cfg1 = snd_soc_component_read32(comp,
> +			cfg1 = snd_soc_component_read(comp,
>   					WCD934X_CDC_RX_INP_MUX_RX_INT_CFG1(j));
>   
>   			inp0_sel = cfg0 &
> @@ -1513,7 +1513,7 @@ static int wcd934x_set_mix_interpolator_rate(struct snd_soc_dai *dai,
>   			/* Interpolators 5 and 6 are not aviliable in Tavil */
>   			if (j == INTERP_LO3_NA || j == INTERP_LO4_NA)
>   				continue;
> -			val = snd_soc_component_read32(component,
> +			val = snd_soc_component_read(component,
>   					WCD934X_CDC_RX_INP_MUX_RX_INT_CFG1(j)) &
>   					WCD934X_CDC_RX_INP_MUX_RX_INT_SEL_MASK;
>   
> @@ -1616,7 +1616,7 @@ static int wcd934x_set_decimator_rate(struct snd_soc_dai *dai,
>   			return -EINVAL;
>   		}
>   
> -		tx_mux_sel = snd_soc_component_read32(comp, tx_port_reg) &
> +		tx_mux_sel = snd_soc_component_read(comp, tx_port_reg) &
>   						      (shift_val << shift);
>   
>   		tx_mux_sel = tx_mux_sel >> shift;
> @@ -2346,23 +2346,23 @@ static uint32_t get_iir_band_coeff(struct snd_soc_component *component,
>   				((band_idx * BAND_MAX + coeff_idx) *
>   				 sizeof(uint32_t)) & 0x7F);
>   
> -	value |= snd_soc_component_read32(component, b2_reg);
> +	value |= snd_soc_component_read(component, b2_reg);
>   	snd_soc_component_write(component, reg,
>   				((band_idx * BAND_MAX + coeff_idx)
>   				 * sizeof(uint32_t) + 1) & 0x7F);
>   
> -	value |= (snd_soc_component_read32(component, b2_reg) << 8);
> +	value |= (snd_soc_component_read(component, b2_reg) << 8);
>   	snd_soc_component_write(component, reg,
>   				((band_idx * BAND_MAX + coeff_idx)
>   				 * sizeof(uint32_t) + 2) & 0x7F);
>   
> -	value |= (snd_soc_component_read32(component, b2_reg) << 16);
> +	value |= (snd_soc_component_read(component, b2_reg) << 16);
>   	snd_soc_component_write(component, reg,
>   		((band_idx * BAND_MAX + coeff_idx)
>   		* sizeof(uint32_t) + 3) & 0x7F);
>   
>   	/* Mask bits top 2 bits since they are reserved */
> -	value |= (snd_soc_component_read32(component, b2_reg) << 24);
> +	value |= (snd_soc_component_read(component, b2_reg) << 24);
>   	return value;
>   }
>   
> @@ -3535,7 +3535,7 @@ static int wcd934x_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
>   		break;
>   
>   	case SND_SOC_DAPM_POST_PMU:
> -		val = snd_soc_component_read32(comp, gain_reg);
> +		val = snd_soc_component_read(comp, gain_reg);
>   		val += offset_val;
>   		snd_soc_component_write(comp, gain_reg, val);
>   		break;
> @@ -3554,23 +3554,23 @@ static int wcd934x_codec_set_iir_gain(struct snd_soc_dapm_widget *w,
>   	case SND_SOC_DAPM_POST_PMU:
>   		/* B1 GAIN */
>   		snd_soc_component_write(comp, reg,
> -					snd_soc_component_read32(comp, reg));
> +					snd_soc_component_read(comp, reg));
>   		/* B2 GAIN */
>   		reg++;
>   		snd_soc_component_write(comp, reg,
> -					snd_soc_component_read32(comp, reg));
> +					snd_soc_component_read(comp, reg));
>   		/* B3 GAIN */
>   		reg++;
>   		snd_soc_component_write(comp, reg,
> -					snd_soc_component_read32(comp, reg));
> +					snd_soc_component_read(comp, reg));
>   		/* B4 GAIN */
>   		reg++;
>   		snd_soc_component_write(comp, reg,
> -					snd_soc_component_read32(comp, reg));
> +					snd_soc_component_read(comp, reg));
>   		/* B5 GAIN */
>   		reg++;
>   		snd_soc_component_write(comp, reg,
> -					snd_soc_component_read32(comp, reg));
> +					snd_soc_component_read(comp, reg));
>   		break;
>   	default:
>   		break;
> @@ -3591,7 +3591,7 @@ static int wcd934x_codec_enable_main_path(struct snd_soc_dapm_widget *w,
>   	switch (event) {
>   	case SND_SOC_DAPM_POST_PMU:
>   		snd_soc_component_write(comp, gain_reg,
> -				snd_soc_component_read32(comp, gain_reg));
> +				snd_soc_component_read(comp, gain_reg));
>   		break;
>   	}
>   
> @@ -3635,7 +3635,7 @@ static int wcd934x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
>   		/* Read DEM INP Select */
> -		dem_inp = snd_soc_component_read32(comp,
> +		dem_inp = snd_soc_component_read(comp,
>   				   WCD934X_CDC_RX1_RX_PATH_SEC0) & 0x03;
>   
>   		if (((hph_mode == CLS_H_HIFI) || (hph_mode == CLS_H_LOHIFI) ||
> @@ -3686,7 +3686,7 @@ static int wcd934x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
>   
>   	switch (event) {
>   	case SND_SOC_DAPM_PRE_PMU:
> -		dem_inp = snd_soc_component_read32(comp,
> +		dem_inp = snd_soc_component_read(comp,
>   					WCD934X_CDC_RX2_RX_PATH_SEC0) & 0x03;
>   		if (((hph_mode == CLS_H_HIFI) || (hph_mode == CLS_H_LOHIFI) ||
>   		     (hph_mode == CLS_H_LP)) && (dem_inp != 0x01)) {
> @@ -3837,7 +3837,7 @@ static int wcd934x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
>   				      WCD934X_HPH_AUTOCHOP_TIMER_EN_MASK,
>   				      WCD934X_HPH_AUTOCHOP_TIMER_ENABLE);
>   		/* Remove mix path mute if it is enabled */
> -		if ((snd_soc_component_read32(comp,
> +		if ((snd_soc_component_read(comp,
>   				      WCD934X_CDC_RX2_RX_PATH_MIX_CTL)) & 0x10)
>   			snd_soc_component_update_bits(comp,
>   					      WCD934X_CDC_RX2_RX_PATH_MIX_CTL,
> @@ -3889,7 +3889,7 @@ static u32 wcd934x_get_dmic_sample_rate(struct snd_soc_component *comp,
>   			++adc_mux_index;
>   			continue;
>   		}
> -		adc_mux_sel = ((snd_soc_component_read32(comp, adc_mux_ctl_reg)
> +		adc_mux_sel = ((snd_soc_component_read(comp, adc_mux_ctl_reg)
>   			       & 0xF8) >> 3) - 1;
>   
>   		if (adc_mux_sel == dmic) {
> @@ -3902,7 +3902,7 @@ static u32 wcd934x_get_dmic_sample_rate(struct snd_soc_component *comp,
>   
>   	if (dec_found && adc_mux_index <= 8) {
>   		tx_fs_reg = WCD934X_CDC_TX0_TX_PATH_CTL + (16 * adc_mux_index);
> -		tx_stream_fs = snd_soc_component_read32(comp, tx_fs_reg) & 0x0F;
> +		tx_stream_fs = snd_soc_component_read(comp, tx_fs_reg) & 0x0F;
>   		if (tx_stream_fs <= 4)  {
>   			if (wcd->dmic_sample_rate <=
>   					WCD9XXX_DMIC_SAMPLE_RATE_2P4MHZ)
> @@ -4104,12 +4104,12 @@ static int wcd934x_codec_find_amic_input(struct snd_soc_component *comp,
>   				   adc_mux_n - 4;
>   	}
>   
> -	is_amic = (((snd_soc_component_read32(comp, adc_mux_in_reg)
> +	is_amic = (((snd_soc_component_read(comp, adc_mux_in_reg)
>   		     & mask) >> shift) == 1);
>   	if (!is_amic)
>   		return 0;
>   
> -	return snd_soc_component_read32(comp, amic_mux_sel_reg) & 0x07;
> +	return snd_soc_component_read(comp, amic_mux_sel_reg) & 0x07;
>   }
>   
>   static u16 wcd934x_codec_get_amic_pwlvl_reg(struct snd_soc_component *comp,
> @@ -4193,7 +4193,7 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
>   		if (!pwr_level_reg)
>   			break;
>   
> -		switch ((snd_soc_component_read32(comp, pwr_level_reg) &
> +		switch ((snd_soc_component_read(comp, pwr_level_reg) &
>   				      WCD934X_AMIC_PWR_LVL_MASK) >>
>   				      WCD934X_AMIC_PWR_LVL_SHIFT) {
>   		case WCD934X_AMIC_PWR_LEVEL_LP:
> @@ -4216,7 +4216,7 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
>   		}
>   		break;
>   	case SND_SOC_DAPM_POST_PMU:
> -		hpf_coff_freq = (snd_soc_component_read32(comp, dec_cfg_reg) &
> +		hpf_coff_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
>   				 TX_HPF_CUT_OFF_FREQ_MASK) >> 5;
>   		if (hpf_coff_freq != CF_MIN_3DB_150HZ) {
>   			snd_soc_component_update_bits(comp, dec_cfg_reg,
> @@ -4236,11 +4236,11 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
>   		}
>   		/* apply gain after decimator is enabled */
>   		snd_soc_component_write(comp, tx_gain_ctl_reg,
> -					snd_soc_component_read32(comp,
> +					snd_soc_component_read(comp,
>   							 tx_gain_ctl_reg));
>   		break;
>   	case SND_SOC_DAPM_PRE_PMD:
> -		hpf_coff_freq = (snd_soc_component_read32(comp, dec_cfg_reg) &
> +		hpf_coff_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
>   				 TX_HPF_CUT_OFF_FREQ_MASK) >> 5;
>   
>   		if (hpf_coff_freq != CF_MIN_3DB_150HZ) {
> 
