Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE85CBA4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 10:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20FF116A1;
	Tue,  2 Jul 2019 10:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20FF116A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562055306;
	bh=LHYbWYUtMm1zCteG8/ZUWs/7WYPNMUkd15/0tXV0ob8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jp7ssIU3eCh40hih+2MUc0WwgtoIB5dO4yjK4WKuJAS8BFXfyFWcqHWw7+m7zjhMX
	 pgjOJi/lEPw/LUL7lBYGdyuQKCA0m9mLCT2qhCUsjhCnCfgOElQkPQ/EEwe3KtMV1f
	 wmEjMAghMJa0XAlCa64jRsqfgeK+NhXxkTkqtpyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3B5AF80137;
	Tue,  2 Jul 2019 10:10:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10849F8011D; Tue,  2 Jul 2019 10:10:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 690B0F800EA
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 10:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 690B0F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="otnmJppH"
Received: by mail-wr1-x442.google.com with SMTP id u18so125239wru.1
 for <alsa-devel@alsa-project.org>; Tue, 02 Jul 2019 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yUuzp37iCnB2KhVBCUdvF8h9+Pe2HIdnEoFw7st3ZRM=;
 b=otnmJppHS3aw8N3+0j5IRmQcncVA8BX57vFBS3vlzxbP/R1WuEdeyVhEbC1iv2FVwY
 w+jwPaf0Wa5ZZkJVN9/aFqw5e222tsbIq5Ca716YzJitDBdnKVBmSxUwNZLja1sAHBO9
 s4DV7VpMTGPcyHoTLcA4KA4evZyJlcIgjLLj3jAvfVRiMgFQHAamyjsu8q+xEa8I/CUS
 4JdBCey4wCWaUGIYxfoPcwy8bLq0zma7G84nuRP6NV1+Yl8WIzRJBAQWQNnnUeFVSGA/
 iXqvGqHDxoAO77VU5tbLSSDDWnS3ygDKmc5S8yxp0oPEG7epMiCtthrFs1D61L9XuaNB
 wVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yUuzp37iCnB2KhVBCUdvF8h9+Pe2HIdnEoFw7st3ZRM=;
 b=kA5Vv80t5gk9amX5V6AqBMpKpghwyYbD3Ndu6cTU93/L9mCoUAD0UOkjdIgxTB3ZCJ
 mEA4DKnF56kIXwjJJwdati2kbVjTIS+f4ECZA+gtzY0Ye/kZGcwL/uc0n8WUXMprCO3f
 JPVOlLYDyMHcY1sRKwy4EvRjaBoGlM7Hb1blMUqE67AGzFdMfcrauqHrF5g9IlxOJWGc
 RUHAziRuZZZPPUQFnpspYvHUNZC2bbN5aXD0KiA1xb+Q2L7hx8yOH1Ic80zRSt6wWRcO
 nZvx/1+/4deITQKQQvVNGsBq2Xm+BN/81R7hOdpZBkd0UgdV7VGl8wuBWI8Jd7iEnePq
 +ENA==
X-Gm-Message-State: APjAAAV+xGD140FDUijsUB7nGR4Tty1I5jGeeYdPimznWZi6kQwgJiro
 2HakBK9/nbOdbvDSXfW5YEvoAg==
X-Google-Smtp-Source: APXvYqywIKI4Gdo0pH0yF64zqeyk69Zv6flxCDok7tZ06pG58/wcAFHnsy8SbZzU0XmxrW4S/sVSeQ==
X-Received: by 2002:adf:c508:: with SMTP id q8mr17972038wrf.148.1562055036940; 
 Tue, 02 Jul 2019 01:10:36 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id e4sm1608859wme.16.2019.07.02.01.10.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 01:10:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	broonie@kernel.org
Date: Tue,  2 Jul 2019 09:09:19 +0100
Message-Id: <20190702080920.22623-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
References: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 srini@kernel.org
Subject: [alsa-devel] [PATCH 5/6] ASoC: wcd934x: add capture dapm widgets
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds required dapm widgets for capture path.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 1297 ++++++++++++++++++++++++++++++++++++
 1 file changed, 1297 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index ad927208c505..285e816b5f8c 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -158,6 +158,20 @@
 	} \
 }
 
+enum {
+	MIC_BIAS_1 = 1,
+	MIC_BIAS_2,
+	MIC_BIAS_3,
+	MIC_BIAS_4
+};
+
+enum {
+	MICB_PULLUP_ENABLE,
+	MICB_PULLUP_DISABLE,
+	MICB_ENABLE,
+	MICB_DISABLE,
+};
+
 enum {
 	SIDO_SOURCE_INTERNAL,
 	SIDO_SOURCE_RCO_BG,
@@ -537,6 +551,22 @@ static const char * const rx_int8_2_interp_mux_text[] = {
 	"ZERO", "RX INT8_2 MUX",
 };
 
+static const char * const dmic_mux_text[] = {
+	"ZERO", "DMIC0", "DMIC1", "DMIC2", "DMIC3", "DMIC4", "DMIC5"
+};
+
+static const char * const amic_mux_text[] = {
+	"ZERO", "ADC1", "ADC2", "ADC3", "ADC4"
+};
+
+static const char * const amic4_5_sel_text[] = {
+	"AMIC4", "AMIC5"
+};
+
+static const char * const adc_mux_text[] = {
+	"DMIC", "AMIC", "ANC_FB_TUNE1", "ANC_FB_TUNE2"
+};
+
 static const char *const cdc_if_rx0_mux_text[] = {
 	"SLIM RX0", "I2S RX0"
 };
@@ -568,6 +598,68 @@ static const char *const cdc_if_rx6_mux_text[] = {
 static const char *const cdc_if_rx7_mux_text[] = {
 	"SLIM RX7", "I2S RX7"
 };
+
+static const char * const cdc_if_tx0_mux_text[] = {
+	"ZERO", "RX_MIX_TX0", "DEC0", "DEC0_192"
+};
+
+static const char * const cdc_if_tx1_mux_text[] = {
+	"ZERO", "RX_MIX_TX1", "DEC1", "DEC1_192"
+};
+
+static const char * const cdc_if_tx2_mux_text[] = {
+	"ZERO", "RX_MIX_TX2", "DEC2", "DEC2_192"
+};
+
+static const char * const cdc_if_tx3_mux_text[] = {
+	"ZERO", "RX_MIX_TX3", "DEC3", "DEC3_192"
+};
+
+static const char * const cdc_if_tx4_mux_text[] = {
+	"ZERO", "RX_MIX_TX4", "DEC4", "DEC4_192"
+};
+
+static const char * const cdc_if_tx5_mux_text[] = {
+	"ZERO", "RX_MIX_TX5", "DEC5", "DEC5_192"
+};
+
+static const char * const cdc_if_tx6_mux_text[] = {
+	"ZERO", "RX_MIX_TX6", "DEC6", "DEC6_192"
+};
+
+static const char * const cdc_if_tx7_mux_text[] = {
+	"ZERO", "RX_MIX_TX7", "DEC7", "DEC7_192"
+};
+
+static const char * const cdc_if_tx8_mux_text[] = {
+	"ZERO", "RX_MIX_TX8", "DEC8", "DEC8_192"
+};
+
+static const char * const cdc_if_tx9_mux_text[] = {
+	"ZERO", "DEC7", "DEC7_192"
+};
+
+static const char * const cdc_if_tx10_mux_text[] = {
+	"ZERO", "DEC6", "DEC6_192"
+};
+
+static const char * const cdc_if_tx11_mux_text[] = {
+	"DEC_0_5", "DEC_9_12", "MAD_AUDIO", "MAD_BRDCST"
+};
+
+static const char * const cdc_if_tx11_inp1_mux_text[] = {
+	"ZERO", "DEC0", "DEC1", "DEC2", "DEC3", "DEC4",
+	"DEC5", "RX_MIX_TX5", "DEC9_10", "DEC11_12"
+};
+
+static const char * const cdc_if_tx13_mux_text[] = {
+	"CDC_DEC_5", "MAD_BRDCST"
+};
+
+static const char * const cdc_if_tx13_inp1_mux_text[] = {
+	"ZERO", "DEC5", "DEC5_192"
+};
+
 static const struct soc_enum cf_dec0_enum =
 	SOC_ENUM_SINGLE(WCD934X_CDC_TX0_TX_PATH_CFG0, 5, 3, cf_text);
 
@@ -826,6 +918,35 @@ static const struct soc_enum rx_int2_dem_inp_mux_enum =
 	SOC_ENUM_SINGLE(WCD934X_CDC_RX2_RX_PATH_SEC0, 0,
 			ARRAY_SIZE(rx_int_dem_inp_mux_text),
 			rx_int_dem_inp_mux_text);
+
+static const struct soc_enum tx_adc_mux0_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0,
+			ARRAY_SIZE(adc_mux_text), adc_mux_text);
+static const struct soc_enum tx_adc_mux1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX1_CFG1, 0,
+			ARRAY_SIZE(adc_mux_text), adc_mux_text);
+static const struct soc_enum tx_adc_mux2_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX2_CFG1, 0,
+			ARRAY_SIZE(adc_mux_text), adc_mux_text);
+static const struct soc_enum tx_adc_mux3_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG1, 0,
+			ARRAY_SIZE(adc_mux_text), adc_mux_text);
+static const struct soc_enum tx_adc_mux4_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG1, 2,
+			ARRAY_SIZE(adc_mux_text), adc_mux_text);
+static const struct soc_enum tx_adc_mux5_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX1_CFG1, 2,
+			ARRAY_SIZE(adc_mux_text), adc_mux_text);
+static const struct soc_enum tx_adc_mux6_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX2_CFG1, 2,
+			ARRAY_SIZE(adc_mux_text), adc_mux_text);
+static const struct soc_enum tx_adc_mux7_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG1, 2,
+			ARRAY_SIZE(adc_mux_text), adc_mux_text);
+static const struct soc_enum tx_adc_mux8_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX1_CFG1, 4,
+			ARRAY_SIZE(adc_mux_text), adc_mux_text);
+
 static const struct soc_enum rx_int0_1_interp_mux_enum =
 	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2,
 			rx_int0_1_interp_mux_text);
