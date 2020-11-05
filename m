Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBC62A7D42
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 12:38:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BCB01666;
	Thu,  5 Nov 2020 12:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BCB01666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604576336;
	bh=0I5a2Miw+SU//jS0QpScJ9Rv0CMjKxFW9m6t9vfWK4o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jfweoRnk+2WDfQnC4dh9kRE1WUFoLpaSaQ8WVOllxT9SGBelennoqROYmZy1YRjUB
	 vRMmWJjLkBL4fCS5Yp0Ugo0cjhkCSoYI7hUH1F5IWW/ps8t+3WkeaYUw96ThdT+Y0o
	 XmSNa4Mgg33j6+ibu64cJuHUBasi54N3GGdy3wJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D8DF804FD;
	Thu,  5 Nov 2020 12:35:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E03FAF804EB; Thu,  5 Nov 2020 12:35:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AD29F804BB
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 12:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AD29F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G7lYqkdd"
Received: by mail-wr1-x434.google.com with SMTP id w1so1362886wrm.4
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 03:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2pDw2IHozMJ3cjqKdHcpxPQFbVsfhsEsGsdDrY1cPGc=;
 b=G7lYqkddpiuTllkvrgPdQEzyzzuEl/HaHj6aYI+xNPhLybl3VPxAjN485My/x9a5Kz
 kXhIAerPe3b7j+Xo/xKjYnEM50qeH/OW4ayToxGcQs+EkxNtU2OoUleFgDJtuaT6xdAL
 msPkwGWoksEfTKAppgPGcVwtpg7d5LsDflLQRmJllmnpplbKEztfE5HPHnnHLEcrkM+e
 KxinPVoiBgy0gGhEjcV8/jL74byxfYByhpdRsLCU/K+rrX5KFmFYKWw7MvLk+koL/YeU
 S5mKZqeBfkprcpFE29A9Twh7mwxxCgPwNl9gpXxrHXbAGPR0ss9IcbL7TeNP4ZDWXP9A
 KyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2pDw2IHozMJ3cjqKdHcpxPQFbVsfhsEsGsdDrY1cPGc=;
 b=QZSPaM2mZu37kaI9/kyziFYwXzZNvoJmEbyc3zRBN8GD78fcPG6z6HktxpHNeIuXWj
 k27jVCLJTkwZ+EIweJu+nR/Y+J+uvIdKucf4gy5k1A5V0uBTA+GZW4ELC6/OxhbX1R2y
 fWsaHVWfdOjmv8gCyLzdWZAoIKjMXmoDGaOtCG5mCjFgdQsGzT4Hjjw5wD6mfoDpYqMa
 IE5tkv22DnK+9VwyoRX6S3PxLqZ24Jq1mQdT8uWhhMymLfdylAlnd8IGGytkWNVJcehj
 Ch/m5OvZOtNKXzYujQhRkGlp+iBkxeWEvXsXi7eH3YMtO+WBKnzrHtfURPXp0DF8g4NI
 dvHg==
X-Gm-Message-State: AOAM5337nWdykYkMYRJoJCXe4R9vLCvTmjrp+a/6eT+byNjjgbSIDHrV
 Cq+a9NHJZbiqIMl+T9FfmOyryQ==
X-Google-Smtp-Source: ABdhPJyy88QThHtE4HTbfFCP/X/bTVOLbDCNWziF1qpWA77lgyDa4q0W4+406HZg7vWPOQ544afCeQ==
X-Received: by 2002:adf:f181:: with SMTP id h1mr2479118wro.374.1604576110581; 
 Thu, 05 Nov 2020 03:35:10 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t199sm2096129wmt.46.2020.11.05.03.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 03:35:09 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 6/6] ASoC: codecs: lpass-va-macro: add dapm widgets and
 routes
