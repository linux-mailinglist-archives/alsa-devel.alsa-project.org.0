Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB45298F27
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 15:23:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A8A168E;
	Mon, 26 Oct 2020 15:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A8A168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603722190;
	bh=OQymyD+t3K1JGEFq4NwVCpviv5sdfYpzCvXkTIeKPik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cpvPzVUdvQo10FS6SROLv8HAEv2Abi4y56557twYZ2SKY886fQfIVsO07nBVkME2v
	 2JSJadt5jbnvY+FsOXw05q9i5QL62h4gK7Q5Xk3w/70f5g+zC6jOyqSpnUL4JvJTnq
	 kSIHerld99tKvCTFhnk94e2ucFLCoZLdyC11mK7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6435DF804CA;
	Mon, 26 Oct 2020 15:20:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66E74F801D5; Mon, 26 Oct 2020 15:20:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 955E3F80249
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:19:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 955E3F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UKwPglDk"
Received: by mail-wm1-x333.google.com with SMTP id c194so11835971wme.2
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwJEkhvFul5vDGHlnJ3Gao9MsJy2NcjTpJ2lWQ2eKBg=;
 b=UKwPglDkCAf8Y8zX5OxyWpXUuJJoEWkgiA5sDOxCofniL1Gqpk9gYydBVD4bzd0Uux
 KyvObdIl8HH48/2jkUuKO4mp+RgcKA0v1mnAPZKslLxTKvioqrsCixf0ufGcZ/nQUrHN
 J2fVi/VdW7zTiTWcMgVfR+ttmyoPsnrZiigVUfPjfv58vfHI5cURWsKwDThg+fsO/bKZ
 mUA+MYSHA49plN/xJqS0JTN+BGAGS7PQkGK910Rkbjifx2SjL2si/3hSSD0u1BXumuJ3
 Nh0wrifhOErHIQpJ91A4byfUrcs2eZJuI6OmlvJ3QNcYcB1gIlbcuIX0VR1NF0D7D40t
 7Eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JwJEkhvFul5vDGHlnJ3Gao9MsJy2NcjTpJ2lWQ2eKBg=;
 b=fjzEsO9lUWhpXCVAKqPcFiqoqdmHuo0wAB9Uk2ij1L+S2wWoc/O4fZ6Ks+6xmB1mob
 GxN2A1n3uLqcw7H06PvWep8TfrNdcQKsMpxlRq/QWhNzSFNOdVo6ThNSyngoSSOoWHpL
 JJxqT1c6XZhZt/at15iQiQPeMa2MJgSPaAwOR+PKZAUmmErQbS93iACHMKpibEPVG89k
 C2eUNc0xf1Op+Kx4COw/UrRVxm/HrnD7ZofhLBBecG+lFnwHWAoLkgQ80FLGKrPHuKcK
 ugf6UduoynwOnR2G8BINDEAsP+GMxYiSx0de2o6O2A58+F0k6Zdz3341B3nB2yimiHl2
 WtDg==
X-Gm-Message-State: AOAM5328HDCJaH0wXWlGIZ1P+Oo+5hpIdXmYZDuJlVfuwOLvAUl5Hlni
 YbXpeJMjdsmNWbs/0Gxs+b8t7w==
X-Google-Smtp-Source: ABdhPJw3z6Eyfbe8k2spvNHnWa5xDF2s+xvHloOILfuvOe0UQ8nFDn4cdvWKQ0qOofu/yTqiza5oEQ==
X-Received: by 2002:a1c:4887:: with SMTP id v129mr17160191wma.13.1603721997685; 
 Mon, 26 Oct 2020 07:19:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g4sm20253333wmh.13.2020.10.26.07.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:19:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v1 3/6] ASoC: codecs: lpass-wsa-macro: add dapm widgets and
 route
Date: Mon, 26 Oct 2020 14:19:42 +0000
Message-Id: <20201026141945.19707-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
References: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
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
 sound/soc/codecs/lpass-wsa-macro.c | 1014 ++++++++++++++++++++++++++++
 1 file changed, 1014 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 8c2c3b0062a6..58da9951ae8e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -398,6 +398,21 @@ static const struct soc_enum rx0_mix_chain_enum =
 static const struct soc_enum rx0_sidetone_mix_enum =
 	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, rx_sidetone_mix_text);
 
+static const struct snd_kcontrol_new rx0_prim_inp0_mux =
+	SOC_DAPM_ENUM("WSA_RX0 INP0 Mux", rx0_prim_inp0_chain_enum);
+
+static const struct snd_kcontrol_new rx0_prim_inp1_mux =
+	SOC_DAPM_ENUM("WSA_RX0 INP1 Mux", rx0_prim_inp1_chain_enum);
+
+static const struct snd_kcontrol_new rx0_prim_inp2_mux =
+	SOC_DAPM_ENUM("WSA_RX0 INP2 Mux", rx0_prim_inp2_chain_enum);
+
+static const struct snd_kcontrol_new rx0_mix_mux =
+	SOC_DAPM_ENUM("WSA_RX0 MIX Mux", rx0_mix_chain_enum);
+
+static const struct snd_kcontrol_new rx0_sidetone_mix_mux =
+	SOC_DAPM_ENUM("WSA_RX0 SIDETONE MIX Mux", rx0_sidetone_mix_enum);
+
 /* RX INT1 */
 static const struct soc_enum rx1_prim_inp0_chain_enum =
 	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT1_CFG0,
@@ -435,6 +450,12 @@ static const struct soc_enum rx_mix_ec1_enum =
 	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_MIX_CFG0,
 		3, 3, rx_mix_ec_text);
 
