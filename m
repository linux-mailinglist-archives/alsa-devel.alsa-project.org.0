Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE03DE051
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Oct 2019 22:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153811615;
	Sun, 20 Oct 2019 22:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153811615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571602046;
	bh=1zIP5Tm9NyJ/gxjTdF1SeW6mnQDrozXYtRCe3tHrdeA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhRwzir7KHjLx6ABuf1eM4qgd9ArPI69UQVAiAVjWqaFEMj0duRKEvEY/UknaS2q9
	 lbwTG+MkEiokqX3zf74qWhvUy1HtpP8zKQe90I9cnJEczkQkNMUYEqSYthNSBGcdKr
	 wkjXU1Jwxh50Ul2pCLD30lU6KVaPcMicryhVBhqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37862F802FB;
	Sun, 20 Oct 2019 22:05:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A15A9F802FB; Sun, 20 Oct 2019 22:05:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 233A8F802BE
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 22:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 233A8F802BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2019 13:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,320,1566889200"; d="scan'208";a="227107416"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.18.15])
 ([10.252.18.15])
 by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2019 13:05:24 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-6-srinivas.kandagatla@linaro.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <e0049071-7fb7-7f9a-e79f-102c1a9c8d20@intel.com>
Date: Sun, 20 Oct 2019 22:05:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018001849.27205-6-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 05/11] ASoC: wcd934x: add playback dapm
	widgets
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