@@ -871,6 +992,74 @@ static const struct soc_enum rx_int7_2_interp_mux_enum =
 static const struct soc_enum rx_int8_2_interp_mux_enum =
 	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int8_2_interp_mux_text);
 
+static const struct soc_enum tx_dmic_mux0_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG0, 3, 7,
+			dmic_mux_text);
+
+static const struct soc_enum tx_dmic_mux1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX1_CFG0, 3, 7,
+			dmic_mux_text);
+
+static const struct soc_enum tx_dmic_mux2_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX2_CFG0, 3, 7,
+			dmic_mux_text);
+
+static const struct soc_enum tx_dmic_mux3_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG0, 3, 7,
+			dmic_mux_text);
+
+static const struct soc_enum tx_dmic_mux4_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX4_CFG0, 3, 7,
+			dmic_mux_text);
+
+static const struct soc_enum tx_dmic_mux5_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX5_CFG0, 3, 7,
+			dmic_mux_text);
+
+static const struct soc_enum tx_dmic_mux6_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX6_CFG0, 3, 7,
+			dmic_mux_text);
+
+static const struct soc_enum tx_dmic_mux7_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX7_CFG0, 3, 7,
+			dmic_mux_text);
+
+static const struct soc_enum tx_dmic_mux8_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX8_CFG0, 3, 7,
+			dmic_mux_text);
+
+static const struct soc_enum tx_amic_mux0_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0, 5,
+			amic_mux_text);
+static const struct soc_enum tx_amic_mux1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0, 5,
+			amic_mux_text);
+static const struct soc_enum tx_amic_mux2_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX2_CFG0, 0, 5,
+			amic_mux_text);
+static const struct soc_enum tx_amic_mux3_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG0, 0, 5,
+			amic_mux_text);
+static const struct soc_enum tx_amic_mux4_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX4_CFG0, 0, 5,
+			amic_mux_text);
+static const struct soc_enum tx_amic_mux5_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX5_CFG0, 0, 5,
+			amic_mux_text);
+static const struct soc_enum tx_amic_mux6_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX6_CFG0, 0, 5,
+			amic_mux_text);
+static const struct soc_enum tx_amic_mux7_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX7_CFG0, 0, 5,
+			amic_mux_text);
+static const struct soc_enum tx_amic_mux8_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX_INP_MUX_ADC_MUX8_CFG0, 0, 5,
+			amic_mux_text);
+
+static const struct soc_enum tx_amic4_5_enum =
+	SOC_ENUM_SINGLE(WCD934X_TX_NEW_AMIC_4_5_SEL, 7, 2,
+			amic4_5_sel_text);
+
 static const struct soc_enum cdc_if_rx0_mux_enum =
 	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx0_mux_text);
 static const struct soc_enum cdc_if_rx1_mux_enum =
@@ -888,6 +1077,54 @@ static const struct soc_enum cdc_if_rx6_mux_enum =
 static const struct soc_enum cdc_if_rx7_mux_enum =
 	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx7_mux_text);
 
