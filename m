Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB85CBBC
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 10:15:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A3416B5;
	Tue,  2 Jul 2019 10:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A3416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562055351;
	bh=t33JpaImex/uaa92LlI4pGRdn2lFPjifVROb6d6Q8PQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7QWiUaHs8biasSxuEtl/CgG5AxZ1M63Wi/NtoKa/3ebbtwaKZ7ho+osplOVJN7jH
	 w6b92ueA2M3uBwMRpUxllgvYLaZFS+Ph6r0mbr56ZBXCipH0czZyQqbXny6We44cpF
	 1pIo2WtLve3nA/uHB2jfJ5VJwFuaKlvYG3O41zcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E5E8F80147;
	Tue,  2 Jul 2019 10:10:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26EFFF80120; Tue,  2 Jul 2019 10:10:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D30FFF800DA
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 10:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D30FFF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cid31ZCS"
Received: by mail-wr1-x441.google.com with SMTP id u18so125159wru.1
 for <alsa-devel@alsa-project.org>; Tue, 02 Jul 2019 01:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ik7XAS04hEVHtcCJGJu+yqlBjZzcPdgFWK/ju5mc9zI=;
 b=cid31ZCSTk1/RpKNjAQnIvb81GOabPtFeI3nYCfRp0biX6tf5P8D3KGf+wVgt9xR/S
 tkC6Y11FK80fgJ49v9cUjQFCNFsyrAq4yAL1xoOUmizMqkI49KzF6BqCpRCmAdbnSUPP
 D4x/Y3B8+LgoxbN6LigZocPaEEyid95N3D1r/fcymCAerBWWO/jwr/T55EW2J/cCq9if
 hENCjwX+/vJZFbBAg9V6RStYSbdXa2Co3QuDK0OiOvoFvZq6B+LaO1WShkQWhhIO0/RA
 Bzc8WFthrxkcRUCAfcgghkhJmI44S/PdpInqcFEpEtAarjVZNIeiUOdVb8fTMXzTCV0a
 Iebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ik7XAS04hEVHtcCJGJu+yqlBjZzcPdgFWK/ju5mc9zI=;
 b=XR/O8vbbef6FMTF4aGnjGCmRgmL995Lia4tyoLZN0wc1/b0vMapRtZeRfymYwbo1rb
 TZoRyoiDhw3j78JxZNwYHVH22rzmdLxwnxKWbOIEG5r+35htOeLDpi51+ckvVMo8fGJY
 6gWOwqobZ7Gs0lpc2DI/Gxmi9PLPflSjI0GvoW2nEbXWw2uOo0eGFjP/5D4zskT4ej+U
 19p7nH0BhNDtP7Vnl64PxdLsPDFkakjIapbZR2ig0pLvtOr8OeEkAyRXghnlm1Urcqfo
 jnCEIWPtbBpVxd+HYXoqmitQEl2rEjqZykylbrbARuKb5Vatf28GXF3zwaNEHfcSJX4D
 Fb6w==
X-Gm-Message-State: APjAAAVHR5B8ouuXpTXVo3J7LEP9H3zI/dD1ELpM0Hv/nJ0CiFRk2fHC
 0KyD67lOQIkwEH603PYxNcAYjw==
X-Google-Smtp-Source: APXvYqy7AZUmPrMrbln81ON4U5CpuUMXS88Q7k8vPTbXgTcEtVcBlMJaZtWBXwz/ZDLVmPPhVv4L6A==
X-Received: by 2002:a5d:4681:: with SMTP id u1mr21910978wrq.102.1562055035744; 
 Tue, 02 Jul 2019 01:10:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id e4sm1608859wme.16.2019.07.02.01.10.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 01:10:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	broonie@kernel.org
Date: Tue,  2 Jul 2019 09:09:18 +0100
Message-Id: <20190702080920.22623-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
References: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 srini@kernel.org
Subject: [alsa-devel] [PATCH 4/6] ASoC: wcd934x: add playback dapm widgets
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

This patch adds required dapm widgets for playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 1779 ++++++++++++++++++++++++++++++++++++
 1 file changed, 1779 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 098cca29f89b..ad927208c505 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -449,6 +449,125 @@ static const char * const rx_hph_mode_mux_text[] = {
 	"Class-H Hi-Fi Low Power"
 };
 
+static const char *const slim_rx_mux_text[] = {
+	"ZERO", "AIF1_PB", "AIF2_PB", "AIF3_PB", "AIF4_PB",
+};
+
+static const char * const rx_int0_7_mix_mux_text[] = {
+	"ZERO", "RX0", "RX1", "RX2", "RX3", "RX4", "RX5",
+	"RX6", "RX7", "PROXIMITY"
+};
+
+static const char * const rx_int_mix_mux_text[] = {
+	"ZERO", "RX0", "RX1", "RX2", "RX3", "RX4", "RX5",
+	"RX6", "RX7"
+};
+
+static const char * const rx_prim_mix_text[] = {
+	"ZERO", "DEC0", "DEC1", "IIR0", "IIR1", "RX0", "RX1", "RX2",
+	"RX3", "RX4", "RX5", "RX6", "RX7"
+};
+
+static const char * const rx_sidetone_mix_text[] = {
+	"ZERO", "SRC0", "SRC1", "SRC_SUM"
+};
+
+static const char * const iir_inp_mux_text[] = {
+	"ZERO", "DEC0", "DEC1", "DEC2", "DEC3", "DEC4", "DEC5", "DEC6",
+	"DEC7", "DEC8", "RX0", "RX1", "RX2", "RX3", "RX4", "RX5", "RX6", "RX7"
+};
+
+static const char * const rx_int_dem_inp_mux_text[] = {
+	"NORMAL_DSM_OUT", "CLSH_DSM_OUT",
+};
+
+static const char * const rx_int0_1_interp_mux_text[] = {
+	"ZERO", "RX INT0_1 MIX1",
+};
+
+static const char * const rx_int1_1_interp_mux_text[] = {
+	"ZERO", "RX INT1_1 MIX1",
+};
+
+static const char * const rx_int2_1_interp_mux_text[] = {
+	"ZERO", "RX INT2_1 MIX1",
+};
+
+static const char * const rx_int3_1_interp_mux_text[] = {
+	"ZERO", "RX INT3_1 MIX1",
+};
+
+static const char * const rx_int4_1_interp_mux_text[] = {
+	"ZERO", "RX INT4_1 MIX1",
+};
+
+static const char * const rx_int7_1_interp_mux_text[] = {
+	"ZERO", "RX INT7_1 MIX1",
+};
+
+static const char * const rx_int8_1_interp_mux_text[] = {
+	"ZERO", "RX INT8_1 MIX1",
+};
+
+static const char * const rx_int0_2_interp_mux_text[] = {
+	"ZERO", "RX INT0_2 MUX",
+};
+
+static const char * const rx_int1_2_interp_mux_text[] = {
+	"ZERO", "RX INT1_2 MUX",
+};
+
+static const char * const rx_int2_2_interp_mux_text[] = {
+	"ZERO", "RX INT2_2 MUX",
+};
+
+static const char * const rx_int3_2_interp_mux_text[] = {
+	"ZERO", "RX INT3_2 MUX",
+};
+
+static const char * const rx_int4_2_interp_mux_text[] = {
+	"ZERO", "RX INT4_2 MUX",
+};
+
+static const char * const rx_int7_2_interp_mux_text[] = {
+	"ZERO", "RX INT7_2 MUX",
+};
+
+static const char * const rx_int8_2_interp_mux_text[] = {
+	"ZERO", "RX INT8_2 MUX",
+};
+
+static const char *const cdc_if_rx0_mux_text[] = {
+	"SLIM RX0", "I2S RX0"
+};
+
+static const char *const cdc_if_rx1_mux_text[] = {
+	"SLIM RX1", "I2S RX1"
+};
+
+static const char *const cdc_if_rx2_mux_text[] = {
+	"SLIM RX2", "I2S RX2"
+};
+
+static const char *const cdc_if_rx3_mux_text[] = {
+	"SLIM RX3", "I2S RX3"
+};
+
+static const char *const cdc_if_rx4_mux_text[] = {
+	"SLIM RX4", "I2S RX4"
+};
+
+static const char *const cdc_if_rx5_mux_text[] = {
+	"SLIM RX5", "I2S RX5"
+};
+
+static const char *const cdc_if_rx6_mux_text[] = {
+	"SLIM RX6", "I2S RX6"
+};
+
+static const char *const cdc_if_rx7_mux_text[] = {
+	"SLIM RX7", "I2S RX7"
+};
 static const struct soc_enum cf_dec0_enum =
 	SOC_ENUM_SINGLE(WCD934X_CDC_TX0_TX_PATH_CFG0, 5, 3, cf_text);
 
