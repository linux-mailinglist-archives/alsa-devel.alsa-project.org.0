Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB54313C49
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:06:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D44351697;
	Mon,  8 Feb 2021 19:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D44351697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612807562;
	bh=GBK2hYSr7+lsB9kmgKZH5l9bHpjm5ik97p8FfGn+1pc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9Pyg6qe5xo8hPoflj/sNKBmLaCqaHN/D2LBGMnGffYrOIrxEyelB8u4Ux4ifPR11
	 rIAoMhaCARUzcETwlvr77EY1mjtekdsl1H7phaynAowumlguAzXAhhT6XaVYpr+YRF
	 2fW6o/1zTR89hONDPnAjaNxMo35vGsnwX8cxOZMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F59EF804DA;
	Mon,  8 Feb 2021 19:02:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FE6CF80424; Mon,  8 Feb 2021 19:02:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F199F802CA
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F199F802CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hXMmEOd+"
Received: by mail-wr1-x42b.google.com with SMTP id l12so18347206wry.2
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 10:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pXIYNOrwcNo4TizPjBV+Va5A11z8QcM6+kVDjCSBGFw=;
 b=hXMmEOd+fZX9bmgRsevRNDRtrnxPp2MUojB3CnYsmZZ+EfK5XcQyn6sPwgvgoNILTc
 jo+X5jRGT5Y1++WY9YeYS4RToLD3haFV4wleJKfBQULWMFGr6OmeqtryHwcFfSsXCqO9
 tr293VccqkXutklcAVJSp2w1sHNS758A8CrsWCXuiT8KgIFdgFeOy7r2HUQmg5TwiRE8
 XuZTneRFNZMJTPRcNVYa6xCn++tYZFvveL5BmGhtSFhsLO5DK/GOUvkTYD8DX1NLkgYT
 PazoaQsoeqtfa59NjfNEwRykxafqbX3dcQ2F9dcNaYvfuLtSKyWmsdLOKV2W5yrRO7ef
 k4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pXIYNOrwcNo4TizPjBV+Va5A11z8QcM6+kVDjCSBGFw=;
 b=uZSXYyAOoKYFEGeAdXhzcPnNWC0zbC60HOrY0+e95fKc/c7d76SWv5Gd4NUjWseUkg
 2TH9L08mjWTTakoz/Uk/XG3R07zbhjtQEMKqCqsNJ8lqftRkib9NU4XbFp3S2C4cdNeL
 DWokmSelzUxrGRDKtLM/f3t64MhqhzNDjcojNwc+ulISx4eYuQedZn4HkumictsnYcpW
 hv5JC7KxaSFavLhjR1WIg9j2DxSQnewYROj+TWCw2PPjYAq2+NHgLeM+D3H+jcWGVm4q
 bJcmFKdcxe6j9H7BZc+CWUsdYgIR2Ei5gDK6fgVvwQv5F3HJN5wyMCEWOwT8lRJxx67i
 k8rA==
X-Gm-Message-State: AOAM532FiL+MYTSv1kojgHFGyj+ts7tINg+e74k6K8z1k2+sac3KSLKM
 KOfDpA0TNoi7MamJcJGjWOunfw==
X-Google-Smtp-Source: ABdhPJxrKkXNYcDnEP4GkpmOLtAfFRGGT22WisBDMcd8pCmlVjtoSK8sFqp8fEUfC5qlyaCHS4+JcA==
X-Received: by 2002:a05:6000:1542:: with SMTP id
 2mr21220384wry.356.1612807325840; 
 Mon, 08 Feb 2021 10:02:05 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l2sm21194937wmq.17.2021.02.08.10.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:02:04 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 7/7] ASoC: codecs: lpass-tx-macro: add dapm widgets and
 route
Date: Mon,  8 Feb 2021 18:01:09 +0000
Message-Id: <20210208180109.518-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210208180109.518-1-srinivas.kandagatla@linaro.org>
References: <20210208180109.518-1-srinivas.kandagatla@linaro.org>
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

This patch adds dapm widgets and routes on this codec

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 685 ++++++++++++++++++++++++++++++
 1 file changed, 685 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 5c3d654ea9c8..f3b0ead4ba31 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -712,6 +712,289 @@ static void tx_macro_mute_update_callback(struct work_struct *work)
 				      CDC_TXn_PGA_MUTE_MASK, 0x0);
 }
 