+static const struct soc_enum cdc_if_tx0_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG0, 0,
+			ARRAY_SIZE(cdc_if_tx0_mux_text), cdc_if_tx0_mux_text);
+static const struct soc_enum cdc_if_tx1_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG0, 2,
+			ARRAY_SIZE(cdc_if_tx1_mux_text), cdc_if_tx1_mux_text);
+static const struct soc_enum cdc_if_tx2_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG0, 4,
+			ARRAY_SIZE(cdc_if_tx2_mux_text), cdc_if_tx2_mux_text);
+static const struct soc_enum cdc_if_tx3_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG0, 6,
+			ARRAY_SIZE(cdc_if_tx3_mux_text), cdc_if_tx3_mux_text);
+static const struct soc_enum cdc_if_tx4_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG1, 0,
+			ARRAY_SIZE(cdc_if_tx4_mux_text), cdc_if_tx4_mux_text);
+static const struct soc_enum cdc_if_tx5_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG1, 2,
+			ARRAY_SIZE(cdc_if_tx5_mux_text), cdc_if_tx5_mux_text);
+static const struct soc_enum cdc_if_tx6_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG1, 4,
+			ARRAY_SIZE(cdc_if_tx6_mux_text), cdc_if_tx6_mux_text);
+static const struct soc_enum cdc_if_tx7_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG1, 6,
+			ARRAY_SIZE(cdc_if_tx7_mux_text), cdc_if_tx7_mux_text);
+static const struct soc_enum cdc_if_tx8_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG2, 0,
+			ARRAY_SIZE(cdc_if_tx8_mux_text), cdc_if_tx8_mux_text);
+static const struct soc_enum cdc_if_tx9_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG2, 2,
+			ARRAY_SIZE(cdc_if_tx9_mux_text), cdc_if_tx9_mux_text);
+static const struct soc_enum cdc_if_tx10_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG2, 4,
+			ARRAY_SIZE(cdc_if_tx10_mux_text), cdc_if_tx10_mux_text);
+static const struct soc_enum cdc_if_tx11_inp1_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG3, 0,
+			ARRAY_SIZE(cdc_if_tx11_inp1_mux_text),
+			cdc_if_tx11_inp1_mux_text);
+static const struct soc_enum cdc_if_tx11_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_DATA_HUB_SB_TX11_INP_CFG, 0,
+			ARRAY_SIZE(cdc_if_tx11_mux_text), cdc_if_tx11_mux_text);
+static const struct soc_enum cdc_if_tx13_inp1_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_IF_ROUTER_TX_MUX_CFG3, 4,
+			ARRAY_SIZE(cdc_if_tx13_inp1_mux_text),
+			cdc_if_tx13_inp1_mux_text);
+static const struct soc_enum cdc_if_tx13_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_DATA_HUB_SB_TX13_INP_CFG, 0,
+			ARRAY_SIZE(cdc_if_tx13_mux_text), cdc_if_tx13_mux_text);
+
 static void wcd934x_update_reg_defaults(struct wcd934x_codec *wcd)
 {
 	struct regmap *rm = wcd->regmap;
@@ -2503,6 +2740,63 @@ static int wcd934x_int_dem_inp_mux_put(struct snd_kcontrol *kc,
 	return ret;
 }
 
+static int wcd934x_dec_enum_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int val;
+	u16 mic_sel_reg = 0;
+	u8 mic_sel;
+
+	comp = snd_soc_dapm_kcontrol_component(kcontrol);
+
+	val = ucontrol->value.enumerated.item[0];
+	if (val > e->items - 1)
+		return -EINVAL;
+
+	switch (e->reg) {
+	case WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG1:
+		if (e->shift_l == 0)
+			mic_sel_reg = WCD934X_CDC_TX0_TX_PATH_CFG0;
+		else if (e->shift_l == 2)
+			mic_sel_reg = WCD934X_CDC_TX4_TX_PATH_CFG0;
+		else if (e->shift_l == 4)
+			mic_sel_reg = WCD934X_CDC_TX8_TX_PATH_CFG0;
+		break;
+	case WCD934X_CDC_TX_INP_MUX_ADC_MUX1_CFG1:
+		if (e->shift_l == 0)
+			mic_sel_reg = WCD934X_CDC_TX1_TX_PATH_CFG0;
+		else if (e->shift_l == 2)
+			mic_sel_reg = WCD934X_CDC_TX5_TX_PATH_CFG0;
+		break;
+	case WCD934X_CDC_TX_INP_MUX_ADC_MUX2_CFG1:
+		if (e->shift_l == 0)
+			mic_sel_reg = WCD934X_CDC_TX2_TX_PATH_CFG0;
+		else if (e->shift_l == 2)
+			mic_sel_reg = WCD934X_CDC_TX6_TX_PATH_CFG0;
+		break;
+	case WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG1:
+		if (e->shift_l == 0)
+			mic_sel_reg = WCD934X_CDC_TX3_TX_PATH_CFG0;
+		else if (e->shift_l == 2)
+			mic_sel_reg = WCD934X_CDC_TX7_TX_PATH_CFG0;
+		break;
+	default:
+		dev_err(comp->dev, "%s: e->reg: 0x%x not expected\n",
+			__func__, e->reg);
+		return -EINVAL;
+	}
+
+	/* ADC: 0, DMIC: 1 */
+	mic_sel = val ? 0x0 : 0x1;
+	if (mic_sel_reg)
+		snd_soc_component_update_bits(comp, mic_sel_reg, BIT(7),
+					      mic_sel << 7);
+
+	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+}
+
 static const struct snd_kcontrol_new rx_int0_2_mux =
 	SOC_DAPM_ENUM("RX INT0_2 MUX Mux", rx_int0_2_mux_chain_enum);
 
@@ -2715,6 +3009,91 @@ static const struct snd_kcontrol_new rx_int7_2_interp_mux =
 static const struct snd_kcontrol_new rx_int8_2_interp_mux =
 	SOC_DAPM_ENUM("RX INT8_2 INTERP Mux", rx_int8_2_interp_mux_enum);
 
+static const struct snd_kcontrol_new tx_dmic_mux0 =
+	SOC_DAPM_ENUM("DMIC MUX0 Mux", tx_dmic_mux0_enum);
+
+static const struct snd_kcontrol_new tx_dmic_mux1 =
+	SOC_DAPM_ENUM("DMIC MUX1 Mux", tx_dmic_mux1_enum);
+
+static const struct snd_kcontrol_new tx_dmic_mux2 =
+	SOC_DAPM_ENUM("DMIC MUX2 Mux", tx_dmic_mux2_enum);
+
+static const struct snd_kcontrol_new tx_dmic_mux3 =
+	SOC_DAPM_ENUM("DMIC MUX3 Mux", tx_dmic_mux3_enum);
+
+static const struct snd_kcontrol_new tx_dmic_mux4 =
+	SOC_DAPM_ENUM("DMIC MUX4 Mux", tx_dmic_mux4_enum);
+
+static const struct snd_kcontrol_new tx_dmic_mux5 =
+	SOC_DAPM_ENUM("DMIC MUX5 Mux", tx_dmic_mux5_enum);
+
+static const struct snd_kcontrol_new tx_dmic_mux6 =
+	SOC_DAPM_ENUM("DMIC MUX6 Mux", tx_dmic_mux6_enum);
+
+static const struct snd_kcontrol_new tx_dmic_mux7 =
+	SOC_DAPM_ENUM("DMIC MUX7 Mux", tx_dmic_mux7_enum);
+
+static const struct snd_kcontrol_new tx_dmic_mux8 =
+	SOC_DAPM_ENUM("DMIC MUX8 Mux", tx_dmic_mux8_enum);
+
+static const struct snd_kcontrol_new tx_amic_mux0 =
+	SOC_DAPM_ENUM("AMIC MUX0 Mux", tx_amic_mux0_enum);
+
+static const struct snd_kcontrol_new tx_amic_mux1 =
+	SOC_DAPM_ENUM("AMIC MUX1 Mux", tx_amic_mux1_enum);
+
+static const struct snd_kcontrol_new tx_amic_mux2 =
+	SOC_DAPM_ENUM("AMIC MUX2 Mux", tx_amic_mux2_enum);
+
+static const struct snd_kcontrol_new tx_amic_mux3 =
+	SOC_DAPM_ENUM("AMIC MUX3 Mux", tx_amic_mux3_enum);
+
+static const struct snd_kcontrol_new tx_amic_mux4 =
+	SOC_DAPM_ENUM("AMIC MUX4 Mux", tx_amic_mux4_enum);
+
+static const struct snd_kcontrol_new tx_amic_mux5 =
+	SOC_DAPM_ENUM("AMIC MUX5 Mux", tx_amic_mux5_enum);
+
+static const struct snd_kcontrol_new tx_amic_mux6 =
+	SOC_DAPM_ENUM("AMIC MUX6 Mux", tx_amic_mux6_enum);
+
+static const struct snd_kcontrol_new tx_amic_mux7 =
+	SOC_DAPM_ENUM("AMIC MUX7 Mux", tx_amic_mux7_enum);
+
+static const struct snd_kcontrol_new tx_amic_mux8 =
+	SOC_DAPM_ENUM("AMIC MUX8 Mux", tx_amic_mux8_enum);
+
+static const struct snd_kcontrol_new tx_amic4_5 =
+	SOC_DAPM_ENUM("AMIC4_5 SEL Mux", tx_amic4_5_enum);
+
+static const struct snd_kcontrol_new tx_adc_mux0_mux =
+	SOC_DAPM_ENUM_EXT("ADC MUX0 Mux", tx_adc_mux0_enum,
+			  snd_soc_dapm_get_enum_double, wcd934x_dec_enum_put);
+static const struct snd_kcontrol_new tx_adc_mux1_mux =
+	SOC_DAPM_ENUM_EXT("ADC MUX1 Mux", tx_adc_mux1_enum,
+			  snd_soc_dapm_get_enum_double, wcd934x_dec_enum_put);
+static const struct snd_kcontrol_new tx_adc_mux2_mux =
+	SOC_DAPM_ENUM_EXT("ADC MUX2 Mux", tx_adc_mux2_enum,
+			  snd_soc_dapm_get_enum_double, wcd934x_dec_enum_put);
+static const struct snd_kcontrol_new tx_adc_mux3_mux =
+	SOC_DAPM_ENUM_EXT("ADC MUX3 Mux", tx_adc_mux3_enum,
+			  snd_soc_dapm_get_enum_double, wcd934x_dec_enum_put);
+static const struct snd_kcontrol_new tx_adc_mux4_mux =
+	SOC_DAPM_ENUM_EXT("ADC MUX4 Mux", tx_adc_mux4_enum,
+			  snd_soc_dapm_get_enum_double, wcd934x_dec_enum_put);
+static const struct snd_kcontrol_new tx_adc_mux5_mux =
+	SOC_DAPM_ENUM_EXT("ADC MUX5 Mux", tx_adc_mux5_enum,
+			  snd_soc_dapm_get_enum_double, wcd934x_dec_enum_put);
+static const struct snd_kcontrol_new tx_adc_mux6_mux =
+	SOC_DAPM_ENUM_EXT("ADC MUX6 Mux", tx_adc_mux6_enum,
+			  snd_soc_dapm_get_enum_double, wcd934x_dec_enum_put);
+static const struct snd_kcontrol_new tx_adc_mux7_mux =
+	SOC_DAPM_ENUM_EXT("ADC MUX7 Mux", tx_adc_mux7_enum,
+			  snd_soc_dapm_get_enum_double, wcd934x_dec_enum_put);
+static const struct snd_kcontrol_new tx_adc_mux8_mux =
+	SOC_DAPM_ENUM_EXT("ADC MUX8 Mux", tx_adc_mux8_enum,
+			  snd_soc_dapm_get_enum_double, wcd934x_dec_enum_put);
+
 static const struct snd_kcontrol_new cdc_if_rx0_mux =
 	SOC_DAPM_ENUM("CDC_IF RX0 MUX Mux", cdc_if_rx0_mux_enum);
 static const struct snd_kcontrol_new cdc_if_rx1_mux =