On 2019-10-18 02:18, Srinivas Kandagatla wrote:
> +static int wcd934x_codec_enable_slim(struct snd_soc_dapm_widget *w,
> +				     struct snd_kcontrol *kc,
> +				       int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(comp);
> +	struct wcd_slim_codec_dai_data *dai = &wcd->dai[w->shift];
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		wcd934x_codec_enable_int_port(dai, comp);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		break;

Any reason for mentioning _TRIGGER_STOP here?

> +	case SND_SOC_DAPM_POST_PMD:
> +		kfree(dai->sconfig.chs);
> +
> +		break;

Comment for kfree depending on _event_ would be advised.

> +	}
> +
> +	return 0;
> +}
> +
> +static void wcd934x_codec_hd2_control(struct snd_soc_component *component,
> +				      u16 interp_idx, int event)
> +{
> +	u16 hd2_scale_reg;
> +	u16 hd2_enable_reg = 0;
> +
> +	switch (interp_idx) {
> +	case INTERP_HPHL:
> +		hd2_scale_reg = WCD934X_CDC_RX1_RX_PATH_SEC3;
> +		hd2_enable_reg = WCD934X_CDC_RX1_RX_PATH_CFG0;
> +		break;
> +	case INTERP_HPHR:
> +		hd2_scale_reg = WCD934X_CDC_RX2_RX_PATH_SEC3;
> +		hd2_enable_reg = WCD934X_CDC_RX2_RX_PATH_CFG0;
> +		break;
> +	}

What's the rest of this function for if switch-case does not match?
Without hd2_enable_reg > 0 you might as well return immediately.

> +
> +	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
> +		snd_soc_component_update_bits(component, hd2_scale_reg,
> +				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_MASK,
> +				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P3125);
> +		snd_soc_component_update_bits(component, hd2_enable_reg,
> +				      WCD934X_CDC_RX_PATH_CFG_HD2_EN_MASK,
> +				      WCD934X_CDC_RX_PATH_CFG_HD2_ENABLE);
> +	}
> +
> +	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
> +		snd_soc_component_update_bits(component, hd2_enable_reg,
> +				      WCD934X_CDC_RX_PATH_CFG_HD2_EN_MASK,
> +				      WCD934X_CDC_RX_PATH_CFG_HD2_DISABLE);
> +		snd_soc_component_update_bits(component, hd2_scale_reg,
> +				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_MASK,
> +				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P0000);
> +	}
> +}
> +
> +static void wcd934x_codec_hphdelay_lutbypass(struct snd_soc_component *comp,
> +					     u16 interp_idx, int event)
> +{
> +	u8 hph_dly_mask;
> +	u16 hph_lut_bypass_reg = 0;
> +	u16 hph_comp_ctrl7 = 0;
> +
> +	switch (interp_idx) {
> +	case INTERP_HPHL:
> +		hph_dly_mask = 1;
> +		hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHL_COMP_LUT;
> +		hph_comp_ctrl7 = WCD934X_CDC_COMPANDER1_CTL7;
> +		break;
> +	case INTERP_HPHR:
> +		hph_dly_mask = 2;
> +		hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHR_COMP_LUT;
> +		hph_comp_ctrl7 = WCD934X_CDC_COMPANDER2_CTL7;
> +		break;
> +	default:
> +		break;
> +	}

'Default' made it here, what was not the case for most of other 
switch-case. Keep code consistent would be appreciated.
Moreover, in the following function "wcd934x_config_compander", you do 
decide to do all the processing directly within switch-case. I see no 
reason why you should not do that here too.

Again, once switch-case fails to find match, the rest of function does 
not do much, really.


> +
> +	if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_ON(event)) {
> +		snd_soc_component_update_bits(comp, WCD934X_CDC_CLSH_TEST0,
> +					      hph_dly_mask, 0x0);
> +		snd_soc_component_update_bits(comp, hph_lut_bypass_reg,
> +					      WCD934X_HPH_LUT_BYPASS_MASK,
> +					      WCD934X_HPH_LUT_BYPASS_ENABLE);
> +	}
> +
> +	if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
> +		snd_soc_component_update_bits(comp, WCD934X_CDC_CLSH_TEST0,
> +					      hph_dly_mask, hph_dly_mask);
> +		snd_soc_component_update_bits(comp, hph_lut_bypass_reg,
> +					      WCD934X_HPH_LUT_BYPASS_MASK,
> +					      WCD934X_HPH_LUT_BYPASS_DISABLE);
> +	}
> +}
> +
> +static int wcd934x_config_compander(struct snd_soc_component *comp,
> +				    int interp_n, int event)
> +{
> +	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
> +	int compander;
> +	u16 comp_ctl0_reg, rx_path_cfg0_reg;
> +
> +	/* EAR does not have compander */
> +	if (!interp_n)
> +		return 0;
> +
> +	compander = interp_n - 1;
> +	if (!wcd->comp_enabled[compander])
> +		return 0;
> +
> +	comp_ctl0_reg = WCD934X_CDC_COMPANDER1_CTL0 + (compander * 8);
> +	rx_path_cfg0_reg = WCD934X_CDC_RX1_RX_PATH_CFG0 + (compander * 20);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		/* Enable Compander Clock */
> +		snd_soc_component_update_bits(comp, comp_ctl0_reg,
> +					      WCD934X_COMP_CLK_EN_MASK,
> +					      WCD934X_COMP_CLK_ENABLE);
> +		snd_soc_component_update_bits(comp, comp_ctl0_reg,
> +					      WCD934X_COMP_SOFT_RST_MASK,
> +					      WCD934X_COMP_SOFT_RST_ENABLE);
> +		snd_soc_component_update_bits(comp, comp_ctl0_reg,
> +					      WCD934X_COMP_SOFT_RST_MASK,
> +					      WCD934X_COMP_SOFT_RST_DISABLE);
> +		snd_soc_component_update_bits(comp, rx_path_cfg0_reg,
> +					      WCD934X_HPH_CMP_EN_MASK,
> +					      WCD934X_HPH_CMP_ENABLE);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		snd_soc_component_update_bits(comp, rx_path_cfg0_reg,
> +					      WCD934X_HPH_CMP_EN_MASK,
> +					      WCD934X_HPH_CMP_DISABLE);
> +		snd_soc_component_update_bits(comp, comp_ctl0_reg,
> +					      WCD934X_COMP_HALT_MASK,
> +					      WCD934X_COMP_HALT);
> +		snd_soc_component_update_bits(comp, comp_ctl0_reg,
> +					      WCD934X_COMP_SOFT_RST_MASK,
> +					      WCD934X_COMP_SOFT_RST_ENABLE);
> +		snd_soc_component_update_bits(comp, comp_ctl0_reg,
> +					      WCD934X_COMP_SOFT_RST_MASK,
> +					      WCD934X_COMP_SOFT_RST_DISABLE);
> +		snd_soc_component_update_bits(comp, comp_ctl0_reg,
> +					      WCD934X_COMP_CLK_EN_MASK, 0x0);
> +		snd_soc_component_update_bits(comp, comp_ctl0_reg,
> +					      WCD934X_COMP_SOFT_RST_MASK, 0x0);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcd934x_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
> +					 struct snd_kcontrol *kc, int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +	int offset_val = 0;
> +	u16 gain_reg, mix_reg;
> +	int val = 0;
> +
> +	gain_reg = WCD934X_CDC_RX0_RX_VOL_MIX_CTL +
> +					(w->shift * WCD934X_RX_PATH_CTL_OFFSET);
> +	mix_reg = WCD934X_CDC_RX0_RX_PATH_MIX_CTL +
> +					(w->shift * WCD934X_RX_PATH_CTL_OFFSET);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		/* Clk enable */
> +		snd_soc_component_update_bits(comp, mix_reg,
> +					      WCD934X_CDC_RX_MIX_CLK_EN_MASK,
> +					      WCD934X_CDC_RX_MIX_CLK_ENABLE);
> +		break;
> +
> +	case SND_SOC_DAPM_POST_PMU:
> +		val = snd_soc_component_read32(comp, gain_reg);
> +		val += offset_val;
> +		snd_soc_component_write(comp, gain_reg, val);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		break;

Redundant case?.
> +	};
> +
> +	return 0;
> +}
> +
> +static int wcd934x_codec_set_iir_gain(struct snd_soc_dapm_widget *w,
> +				      struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +	int reg = w->reg;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		/* B1 GAIN */
> +		snd_soc_component_write(comp, reg,
> +					snd_soc_component_read32(comp, reg));
> +		/* B2 GAIN */
> +		reg++;
> +		snd_soc_component_write(comp, reg,
> +					snd_soc_component_read32(comp, reg));
> +		/* B3 GAIN */
> +		reg++;
> +		snd_soc_component_write(comp, reg,
> +					snd_soc_component_read32(comp, reg));
> +		/* B4 GAIN */
> +		reg++;
> +		snd_soc_component_write(comp, reg,
> +					snd_soc_component_read32(comp, reg));
> +		/* B5 GAIN */
> +		reg++;
> +		snd_soc_component_write(comp, reg,
> +					snd_soc_component_read32(comp, reg));
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;

Missing newline before return - based on format of your other functions.

> +}
> +
> +static int wcd934x_codec_enable_main_path(struct snd_soc_dapm_widget *w,
> +					  struct snd_kcontrol *kcontrol,
> +					int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +	u16 gain_reg;
> +	u32 val;
> +
> +	gain_reg = WCD934X_CDC_RX0_RX_VOL_CTL + (w->shift *
> +						 WCD934X_RX_PATH_CTL_OFFSET);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		val = snd_soc_component_read32(comp, gain_reg);
> +		snd_soc_component_write(comp, gain_reg, val);
> +		break;
> +	};