@@ -521,6 +640,254 @@ static SOC_ENUM_SINGLE_DECL(cf_int8_2_enum, WCD934X_CDC_RX8_RX_PATH_MIX_CFG, 2,
 static const struct soc_enum rx_hph_mode_mux_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text),
 			    rx_hph_mode_mux_text);
+
+static const struct soc_enum slim_rx_mux_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(slim_rx_mux_text), slim_rx_mux_text);
+
+static const struct soc_enum rx_int0_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG1, 0, 10,
+			rx_int0_7_mix_mux_text);
+
+static const struct soc_enum rx_int1_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int2_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int3_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int4_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int7_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG1, 0, 10,
+			rx_int0_7_mix_mux_text);
+
+static const struct soc_enum rx_int8_2_mux_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG1, 0, 9,
+			rx_int_mix_mux_text);
+
+static const struct soc_enum rx_int0_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int0_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int0_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int1_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int1_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int1_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int2_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int2_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int2_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int3_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int3_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int3_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int4_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int4_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int4_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int7_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int7_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int7_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int8_1_mix_inp0_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG0, 0, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int8_1_mix_inp1_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG0, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int8_1_mix_inp2_chain_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG1, 4, 13,
+			rx_prim_mix_text);
+
+static const struct soc_enum rx_int0_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 0, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int1_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 2, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int2_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 4, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int3_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 6, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int4_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG1, 0, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum rx_int7_mix2_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG1, 2, 4,
+			rx_sidetone_mix_text);
+
+static const struct soc_enum iir0_inp0_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG0,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir0_inp1_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG1,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir0_inp2_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG2,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir0_inp3_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG3,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir1_inp0_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG0,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir1_inp1_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG1,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir1_inp2_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG2,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum iir1_inp3_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG3,
+			0, 18, iir_inp_mux_text);
+
+static const struct soc_enum rx_int0_dem_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX0_RX_PATH_SEC0, 0,
+			ARRAY_SIZE(rx_int_dem_inp_mux_text),
+			rx_int_dem_inp_mux_text);
+
+static const struct soc_enum rx_int1_dem_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX1_RX_PATH_SEC0, 0,
+			ARRAY_SIZE(rx_int_dem_inp_mux_text),
+			rx_int_dem_inp_mux_text);
+
+static const struct soc_enum rx_int2_dem_inp_mux_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX2_RX_PATH_SEC0, 0,
+			ARRAY_SIZE(rx_int_dem_inp_mux_text),
+			rx_int_dem_inp_mux_text);
+static const struct soc_enum rx_int0_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2,
+			rx_int0_1_interp_mux_text);
+
+static const struct soc_enum rx_int1_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2,
+			rx_int1_1_interp_mux_text);
+
+static const struct soc_enum rx_int2_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2,
+			rx_int2_1_interp_mux_text);
+
+static const struct soc_enum rx_int3_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int3_1_interp_mux_text);
+
+static const struct soc_enum rx_int4_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int4_1_interp_mux_text);
+
+static const struct soc_enum rx_int7_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int7_1_interp_mux_text);
+
+static const struct soc_enum rx_int8_1_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int8_1_interp_mux_text);
+
+static const struct soc_enum rx_int0_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int0_2_interp_mux_text);
+
+static const struct soc_enum rx_int1_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int1_2_interp_mux_text);
+
+static const struct soc_enum rx_int2_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int2_2_interp_mux_text);
+
+static const struct soc_enum rx_int3_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int3_2_interp_mux_text);
+
+static const struct soc_enum rx_int4_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int4_2_interp_mux_text);
+
+static const struct soc_enum rx_int7_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int7_2_interp_mux_text);
+
+static const struct soc_enum rx_int8_2_interp_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM,	0, 2, rx_int8_2_interp_mux_text);
+
+static const struct soc_enum cdc_if_rx0_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx0_mux_text);
+static const struct soc_enum cdc_if_rx1_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx1_mux_text);
+static const struct soc_enum cdc_if_rx2_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx2_mux_text);
+static const struct soc_enum cdc_if_rx3_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx3_mux_text);
+static const struct soc_enum cdc_if_rx4_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx4_mux_text);
+static const struct soc_enum cdc_if_rx5_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx5_mux_text);
+static const struct soc_enum cdc_if_rx6_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx6_mux_text);
+static const struct soc_enum cdc_if_rx7_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, cdc_if_rx7_mux_text);
+
 static void wcd934x_update_reg_defaults(struct wcd934x_codec *wcd)
 {
 	struct regmap *rm = wcd->regmap;
@@ -772,6 +1139,21 @@ static int __wcd934x_cdc_mclk_enable(struct wcd934x_codec *wcd,
 	return ret;
 }
 
+static int wcd934x_codec_enable_mclk(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return __wcd934x_cdc_mclk_enable(wcd, true);
+	case SND_SOC_DAPM_POST_PMD:
+		return __wcd934x_cdc_mclk_enable(wcd, false);
+	}
+	return 0;
+}
+
 static void wcd934x_get_version(struct wcd934x_codec *wcd)
 {
 	int val1, val2, version, ret;
@@ -2037,6 +2419,319 @@ static int wcd934x_rx_hph_mode_put(struct snd_kcontrol *kc,
 	return 0;
 }
 
+static int slim_rx_mux_get(struct snd_kcontrol *kc,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kc);
+	struct wcd934x_codec *wcd = dev_get_drvdata(dapm->dev);
+
+	ucontrol->value.enumerated.item[0] = wcd->rx_port_value;
+
+	return 0;
+}
+
+static int slim_rx_mux_put(struct snd_kcontrol *kc,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kc);
+	struct wcd934x_codec *wcd = dev_get_drvdata(w->dapm->dev);
+	struct soc_enum *e = (struct soc_enum *)kc->private_value;
+	struct snd_soc_dapm_update *update = NULL;
+	u32 port_id = w->shift;
+
+	if (wcd->rx_port_value == ucontrol->value.enumerated.item[0])
+		return 0;
+
+	wcd->rx_port_value = ucontrol->value.enumerated.item[0];
+
+	switch (wcd->rx_port_value) {
+	case 0:
+		list_del_init(&wcd->rx_chs[port_id].list);
+		break;
+	case 1:
+		list_add_tail(&wcd->rx_chs[port_id].list,
+			      &wcd->dai[AIF1_PB].slim_ch_list);
+		break;
+	case 2:
+		list_add_tail(&wcd->rx_chs[port_id].list,
+			      &wcd->dai[AIF2_PB].slim_ch_list);
+		break;
+	case 3:
+		list_add_tail(&wcd->rx_chs[port_id].list,
+			      &wcd->dai[AIF3_PB].slim_ch_list);
+		break;
+	case 4:
+		list_add_tail(&wcd->rx_chs[port_id].list,
+			      &wcd->dai[AIF4_PB].slim_ch_list);
+		break;
+	default:
+		dev_err(wcd->dev, "Unknown AIF %d\n", wcd->rx_port_value);
+		goto err;
+	}
+
+	snd_soc_dapm_mux_update_power(w->dapm, kc, wcd->rx_port_value,
+				      e, update);
+
+	return 0;
+err:
+	return -EINVAL;
+}
+
+static int wcd934x_int_dem_inp_mux_put(struct snd_kcontrol *kc,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kc->private_value;
+	struct snd_soc_component *component;
+	int reg, val, ret;
+
+	component = snd_soc_dapm_kcontrol_component(kc);
+	val = ucontrol->value.enumerated.item[0];
+	if (e->reg == WCD934X_CDC_RX0_RX_PATH_SEC0)
+		reg = WCD934X_CDC_RX0_RX_PATH_CFG0;
+	else if (e->reg == WCD934X_CDC_RX1_RX_PATH_SEC0)
+		reg = WCD934X_CDC_RX1_RX_PATH_CFG0;
+	else if (e->reg == WCD934X_CDC_RX2_RX_PATH_SEC0)
+		reg = WCD934X_CDC_RX2_RX_PATH_CFG0;
+	else
+		return -EINVAL;
+
+	/* Set Look Ahead Delay */
+	snd_soc_component_update_bits(component, reg,
+				      0x08, (val ? 0x08 : 0x00));
+	ret = snd_soc_dapm_put_enum_double(kc, ucontrol);
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new rx_int0_2_mux =
+	SOC_DAPM_ENUM("RX INT0_2 MUX Mux", rx_int0_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int1_2_mux =
+	SOC_DAPM_ENUM("RX INT1_2 MUX Mux", rx_int1_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int2_2_mux =
+	SOC_DAPM_ENUM("RX INT2_2 MUX Mux", rx_int2_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int3_2_mux =
+	SOC_DAPM_ENUM("RX INT3_2 MUX Mux", rx_int3_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int4_2_mux =
+	SOC_DAPM_ENUM("RX INT4_2 MUX Mux", rx_int4_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int7_2_mux =
+	SOC_DAPM_ENUM("RX INT7_2 MUX Mux", rx_int7_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int8_2_mux =
+	SOC_DAPM_ENUM("RX INT8_2 MUX Mux", rx_int8_2_mux_chain_enum);
+
+static const struct snd_kcontrol_new rx_int0_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT0_1 MIX1 INP0 Mux", rx_int0_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int0_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT0_1 MIX1 INP1 Mux", rx_int0_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int0_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT0_1 MIX1 INP2 Mux", rx_int0_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int1_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT1_1 MIX1 INP0 Mux", rx_int1_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int1_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT1_1 MIX1 INP1 Mux", rx_int1_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int1_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT1_1 MIX1 INP2 Mux", rx_int1_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int2_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT2_1 MIX1 INP0 Mux", rx_int2_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int2_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT2_1 MIX1 INP1 Mux", rx_int2_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int2_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT2_1 MIX1 INP2 Mux", rx_int2_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int3_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT3_1 MIX1 INP0 Mux", rx_int3_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int3_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT3_1 MIX1 INP1 Mux", rx_int3_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int3_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT3_1 MIX1 INP2 Mux", rx_int3_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int4_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT4_1 MIX1 INP0 Mux", rx_int4_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int4_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT4_1 MIX1 INP1 Mux", rx_int4_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int4_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT4_1 MIX1 INP2 Mux", rx_int4_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int7_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT7_1 MIX1 INP0 Mux", rx_int7_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int7_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT7_1 MIX1 INP1 Mux", rx_int7_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int7_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT7_1 MIX1 INP2 Mux", rx_int7_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int8_1_mix_inp0_mux =
+	SOC_DAPM_ENUM("RX INT8_1 MIX1 INP0 Mux", rx_int8_1_mix_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx_int8_1_mix_inp1_mux =
+	SOC_DAPM_ENUM("RX INT8_1 MIX1 INP1 Mux", rx_int8_1_mix_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx_int8_1_mix_inp2_mux =
+	SOC_DAPM_ENUM("RX INT8_1 MIX1 INP2 Mux", rx_int8_1_mix_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx_int0_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT0 MIX2 INP Mux", rx_int0_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int1_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT1 MIX2 INP Mux", rx_int1_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int2_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT2 MIX2 INP Mux", rx_int2_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int3_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT3 MIX2 INP Mux", rx_int3_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int4_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT4 MIX2 INP Mux", rx_int4_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int7_mix2_inp_mux =
+	SOC_DAPM_ENUM("RX INT7 MIX2 INP Mux", rx_int7_mix2_inp_mux_enum);
+
+static const struct snd_kcontrol_new iir0_inp0_mux =
+	SOC_DAPM_ENUM("IIR0 INP0 Mux", iir0_inp0_mux_enum);
+static const struct snd_kcontrol_new iir0_inp1_mux =
+	SOC_DAPM_ENUM("IIR0 INP1 Mux", iir0_inp1_mux_enum);
+static const struct snd_kcontrol_new iir0_inp2_mux =
+	SOC_DAPM_ENUM("IIR0 INP2 Mux", iir0_inp2_mux_enum);
+static const struct snd_kcontrol_new iir0_inp3_mux =
+	SOC_DAPM_ENUM("IIR0 INP3 Mux", iir0_inp3_mux_enum);
+
+static const struct snd_kcontrol_new iir1_inp0_mux =
+	SOC_DAPM_ENUM("IIR1 INP0 Mux", iir1_inp0_mux_enum);
+static const struct snd_kcontrol_new iir1_inp1_mux =
+	SOC_DAPM_ENUM("IIR1 INP1 Mux", iir1_inp1_mux_enum);
+static const struct snd_kcontrol_new iir1_inp2_mux =
+	SOC_DAPM_ENUM("IIR1 INP2 Mux", iir1_inp2_mux_enum);
+static const struct snd_kcontrol_new iir1_inp3_mux =
+	SOC_DAPM_ENUM("IIR1 INP3 Mux", iir1_inp3_mux_enum);
+
+static const struct snd_kcontrol_new slim_rx_mux[WCD934X_RX_MAX] = {
+	SOC_DAPM_ENUM_EXT("SLIM RX0 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX1 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX2 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX3 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX4 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX5 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX6 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("SLIM RX7 Mux", slim_rx_mux_enum,
+			  slim_rx_mux_get, slim_rx_mux_put),
+};
+
+static const struct snd_kcontrol_new rx_int1_asrc_switch[] = {
+	SOC_DAPM_SINGLE("HPHL Switch", SND_SOC_NOPM, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new rx_int2_asrc_switch[] = {
+	SOC_DAPM_SINGLE("HPHR Switch", SND_SOC_NOPM, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new rx_int3_asrc_switch[] = {
+	SOC_DAPM_SINGLE("LO1 Switch", SND_SOC_NOPM, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new rx_int4_asrc_switch[] = {
+	SOC_DAPM_SINGLE("LO2 Switch", SND_SOC_NOPM, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new rx_int0_dem_inp_mux =
+	SOC_DAPM_ENUM_EXT("RX INT0 DEM MUX Mux", rx_int0_dem_inp_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  wcd934x_int_dem_inp_mux_put);
+
+static const struct snd_kcontrol_new rx_int1_dem_inp_mux =
+	SOC_DAPM_ENUM_EXT("RX INT1 DEM MUX Mux", rx_int1_dem_inp_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  wcd934x_int_dem_inp_mux_put);
+
+static const struct snd_kcontrol_new rx_int2_dem_inp_mux =
+	SOC_DAPM_ENUM_EXT("RX INT2 DEM MUX Mux", rx_int2_dem_inp_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  wcd934x_int_dem_inp_mux_put);
+
+static const struct snd_kcontrol_new rx_int0_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT0_1 INTERP Mux", rx_int0_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int1_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT1_1 INTERP Mux", rx_int1_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int2_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT2_1 INTERP Mux", rx_int2_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int3_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT3_1 INTERP Mux", rx_int3_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int4_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT4_1 INTERP Mux", rx_int4_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int7_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT7_1 INTERP Mux", rx_int7_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int8_1_interp_mux =
+	SOC_DAPM_ENUM("RX INT8_1 INTERP Mux", rx_int8_1_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int0_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT0_2 INTERP Mux", rx_int0_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int1_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT1_2 INTERP Mux", rx_int1_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int2_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT2_2 INTERP Mux", rx_int2_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int3_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT3_2 INTERP Mux", rx_int3_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int4_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT4_2 INTERP Mux", rx_int4_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int7_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT7_2 INTERP Mux", rx_int7_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new rx_int8_2_interp_mux =
+	SOC_DAPM_ENUM("RX INT8_2 INTERP Mux", rx_int8_2_interp_mux_enum);
+
+static const struct snd_kcontrol_new cdc_if_rx0_mux =
+	SOC_DAPM_ENUM("CDC_IF RX0 MUX Mux", cdc_if_rx0_mux_enum);
+static const struct snd_kcontrol_new cdc_if_rx1_mux =
+	SOC_DAPM_ENUM("CDC_IF RX1 MUX Mux", cdc_if_rx1_mux_enum);
+static const struct snd_kcontrol_new cdc_if_rx2_mux =
+	SOC_DAPM_ENUM("CDC_IF RX2 MUX Mux", cdc_if_rx2_mux_enum);
+static const struct snd_kcontrol_new cdc_if_rx3_mux =
+	SOC_DAPM_ENUM("CDC_IF RX3 MUX Mux", cdc_if_rx3_mux_enum);
+static const struct snd_kcontrol_new cdc_if_rx4_mux =
+	SOC_DAPM_ENUM("CDC_IF RX4 MUX Mux", cdc_if_rx4_mux_enum);
+static const struct snd_kcontrol_new cdc_if_rx5_mux =
+	SOC_DAPM_ENUM("CDC_IF RX5 MUX Mux", cdc_if_rx5_mux_enum);
+static const struct snd_kcontrol_new cdc_if_rx6_mux =
+	SOC_DAPM_ENUM("CDC_IF RX6 MUX Mux", cdc_if_rx6_mux_enum);
+static const struct snd_kcontrol_new cdc_if_rx7_mux =
+	SOC_DAPM_ENUM("CDC_IF RX7 MUX Mux", cdc_if_rx7_mux_enum);
+
 static const struct snd_kcontrol_new wcd934x_snd_controls[] = {
 	/* Gain Controls */
 	SOC_SINGLE_TLV("EAR PA Volume", WCD934X_ANA_EAR, 4, 4, 1, ear_pa_gain),
@@ -2206,12 +2901,1096 @@ static const struct snd_kcontrol_new wcd934x_snd_controls[] = {
 		       wcd934x_compander_get, wcd934x_compander_set),
 };
 
+static void wcd934x_codec_enable_int_port(struct wcd_slim_codec_dai_data *dai,
+					  struct snd_soc_component *component)
+{
+	int port_num = 0;
+	unsigned short reg = 0;
+	unsigned int val = 0;
+	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
+	struct wcd934x_slim_ch *ch;
+
+	list_for_each_entry(ch, &dai->slim_ch_list, list) {
+		if (ch->port >= WCD934X_RX_START) {
+			port_num = ch->port - WCD934X_RX_START;
+			reg = WCD934X_SLIM_PGD_PORT_INT_EN0 + (port_num / 8);
+		} else {
+			port_num = ch->port;
+			reg = WCD934X_SLIM_PGD_PORT_INT_TX_EN0 + (port_num / 8);
+		}
+
+		regmap_read(wcd->if_regmap, reg, &val);
+		if (!(val & BIT(port_num % 8)))
+			regmap_write(wcd->if_regmap, reg,
+				     val | BIT(port_num % 8));
+	}
+}
+
+static int wcd934x_codec_enable_slim(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kc,
+				       int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(comp);
+	struct wcd_slim_codec_dai_data *dai = &wcd->dai[w->shift];
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		wcd934x_codec_enable_int_port(dai, comp);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		kfree(dai->sconfig.chs);
+
+		break;
+	}
+
+	return ret;
+}
+
+static void wcd934x_codec_hd2_control(struct snd_soc_component *component,
+				      u16 interp_idx, int event)
+{
+	u16 hd2_scale_reg;
+	u16 hd2_enable_reg = 0;
+
+	switch (interp_idx) {
+	case INTERP_HPHL:
+		hd2_scale_reg = WCD934X_CDC_RX1_RX_PATH_SEC3;
+		hd2_enable_reg = WCD934X_CDC_RX1_RX_PATH_CFG0;
+		break;
+	case INTERP_HPHR:
+		hd2_scale_reg = WCD934X_CDC_RX2_RX_PATH_SEC3;
+		hd2_enable_reg = WCD934X_CDC_RX2_RX_PATH_CFG0;
+		break;
+	}
+
+	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_MASK,
+				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P3125);
+		snd_soc_component_update_bits(component, hd2_enable_reg,
+				      WCD934X_CDC_RX_PATH_CFG_HD2_EN_MASK,
+				      WCD934X_CDC_RX_PATH_CFG_HD2_ENABLE);
+	}
+
+	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_update_bits(component, hd2_enable_reg,
+				      WCD934X_CDC_RX_PATH_CFG_HD2_EN_MASK,
+				      WCD934X_CDC_RX_PATH_CFG_HD2_DISABLE);
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_MASK,
+				      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P0000);
+	}
+}
+
+static void wcd934x_codec_hphdelay_lutbypass(struct snd_soc_component *comp,
+					     u16 interp_idx, int event)
+{
+	u8 hph_dly_mask;
+	u16 hph_lut_bypass_reg = 0;
+	u16 hph_comp_ctrl7 = 0;
+
+	switch (interp_idx) {
+	case INTERP_HPHL:
+		hph_dly_mask = 1;
+		hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHL_COMP_LUT;
+		hph_comp_ctrl7 = WCD934X_CDC_COMPANDER1_CTL7;
+		break;
+	case INTERP_HPHR:
+		hph_dly_mask = 2;
+		hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHR_COMP_LUT;
+		hph_comp_ctrl7 = WCD934X_CDC_COMPANDER2_CTL7;
+		break;
+	default:
+		break;
+	}
+
+	if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_ON(event)) {
+		snd_soc_component_update_bits(comp, WCD934X_CDC_CLSH_TEST0,
+					      hph_dly_mask, 0x0);
+		snd_soc_component_update_bits(comp, hph_lut_bypass_reg,
+					      0x80, 0x80);
+	}
+
+	if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_update_bits(comp, WCD934X_CDC_CLSH_TEST0,
+					      hph_dly_mask, hph_dly_mask);
+		snd_soc_component_update_bits(comp, hph_lut_bypass_reg,
+					      0x80, 0x00);
+		snd_soc_component_update_bits(comp, hph_comp_ctrl7, 0x20, 0x0);
+	}
+}
+
+static int wcd934x_config_compander(struct snd_soc_component *comp,
+				    int interp_n, int event)
+{
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	int compander;
+	u16 comp_ctl0_reg, rx_path_cfg0_reg;
+
+	/* EAR does not have compander */
+	if (!interp_n)
+		return 0;
+
+	compander = interp_n - 1;
+	if (!wcd->comp_enabled[compander])
+		return 0;
+
+	comp_ctl0_reg = WCD934X_CDC_COMPANDER1_CTL0 + (compander * 8);
+	rx_path_cfg0_reg = WCD934X_CDC_RX1_RX_PATH_CFG0 + (compander * 20);
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Enable Compander Clock */
+		snd_soc_component_update_bits(comp, comp_ctl0_reg, 0x01, 0x01);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg, 0x02, 0x02);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg, 0x02, 0x00);
+		snd_soc_component_update_bits(comp, rx_path_cfg0_reg,
+					      0x02, 0x02);
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_update_bits(comp, rx_path_cfg0_reg,
+					      0x02, 0x00);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg, 0x04, 0x04);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg, 0x02, 0x02);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg, 0x02, 0x00);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg, 0x01, 0x00);
+		snd_soc_component_update_bits(comp, comp_ctl0_reg, 0x04, 0x00);
+	}
+
+	return 0;
+}
+
+static int wcd934x_codec_enable_interp_clk(struct snd_soc_component *comp,
+					   int event, int interp_idx)
+{
+	struct wcd934x_codec *wcd;
+	u16 main_reg;
+
+	wcd = dev_get_drvdata(comp->dev);
+	main_reg = WCD934X_CDC_RX0_RX_PATH_CTL + (interp_idx * 20);
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		if (wcd->main_clk_users[interp_idx] == 0) {
+			/* Main path PGA mute enable */
+			snd_soc_component_update_bits(comp, main_reg,
+						      0x10, 0x10);
+			/* Clk enable */
+			snd_soc_component_update_bits(comp, main_reg,
+						      0x20, 0x20);
+			wcd934x_codec_hd2_control(comp, interp_idx, event);
+			wcd934x_codec_hphdelay_lutbypass(comp, interp_idx,
+							 event);
+			wcd934x_config_compander(comp, interp_idx, event);
+		}
+		wcd->main_clk_users[interp_idx]++;
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		wcd->main_clk_users[interp_idx]--;
+		if (wcd->main_clk_users[interp_idx] <= 0) {
+			wcd->main_clk_users[interp_idx] = 0;
+			wcd934x_config_compander(comp, interp_idx, event);
+			wcd934x_codec_hphdelay_lutbypass(comp, interp_idx,
+							 event);
+			wcd934x_codec_hd2_control(comp, interp_idx, event);
+			/* Clk Disable */
+			snd_soc_component_update_bits(comp, main_reg,
+						      0x20, 0x00);
+			/* Reset enable and disable */
+			snd_soc_component_update_bits(comp, main_reg,
+						      0x40, 0x40);
+			snd_soc_component_update_bits(comp, main_reg,
+						      0x40, 0x00);
+			/* Reset rate to 48K*/
+			snd_soc_component_update_bits(comp, main_reg,
+						      0x0F, 0x04);
+		}
+	}
+
+	return wcd->main_clk_users[interp_idx];
+}
+
+static int wcd934x_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	int offset_val = 0;
+	u16 gain_reg, mix_reg;
+	int val = 0;
+
+	gain_reg = WCD934X_CDC_RX0_RX_VOL_MIX_CTL +
+					(w->shift * WCD934X_RX_PATH_CTL_OFFSET);
+	mix_reg = WCD934X_CDC_RX0_RX_PATH_MIX_CTL +
+					(w->shift * WCD934X_RX_PATH_CTL_OFFSET);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd934x_codec_enable_interp_clk(comp, event, w->shift);
+		/* Clk enable */
+		snd_soc_component_update_bits(comp, mix_reg, 0x20, 0x20);
+		break;
+
+	case SND_SOC_DAPM_POST_PMU:
+		val = snd_soc_component_read32(comp, gain_reg);
+		val += offset_val;
+		snd_soc_component_write(comp, gain_reg, val);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_spk_boost_event(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	u16 boost_path_ctl, boost_path_cfg1;
+	u16 reg, reg_mix;
+
+	if (!strcmp(w->name, "RX INT7 CHAIN")) {
+		boost_path_ctl = WCD934X_CDC_BOOST0_BOOST_PATH_CTL;
+		boost_path_cfg1 = WCD934X_CDC_RX7_RX_PATH_CFG1;
+		reg = WCD934X_CDC_RX7_RX_PATH_CTL;
+		reg_mix = WCD934X_CDC_RX7_RX_PATH_MIX_CTL;
+	} else if (!strcmp(w->name, "RX INT8 CHAIN")) {
+		boost_path_ctl = WCD934X_CDC_BOOST1_BOOST_PATH_CTL;
+		boost_path_cfg1 = WCD934X_CDC_RX8_RX_PATH_CFG1;
+		reg = WCD934X_CDC_RX8_RX_PATH_CTL;
+		reg_mix = WCD934X_CDC_RX8_RX_PATH_MIX_CTL;
+	} else {
+		pr_err("%s: unknown widget: %s\n",
+		       __func__, w->name);
+		return -EINVAL;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(comp, boost_path_cfg1,
+					      0x01, 0x01);
+		snd_soc_component_update_bits(comp, boost_path_ctl,
+					      0x10, 0x10);
+		snd_soc_component_update_bits(comp, reg, 0x10, 0x00);
+		if ((snd_soc_component_read32(comp, reg_mix)) & 0x10)
+			snd_soc_component_update_bits(comp, reg_mix,
+						      0x10, 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(comp, boost_path_ctl, 0x10, 0x00);
+		snd_soc_component_update_bits(comp, boost_path_cfg1,
+					      0x01, 0x00);
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_enable_rx_path_clk(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	u16 reg;
+
+	reg = WCD934X_CDC_RX0_RX_PATH_CFG1 + 0x14 * w->shift;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd934x_codec_enable_interp_clk(comp, event, w->shift);
+		snd_soc_component_update_bits(comp, reg, 0x10, 0x10);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(comp, reg, 0x10, 0x00);
+		wcd934x_codec_enable_interp_clk(comp, event, w->shift);
+		break;
+	default:
+		break;
+	};
+	return 0;
+}
+
+static int wcd934x_codec_set_iir_gain(struct snd_soc_dapm_widget *w,
+				      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	int reg = w->reg;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* B1 GAIN */
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		/* B2 GAIN */
+		reg++;
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		/* B3 GAIN */
+		reg++;
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		/* B4 GAIN */
+		reg++;
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		/* B5 GAIN */
+		reg++;
+		snd_soc_component_write(comp, reg,
+					snd_soc_component_read32(comp, reg));
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int wcd934x_codec_enable_main_path(struct snd_soc_dapm_widget *w,
+					  struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	u16 gain_reg;
+	int val;
+	int offset_val = 0;
+
+	if (w->shift >= WCD934X_NUM_INTERPOLATORS ||
+	    w->shift == INTERP_LO3_NA || w->shift == INTERP_LO4_NA) {
+		dev_err(wcd->dev, "%s: Invalid Interpolator value %d for name %s\n",
+			__func__, w->shift, w->name);
+		return -EINVAL;
+	};
+
+	gain_reg = WCD934X_CDC_RX0_RX_VOL_CTL + (w->shift *
+						 WCD934X_RX_PATH_CTL_OFFSET);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd934x_codec_enable_interp_clk(comp, event, w->shift);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+
+		/* apply gain after int clk is enabled */
+		val = snd_soc_component_read32(comp, gain_reg);
+		val += offset_val;
+		snd_soc_component_write(comp, gain_reg, val);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd934x_codec_enable_interp_clk(comp, event, w->shift);
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Disable AutoChop timer during power up */
+		snd_soc_component_update_bits(comp,
+					      WCD934X_HPH_NEW_INT_HPH_TIMER1,
+					      0x02, 0x00);
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_EAR, CLS_H_NORMAL);
+
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_EAR, CLS_H_NORMAL);
+		break;
+	};
+
+	return ret;
+}
+
+static int wcd934x_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+				      int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	int hph_mode = wcd->hph_mode;
+	u8 dem_inp;
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Read DEM INP Select */
+		dem_inp = snd_soc_component_read32(comp,
+				   WCD934X_CDC_RX1_RX_PATH_SEC0) & 0x03;
+
+		if (((hph_mode == CLS_H_HIFI) || (hph_mode == CLS_H_LOHIFI) ||
+		     (hph_mode == CLS_H_LP)) && (dem_inp != 0x01)) {
+			return -EINVAL;
+		}
+		if (hph_mode != CLS_H_LP)
+			/* Ripple freq control enable */
+			snd_soc_component_update_bits(comp,
+						WCD934X_SIDO_NEW_VOUT_D_FREQ2,
+						0x01, 0x01);
+		/* Disable AutoChop timer during power up */
+		snd_soc_component_update_bits(comp,
+					      WCD934X_HPH_NEW_INT_HPH_TIMER1,
+					      0x02, 0x00);
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHL, hph_mode);
+
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* 1000us required as per HW requirement */
+		usleep_range(1000, 1100);
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHL, hph_mode);
+		if (hph_mode != CLS_H_LP)
+			/* Ripple freq control disable */
+			snd_soc_component_update_bits(comp,
+						WCD934X_SIDO_NEW_VOUT_D_FREQ2,
+						0x01, 0x0);
+
+		break;
+	default:
+		break;
+	};
+
+	return ret;
+}
+
+static int wcd934x_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+				      int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+	int hph_mode = wcd->hph_mode;
+	u8 dem_inp;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dem_inp = snd_soc_component_read32(comp,
+					WCD934X_CDC_RX2_RX_PATH_SEC0) & 0x03;
+		if (((hph_mode == CLS_H_HIFI) || (hph_mode == CLS_H_LOHIFI) ||
+		     (hph_mode == CLS_H_LP)) && (dem_inp != 0x01)) {
+			return -EINVAL;
+		}
+		if (hph_mode != CLS_H_LP)
+			/* Ripple freq control enable */
+			snd_soc_component_update_bits(comp,
+					WCD934X_SIDO_NEW_VOUT_D_FREQ2,
+					0x01, 0x01);
+		/* Disable AutoChop timer during power up */
+		snd_soc_component_update_bits(comp,
+					WCD934X_HPH_NEW_INT_HPH_TIMER1,
+					0x02, 0x00);
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_HPHR,
+			     hph_mode);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* 1000us required as per HW requirement */
+		usleep_range(1000, 1100);
+
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_HPHR, hph_mode);
+		if (hph_mode != CLS_H_LP)
+			/* Ripple freq control disable */
+			snd_soc_component_update_bits(comp,
+					WCD934X_SIDO_NEW_VOUT_D_FREQ2,
+					0x01, 0x0);
+		break;
+	default:
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_lineout_dac_event(struct snd_soc_dapm_widget *w,
+					   struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_PRE_DAC,
+					WCD_CLSH_STATE_LO, CLS_AB);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd_clsh_ctrl_set_state(wcd->clsh_ctrl, WCD_CLSH_EVENT_POST_PA,
+					WCD_CLSH_STATE_LO, CLS_AB);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd934x_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kc, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* 5ms sleep is required after PA is enabled as per
+		 * HW requirement
+		 */
+		usleep_range(5000, 5500);
+		snd_soc_component_update_bits(comp,
+					      WCD934X_CDC_RX0_RX_PATH_CTL,
+					WCD934X_CDC_RX_PGA_MUTE_EN_MASK,
+					WCD934X_CDC_RX_PGA_MUTE_DISABLE);
+		/* Remove mix path mute if it is enabled */
+		if ((snd_soc_component_read32(comp,
+					WCD934X_CDC_RX0_RX_PATH_MIX_CTL)) &
+					WCD934X_CDC_RX_PGA_MUTE_EN_MASK)
+			snd_soc_component_update_bits(comp,
+					WCD934X_CDC_RX0_RX_PATH_MIX_CTL,
+					WCD934X_CDC_RX_PGA_MUTE_EN_MASK,
+					WCD934X_CDC_RX_PGA_MUTE_DISABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* 5ms sleep is required after PA is disabled as per
+		 * HW requirement
+		 */
+		usleep_range(5000, 5500);
+
+		break;
+	};
+
+	return ret;
+}
+
+static int wcd934x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+				      int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/*
+		 * 7ms sleep is required after PA is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is needed.
+		 */
+		usleep_range(20000, 20100);
+
+		snd_soc_component_update_bits(comp, WCD934X_HPH_L_TEST,
+					      0x01, 0x01);
+		/* Remove Mute on primary path */
+		snd_soc_component_update_bits(comp, WCD934X_CDC_RX1_RX_PATH_CTL,
+					      0x10, 0x00);
+		/* Enable GM3 boost */
+		snd_soc_component_update_bits(comp, WCD934X_HPH_CNP_WG_CTL,
+					      0x80, 0x80);
+		/* Enable AutoChop timer at the end of power up */
+		snd_soc_component_update_bits(comp,
+					      WCD934X_HPH_NEW_INT_HPH_TIMER1,
+					      0x02, 0x02);
+		/* Remove mix path mute if it is enabled */
+		if ((snd_soc_component_read32(comp,
+				WCD934X_CDC_RX1_RX_PATH_MIX_CTL)) & 0x10)
+			snd_soc_component_update_bits(comp,
+				WCD934X_CDC_RX1_RX_PATH_MIX_CTL, 0x10, 0x00);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* Enable DSD Mute before PA disable */
+
+		snd_soc_component_update_bits(comp, WCD934X_HPH_L_TEST,
+					      0x01, 0x00);
+		snd_soc_component_update_bits(comp, WCD934X_CDC_RX1_RX_PATH_CTL,
+					      0x10, 0x10);
+		snd_soc_component_update_bits(comp,
+					      WCD934X_CDC_RX1_RX_PATH_MIX_CTL,
+					      0x10, 0x10);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * 5ms sleep is required after PA disable. If compander is
+		 * disabled, then 20ms delay is needed after PA disable.
+		 */
+			usleep_range(20000, 20100);
+		break;
+	};
+	return ret;
+}
+
+static int wcd934x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/*
+		 * 7ms sleep is required after PA is enabled as per
+		 * HW requirement. If compander is disabled, then
+		 * 20ms delay is needed.
+		 */
+		usleep_range(20000, 20100);
+		snd_soc_component_update_bits(comp, WCD934X_HPH_R_TEST,
+					      0x01, 0x01);
+		/* Remove mute */
+		snd_soc_component_update_bits(comp,
+					      WCD934X_CDC_RX2_RX_PATH_CTL,
+					      0x10, 0x00);
+		/* Enable GM3 boost */
+		snd_soc_component_update_bits(comp, WCD934X_HPH_CNP_WG_CTL,
+					      0x80, 0x80);
+		/* Enable AutoChop timer at the end of power up */
+		snd_soc_component_update_bits(comp,
+					      WCD934X_HPH_NEW_INT_HPH_TIMER1,
+					      0x02, 0x02);
+		/* Remove mix path mute if it is enabled */
+		if ((snd_soc_component_read32(comp,
+				      WCD934X_CDC_RX2_RX_PATH_MIX_CTL)) & 0x10)
+			snd_soc_component_update_bits(comp,
+					      WCD934X_CDC_RX2_RX_PATH_MIX_CTL,
+					      0x10, 0x00);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		snd_soc_component_update_bits(comp, WCD934X_HPH_R_TEST,
+					      0x01, 0x00);
+		snd_soc_component_update_bits(comp,
+					      WCD934X_CDC_RX2_RX_PATH_CTL,
+					      0x10, 0x10);
+		snd_soc_component_update_bits(comp,
+					      WCD934X_CDC_RX2_RX_PATH_MIX_CTL,
+					      0x10, 0x10);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * 5ms sleep is required after PA disable. If compander is
+		 * disabled, then 20ms delay is needed after PA disable.
+		 */
+		usleep_range(20000, 20100);
+		break;
+	};
+
+	return ret;
+}
+
+static int wcd934x_codec_enable_lineout_pa(struct snd_soc_dapm_widget *w,
+					   struct snd_kcontrol *kcontrol,
+					 int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+
+	u16 lineout_vol_reg = 0, lineout_mix_vol_reg = 0;
+
+	if (w->reg == WCD934X_ANA_LO_1_2) {
+		if (w->shift == 7) {
+			lineout_vol_reg = WCD934X_CDC_RX3_RX_PATH_CTL;
+			lineout_mix_vol_reg = WCD934X_CDC_RX3_RX_PATH_MIX_CTL;
+		} else if (w->shift == 6) {
+			lineout_vol_reg = WCD934X_CDC_RX4_RX_PATH_CTL;
+			lineout_mix_vol_reg = WCD934X_CDC_RX4_RX_PATH_MIX_CTL;
+		}
+	} else {
+		dev_err(comp->dev, "%s: Error enabling lineout PA\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/*
+		 * 5ms sleep is required after PA is enabled as per
+		 * HW requirement
+		 */
+		usleep_range(5000, 5500);
+		snd_soc_component_update_bits(comp, lineout_vol_reg,
+					      0x10, 0x00);
+		/* Remove mix path mute if it is enabled */
+		if ((snd_soc_component_read32(comp, lineout_mix_vol_reg)) &
+			0x10)
+			snd_soc_component_update_bits(comp,
+						      lineout_mix_vol_reg,
+						      0x10, 0x00);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * 5ms sleep is required after PA is disabled as per
+		 * HW requirement
+		 */
+		usleep_range(5000, 5500);
+	default:
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_codec_enable_rx_bias(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd->rx_bias_count++;
+		if (wcd->rx_bias_count == 1) {
+			snd_soc_component_update_bits(comp,
+						      WCD934X_ANA_RX_SUPPLIES,
+						      0x01, 0x01);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd->rx_bias_count--;
+		if (!wcd->rx_bias_count)
+			snd_soc_component_update_bits(comp,
+						      WCD934X_ANA_RX_SUPPLIES,
+						      0x01, 0x00);
+		break;
+	};
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
+	/* Analog Outputs */
+	SND_SOC_DAPM_OUTPUT("EAR"),
+	SND_SOC_DAPM_OUTPUT("HPHL"),
+	SND_SOC_DAPM_OUTPUT("HPHR"),
+	SND_SOC_DAPM_OUTPUT("LINEOUT1"),
+	SND_SOC_DAPM_OUTPUT("LINEOUT2"),
+	SND_SOC_DAPM_OUTPUT("SPK1 OUT"),
+	SND_SOC_DAPM_OUTPUT("SPK2 OUT"),
+	SND_SOC_DAPM_OUTPUT("ANC EAR"),
+	SND_SOC_DAPM_OUTPUT("ANC HPHL"),
+	SND_SOC_DAPM_OUTPUT("ANC HPHR"),
+	SND_SOC_DAPM_OUTPUT("WDMA3_OUT"),
+	SND_SOC_DAPM_OUTPUT("MAD_CPE_OUT1"),
+	SND_SOC_DAPM_OUTPUT("MAD_CPE_OUT2"),
+	SND_SOC_DAPM_AIF_IN_E("AIF1 PB", "AIF1 Playback", 0, SND_SOC_NOPM,
+			      AIF1_PB, 0, wcd934x_codec_enable_slim,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_IN_E("AIF2 PB", "AIF2 Playback", 0, SND_SOC_NOPM,
+			      AIF2_PB, 0, wcd934x_codec_enable_slim,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_IN_E("AIF3 PB", "AIF3 Playback", 0, SND_SOC_NOPM,
+			      AIF3_PB, 0, wcd934x_codec_enable_slim,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_IN_E("AIF4 PB", "AIF4 Playback", 0, SND_SOC_NOPM,
+			      AIF4_PB, 0, wcd934x_codec_enable_slim,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("SLIM RX0 MUX", SND_SOC_NOPM, WCD934X_RX0, 0,
+			 &slim_rx_mux[WCD934X_RX0]),
+	SND_SOC_DAPM_MUX("SLIM RX1 MUX", SND_SOC_NOPM, WCD934X_RX1, 0,
+			 &slim_rx_mux[WCD934X_RX1]),
+	SND_SOC_DAPM_MUX("SLIM RX2 MUX", SND_SOC_NOPM, WCD934X_RX2, 0,
+			 &slim_rx_mux[WCD934X_RX2]),
+	SND_SOC_DAPM_MUX("SLIM RX3 MUX", SND_SOC_NOPM, WCD934X_RX3, 0,
+			 &slim_rx_mux[WCD934X_RX3]),
+	SND_SOC_DAPM_MUX("SLIM RX4 MUX", SND_SOC_NOPM, WCD934X_RX4, 0,
+			 &slim_rx_mux[WCD934X_RX4]),
+	SND_SOC_DAPM_MUX("SLIM RX5 MUX", SND_SOC_NOPM, WCD934X_RX5, 0,
+			 &slim_rx_mux[WCD934X_RX5]),
+	SND_SOC_DAPM_MUX("SLIM RX6 MUX", SND_SOC_NOPM, WCD934X_RX6, 0,
+			 &slim_rx_mux[WCD934X_RX6]),
+	SND_SOC_DAPM_MUX("SLIM RX7 MUX", SND_SOC_NOPM, WCD934X_RX7, 0,
+			 &slim_rx_mux[WCD934X_RX7]),
+
+	SND_SOC_DAPM_MIXER("SLIM RX0", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX4", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX5", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX6", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SLIM RX7", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX_E("RX INT0_2 MUX", SND_SOC_NOPM, INTERP_EAR, 0,
+			   &rx_int0_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT1_2 MUX", SND_SOC_NOPM, INTERP_HPHL, 0,
+			   &rx_int1_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT2_2 MUX", SND_SOC_NOPM, INTERP_HPHR, 0,
+			   &rx_int2_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT3_2 MUX", SND_SOC_NOPM, INTERP_LO1, 0,
+			   &rx_int3_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT4_2 MUX", SND_SOC_NOPM, INTERP_LO2, 0,
+			   &rx_int4_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT7_2 MUX", SND_SOC_NOPM, INTERP_SPKR1, 0,
+			   &rx_int7_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT8_2 MUX", SND_SOC_NOPM, INTERP_SPKR2, 0,
+			   &rx_int8_2_mux, wcd934x_codec_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT3_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int3_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT3_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int3_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT3_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int3_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT4_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			 &rx_int4_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT4_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx_int4_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT4_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			 &rx_int4_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT7_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			   &rx_int7_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT7_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			   &rx_int7_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT7_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			   &rx_int7_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT8_1 MIX1 INP0", SND_SOC_NOPM, 0, 0,
+			   &rx_int8_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT8_1 MIX1 INP1", SND_SOC_NOPM, 0, 0,
+			   &rx_int8_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT8_1 MIX1 INP2", SND_SOC_NOPM, 0, 0,
+			   &rx_int8_1_mix_inp2_mux),
+	SND_SOC_DAPM_MIXER("RX INT0_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT0 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1 SEC MIX", SND_SOC_NOPM, 0, 0,
+			   rx_int1_asrc_switch,
+			   ARRAY_SIZE(rx_int1_asrc_switch)),
+	SND_SOC_DAPM_MIXER("RX INT2_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT2 SEC MIX", SND_SOC_NOPM, 0, 0,
+			   rx_int2_asrc_switch,
+			   ARRAY_SIZE(rx_int2_asrc_switch)),
+	SND_SOC_DAPM_MIXER("RX INT3_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT3 SEC MIX", SND_SOC_NOPM, 0, 0,
+			   rx_int3_asrc_switch,
+			   ARRAY_SIZE(rx_int3_asrc_switch)),
+	SND_SOC_DAPM_MIXER("RX INT4_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT4 SEC MIX", SND_SOC_NOPM, 0, 0,
+			   rx_int4_asrc_switch,
+			   ARRAY_SIZE(rx_int4_asrc_switch)),
+	SND_SOC_DAPM_MIXER("RX INT7_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT7 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT8_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT8 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT0 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1 MIX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT2 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT2 MIX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT3 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT3 MIX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT4 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT4 MIX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MIXER("RX INT7 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER_E("RX INT7 CHAIN", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, wcd934x_codec_spk_boost_event,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("RX INT8 CHAIN", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, wcd934x_codec_spk_boost_event,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT0 MIX2 INP", SND_SOC_NOPM, INTERP_EAR, 0,
+			   &rx_int0_mix2_inp_mux,
+			   wcd934x_codec_enable_rx_path_clk,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT1 MIX2 INP", SND_SOC_NOPM, INTERP_HPHL, 0,
+			   &rx_int1_mix2_inp_mux,
+			   wcd934x_codec_enable_rx_path_clk,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT2 MIX2 INP", SND_SOC_NOPM, INTERP_HPHR, 0,
+			   &rx_int2_mix2_inp_mux,
+			   wcd934x_codec_enable_rx_path_clk,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT3 MIX2 INP", SND_SOC_NOPM, INTERP_LO1, 0,
+			   &rx_int3_mix2_inp_mux,
+			   wcd934x_codec_enable_rx_path_clk,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT4 MIX2 INP", SND_SOC_NOPM, INTERP_LO2, 0,
+			   &rx_int4_mix2_inp_mux,
+			   wcd934x_codec_enable_rx_path_clk,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT7 MIX2 INP", SND_SOC_NOPM, INTERP_SPKR1, 0,
+			   &rx_int7_mix2_inp_mux,
+			   wcd934x_codec_enable_rx_path_clk,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("IIR0 INP0 MUX", SND_SOC_NOPM, 0, 0, &iir0_inp0_mux),
+	SND_SOC_DAPM_MUX("IIR0 INP1 MUX", SND_SOC_NOPM, 0, 0, &iir0_inp1_mux),
+	SND_SOC_DAPM_MUX("IIR0 INP2 MUX", SND_SOC_NOPM, 0, 0, &iir0_inp2_mux),
+	SND_SOC_DAPM_MUX("IIR0 INP3 MUX", SND_SOC_NOPM, 0, 0, &iir0_inp3_mux),
+	SND_SOC_DAPM_MUX("IIR1 INP0 MUX", SND_SOC_NOPM, 0, 0, &iir1_inp0_mux),
+	SND_SOC_DAPM_MUX("IIR1 INP1 MUX", SND_SOC_NOPM, 0, 0, &iir1_inp1_mux),
+	SND_SOC_DAPM_MUX("IIR1 INP2 MUX", SND_SOC_NOPM, 0, 0, &iir1_inp2_mux),
+	SND_SOC_DAPM_MUX("IIR1 INP3 MUX", SND_SOC_NOPM, 0, 0, &iir1_inp3_mux),
+
+	SND_SOC_DAPM_PGA_E("IIR0", WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B1_CTL,
+			   0, 0, NULL, 0, wcd934x_codec_set_iir_gain,
+			   SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_PGA_E("IIR1", WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B1_CTL,
+			   1, 0,  NULL, 0, wcd934x_codec_set_iir_gain,
+			   SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_MIXER("SRC0", WCD934X_CDC_SIDETONE_SRC0_ST_SRC_PATH_CTL,
+			   4, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SRC1", WCD934X_CDC_SIDETONE_SRC1_ST_SRC_PATH_CTL,
+			   4, 0, NULL, 0),
+	SND_SOC_DAPM_MUX("RX INT0 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_dem_inp_mux),
+	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_dem_inp_mux),
+	SND_SOC_DAPM_MUX("RX INT2 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_dem_inp_mux),
+
+	SND_SOC_DAPM_MUX_E("RX INT0_1 INTERP", SND_SOC_NOPM, INTERP_EAR, 0,
+			   &rx_int0_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT1_1 INTERP", SND_SOC_NOPM, INTERP_HPHL, 0,
+			   &rx_int1_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT2_1 INTERP", SND_SOC_NOPM, INTERP_HPHR, 0,
+			   &rx_int2_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT3_1 INTERP", SND_SOC_NOPM, INTERP_LO1, 0,
+			   &rx_int3_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT4_1 INTERP", SND_SOC_NOPM, INTERP_LO2, 0,
+			   &rx_int4_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT7_1 INTERP", SND_SOC_NOPM, INTERP_SPKR1, 0,
+			   &rx_int7_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT8_1 INTERP", SND_SOC_NOPM, INTERP_SPKR2, 0,
+			   &rx_int8_1_interp_mux,
+			   wcd934x_codec_enable_main_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("RX INT0_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT1_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT2_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT3_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int3_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT4_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int4_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT7_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int7_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT8_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int8_2_interp_mux),
+	SND_SOC_DAPM_DAC_E("RX INT0 DAC", NULL, SND_SOC_NOPM,
+			   0, 0, wcd934x_codec_ear_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RX INT1 DAC", NULL, WCD934X_ANA_HPH,
+			   5, 0, wcd934x_codec_hphl_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RX INT2 DAC", NULL, WCD934X_ANA_HPH,
+			   4, 0, wcd934x_codec_hphr_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RX INT3 DAC", NULL, SND_SOC_NOPM,
+			   0, 0, wcd934x_codec_lineout_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("RX INT4 DAC", NULL, SND_SOC_NOPM,
+			   0, 0, wcd934x_codec_lineout_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("EAR PA", WCD934X_ANA_EAR, 7, 0, NULL, 0,
+			   wcd934x_codec_enable_ear_pa,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHL PA", WCD934X_ANA_HPH, 7, 0, NULL, 0,
+			   wcd934x_codec_enable_hphl_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("HPHR PA", WCD934X_ANA_HPH, 6, 0, NULL, 0,
+			   wcd934x_codec_enable_hphr_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("LINEOUT1 PA", WCD934X_ANA_LO_1_2, 7, 0, NULL, 0,
+			   wcd934x_codec_enable_lineout_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_E("LINEOUT2 PA", WCD934X_ANA_LO_1_2, 6, 0, NULL, 0,
+			   wcd934x_codec_enable_lineout_pa,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("RX_BIAS", SND_SOC_NOPM, 0, 0,
+			    wcd934x_codec_enable_rx_bias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MCLK",  SND_SOC_NOPM, 0, 0,
+			    wcd934x_codec_enable_mclk,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
 static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.probe = wcd934x_comp_probe,
 	.remove = wcd934x_comp_remove,
 	.set_sysclk = wcd934x_comp_set_sysclk,
 	.controls = wcd934x_snd_controls,
 	.num_controls = ARRAY_SIZE(wcd934x_snd_controls),
+	.dapm_widgets = wcd934x_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wcd934x_dapm_widgets),
 };
 
 static int wcd934x_codec_probe(struct wcd934x_codec *wcd)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