@@ -2732,6 +3111,171 @@ static const struct snd_kcontrol_new cdc_if_rx6_mux =
 static const struct snd_kcontrol_new cdc_if_rx7_mux =
 	SOC_DAPM_ENUM("CDC_IF RX7 MUX Mux", cdc_if_rx7_mux_enum);
 
+static const struct snd_kcontrol_new cdc_if_tx0_mux =
+	SOC_DAPM_ENUM("CDC_IF TX0 MUX Mux", cdc_if_tx0_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx1_mux =
+	SOC_DAPM_ENUM("CDC_IF TX1 MUX Mux", cdc_if_tx1_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx2_mux =
+	SOC_DAPM_ENUM("CDC_IF TX2 MUX Mux", cdc_if_tx2_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx3_mux =
+	SOC_DAPM_ENUM("CDC_IF TX3 MUX Mux", cdc_if_tx3_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx4_mux =
+	SOC_DAPM_ENUM("CDC_IF TX4 MUX Mux", cdc_if_tx4_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx5_mux =
+	SOC_DAPM_ENUM("CDC_IF TX5 MUX Mux", cdc_if_tx5_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx6_mux =
+	SOC_DAPM_ENUM("CDC_IF TX6 MUX Mux", cdc_if_tx6_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx7_mux =
+	SOC_DAPM_ENUM("CDC_IF TX7 MUX Mux", cdc_if_tx7_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx8_mux =
+	SOC_DAPM_ENUM("CDC_IF TX8 MUX Mux", cdc_if_tx8_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx9_mux =
+	SOC_DAPM_ENUM("CDC_IF TX9 MUX Mux", cdc_if_tx9_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx10_mux =
+	SOC_DAPM_ENUM("CDC_IF TX10 MUX Mux", cdc_if_tx10_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx11_mux =
+	SOC_DAPM_ENUM("CDC_IF TX11 MUX Mux", cdc_if_tx11_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx11_inp1_mux =
+	SOC_DAPM_ENUM("CDC_IF TX11 INP1 MUX Mux", cdc_if_tx11_inp1_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx13_mux =
+	SOC_DAPM_ENUM("CDC_IF TX13 MUX Mux", cdc_if_tx13_mux_enum);
+static const struct snd_kcontrol_new cdc_if_tx13_inp1_mux =
+	SOC_DAPM_ENUM("CDC_IF TX13 INP1 MUX Mux", cdc_if_tx13_inp1_mux_enum);
+
+static int slim_tx_mixer_get(struct snd_kcontrol *kc,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kc);
+	struct wcd934x_codec *wcd = dev_get_drvdata(dapm->dev);
+
+	ucontrol->value.integer.value[0] = wcd->tx_port_value;
+
+	return 0;
+}
+
+static int slim_tx_mixer_put(struct snd_kcontrol *kc,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kc);
+	struct wcd934x_codec *wcd = dev_get_drvdata(widget->dapm->dev);
+	struct snd_soc_dapm_update *update = NULL;
+	struct soc_mixer_control *mixer =
+			(struct soc_mixer_control *)kc->private_value;
+	int enable = ucontrol->value.integer.value[0];
+	int dai_id = widget->shift;
+	int port_id = mixer->shift;
+
+	switch (dai_id) {
+	case AIF1_CAP:
+	case AIF2_CAP:
+	case AIF3_CAP:
+		/* only add to the list if value not set */
+		if (enable && !(wcd->tx_port_value & BIT(port_id))) {
+			wcd->tx_port_value |= BIT(port_id);
+			list_add_tail(&wcd->tx_chs[port_id].list,
+				      &wcd->dai[dai_id].slim_ch_list);
+		} else if (!enable && (wcd->tx_port_value & BIT(port_id))) {
+			wcd->tx_port_value &= ~BIT(port_id);
+			list_del_init(&wcd->tx_chs[port_id].list);
+		}
+		break;
+	default:
+		dev_err(wcd->dev, "Unknown AIF %d\n", dai_id);
+		return -EINVAL;
+	}
+
+	snd_soc_dapm_mixer_update_power(widget->dapm, kc, enable, update);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new aif1_slim_cap_mixer[] = {
+	SOC_SINGLE_EXT("SLIM TX0", SND_SOC_NOPM, WCD934X_TX0, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX1", SND_SOC_NOPM, WCD934X_TX1, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX2", SND_SOC_NOPM, WCD934X_TX2, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX3", SND_SOC_NOPM, WCD934X_TX3, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX4", SND_SOC_NOPM, WCD934X_TX4, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX5", SND_SOC_NOPM, WCD934X_TX5, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX6", SND_SOC_NOPM, WCD934X_TX6, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX7", SND_SOC_NOPM, WCD934X_TX7, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX8", SND_SOC_NOPM, WCD934X_TX8, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX9", SND_SOC_NOPM, WCD934X_TX9, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX10", SND_SOC_NOPM, WCD934X_TX10, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX11", SND_SOC_NOPM, WCD934X_TX11, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX13", SND_SOC_NOPM, WCD934X_TX13, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+};
+
+static const struct snd_kcontrol_new aif2_slim_cap_mixer[] = {
+	SOC_SINGLE_EXT("SLIM TX0", SND_SOC_NOPM, WCD934X_TX0, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX1", SND_SOC_NOPM, WCD934X_TX1, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX2", SND_SOC_NOPM, WCD934X_TX2, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX3", SND_SOC_NOPM, WCD934X_TX3, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX4", SND_SOC_NOPM, WCD934X_TX4, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX5", SND_SOC_NOPM, WCD934X_TX5, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX6", SND_SOC_NOPM, WCD934X_TX6, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX7", SND_SOC_NOPM, WCD934X_TX7, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX8", SND_SOC_NOPM, WCD934X_TX8, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX9", SND_SOC_NOPM, WCD934X_TX9, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX10", SND_SOC_NOPM, WCD934X_TX10, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX11", SND_SOC_NOPM, WCD934X_TX11, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX13", SND_SOC_NOPM, WCD934X_TX13, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+};
+
+static const struct snd_kcontrol_new aif3_slim_cap_mixer[] = {
+	SOC_SINGLE_EXT("SLIM TX0", SND_SOC_NOPM, WCD934X_TX0, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX1", SND_SOC_NOPM, WCD934X_TX1, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX2", SND_SOC_NOPM, WCD934X_TX2, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX3", SND_SOC_NOPM, WCD934X_TX3, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX4", SND_SOC_NOPM, WCD934X_TX4, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX5", SND_SOC_NOPM, WCD934X_TX5, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX6", SND_SOC_NOPM, WCD934X_TX6, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX7", SND_SOC_NOPM, WCD934X_TX7, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX8", SND_SOC_NOPM, WCD934X_TX8, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX9", SND_SOC_NOPM, WCD934X_TX9, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX10", SND_SOC_NOPM, WCD934X_TX10, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX11", SND_SOC_NOPM, WCD934X_TX11, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+	SOC_SINGLE_EXT("SLIM TX13", SND_SOC_NOPM, WCD934X_TX13, 1, 0,
+		       slim_tx_mixer_get, slim_tx_mixer_put),
+};
+
 static const struct snd_kcontrol_new wcd934x_snd_controls[] = {
 	/* Gain Controls */
 	SOC_SINGLE_TLV("EAR PA Volume", WCD934X_ANA_EAR, 4, 4, 1, ear_pa_gain),
@@ -3673,6 +4217,571 @@ static int wcd934x_codec_enable_rx_bias(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static u32 wcd934x_get_dmic_sample_rate(struct snd_soc_component *comp,
+					unsigned int dmic,
+				      struct wcd934x_codec *wcd)
+{
+	u8 tx_stream_fs;
+	u8 adc_mux_index = 0, adc_mux_sel = 0;
+	bool dec_found = false;
+	u16 adc_mux_ctl_reg, tx_fs_reg;
+	u32 dmic_fs;
+
+	while (dec_found == 0 && adc_mux_index < WCD934X_MAX_VALID_ADC_MUX) {
+		if (adc_mux_index < 4) {
+			adc_mux_ctl_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG0 +
+						(adc_mux_index * 2);
+		} else if (adc_mux_index < WCD934X_INVALID_ADC_MUX) {
+			adc_mux_ctl_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX4_CFG0 +
+						adc_mux_index - 4;
+		} else if (adc_mux_index == WCD934X_INVALID_ADC_MUX) {
+			++adc_mux_index;
+			continue;
+		}
+		adc_mux_sel = ((snd_soc_component_read32(comp, adc_mux_ctl_reg)
+			       & 0xF8) >> 3) - 1;
+
+		if (adc_mux_sel == dmic) {
+			dec_found = true;
+			break;
+		}
+
+		++adc_mux_index;
+	}
+
+	if (dec_found && adc_mux_index <= 8) {
+		tx_fs_reg = WCD934X_CDC_TX0_TX_PATH_CTL + (16 * adc_mux_index);
+		tx_stream_fs = snd_soc_component_read32(comp, tx_fs_reg) & 0x0F;
+		if (tx_stream_fs <= 4)  {
+			if (wcd->dmic_sample_rate <=
+					WCD9XXX_DMIC_SAMPLE_RATE_2P4MHZ)
+				dmic_fs = wcd->dmic_sample_rate;
+			else
+				dmic_fs = WCD9XXX_DMIC_SAMPLE_RATE_2P4MHZ;
+		} else
+			dmic_fs = WCD9XXX_DMIC_SAMPLE_RATE_4P8MHZ;
+	} else {
+		dmic_fs = wcd->dmic_sample_rate;
+	}
+
+	return dmic_fs;
+}
+
+static u8 wcd934x_get_dmic_clk_val(struct snd_soc_component *comp,
+				   u32 mclk_rate, u32 dmic_clk_rate)
+{
+	u32 div_factor;
+	u8 dmic_ctl_val;
+
+	/* Default value to return in case of error */
+	if (mclk_rate == WCD934X_MCLK_CLK_9P6MHZ)
+		dmic_ctl_val = WCD934X_DMIC_CLK_DIV_2;
+	else
+		dmic_ctl_val = WCD934X_DMIC_CLK_DIV_3;
+
+	if (dmic_clk_rate == 0) {
+		dev_err(comp->dev,
+			"%s: dmic_sample_rate cannot be 0\n",
+			__func__);
+		goto done;
+	}
+
+	div_factor = mclk_rate / dmic_clk_rate;
+	switch (div_factor) {
+	case 2:
+		dmic_ctl_val = WCD934X_DMIC_CLK_DIV_2;
+		break;
+	case 3:
+		dmic_ctl_val = WCD934X_DMIC_CLK_DIV_3;
+		break;
+	case 4:
+		dmic_ctl_val = WCD934X_DMIC_CLK_DIV_4;
+		break;
+	case 6:
+		dmic_ctl_val = WCD934X_DMIC_CLK_DIV_6;
+		break;
+	case 8:
+		dmic_ctl_val = WCD934X_DMIC_CLK_DIV_8;
+		break;
+	case 16:
+		dmic_ctl_val = WCD934X_DMIC_CLK_DIV_16;
+		break;
+	default:
+		dev_err(comp->dev,
+			"%s: Invalid div_factor %u, clk_rate(%u), dmic_rate(%u)\n",
+			__func__, div_factor, mclk_rate, dmic_clk_rate);
+		break;
+	}
+
+done:
+	return dmic_ctl_val;
+}
+
+static int wcd934x_codec_enable_dmic(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	u8  dmic_clk_en = 0x01;
+	u16 dmic_clk_reg;
+	s32 *dmic_clk_cnt;
+	u8 dmic_rate_val, dmic_rate_shift = 1;
+	unsigned int dmic;
+	u32 dmic_sample_rate;
+	int ret;
+	char *wname;
+
+	wname = strpbrk(w->name, "012345");
+	if (!wname) {
+		dev_err(comp->dev, "%s: widget not found\n", __func__);
+		return -EINVAL;
+	}
+
+	ret = kstrtouint(wname, 10, &dmic);
+	if (ret < 0) {
+		dev_err(comp->dev, "%s: Invalid DMIC line on the codec\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	switch (dmic) {
+	case 0:
+	case 1:
+		dmic_clk_cnt = &wcd->dmic_0_1_clk_cnt;
+		dmic_clk_reg = WCD934X_CPE_SS_DMIC0_CTL;
+		break;
+	case 2:
+	case 3:
+		dmic_clk_cnt = &wcd->dmic_2_3_clk_cnt;
+		dmic_clk_reg = WCD934X_CPE_SS_DMIC1_CTL;
+		break;
+	case 4:
+	case 5:
+		dmic_clk_cnt = &wcd->dmic_4_5_clk_cnt;
+		dmic_clk_reg = WCD934X_CPE_SS_DMIC2_CTL;
+		break;
+	default:
+		dev_err(comp->dev, "%s: Invalid DMIC Selection\n",
+			__func__);
+		return -EINVAL;
+	};
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dmic_sample_rate = wcd934x_get_dmic_sample_rate(comp, dmic,
+								wcd);
+		dmic_rate_val =
+			wcd934x_get_dmic_clk_val(comp,
+						 wcd->rate,
+					       dmic_sample_rate);
+		(*dmic_clk_cnt)++;
+		if (*dmic_clk_cnt == 1) {
+			snd_soc_component_update_bits(comp, dmic_clk_reg,
+						      0x07 << dmic_rate_shift,
+					    dmic_rate_val << dmic_rate_shift);
+			snd_soc_component_update_bits(comp, dmic_clk_reg,
+						      dmic_clk_en, dmic_clk_en);
+		}
+
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		dmic_rate_val =	wcd934x_get_dmic_clk_val(comp,
+						 wcd->rate,
+					       wcd->mad_dmic_sample_rate);
+		(*dmic_clk_cnt)--;
+		if (*dmic_clk_cnt  == 0) {
+			snd_soc_component_update_bits(comp, dmic_clk_reg,
+						      dmic_clk_en, 0);
+			snd_soc_component_update_bits(comp, dmic_clk_reg,
+						      0x07 << dmic_rate_shift,
+					    dmic_rate_val << dmic_rate_shift);
+		}
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_find_amic_input(struct snd_soc_component *comp,
+					 int adc_mux_n)
+{
+	u16 mask, shift, adc_mux_in_reg;
+	u16 amic_mux_sel_reg;
+	bool is_amic;
+
+	if (adc_mux_n < 0 || adc_mux_n > WCD934X_MAX_VALID_ADC_MUX ||
+	    adc_mux_n == WCD934X_INVALID_ADC_MUX)
+		return 0;
+
+	if (adc_mux_n < 3) {
+		adc_mux_in_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG1 +
+				 adc_mux_n;
+		mask = 0x03;
+		shift = 0;
+		amic_mux_sel_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG0 +
+				   2 * adc_mux_n;
+	} else if (adc_mux_n < 4) {
+		adc_mux_in_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG1;
+		mask = 0x03;
+		shift = 0;
+		amic_mux_sel_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG0 +
+				   2 * adc_mux_n;
+	} else if (adc_mux_n < 7) {
+		adc_mux_in_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG1 +
+				 (adc_mux_n - 4);
+		mask = 0x0C;
+		shift = 2;
+		amic_mux_sel_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX4_CFG0 +
+				   adc_mux_n - 4;
+	} else if (adc_mux_n < 8) {
+		adc_mux_in_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG1;
+		mask = 0x0C;
+		shift = 2;
+		amic_mux_sel_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX4_CFG0 +
+				   adc_mux_n - 4;
+	} else if (adc_mux_n < 12) {
+		adc_mux_in_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG1 +
+				 ((adc_mux_n == 8) ? (adc_mux_n - 8) :
+				  (adc_mux_n - 9));
+		mask = 0x30;
+		shift = 4;
+		amic_mux_sel_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX4_CFG0 +
+				   adc_mux_n - 4;
+	} else if (adc_mux_n < 13) {
+		adc_mux_in_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG1;
+		mask = 0x30;
+		shift = 4;
+		amic_mux_sel_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX4_CFG0 +
+				   adc_mux_n - 4;
+	} else {
+		adc_mux_in_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG1;
+		mask = 0xC0;
+		shift = 6;
+		amic_mux_sel_reg = WCD934X_CDC_TX_INP_MUX_ADC_MUX4_CFG0 +
+				   adc_mux_n - 4;
+	}
+
+	is_amic = (((snd_soc_component_read32(comp, adc_mux_in_reg)
+		     & mask) >> shift) == 1);
+	if (!is_amic)
+		return 0;
+
+	return snd_soc_component_read32(comp, amic_mux_sel_reg) & 0x07;
+}
+
+static u16 wcd934x_codec_get_amic_pwlvl_reg(struct snd_soc_component *comp,
+					    int amic)
+{
+	u16 pwr_level_reg = 0;
+
+	switch (amic) {
+	case 1:
+	case 2:
+		pwr_level_reg = WCD934X_ANA_AMIC1;
+		break;
+
+	case 3:
+	case 4:
+		pwr_level_reg = WCD934X_ANA_AMIC3;
+		break;
+	default:
+		break;
+	}
+
+	return pwr_level_reg;
+}
+
+static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
+				    struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	unsigned int decimator;
+	char *dec_adc_mux_name = NULL;
+	char *widget_name = NULL;
+	char *wname;
+	int ret = 0, amic_n;
+	u16 tx_vol_ctl_reg, pwr_level_reg = 0, dec_cfg_reg, hpf_gate_reg;
+	u16 tx_gain_ctl_reg;
+	char *dec;
+	u8 hpf_coff_freq;
+
+	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
+	if (!widget_name)
+		return -ENOMEM;
+
+	wname = widget_name;
+	dec_adc_mux_name = strsep(&widget_name, " ");
+	if (!dec_adc_mux_name) {
+		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
+			__func__, w->name);
+		ret =  -EINVAL;
+		goto out;
+	}
+	dec_adc_mux_name = widget_name;
+
+	dec = strpbrk(dec_adc_mux_name, "012345678");
+	if (!dec) {
+		dev_err(comp->dev, "%s: decimator index not found\n",
+			__func__);
+		ret =  -EINVAL;
+		goto out;
+	}
+
+	ret = kstrtouint(dec, 10, &decimator);
+	if (ret < 0) {
+		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
+			__func__, wname);
+		ret =  -EINVAL;
+		goto out;
+	}
+
+	tx_vol_ctl_reg = WCD934X_CDC_TX0_TX_PATH_CTL + 16 * decimator;
+	hpf_gate_reg = WCD934X_CDC_TX0_TX_PATH_SEC2 + 16 * decimator;
+	dec_cfg_reg = WCD934X_CDC_TX0_TX_PATH_CFG0 + 16 * decimator;
+	tx_gain_ctl_reg = WCD934X_CDC_TX0_TX_VOL_CTL + 16 * decimator;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		amic_n = wcd934x_codec_find_amic_input(comp, decimator);
+		if (amic_n)
+			pwr_level_reg = wcd934x_codec_get_amic_pwlvl_reg(comp,
+								 amic_n);
+
+		if (pwr_level_reg) {
+			switch ((snd_soc_component_read32(comp, pwr_level_reg) &
+					      WCD934X_AMIC_PWR_LVL_MASK) >>
+					      WCD934X_AMIC_PWR_LVL_SHIFT) {
+			case WCD934X_AMIC_PWR_LEVEL_LP:
+				snd_soc_component_update_bits(comp, dec_cfg_reg,
+						WCD934X_DEC_PWR_LVL_MASK,
+						WCD934X_DEC_PWR_LVL_LP);
+				break;
+
+			case WCD934X_AMIC_PWR_LEVEL_HP:
+				snd_soc_component_update_bits(comp, dec_cfg_reg,
+						WCD934X_DEC_PWR_LVL_MASK,
+						WCD934X_DEC_PWR_LVL_HP);
+				break;
+			case WCD934X_AMIC_PWR_LEVEL_DEFAULT:
+			case WCD934X_AMIC_PWR_LEVEL_HYBRID:
+			default:
+				snd_soc_component_update_bits(comp, dec_cfg_reg,
+						WCD934X_DEC_PWR_LVL_MASK,
+						WCD934X_DEC_PWR_LVL_DF);
+				break;
+			}
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		hpf_coff_freq = (snd_soc_component_read32(comp, dec_cfg_reg) &
+				 TX_HPF_CUT_OFF_FREQ_MASK) >> 5;
+		if (hpf_coff_freq != CF_MIN_3DB_150HZ) {
+			snd_soc_component_update_bits(comp, dec_cfg_reg,
+						      TX_HPF_CUT_OFF_FREQ_MASK,
+						      CF_MIN_3DB_150HZ << 5);
+			snd_soc_component_update_bits(comp, hpf_gate_reg,
+						      0x02, 0x02);
+			/*
+			 * Minimum 1 clk cycle delay is required as per
+			 * HW spec.
+			 */
+			usleep_range(1000, 1010);
+			snd_soc_component_update_bits(comp, hpf_gate_reg,
+						      0x02, 0x00);
+		}
+		/* apply gain after decimator is enabled */
+		snd_soc_component_write(comp, tx_gain_ctl_reg,
+					snd_soc_component_read32(comp,
+							 tx_gain_ctl_reg));
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		hpf_coff_freq = (snd_soc_component_read32(comp, dec_cfg_reg) &
+				 TX_HPF_CUT_OFF_FREQ_MASK) >> 5;
+
+			if (hpf_coff_freq != CF_MIN_3DB_150HZ) {
+				snd_soc_component_update_bits(comp, dec_cfg_reg,
+						TX_HPF_CUT_OFF_FREQ_MASK,
+						hpf_coff_freq << 5);
+				snd_soc_component_update_bits(comp,
+							      hpf_gate_reg,
+							      0x02, 0x02);
+				/*
+				 * Minimum 1 clk cycle delay is required as per
+				 * HW spec.
+				 */
+				usleep_range(1000, 1010);
+				snd_soc_component_update_bits(comp,
+							      hpf_gate_reg,
+							      0x02, 0x00);
+			}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(comp, tx_vol_ctl_reg, 0x10, 0x00);
+		snd_soc_component_update_bits(comp, dec_cfg_reg,
+					      WCD934X_DEC_PWR_LVL_MASK,
+				    WCD934X_DEC_PWR_LVL_DF);
+		break;
+	};
+out:
+	kfree(wname);
+	return ret;
+}
+
+static void wcd934x_codec_set_tx_hold(struct snd_soc_component *comp,
+				      u16 amic_reg, bool set)
+{
+	u8 mask = 0x20;
+	u8 val;
+
+	if (amic_reg == WCD934X_ANA_AMIC1 ||
+	    amic_reg == WCD934X_ANA_AMIC3)
+		mask = 0x40;
+
+	val = set ? mask : 0x00;
+
+	switch (amic_reg) {
+	case WCD934X_ANA_AMIC1:
+	case WCD934X_ANA_AMIC2:
+		snd_soc_component_update_bits(comp, WCD934X_ANA_AMIC2,
+					      mask, val);
+		break;
+	case WCD934X_ANA_AMIC3:
+	case WCD934X_ANA_AMIC4:
+		snd_soc_component_update_bits(comp, WCD934X_ANA_AMIC4,
+					      mask, val);
+		break;
+	default:
+		break;
+	}
+}
+
+static int wcd934x_codec_enable_adc(struct snd_soc_dapm_widget *w,
+				    struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd934x_codec_set_tx_hold(comp, w->reg, true);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd934x_micbias_control(struct snd_soc_component *comp,
+				   int micb_num, int req, bool is_dapm)
+{
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	int micb_index = micb_num - 1;
+	u16 micb_reg;
+
+	if ((micb_index < 0) || (micb_index > WCD934X_MAX_MICBIAS - 1)) {
+		dev_err(comp->dev, "%s: Invalid micbias index, micb_ind:%d\n",
+			__func__, micb_index);
+		return -EINVAL;
+	}
+
+	switch (micb_num) {
+	case MIC_BIAS_1:
+		micb_reg = WCD934X_ANA_MICB1;
+		break;
+	case MIC_BIAS_2:
+		micb_reg = WCD934X_ANA_MICB2;
+		break;
+	case MIC_BIAS_3:
+		micb_reg = WCD934X_ANA_MICB3;
+		break;
+	case MIC_BIAS_4:
+		micb_reg = WCD934X_ANA_MICB4;
+		break;
+	default:
+		dev_err(comp->dev, "%s: Invalid micbias number: %d\n",
+			__func__, micb_num);
+		return -EINVAL;
+	}
+
+	switch (req) {
+	case MICB_PULLUP_ENABLE:
+		wcd->pullup_ref[micb_index]++;
+		if ((wcd->pullup_ref[micb_index] == 1) &&
+		    (wcd->micb_ref[micb_index] == 0)) {
+			snd_soc_component_update_bits(comp, micb_reg,
+						      0xC0, 0x80);
+		}
+		break;
+	case MICB_PULLUP_DISABLE:
+		if (wcd->pullup_ref[micb_index] > 0)
+			wcd->pullup_ref[micb_index]--;
+		if ((wcd->pullup_ref[micb_index] == 0) &&
+		    (wcd->micb_ref[micb_index] == 0))
+			snd_soc_component_update_bits(comp, micb_reg,
+						      0xC0, 0x00);
+		break;
+	case MICB_ENABLE:
+		wcd->micb_ref[micb_index]++;
+		if (wcd->micb_ref[micb_index] == 1)
+			snd_soc_component_update_bits(comp, micb_reg,
+						      0xC0, 0x40);
+		break;
+	case MICB_DISABLE:
+		if (wcd->micb_ref[micb_index] > 0)
+			wcd->micb_ref[micb_index]--;
+		if ((wcd->micb_ref[micb_index] == 0) &&
+		    (wcd->pullup_ref[micb_index] > 0))
+			snd_soc_component_update_bits(comp, micb_reg,
+						      0xC0, 0x80);
+		else if ((wcd->micb_ref[micb_index] == 0) &&
+			 (wcd->pullup_ref[micb_index] == 0)) {
+			snd_soc_component_update_bits(comp, micb_reg,
+						      0xC0, 0x00);
+		}
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	int micb_num;
+
+	if (strnstr(w->name, "MIC BIAS1", sizeof("MIC BIAS1")))
+		micb_num = MIC_BIAS_1;
+	else if (strnstr(w->name, "MIC BIAS2", sizeof("MIC BIAS2")))
+		micb_num = MIC_BIAS_2;
+	else if (strnstr(w->name, "MIC BIAS3", sizeof("MIC BIAS3")))
+		micb_num = MIC_BIAS_3;
+	else if (strnstr(w->name, "MIC BIAS4", sizeof("MIC BIAS4")))
+		micb_num = MIC_BIAS_4;
+	else
+		return -EINVAL;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/*
+		 * MIC BIAS can also be requested by MBHC,
+		 * so use ref count to handle micbias pullup
+		 * and enable requests
+		 */
+		wcd934x_micbias_control(comp, micb_num, MICB_ENABLE, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* wait for cnp time */
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd934x_micbias_control(comp, micb_num, MICB_DISABLE, true);
+		break;
+	};
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
 	/* Analog Outputs */
 	SND_SOC_DAPM_OUTPUT("EAR"),
@@ -3981,6 +5090,194 @@ static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("MCLK",  SND_SOC_NOPM, 0, 0,
 			    wcd934x_codec_enable_mclk,
 			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* TX */
+	SND_SOC_DAPM_INPUT("AMIC1"),
+	SND_SOC_DAPM_INPUT("AMIC2"),
+	SND_SOC_DAPM_INPUT("AMIC3"),
+	SND_SOC_DAPM_INPUT("AMIC4"),
+	SND_SOC_DAPM_INPUT("AMIC5"),
+	SND_SOC_DAPM_INPUT("DMIC0 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC1 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC2 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC3 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC4 Pin"),
+	SND_SOC_DAPM_INPUT("DMIC5 Pin"),
+
+	SND_SOC_DAPM_AIF_OUT_E("AIF1 CAP", "AIF1 Capture", 0, SND_SOC_NOPM,
+			       AIF1_CAP, 0, wcd934x_codec_enable_slim,
+			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_OUT_E("AIF2 CAP", "AIF2 Capture", 0, SND_SOC_NOPM,
+			       AIF2_CAP, 0, wcd934x_codec_enable_slim,
+			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_OUT_E("AIF3 CAP", "AIF3 Capture", 0, SND_SOC_NOPM,
+			       AIF3_CAP, 0, wcd934x_codec_enable_slim,
+			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER("SLIM TX0", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX4", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX5", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX6", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX7", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX8", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX9", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX10", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX11", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM TX13", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* Digital Mic Inputs */
+	SND_SOC_DAPM_ADC_E("DMIC0", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd934x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd934x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC2", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd934x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC3", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd934x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC4", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd934x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC5", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd934x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("DMIC MUX0", SND_SOC_NOPM, 0, 0, &tx_dmic_mux0),
+	SND_SOC_DAPM_MUX("DMIC MUX1", SND_SOC_NOPM, 0, 0, &tx_dmic_mux1),
+	SND_SOC_DAPM_MUX("DMIC MUX2", SND_SOC_NOPM, 0, 0, &tx_dmic_mux2),
+	SND_SOC_DAPM_MUX("DMIC MUX3", SND_SOC_NOPM, 0, 0, &tx_dmic_mux3),
+	SND_SOC_DAPM_MUX("DMIC MUX4", SND_SOC_NOPM, 0, 0, &tx_dmic_mux4),
+	SND_SOC_DAPM_MUX("DMIC MUX5", SND_SOC_NOPM, 0, 0, &tx_dmic_mux5),
+	SND_SOC_DAPM_MUX("DMIC MUX6", SND_SOC_NOPM, 0, 0, &tx_dmic_mux6),
+	SND_SOC_DAPM_MUX("DMIC MUX7", SND_SOC_NOPM, 0, 0, &tx_dmic_mux7),
+	SND_SOC_DAPM_MUX("DMIC MUX8", SND_SOC_NOPM, 0, 0, &tx_dmic_mux8),
+	SND_SOC_DAPM_MUX("AMIC MUX0", SND_SOC_NOPM, 0, 0, &tx_amic_mux0),
+	SND_SOC_DAPM_MUX("AMIC MUX1", SND_SOC_NOPM, 0, 0, &tx_amic_mux1),
+	SND_SOC_DAPM_MUX("AMIC MUX2", SND_SOC_NOPM, 0, 0, &tx_amic_mux2),
+	SND_SOC_DAPM_MUX("AMIC MUX3", SND_SOC_NOPM, 0, 0, &tx_amic_mux3),
+	SND_SOC_DAPM_MUX("AMIC MUX4", SND_SOC_NOPM, 0, 0, &tx_amic_mux4),
+	SND_SOC_DAPM_MUX("AMIC MUX5", SND_SOC_NOPM, 0, 0, &tx_amic_mux5),
+	SND_SOC_DAPM_MUX("AMIC MUX6", SND_SOC_NOPM, 0, 0, &tx_amic_mux6),
+	SND_SOC_DAPM_MUX("AMIC MUX7", SND_SOC_NOPM, 0, 0, &tx_amic_mux7),
+	SND_SOC_DAPM_MUX("AMIC MUX8", SND_SOC_NOPM, 0, 0, &tx_amic_mux8),
+	SND_SOC_DAPM_MUX_E("ADC MUX0", WCD934X_CDC_TX0_TX_PATH_CTL, 5, 0,
+			   &tx_adc_mux0_mux, wcd934x_codec_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("ADC MUX1", WCD934X_CDC_TX1_TX_PATH_CTL, 5, 0,
+			   &tx_adc_mux1_mux, wcd934x_codec_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("ADC MUX2", WCD934X_CDC_TX2_TX_PATH_CTL, 5, 0,
+			   &tx_adc_mux2_mux, wcd934x_codec_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("ADC MUX3", WCD934X_CDC_TX3_TX_PATH_CTL, 5, 0,
+			   &tx_adc_mux3_mux, wcd934x_codec_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("ADC MUX4", WCD934X_CDC_TX4_TX_PATH_CTL, 5, 0,
+			   &tx_adc_mux4_mux, wcd934x_codec_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("ADC MUX5", WCD934X_CDC_TX5_TX_PATH_CTL, 5, 0,
+			   &tx_adc_mux5_mux, wcd934x_codec_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("ADC MUX6", WCD934X_CDC_TX6_TX_PATH_CTL, 5, 0,
+			   &tx_adc_mux6_mux, wcd934x_codec_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("ADC MUX7", WCD934X_CDC_TX7_TX_PATH_CTL, 5, 0,
+			   &tx_adc_mux7_mux, wcd934x_codec_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("ADC MUX8", WCD934X_CDC_TX8_TX_PATH_CTL, 5, 0,
+			   &tx_adc_mux8_mux, wcd934x_codec_enable_dec,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADC1", NULL, WCD934X_ANA_AMIC1, 7, 0,
+			   wcd934x_codec_enable_adc, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_ADC_E("ADC2", NULL, WCD934X_ANA_AMIC2, 7, 0,
+			   wcd934x_codec_enable_adc, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_ADC_E("ADC3", NULL, WCD934X_ANA_AMIC3, 7, 0,
+			   wcd934x_codec_enable_adc, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_ADC_E("ADC4", NULL, WCD934X_ANA_AMIC4, 7, 0,
+			   wcd934x_codec_enable_adc, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, 0, 0,
+			    wcd934x_codec_enable_micbias, SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, 0, 0,
+			    wcd934x_codec_enable_micbias, SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, 0, 0,
+			    wcd934x_codec_enable_micbias, SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS4", SND_SOC_NOPM, 0, 0,
+			    wcd934x_codec_enable_micbias, SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("AMIC4_5 SEL", SND_SOC_NOPM, 0, 0, &tx_amic4_5),
+	SND_SOC_DAPM_MUX("CDC_IF RX0 MUX", SND_SOC_NOPM, WCD934X_RX0, 0,
+			 &cdc_if_rx0_mux),
+	SND_SOC_DAPM_MUX("CDC_IF RX1 MUX", SND_SOC_NOPM, WCD934X_RX1, 0,
+			 &cdc_if_rx1_mux),
+	SND_SOC_DAPM_MUX("CDC_IF RX2 MUX", SND_SOC_NOPM, WCD934X_RX2, 0,
+			 &cdc_if_rx2_mux),
+	SND_SOC_DAPM_MUX("CDC_IF RX3 MUX", SND_SOC_NOPM, WCD934X_RX3, 0,
+			 &cdc_if_rx3_mux),
+	SND_SOC_DAPM_MUX("CDC_IF RX4 MUX", SND_SOC_NOPM, WCD934X_RX4, 0,
+			 &cdc_if_rx4_mux),
+	SND_SOC_DAPM_MUX("CDC_IF RX5 MUX", SND_SOC_NOPM, WCD934X_RX5, 0,
+			 &cdc_if_rx5_mux),
+	SND_SOC_DAPM_MUX("CDC_IF RX6 MUX", SND_SOC_NOPM, WCD934X_RX6, 0,
+			 &cdc_if_rx6_mux),
+	SND_SOC_DAPM_MUX("CDC_IF RX7 MUX", SND_SOC_NOPM, WCD934X_RX7, 0,
+			 &cdc_if_rx7_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX0 MUX", SND_SOC_NOPM, WCD934X_TX0, 0,
+			 &cdc_if_tx0_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX1 MUX", SND_SOC_NOPM, WCD934X_TX1, 0,
+			 &cdc_if_tx1_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX2 MUX", SND_SOC_NOPM, WCD934X_TX2, 0,
+			 &cdc_if_tx2_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX3 MUX", SND_SOC_NOPM, WCD934X_TX3, 0,
+			 &cdc_if_tx3_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX4 MUX", SND_SOC_NOPM, WCD934X_TX4, 0,
+			 &cdc_if_tx4_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX5 MUX", SND_SOC_NOPM, WCD934X_TX5, 0,
+			 &cdc_if_tx5_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX6 MUX", SND_SOC_NOPM, WCD934X_TX6, 0,
+			 &cdc_if_tx6_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX7 MUX", SND_SOC_NOPM, WCD934X_TX7, 0,
+			 &cdc_if_tx7_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX8 MUX", SND_SOC_NOPM, WCD934X_TX8, 0,
+			 &cdc_if_tx8_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX9 MUX", SND_SOC_NOPM, WCD934X_TX9, 0,
+			 &cdc_if_tx9_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX10 MUX", SND_SOC_NOPM, WCD934X_TX10, 0,
+			 &cdc_if_tx10_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX11 MUX", SND_SOC_NOPM, WCD934X_TX11, 0,
+			 &cdc_if_tx11_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX11 INP1 MUX", SND_SOC_NOPM, WCD934X_TX11, 0,
+			 &cdc_if_tx11_inp1_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX13 MUX", SND_SOC_NOPM, WCD934X_TX13, 0,
+			 &cdc_if_tx13_mux),
+	SND_SOC_DAPM_MUX("CDC_IF TX13 INP1 MUX", SND_SOC_NOPM, WCD934X_TX13, 0,
+			 &cdc_if_tx13_inp1_mux),
+	SND_SOC_DAPM_MIXER("AIF1_CAP Mixer", SND_SOC_NOPM, AIF1_CAP, 0,
+			   aif1_slim_cap_mixer,
+			   ARRAY_SIZE(aif1_slim_cap_mixer)),
+	SND_SOC_DAPM_MIXER("AIF2_CAP Mixer", SND_SOC_NOPM, AIF2_CAP, 0,
+			   aif2_slim_cap_mixer,
+			   ARRAY_SIZE(aif2_slim_cap_mixer)),
+	SND_SOC_DAPM_MIXER("AIF3_CAP Mixer", SND_SOC_NOPM, AIF3_CAP, 0,
+			   aif3_slim_cap_mixer,
+			   ARRAY_SIZE(aif3_slim_cap_mixer)),
 };
 
 static const struct snd_soc_component_driver wcd934x_component_drv = {
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