+static int tx_macro_mclk_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		tx_macro_mclk_enable(tx, true);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		tx_macro_mclk_enable(tx, false);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int val, dmic;
+	u16 mic_sel_reg;
+	u16 dmic_clk_reg;
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+
+	val = ucontrol->value.enumerated.item[0];
+
+	switch (e->reg) {
+	case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
+		mic_sel_reg = CDC_TX0_TX_PATH_CFG0;
+		break;
+	case CDC_TX_INP_MUX_ADC_MUX1_CFG0:
+		mic_sel_reg = CDC_TX1_TX_PATH_CFG0;
+		break;
+	case CDC_TX_INP_MUX_ADC_MUX2_CFG0:
+		mic_sel_reg = CDC_TX2_TX_PATH_CFG0;
+		break;
+	case CDC_TX_INP_MUX_ADC_MUX3_CFG0:
+		mic_sel_reg = CDC_TX3_TX_PATH_CFG0;
+		break;
+	case CDC_TX_INP_MUX_ADC_MUX4_CFG0:
+		mic_sel_reg = CDC_TX4_TX_PATH_CFG0;
+		break;
+	case CDC_TX_INP_MUX_ADC_MUX5_CFG0:
+		mic_sel_reg = CDC_TX5_TX_PATH_CFG0;
+		break;
+	case CDC_TX_INP_MUX_ADC_MUX6_CFG0:
+		mic_sel_reg = CDC_TX6_TX_PATH_CFG0;
+		break;
+	case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
+		mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
+		break;
+	}
+
+	if (val != 0) {
+		if (val < 5) {
+			snd_soc_component_write_field(component, mic_sel_reg,
+						      CDC_TXn_ADC_DMIC_SEL_MASK, 0);
+		} else {
+			snd_soc_component_write_field(component, mic_sel_reg,
+						      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
+			dmic = TX_ADC_TO_DMIC(val);
+			dmic_clk_reg = CDC_TX_TOP_CSR_SWR_DMICn_CTL(dmic);
+			snd_soc_component_write_field(component, dmic_clk_reg,
+						CDC_TX_SWR_DMIC_CLK_SEL_MASK,
+						tx->dmic_clk_div);
+		}
+	}
+
+	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+}
+
+static int tx_macro_tx_mixer_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	u32 dai_id = widget->shift;
+	u32 dec_id = mc->shift;
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+
+	if (test_bit(dec_id, &tx->active_ch_mask[dai_id]))
+		ucontrol->value.integer.value[0] = 1;
+	else
+		ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int tx_macro_tx_mixer_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct snd_soc_dapm_update *update = NULL;
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	u32 dai_id = widget->shift;
+	u32 dec_id = mc->shift;
+	u32 enable = ucontrol->value.integer.value[0];
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+
+	if (enable) {
+		set_bit(dec_id, &tx->active_ch_mask[dai_id]);
+		tx->active_ch_cnt[dai_id]++;
+		tx->active_decimator[dai_id] = dec_id;
+	} else {
+		tx->active_ch_cnt[dai_id]--;
+		clear_bit(dec_id, &tx->active_ch_mask[dai_id]);
+		tx->active_decimator[dai_id] = -1;
+	}
+	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, update);
+
+	return 0;
+}
+
+static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	unsigned int decimator;
+	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg, tx_gain_ctl_reg;
+	u8 hpf_cut_off_freq;
+	int hpf_delay = TX_MACRO_DMIC_HPF_DELAY_MS;
+	int unmute_delay = TX_MACRO_DMIC_UNMUTE_DELAY_MS;
+	u16 adc_mux_reg, adc_reg, adc_n, dmic;
+	u16 dmic_clk_reg;
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+
+	decimator = w->shift;
+	tx_vol_ctl_reg = CDC_TXn_TX_PATH_CTL(decimator);
+	hpf_gate_reg = CDC_TXn_TX_PATH_SEC2(decimator);
+	dec_cfg_reg = CDC_TXn_TX_PATH_CFG0(decimator);
+	tx_gain_ctl_reg = CDC_TXn_TX_VOL_CTL(decimator);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		adc_mux_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG1(decimator);
+		if (snd_soc_component_read(component, adc_mux_reg) & SWR_MIC) {
+			adc_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG0(decimator);
+			adc_n = snd_soc_component_read(component, adc_reg) &
+				CDC_TX_MACRO_SWR_MIC_MUX_SEL_MASK;
+			if (adc_n >= TX_ADC_MAX) {
+				dmic = TX_ADC_TO_DMIC(adc_n);
+				dmic_clk_reg = CDC_TX_TOP_CSR_SWR_DMICn_CTL(dmic);
+
+				snd_soc_component_write_field(component, dmic_clk_reg,
+							CDC_TX_SWR_DMIC_CLK_SEL_MASK,
+							tx->dmic_clk_div);
+			}
+		}
+		snd_soc_component_write_field(component, dec_cfg_reg,
+					      CDC_TXn_ADC_MODE_MASK,
+					      tx->dec_mode[decimator]);
+		/* Enable TX PGA Mute */
+		snd_soc_component_write_field(component, tx_vol_ctl_reg,
+					      CDC_TXn_PGA_MUTE_MASK, 0x1);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_write_field(component, tx_vol_ctl_reg,
+					     CDC_TXn_CLK_EN_MASK, 0x1);
+		if (!is_amic_enabled(component, decimator)) {
+			snd_soc_component_update_bits(component, hpf_gate_reg, 0x01, 0x00);
+			/* Minimum 1 clk cycle delay is required as per HW spec */
+			usleep_range(1000, 1010);
+		}
+		hpf_cut_off_freq = snd_soc_component_read_field(component, dec_cfg_reg,
+								CDC_TXn_HPF_CUT_FREQ_MASK);
+
+		tx->tx_hpf_work[decimator].hpf_cut_off_freq =
+						hpf_cut_off_freq;
+
+		if (hpf_cut_off_freq != CF_MIN_3DB_150HZ)
+			snd_soc_component_write_field(component, dec_cfg_reg,
+						      CDC_TXn_HPF_CUT_FREQ_MASK,
+						      CF_MIN_3DB_150HZ);
+
+		if (is_amic_enabled(component, decimator)) {
+			hpf_delay = TX_MACRO_AMIC_HPF_DELAY_MS;
+			unmute_delay = TX_MACRO_AMIC_UNMUTE_DELAY_MS;
+		}
+		/* schedule work queue to Remove Mute */
+		queue_delayed_work(system_freezable_wq,
+				   &tx->tx_mute_dwork[decimator].dwork,
+				   msecs_to_jiffies(unmute_delay));
+		if (tx->tx_hpf_work[decimator].hpf_cut_off_freq != CF_MIN_3DB_150HZ) {
+			queue_delayed_work(system_freezable_wq,
+				&tx->tx_hpf_work[decimator].dwork,
+				msecs_to_jiffies(hpf_delay));
+			snd_soc_component_update_bits(component, hpf_gate_reg,
+					      CDC_TXn_HPF_F_CHANGE_MASK |
+					      CDC_TXn_HPF_ZERO_GATE_MASK,
+					      0x02);
+			if (!is_amic_enabled(component, decimator))
+				snd_soc_component_update_bits(component, hpf_gate_reg,
+						      CDC_TXn_HPF_F_CHANGE_MASK |
+						      CDC_TXn_HPF_ZERO_GATE_MASK,
+						      0x00);
+			snd_soc_component_update_bits(component, hpf_gate_reg,
+					      CDC_TXn_HPF_F_CHANGE_MASK |
+					      CDC_TXn_HPF_ZERO_GATE_MASK,
+					      0x01);
+
+			/*
+			 * 6ms delay is required as per HW spec
+			 */
+			usleep_range(6000, 6010);
+		}
+		/* apply gain after decimator is enabled */
+		snd_soc_component_write(component, tx_gain_ctl_reg,
+			      snd_soc_component_read(component,
+					tx_gain_ctl_reg));
+		if (tx->bcs_enable) {
+			snd_soc_component_update_bits(component, dec_cfg_reg,
+					0x01, 0x01);
+			tx->bcs_clk_en = true;
+		}
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		hpf_cut_off_freq =
+			tx->tx_hpf_work[decimator].hpf_cut_off_freq;
+		snd_soc_component_write_field(component, tx_vol_ctl_reg,
+					      CDC_TXn_PGA_MUTE_MASK, 0x1);
+		if (cancel_delayed_work_sync(
+		    &tx->tx_hpf_work[decimator].dwork)) {
+			if (hpf_cut_off_freq != CF_MIN_3DB_150HZ) {
+				snd_soc_component_write_field(
+						component, dec_cfg_reg,
+						CDC_TXn_HPF_CUT_FREQ_MASK,
+						hpf_cut_off_freq);
+				if (is_amic_enabled(component, decimator))
+					snd_soc_component_update_bits(component,
+					      hpf_gate_reg,
+					      CDC_TXn_HPF_F_CHANGE_MASK |
+					      CDC_TXn_HPF_ZERO_GATE_MASK,
+					      0x02);
+				else
+					snd_soc_component_update_bits(component,
+					      hpf_gate_reg,
+					      CDC_TXn_HPF_F_CHANGE_MASK |
+					      CDC_TXn_HPF_ZERO_GATE_MASK,
+					      0x03);
+
+				/*
+				 * Minimum 1 clk cycle delay is required
+				 * as per HW spec
+				 */
+				usleep_range(1000, 1010);
+				snd_soc_component_update_bits(component, hpf_gate_reg,
+					      CDC_TXn_HPF_F_CHANGE_MASK |
+					      CDC_TXn_HPF_ZERO_GATE_MASK,
+					      0x1);
+			}
+		}
+		cancel_delayed_work_sync(&tx->tx_mute_dwork[decimator].dwork);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, tx_vol_ctl_reg,
+					      CDC_TXn_CLK_EN_MASK, 0x0);
+		snd_soc_component_write_field(component, dec_cfg_reg,
+					      CDC_TXn_ADC_MODE_MASK, 0x0);
+		snd_soc_component_write_field(component, tx_vol_ctl_reg,
+					      CDC_TXn_PGA_MUTE_MASK, 0x0);
+		if (tx->bcs_enable) {
+			snd_soc_component_write_field(component, dec_cfg_reg,
+						      CDC_TXn_PH_EN_MASK, 0x0);
+			snd_soc_component_write_field(component,
+						      CDC_TX0_TX_PATH_SEC7,
+						      CDC_TX0_MBHC_CTL_EN_MASK,
+						      0x0);
+			tx->bcs_clk_en = false;
+		}
+		break;
+	}
+	return 0;
+}
+
 static int tx_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
