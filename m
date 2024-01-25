Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E15383C6AB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 16:32:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F002A7F4;
	Thu, 25 Jan 2024 16:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F002A7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706196767;
	bh=MTzuUjMu0tyGbeKOxfHoXlDa2p4GOf7g2aZCMC2uZto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OXlSPOSzZVzwSVKK3IESrKVqU+1qYFFRW8zwuTQkC47pL/rIrQvrgMadGPe/1rPay
	 TxS5qYrpcZys718lpC5aOTIj+j2BIyXJZdCJEBcnuq8gzw6FCLOcrPxuwszZDXQC+x
	 eMVLtGM+kf9TR2oc1YNzI5FTn8vhO5AZfmlLleqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D020AF805FA; Thu, 25 Jan 2024 16:31:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 197D1F805EB;
	Thu, 25 Jan 2024 16:31:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C9A5F805D4; Thu, 25 Jan 2024 16:31:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44512F8028D
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 16:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44512F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u7F0vnKJ
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-599a0f1dc7aso1477234eaf.0
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jan 2024 07:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706196681; x=1706801481;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWJCVPWSQMn8ZP6K1tt8QTM9ICSXE83EwMQDJFzD9GU=;
        b=u7F0vnKJi6r6TqBzvNeoKBY8PZwDn8XqflWGZ/hSUc4gvXASv/oaLL9bXvSg0T54SS
         gs6a0fW5SPap9hlHhDgSFPRzgTgU3D2VqKAyOFkT/9Ibvp8BmMDUA1j5M3yQXJCD8CWr
         DjAS+ZndjMjgH+G6C3JaVSYv5bbBhpYLck386dF+8eOc5oh2V67wwLo8A/8kwkpRCwvP
         mrsroFAgS707OWDA14kN3ATxUZTZr7M5Lz839SyLZ2mf7VJG3Xh5KeuU1ES+wHMPv6FK
         J0YMFssZHCa7WmHmZRQxwYBryDnm9mTLSQCwfpUp+PqW+yDRQNUMVIzTY7ohOi/+OW/X
         P/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706196681; x=1706801481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWJCVPWSQMn8ZP6K1tt8QTM9ICSXE83EwMQDJFzD9GU=;
        b=RNB9R50UpR6W7zZJ02cd0Cf4KpRVfATDeH/cqi3+OyhPAfc3d3QsPBzdD6r3PWhHWA
         F+56ECyHdofhwIQZ0w3nckVGq45EJTAOrRYIai+yaho4/8kLBe2s4Wt/rKo2BB2hwZiu
         pWw0UYkczvC42hER4E8dRq81BZqkn5MS6+SYWZoJ1zFWBXCuXJN3kI+utYqbh7BuBTnt
         2WGL95Tj9puFLZiZ8WqtzDVTmsbMPk52v3Y3PdrL72BpTbSsPbrhz0JH6SpR1jZrvfx0
         viMUN0X3DwN0JydbX8KxtQoLvOR0lR/N8V6I+z2xfwSqSQW0DZpAtaXq/OeDA3T5I2Tu
         XD+w==
X-Gm-Message-State: AOJu0YwSzAtdkrBgMr5i/al0ePVcnNh680avXibFtEsG7AEpL0/zRv2b
	PzcuyphYo2Hu0DKeidiNWNERNgiuRsfNQv+cnBe4cCIa9Hb82yvt0enNHtJg9ik=
X-Google-Smtp-Source: 
 AGHT+IHjLHbwg3XO0+tvCZmUjHNvXIKjlHmT0SwxtS8IQ62RLxOkN4VOtcOUAzq7EKK565GxRRD7Ng==
X-Received: by 2002:a4a:e8c7:0:b0:599:e04f:7ff with SMTP id
 h7-20020a4ae8c7000000b00599e04f07ffmr988907ooe.0.1706196681371;
        Thu, 25 Jan 2024 07:31:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a4ad34e000000b00599f1741917sm63973oos.43.2024.01.25.07.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 07:31:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets
 on SM8350+