In the function above, "wcd934x_codec_set_iir_gain", you decided against 
declaring local 'val' for storing _read32, though here, only for a 
single use-case, you made a difference. Let's keep it consistent and run 
with one or the other.

Also, is there any value for assigning gain_reg outside of switch-case?

> +
> +	return 0;
> +}

> +static int wcd934x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
> +					struct snd_kcontrol *kcontrol,
> +					int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		break;

Redundant case.

> +	case SND_SOC_DAPM_POST_PMU:
> +		/*
> +		 * 7ms sleep is required after PA is enabled as per
> +		 * HW requirement. If compander is disabled, then
> +		 * 20ms delay is needed.
> +		 */
> +		usleep_range(20000, 20100);
> +
> +		snd_soc_component_update_bits(comp, WCD934X_HPH_L_TEST,
> +					      WCD934X_HPH_OCP_DET_MASK,
> +					      WCD934X_HPH_OCP_DET_ENABLE);
> +		/* Remove Mute on primary path */
> +		snd_soc_component_update_bits(comp, WCD934X_CDC_RX1_RX_PATH_CTL,
> +				      WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
> +				      0);
> +		/* Enable GM3 boost */
> +		snd_soc_component_update_bits(comp, WCD934X_HPH_CNP_WG_CTL,
> +					      WCD934X_HPH_GM3_BOOST_EN_MASK,
> +					      WCD934X_HPH_GM3_BOOST_ENABLE);
> +		/* Enable AutoChop timer at the end of power up */
> +		snd_soc_component_update_bits(comp,
> +				      WCD934X_HPH_NEW_INT_HPH_TIMER1,
> +				      WCD934X_HPH_AUTOCHOP_TIMER_EN_MASK,
> +				      WCD934X_HPH_AUTOCHOP_TIMER_ENABLE);
> +		/* Remove mix path mute */
> +		snd_soc_component_update_bits(comp,
> +				WCD934X_CDC_RX1_RX_PATH_MIX_CTL,
> +				WCD934X_CDC_RX_PGA_MUTE_EN_MASK, 0x00);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		/* Enable DSD Mute before PA disable */
> +
> +		snd_soc_component_update_bits(comp, WCD934X_HPH_L_TEST,
> +					      WCD934X_HPH_OCP_DET_MASK,
> +					      WCD934X_HPH_OCP_DET_DISABLE);
> +		snd_soc_component_update_bits(comp, WCD934X_CDC_RX1_RX_PATH_CTL,
> +					      WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
> +					      WCD934X_RX_PATH_PGA_MUTE_ENABLE);
> +		snd_soc_component_update_bits(comp,
> +					      WCD934X_CDC_RX1_RX_PATH_MIX_CTL,
> +					      WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
> +					      WCD934X_RX_PATH_PGA_MUTE_ENABLE);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		/*
> +		 * 5ms sleep is required after PA disable. If compander is
> +		 * disabled, then 20ms delay is needed after PA disable.
> +		 */
> +			usleep_range(20000, 20100);

Superfluous identation.

> +		break;
> +	};
> +
> +	return 0;
> +}
> +
> +static int wcd934x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
> +					struct snd_kcontrol *kcontrol,
> +					int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		break;

Redundant case.

> +	case SND_SOC_DAPM_POST_PMU:
> +		/*
> +		 * 7ms sleep is required after PA is enabled as per
> +		 * HW requirement. If compander is disabled, then
> +		 * 20ms delay is needed.
> +		 */
> +		usleep_range(20000, 20100);

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
