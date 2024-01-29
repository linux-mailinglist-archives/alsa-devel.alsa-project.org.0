Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE5840899
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 15:37:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684B0A4B;
	Mon, 29 Jan 2024 15:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684B0A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706539021;
	bh=fftjdHkUzh4V9nixMeGpkA1ywXLWB83ioGD//1/4GIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=srVKddnqaRJyJsSJTdrGxSBwVMPfVrl7dJutFRkJwsS88tRvL1h4psbIZCLzup3Bt
	 NbvRGiqWy0W2YUQluXonr7p35jW6A4O1dhh4pfnrITvEtdRp6NARyjEeqwGnJvvn+f
	 +3BiLH9TovIvuVvEn9JSMTV8Pv6WYnUpA8lw9U8I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 016E4F80604; Mon, 29 Jan 2024 15:36:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83D7BF80563;
	Mon, 29 Jan 2024 15:36:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49FEEF80579; Mon, 29 Jan 2024 15:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4B68F80563
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 15:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B68F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=asYSViNZ
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55f12332350so938884a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jan 2024 06:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706538942; x=1707143742;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIT+M4woZ1ph2qPUe3/GMV121vlIvWEDVAyTboxC6Nw=;
        b=asYSViNZX4+rEl2cpWc6AQEXqPnKyjMCeC1VC5isNDgJcV1jNaDS+4dhX5/qojVzhU
         Vn4nl1tNC4YQq0wCNTesG/JE4UGSsmu83Poh+58wQDGIkfCyRktudEccW41U74cKYAau
         l1T49XtDaVqvNfFuK6S0YCHSAf/LfTOQ+fHTKW5fV59ZFWfYx0oN6y36iBYVtTa5SEpZ
         TGSOe0C1OFNttAjEp+3QQJ5P0Af9WrCnyfpCsGUDx7eXZVDcIg8s1katLIPf9HpR9FQ6
         q58wwR9Z+9mowSAgYeQZVPOOmT39fy8KU9t9gDiAKiwsr9hdAXmMJc3M8mWZkx7+mJ0Z
         SKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706538942; x=1707143742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIT+M4woZ1ph2qPUe3/GMV121vlIvWEDVAyTboxC6Nw=;
        b=J4tiqOnJUEEXrUrv5uka0e2BzVqdGeVDHVAcJzVKjPfY0oKRZFbEzXDrWGXjleoHLd
         IHI00K9tvkkmEn3ZfAfbxPpOlSesYqI2AR+AszdYBe+gxYWZ82M3BAm7xBpNkGeJx2/N
         cEBloh0OZpM9ys5sBRUdUV/1FaU0+pTXCq6I2/MOss6F3SMjvryOeIpRdLtvl8gWiLK9
         eOeOq4N2iY0osZdJB7nNbX6lD+pOMeXKXcZEDlKKUD8ZQtG6K3PbXHtUYS+LXNDbivvC
         162s1+oeIpkhrmQptS8uvYCWt4Kk6KN4LgbdyYjSgweI7f4bc9AnEta9kke2AJiGZBZJ
         bZDg==
X-Gm-Message-State: AOJu0YyJ2E0zjltBgz6id0oIJU6RyE3rwuIYh3tcwDskcEyZ42EQh7qz
	YT4E21ZGOPYZwjOxTEh1q63DH+PVhLcjfRQqlPdjueXN24SS0e9FBg/AYIktQUQ=
X-Google-Smtp-Source: 
 AGHT+IHIsV1QnApSpGhbjNtPJZy0WNARraA/jylZu8N0Ta+MwH8oFBkphSHnDaAUS2yQlZDXDreVfA==
X-Received: by 2002:a17:906:e0ce:b0:a35:8278:3288 with SMTP id
 gl14-20020a170906e0ce00b00a3582783288mr3144336ejb.35.1706538941729;
        Mon, 29 Jan 2024 06:35:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 sf5-20020a1709078a8500b00a3543718f5bsm2829269ejc.221.2024.01.29.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 06:35:41 -0800 (PST)
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
Subject: [PATCH v3 2/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets
 on SM8350+
Date: Mon, 29 Jan 2024 15:35:34 +0100
Message-Id: <20240129143534.109196-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129143534.109196-1-krzysztof.kozlowski@linaro.org>
References: <20240129143534.109196-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GJDQKJWC26JFTLZQBNTKVON5KFH7TOVR
X-Message-ID-Hash: GJDQKJWC26JFTLZQBNTKVON5KFH7TOVR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJDQKJWC26JFTLZQBNTKVON5KFH7TOVR/>
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
mixer settings, therefore it does not change handling of older platforms
with working micrphones (SC8280xp) but only the ones with issues
(SM8450, SM8550) which need the fix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Do not change driver match data for SC8280xp, because of
   compatibility reasons. Unlike on other newer platforms like SM8450
   and SM8550, microphones are working fine on SC8280xp so apparently
   the fix is not necessary on SC8280xp.

Changes in v2:
1. Keep all the MSM_DMIC/TX DMIC MUX audio routes in the shared
   tx_audio_map, because it does not differ between v9 and v9.2.

2. Drop backwards compatible widgets because they create issues with
   routes in existing DTS.
---
 sound/soc/codecs/lpass-macro-common.h |   1 +
 sound/soc/codecs/lpass-tx-macro.c     | 316 +++++++++++++++++++++++---
 2 files changed, 285 insertions(+), 32 deletions(-)

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
index ecc8565ff4bb..365696ebb5fe 100644
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
@@ -2251,12 +2498,17 @@ static const struct of_device_id tx_macro_dt_match[] = {
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
+		/*
+		 * Keep LPASS v9 match data and audio widgets for SC8280xp, due
+		 * to compatibility reasons. Microphones are working on SC8280xp
+		 * fine, so apparently the fix is not necessary.
+		 */
 		.data = &lpass_ver_9,
 	},
 	{ }
-- 
2.34.1