Date: Thu,  5 Nov 2020 11:34:58 +0000
Message-Id: <20201105113458.12360-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201105113458.12360-1-srinivas.kandagatla@linaro.org>
References: <20201105113458.12360-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Add dapm widgets and routes for this codec.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 620 ++++++++++++++++++++++++++++++
 1 file changed, 620 insertions(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index e7590e70f2c0..b604de07e650 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -27,6 +27,8 @@
 #define CDC_VA_TOP_CSR_DMIC1_CTL		(0x0088)
 #define CDC_VA_TOP_CSR_DMIC2_CTL		(0x008C)
 #define CDC_VA_TOP_CSR_DMIC3_CTL		(0x0090)
+#define CDC_VA_DMIC_EN_MASK			BIT(0)
+#define CDC_VA_DMIC_ENABLE			BIT(0)
 #define CDC_VA_DMIC_CLK_SEL_MASK		GENMASK(3, 1)
 #define CDC_VA_DMIC_CLK_SEL_SHFT		1
 #define CDC_VA_DMIC_CLK_SEL_DIV0		0x0
@@ -452,6 +454,327 @@ static int va_macro_mclk_enable(struct va_macro *va, bool mclk_enable)
 	return 0;
 }
 
+static int va_macro_mclk_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct va_macro *va = snd_soc_component_get_drvdata(comp);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return va_macro_mclk_enable(va, true);
+	case SND_SOC_DAPM_POST_PMD:
+		return va_macro_mclk_enable(va, false);
+	}
+
+	return 0;
+}
+
+static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget =
+		snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(widget->dapm);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int val;
+	u16 mic_sel_reg;
+
+	val = ucontrol->value.enumerated.item[0];
+
+	switch (e->reg) {
+	case CDC_VA_INP_MUX_ADC_MUX0_CFG0:
+		mic_sel_reg = CDC_VA_TX0_TX_PATH_CFG0;
+		break;
+	case CDC_VA_INP_MUX_ADC_MUX1_CFG0:
+		mic_sel_reg = CDC_VA_TX1_TX_PATH_CFG0;
+		break;
+	case CDC_VA_INP_MUX_ADC_MUX2_CFG0:
+		mic_sel_reg = CDC_VA_TX2_TX_PATH_CFG0;
+		break;
+	case CDC_VA_INP_MUX_ADC_MUX3_CFG0:
+		mic_sel_reg = CDC_VA_TX3_TX_PATH_CFG0;
+		break;
+	default:
+		dev_err(component->dev, "%s: e->reg: 0x%x not expected\n",
+			__func__, e->reg);
+		return -EINVAL;
+	}
+
+	if (val != 0)
+		snd_soc_component_update_bits(component, mic_sel_reg,
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
+					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
+
+	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+}
+
+static int va_macro_tx_mixer_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget =
+		snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component =
+				snd_soc_dapm_to_component(widget->dapm);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	u32 dai_id = widget->shift;
+	u32 dec_id = mc->shift;
+	struct va_macro *va = snd_soc_component_get_drvdata(component);
+
+	if (test_bit(dec_id, &va->active_ch_mask[dai_id]))
+		ucontrol->value.integer.value[0] = 1;
+	else
+		ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int va_macro_tx_mixer_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget =
+					snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component =
+				snd_soc_dapm_to_component(widget->dapm);
+	struct snd_soc_dapm_update *update = NULL;
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	u32 dai_id = widget->shift;
+	u32 dec_id = mc->shift;
+	u32 enable = ucontrol->value.integer.value[0];
+	struct va_macro *va = snd_soc_component_get_drvdata(component);
+
+	if (enable) {
+		set_bit(dec_id, &va->active_ch_mask[dai_id]);
+		va->active_ch_cnt[dai_id]++;
+		va->active_decimator[dai_id] = dec_id;
+	} else {
+		clear_bit(dec_id, &va->active_ch_mask[dai_id]);
+		va->active_ch_cnt[dai_id]--;
+		va->active_decimator[dai_id] = -1;
+	}
+
+	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, update);
+
+	return 0;
+}
+
+static int va_dmic_clk_enable(struct snd_soc_component *component,
+			      u32 dmic, bool enable)
+{
+	struct va_macro *va = snd_soc_component_get_drvdata(component);
+	u16 dmic_clk_reg;
+	s32 *dmic_clk_cnt;
+	u8 *dmic_clk_div;
+	u8 freq_change_mask;
+	u8 clk_div;
+
+	switch (dmic) {
+	case 0:
+	case 1:
+		dmic_clk_cnt = &(va->dmic_0_1_clk_cnt);
+		dmic_clk_div = &(va->dmic_0_1_clk_div);
+		dmic_clk_reg = CDC_VA_TOP_CSR_DMIC0_CTL;
+		freq_change_mask = CDC_VA_DMIC0_FREQ_CHANGE_MASK;
+		break;
+	case 2:
+	case 3:
+		dmic_clk_cnt = &(va->dmic_2_3_clk_cnt);
+		dmic_clk_div = &(va->dmic_2_3_clk_div);
+		dmic_clk_reg = CDC_VA_TOP_CSR_DMIC1_CTL;
+		freq_change_mask = CDC_VA_DMIC1_FREQ_CHANGE_MASK;
+		break;
+	case 4:
+	case 5:
+		dmic_clk_cnt = &(va->dmic_4_5_clk_cnt);
+		dmic_clk_div = &(va->dmic_4_5_clk_div);
+		dmic_clk_reg = CDC_VA_TOP_CSR_DMIC2_CTL;
+		freq_change_mask = CDC_VA_DMIC2_FREQ_CHANGE_MASK;
+		break;
+	case 6:
+	case 7:
+		dmic_clk_cnt = &(va->dmic_6_7_clk_cnt);
+		dmic_clk_div = &(va->dmic_6_7_clk_div);
+		dmic_clk_reg = CDC_VA_TOP_CSR_DMIC3_CTL;
+		freq_change_mask = CDC_VA_DMIC3_FREQ_CHANGE_MASK;
+		break;
+	default:
+		dev_err(component->dev, "%s: Invalid DMIC Selection\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	if (enable) {
+		clk_div = va->dmic_clk_div;
+		(*dmic_clk_cnt)++;
+		if (*dmic_clk_cnt == 1) {
+			snd_soc_component_update_bits(component,
+					      CDC_VA_TOP_CSR_DMIC_CFG,
+					      CDC_VA_RESET_ALL_DMICS_MASK,
+					      CDC_VA_RESET_ALL_DMICS_DISABLE);
+			snd_soc_component_update_bits(component, dmic_clk_reg,
+					CDC_VA_DMIC_CLK_SEL_MASK,
+					clk_div << CDC_VA_DMIC_CLK_SEL_SHFT);
+			snd_soc_component_update_bits(component, dmic_clk_reg,
+						      CDC_VA_DMIC_EN_MASK,
+						      CDC_VA_DMIC_ENABLE);
+		} else {
+			if (*dmic_clk_div > clk_div) {
+				snd_soc_component_update_bits(component,
+						CDC_VA_TOP_CSR_DMIC_CFG,
+						freq_change_mask,
+						freq_change_mask);
+				snd_soc_component_update_bits(component, dmic_clk_reg,
+						CDC_VA_DMIC_CLK_SEL_MASK,
+						clk_div << CDC_VA_DMIC_CLK_SEL_SHFT);
+				snd_soc_component_update_bits(component,
+					      CDC_VA_TOP_CSR_DMIC_CFG,
+					      freq_change_mask,
+					      CDC_VA_DMIC_FREQ_CHANGE_DISABLE);
+			} else {
+				clk_div = *dmic_clk_div;
+			}
+		}
+		*dmic_clk_div = clk_div;
+	} else {
+		(*dmic_clk_cnt)--;
+		if (*dmic_clk_cnt  == 0) {
+			snd_soc_component_update_bits(component, dmic_clk_reg,
+						      CDC_VA_DMIC_EN_MASK, 0);
+			clk_div = 0;
+			snd_soc_component_update_bits(component, dmic_clk_reg,
+						CDC_VA_DMIC_CLK_SEL_MASK,
+						clk_div << CDC_VA_DMIC_CLK_SEL_SHFT);
+		} else {
+			clk_div = va->dmic_clk_div;
+			if (*dmic_clk_div > clk_div) {
+				clk_div = va->dmic_clk_div;
+				snd_soc_component_update_bits(component,
+							CDC_VA_TOP_CSR_DMIC_CFG,
+							freq_change_mask,
+							freq_change_mask);
+				snd_soc_component_update_bits(component, dmic_clk_reg,
+						CDC_VA_DMIC_CLK_SEL_MASK,
+						clk_div << CDC_VA_DMIC_CLK_SEL_SHFT);
+				snd_soc_component_update_bits(component,
+						      CDC_VA_TOP_CSR_DMIC_CFG,
+						      freq_change_mask,
+						      CDC_VA_DMIC_FREQ_CHANGE_DISABLE);
+			} else {
+				clk_div = *dmic_clk_div;
+			}
+		}
+		*dmic_clk_div = clk_div;
+	}
+
+	return 0;
+}
+
+static int va_macro_enable_dmic(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	unsigned int dmic = w->shift;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		va_dmic_clk_enable(comp, dmic, true);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		va_dmic_clk_enable(comp, dmic, false);
+		break;
+	}
+
+	return 0;
+}
+
+static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	unsigned int decimator;
+	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg;
+	u16 tx_gain_ctl_reg;
+	u8 hpf_cut_off_freq;
+
+	struct va_macro *va = snd_soc_component_get_drvdata(comp);
+
+	decimator = w->shift;
+
+	tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
+				VA_MACRO_TX_PATH_OFFSET * decimator;
+	hpf_gate_reg = CDC_VA_TX0_TX_PATH_SEC2 +
+				VA_MACRO_TX_PATH_OFFSET * decimator;
+	dec_cfg_reg = CDC_VA_TX0_TX_PATH_CFG0 +
+				VA_MACRO_TX_PATH_OFFSET * decimator;
+	tx_gain_ctl_reg = CDC_VA_TX0_TX_VOL_CTL +
+				VA_MACRO_TX_PATH_OFFSET * decimator;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(comp,
+			dec_cfg_reg, CDC_VA_ADC_MODE_MASK,
+			va->dec_mode[decimator] << CDC_VA_ADC_MODE_SHIFT);
+		/* Enable TX PGA Mute */
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* Enable TX CLK */
+		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
+					      CDC_VA_TX_PATH_CLK_EN_MASK,
+					      CDC_VA_TX_PATH_CLK_EN);
+		snd_soc_component_update_bits(comp, hpf_gate_reg,
+					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
+					      CDC_VA_TX_HPF_ZERO_GATE);
+
+		usleep_range(1000, 1010);
+		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
+				    TX_HPF_CUT_OFF_FREQ_MASK) >> 5;
+
+		if (hpf_cut_off_freq != CF_MIN_3DB_150HZ) {
+			snd_soc_component_update_bits(comp, dec_cfg_reg,
+						      TX_HPF_CUT_OFF_FREQ_MASK,
+						      CF_MIN_3DB_150HZ << 5);
+
+			snd_soc_component_update_bits(comp, hpf_gate_reg,
+				      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
+				      CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_REQ);
+
+			/*
+			 * Minimum 1 clk cycle delay is required as per HW spec
+			 */
+			usleep_range(1000, 1010);
+
+			snd_soc_component_update_bits(comp,
+				hpf_gate_reg,
+				CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK,
+				0x0);
+		}
+
+
+		usleep_range(1000, 1010);
+		snd_soc_component_update_bits(comp, hpf_gate_reg,
+					      CDC_VA_TX_HPF_ZERO_GATE_MASK,
+					      CDC_VA_TX_HPF_ZERO_NO_GATE);
+		/*
+		 * 6ms delay is required as per HW spec
+		 */
+		usleep_range(6000, 6010);
+		/* apply gain after decimator is enabled */
+		snd_soc_component_write(comp, tx_gain_ctl_reg,
+			snd_soc_component_read(comp, tx_gain_ctl_reg));
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Disable TX CLK */
+		snd_soc_component_update_bits(comp, tx_vol_ctl_reg,
+						CDC_VA_TX_PATH_CLK_EN_MASK,
+						CDC_VA_TX_PATH_CLK_DISABLE);
+		break;
+	}
+	return 0;
+}
+
 static int va_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