+static const struct snd_kcontrol_new rx_mix_ec0_mux =
+	SOC_DAPM_ENUM("WSA RX_MIX EC0_Mux", rx_mix_ec0_enum);
+
+static const struct snd_kcontrol_new rx_mix_ec1_mux =
+	SOC_DAPM_ENUM("WSA RX_MIX EC1_Mux", rx_mix_ec1_enum);
+
 static const struct reg_default wsa_defaults[] = {
 	/* WSA Macro */
 	{ CDC_WSA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
@@ -1136,6 +1157,623 @@ static int wsa_macro_mclk_enable(struct wsa_macro *wsa, bool mclk_enable)
 	return ret;
 }
 
+static int wsa_macro_mclk_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wsa_macro_mclk_enable(wsa, true);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wsa_macro_mclk_enable(wsa, false);
+		break;
+	}
+
+	return 0;
+}
+
+static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u32 tx_reg0, tx_reg1;
+
+	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
+	} else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+			/* Enable V&I sensing */
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Disable V&I sensing */
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+		break;
+	}
+
+	return 0;
+}
+
+static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 gain_reg;
+	int offset_val = 0;
+	int val = 0;
+
+	switch (w->reg) {
+	case CDC_WSA_RX0_RX_PATH_MIX_CTL:
+		gain_reg = CDC_WSA_RX0_RX_VOL_MIX_CTL;
+		break;
+	case CDC_WSA_RX1_RX_PATH_MIX_CTL:
+		gain_reg = CDC_WSA_RX1_RX_VOL_MIX_CTL;
+		break;
+	default:
+		return 0;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		val = snd_soc_component_read(component, gain_reg);
+		val += offset_val;
+		snd_soc_component_write(component, gain_reg, val);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, w->reg,
+					      CDC_WSA_RX_PATH_MIX_CLK_EN_MASK,
+					      CDC_WSA_RX_PATH_MIX_CLK_DISABLE);
+		break;
+	}
+
+	return 0;
+}
+
+static void wsa_macro_hd2_control(struct snd_soc_component *component,
+				  u16 reg, int event)
+{
+	u16 hd2_scale_reg;
+	u16 hd2_enable_reg = 0;
+
+	if (reg == CDC_WSA_RX0_RX_PATH_CTL) {
+		hd2_scale_reg = CDC_WSA_RX0_RX_PATH_SEC3;
+		hd2_enable_reg = CDC_WSA_RX0_RX_PATH_CFG0;
+	}
+	if (reg == CDC_WSA_RX1_RX_PATH_CTL) {
+		hd2_scale_reg = CDC_WSA_RX1_RX_PATH_SEC3;
+		hd2_enable_reg = CDC_WSA_RX1_RX_PATH_CFG0;
+	}
+
+	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+					      CDC_WSA_RX_PATH_HD2_ALPHA_MASK,
+					      0x10);
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+					      CDC_WSA_RX_PATH_HD2_SCALE_MASK,
+					      0x1);
+		snd_soc_component_update_bits(component, hd2_enable_reg,
+					      CDC_WSA_RX_PATH_HD2_EN_MASK,
+					      CDC_WSA_RX_PATH_HD2_ENABLE);
+	}
+
+	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_update_bits(component, hd2_enable_reg,
+					      CDC_WSA_RX_PATH_HD2_EN_MASK, 0);
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+					      CDC_WSA_RX_PATH_HD2_SCALE_MASK,
+					      0);
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+					      CDC_WSA_RX_PATH_HD2_ALPHA_MASK,
+					      0);
+	}
+}
+
+static int wsa_macro_config_compander(struct snd_soc_component *component,
+				      int comp, int event)
+{
+	u16 comp_ctl0_reg, rx_path_cfg0_reg;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+
+	if (!wsa->comp_enabled[comp])
+		return 0;
+
+	comp_ctl0_reg = CDC_WSA_COMPANDER0_CTL0 +
+					(comp * WSA_MACRO_RX_COMP_OFFSET);
+	rx_path_cfg0_reg = CDC_WSA_RX0_RX_PATH_CFG0 +
+					(comp * WSA_MACRO_RX_PATH_OFFSET);
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Enable Compander Clock */
+		snd_soc_component_update_bits(component, comp_ctl0_reg,
+					      CDC_WSA_COMPANDER_CLK_EN_MASK,
+					      CDC_WSA_COMPANDER_CLK_ENABLE);
+		snd_soc_component_update_bits(component, comp_ctl0_reg,
+					      CDC_WSA_COMPANDER_SOFT_RST_MASK,
+					      CDC_WSA_COMPANDER_SOFT_RST_ENABLE);
+		snd_soc_component_update_bits(component, comp_ctl0_reg,
+					      CDC_WSA_COMPANDER_SOFT_RST_MASK,
+					      0);
+		snd_soc_component_update_bits(component, rx_path_cfg0_reg,
+					      CDC_WSA_RX_PATH_COMP_EN_MASK,
+					      CDC_WSA_RX_PATH_COMP_ENABLE);
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_update_bits(component, comp_ctl0_reg,
+					      CDC_WSA_COMPANDER_HALT_MASK,
+					      CDC_WSA_COMPANDER_HALT);
+		snd_soc_component_update_bits(component, rx_path_cfg0_reg,
+					      CDC_WSA_RX_PATH_COMP_EN_MASK, 0);
+		snd_soc_component_update_bits(component, comp_ctl0_reg,
+					      CDC_WSA_COMPANDER_SOFT_RST_MASK,
+					      CDC_WSA_COMPANDER_SOFT_RST_ENABLE);
+		snd_soc_component_update_bits(component, comp_ctl0_reg,
+					      CDC_WSA_COMPANDER_SOFT_RST_MASK,
+					      0);
+		snd_soc_component_update_bits(component, comp_ctl0_reg,
+					      CDC_WSA_COMPANDER_CLK_EN_MASK, 0);
+		snd_soc_component_update_bits(component, comp_ctl0_reg,
+					      CDC_WSA_COMPANDER_HALT_MASK, 0);
+	}
+
+	return 0;
+}
+
+static void wsa_macro_enable_softclip_clk(struct snd_soc_component *component,
+					 struct wsa_macro *wsa,
+					 int path,
+					 bool enable)
+{
+	u16 softclip_clk_reg = CDC_WSA_SOFTCLIP0_CRC +
+			(path * WSA_MACRO_RX_SOFTCLIP_OFFSET);
+	u8 softclip_mux_mask = (1 << path);
+	u8 softclip_mux_value = (1 << path);
+
+	if (enable) {
+		if (wsa->softclip_clk_users[path] == 0) {
+			snd_soc_component_update_bits(component,
+						softclip_clk_reg,
+						CDC_WSA_SOFTCLIP_CLK_EN_MASK,
+						CDC_WSA_SOFTCLIP_CLK_ENABLE);
+			snd_soc_component_update_bits(component,
+				CDC_WSA_RX_INP_MUX_SOFTCLIP_CFG0,
+				softclip_mux_mask, softclip_mux_value);
+		}
+		wsa->softclip_clk_users[path]++;
+	} else {
+		wsa->softclip_clk_users[path]--;
+		if (wsa->softclip_clk_users[path] == 0) {
+			snd_soc_component_update_bits(component,
+						softclip_clk_reg,
+						CDC_WSA_SOFTCLIP_CLK_EN_MASK,
+						0);
+			snd_soc_component_update_bits(component,
+				CDC_WSA_RX_INP_MUX_SOFTCLIP_CFG0,
+				softclip_mux_mask, 0x00);
+		}
+	}
+}
+
+static int wsa_macro_config_softclip(struct snd_soc_component *component,
+				     int path, int event)
+{
+	u16 softclip_ctrl_reg = 0;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	int softclip_path = 0;
+
+	if (path == WSA_MACRO_COMP1)
+		softclip_path = WSA_MACRO_SOFTCLIP0;
+	else if (path == WSA_MACRO_COMP2)
+		softclip_path = WSA_MACRO_SOFTCLIP1;
+
+	if (!wsa->is_softclip_on[softclip_path])
+		return 0;
+
+	softclip_ctrl_reg = CDC_WSA_SOFTCLIP0_SOFTCLIP_CTRL +
+				(softclip_path * WSA_MACRO_RX_SOFTCLIP_OFFSET);
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Enable Softclip clock and mux */
+		wsa_macro_enable_softclip_clk(component, wsa, softclip_path,
+					      true);
+		/* Enable Softclip control */
+		snd_soc_component_update_bits(component, softclip_ctrl_reg,
+					      CDC_WSA_SOFTCLIP_EN_MASK,
+					      CDC_WSA_SOFTCLIP_ENABLE);
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_update_bits(component, softclip_ctrl_reg,
+					      CDC_WSA_SOFTCLIP_EN_MASK, 0);
+		wsa_macro_enable_softclip_clk(component, wsa, softclip_path,
+					      false);
+	}
+
+	return 0;
+}
+
+static bool wsa_macro_adie_lb(struct snd_soc_component *component,
+			      int interp_idx)
+{
+	u16 int_mux_cfg0 = 0, int_mux_cfg1 = 0;
+	u8 int_mux_cfg0_val = 0, int_mux_cfg1_val = 0;
+	u8 int_n_inp0 = 0, int_n_inp1 = 0, int_n_inp2 = 0;
+
+	int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + interp_idx * 8;
+	int_mux_cfg1 = int_mux_cfg0 + 4;
+	int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
+	int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
+
+	int_n_inp0 = int_mux_cfg0_val & 0x0F;
+	if (int_n_inp0 == INTn_1_INP_SEL_DEC0 ||
+		int_n_inp0 == INTn_1_INP_SEL_DEC1)
+		return true;
+
+	int_n_inp1 = int_mux_cfg0_val >> 4;
+	if (int_n_inp1 == INTn_1_INP_SEL_DEC0 ||
+		int_n_inp1 == INTn_1_INP_SEL_DEC1)
+		return true;
+
+	int_n_inp2 = int_mux_cfg1_val >> 4;
+	if (int_n_inp2 == INTn_1_INP_SEL_DEC0 ||
+		int_n_inp2 == INTn_1_INP_SEL_DEC1)
+		return true;
+
+	return false;
+}
+
+static int wsa_macro_enable_main_path(struct snd_soc_dapm_widget *w,
+				      struct snd_kcontrol *kcontrol,
+				      int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 reg = 0;
+
+	reg = CDC_WSA_RX0_RX_PATH_CTL + WSA_MACRO_RX_PATH_OFFSET * w->shift;
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (wsa_macro_adie_lb(component, w->shift)) {
+			snd_soc_component_update_bits(component, reg,
+					     CDC_WSA_RX_PATH_CLK_EN_MASK,
+					     CDC_WSA_RX_PATH_CLK_ENABLE);
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int wsa_macro_interp_get_primary_reg(u16 reg, u16 *ind)
+{
+	u16 prim_int_reg = 0;
+
+	switch (reg) {
+	case CDC_WSA_RX0_RX_PATH_CTL:
+	case CDC_WSA_RX0_RX_PATH_MIX_CTL:
+		prim_int_reg = CDC_WSA_RX0_RX_PATH_CTL;
+		*ind = 0;
+		break;
+	case CDC_WSA_RX1_RX_PATH_CTL:
+	case CDC_WSA_RX1_RX_PATH_MIX_CTL:
+		prim_int_reg = CDC_WSA_RX1_RX_PATH_CTL;
+		*ind = 1;
+		break;
+	}
+
+	return prim_int_reg;
+}
+
+static int wsa_macro_enable_prim_interpolator(struct snd_soc_component *component,
+					      u16 reg, int event)
+{
+	u16 prim_int_reg;
+	u16 ind = 0;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+
+	prim_int_reg = wsa_macro_interp_get_primary_reg(reg, &ind);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wsa->prim_int_users[ind]++;
+		if (wsa->prim_int_users[ind] == 1) {
+			snd_soc_component_update_bits(component,
+						      prim_int_reg + WSA_MACRO_RX_PATH_CFG3_OFFSET,
+						      CDC_WSA_RX_DC_DCOEFF_MASK,
+						      0x3);
+			snd_soc_component_update_bits(component, prim_int_reg,
+					CDC_WSA_RX_PATH_PGA_MUTE_EN_MASK,
+					CDC_WSA_RX_PATH_PGA_MUTE_ENABLE);
+			wsa_macro_hd2_control(component, prim_int_reg, event);
+			snd_soc_component_update_bits(component,
+				prim_int_reg + WSA_MACRO_RX_PATH_DSMDEM_OFFSET,
+				CDC_WSA_RX_DSMDEM_CLK_EN_MASK,
+				CDC_WSA_RX_DSMDEM_CLK_ENABLE);
+		}
+		if ((reg != prim_int_reg) &&
+		    ((snd_soc_component_read(
+				component, prim_int_reg)) & 0x10))
+			snd_soc_component_update_bits(component, reg,
+					0x10, 0x10);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wsa->prim_int_users[ind]--;
+		if (wsa->prim_int_users[ind] == 0) {
+			snd_soc_component_update_bits(component,
+				prim_int_reg + WSA_MACRO_RX_PATH_DSMDEM_OFFSET,
+				CDC_WSA_RX_DSMDEM_CLK_EN_MASK, 0);
+			wsa_macro_hd2_control(component, prim_int_reg, event);
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int wsa_macro_config_ear_spkr_gain(struct snd_soc_component *component,
+					  struct wsa_macro *wsa,
+					  int event, int gain_reg)
+{
+	int comp_gain_offset, val;
+
+	switch (wsa->spkr_mode) {
+	/* Compander gain in WSA_MACRO_SPKR_MODE1 case is 12 dB */
+	case WSA_MACRO_SPKR_MODE_1:
+		comp_gain_offset = -12;
+		break;
+	/* Default case compander gain is 15 dB */
+	default:
+		comp_gain_offset = -15;
+		break;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* Apply ear spkr gain only if compander is enabled */
+		if (wsa->comp_enabled[WSA_MACRO_COMP1] &&
+		    (gain_reg == CDC_WSA_RX0_RX_VOL_CTL) &&
+		    (wsa->ear_spkr_gain != 0)) {
+			/* For example, val is -8(-12+5-1) for 4dB of gain */
+			val = comp_gain_offset + wsa->ear_spkr_gain - 1;
+			snd_soc_component_write(component, gain_reg, val);
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/*
+		 * Reset RX0 volume to 0 dB if compander is enabled and
+		 * ear_spkr_gain is non-zero.
+		 */
+		if (wsa->comp_enabled[WSA_MACRO_COMP1] &&
+		    (gain_reg == CDC_WSA_RX0_RX_VOL_CTL) &&
+		    (wsa->ear_spkr_gain != 0)) {
+			snd_soc_component_write(component, gain_reg, 0x0);
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
+					 struct snd_kcontrol *kcontrol,
+					 int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 gain_reg;
+	u16 reg;
+	int val;
+	int offset_val = 0;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+
+	if (w->shift == WSA_MACRO_COMP1) {
+		reg = CDC_WSA_RX0_RX_PATH_CTL;
+		gain_reg = CDC_WSA_RX0_RX_VOL_CTL;
+	} else if (w->shift == WSA_MACRO_COMP2) {
+		reg = CDC_WSA_RX1_RX_PATH_CTL;
+		gain_reg = CDC_WSA_RX1_RX_VOL_CTL;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Reset if needed */
+		wsa_macro_enable_prim_interpolator(component, reg, event);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		wsa_macro_config_compander(component, w->shift, event);
+		wsa_macro_config_softclip(component, w->shift, event);
+		/* apply gain after int clk is enabled */
+		if ((wsa->spkr_gain_offset == WSA_MACRO_GAIN_OFFSET_M1P5_DB) &&
+		    (wsa->comp_enabled[WSA_MACRO_COMP1] ||
+		     wsa->comp_enabled[WSA_MACRO_COMP2])) {
+			snd_soc_component_update_bits(component,
+					CDC_WSA_RX0_RX_PATH_SEC1,
+					CDC_WSA_RX_PGA_HALF_DB_MASK,
+					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
+			snd_soc_component_update_bits(component,
+					CDC_WSA_RX0_RX_PATH_MIX_SEC0,
+					CDC_WSA_RX_PGA_HALF_DB_MASK,
+					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
+			snd_soc_component_update_bits(component,
+					CDC_WSA_RX1_RX_PATH_SEC1,
+					CDC_WSA_RX_PGA_HALF_DB_MASK,
+					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
+			snd_soc_component_update_bits(component,
+					CDC_WSA_RX1_RX_PATH_MIX_SEC0,
+					CDC_WSA_RX_PGA_HALF_DB_MASK,
+					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
+			offset_val = -2;
+		}
+		val = snd_soc_component_read(component, gain_reg);
+		val += offset_val;
+		snd_soc_component_write(component, gain_reg, val);
+		wsa_macro_config_ear_spkr_gain(component, wsa,
+						event, gain_reg);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wsa_macro_config_compander(component, w->shift, event);
+		wsa_macro_config_softclip(component, w->shift, event);
+		wsa_macro_enable_prim_interpolator(component, reg, event);
+		if ((wsa->spkr_gain_offset == WSA_MACRO_GAIN_OFFSET_M1P5_DB) &&
+		    (wsa->comp_enabled[WSA_MACRO_COMP1] ||
+		     wsa->comp_enabled[WSA_MACRO_COMP2])) {
+			snd_soc_component_update_bits(component,
+					CDC_WSA_RX0_RX_PATH_SEC1,
+					CDC_WSA_RX_PGA_HALF_DB_MASK,
+					CDC_WSA_RX_PGA_HALF_DB_DISABLE);
+			snd_soc_component_update_bits(component,
+					CDC_WSA_RX0_RX_PATH_MIX_SEC0,
+					CDC_WSA_RX_PGA_HALF_DB_MASK,
+					CDC_WSA_RX_PGA_HALF_DB_DISABLE);
+			snd_soc_component_update_bits(component,
+					CDC_WSA_RX1_RX_PATH_SEC1,
+					CDC_WSA_RX_PGA_HALF_DB_MASK,
+					CDC_WSA_RX_PGA_HALF_DB_DISABLE);
+			snd_soc_component_update_bits(component,
+					CDC_WSA_RX1_RX_PATH_MIX_SEC0,
+					CDC_WSA_RX_PGA_HALF_DB_MASK,
+					CDC_WSA_RX_PGA_HALF_DB_DISABLE);
+			offset_val = 2;
+			val = snd_soc_component_read(component, gain_reg);
+			val += offset_val;
+			snd_soc_component_write(component, gain_reg, val);
+		}
+		wsa_macro_config_ear_spkr_gain(component, wsa,
+						event, gain_reg);
+		break;
+	}
+
+	return 0;
+}
+
+static int wsa_macro_spk_boost_event(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kcontrol,
+				     int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 boost_path_ctl, boost_path_cfg1;
+	u16 reg, reg_mix;
+
+	if (!strcmp(w->name, "WSA_RX INT0 CHAIN")) {
+		boost_path_ctl = CDC_WSA_BOOST0_BOOST_PATH_CTL;
+		boost_path_cfg1 = CDC_WSA_RX0_RX_PATH_CFG1;
+		reg = CDC_WSA_RX0_RX_PATH_CTL;
+		reg_mix = CDC_WSA_RX0_RX_PATH_MIX_CTL;
+	} else if (!strcmp(w->name, "WSA_RX INT1 CHAIN")) {
+		boost_path_ctl = CDC_WSA_BOOST1_BOOST_PATH_CTL;
+		boost_path_cfg1 = CDC_WSA_RX1_RX_PATH_CFG1;
+		reg = CDC_WSA_RX1_RX_PATH_CTL;
+		reg_mix = CDC_WSA_RX1_RX_PATH_MIX_CTL;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, boost_path_cfg1,
+					      CDC_WSA_RX_PATH_SMART_BST_EN_MASK,
+					      CDC_WSA_RX_PATH_SMART_BST_ENABLE);
+		snd_soc_component_update_bits(component, boost_path_ctl,
+					      CDC_WSA_BOOST_PATH_CLK_EN_MASK,
+					      CDC_WSA_BOOST_PATH_CLK_ENABLE);
+		if ((snd_soc_component_read(component, reg_mix)) & 0x10)
+			snd_soc_component_update_bits(component, reg_mix,
+						0x10, 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_update_bits(component, reg, 0x10, 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, boost_path_ctl,
+					      CDC_WSA_BOOST_PATH_CLK_EN_MASK,
+					      CDC_WSA_BOOST_PATH_CLK_DISABLE);
+		snd_soc_component_update_bits(component, boost_path_cfg1,
+					      CDC_WSA_RX_PATH_SMART_BST_EN_MASK,
+					      CDC_WSA_RX_PATH_SMART_BST_DISABLE);
+		break;
+	}
+
+	return 0;
+}
+
+static int wsa_macro_enable_echo(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol,
+				 int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u16 val, ec_tx = 0, ec_hq_reg;
+
+	val = snd_soc_component_read(component, CDC_WSA_RX_INP_MUX_RX_MIX_CFG0);
+
+	switch (w->shift) {
+	case WSA_MACRO_EC0_MUX:
+		val = val & CDC_WSA_RX_MIX_TX0_SEL_MASK;
+		ec_tx = val - 1;
+		break;
+	case WSA_MACRO_EC1_MUX:
+		val = val & CDC_WSA_RX_MIX_TX1_SEL_MASK;
+		ec_tx = (val >> CDC_WSA_RX_MIX_TX1_SEL_SHFT) - 1;
+		break;
+	}
+
+	if (wsa->ec_hq[ec_tx]) {
+		ec_hq_reg = CDC_WSA_EC_HQ0_EC_REF_HQ_PATH_CTL +	0x40 * ec_tx;
+		snd_soc_component_update_bits(component, ec_hq_reg,
+					     CDC_WSA_EC_HQ_EC_CLK_EN_MASK,
+					     CDC_WSA_EC_HQ_EC_CLK_ENABLE);
+		ec_hq_reg = CDC_WSA_EC_HQ0_EC_REF_HQ_CFG0 + 0x40 * ec_tx;
+		/* default set to 48k */
+		snd_soc_component_update_bits(component, ec_hq_reg,
+				      CDC_WSA_EC_HQ_EC_REF_PCM_RATE_MASK,
+				      CDC_WSA_EC_HQ_EC_REF_PCM_RATE_48K);
+	}
+
+	return 0;
+}
+
 static int wsa_macro_get_ec_hq(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
@@ -1213,6 +1851,75 @@ static int wsa_macro_ear_spkr_pa_gain_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int wsa_macro_rx_mux_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget =
+		snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component =
+				snd_soc_dapm_to_component(widget->dapm);
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] =
+			wsa->rx_port_value[widget->shift];
+	return 0;
+}
+
+static int wsa_macro_rx_mux_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget =
+		snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component =
+				snd_soc_dapm_to_component(widget->dapm);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	struct snd_soc_dapm_update *update = NULL;
+	u32 rx_port_value = ucontrol->value.integer.value[0];
+	u32 bit_input = 0;
+	u32 aif_rst;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+
+	aif_rst = wsa->rx_port_value[widget->shift];
+	if (!rx_port_value) {
+		if (aif_rst == 0) {
+			dev_err(component->dev, "%s: AIF reset already\n", __func__);
+			return 0;
+		}
+		if (aif_rst >= WSA_MACRO_RX_MAX) {
+			dev_err(component->dev, "%s: Invalid AIF reset\n", __func__);
+			return 0;
+		}
+	}
+	wsa->rx_port_value[widget->shift] = rx_port_value;
+
+	bit_input = widget->shift;
+
+	switch (rx_port_value) {
+	case 0:
+		if (wsa->active_ch_cnt[aif_rst]) {
+			clear_bit(bit_input,
+				  &wsa->active_ch_mask[aif_rst]);
+			wsa->active_ch_cnt[aif_rst]--;
+		}
+		break;
+	case 1:
+	case 2:
+		set_bit(bit_input,
+			&wsa->active_ch_mask[rx_port_value]);
+		wsa->active_ch_cnt[rx_port_value]++;
+		break;
+	default:
+		dev_err(component->dev,
+			"%s: Invalid AIF_ID for WSA RX MUX %d\n",
+			__func__, rx_port_value);
+		return -EINVAL;
+	}
+
+	snd_soc_dapm_mux_update_power(widget->dapm, kcontrol,
+					rx_port_value, e, update);
+	return 0;
+}
+
 static int wsa_macro_soft_clip_enable_get(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
@@ -1271,6 +1978,309 @@ static const struct snd_kcontrol_new wsa_macro_snd_controls[] = {
 		       wsa_macro_get_ec_hq, wsa_macro_set_ec_hq),
 };
 
+static const struct soc_enum rx_mux_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_mux_text), rx_mux_text);
+
+static const struct snd_kcontrol_new rx_mux[WSA_MACRO_RX_MAX] = {
+	SOC_DAPM_ENUM_EXT("WSA RX0 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX1 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX_MIX0 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+	SOC_DAPM_ENUM_EXT("WSA RX_MIX1 Mux", rx_mux_enum,
+			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
+};
+
+static int wsa_macro_vi_feed_mixer_get(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u32 spk_tx_id = mixer->shift;
+	u32 dai_id = widget->shift;
+
+	if (test_bit(spk_tx_id, &wsa->active_ch_mask[dai_id]))
+		ucontrol->value.integer.value[0] = 1;
+	else
+		ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int wsa_macro_vi_feed_mixer_put(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u32 enable = ucontrol->value.integer.value[0];
+	u32 spk_tx_id = mixer->shift;
+
+	if (enable) {
+		if (spk_tx_id == WSA_MACRO_TX0 &&
+			!test_bit(WSA_MACRO_TX0,
+				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+			set_bit(WSA_MACRO_TX0,
+				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
+			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]++;
+		}
+		if (spk_tx_id == WSA_MACRO_TX1 &&
+			!test_bit(WSA_MACRO_TX1,
+				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+			set_bit(WSA_MACRO_TX1,
+				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
+			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]++;
+		}
+	} else {
+		if (spk_tx_id == WSA_MACRO_TX0 &&
+			test_bit(WSA_MACRO_TX0,
+				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+			clear_bit(WSA_MACRO_TX0,
+				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
+			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]--;
+		}
+		if (spk_tx_id == WSA_MACRO_TX1 &&
+			test_bit(WSA_MACRO_TX1,
+				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+			clear_bit(WSA_MACRO_TX1,
+				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
+			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]--;
+		}
+	}
+	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, NULL);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new aif_vi_mixer[] = {
+	SOC_SINGLE_EXT("WSA_SPKR_VI_1", SND_SOC_NOPM, WSA_MACRO_TX0, 1, 0,
+			wsa_macro_vi_feed_mixer_get,
+			wsa_macro_vi_feed_mixer_put),
+	SOC_SINGLE_EXT("WSA_SPKR_VI_2", SND_SOC_NOPM, WSA_MACRO_TX1, 1, 0,
+			wsa_macro_vi_feed_mixer_get,
+			wsa_macro_vi_feed_mixer_put),
+};
+
+static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("WSA AIF1 PB", "WSA_AIF1 Playback", 0,
+			    SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("WSA AIF_MIX1 PB", "WSA_AIF_MIX1 Playback", 0,
+			    SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_OUT_E("WSA AIF_VI", "WSA_AIF_VI Capture", 0,
+			       SND_SOC_NOPM, WSA_MACRO_AIF_VI, 0,
+			       wsa_macro_enable_vi_feedback,
+			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_AIF_OUT("WSA AIF_ECHO", "WSA_AIF_ECHO Capture", 0,
+			     SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_MIXER("WSA_AIF_VI Mixer", SND_SOC_NOPM, WSA_MACRO_AIF_VI,
+			   0, aif_vi_mixer, ARRAY_SIZE(aif_vi_mixer)),
+	SND_SOC_DAPM_MUX_E("WSA RX_MIX EC0_MUX", SND_SOC_NOPM,
+			   WSA_MACRO_EC0_MUX, 0,
+			   &rx_mix_ec0_mux, wsa_macro_enable_echo,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("WSA RX_MIX EC1_MUX", SND_SOC_NOPM,
+			   WSA_MACRO_EC1_MUX, 0,
+			   &rx_mix_ec1_mux, wsa_macro_enable_echo,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("WSA RX0 MUX", SND_SOC_NOPM, WSA_MACRO_RX0, 0,
+			 &rx_mux[WSA_MACRO_RX0]),
+	SND_SOC_DAPM_MUX("WSA RX1 MUX", SND_SOC_NOPM, WSA_MACRO_RX1, 0,
+			 &rx_mux[WSA_MACRO_RX1]),
+	SND_SOC_DAPM_MUX("WSA RX_MIX0 MUX", SND_SOC_NOPM, WSA_MACRO_RX_MIX0, 0,
+			 &rx_mux[WSA_MACRO_RX_MIX0]),
+	SND_SOC_DAPM_MUX("WSA RX_MIX1 MUX", SND_SOC_NOPM, WSA_MACRO_RX_MIX1, 0,
+			 &rx_mux[WSA_MACRO_RX_MIX1]),
+
+	SND_SOC_DAPM_MIXER("WSA RX0", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX_MIX0", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA RX_MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux),
+	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux),
+	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux),
+	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", CDC_WSA_RX0_RX_PATH_MIX_CTL,
+			   0, 0, &rx0_mix_mux, wsa_macro_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux),
+	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux),
+	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux),
+	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", CDC_WSA_RX1_RX_PATH_MIX_CTL,
+			   0, 0, &rx1_mix_mux, wsa_macro_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER_E("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0,
+			     wsa_macro_enable_main_path, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_MIXER_E("WSA_RX INT1 MIX", SND_SOC_NOPM, 1, 0, NULL, 0,
+			     wsa_macro_enable_main_path, SND_SOC_DAPM_PRE_PMU),
+
+	SND_SOC_DAPM_MIXER("WSA_RX INT0 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA_RX INT1 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX("WSA_RX0 INT0 SIDETONE MIX", CDC_WSA_RX0_RX_PATH_CFG1,
+			 4, 0, &rx0_sidetone_mix_mux),
+
+	SND_SOC_DAPM_INPUT("WSA SRC0_INP"),
+	SND_SOC_DAPM_INPUT("WSA_TX DEC0_INP"),
+	SND_SOC_DAPM_INPUT("WSA_TX DEC1_INP"),
+
+	SND_SOC_DAPM_MIXER_E("WSA_RX INT0 INTERP", SND_SOC_NOPM,
+			     WSA_MACRO_COMP1, 0, NULL, 0,
+			     wsa_macro_enable_interpolator,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER_E("WSA_RX INT1 INTERP", SND_SOC_NOPM,
+			     WSA_MACRO_COMP2, 0, NULL, 0,
+			     wsa_macro_enable_interpolator,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER_E("WSA_RX INT0 CHAIN", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, wsa_macro_spk_boost_event,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER_E("WSA_RX INT1 CHAIN", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, wsa_macro_spk_boost_event,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_INPUT("VIINPUT_WSA"),
+	SND_SOC_DAPM_OUTPUT("WSA_SPK1 OUT"),
+	SND_SOC_DAPM_OUTPUT("WSA_SPK2 OUT"),
+
+	SND_SOC_DAPM_SUPPLY("WSA_RX0_CLK", CDC_WSA_RX0_RX_PATH_CTL, 5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("WSA_RX1_CLK", CDC_WSA_RX1_RX_PATH_CTL, 5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("WSA_RX_MIX0_CLK", CDC_WSA_RX0_RX_PATH_MIX_CTL, 5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("WSA_RX_MIX1_CLK", CDC_WSA_RX1_RX_PATH_MIX_CTL, 5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("WSA_MCLK", 0, SND_SOC_NOPM, 0, 0,
+			      wsa_macro_mclk_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route wsa_audio_map[] = {
+	/* VI Feedback */
+	{"WSA_AIF_VI Mixer", "WSA_SPKR_VI_1", "VIINPUT_WSA"},
+	{"WSA_AIF_VI Mixer", "WSA_SPKR_VI_2", "VIINPUT_WSA"},
+	{"WSA AIF_VI", NULL, "WSA_AIF_VI Mixer"},
+	{"WSA AIF_VI", NULL, "WSA_MCLK"},
+
+	{"WSA RX_MIX EC0_MUX", "RX_MIX_TX0", "WSA_RX INT0 SEC MIX"},
+	{"WSA RX_MIX EC1_MUX", "RX_MIX_TX0", "WSA_RX INT0 SEC MIX"},
+	{"WSA RX_MIX EC0_MUX", "RX_MIX_TX1", "WSA_RX INT1 SEC MIX"},
+	{"WSA RX_MIX EC1_MUX", "RX_MIX_TX1", "WSA_RX INT1 SEC MIX"},
+	{"WSA AIF_ECHO", NULL, "WSA RX_MIX EC0_MUX"},
+	{"WSA AIF_ECHO", NULL, "WSA RX_MIX EC1_MUX"},
+	{"WSA AIF_ECHO", NULL, "WSA_MCLK"},
+
+	{"WSA AIF1 PB", NULL, "WSA_MCLK"},
+	{"WSA AIF_MIX1 PB", NULL, "WSA_MCLK"},
+
+	{"WSA RX0 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX1 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX_MIX0 MUX", "AIF1_PB", "WSA AIF1 PB"},
+	{"WSA RX_MIX1 MUX", "AIF1_PB", "WSA AIF1 PB"},
+
+	{"WSA RX0 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX1 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX_MIX0 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+	{"WSA RX_MIX1 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
+
+	{"WSA RX0", NULL, "WSA RX0 MUX"},
+	{"WSA RX1", NULL, "WSA RX1 MUX"},
+	{"WSA RX_MIX0", NULL, "WSA RX_MIX0 MUX"},
+	{"WSA RX_MIX1", NULL, "WSA RX_MIX1 MUX"},
+
+	{"WSA RX0", NULL, "WSA_RX0_CLK"},
+	{"WSA RX1", NULL, "WSA_RX1_CLK"},
+	{"WSA RX_MIX0", NULL, "WSA_RX_MIX0_CLK"},
+	{"WSA RX_MIX1", NULL, "WSA_RX_MIX1_CLK"},
+
+	{"WSA_RX0 INP0", "RX0", "WSA RX0"},
+	{"WSA_RX0 INP0", "RX1", "WSA RX1"},
+	{"WSA_RX0 INP0", "RX_MIX0", "WSA RX_MIX0"},
+	{"WSA_RX0 INP0", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX0 INP0", "DEC0", "WSA_TX DEC0_INP"},
+	{"WSA_RX0 INP0", "DEC1", "WSA_TX DEC1_INP"},
+	{"WSA_RX INT0 MIX", NULL, "WSA_RX0 INP0"},
+
+	{"WSA_RX0 INP1", "RX0", "WSA RX0"},
+	{"WSA_RX0 INP1", "RX1", "WSA RX1"},
+	{"WSA_RX0 INP1", "RX_MIX0", "WSA RX_MIX0"},
+	{"WSA_RX0 INP1", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX0 INP1", "DEC0", "WSA_TX DEC0_INP"},
+	{"WSA_RX0 INP1", "DEC1", "WSA_TX DEC1_INP"},
+	{"WSA_RX INT0 MIX", NULL, "WSA_RX0 INP1"},
+
+	{"WSA_RX0 INP2", "RX0", "WSA RX0"},
+	{"WSA_RX0 INP2", "RX1", "WSA RX1"},
+	{"WSA_RX0 INP2", "RX_MIX0", "WSA RX_MIX0"},
+	{"WSA_RX0 INP2", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX0 INP2", "DEC0", "WSA_TX DEC0_INP"},
+	{"WSA_RX0 INP2", "DEC1", "WSA_TX DEC1_INP"},
+	{"WSA_RX INT0 MIX", NULL, "WSA_RX0 INP2"},
+
+	{"WSA_RX0 MIX INP", "RX0", "WSA RX0"},
+	{"WSA_RX0 MIX INP", "RX1", "WSA RX1"},
+	{"WSA_RX0 MIX INP", "RX_MIX0", "WSA RX_MIX0"},
+	{"WSA_RX0 MIX INP", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX INT0 SEC MIX", NULL, "WSA_RX0 MIX INP"},
+
+	{"WSA_RX INT0 SEC MIX", NULL, "WSA_RX INT0 MIX"},
+	{"WSA_RX INT0 INTERP", NULL, "WSA_RX INT0 SEC MIX"},
+	{"WSA_RX0 INT0 SIDETONE MIX", "SRC0", "WSA SRC0_INP"},
+	{"WSA_RX INT0 INTERP", NULL, "WSA_RX0 INT0 SIDETONE MIX"},
+	{"WSA_RX INT0 CHAIN", NULL, "WSA_RX INT0 INTERP"},
+
+	{"WSA_SPK1 OUT", NULL, "WSA_RX INT0 CHAIN"},
+	{"WSA_SPK1 OUT", NULL, "WSA_MCLK"},
+
+	{"WSA_RX1 INP0", "RX0", "WSA RX0"},
+	{"WSA_RX1 INP0", "RX1", "WSA RX1"},
+	{"WSA_RX1 INP0", "RX_MIX0", "WSA RX_MIX0"},
+	{"WSA_RX1 INP0", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX1 INP0", "DEC0", "WSA_TX DEC0_INP"},
+	{"WSA_RX1 INP0", "DEC1", "WSA_TX DEC1_INP"},
+	{"WSA_RX INT1 MIX", NULL, "WSA_RX1 INP0"},
+
+	{"WSA_RX1 INP1", "RX0", "WSA RX0"},
+	{"WSA_RX1 INP1", "RX1", "WSA RX1"},
+	{"WSA_RX1 INP1", "RX_MIX0", "WSA RX_MIX0"},
+	{"WSA_RX1 INP1", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX1 INP1", "DEC0", "WSA_TX DEC0_INP"},
+	{"WSA_RX1 INP1", "DEC1", "WSA_TX DEC1_INP"},
+	{"WSA_RX INT1 MIX", NULL, "WSA_RX1 INP1"},
+
+	{"WSA_RX1 INP2", "RX0", "WSA RX0"},
+	{"WSA_RX1 INP2", "RX1", "WSA RX1"},
+	{"WSA_RX1 INP2", "RX_MIX0", "WSA RX_MIX0"},
+	{"WSA_RX1 INP2", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX1 INP2", "DEC0", "WSA_TX DEC0_INP"},
+	{"WSA_RX1 INP2", "DEC1", "WSA_TX DEC1_INP"},
+	{"WSA_RX INT1 MIX", NULL, "WSA_RX1 INP2"},
+
+	{"WSA_RX1 MIX INP", "RX0", "WSA RX0"},
+	{"WSA_RX1 MIX INP", "RX1", "WSA RX1"},
+	{"WSA_RX1 MIX INP", "RX_MIX0", "WSA RX_MIX0"},
+	{"WSA_RX1 MIX INP", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX INT1 SEC MIX", NULL, "WSA_RX1 MIX INP"},
+
+	{"WSA_RX INT1 SEC MIX", NULL, "WSA_RX INT1 MIX"},
+	{"WSA_RX INT1 INTERP", NULL, "WSA_RX INT1 SEC MIX"},
+
+	{"WSA_RX INT1 CHAIN", NULL, "WSA_RX INT1 INTERP"},
+	{"WSA_SPK2 OUT", NULL, "WSA_RX INT1 CHAIN"},
+	{"WSA_SPK2 OUT", NULL, "WSA_MCLK"},
+};
+
 static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 {
 	struct regmap *regmap = wsa->regmap;
@@ -1398,6 +2408,10 @@ static const struct snd_soc_component_driver wsa_macro_component_drv = {
 	.probe = wsa_macro_component_probe,
 	.controls = wsa_macro_snd_controls,
 	.num_controls = ARRAY_SIZE(wsa_macro_snd_controls),
+	.dapm_widgets = wsa_macro_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets),
+	.dapm_routes = wsa_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wsa_audio_map),
 };
 
 static int wsa_macro_probe(struct platform_device *pdev)
-- 
2.21.0