Date: Thu, 25 Jan 2024 16:31:10 +0100
Message-Id: <20240125153110.410295-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
References: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DIU3VJASNG3PCOIGBKDOSQN7PDS4ISRM
X-Message-ID-Hash: DIU3VJASNG3PCOIGBKDOSQN7PDS4ISRM
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DIU3VJASNG3PCOIGBKDOSQN7PDS4ISRM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Starting with Qualcomm SM8350 SoC, so Low Power Audio SubSystem (LPASS)
block version v9.2, the register responsible for TX SMIC MUXn muxes is
different.  In earlier LPASS versions this mux had bit fields for
analogue (ADCn) and digital (SWR_DMICn) MICs.  Choice of ADCn was
selecting the analogue path in CDC_TX_TOP_CSR_SWR_DMICn_CTL register.

With LPASS v9.2 and newer, the bit fields are integrated into just
SWR_MICn and there is no distinction for analogue or digital MIC in the
register.

Fix support for LPASS v9.2+:
1. Add new set of widgets and audio routes for LPASS v9.2.
2. Do not choose analogue or digital in CDC_TX_TOP_CSR_SWR_DMICn_CTL
   based on value of the mux.
3. Replace all the input widgets (TX SWR_ADCn, TX SWR_DMICn) with TX
   SWR_INPUTn ones.

The change is not backwards compatible with older DTBs and existing
mixer settings - all of them should be updated to use correct, new
widgets.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Keep all the MSM_DMIC/TX DMIC MUX audio routes in the shared
   tx_audio_map, because it does not differ between v9 and v9.2.

2. Drop backwards compatible widgets because they create issues with
   routes in existing DTS.
---
 sound/soc/codecs/lpass-macro-common.h |   1 +
 sound/soc/codecs/lpass-tx-macro.c     | 313 +++++++++++++++++++++++---
 2 files changed, 281 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 18f5b8c8e822..d98718b3dc4b 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -13,6 +13,7 @@
 
 enum lpass_version {
 	LPASS_VER_9_0_0,
+	LPASS_VER_9_2_0,
 	LPASS_VER_10_0_0,
 	LPASS_VER_11_0_0,
 };
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index ecc8565ff4bb..98d85f5e831d 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -645,13 +645,18 @@ static int tx_macro_mclk_enable(struct tx_macro *tx,
 	return 0;
 }
 