@@ -631,6 +954,299 @@ static struct snd_soc_dai_driver va_macro_dais[] = {
 	},
 };
 
+static const char * const adc_mux_text[] = {
+	"VA_DMIC", "SWR_MIC"
+};
+
+static SOC_ENUM_SINGLE_DECL(va_dec0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(va_dec1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(va_dec2_enum, CDC_VA_INP_MUX_ADC_MUX2_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(va_dec3_enum, CDC_VA_INP_MUX_ADC_MUX3_CFG1,
+		   0, adc_mux_text);
+
+static const struct snd_kcontrol_new va_dec0_mux = SOC_DAPM_ENUM("va_dec0",
+								 va_dec0_enum);
+static const struct snd_kcontrol_new va_dec1_mux = SOC_DAPM_ENUM("va_dec1",
+								 va_dec1_enum);
+static const struct snd_kcontrol_new va_dec2_mux = SOC_DAPM_ENUM("va_dec2",
+								 va_dec2_enum);
+static const struct snd_kcontrol_new va_dec3_mux = SOC_DAPM_ENUM("va_dec3",
+								 va_dec3_enum);
+
+static const char * const dmic_mux_text[] = {
+	"ZERO", "DMIC0", "DMIC1", "DMIC2", "DMIC3",
+	"DMIC4", "DMIC5", "DMIC6", "DMIC7"
+};
+
+static SOC_ENUM_SINGLE_DECL(va_dmic0_enum, CDC_VA_INP_MUX_ADC_MUX0_CFG0,
+			4, dmic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_dmic1_enum, CDC_VA_INP_MUX_ADC_MUX1_CFG0,
+			4, dmic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_dmic2_enum, CDC_VA_INP_MUX_ADC_MUX2_CFG0,
+			4, dmic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(va_dmic3_enum, CDC_VA_INP_MUX_ADC_MUX3_CFG0,
+			4, dmic_mux_text);
+
+static const struct snd_kcontrol_new va_dmic0_mux = SOC_DAPM_ENUM_EXT("va_dmic0",
+			 va_dmic0_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_dmic1_mux = SOC_DAPM_ENUM_EXT("va_dmic1",
+			 va_dmic1_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_dmic2_mux = SOC_DAPM_ENUM_EXT("va_dmic2",
+			 va_dmic2_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_dmic3_mux = SOC_DAPM_ENUM_EXT("va_dmic3",
+			 va_dmic3_enum, snd_soc_dapm_get_enum_double,
+			 va_macro_put_dec_enum);
+
+static const struct snd_kcontrol_new va_aif1_cap_mixer[] = {
+	SOC_SINGLE_EXT("DEC0", SND_SOC_NOPM, VA_MACRO_DEC0, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC1", SND_SOC_NOPM, VA_MACRO_DEC1, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC2", SND_SOC_NOPM, VA_MACRO_DEC2, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC3", SND_SOC_NOPM, VA_MACRO_DEC3, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC4", SND_SOC_NOPM, VA_MACRO_DEC4, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC5", SND_SOC_NOPM, VA_MACRO_DEC5, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC6", SND_SOC_NOPM, VA_MACRO_DEC6, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC7", SND_SOC_NOPM, VA_MACRO_DEC7, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+};
+
+static const struct snd_kcontrol_new va_aif2_cap_mixer[] = {
+	SOC_SINGLE_EXT("DEC0", SND_SOC_NOPM, VA_MACRO_DEC0, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC1", SND_SOC_NOPM, VA_MACRO_DEC1, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC2", SND_SOC_NOPM, VA_MACRO_DEC2, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC3", SND_SOC_NOPM, VA_MACRO_DEC3, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC4", SND_SOC_NOPM, VA_MACRO_DEC4, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC5", SND_SOC_NOPM, VA_MACRO_DEC5, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC6", SND_SOC_NOPM, VA_MACRO_DEC6, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC7", SND_SOC_NOPM, VA_MACRO_DEC7, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+};
+
+static const struct snd_kcontrol_new va_aif3_cap_mixer[] = {
+	SOC_SINGLE_EXT("DEC0", SND_SOC_NOPM, VA_MACRO_DEC0, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC1", SND_SOC_NOPM, VA_MACRO_DEC1, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC2", SND_SOC_NOPM, VA_MACRO_DEC2, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC3", SND_SOC_NOPM, VA_MACRO_DEC3, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC4", SND_SOC_NOPM, VA_MACRO_DEC4, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC5", SND_SOC_NOPM, VA_MACRO_DEC5, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC6", SND_SOC_NOPM, VA_MACRO_DEC6, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC7", SND_SOC_NOPM, VA_MACRO_DEC7, 1, 0,
+			va_macro_tx_mixer_get, va_macro_tx_mixer_put),
+};
+
+static const struct snd_soc_dapm_widget va_macro_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_OUT("VA_AIF1 CAP", "VA_AIF1 Capture", 0,
+		SND_SOC_NOPM, VA_MACRO_AIF1_CAP, 0),
+
+	SND_SOC_DAPM_AIF_OUT("VA_AIF2 CAP", "VA_AIF2 Capture", 0,
+		SND_SOC_NOPM, VA_MACRO_AIF2_CAP, 0),
+
+	SND_SOC_DAPM_AIF_OUT("VA_AIF3 CAP", "VA_AIF3 Capture", 0,
+		SND_SOC_NOPM, VA_MACRO_AIF3_CAP, 0),
+
+	SND_SOC_DAPM_MIXER("VA_AIF1_CAP Mixer", SND_SOC_NOPM,
+		VA_MACRO_AIF1_CAP, 0,
+		va_aif1_cap_mixer, ARRAY_SIZE(va_aif1_cap_mixer)),
+
+	SND_SOC_DAPM_MIXER("VA_AIF2_CAP Mixer", SND_SOC_NOPM,
+		VA_MACRO_AIF2_CAP, 0,
+		va_aif2_cap_mixer, ARRAY_SIZE(va_aif2_cap_mixer)),
+
+	SND_SOC_DAPM_MIXER("VA_AIF3_CAP Mixer", SND_SOC_NOPM,
+		VA_MACRO_AIF3_CAP, 0,
+		va_aif3_cap_mixer, ARRAY_SIZE(va_aif3_cap_mixer)),
+
+	SND_SOC_DAPM_MUX("VA DMIC MUX0", SND_SOC_NOPM, 0, 0, &va_dmic0_mux),
+	SND_SOC_DAPM_MUX("VA DMIC MUX1", SND_SOC_NOPM, 0, 0, &va_dmic1_mux),
+	SND_SOC_DAPM_MUX("VA DMIC MUX2", SND_SOC_NOPM, 0, 0, &va_dmic2_mux),
+	SND_SOC_DAPM_MUX("VA DMIC MUX3", SND_SOC_NOPM, 0, 0, &va_dmic3_mux),
+
+	SND_SOC_DAPM_REGULATOR_SUPPLY("vdd-micb", 0, 0),
+	SND_SOC_DAPM_INPUT("DMIC0 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC1 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC2 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC3 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC4 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC5 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC6 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC7 Pin"),
+
+	SND_SOC_DAPM_ADC_E("VA DMIC0", NULL, SND_SOC_NOPM, 0, 0,
+		va_macro_enable_dmic, SND_SOC_DAPM_PRE_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_ADC_E("VA DMIC1", NULL, SND_SOC_NOPM, 1, 0,
+		va_macro_enable_dmic, SND_SOC_DAPM_PRE_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_ADC_E("VA DMIC2", NULL, SND_SOC_NOPM, 2, 0,
+		va_macro_enable_dmic, SND_SOC_DAPM_PRE_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_ADC_E("VA DMIC3", NULL, SND_SOC_NOPM, 3, 0,
+		va_macro_enable_dmic, SND_SOC_DAPM_PRE_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_ADC_E("VA DMIC4", NULL, SND_SOC_NOPM, 4, 0,
+		va_macro_enable_dmic, SND_SOC_DAPM_PRE_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_ADC_E("VA DMIC5", NULL, SND_SOC_NOPM, 5, 0,
+		va_macro_enable_dmic, SND_SOC_DAPM_PRE_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_ADC_E("VA DMIC6", NULL, SND_SOC_NOPM, 6, 0,
+		va_macro_enable_dmic, SND_SOC_DAPM_PRE_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_ADC_E("VA DMIC7", NULL, SND_SOC_NOPM, 7, 0,
+		va_macro_enable_dmic, SND_SOC_DAPM_PRE_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_INPUT("VA SWR_ADC0"),
+	SND_SOC_DAPM_INPUT("VA SWR_ADC1"),
+	SND_SOC_DAPM_INPUT("VA SWR_ADC2"),
+	SND_SOC_DAPM_INPUT("VA SWR_ADC3"),
+	SND_SOC_DAPM_INPUT("VA SWR_MIC0"),
+	SND_SOC_DAPM_INPUT("VA SWR_MIC1"),
+	SND_SOC_DAPM_INPUT("VA SWR_MIC2"),
+	SND_SOC_DAPM_INPUT("VA SWR_MIC3"),
+	SND_SOC_DAPM_INPUT("VA SWR_MIC4"),
+	SND_SOC_DAPM_INPUT("VA SWR_MIC5"),
+	SND_SOC_DAPM_INPUT("VA SWR_MIC6"),
+	SND_SOC_DAPM_INPUT("VA SWR_MIC7"),
+
+	SND_SOC_DAPM_MUX_E("VA DEC0 MUX", SND_SOC_NOPM, VA_MACRO_DEC0, 0,
+			   &va_dec0_mux, va_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("VA DEC1 MUX", SND_SOC_NOPM, VA_MACRO_DEC1, 0,
+			   &va_dec1_mux, va_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("VA DEC2 MUX", SND_SOC_NOPM, VA_MACRO_DEC2, 0,
+			   &va_dec2_mux, va_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("VA DEC3 MUX", SND_SOC_NOPM, VA_MACRO_DEC3, 0,
+			   &va_dec3_mux, va_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("VA_MCLK", -1, SND_SOC_NOPM, 0, 0,
+			      va_macro_mclk_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route va_audio_map[] = {
+	{"VA_AIF1 CAP", NULL, "VA_MCLK"},
+	{"VA_AIF2 CAP", NULL, "VA_MCLK"},
+	{"VA_AIF3 CAP", NULL, "VA_MCLK"},
+
+	{"VA_AIF1 CAP", NULL, "VA_AIF1_CAP Mixer"},
+	{"VA_AIF2 CAP", NULL, "VA_AIF2_CAP Mixer"},
+	{"VA_AIF3 CAP", NULL, "VA_AIF3_CAP Mixer"},
+
+	{"VA_AIF1_CAP Mixer", "DEC0", "VA DEC0 MUX"},
+	{"VA_AIF1_CAP Mixer", "DEC1", "VA DEC1 MUX"},
+	{"VA_AIF1_CAP Mixer", "DEC2", "VA DEC2 MUX"},
+	{"VA_AIF1_CAP Mixer", "DEC3", "VA DEC3 MUX"},
+
+	{"VA_AIF2_CAP Mixer", "DEC0", "VA DEC0 MUX"},
+	{"VA_AIF2_CAP Mixer", "DEC1", "VA DEC1 MUX"},
+	{"VA_AIF2_CAP Mixer", "DEC2", "VA DEC2 MUX"},
+	{"VA_AIF2_CAP Mixer", "DEC3", "VA DEC3 MUX"},
+
+	{"VA_AIF3_CAP Mixer", "DEC0", "VA DEC0 MUX"},
+	{"VA_AIF3_CAP Mixer", "DEC1", "VA DEC1 MUX"},
+	{"VA_AIF3_CAP Mixer", "DEC2", "VA DEC2 MUX"},
+	{"VA_AIF3_CAP Mixer", "DEC3", "VA DEC3 MUX"},
+
+	{"VA DEC0 MUX", "VA_DMIC", "VA DMIC MUX0"},
+	{"VA DMIC MUX0", "DMIC0", "VA DMIC0"},
+	{"VA DMIC MUX0", "DMIC1", "VA DMIC1"},
+	{"VA DMIC MUX0", "DMIC2", "VA DMIC2"},
+	{"VA DMIC MUX0", "DMIC3", "VA DMIC3"},
+	{"VA DMIC MUX0", "DMIC4", "VA DMIC4"},
+	{"VA DMIC MUX0", "DMIC5", "VA DMIC5"},
+	{"VA DMIC MUX0", "DMIC6", "VA DMIC6"},
+	{"VA DMIC MUX0", "DMIC7", "VA DMIC7"},
+
+	{"VA DEC1 MUX", "VA_DMIC", "VA DMIC MUX1"},
+	{"VA DMIC MUX1", "DMIC0", "VA DMIC0"},
+	{"VA DMIC MUX1", "DMIC1", "VA DMIC1"},
+	{"VA DMIC MUX1", "DMIC2", "VA DMIC2"},
+	{"VA DMIC MUX1", "DMIC3", "VA DMIC3"},
+	{"VA DMIC MUX1", "DMIC4", "VA DMIC4"},
+	{"VA DMIC MUX1", "DMIC5", "VA DMIC5"},
+	{"VA DMIC MUX1", "DMIC6", "VA DMIC6"},
+	{"VA DMIC MUX1", "DMIC7", "VA DMIC7"},
+
+	{"VA DEC2 MUX", "VA_DMIC", "VA DMIC MUX2"},
+	{"VA DMIC MUX2", "DMIC0", "VA DMIC0"},
+	{"VA DMIC MUX2", "DMIC1", "VA DMIC1"},
+	{"VA DMIC MUX2", "DMIC2", "VA DMIC2"},
+	{"VA DMIC MUX2", "DMIC3", "VA DMIC3"},
+	{"VA DMIC MUX2", "DMIC4", "VA DMIC4"},
+	{"VA DMIC MUX2", "DMIC5", "VA DMIC5"},
+	{"VA DMIC MUX2", "DMIC6", "VA DMIC6"},
+	{"VA DMIC MUX2", "DMIC7", "VA DMIC7"},
+
+	{"VA DEC3 MUX", "VA_DMIC", "VA DMIC MUX3"},
+	{"VA DMIC MUX3", "DMIC0", "VA DMIC0"},
+	{"VA DMIC MUX3", "DMIC1", "VA DMIC1"},
+	{"VA DMIC MUX3", "DMIC2", "VA DMIC2"},
+	{"VA DMIC MUX3", "DMIC3", "VA DMIC3"},
+	{"VA DMIC MUX3", "DMIC4", "VA DMIC4"},
+	{"VA DMIC MUX3", "DMIC5", "VA DMIC5"},
+	{"VA DMIC MUX3", "DMIC6", "VA DMIC6"},
+	{"VA DMIC MUX3", "DMIC7", "VA DMIC7"},
+
+	{ "VA DMIC0", NULL, "DMIC0 Pin" },
+	{ "VA DMIC1", NULL, "DMIC1 Pin" },
+	{ "VA DMIC2", NULL, "DMIC2 Pin" },
+	{ "VA DMIC3", NULL, "DMIC3 Pin" },
+	{ "VA DMIC4", NULL, "DMIC4 Pin" },
+	{ "VA DMIC5", NULL, "DMIC5 Pin" },
+	{ "VA DMIC6", NULL, "DMIC6 Pin" },
+	{ "VA DMIC7", NULL, "DMIC7 Pin" },
+};
+
 static const char * const dec_mode_mux_text[] = {
 	"ADC_DEFAULT", "ADC_LOW_PWR", "ADC_HIGH_PERF",
 };
@@ -680,6 +1296,10 @@ static const struct snd_soc_component_driver va_macro_component_drv = {
 	.probe = va_macro_component_probe,
 	.controls = va_macro_snd_controls,
 	.num_controls = ARRAY_SIZE(va_macro_snd_controls),
+	.dapm_widgets = va_macro_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(va_macro_dapm_widgets),
+	.dapm_routes = va_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(va_audio_map),
 };
 
 static int fsgen_gate_enable(struct clk_hw *hw)
-- 
2.21.0