@@ -907,6 +1190,83 @@ static struct snd_soc_dai_driver tx_macro_dai[] = {
 	},
 };
 
+static const char * const adc_mux_text[] = {
+	"MSM_DMIC", "SWR_MIC", "ANC_FB_TUNE1"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_dec0_enum, CDC_TX_INP_MUX_ADC_MUX0_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_dec1_enum, CDC_TX_INP_MUX_ADC_MUX1_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_dec2_enum, CDC_TX_INP_MUX_ADC_MUX2_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_dec3_enum, CDC_TX_INP_MUX_ADC_MUX3_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_dec4_enum, CDC_TX_INP_MUX_ADC_MUX4_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_dec5_enum, CDC_TX_INP_MUX_ADC_MUX5_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_dec6_enum, CDC_TX_INP_MUX_ADC_MUX6_CFG1,
+		   0, adc_mux_text);
+static SOC_ENUM_SINGLE_DECL(tx_dec7_enum, CDC_TX_INP_MUX_ADC_MUX7_CFG1,
+		   0, adc_mux_text);
+
+static const struct snd_kcontrol_new tx_dec0_mux = SOC_DAPM_ENUM("tx_dec0", tx_dec0_enum);
+static const struct snd_kcontrol_new tx_dec1_mux = SOC_DAPM_ENUM("tx_dec1", tx_dec1_enum);
+static const struct snd_kcontrol_new tx_dec2_mux = SOC_DAPM_ENUM("tx_dec2", tx_dec2_enum);
+static const struct snd_kcontrol_new tx_dec3_mux = SOC_DAPM_ENUM("tx_dec3", tx_dec3_enum);
+static const struct snd_kcontrol_new tx_dec4_mux = SOC_DAPM_ENUM("tx_dec4", tx_dec4_enum);
+static const struct snd_kcontrol_new tx_dec5_mux = SOC_DAPM_ENUM("tx_dec5", tx_dec5_enum);
+static const struct snd_kcontrol_new tx_dec6_mux = SOC_DAPM_ENUM("tx_dec6", tx_dec6_enum);
+static const struct snd_kcontrol_new tx_dec7_mux = SOC_DAPM_ENUM("tx_dec7", tx_dec7_enum);
+
+static const char * const smic_mux_text[] = {
+	"ZERO", "ADC0", "ADC1", "ADC2", "ADC3", "SWR_DMIC0",
+	"SWR_DMIC1", "SWR_DMIC2", "SWR_DMIC3", "SWR_DMIC4",
+	"SWR_DMIC5", "SWR_DMIC6", "SWR_DMIC7"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_smic0_enum, CDC_TX_INP_MUX_ADC_MUX0_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic1_enum, CDC_TX_INP_MUX_ADC_MUX1_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic2_enum, CDC_TX_INP_MUX_ADC_MUX2_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic3_enum, CDC_TX_INP_MUX_ADC_MUX3_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic4_enum, CDC_TX_INP_MUX_ADC_MUX4_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic5_enum, CDC_TX_INP_MUX_ADC_MUX5_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic6_enum, CDC_TX_INP_MUX_ADC_MUX6_CFG0,
+			0, smic_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic7_enum, CDC_TX_INP_MUX_ADC_MUX7_CFG0,
+			0, smic_mux_text);
+
+static const struct snd_kcontrol_new tx_smic0_mux = SOC_DAPM_ENUM_EXT("tx_smic0", tx_smic0_enum,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic1_mux = SOC_DAPM_ENUM_EXT("tx_smic1", tx_smic1_enum,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic2_mux = SOC_DAPM_ENUM_EXT("tx_smic2", tx_smic2_enum,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic3_mux = SOC_DAPM_ENUM_EXT("tx_smic3", tx_smic3_enum,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic4_mux = SOC_DAPM_ENUM_EXT("tx_smic4", tx_smic4_enum,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic5_mux = SOC_DAPM_ENUM_EXT("tx_smic5", tx_smic5_enum,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic6_mux = SOC_DAPM_ENUM_EXT("tx_smic6", tx_smic6_enum,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic7_mux = SOC_DAPM_ENUM_EXT("tx_smic7", tx_smic7_enum,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+
 static const char * const dec_mode_mux_text[] = {
 	"ADC_DEFAULT", "ADC_LOW_PWR", "ADC_HIGH_PERF",
 };
@@ -930,6 +1290,327 @@ static const struct soc_enum dec_mode_mux_enum[] = {
 			dec_mode_mux_text),
 };
 
+static const struct snd_kcontrol_new tx_aif1_cap_mixer[] = {
+	SOC_SINGLE_EXT("DEC0", SND_SOC_NOPM, TX_MACRO_DEC0, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC1", SND_SOC_NOPM, TX_MACRO_DEC1, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC2", SND_SOC_NOPM, TX_MACRO_DEC2, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC3", SND_SOC_NOPM, TX_MACRO_DEC3, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC4", SND_SOC_NOPM, TX_MACRO_DEC4, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC5", SND_SOC_NOPM, TX_MACRO_DEC5, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC6", SND_SOC_NOPM, TX_MACRO_DEC6, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC7", SND_SOC_NOPM, TX_MACRO_DEC7, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+};
+
+static const struct snd_kcontrol_new tx_aif2_cap_mixer[] = {
+	SOC_SINGLE_EXT("DEC0", SND_SOC_NOPM, TX_MACRO_DEC0, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC1", SND_SOC_NOPM, TX_MACRO_DEC1, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC2", SND_SOC_NOPM, TX_MACRO_DEC2, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC3", SND_SOC_NOPM, TX_MACRO_DEC3, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC4", SND_SOC_NOPM, TX_MACRO_DEC4, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC5", SND_SOC_NOPM, TX_MACRO_DEC5, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC6", SND_SOC_NOPM, TX_MACRO_DEC6, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC7", SND_SOC_NOPM, TX_MACRO_DEC7, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+};
+
+static const struct snd_kcontrol_new tx_aif3_cap_mixer[] = {
+	SOC_SINGLE_EXT("DEC0", SND_SOC_NOPM, TX_MACRO_DEC0, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC1", SND_SOC_NOPM, TX_MACRO_DEC1, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC2", SND_SOC_NOPM, TX_MACRO_DEC2, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC3", SND_SOC_NOPM, TX_MACRO_DEC3, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC4", SND_SOC_NOPM, TX_MACRO_DEC4, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC5", SND_SOC_NOPM, TX_MACRO_DEC5, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC6", SND_SOC_NOPM, TX_MACRO_DEC6, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+	SOC_SINGLE_EXT("DEC7", SND_SOC_NOPM, TX_MACRO_DEC7, 1, 0,
+			tx_macro_tx_mixer_get, tx_macro_tx_mixer_put),
+};
+
+static const struct snd_soc_dapm_widget tx_macro_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_OUT("TX_AIF1 CAP", "TX_AIF1 Capture", 0,
+		SND_SOC_NOPM, TX_MACRO_AIF1_CAP, 0),
+
+	SND_SOC_DAPM_AIF_OUT("TX_AIF2 CAP", "TX_AIF2 Capture", 0,
+		SND_SOC_NOPM, TX_MACRO_AIF2_CAP, 0),
+
+	SND_SOC_DAPM_AIF_OUT("TX_AIF3 CAP", "TX_AIF3 Capture", 0,
+		SND_SOC_NOPM, TX_MACRO_AIF3_CAP, 0),
+
+	SND_SOC_DAPM_MIXER("TX_AIF1_CAP Mixer", SND_SOC_NOPM, TX_MACRO_AIF1_CAP, 0,
+		tx_aif1_cap_mixer, ARRAY_SIZE(tx_aif1_cap_mixer)),
+
+	SND_SOC_DAPM_MIXER("TX_AIF2_CAP Mixer", SND_SOC_NOPM, TX_MACRO_AIF2_CAP, 0,
+		tx_aif2_cap_mixer, ARRAY_SIZE(tx_aif2_cap_mixer)),
+
+	SND_SOC_DAPM_MIXER("TX_AIF3_CAP Mixer", SND_SOC_NOPM, TX_MACRO_AIF3_CAP, 0,
+		tx_aif3_cap_mixer, ARRAY_SIZE(tx_aif3_cap_mixer)),
+
+	SND_SOC_DAPM_MUX("TX SMIC MUX0", SND_SOC_NOPM, 0, 0, &tx_smic0_mux),
+	SND_SOC_DAPM_MUX("TX SMIC MUX1", SND_SOC_NOPM, 0, 0, &tx_smic1_mux),
+	SND_SOC_DAPM_MUX("TX SMIC MUX2", SND_SOC_NOPM, 0, 0, &tx_smic2_mux),
+	SND_SOC_DAPM_MUX("TX SMIC MUX3", SND_SOC_NOPM, 0, 0, &tx_smic3_mux),
+	SND_SOC_DAPM_MUX("TX SMIC MUX4", SND_SOC_NOPM, 0, 0, &tx_smic4_mux),
+	SND_SOC_DAPM_MUX("TX SMIC MUX5", SND_SOC_NOPM, 0, 0, &tx_smic5_mux),
+	SND_SOC_DAPM_MUX("TX SMIC MUX6", SND_SOC_NOPM, 0, 0, &tx_smic6_mux),
+	SND_SOC_DAPM_MUX("TX SMIC MUX7", SND_SOC_NOPM, 0, 0, &tx_smic7_mux),
+
+	SND_SOC_DAPM_INPUT("TX SWR_ADC0"),
+	SND_SOC_DAPM_INPUT("TX SWR_ADC1"),
+	SND_SOC_DAPM_INPUT("TX SWR_ADC2"),
+	SND_SOC_DAPM_INPUT("TX SWR_ADC3"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC0"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC1"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC2"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC3"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC4"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC5"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC6"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC7"),
+
+	SND_SOC_DAPM_MUX_E("TX DEC0 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC0, 0,
+			   &tx_dec0_mux, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC1 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC1, 0,
+			   &tx_dec1_mux, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC2 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC2, 0,
+			   &tx_dec2_mux, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC3 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC3, 0,
+			   &tx_dec3_mux, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC4 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC4, 0,
+			   &tx_dec4_mux, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC5 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC5, 0,
+			   &tx_dec5_mux, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC6 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC6, 0,
+			   &tx_dec6_mux, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX_E("TX DEC7 MUX", SND_SOC_NOPM,
+			   TX_MACRO_DEC7, 0,
+			   &tx_dec7_mux, tx_macro_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("TX_MCLK", 0, SND_SOC_NOPM, 0, 0,
+	tx_macro_mclk_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("TX_SWR_CLK", 0, SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY_S("VA_SWR_CLK", 0, SND_SOC_NOPM, 0, 0,
+			NULL, 0),
+};
+
+static const struct snd_soc_dapm_route tx_audio_map[] = {
+	{"TX_AIF1 CAP", NULL, "TX_MCLK"},
+	{"TX_AIF2 CAP", NULL, "TX_MCLK"},
+	{"TX_AIF3 CAP", NULL, "TX_MCLK"},
+
+	{"TX_AIF1 CAP", NULL, "TX_AIF1_CAP Mixer"},
+	{"TX_AIF2 CAP", NULL, "TX_AIF2_CAP Mixer"},
+	{"TX_AIF3 CAP", NULL, "TX_AIF3_CAP Mixer"},
+
+	{"TX_AIF1_CAP Mixer", "DEC0", "TX DEC0 MUX"},
+	{"TX_AIF1_CAP Mixer", "DEC1", "TX DEC1 MUX"},
+	{"TX_AIF1_CAP Mixer", "DEC2", "TX DEC2 MUX"},
+	{"TX_AIF1_CAP Mixer", "DEC3", "TX DEC3 MUX"},
+	{"TX_AIF1_CAP Mixer", "DEC4", "TX DEC4 MUX"},
+	{"TX_AIF1_CAP Mixer", "DEC5", "TX DEC5 MUX"},
+	{"TX_AIF1_CAP Mixer", "DEC6", "TX DEC6 MUX"},
+	{"TX_AIF1_CAP Mixer", "DEC7", "TX DEC7 MUX"},
+
+	{"TX_AIF2_CAP Mixer", "DEC0", "TX DEC0 MUX"},
+	{"TX_AIF2_CAP Mixer", "DEC1", "TX DEC1 MUX"},
+	{"TX_AIF2_CAP Mixer", "DEC2", "TX DEC2 MUX"},
+	{"TX_AIF2_CAP Mixer", "DEC3", "TX DEC3 MUX"},
+	{"TX_AIF2_CAP Mixer", "DEC4", "TX DEC4 MUX"},
+	{"TX_AIF2_CAP Mixer", "DEC5", "TX DEC5 MUX"},
+	{"TX_AIF2_CAP Mixer", "DEC6", "TX DEC6 MUX"},
+	{"TX_AIF2_CAP Mixer", "DEC7", "TX DEC7 MUX"},
+
+	{"TX_AIF3_CAP Mixer", "DEC0", "TX DEC0 MUX"},
+	{"TX_AIF3_CAP Mixer", "DEC1", "TX DEC1 MUX"},
+	{"TX_AIF3_CAP Mixer", "DEC2", "TX DEC2 MUX"},
+	{"TX_AIF3_CAP Mixer", "DEC3", "TX DEC3 MUX"},
+	{"TX_AIF3_CAP Mixer", "DEC4", "TX DEC4 MUX"},
+	{"TX_AIF3_CAP Mixer", "DEC5", "TX DEC5 MUX"},
+	{"TX_AIF3_CAP Mixer", "DEC6", "TX DEC6 MUX"},
+	{"TX_AIF3_CAP Mixer", "DEC7", "TX DEC7 MUX"},
+
+	{"TX DEC0 MUX", NULL, "TX_MCLK"},
+	{"TX DEC1 MUX", NULL, "TX_MCLK"},
+	{"TX DEC2 MUX", NULL, "TX_MCLK"},
+	{"TX DEC3 MUX", NULL, "TX_MCLK"},
+	{"TX DEC4 MUX", NULL, "TX_MCLK"},
+	{"TX DEC5 MUX", NULL, "TX_MCLK"},
+	{"TX DEC6 MUX", NULL, "TX_MCLK"},
+	{"TX DEC7 MUX", NULL, "TX_MCLK"},
+
+	{"TX DEC0 MUX", "SWR_MIC", "TX SMIC MUX0"},
+	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX0", "ADC0", "TX SWR_ADC0"},
+	{"TX SMIC MUX0", "ADC1", "TX SWR_ADC1"},
+	{"TX SMIC MUX0", "ADC2", "TX SWR_ADC2"},
+	{"TX SMIC MUX0", "ADC3", "TX SWR_ADC3"},
+	{"TX SMIC MUX0", "SWR_DMIC0", "TX SWR_DMIC0"},
+	{"TX SMIC MUX0", "SWR_DMIC1", "TX SWR_DMIC1"},
+	{"TX SMIC MUX0", "SWR_DMIC2", "TX SWR_DMIC2"},
+	{"TX SMIC MUX0", "SWR_DMIC3", "TX SWR_DMIC3"},
+	{"TX SMIC MUX0", "SWR_DMIC4", "TX SWR_DMIC4"},
+	{"TX SMIC MUX0", "SWR_DMIC5", "TX SWR_DMIC5"},
+	{"TX SMIC MUX0", "SWR_DMIC6", "TX SWR_DMIC6"},
+	{"TX SMIC MUX0", "SWR_DMIC7", "TX SWR_DMIC7"},
+
+	{"TX DEC1 MUX", "SWR_MIC", "TX SMIC MUX1"},
+	{"TX SMIC MUX1", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX1", "ADC0", "TX SWR_ADC0"},
+	{"TX SMIC MUX1", "ADC1", "TX SWR_ADC1"},
+	{"TX SMIC MUX1", "ADC2", "TX SWR_ADC2"},
+	{"TX SMIC MUX1", "ADC3", "TX SWR_ADC3"},
+	{"TX SMIC MUX1", "SWR_DMIC0", "TX SWR_DMIC0"},
+	{"TX SMIC MUX1", "SWR_DMIC1", "TX SWR_DMIC1"},
+	{"TX SMIC MUX1", "SWR_DMIC2", "TX SWR_DMIC2"},
+	{"TX SMIC MUX1", "SWR_DMIC3", "TX SWR_DMIC3"},
+	{"TX SMIC MUX1", "SWR_DMIC4", "TX SWR_DMIC4"},
+	{"TX SMIC MUX1", "SWR_DMIC5", "TX SWR_DMIC5"},
+	{"TX SMIC MUX1", "SWR_DMIC6", "TX SWR_DMIC6"},
+	{"TX SMIC MUX1", "SWR_DMIC7", "TX SWR_DMIC7"},
+
+	{"TX DEC2 MUX", "SWR_MIC", "TX SMIC MUX2"},
+	{"TX SMIC MUX2", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX2", "ADC0", "TX SWR_ADC0"},
+	{"TX SMIC MUX2", "ADC1", "TX SWR_ADC1"},
+	{"TX SMIC MUX2", "ADC2", "TX SWR_ADC2"},
+	{"TX SMIC MUX2", "ADC3", "TX SWR_ADC3"},
+	{"TX SMIC MUX2", "SWR_DMIC0", "TX SWR_DMIC0"},
+	{"TX SMIC MUX2", "SWR_DMIC1", "TX SWR_DMIC1"},
+	{"TX SMIC MUX2", "SWR_DMIC2", "TX SWR_DMIC2"},
+	{"TX SMIC MUX2", "SWR_DMIC3", "TX SWR_DMIC3"},
+	{"TX SMIC MUX2", "SWR_DMIC4", "TX SWR_DMIC4"},
+	{"TX SMIC MUX2", "SWR_DMIC5", "TX SWR_DMIC5"},
+	{"TX SMIC MUX2", "SWR_DMIC6", "TX SWR_DMIC6"},
+	{"TX SMIC MUX2", "SWR_DMIC7", "TX SWR_DMIC7"},
+
+	{"TX DEC3 MUX", "SWR_MIC", "TX SMIC MUX3"},
+	{"TX SMIC MUX3", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX3", "ADC0", "TX SWR_ADC0"},
+	{"TX SMIC MUX3", "ADC1", "TX SWR_ADC1"},
+	{"TX SMIC MUX3", "ADC2", "TX SWR_ADC2"},
+	{"TX SMIC MUX3", "ADC3", "TX SWR_ADC3"},
+	{"TX SMIC MUX3", "SWR_DMIC0", "TX SWR_DMIC0"},
+	{"TX SMIC MUX3", "SWR_DMIC1", "TX SWR_DMIC1"},
+	{"TX SMIC MUX3", "SWR_DMIC2", "TX SWR_DMIC2"},
+	{"TX SMIC MUX3", "SWR_DMIC3", "TX SWR_DMIC3"},
+	{"TX SMIC MUX3", "SWR_DMIC4", "TX SWR_DMIC4"},
+	{"TX SMIC MUX3", "SWR_DMIC5", "TX SWR_DMIC5"},
+	{"TX SMIC MUX3", "SWR_DMIC6", "TX SWR_DMIC6"},
+	{"TX SMIC MUX3", "SWR_DMIC7", "TX SWR_DMIC7"},
+
+	{"TX DEC4 MUX", "SWR_MIC", "TX SMIC MUX4"},
+	{"TX SMIC MUX4", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX4", "ADC0", "TX SWR_ADC0"},
+	{"TX SMIC MUX4", "ADC1", "TX SWR_ADC1"},
+	{"TX SMIC MUX4", "ADC2", "TX SWR_ADC2"},
+	{"TX SMIC MUX4", "ADC3", "TX SWR_ADC3"},
+	{"TX SMIC MUX4", "SWR_DMIC0", "TX SWR_DMIC0"},
+	{"TX SMIC MUX4", "SWR_DMIC1", "TX SWR_DMIC1"},
+	{"TX SMIC MUX4", "SWR_DMIC2", "TX SWR_DMIC2"},
+	{"TX SMIC MUX4", "SWR_DMIC3", "TX SWR_DMIC3"},
+	{"TX SMIC MUX4", "SWR_DMIC4", "TX SWR_DMIC4"},
+	{"TX SMIC MUX4", "SWR_DMIC5", "TX SWR_DMIC5"},
+	{"TX SMIC MUX4", "SWR_DMIC6", "TX SWR_DMIC6"},
+	{"TX SMIC MUX4", "SWR_DMIC7", "TX SWR_DMIC7"},
+
+	{"TX DEC5 MUX", "SWR_MIC", "TX SMIC MUX5"},
+	{"TX SMIC MUX5", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX5", "ADC0", "TX SWR_ADC0"},
+	{"TX SMIC MUX5", "ADC1", "TX SWR_ADC1"},
+	{"TX SMIC MUX5", "ADC2", "TX SWR_ADC2"},
+	{"TX SMIC MUX5", "ADC3", "TX SWR_ADC3"},
+	{"TX SMIC MUX5", "SWR_DMIC0", "TX SWR_DMIC0"},
+	{"TX SMIC MUX5", "SWR_DMIC1", "TX SWR_DMIC1"},
+	{"TX SMIC MUX5", "SWR_DMIC2", "TX SWR_DMIC2"},
+	{"TX SMIC MUX5", "SWR_DMIC3", "TX SWR_DMIC3"},
+	{"TX SMIC MUX5", "SWR_DMIC4", "TX SWR_DMIC4"},
+	{"TX SMIC MUX5", "SWR_DMIC5", "TX SWR_DMIC5"},
+	{"TX SMIC MUX5", "SWR_DMIC6", "TX SWR_DMIC6"},
+	{"TX SMIC MUX5", "SWR_DMIC7", "TX SWR_DMIC7"},
+
+	{"TX DEC6 MUX", "SWR_MIC", "TX SMIC MUX6"},
+	{"TX SMIC MUX6", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX6", "ADC0", "TX SWR_ADC0"},
+	{"TX SMIC MUX6", "ADC1", "TX SWR_ADC1"},
+	{"TX SMIC MUX6", "ADC2", "TX SWR_ADC2"},
+	{"TX SMIC MUX6", "ADC3", "TX SWR_ADC3"},
+	{"TX SMIC MUX6", "SWR_DMIC0", "TX SWR_DMIC0"},
+	{"TX SMIC MUX6", "SWR_DMIC1", "TX SWR_DMIC1"},
+	{"TX SMIC MUX6", "SWR_DMIC2", "TX SWR_DMIC2"},
+	{"TX SMIC MUX6", "SWR_DMIC3", "TX SWR_DMIC3"},
+	{"TX SMIC MUX6", "SWR_DMIC4", "TX SWR_DMIC4"},
+	{"TX SMIC MUX6", "SWR_DMIC5", "TX SWR_DMIC5"},
+	{"TX SMIC MUX6", "SWR_DMIC6", "TX SWR_DMIC6"},
+	{"TX SMIC MUX6", "SWR_DMIC7", "TX SWR_DMIC7"},
+
+	{"TX DEC7 MUX", "SWR_MIC", "TX SMIC MUX7"},
+	{"TX SMIC MUX7", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX7", "ADC0", "TX SWR_ADC0"},
+	{"TX SMIC MUX7", "ADC1", "TX SWR_ADC1"},
+	{"TX SMIC MUX7", "ADC2", "TX SWR_ADC2"},
+	{"TX SMIC MUX7", "ADC3", "TX SWR_ADC3"},
+	{"TX SMIC MUX7", "SWR_DMIC0", "TX SWR_DMIC0"},
+	{"TX SMIC MUX7", "SWR_DMIC1", "TX SWR_DMIC1"},
+	{"TX SMIC MUX7", "SWR_DMIC2", "TX SWR_DMIC2"},
+	{"TX SMIC MUX7", "SWR_DMIC3", "TX SWR_DMIC3"},
+	{"TX SMIC MUX7", "SWR_DMIC4", "TX SWR_DMIC4"},
+	{"TX SMIC MUX7", "SWR_DMIC5", "TX SWR_DMIC5"},
+	{"TX SMIC MUX7", "SWR_DMIC6", "TX SWR_DMIC6"},
+	{"TX SMIC MUX7", "SWR_DMIC7", "TX SWR_DMIC7"},
+};
+
 static const struct snd_kcontrol_new tx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("TX_DEC0 Volume",
 			  CDC_TX0_TX_VOL_CTL,
@@ -1103,6 +1784,10 @@ static const struct snd_soc_component_driver tx_macro_component_drv = {
 	.probe = tx_macro_component_probe,
 	.controls = tx_macro_snd_controls,
 	.num_controls = ARRAY_SIZE(tx_macro_snd_controls),
+	.dapm_widgets = tx_macro_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tx_macro_dapm_widgets),
+	.dapm_routes = tx_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(tx_audio_map),
 };
 
 static int tx_macro_probe(struct platform_device *pdev)
-- 
2.21.0