-static bool is_amic_enabled(struct snd_soc_component *component, u8 decimator)
+static bool is_amic_enabled(struct snd_soc_component *component,
+			    struct tx_macro *tx, u8 decimator)
 {
 	u16 adc_mux_reg, adc_reg, adc_n;
 
 	adc_mux_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG1(decimator);
 
 	if (snd_soc_component_read(component, adc_mux_reg) & SWR_MIC) {
+		if (tx->data->ver > LPASS_VER_9_0_0)
+			return true;
+
+		/* else: LPASS <= v9.0.0 */
 		adc_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG0(decimator);
 		adc_n = snd_soc_component_read_field(component, adc_reg,
 					     CDC_TX_MACRO_SWR_MIC_MUX_SEL_MASK);
@@ -680,7 +685,7 @@ static void tx_macro_tx_hpf_corner_freq_callback(struct work_struct *work)
 	dec_cfg_reg = CDC_TXn_TX_PATH_CFG0(hpf_work->decimator);
 	hpf_gate_reg = CDC_TXn_TX_PATH_SEC2(hpf_work->decimator);
 
-	if (is_amic_enabled(component, hpf_work->decimator)) {
+	if (is_amic_enabled(component, tx, hpf_work->decimator)) {
 		snd_soc_component_write_field(component,
 				dec_cfg_reg,
 				CDC_TXn_HPF_CUT_FREQ_MASK,
@@ -744,15 +749,60 @@ static int tx_macro_mclk_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static void tx_macro_update_smic_sel_v9(struct snd_soc_component *component,
+					struct snd_soc_dapm_widget *widget,
+					struct tx_macro *tx, u16 mic_sel_reg,
+					unsigned int val)
+{
+	unsigned int dmic;
+	u16 dmic_clk_reg;
+
+	if (val < 5) {
+		snd_soc_component_write_field(component, mic_sel_reg,
+					      CDC_TXn_ADC_DMIC_SEL_MASK, 0);
+	} else {
+		snd_soc_component_write_field(component, mic_sel_reg,
+					      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
+		dmic = TX_ADC_TO_DMIC(val);
+		dmic_clk_reg = CDC_TX_TOP_CSR_SWR_DMICn_CTL(dmic);
+		snd_soc_component_write_field(component, dmic_clk_reg,
+					      CDC_TX_SWR_DMIC_CLK_SEL_MASK,
+					      tx->dmic_clk_div);
+	}
+}
+
+static void tx_macro_update_smic_sel_v9_2(struct snd_soc_component *component,
+					  struct snd_soc_dapm_widget *widget,
+					  struct tx_macro *tx, u16 mic_sel_reg,
+					  unsigned int val)
+{
+	unsigned int dmic;
+	u16 dmic_clk_reg;
+
+	if (widget->shift) {
+		/* MSM DMIC */
+		snd_soc_component_write_field(component, mic_sel_reg,
+					      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
+
+		dmic = TX_ADC_TO_DMIC(val);
+		dmic_clk_reg = CDC_TX_TOP_CSR_SWR_DMICn_CTL(dmic);
+		snd_soc_component_write_field(component, dmic_clk_reg,
+					      CDC_TX_SWR_DMIC_CLK_SEL_MASK,
+					      tx->dmic_clk_div);
+	} else {
+		snd_soc_component_write_field(component, mic_sel_reg,
+					      CDC_TXn_ADC_DMIC_SEL_MASK, 0);
+	}
+}
+
 static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	unsigned int val, dmic;
+	unsigned int val;
 	u16 mic_sel_reg;
-	u16 dmic_clk_reg;
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
 	val = ucontrol->value.enumerated.item[0];
@@ -790,21 +840,15 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	}
 
 	if (val != 0) {
-		if (widget->shift) { /* MSM DMIC */
+		if (widget->shift) /* MSM DMIC */
 			snd_soc_component_write_field(component, mic_sel_reg,
 						      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
-		} else if (val < 5) {
-			snd_soc_component_write_field(component, mic_sel_reg,
-						      CDC_TXn_ADC_DMIC_SEL_MASK, 0);
-		} else {
-			snd_soc_component_write_field(component, mic_sel_reg,
-						      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
-			dmic = TX_ADC_TO_DMIC(val);
-			dmic_clk_reg = CDC_TX_TOP_CSR_SWR_DMICn_CTL(dmic);
-			snd_soc_component_write_field(component, dmic_clk_reg,
-						CDC_TX_SWR_DMIC_CLK_SEL_MASK,
-						tx->dmic_clk_div);
-		}
+		else if (tx->data->ver <= LPASS_VER_9_0_0)
+			tx_macro_update_smic_sel_v9(component, widget, tx,
+						    mic_sel_reg, val);
+		else
+			tx_macro_update_smic_sel_v9_2(component, widget, tx,
+						      mic_sel_reg, val);
 	}
 
 	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
@@ -905,7 +949,7 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		snd_soc_component_write_field(component, tx_vol_ctl_reg,
 					     CDC_TXn_CLK_EN_MASK, 0x1);
-		if (!is_amic_enabled(component, decimator)) {
+		if (!is_amic_enabled(component, tx, decimator)) {
 			snd_soc_component_update_bits(component, hpf_gate_reg, 0x01, 0x00);
 			/* Minimum 1 clk cycle delay is required as per HW spec */
 			usleep_range(1000, 1010);
@@ -921,7 +965,7 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 						      CDC_TXn_HPF_CUT_FREQ_MASK,
 						      CF_MIN_3DB_150HZ);
 
-		if (is_amic_enabled(component, decimator)) {
+		if (is_amic_enabled(component, tx, decimator)) {
 			hpf_delay = TX_MACRO_AMIC_HPF_DELAY_MS;
 			unmute_delay = TX_MACRO_AMIC_UNMUTE_DELAY_MS;
 		}
@@ -937,7 +981,7 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 					      CDC_TXn_HPF_F_CHANGE_MASK |
 					      CDC_TXn_HPF_ZERO_GATE_MASK,
 					      0x02);
-			if (!is_amic_enabled(component, decimator))
+			if (!is_amic_enabled(component, tx, decimator))
 				snd_soc_component_update_bits(component, hpf_gate_reg,
 						      CDC_TXn_HPF_F_CHANGE_MASK |
 						      CDC_TXn_HPF_ZERO_GATE_MASK,
@@ -974,7 +1018,7 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 						component, dec_cfg_reg,
 						CDC_TXn_HPF_CUT_FREQ_MASK,
 						hpf_cut_off_freq);
-				if (is_amic_enabled(component, decimator))
+				if (is_amic_enabled(component, tx, decimator))
 					snd_soc_component_update_bits(component,
 					      hpf_gate_reg,
 					      CDC_TXn_HPF_F_CHANGE_MASK |
@@ -1785,6 +1829,200 @@ static const struct snd_soc_dapm_route tx_audio_map_v9[] = {
 	{"TX SMIC MUX7", "SWR_DMIC7", "TX SWR_DMIC7"},
 };
 
+/* Controls and routes specific to LPASS >= v9.2.0 */
+static const char * const smic_mux_text_v9_2[] = {
+	"ZERO", "SWR_MIC0", "SWR_MIC1", "SWR_MIC2", "SWR_MIC3",
+	"SWR_MIC4", "SWR_MIC5", "SWR_MIC6", "SWR_MIC7",
+	"SWR_MIC8", "SWR_MIC9", "SWR_MIC10", "SWR_MIC11"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_smic0_enum_v9_2, CDC_TX_INP_MUX_ADC_MUX0_CFG0,
+			0, smic_mux_text_v9_2);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic1_enum_v9_2, CDC_TX_INP_MUX_ADC_MUX1_CFG0,
+			0, smic_mux_text_v9_2);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic2_enum_v9_2, CDC_TX_INP_MUX_ADC_MUX2_CFG0,
+			0, smic_mux_text_v9_2);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic3_enum_v9_2, CDC_TX_INP_MUX_ADC_MUX3_CFG0,
+			0, smic_mux_text_v9_2);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic4_enum_v9_2, CDC_TX_INP_MUX_ADC_MUX4_CFG0,
+			0, smic_mux_text_v9_2);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic5_enum_v9_2, CDC_TX_INP_MUX_ADC_MUX5_CFG0,
+			0, smic_mux_text_v9_2);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic6_enum_v9_2, CDC_TX_INP_MUX_ADC_MUX6_CFG0,
+			0, smic_mux_text_v9_2);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic7_enum_v9_2, CDC_TX_INP_MUX_ADC_MUX7_CFG0,
+			0, smic_mux_text_v9_2);
+
+static const struct snd_kcontrol_new tx_smic0_mux_v9_2 = SOC_DAPM_ENUM_EXT("tx_smic0", tx_smic0_enum_v9_2,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic1_mux_v9_2 = SOC_DAPM_ENUM_EXT("tx_smic1", tx_smic1_enum_v9_2,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic2_mux_v9_2 = SOC_DAPM_ENUM_EXT("tx_smic2", tx_smic2_enum_v9_2,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic3_mux_v9_2 = SOC_DAPM_ENUM_EXT("tx_smic3", tx_smic3_enum_v9_2,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic4_mux_v9_2 = SOC_DAPM_ENUM_EXT("tx_smic4", tx_smic4_enum_v9_2,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic5_mux_v9_2 = SOC_DAPM_ENUM_EXT("tx_smic5", tx_smic5_enum_v9_2,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic6_mux_v9_2 = SOC_DAPM_ENUM_EXT("tx_smic6", tx_smic6_enum_v9_2,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic7_mux_v9_2 = SOC_DAPM_ENUM_EXT("tx_smic7", tx_smic7_enum_v9_2,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+
+static const struct snd_soc_dapm_widget tx_macro_dapm_widgets_v9_2[] = {
+	SND_SOC_DAPM_MUX("TX SMIC MUX0", SND_SOC_NOPM, 0, 0, &tx_smic0_mux_v9_2),
+	SND_SOC_DAPM_MUX("TX SMIC MUX1", SND_SOC_NOPM, 0, 0, &tx_smic1_mux_v9_2),
+	SND_SOC_DAPM_MUX("TX SMIC MUX2", SND_SOC_NOPM, 0, 0, &tx_smic2_mux_v9_2),
+	SND_SOC_DAPM_MUX("TX SMIC MUX3", SND_SOC_NOPM, 0, 0, &tx_smic3_mux_v9_2),
+	SND_SOC_DAPM_MUX("TX SMIC MUX4", SND_SOC_NOPM, 0, 0, &tx_smic4_mux_v9_2),
+	SND_SOC_DAPM_MUX("TX SMIC MUX5", SND_SOC_NOPM, 0, 0, &tx_smic5_mux_v9_2),
+	SND_SOC_DAPM_MUX("TX SMIC MUX6", SND_SOC_NOPM, 0, 0, &tx_smic6_mux_v9_2),
+	SND_SOC_DAPM_MUX("TX SMIC MUX7", SND_SOC_NOPM, 0, 0, &tx_smic7_mux_v9_2),
+
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT0"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT1"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT2"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT3"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT4"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT5"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT6"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT7"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT8"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT9"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT10"),
+	SND_SOC_DAPM_INPUT("TX SWR_INPUT11"),
+};
+
+static const struct snd_soc_dapm_route tx_audio_map_v9_2[] = {
+	{"TX DEC0 MUX", "SWR_MIC", "TX SMIC MUX0"},
+	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX0", "SWR_MIC0", "TX SWR_INPUT0"},
+	{"TX SMIC MUX0", "SWR_MIC1", "TX SWR_INPUT1"},
+	{"TX SMIC MUX0", "SWR_MIC2", "TX SWR_INPUT2"},
+	{"TX SMIC MUX0", "SWR_MIC3", "TX SWR_INPUT3"},
+	{"TX SMIC MUX0", "SWR_MIC4", "TX SWR_INPUT4"},
+	{"TX SMIC MUX0", "SWR_MIC5", "TX SWR_INPUT5"},
+	{"TX SMIC MUX0", "SWR_MIC6", "TX SWR_INPUT6"},
+	{"TX SMIC MUX0", "SWR_MIC7", "TX SWR_INPUT7"},
+	{"TX SMIC MUX0", "SWR_MIC8", "TX SWR_INPUT8"},
+	{"TX SMIC MUX0", "SWR_MIC9", "TX SWR_INPUT9"},
+	{"TX SMIC MUX0", "SWR_MIC10", "TX SWR_INPUT11"},
+	{"TX SMIC MUX0", "SWR_MIC11", "TX SWR_INPUT10"},
+
+	{"TX DEC1 MUX", "SWR_MIC", "TX SMIC MUX1"},
+	{"TX SMIC MUX1", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX1", "SWR_MIC0", "TX SWR_INPUT0"},
+	{"TX SMIC MUX1", "SWR_MIC1", "TX SWR_INPUT1"},
+	{"TX SMIC MUX1", "SWR_MIC2", "TX SWR_INPUT2"},
+	{"TX SMIC MUX1", "SWR_MIC3", "TX SWR_INPUT3"},
+	{"TX SMIC MUX1", "SWR_MIC4", "TX SWR_INPUT4"},
+	{"TX SMIC MUX1", "SWR_MIC5", "TX SWR_INPUT5"},
+	{"TX SMIC MUX1", "SWR_MIC6", "TX SWR_INPUT6"},
+	{"TX SMIC MUX1", "SWR_MIC7", "TX SWR_INPUT7"},
+	{"TX SMIC MUX1", "SWR_MIC8", "TX SWR_INPUT8"},
+	{"TX SMIC MUX1", "SWR_MIC9", "TX SWR_INPUT9"},
+	{"TX SMIC MUX1", "SWR_MIC10", "TX SWR_INPUT10"},
+	{"TX SMIC MUX1", "SWR_MIC11", "TX SWR_INPUT11"},
+
+	{"TX DEC2 MUX", "SWR_MIC", "TX SMIC MUX2"},
+	{"TX SMIC MUX2", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX2", "SWR_MIC0", "TX SWR_INPUT0"},
+	{"TX SMIC MUX2", "SWR_MIC1", "TX SWR_INPUT1"},
+	{"TX SMIC MUX2", "SWR_MIC2", "TX SWR_INPUT2"},
+	{"TX SMIC MUX2", "SWR_MIC3", "TX SWR_INPUT3"},
+	{"TX SMIC MUX2", "SWR_MIC4", "TX SWR_INPUT4"},
+	{"TX SMIC MUX2", "SWR_MIC5", "TX SWR_INPUT5"},
+	{"TX SMIC MUX2", "SWR_MIC6", "TX SWR_INPUT6"},
+	{"TX SMIC MUX2", "SWR_MIC7", "TX SWR_INPUT7"},
+	{"TX SMIC MUX2", "SWR_MIC8", "TX SWR_INPUT8"},
+	{"TX SMIC MUX2", "SWR_MIC9", "TX SWR_INPUT9"},
+	{"TX SMIC MUX2", "SWR_MIC10", "TX SWR_INPUT10"},
+	{"TX SMIC MUX2", "SWR_MIC11", "TX SWR_INPUT11"},
+
+	{"TX DEC3 MUX", "SWR_MIC", "TX SMIC MUX3"},
+	{"TX SMIC MUX3", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX3", "SWR_MIC0", "TX SWR_INPUT0"},
+	{"TX SMIC MUX3", "SWR_MIC1", "TX SWR_INPUT1"},
+	{"TX SMIC MUX3", "SWR_MIC2", "TX SWR_INPUT2"},
+	{"TX SMIC MUX3", "SWR_MIC3", "TX SWR_INPUT3"},
+	{"TX SMIC MUX3", "SWR_MIC4", "TX SWR_INPUT4"},
+	{"TX SMIC MUX3", "SWR_MIC5", "TX SWR_INPUT5"},
+	{"TX SMIC MUX3", "SWR_MIC6", "TX SWR_INPUT6"},
+	{"TX SMIC MUX3", "SWR_MIC7", "TX SWR_INPUT7"},
+	{"TX SMIC MUX3", "SWR_MIC8", "TX SWR_INPUT8"},
+	{"TX SMIC MUX3", "SWR_MIC9", "TX SWR_INPUT9"},
+	{"TX SMIC MUX3", "SWR_MIC10", "TX SWR_INPUT10"},
+	{"TX SMIC MUX3", "SWR_MIC11", "TX SWR_INPUT11"},
+
+	{"TX DEC4 MUX", "SWR_MIC", "TX SMIC MUX4"},
+	{"TX SMIC MUX4", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX4", "SWR_MIC0", "TX SWR_INPUT0"},
+	{"TX SMIC MUX4", "SWR_MIC1", "TX SWR_INPUT1"},
+	{"TX SMIC MUX4", "SWR_MIC2", "TX SWR_INPUT2"},
+	{"TX SMIC MUX4", "SWR_MIC3", "TX SWR_INPUT3"},
+	{"TX SMIC MUX4", "SWR_MIC4", "TX SWR_INPUT4"},
+	{"TX SMIC MUX4", "SWR_MIC5", "TX SWR_INPUT5"},
+	{"TX SMIC MUX4", "SWR_MIC6", "TX SWR_INPUT6"},
+	{"TX SMIC MUX4", "SWR_MIC7", "TX SWR_INPUT7"},
+	{"TX SMIC MUX4", "SWR_MIC8", "TX SWR_INPUT8"},
+	{"TX SMIC MUX4", "SWR_MIC9", "TX SWR_INPUT9"},
+	{"TX SMIC MUX4", "SWR_MIC10", "TX SWR_INPUT10"},
+	{"TX SMIC MUX4", "SWR_MIC11", "TX SWR_INPUT11"},
+
+	{"TX DEC5 MUX", "SWR_MIC", "TX SMIC MUX5"},
+	{"TX SMIC MUX5", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX5", "SWR_MIC0", "TX SWR_INPUT0"},
+	{"TX SMIC MUX5", "SWR_MIC1", "TX SWR_INPUT1"},
+	{"TX SMIC MUX5", "SWR_MIC2", "TX SWR_INPUT2"},
+	{"TX SMIC MUX5", "SWR_MIC3", "TX SWR_INPUT3"},
+	{"TX SMIC MUX5", "SWR_MIC4", "TX SWR_INPUT4"},
+	{"TX SMIC MUX5", "SWR_MIC5", "TX SWR_INPUT5"},
+	{"TX SMIC MUX5", "SWR_MIC6", "TX SWR_INPUT6"},
+	{"TX SMIC MUX5", "SWR_MIC7", "TX SWR_INPUT7"},
+	{"TX SMIC MUX5", "SWR_MIC8", "TX SWR_INPUT8"},
+	{"TX SMIC MUX5", "SWR_MIC9", "TX SWR_INPUT9"},
+	{"TX SMIC MUX5", "SWR_MIC10", "TX SWR_INPUT10"},
+	{"TX SMIC MUX5", "SWR_MIC11", "TX SWR_INPUT11"},
+
+	{"TX DEC6 MUX", "SWR_MIC", "TX SMIC MUX6"},
+	{"TX SMIC MUX6", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX6", "SWR_MIC0", "TX SWR_INPUT0"},
+	{"TX SMIC MUX6", "SWR_MIC1", "TX SWR_INPUT1"},
+	{"TX SMIC MUX6", "SWR_MIC2", "TX SWR_INPUT2"},
+	{"TX SMIC MUX6", "SWR_MIC3", "TX SWR_INPUT3"},
+	{"TX SMIC MUX6", "SWR_MIC4", "TX SWR_INPUT4"},
+	{"TX SMIC MUX6", "SWR_MIC5", "TX SWR_INPUT5"},
+	{"TX SMIC MUX6", "SWR_MIC6", "TX SWR_INPUT6"},
+	{"TX SMIC MUX6", "SWR_MIC7", "TX SWR_INPUT7"},
+	{"TX SMIC MUX6", "SWR_MIC8", "TX SWR_INPUT8"},
+	{"TX SMIC MUX6", "SWR_MIC9", "TX SWR_INPUT9"},
+	{"TX SMIC MUX6", "SWR_MIC10", "TX SWR_INPUT10"},
+	{"TX SMIC MUX6", "SWR_MIC11", "TX SWR_INPUT11"},
+
+	{"TX DEC7 MUX", "SWR_MIC", "TX SMIC MUX7"},
+	{"TX SMIC MUX7", NULL, "TX_SWR_CLK"},
+	{"TX SMIC MUX7", "SWR_MIC0", "TX SWR_INPUT0"},
+	{"TX SMIC MUX7", "SWR_MIC1", "TX SWR_INPUT1"},
+	{"TX SMIC MUX7", "SWR_MIC2", "TX SWR_INPUT2"},
+	{"TX SMIC MUX7", "SWR_MIC3", "TX SWR_INPUT3"},
+	{"TX SMIC MUX7", "SWR_MIC4", "TX SWR_INPUT4"},
+	{"TX SMIC MUX7", "SWR_MIC5", "TX SWR_INPUT5"},
+	{"TX SMIC MUX7", "SWR_MIC6", "TX SWR_INPUT6"},
+	{"TX SMIC MUX7", "SWR_MIC7", "TX SWR_INPUT7"},
+	{"TX SMIC MUX7", "SWR_MIC8", "TX SWR_INPUT8"},
+	{"TX SMIC MUX7", "SWR_MIC9", "TX SWR_INPUT9"},
+	{"TX SMIC MUX7", "SWR_MIC10", "TX SWR_INPUT10"},
+	{"TX SMIC MUX7", "SWR_MIC11", "TX SWR_INPUT11"},
+};
+
 static const struct snd_kcontrol_new tx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("TX_DEC0 Volume",
 			  CDC_TX0_TX_VOL_CTL,
@@ -2220,29 +2458,38 @@ static const struct tx_macro_data lpass_ver_9 = {
 	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9),
 };
 
+static const struct tx_macro_data lpass_ver_9_2 = {
+	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK |
+				  LPASS_MACRO_FLAG_RESET_SWR,
+	.ver			= LPASS_VER_9_2_0,
+	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
+	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),
+	.extra_routes		= tx_audio_map_v9_2,
+	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
+};
+
 static const struct tx_macro_data lpass_ver_10_sm6115 = {
 	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	.ver			= LPASS_VER_10_0_0,
-	.extra_widgets		= tx_macro_dapm_widgets_v9,
-	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9),
-	.extra_routes		= tx_audio_map_v9,
-	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9),
+	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
+	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),
+	.extra_routes		= tx_audio_map_v9_2,
+	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
 };
 
-
 static const struct tx_macro_data lpass_ver_11 = {
 	.flags			= LPASS_MACRO_FLAG_RESET_SWR,
 	.ver			= LPASS_VER_11_0_0,
-	.extra_widgets		= tx_macro_dapm_widgets_v9,
-	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9),
-	.extra_routes		= tx_audio_map_v9,
-	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9),
+	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
+	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),
+	.extra_routes		= tx_audio_map_v9_2,
+	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9_2),
 };
 
 static const struct of_device_id tx_macro_dt_match[] = {
 	{
 		.compatible = "qcom,sc7280-lpass-tx-macro",
-		.data = &lpass_ver_9,
+		.data = &lpass_ver_9_2,
 	}, {
 		.compatible = "qcom,sm6115-lpass-tx-macro",
 		.data = &lpass_ver_10_sm6115,
@@ -2251,13 +2498,13 @@ static const struct of_device_id tx_macro_dt_match[] = {
 		.data = &lpass_ver_9,
 	}, {
 		.compatible = "qcom,sm8450-lpass-tx-macro",
-		.data = &lpass_ver_9,
+		.data = &lpass_ver_9_2,
 	}, {
 		.compatible = "qcom,sm8550-lpass-tx-macro",
 		.data = &lpass_ver_11,
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-tx-macro",
-		.data = &lpass_ver_9,
+		.data = &lpass_ver_9_2,
 	},
 	{ }
 };
-- 
2.34.1

