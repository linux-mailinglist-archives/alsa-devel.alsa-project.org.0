Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA37E313C3A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:04:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60BF61692;
	Mon,  8 Feb 2021 19:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60BF61692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612807482;
	bh=ynwM5IHEAxDDsc6NxZiu5PY3HJW/aeep1tg3d8TSRd8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s8CgMHWc7cdQgdnwYFmnM7Go/ggFQx2bM7Dq1RhuBZO8sbDpoM6n/MWAPneaHscZD
	 2itMglVNE5ydDLQsF7Mm6Y3arcUB8HbkZcVQgMMhmQsmAMikDqKTGbmjzJeuL6F2oS
	 ssDLRUa3lEsT1YsEJ/MbN2xUGuV4+VNlQalNgf74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF216F8032C;
	Mon,  8 Feb 2021 19:02:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 500AEF802DB; Mon,  8 Feb 2021 19:02:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FA2FF80264
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA2FF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LoVZqOQC"
Received: by mail-wr1-x42f.google.com with SMTP id 7so18362908wrz.0
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvActiumK7rndCEKVRW6jNjH5xvqfPq7jLSHJLzVceQ=;
 b=LoVZqOQCt214r+lxzG5ZGvL9YFHq2ajSOQMl+m1sZ2Bl95fkYNWR1L2/d5TNzIM1w1
 8Eev9e9xW5g3vTrRaGSseGApj6klVbke1mTgpGY3X2LH9wpbZIn1+IIRU5YlrXzjOeA0
 sPTxs3WFy0WlP8icK+L1a6rlduAC8K5xgVIR0K1V4lOEig1x8TkXSrvXNm1m/UOtMoeD
 pb3uNA9stN92v5lJvkO6nerhcfsk9ZpCx9xkOP+8Eze35Y29ynUV//66d6G7viZWhxft
 HTblKFXNQeqY1+u/TDlINhdmZp3xpYU7O3d5pZesT7cml05cNBPq2HtTc4LuJPXbY6XG
 uAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dvActiumK7rndCEKVRW6jNjH5xvqfPq7jLSHJLzVceQ=;
 b=Rw6REIJzCNIQI4tl3nHVJDY5bNpU4iJmi9EoTocfRbbeVwTj1lgK6491I6anczbA+X
 cDqEHFW7oaP06ZAPJuDgXjiiZZErnEDoPhPmKQW1cpO+uE9wUQB4lckcvReb3YuW8oDK
 1GDr0F9ZNqpJx6BL7YB7T6Q6+VyMtsAI1mOOsKEgefuFY1R6WTsmNRXZyBF5dQzVnPJu
 E1D0B14+UERJvkj6qeYxno9ohGfIH3sxJUifVJt+njMVu9DuuG/4G96M3VVRmFfTDFr2
 nbYo4HzoTEFbagLCKfilKlWt3uL4H4yntF9F61rLUyh4UzvCxKGFPrEFcp0/af86zkGg
 yutA==
X-Gm-Message-State: AOAM530ck3309WABVkZmG1bHwj8I31+deL6Mhg6Y2vsP1ZfsGtk4C37S
 7pbTlfysWxVPsm+priyaIprvQA==
X-Google-Smtp-Source: ABdhPJwc3LfU70JOJ60o5gPO0LjzUP65lXRFDWb2aaaMpn4dXTHNpxHceCVcHUNCd5DuJoWG6XiB7g==
X-Received: by 2002:a05:6000:1202:: with SMTP id
 e2mr20942400wrx.328.1612807318672; 
 Mon, 08 Feb 2021 10:01:58 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l2sm21194937wmq.17.2021.02.08.10.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:01:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 3/7] ASoC: codecs: lpass-rx-macro: add dapm widgets and
 route
Date: Mon,  8 Feb 2021 18:01:05 +0000
Message-Id: <20210208180109.518-4-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-rx-macro.c | 1339 +++++++++++++++++++++++++++++
 1 file changed, 1339 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 5dd84f09ec0c..84ddfede59ef 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -590,12 +590,210 @@ struct rx_macro {
 
 static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 
+static const char * const rx_int_mix_mux_text[] = {
+	"ZERO", "RX0", "RX1", "RX2", "RX3", "RX4", "RX5"
+};
+
+static const char * const rx_prim_mix_text[] = {
+	"ZERO", "DEC0", "DEC1", "IIR0", "IIR1", "RX0", "RX1", "RX2",
+	"RX3", "RX4", "RX5"
+};
+
+static const char * const rx_sidetone_mix_text[] = {
+	"ZERO", "SRC0", "SRC1", "SRC_SUM"
+};
+
+static const char * const iir_inp_mux_text[] = {
+	"ZERO", "DEC0", "DEC1", "DEC2", "DEC3",
+	"RX0", "RX1", "RX2", "RX3", "RX4", "RX5"
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
+static const char *const rx_macro_mux_text[] = {
+	"ZERO", "AIF1_PB", "AIF2_PB", "AIF3_PB", "AIF4_PB"
+};
+
 static const char *const rx_macro_hph_pwr_mode_text[] = {
 	"ULP", "LOHIFI"
 };
 
+static const char * const rx_echo_mux_text[] = {
+	"ZERO", "RX_MIX0", "RX_MIX1", "RX_MIX2"
+};
+
 static const struct soc_enum rx_macro_hph_pwr_mode_enum =
 		SOC_ENUM_SINGLE_EXT(2, rx_macro_hph_pwr_mode_text);
+static const struct soc_enum rx_mix_tx2_mux_enum =
+		SOC_ENUM_SINGLE(CDC_RX_INP_MUX_RX_MIX_CFG5, 0, 4, rx_echo_mux_text);
+static const struct soc_enum rx_mix_tx1_mux_enum =
+		SOC_ENUM_SINGLE(CDC_RX_INP_MUX_RX_MIX_CFG4, 0, 4, rx_echo_mux_text);
+static const struct soc_enum rx_mix_tx0_mux_enum =
+		SOC_ENUM_SINGLE(CDC_RX_INP_MUX_RX_MIX_CFG4, 4, 4, rx_echo_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(rx_int0_2_enum, CDC_RX_INP_MUX_RX_INT0_CFG1, 0,
+			    rx_int_mix_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_int1_2_enum, CDC_RX_INP_MUX_RX_INT1_CFG1, 0,
+			    rx_int_mix_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_int2_2_enum, CDC_RX_INP_MUX_RX_INT2_CFG1, 0,
+			    rx_int_mix_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(rx_int0_1_mix_inp0_enum, CDC_RX_INP_MUX_RX_INT0_CFG0, 0,
+			    rx_prim_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int0_1_mix_inp1_enum, CDC_RX_INP_MUX_RX_INT0_CFG0, 4,
+			    rx_prim_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int0_1_mix_inp2_enum, CDC_RX_INP_MUX_RX_INT0_CFG1, 4,
+			    rx_prim_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int1_1_mix_inp0_enum, CDC_RX_INP_MUX_RX_INT1_CFG0, 0,
+			    rx_prim_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int1_1_mix_inp1_enum, CDC_RX_INP_MUX_RX_INT1_CFG0, 4,
+			    rx_prim_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int1_1_mix_inp2_enum, CDC_RX_INP_MUX_RX_INT1_CFG1, 4,
+			    rx_prim_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int2_1_mix_inp0_enum, CDC_RX_INP_MUX_RX_INT2_CFG0, 0,
+			    rx_prim_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int2_1_mix_inp1_enum, CDC_RX_INP_MUX_RX_INT2_CFG0, 4,
+			    rx_prim_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int2_1_mix_inp2_enum, CDC_RX_INP_MUX_RX_INT2_CFG1, 4,
+			    rx_prim_mix_text);
+
+static SOC_ENUM_SINGLE_DECL(rx_int0_mix2_inp_enum, CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 2,
+			    rx_sidetone_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int1_mix2_inp_enum, CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 4,
+			    rx_sidetone_mix_text);
+static SOC_ENUM_SINGLE_DECL(rx_int2_mix2_inp_enum, CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 6,
+			    rx_sidetone_mix_text);
+static SOC_ENUM_SINGLE_DECL(iir0_inp0_enum, CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG0, 0,
+			    iir_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(iir0_inp1_enum, CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG1, 0,
+			    iir_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(iir0_inp2_enum, CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG2, 0,
+			    iir_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(iir0_inp3_enum, CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG3, 0,
+			    iir_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(iir1_inp0_enum, CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG0, 0,
+			    iir_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(iir1_inp1_enum, CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG1, 0,
+			    iir_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(iir1_inp2_enum, CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG2, 0,
+			    iir_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(iir1_inp3_enum, CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG3, 0,
+			    iir_inp_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(rx_int0_1_interp_enum, SND_SOC_NOPM, 0,
+			    rx_int0_1_interp_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_int1_1_interp_enum, SND_SOC_NOPM, 0,
+			    rx_int1_1_interp_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_int2_1_interp_enum, SND_SOC_NOPM, 0,
+			    rx_int2_1_interp_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_int0_2_interp_enum, SND_SOC_NOPM, 0,
+			    rx_int0_2_interp_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_int1_2_interp_enum, SND_SOC_NOPM, 0,
+			    rx_int1_2_interp_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_int2_2_interp_enum, SND_SOC_NOPM, 0,
+			    rx_int2_2_interp_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_int0_dem_inp_enum, CDC_RX_RX0_RX_PATH_CFG1, 0,
+			    rx_int_dem_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_int1_dem_inp_enum, CDC_RX_RX1_RX_PATH_CFG1, 0,
+			    rx_int_dem_inp_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(rx_macro_rx0_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_macro_rx1_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_macro_rx2_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_macro_rx3_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_macro_rx4_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_macro_rx5_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
+
+static const struct snd_kcontrol_new rx_mix_tx1_mux =
+		SOC_DAPM_ENUM("RX MIX TX1_MUX Mux", rx_mix_tx1_mux_enum);
+static const struct snd_kcontrol_new rx_mix_tx2_mux = 
+		SOC_DAPM_ENUM("RX MIX TX2_MUX Mux", rx_mix_tx2_mux_enum);
+static const struct snd_kcontrol_new rx_int0_2_mux =
+		SOC_DAPM_ENUM("rx_int0_2", rx_int0_2_enum);
+static const struct snd_kcontrol_new rx_int1_2_mux =
+		SOC_DAPM_ENUM("rx_int1_2", rx_int1_2_enum);
+static const struct snd_kcontrol_new rx_int2_2_mux =
+		SOC_DAPM_ENUM("rx_int2_2", rx_int2_2_enum);
+static const struct snd_kcontrol_new rx_int0_1_mix_inp0_mux =
+		SOC_DAPM_ENUM("rx_int0_1_mix_inp0", rx_int0_1_mix_inp0_enum);
+static const struct snd_kcontrol_new rx_int0_1_mix_inp1_mux =
+		SOC_DAPM_ENUM("rx_int0_1_mix_inp1", rx_int0_1_mix_inp1_enum);
+static const struct snd_kcontrol_new rx_int0_1_mix_inp2_mux =
+		SOC_DAPM_ENUM("rx_int0_1_mix_inp2", rx_int0_1_mix_inp2_enum);
+static const struct snd_kcontrol_new rx_int1_1_mix_inp0_mux =
+		SOC_DAPM_ENUM("rx_int1_1_mix_inp0", rx_int1_1_mix_inp0_enum);
+static const struct snd_kcontrol_new rx_int1_1_mix_inp1_mux =
+		SOC_DAPM_ENUM("rx_int1_1_mix_inp1", rx_int1_1_mix_inp1_enum);
+static const struct snd_kcontrol_new rx_int1_1_mix_inp2_mux =
+		SOC_DAPM_ENUM("rx_int1_1_mix_inp2", rx_int1_1_mix_inp2_enum);
+static const struct snd_kcontrol_new rx_int2_1_mix_inp0_mux =
+		SOC_DAPM_ENUM("rx_int2_1_mix_inp0", rx_int2_1_mix_inp0_enum);
+static const struct snd_kcontrol_new rx_int2_1_mix_inp1_mux =
+		SOC_DAPM_ENUM("rx_int2_1_mix_inp1", rx_int2_1_mix_inp1_enum);
+static const struct snd_kcontrol_new rx_int2_1_mix_inp2_mux =
+		SOC_DAPM_ENUM("rx_int2_1_mix_inp2", rx_int2_1_mix_inp2_enum);
+static const struct snd_kcontrol_new rx_int0_mix2_inp_mux =
+		SOC_DAPM_ENUM("rx_int0_mix2_inp", rx_int0_mix2_inp_enum);
+static const struct snd_kcontrol_new rx_int1_mix2_inp_mux =
+		SOC_DAPM_ENUM("rx_int1_mix2_inp", rx_int1_mix2_inp_enum);
+static const struct snd_kcontrol_new rx_int2_mix2_inp_mux =
+		SOC_DAPM_ENUM("rx_int2_mix2_inp", rx_int2_mix2_inp_enum);
+static const struct snd_kcontrol_new iir0_inp0_mux =
+		SOC_DAPM_ENUM("iir0_inp0", iir0_inp0_enum);
+static const struct snd_kcontrol_new iir0_inp1_mux =
+		SOC_DAPM_ENUM("iir0_inp1", iir0_inp1_enum);
+static const struct snd_kcontrol_new iir0_inp2_mux =
+		SOC_DAPM_ENUM("iir0_inp2", iir0_inp2_enum);
+static const struct snd_kcontrol_new iir0_inp3_mux =
+		SOC_DAPM_ENUM("iir0_inp3", iir0_inp3_enum);
+static const struct snd_kcontrol_new iir1_inp0_mux =
+		SOC_DAPM_ENUM("iir1_inp0", iir1_inp0_enum);
+static const struct snd_kcontrol_new iir1_inp1_mux =
+		SOC_DAPM_ENUM("iir1_inp1", iir1_inp1_enum);
+static const struct snd_kcontrol_new iir1_inp2_mux =
+		SOC_DAPM_ENUM("iir1_inp2", iir1_inp2_enum);
+static const struct snd_kcontrol_new iir1_inp3_mux =
+		SOC_DAPM_ENUM("iir1_inp3", iir1_inp3_enum);
+static const struct snd_kcontrol_new rx_int0_1_interp_mux =
+		SOC_DAPM_ENUM("rx_int0_1_interp", rx_int0_1_interp_enum);
+static const struct snd_kcontrol_new rx_int1_1_interp_mux =
+		SOC_DAPM_ENUM("rx_int1_1_interp", rx_int1_1_interp_enum);
+static const struct snd_kcontrol_new rx_int2_1_interp_mux =
+		SOC_DAPM_ENUM("rx_int2_1_interp", rx_int2_1_interp_enum);
+static const struct snd_kcontrol_new rx_int0_2_interp_mux =
+		SOC_DAPM_ENUM("rx_int0_2_interp", rx_int0_2_interp_enum);
+static const struct snd_kcontrol_new rx_int1_2_interp_mux =
+		SOC_DAPM_ENUM("rx_int1_2_interp", rx_int1_2_interp_enum);
+static const struct snd_kcontrol_new rx_int2_2_interp_mux =
+		SOC_DAPM_ENUM("rx_int2_2_interp", rx_int2_2_interp_enum);
+static const struct snd_kcontrol_new rx_mix_tx0_mux =
+		SOC_DAPM_ENUM("RX MIX TX0_MUX Mux", rx_mix_tx0_mux_enum);
 
 static const struct reg_default rx_defaults[] = {
 	/* RX Macro */
@@ -1264,6 +1462,41 @@ static const struct regmap_config rx_regmap_config = {
 	.readable_reg = rx_is_readable_register,
 };
 
+static int rx_macro_int_dem_inp_mux_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned short look_ahead_dly_reg;
+	unsigned int val;
+
+	val = ucontrol->value.enumerated.item[0];
+
+	if (e->reg == CDC_RX_RX0_RX_PATH_CFG1)
+		look_ahead_dly_reg = CDC_RX_RX0_RX_PATH_CFG0;
+	else if (e->reg == CDC_RX_RX1_RX_PATH_CFG1)
+		look_ahead_dly_reg = CDC_RX_RX1_RX_PATH_CFG0;
+
+	/* Set Look Ahead Delay */
+	if (val)
+		snd_soc_component_update_bits(component, look_ahead_dly_reg,
+					      CDC_RX_DLY_ZN_EN_MASK,
+					      CDC_RX_DLY_ZN_ENABLE);
+	else
+		snd_soc_component_update_bits(component, look_ahead_dly_reg,
+					      CDC_RX_DLY_ZN_EN_MASK, 0);
+	/* Set DEM INP Select */
+	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+}
+
+static const struct snd_kcontrol_new rx_int0_dem_inp_mux =
+		SOC_DAPM_ENUM_EXT("rx_int0_dem_inp", rx_int0_dem_inp_enum,
+		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
+static const struct snd_kcontrol_new rx_int1_dem_inp_mux =
+		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_int1_dem_inp_enum,
+		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
+
 static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 					       int rate_reg_val, u32 sample_rate)
 {
@@ -1622,6 +1855,248 @@ static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 	}
 }
 
+static int rx_macro_mclk_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		rx_macro_mclk_enable(rx, true);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		rx_macro_mclk_enable(rx, false);
+		break;
+	default:
+		dev_err(component->dev, "%s: invalid DAPM event %d\n", __func__, event);
+		ret = -EINVAL;
+	}
+	return ret;
+}
+
+static bool rx_macro_adie_lb(struct snd_soc_component *component,
+			     int interp_idx)
+{
+	u16 int_mux_cfg0, int_mux_cfg1;
+	u8 int_n_inp0, int_n_inp1, int_n_inp2;
+
+	int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + interp_idx * 8;
+	int_mux_cfg1 = int_mux_cfg0 + 4;
+
+	int_n_inp0 = snd_soc_component_read_field(component, int_mux_cfg0,
+						  CDC_RX_INTX_1_MIX_INP0_SEL_MASK);
+	int_n_inp1 = snd_soc_component_read_field(component, int_mux_cfg0,
+						  CDC_RX_INTX_1_MIX_INP1_SEL_MASK);
+	int_n_inp2 = snd_soc_component_read_field(component, int_mux_cfg1,
+						  CDC_RX_INTX_1_MIX_INP2_SEL_MASK);
+
+	if (int_n_inp0 == INTn_1_INP_SEL_DEC0 ||
+		int_n_inp0 == INTn_1_INP_SEL_DEC1 ||
+		int_n_inp0 == INTn_1_INP_SEL_IIR0 ||
+		int_n_inp0 == INTn_1_INP_SEL_IIR1)
+		return true;
+
+	if (int_n_inp1 == INTn_1_INP_SEL_DEC0 ||
+		int_n_inp1 == INTn_1_INP_SEL_DEC1 ||
+		int_n_inp1 == INTn_1_INP_SEL_IIR0 ||
+		int_n_inp1 == INTn_1_INP_SEL_IIR1)
+		return true;
+
+	if (int_n_inp2 == INTn_1_INP_SEL_DEC0 ||
+		int_n_inp2 == INTn_1_INP_SEL_DEC1 ||
+		int_n_inp2 == INTn_1_INP_SEL_IIR0 ||
+		int_n_inp2 == INTn_1_INP_SEL_IIR1)
+		return true;
+
+	return false;
+}
+
+static int rx_macro_enable_interp_clk(struct snd_soc_component *component,
+				      int event, int interp_idx);
+static int rx_macro_enable_main_path(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 gain_reg, reg;
+
+	reg = CDC_RX_RXn_RX_PATH_CTL(w->shift);
+	gain_reg = CDC_RX_RXn_RX_VOL_CTL(w->shift);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		rx_macro_enable_interp_clk(component, event, w->shift);
+		if (rx_macro_adie_lb(component, w->shift))
+			snd_soc_component_update_bits(component, reg,
+						      CDC_RX_PATH_CLK_EN_MASK,
+						      CDC_RX_PATH_CLK_ENABLE);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_write(component, gain_reg,
+			snd_soc_component_read(component, gain_reg));
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		rx_macro_enable_interp_clk(component, event, w->shift);
+		break;
+	}
+
+	return 0;
+}
+
+static int rx_macro_config_compander(struct snd_soc_component *component,
+				struct rx_macro *rx,
+				int comp, int event)
+{
+	u8 pcm_rate, val;
+
+	/* AUX does not have compander */
+	if (comp == INTERP_AUX)
+		return 0;
+
+	pcm_rate = snd_soc_component_read(component, CDC_RX_RXn_RX_PATH_CTL(comp)) & 0x0F;
+	if (pcm_rate < 0x06)
+		val = 0x03;
+	else if (pcm_rate < 0x08)
+		val = 0x01;
+	else if (pcm_rate < 0x0B)
+		val = 0x02;
+	else
+		val = 0x00;
+
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(comp),
+					      CDC_RX_DC_COEFF_SEL_MASK, val);
+
+	if (SND_SOC_DAPM_EVENT_OFF(event))
+		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(comp),
+					      CDC_RX_DC_COEFF_SEL_MASK, 0x3);
+	if (!rx->comp_enabled[comp])
+		return 0;
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Enable Compander Clock */
+		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
+					      CDC_RX_COMPANDERn_CLK_EN_MASK, 0x1);
+		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
+					      CDC_RX_COMPANDERn_SOFT_RST_MASK, 0x1);
+		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
+					      CDC_RX_COMPANDERn_SOFT_RST_MASK, 0x0);
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(comp),
+					      CDC_RX_RXn_COMP_EN_MASK, 0x1);
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
+					      CDC_RX_COMPANDERn_HALT_MASK, 0x1);
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(comp),
+					      CDC_RX_RXn_COMP_EN_MASK, 0x0);
+		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
+					      CDC_RX_COMPANDERn_CLK_EN_MASK, 0x0);
+		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
+					      CDC_RX_COMPANDERn_HALT_MASK, 0x0);
+	}
+
+	return 0;
+}
+
+static int rx_macro_load_compander_coeff(struct snd_soc_component *component,
+					 struct rx_macro *rx,
+					 int comp, int event)
+{
+	u16 comp_coeff_lsb_reg, comp_coeff_msb_reg;
+	int i;
+	int hph_pwr_mode = HPH_LOHIFI;
+
+	if (!rx->comp_enabled[comp])
+		return 0;
+
+	if (comp == INTERP_HPHL) {
+		comp_coeff_lsb_reg = CDC_RX_TOP_HPHL_COMP_WR_LSB;
+		comp_coeff_msb_reg = CDC_RX_TOP_HPHL_COMP_WR_MSB;
+	} else if (comp == INTERP_HPHR) {
+		comp_coeff_lsb_reg = CDC_RX_TOP_HPHR_COMP_WR_LSB;
+		comp_coeff_msb_reg = CDC_RX_TOP_HPHR_COMP_WR_MSB;
+	} else {
+		/* compander coefficients are loaded only for hph path */
+		return 0;
+	}
+
+	hph_pwr_mode = rx->hph_pwr_mode;
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Load Compander Coeff */
+		for (i = 0; i < COMP_MAX_COEFF; i++) {
+			snd_soc_component_write(component, comp_coeff_lsb_reg,
+					comp_coeff_table[hph_pwr_mode][i].lsb);
+			snd_soc_component_write(component, comp_coeff_msb_reg,
+					comp_coeff_table[hph_pwr_mode][i].msb);
+		}
+	}
+
+	return 0;
+}
+
+static void rx_macro_enable_softclip_clk(struct snd_soc_component *component,
+					 struct rx_macro *rx, bool enable)
+{
+	if (enable) {
+		if (rx->softclip_clk_users == 0)
+			snd_soc_component_write_field(component, CDC_RX_SOFTCLIP_CRC,
+						      CDC_RX_SOFTCLIP_CLK_EN_MASK, 1);
+		rx->softclip_clk_users++;
+	} else {
+		rx->softclip_clk_users--;
+		if (rx->softclip_clk_users == 0)
+			snd_soc_component_write_field(component, CDC_RX_SOFTCLIP_CRC,
+						      CDC_RX_SOFTCLIP_CLK_EN_MASK, 0);
+	}
+}
+
+static int rx_macro_config_softclip(struct snd_soc_component *component,
+				    struct rx_macro *rx, int event)
+{
+
+	if (!rx->is_softclip_on)
+		return 0;
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Enable Softclip clock */
+		rx_macro_enable_softclip_clk(component, rx, true);
+		/* Enable Softclip control */
+		snd_soc_component_write_field(component, CDC_RX_SOFTCLIP_SOFTCLIP_CTRL,
+					     CDC_RX_SOFTCLIP_EN_MASK, 0x01);
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_write_field(component, CDC_RX_SOFTCLIP_SOFTCLIP_CTRL,
+					     CDC_RX_SOFTCLIP_EN_MASK, 0x0);
+		rx_macro_enable_softclip_clk(component, rx, false);
+	}
+
+	return 0;
+}
+
+static int rx_macro_config_aux_hpf(struct snd_soc_component *component,
+				   struct rx_macro *rx, int event)
+{
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Update Aux HPF control */
+		if (!rx->is_aux_hpf_on)
+			snd_soc_component_update_bits(component,
+				CDC_RX_RX2_RX_PATH_CFG1, 0x04, 0x00);
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		/* Reset to default (HPF=ON) */
+		snd_soc_component_update_bits(component,
+			CDC_RX_RX2_RX_PATH_CFG1, 0x04, 0x04);
+	}
+
+	return 0;
+}
+
 static inline void rx_macro_enable_clsh_block(struct rx_macro *rx, bool enable)
 {
 	if ((enable && ++rx->clsh_users == 1) || (!enable && --rx->clsh_users == 0))
@@ -1631,6 +2106,106 @@ static inline void rx_macro_enable_clsh_block(struct rx_macro *rx, bool enable)
 		rx->clsh_users = 0;
 }
 
+static int rx_macro_config_classh(struct snd_soc_component *component,
+				struct rx_macro *rx,
+				int interp_n, int event)
+{
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		rx_macro_enable_clsh_block(rx, false);
+		return 0;
+	}
+
+	if (!SND_SOC_DAPM_EVENT_ON(event))
+		return 0;
+
+	rx_macro_enable_clsh_block(rx, true);
+	if (interp_n == INTERP_HPHL ||
+		interp_n == INTERP_HPHR) {
+		/*
+		 * These K1 values depend on the Headphone Impedance
+		 * For now it is assumed to be 16 ohm
+		 */
+		snd_soc_component_write(component, CDC_RX_CLSH_K1_LSB, 0xc0);
+		snd_soc_component_write_field(component, CDC_RX_CLSH_K1_MSB,
+					      CDC_RX_CLSH_K1_MSB_COEFF_MASK, 0);
+	}
+	switch (interp_n) {
+	case INTERP_HPHL:
+		if (rx->is_ear_mode_on)
+			snd_soc_component_update_bits(component,
+				CDC_RX_CLSH_HPH_V_PA,
+				CDC_RX_CLSH_HPH_V_PA_MIN_MASK, 0x39);
+		else
+			snd_soc_component_update_bits(component,
+				CDC_RX_CLSH_HPH_V_PA,
+				CDC_RX_CLSH_HPH_V_PA_MIN_MASK, 0x1c);
+		snd_soc_component_update_bits(component,
+				CDC_RX_CLSH_DECAY_CTRL,
+				CDC_RX_CLSH_DECAY_RATE_MASK, 0x0);
+		snd_soc_component_write_field(component,
+				CDC_RX_RX0_RX_PATH_CFG0,
+				CDC_RX_RXn_CLSH_EN_MASK, 0x1);
+		break;
+	case INTERP_HPHR:
+		if (rx->is_ear_mode_on)
+			snd_soc_component_update_bits(component,
+				CDC_RX_CLSH_HPH_V_PA,
+				CDC_RX_CLSH_HPH_V_PA_MIN_MASK, 0x39);
+		else
+			snd_soc_component_update_bits(component,
+				CDC_RX_CLSH_HPH_V_PA,
+				CDC_RX_CLSH_HPH_V_PA_MIN_MASK, 0x1c);
+		snd_soc_component_update_bits(component,
+				CDC_RX_CLSH_DECAY_CTRL,
+				CDC_RX_CLSH_DECAY_RATE_MASK, 0x0);
+		snd_soc_component_update_bits(component,
+				CDC_RX_RX1_RX_PATH_CFG0,
+				CDC_RX_RXn_CLSH_EN_MASK, 0x1);
+		break;
+	case INTERP_AUX:
+		snd_soc_component_update_bits(component,
+				CDC_RX_RX2_RX_PATH_CFG0,
+				CDC_RX_RX2_DLY_Z_EN_MASK, 1);
+		snd_soc_component_write_field(component,
+				CDC_RX_RX2_RX_PATH_CFG0,
+				CDC_RX_RX2_CLSH_EN_MASK, 1);
+		break;
+	}
+
+	return 0;
+}
+
+static void rx_macro_hd2_control(struct snd_soc_component *component,
+				 u16 interp_idx, int event)
+{
+	u16 hd2_scale_reg, hd2_enable_reg;
+
+	switch (interp_idx) {
+	case INTERP_HPHL:
+		hd2_scale_reg = CDC_RX_RX0_RX_PATH_SEC3;
+		hd2_enable_reg = CDC_RX_RX0_RX_PATH_CFG0;
+		break;
+	case INTERP_HPHR:
+		hd2_scale_reg = CDC_RX_RX1_RX_PATH_SEC3;
+		hd2_enable_reg = CDC_RX_RX1_RX_PATH_CFG0;
+		break;
+	}
+
+	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+				CDC_RX_RXn_HD2_ALPHA_MASK, 0x14);
+		snd_soc_component_write_field(component, hd2_enable_reg,
+					      CDC_RX_RXn_HD2_EN_MASK, 1);
+	}
+
+	if (hd2_enable_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_write_field(component, hd2_enable_reg,
+					      CDC_RX_RXn_HD2_EN_MASK, 0);
+		snd_soc_component_update_bits(component, hd2_scale_reg,
+				CDC_RX_RXn_HD2_ALPHA_MASK, 0x0);
+	}
+}
+
 static int rx_macro_get_compander(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
@@ -1656,6 +2231,91 @@ static int rx_macro_set_compander(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int rx_macro_mux_get(struct snd_kcontrol *kcontrol,
+			  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] =
+			rx->rx_port_value[widget->shift];
+	return 0;
+}
+
+static int rx_macro_mux_put(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	struct snd_soc_dapm_update *update = NULL;
+	u32 rx_port_value = ucontrol->value.integer.value[0];
+	u32 aif_rst;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	aif_rst = rx->rx_port_value[widget->shift];
+	if (!rx_port_value) {
+		if (aif_rst == 0) {
+			dev_err(component->dev, "%s:AIF reset already\n", __func__);
+			return 0;
+		}
+		if (aif_rst > RX_MACRO_AIF4_PB) {
+			dev_err(component->dev, "%s: Invalid AIF reset\n", __func__);
+			return 0;
+		}
+	}
+	rx->rx_port_value[widget->shift] = rx_port_value;
+
+	switch (rx_port_value) {
+	case 0:
+		if (rx->active_ch_cnt[aif_rst]) {
+			clear_bit(widget->shift,
+				&rx->active_ch_mask[aif_rst]);
+			rx->active_ch_cnt[aif_rst]--;
+		}
+		break;
+	case 1:
+	case 2:
+	case 3:
+	case 4:
+		set_bit(widget->shift,
+			&rx->active_ch_mask[rx_port_value]);
+		rx->active_ch_cnt[rx_port_value]++;
+		break;
+	default:
+		dev_err(component->dev,
+			"%s:Invalid AIF_ID for RX_MACRO MUX %d\n",
+			__func__, rx_port_value);
+		goto err;
+	}
+
+	snd_soc_dapm_mux_update_power(widget->dapm, kcontrol,
+					rx_port_value, e, update);
+	return 0;
+err:
+	return -EINVAL;
+}
+
+static const struct snd_kcontrol_new rx_macro_rx0_mux =
+		SOC_DAPM_ENUM_EXT("rx_macro_rx0", rx_macro_rx0_enum,
+		  rx_macro_mux_get, rx_macro_mux_put);
+static const struct snd_kcontrol_new rx_macro_rx1_mux =
+		SOC_DAPM_ENUM_EXT("rx_macro_rx1", rx_macro_rx1_enum,
+		  rx_macro_mux_get, rx_macro_mux_put);
+static const struct snd_kcontrol_new rx_macro_rx2_mux =
+		SOC_DAPM_ENUM_EXT("rx_macro_rx2", rx_macro_rx2_enum,
+		  rx_macro_mux_get, rx_macro_mux_put);
+static const struct snd_kcontrol_new rx_macro_rx3_mux =
+		SOC_DAPM_ENUM_EXT("rx_macro_rx3", rx_macro_rx3_enum,
+		  rx_macro_mux_get, rx_macro_mux_put);
+static const struct snd_kcontrol_new rx_macro_rx4_mux =
+		SOC_DAPM_ENUM_EXT("rx_macro_rx4", rx_macro_rx4_enum,
+		  rx_macro_mux_get, rx_macro_mux_put);
+static const struct snd_kcontrol_new rx_macro_rx5_mux =
+		SOC_DAPM_ENUM_EXT("rx_macro_rx5", rx_macro_rx5_enum,
+		  rx_macro_mux_get, rx_macro_mux_put);
+
 static int rx_macro_get_ear_mode(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
@@ -1760,6 +2420,187 @@ static int rx_macro_aux_hpf_mode_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static void rx_macro_hphdelay_lutbypass(struct snd_soc_component *component,
+					struct rx_macro *rx,
+					u16 interp_idx, int event)
+{
+	u16 hph_lut_bypass_reg;
+	u16 hph_comp_ctrl7;
+
+	switch (interp_idx) {
+	case INTERP_HPHL:
+		hph_lut_bypass_reg = CDC_RX_TOP_HPHL_COMP_LUT;
+		hph_comp_ctrl7 = CDC_RX_COMPANDER0_CTL7;
+		break;
+	case INTERP_HPHR:
+		hph_lut_bypass_reg = CDC_RX_TOP_HPHR_COMP_LUT;
+		hph_comp_ctrl7 = CDC_RX_COMPANDER1_CTL7;
+		break;
+	default:
+		break;
+	}
+
+	if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_ON(event)) {
+		if (interp_idx == INTERP_HPHL) {
+			if (rx->is_ear_mode_on)
+				snd_soc_component_write_field(component,
+					CDC_RX_RX0_RX_PATH_CFG1,
+					CDC_RX_RX0_HPH_L_EAR_SEL_MASK, 0x1);
+			else
+				snd_soc_component_write_field(component,
+					hph_lut_bypass_reg,
+					CDC_RX_TOP_HPH_LUT_BYPASS_MASK, 1);
+		} else {
+			snd_soc_component_write_field(component, hph_lut_bypass_reg,
+					CDC_RX_TOP_HPH_LUT_BYPASS_MASK, 1);
+		}
+		if (rx->hph_pwr_mode)
+			snd_soc_component_write_field(component, hph_comp_ctrl7,
+					CDC_RX_COMPANDER1_HPH_LOW_PWR_MODE_MASK, 0x0);
+	}
+
+	if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
+		snd_soc_component_write_field(component,
+					CDC_RX_RX0_RX_PATH_CFG1,
+					CDC_RX_RX0_HPH_L_EAR_SEL_MASK, 0x0);
+		snd_soc_component_update_bits(component, hph_lut_bypass_reg,
+					CDC_RX_TOP_HPH_LUT_BYPASS_MASK, 0);
+		snd_soc_component_write_field(component, hph_comp_ctrl7,
+					CDC_RX_COMPANDER1_HPH_LOW_PWR_MODE_MASK, 0x1);
+	}
+}
+
+static int rx_macro_enable_interp_clk(struct snd_soc_component *component,
+				      int event, int interp_idx)
+{
+	u16 main_reg, dsm_reg, rx_cfg2_reg;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	main_reg = CDC_RX_RXn_RX_PATH_CTL(interp_idx);
+	dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(interp_idx);
+	if (interp_idx == INTERP_AUX)
+		dsm_reg = CDC_RX_RX2_RX_PATH_DSM_CTL;
+	rx_cfg2_reg = CDC_RX_RXn_RX_PATH_CFG2(interp_idx);
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		if (rx->main_clk_users[interp_idx] == 0) {
+			/* Main path PGA mute enable */
+			snd_soc_component_write_field(component, main_reg,
+						      CDC_RX_PATH_PGA_MUTE_MASK, 0x1);
+			snd_soc_component_write_field(component, dsm_reg,
+						      CDC_RX_RXn_DSM_CLK_EN_MASK, 0x1);
+			snd_soc_component_update_bits(component, rx_cfg2_reg,
+					CDC_RX_RXn_HPF_CUT_FREQ_MASK, 0x03);
+			rx_macro_load_compander_coeff(component, rx, interp_idx, event);
+			if (rx->hph_hd2_mode)
+				rx_macro_hd2_control(component, interp_idx, event);
+			rx_macro_hphdelay_lutbypass(component, rx, interp_idx, event);
+			rx_macro_config_compander(component, rx, interp_idx, event);
+			if (interp_idx == INTERP_AUX) {
+				rx_macro_config_softclip(component, rx,	event);
+				rx_macro_config_aux_hpf(component, rx, event);
+			}
+			rx_macro_config_classh(component, rx, interp_idx, event);
+		}
+		rx->main_clk_users[interp_idx]++;
+	}
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		rx->main_clk_users[interp_idx]--;
+		if (rx->main_clk_users[interp_idx] <= 0) {
+			rx->main_clk_users[interp_idx] = 0;
+			/* Main path PGA mute enable */
+			snd_soc_component_write_field(component, main_reg,
+						      CDC_RX_PATH_PGA_MUTE_MASK, 0x1);
+			/* Clk Disable */
+			snd_soc_component_write_field(component, dsm_reg,
+						      CDC_RX_RXn_DSM_CLK_EN_MASK, 0);
+			snd_soc_component_write_field(component, main_reg,
+						      CDC_RX_PATH_CLK_EN_MASK, 0);
+			/* Reset enable and disable */
+			snd_soc_component_write_field(component, main_reg,
+						      CDC_RX_PATH_RESET_EN_MASK, 1);
+			snd_soc_component_write_field(component, main_reg,
+						      CDC_RX_PATH_RESET_EN_MASK, 0);
+			/* Reset rate to 48K*/
+			snd_soc_component_update_bits(component, main_reg,
+						      CDC_RX_PATH_PCM_RATE_MASK,
+						      0x04);
+			snd_soc_component_update_bits(component, rx_cfg2_reg,
+						      CDC_RX_RXn_HPF_CUT_FREQ_MASK, 0x00);
+			rx_macro_config_classh(component, rx, interp_idx, event);
+			rx_macro_config_compander(component, rx, interp_idx, event);
+			if (interp_idx ==  INTERP_AUX) {
+				rx_macro_config_softclip(component, rx,	event);
+				rx_macro_config_aux_hpf(component, rx, event);
+			}
+			rx_macro_hphdelay_lutbypass(component, rx, interp_idx, event);
+			if (rx->hph_hd2_mode)
+				rx_macro_hd2_control(component, interp_idx, event);
+		}
+	}
+
+	return rx->main_clk_users[interp_idx];
+}
+
+static int rx_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
+				    struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 gain_reg, mix_reg;
+
+	gain_reg = CDC_RX_RXn_RX_VOL_MIX_CTL(w->shift);
+	mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(w->shift);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		rx_macro_enable_interp_clk(component, event, w->shift);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_write(component, gain_reg,
+					snd_soc_component_read(component, gain_reg));
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Clk Disable */
+		snd_soc_component_update_bits(component, mix_reg,
+					      CDC_RX_RXn_MIX_CLK_EN_MASK, 0x00);
+		rx_macro_enable_interp_clk(component, event, w->shift);
+		/* Reset enable and disable */
+		snd_soc_component_update_bits(component, mix_reg,
+					      CDC_RX_RXn_MIX_RESET_MASK,
+					      CDC_RX_RXn_MIX_RESET);
+		snd_soc_component_update_bits(component, mix_reg,
+					      CDC_RX_RXn_MIX_RESET_MASK, 0x00);
+		break;
+	}
+
+	return 0;
+}
+
+static int rx_macro_enable_rx_path_clk(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		rx_macro_enable_interp_clk(component, event, w->shift);
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(w->shift),
+					      CDC_RX_RXn_SIDETONE_EN_MASK, 1);
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CTL(w->shift),
+					      CDC_RX_PATH_CLK_EN_MASK, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(w->shift),
+					      CDC_RX_RXn_SIDETONE_EN_MASK, 0);
+		rx_macro_enable_interp_clk(component, event, w->shift);
+		break;
+	default:
+		break;
+	};
+	return 0;
+}
+
 static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
 			  -84, 40, digital_gain),
@@ -1796,6 +2637,500 @@ static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
 			rx_macro_aux_hpf_mode_put),
 };
 
+static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol,
+				int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 val, ec_hq_reg;
+	int ec_tx;
+
+	val = snd_soc_component_read(component,
+			CDC_RX_INP_MUX_RX_MIX_CFG4);
+	if (!(strcmp(w->name, "RX MIX TX0 MUX")))
+		ec_tx = ((val & 0xf0) >> 0x4) - 1;
+	else if (!(strcmp(w->name, "RX MIX TX1 MUX")))
+		ec_tx = (val & 0x0f) - 1;
+
+	val = snd_soc_component_read(component,
+			CDC_RX_INP_MUX_RX_MIX_CFG5);
+	if (!(strcmp(w->name, "RX MIX TX2 MUX")))
+		ec_tx = (val & 0x0f) - 1;
+
+	if (ec_tx < 0 || (ec_tx >= RX_MACRO_EC_MUX_MAX)) {
+		dev_err(component->dev, "%s: EC mix control not set correctly\n",
+			__func__);
+		return -EINVAL;
+	}
+	ec_hq_reg = CDC_RX_EC_REF_HQ0_EC_REF_HQ_PATH_CTL +
+			    0x40 * ec_tx;
+	snd_soc_component_update_bits(component, ec_hq_reg, 0x01, 0x01);
+	ec_hq_reg = CDC_RX_EC_REF_HQ0_EC_REF_HQ_CFG0 +
+				0x40 * ec_tx;
+	/* default set to 48k */
+	snd_soc_component_update_bits(component, ec_hq_reg, 0x1E, 0x08);
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("RX AIF1 PB", "RX_MACRO_AIF1 Playback", 0,
+		SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("RX AIF2 PB", "RX_MACRO_AIF2 Playback", 0,
+		SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("RX AIF3 PB", "RX_MACRO_AIF3 Playback", 0,
+		SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("RX AIF4 PB", "RX_MACRO_AIF4 Playback", 0,
+		SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_OUT("RX AIF_ECHO", "RX_AIF_ECHO Capture", 0,
+		SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_MUX("RX_MACRO RX0 MUX", SND_SOC_NOPM, RX_MACRO_RX0, 0,
+			 &rx_macro_rx0_mux),
+	SND_SOC_DAPM_MUX("RX_MACRO RX1 MUX", SND_SOC_NOPM, RX_MACRO_RX1, 0,
+			 &rx_macro_rx1_mux),
+	SND_SOC_DAPM_MUX("RX_MACRO RX2 MUX", SND_SOC_NOPM, RX_MACRO_RX2, 0,
+			 &rx_macro_rx2_mux),
+	SND_SOC_DAPM_MUX("RX_MACRO RX3 MUX", SND_SOC_NOPM, RX_MACRO_RX3, 0,
+			 &rx_macro_rx3_mux),
+	SND_SOC_DAPM_MUX("RX_MACRO RX4 MUX", SND_SOC_NOPM, RX_MACRO_RX4, 0,
+			 &rx_macro_rx4_mux),
+	SND_SOC_DAPM_MUX("RX_MACRO RX5 MUX", SND_SOC_NOPM, RX_MACRO_RX5, 0,
+			 &rx_macro_rx5_mux),
+
+	SND_SOC_DAPM_MIXER("RX_RX0", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX_RX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX_RX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX_RX3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX_RX4", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX_RX5", SND_SOC_NOPM, 0, 0, NULL, 0),
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
+	SND_SOC_DAPM_MUX_E("RX MIX TX0 MUX", SND_SOC_NOPM,
+			   RX_MACRO_EC0_MUX, 0,
+			   &rx_mix_tx0_mux, rx_macro_enable_echo,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX MIX TX1 MUX", SND_SOC_NOPM,
+			   RX_MACRO_EC1_MUX, 0,
+			   &rx_mix_tx1_mux, rx_macro_enable_echo,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX MIX TX2 MUX", SND_SOC_NOPM,
+			   RX_MACRO_EC2_MUX, 0,
+			   &rx_mix_tx2_mux, rx_macro_enable_echo,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER("SRC0", CDC_RX_SIDETONE_SRC0_ST_SRC_PATH_CTL,
+		4, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SRC1", CDC_RX_SIDETONE_SRC1_ST_SRC_PATH_CTL,
+		4, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX("RX INT0 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_dem_inp_mux),
+	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_dem_inp_mux),
+
+	SND_SOC_DAPM_MUX_E("RX INT0_2 MUX", SND_SOC_NOPM, INTERP_HPHL, 0,
+		&rx_int0_2_mux, rx_macro_enable_mix_path,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT1_2 MUX", SND_SOC_NOPM, INTERP_HPHR, 0,
+		&rx_int1_2_mux, rx_macro_enable_mix_path,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT2_2 MUX", SND_SOC_NOPM, INTERP_AUX, 0,
+		&rx_int2_2_mux, rx_macro_enable_mix_path,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP0", SND_SOC_NOPM, 0, 0, &rx_int0_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP1", SND_SOC_NOPM, 0, 0, &rx_int0_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT0_1 MIX1 INP2", SND_SOC_NOPM, 0, 0, &rx_int0_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 MIX1 INP0", SND_SOC_NOPM, 0, 0, &rx_int1_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 MIX1 INP1", SND_SOC_NOPM, 0, 0, &rx_int1_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT1_1 MIX1 INP2", SND_SOC_NOPM, 0, 0, &rx_int1_1_mix_inp2_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 MIX1 INP0", SND_SOC_NOPM, 0, 0, &rx_int2_1_mix_inp0_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 MIX1 INP1", SND_SOC_NOPM, 0, 0, &rx_int2_1_mix_inp1_mux),
+	SND_SOC_DAPM_MUX("RX INT2_1 MIX1 INP2", SND_SOC_NOPM, 0, 0, &rx_int2_1_mix_inp2_mux),
+
+	SND_SOC_DAPM_MUX_E("RX INT0_1 INTERP", SND_SOC_NOPM, INTERP_HPHL, 0,
+		&rx_int0_1_interp_mux, rx_macro_enable_main_path,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT1_1 INTERP", SND_SOC_NOPM, INTERP_HPHR, 0,
+		&rx_int1_1_interp_mux, rx_macro_enable_main_path,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT2_1 INTERP", SND_SOC_NOPM, INTERP_AUX, 0,
+		&rx_int2_1_interp_mux, rx_macro_enable_main_path,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("RX INT0_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT1_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_2_interp_mux),
+	SND_SOC_DAPM_MUX("RX INT2_2 INTERP", SND_SOC_NOPM, 0, 0,
+			 &rx_int2_2_interp_mux),
+
+	SND_SOC_DAPM_MIXER("RX INT0_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT0 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT2_1 MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT2 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX_E("RX INT0 MIX2 INP", SND_SOC_NOPM, INTERP_HPHL,
+		0, &rx_int0_mix2_inp_mux, rx_macro_enable_rx_path_clk,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT1 MIX2 INP", SND_SOC_NOPM, INTERP_HPHR,
+		0, &rx_int1_mix2_inp_mux, rx_macro_enable_rx_path_clk,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX_E("RX INT2 MIX2 INP", SND_SOC_NOPM, INTERP_AUX,
+		0, &rx_int2_mix2_inp_mux, rx_macro_enable_rx_path_clk,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER("RX INT0 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT1 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("RX INT2 MIX2", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_OUTPUT("HPHL_OUT"),
+	SND_SOC_DAPM_OUTPUT("HPHR_OUT"),
+	SND_SOC_DAPM_OUTPUT("AUX_OUT"),
+
+	SND_SOC_DAPM_INPUT("RX_TX DEC0_INP"),
+	SND_SOC_DAPM_INPUT("RX_TX DEC1_INP"),
+	SND_SOC_DAPM_INPUT("RX_TX DEC2_INP"),
+	SND_SOC_DAPM_INPUT("RX_TX DEC3_INP"),
+
+	SND_SOC_DAPM_SUPPLY_S("RX_MCLK", 0, SND_SOC_NOPM, 0, 0,
+	rx_macro_mclk_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route rx_audio_map[] = {
+	{"RX AIF1 PB", NULL, "RX_MCLK"},
+	{"RX AIF2 PB", NULL, "RX_MCLK"},
+	{"RX AIF3 PB", NULL, "RX_MCLK"},
+	{"RX AIF4 PB", NULL, "RX_MCLK"},
+
+	{"RX_MACRO RX0 MUX", "AIF1_PB", "RX AIF1 PB"},
+	{"RX_MACRO RX1 MUX", "AIF1_PB", "RX AIF1 PB"},
+	{"RX_MACRO RX2 MUX", "AIF1_PB", "RX AIF1 PB"},
+	{"RX_MACRO RX3 MUX", "AIF1_PB", "RX AIF1 PB"},
+	{"RX_MACRO RX4 MUX", "AIF1_PB", "RX AIF1 PB"},
+	{"RX_MACRO RX5 MUX", "AIF1_PB", "RX AIF1 PB"},
+
+	{"RX_MACRO RX0 MUX", "AIF2_PB", "RX AIF2 PB"},
+	{"RX_MACRO RX1 MUX", "AIF2_PB", "RX AIF2 PB"},
+	{"RX_MACRO RX2 MUX", "AIF2_PB", "RX AIF2 PB"},
+	{"RX_MACRO RX3 MUX", "AIF2_PB", "RX AIF2 PB"},
+	{"RX_MACRO RX4 MUX", "AIF2_PB", "RX AIF2 PB"},
+	{"RX_MACRO RX5 MUX", "AIF2_PB", "RX AIF2 PB"},
+
+	{"RX_MACRO RX0 MUX", "AIF3_PB", "RX AIF3 PB"},
+	{"RX_MACRO RX1 MUX", "AIF3_PB", "RX AIF3 PB"},
+	{"RX_MACRO RX2 MUX", "AIF3_PB", "RX AIF3 PB"},
+	{"RX_MACRO RX3 MUX", "AIF3_PB", "RX AIF3 PB"},
+	{"RX_MACRO RX4 MUX", "AIF3_PB", "RX AIF3 PB"},
+	{"RX_MACRO RX5 MUX", "AIF3_PB", "RX AIF3 PB"},
+
+	{"RX_MACRO RX0 MUX", "AIF4_PB", "RX AIF4 PB"},
+	{"RX_MACRO RX1 MUX", "AIF4_PB", "RX AIF4 PB"},
+	{"RX_MACRO RX2 MUX", "AIF4_PB", "RX AIF4 PB"},
+	{"RX_MACRO RX3 MUX", "AIF4_PB", "RX AIF4 PB"},
+	{"RX_MACRO RX4 MUX", "AIF4_PB", "RX AIF4 PB"},
+	{"RX_MACRO RX5 MUX", "AIF4_PB", "RX AIF4 PB"},
+
+	{"RX_RX0", NULL, "RX_MACRO RX0 MUX"},
+	{"RX_RX1", NULL, "RX_MACRO RX1 MUX"},
+	{"RX_RX2", NULL, "RX_MACRO RX2 MUX"},
+	{"RX_RX3", NULL, "RX_MACRO RX3 MUX"},
+	{"RX_RX4", NULL, "RX_MACRO RX4 MUX"},
+	{"RX_RX5", NULL, "RX_MACRO RX5 MUX"},
+
+	{"RX INT0_1 MIX1 INP0", "RX0", "RX_RX0"},
+	{"RX INT0_1 MIX1 INP0", "RX1", "RX_RX1"},
+	{"RX INT0_1 MIX1 INP0", "RX2", "RX_RX2"},
+	{"RX INT0_1 MIX1 INP0", "RX3", "RX_RX3"},
+	{"RX INT0_1 MIX1 INP0", "RX4", "RX_RX4"},
+	{"RX INT0_1 MIX1 INP0", "RX5", "RX_RX5"},
+	{"RX INT0_1 MIX1 INP0", "IIR0", "IIR0"},
+	{"RX INT0_1 MIX1 INP0", "IIR1", "IIR1"},
+	{"RX INT0_1 MIX1 INP0", "DEC0", "RX_TX DEC0_INP"},
+	{"RX INT0_1 MIX1 INP0", "DEC1", "RX_TX DEC1_INP"},
+	{"RX INT0_1 MIX1 INP1", "RX0", "RX_RX0"},
+	{"RX INT0_1 MIX1 INP1", "RX1", "RX_RX1"},
+	{"RX INT0_1 MIX1 INP1", "RX2", "RX_RX2"},
+	{"RX INT0_1 MIX1 INP1", "RX3", "RX_RX3"},
+	{"RX INT0_1 MIX1 INP1", "RX4", "RX_RX4"},
+	{"RX INT0_1 MIX1 INP1", "RX5", "RX_RX5"},
+	{"RX INT0_1 MIX1 INP1", "IIR0", "IIR0"},
+	{"RX INT0_1 MIX1 INP1", "IIR1", "IIR1"},
+	{"RX INT0_1 MIX1 INP1", "DEC0", "RX_TX DEC0_INP"},
+	{"RX INT0_1 MIX1 INP1", "DEC1", "RX_TX DEC1_INP"},
+	{"RX INT0_1 MIX1 INP2", "RX0", "RX_RX0"},
+	{"RX INT0_1 MIX1 INP2", "RX1", "RX_RX1"},
+	{"RX INT0_1 MIX1 INP2", "RX2", "RX_RX2"},
+	{"RX INT0_1 MIX1 INP2", "RX3", "RX_RX3"},
+	{"RX INT0_1 MIX1 INP2", "RX4", "RX_RX4"},
+	{"RX INT0_1 MIX1 INP2", "RX5", "RX_RX5"},
+	{"RX INT0_1 MIX1 INP2", "IIR0", "IIR0"},
+	{"RX INT0_1 MIX1 INP2", "IIR1", "IIR1"},
+	{"RX INT0_1 MIX1 INP2", "DEC0", "RX_TX DEC0_INP"},
+	{"RX INT0_1 MIX1 INP2", "DEC1", "RX_TX DEC1_INP"},
+
+	{"RX INT1_1 MIX1 INP0", "RX0", "RX_RX0"},
+	{"RX INT1_1 MIX1 INP0", "RX1", "RX_RX1"},
+	{"RX INT1_1 MIX1 INP0", "RX2", "RX_RX2"},
+	{"RX INT1_1 MIX1 INP0", "RX3", "RX_RX3"},
+	{"RX INT1_1 MIX1 INP0", "RX4", "RX_RX4"},
+	{"RX INT1_1 MIX1 INP0", "RX5", "RX_RX5"},
+	{"RX INT1_1 MIX1 INP0", "IIR0", "IIR0"},
+	{"RX INT1_1 MIX1 INP0", "IIR1", "IIR1"},
+	{"RX INT1_1 MIX1 INP0", "DEC0", "RX_TX DEC0_INP"},
+	{"RX INT1_1 MIX1 INP0", "DEC1", "RX_TX DEC1_INP"},
+	{"RX INT1_1 MIX1 INP1", "RX0", "RX_RX0"},
+	{"RX INT1_1 MIX1 INP1", "RX1", "RX_RX1"},
+	{"RX INT1_1 MIX1 INP1", "RX2", "RX_RX2"},
+	{"RX INT1_1 MIX1 INP1", "RX3", "RX_RX3"},
+	{"RX INT1_1 MIX1 INP1", "RX4", "RX_RX4"},
+	{"RX INT1_1 MIX1 INP1", "RX5", "RX_RX5"},
+	{"RX INT1_1 MIX1 INP1", "IIR0", "IIR0"},
+	{"RX INT1_1 MIX1 INP1", "IIR1", "IIR1"},
+	{"RX INT1_1 MIX1 INP1", "DEC0", "RX_TX DEC0_INP"},
+	{"RX INT1_1 MIX1 INP1", "DEC1", "RX_TX DEC1_INP"},
+	{"RX INT1_1 MIX1 INP2", "RX0", "RX_RX0"},
+	{"RX INT1_1 MIX1 INP2", "RX1", "RX_RX1"},
+	{"RX INT1_1 MIX1 INP2", "RX2", "RX_RX2"},
+	{"RX INT1_1 MIX1 INP2", "RX3", "RX_RX3"},
+	{"RX INT1_1 MIX1 INP2", "RX4", "RX_RX4"},
+	{"RX INT1_1 MIX1 INP2", "RX5", "RX_RX5"},
+	{"RX INT1_1 MIX1 INP2", "IIR0", "IIR0"},
+	{"RX INT1_1 MIX1 INP2", "IIR1", "IIR1"},
+	{"RX INT1_1 MIX1 INP2", "DEC0", "RX_TX DEC0_INP"},
+	{"RX INT1_1 MIX1 INP2", "DEC1", "RX_TX DEC1_INP"},
+
+	{"RX INT2_1 MIX1 INP0", "RX0", "RX_RX0"},
+	{"RX INT2_1 MIX1 INP0", "RX1", "RX_RX1"},
+	{"RX INT2_1 MIX1 INP0", "RX2", "RX_RX2"},
+	{"RX INT2_1 MIX1 INP0", "RX3", "RX_RX3"},
+	{"RX INT2_1 MIX1 INP0", "RX4", "RX_RX4"},
+	{"RX INT2_1 MIX1 INP0", "RX5", "RX_RX5"},
+	{"RX INT2_1 MIX1 INP0", "IIR0", "IIR0"},
+	{"RX INT2_1 MIX1 INP0", "IIR1", "IIR1"},
+	{"RX INT2_1 MIX1 INP0", "DEC0", "RX_TX DEC0_INP"},
+	{"RX INT2_1 MIX1 INP0", "DEC1", "RX_TX DEC1_INP"},
+	{"RX INT2_1 MIX1 INP1", "RX0", "RX_RX0"},
+	{"RX INT2_1 MIX1 INP1", "RX1", "RX_RX1"},
+	{"RX INT2_1 MIX1 INP1", "RX2", "RX_RX2"},
+	{"RX INT2_1 MIX1 INP1", "RX3", "RX_RX3"},
+	{"RX INT2_1 MIX1 INP1", "RX4", "RX_RX4"},
+	{"RX INT2_1 MIX1 INP1", "RX5", "RX_RX5"},
+	{"RX INT2_1 MIX1 INP1", "IIR0", "IIR0"},
+	{"RX INT2_1 MIX1 INP1", "IIR1", "IIR1"},
+	{"RX INT2_1 MIX1 INP1", "DEC0", "RX_TX DEC0_INP"},
+	{"RX INT2_1 MIX1 INP1", "DEC1", "RX_TX DEC1_INP"},
+	{"RX INT2_1 MIX1 INP2", "RX0", "RX_RX0"},
+	{"RX INT2_1 MIX1 INP2", "RX1", "RX_RX1"},
+	{"RX INT2_1 MIX1 INP2", "RX2", "RX_RX2"},
+	{"RX INT2_1 MIX1 INP2", "RX3", "RX_RX3"},
+	{"RX INT2_1 MIX1 INP2", "RX4", "RX_RX4"},
+	{"RX INT2_1 MIX1 INP2", "RX5", "RX_RX5"},
+	{"RX INT2_1 MIX1 INP2", "IIR0", "IIR0"},
+	{"RX INT2_1 MIX1 INP2", "IIR1", "IIR1"},
+	{"RX INT2_1 MIX1 INP2", "DEC0", "RX_TX DEC0_INP"},
+	{"RX INT2_1 MIX1 INP2", "DEC1", "RX_TX DEC1_INP"},
+
+	{"RX INT0_1 MIX1", NULL, "RX INT0_1 MIX1 INP0"},
+	{"RX INT0_1 MIX1", NULL, "RX INT0_1 MIX1 INP1"},
+	{"RX INT0_1 MIX1", NULL, "RX INT0_1 MIX1 INP2"},
+	{"RX INT1_1 MIX1", NULL, "RX INT1_1 MIX1 INP0"},
+	{"RX INT1_1 MIX1", NULL, "RX INT1_1 MIX1 INP1"},
+	{"RX INT1_1 MIX1", NULL, "RX INT1_1 MIX1 INP2"},
+	{"RX INT2_1 MIX1", NULL, "RX INT2_1 MIX1 INP0"},
+	{"RX INT2_1 MIX1", NULL, "RX INT2_1 MIX1 INP1"},
+	{"RX INT2_1 MIX1", NULL, "RX INT2_1 MIX1 INP2"},
+
+	{"RX MIX TX0 MUX", "RX_MIX0", "RX INT0 SEC MIX"},
+	{"RX MIX TX0 MUX", "RX_MIX1", "RX INT1 SEC MIX"},
+	{"RX MIX TX0 MUX", "RX_MIX2", "RX INT2 SEC MIX"},
+	{"RX MIX TX1 MUX", "RX_MIX0", "RX INT0 SEC MIX"},
+	{"RX MIX TX1 MUX", "RX_MIX1", "RX INT1 SEC MIX"},
+	{"RX MIX TX1 MUX", "RX_MIX2", "RX INT2 SEC MIX"},
+	{"RX MIX TX2 MUX", "RX_MIX0", "RX INT0 SEC MIX"},
+	{"RX MIX TX2 MUX", "RX_MIX1", "RX INT1 SEC MIX"},
+	{"RX MIX TX2 MUX", "RX_MIX2", "RX INT2 SEC MIX"},
+	{"RX AIF_ECHO", NULL, "RX MIX TX0 MUX"},
+	{"RX AIF_ECHO", NULL, "RX MIX TX1 MUX"},
+	{"RX AIF_ECHO", NULL, "RX MIX TX2 MUX"},
+	{"RX AIF_ECHO", NULL, "RX_MCLK"},
+
+	/* Mixing path INT0 */
+	{"RX INT0_2 MUX", "RX0", "RX_RX0"},
+	{"RX INT0_2 MUX", "RX1", "RX_RX1"},
+	{"RX INT0_2 MUX", "RX2", "RX_RX2"},
+	{"RX INT0_2 MUX", "RX3", "RX_RX3"},
+	{"RX INT0_2 MUX", "RX4", "RX_RX4"},
+	{"RX INT0_2 MUX", "RX5", "RX_RX5"},
+	{"RX INT0_2 INTERP", NULL, "RX INT0_2 MUX"},
+	{"RX INT0 SEC MIX", NULL, "RX INT0_2 INTERP"},
+
+	/* Mixing path INT1 */
+	{"RX INT1_2 MUX", "RX0", "RX_RX0"},
+	{"RX INT1_2 MUX", "RX1", "RX_RX1"},
+	{"RX INT1_2 MUX", "RX2", "RX_RX2"},
+	{"RX INT1_2 MUX", "RX3", "RX_RX3"},
+	{"RX INT1_2 MUX", "RX4", "RX_RX4"},
+	{"RX INT1_2 MUX", "RX5", "RX_RX5"},
+	{"RX INT1_2 INTERP", NULL, "RX INT1_2 MUX"},
+	{"RX INT1 SEC MIX", NULL, "RX INT1_2 INTERP"},
+
+	/* Mixing path INT2 */
+	{"RX INT2_2 MUX", "RX0", "RX_RX0"},
+	{"RX INT2_2 MUX", "RX1", "RX_RX1"},
+	{"RX INT2_2 MUX", "RX2", "RX_RX2"},
+	{"RX INT2_2 MUX", "RX3", "RX_RX3"},
+	{"RX INT2_2 MUX", "RX4", "RX_RX4"},
+	{"RX INT2_2 MUX", "RX5", "RX_RX5"},
+	{"RX INT2_2 INTERP", NULL, "RX INT2_2 MUX"},
+	{"RX INT2 SEC MIX", NULL, "RX INT2_2 INTERP"},
+
+	{"RX INT0_1 INTERP", NULL, "RX INT0_1 MIX1"},
+	{"RX INT0 SEC MIX", NULL, "RX INT0_1 INTERP"},
+	{"RX INT0 MIX2", NULL, "RX INT0 SEC MIX"},
+	{"RX INT0 MIX2", NULL, "RX INT0 MIX2 INP"},
+	{"RX INT0 DEM MUX", "CLSH_DSM_OUT", "RX INT0 MIX2"},
+	{"HPHL_OUT", NULL, "RX INT0 DEM MUX"},
+	{"HPHL_OUT", NULL, "RX_MCLK"},
+
+	{"RX INT1_1 INTERP", NULL, "RX INT1_1 MIX1"},
+	{"RX INT1 SEC MIX", NULL, "RX INT1_1 INTERP"},
+	{"RX INT1 MIX2", NULL, "RX INT1 SEC MIX"},
+	{"RX INT1 MIX2", NULL, "RX INT1 MIX2 INP"},
+	{"RX INT1 DEM MUX", "CLSH_DSM_OUT", "RX INT1 MIX2"},
+	{"HPHR_OUT", NULL, "RX INT1 DEM MUX"},
+	{"HPHR_OUT", NULL, "RX_MCLK"},
+
+	{"RX INT2_1 INTERP", NULL, "RX INT2_1 MIX1"},
+
+	{"RX INT2 SEC MIX", NULL, "RX INT2_1 INTERP"},
+	{"RX INT2 MIX2", NULL, "RX INT2 SEC MIX"},
+	{"RX INT2 MIX2", NULL, "RX INT2 MIX2 INP"},
+	{"AUX_OUT", NULL, "RX INT2 MIX2"},
+	{"AUX_OUT", NULL, "RX_MCLK"},
+
+	{"IIR0", NULL, "RX_MCLK"},
+	{"IIR0", NULL, "IIR0 INP0 MUX"},
+	{"IIR0 INP0 MUX", "DEC0", "RX_TX DEC0_INP"},
+	{"IIR0 INP0 MUX", "DEC1", "RX_TX DEC1_INP"},
+	{"IIR0 INP0 MUX", "DEC2", "RX_TX DEC2_INP"},
+	{"IIR0 INP0 MUX", "DEC3", "RX_TX DEC3_INP"},
+	{"IIR0 INP0 MUX", "RX0", "RX_RX0"},
+	{"IIR0 INP0 MUX", "RX1", "RX_RX1"},
+	{"IIR0 INP0 MUX", "RX2", "RX_RX2"},
+	{"IIR0 INP0 MUX", "RX3", "RX_RX3"},
+	{"IIR0 INP0 MUX", "RX4", "RX_RX4"},
+	{"IIR0 INP0 MUX", "RX5", "RX_RX5"},
+	{"IIR0", NULL, "IIR0 INP1 MUX"},
+	{"IIR0 INP1 MUX", "DEC0", "RX_TX DEC0_INP"},
+	{"IIR0 INP1 MUX", "DEC1", "RX_TX DEC1_INP"},
+	{"IIR0 INP1 MUX", "DEC2", "RX_TX DEC2_INP"},
+	{"IIR0 INP1 MUX", "DEC3", "RX_TX DEC3_INP"},
+	{"IIR0 INP1 MUX", "RX0", "RX_RX0"},
+	{"IIR0 INP1 MUX", "RX1", "RX_RX1"},
+	{"IIR0 INP1 MUX", "RX2", "RX_RX2"},
+	{"IIR0 INP1 MUX", "RX3", "RX_RX3"},
+	{"IIR0 INP1 MUX", "RX4", "RX_RX4"},
+	{"IIR0 INP1 MUX", "RX5", "RX_RX5"},
+	{"IIR0", NULL, "IIR0 INP2 MUX"},
+	{"IIR0 INP2 MUX", "DEC0", "RX_TX DEC0_INP"},
+	{"IIR0 INP2 MUX", "DEC1", "RX_TX DEC1_INP"},
+	{"IIR0 INP2 MUX", "DEC2", "RX_TX DEC2_INP"},
+	{"IIR0 INP2 MUX", "DEC3", "RX_TX DEC3_INP"},
+	{"IIR0 INP2 MUX", "RX0", "RX_RX0"},
+	{"IIR0 INP2 MUX", "RX1", "RX_RX1"},
+	{"IIR0 INP2 MUX", "RX2", "RX_RX2"},
+	{"IIR0 INP2 MUX", "RX3", "RX_RX3"},
+	{"IIR0 INP2 MUX", "RX4", "RX_RX4"},
+	{"IIR0 INP2 MUX", "RX5", "RX_RX5"},
+	{"IIR0", NULL, "IIR0 INP3 MUX"},
+	{"IIR0 INP3 MUX", "DEC0", "RX_TX DEC0_INP"},
+	{"IIR0 INP3 MUX", "DEC1", "RX_TX DEC1_INP"},
+	{"IIR0 INP3 MUX", "DEC2", "RX_TX DEC2_INP"},
+	{"IIR0 INP3 MUX", "DEC3", "RX_TX DEC3_INP"},
+	{"IIR0 INP3 MUX", "RX0", "RX_RX0"},
+	{"IIR0 INP3 MUX", "RX1", "RX_RX1"},
+	{"IIR0 INP3 MUX", "RX2", "RX_RX2"},
+	{"IIR0 INP3 MUX", "RX3", "RX_RX3"},
+	{"IIR0 INP3 MUX", "RX4", "RX_RX4"},
+	{"IIR0 INP3 MUX", "RX5", "RX_RX5"},
+
+	{"IIR1", NULL, "RX_MCLK"},
+	{"IIR1", NULL, "IIR1 INP0 MUX"},
+	{"IIR1 INP0 MUX", "DEC0", "RX_TX DEC0_INP"},
+	{"IIR1 INP0 MUX", "DEC1", "RX_TX DEC1_INP"},
+	{"IIR1 INP0 MUX", "DEC2", "RX_TX DEC2_INP"},
+	{"IIR1 INP0 MUX", "DEC3", "RX_TX DEC3_INP"},
+	{"IIR1 INP0 MUX", "RX0", "RX_RX0"},
+	{"IIR1 INP0 MUX", "RX1", "RX_RX1"},
+	{"IIR1 INP0 MUX", "RX2", "RX_RX2"},
+	{"IIR1 INP0 MUX", "RX3", "RX_RX3"},
+	{"IIR1 INP0 MUX", "RX4", "RX_RX4"},
+	{"IIR1 INP0 MUX", "RX5", "RX_RX5"},
+	{"IIR1", NULL, "IIR1 INP1 MUX"},
+	{"IIR1 INP1 MUX", "DEC0", "RX_TX DEC0_INP"},
+	{"IIR1 INP1 MUX", "DEC1", "RX_TX DEC1_INP"},
+	{"IIR1 INP1 MUX", "DEC2", "RX_TX DEC2_INP"},
+	{"IIR1 INP1 MUX", "DEC3", "RX_TX DEC3_INP"},
+	{"IIR1 INP1 MUX", "RX0", "RX_RX0"},
+	{"IIR1 INP1 MUX", "RX1", "RX_RX1"},
+	{"IIR1 INP1 MUX", "RX2", "RX_RX2"},
+	{"IIR1 INP1 MUX", "RX3", "RX_RX3"},
+	{"IIR1 INP1 MUX", "RX4", "RX_RX4"},
+	{"IIR1 INP1 MUX", "RX5", "RX_RX5"},
+	{"IIR1", NULL, "IIR1 INP2 MUX"},
+	{"IIR1 INP2 MUX", "DEC0", "RX_TX DEC0_INP"},
+	{"IIR1 INP2 MUX", "DEC1", "RX_TX DEC1_INP"},
+	{"IIR1 INP2 MUX", "DEC2", "RX_TX DEC2_INP"},
+	{"IIR1 INP2 MUX", "DEC3", "RX_TX DEC3_INP"},
+	{"IIR1 INP2 MUX", "RX0", "RX_RX0"},
+	{"IIR1 INP2 MUX", "RX1", "RX_RX1"},
+	{"IIR1 INP2 MUX", "RX2", "RX_RX2"},
+	{"IIR1 INP2 MUX", "RX3", "RX_RX3"},
+	{"IIR1 INP2 MUX", "RX4", "RX_RX4"},
+	{"IIR1 INP2 MUX", "RX5", "RX_RX5"},
+	{"IIR1", NULL, "IIR1 INP3 MUX"},
+	{"IIR1 INP3 MUX", "DEC0", "RX_TX DEC0_INP"},
+	{"IIR1 INP3 MUX", "DEC1", "RX_TX DEC1_INP"},
+	{"IIR1 INP3 MUX", "DEC2", "RX_TX DEC2_INP"},
+	{"IIR1 INP3 MUX", "DEC3", "RX_TX DEC3_INP"},
+	{"IIR1 INP3 MUX", "RX0", "RX_RX0"},
+	{"IIR1 INP3 MUX", "RX1", "RX_RX1"},
+	{"IIR1 INP3 MUX", "RX2", "RX_RX2"},
+	{"IIR1 INP3 MUX", "RX3", "RX_RX3"},
+	{"IIR1 INP3 MUX", "RX4", "RX_RX4"},
+	{"IIR1 INP3 MUX", "RX5", "RX_RX5"},
+
+	{"SRC0", NULL, "IIR0"},
+	{"SRC1", NULL, "IIR1"},
+	{"RX INT0 MIX2 INP", "SRC0", "SRC0"},
+	{"RX INT0 MIX2 INP", "SRC1", "SRC1"},
+	{"RX INT1 MIX2 INP", "SRC0", "SRC0"},
+	{"RX INT1 MIX2 INP", "SRC1", "SRC1"},
+	{"RX INT2 MIX2 INP", "SRC0", "SRC0"},
+	{"RX INT2 MIX2 INP", "SRC1", "SRC1"},
+};
+
 static int rx_macro_component_probe(struct snd_soc_component *component)
 {
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
@@ -1915,6 +3250,10 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 	.probe = rx_macro_component_probe,
 	.controls = rx_macro_snd_controls,
 	.num_controls = ARRAY_SIZE(rx_macro_snd_controls),
+	.dapm_widgets = rx_macro_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rx_macro_dapm_widgets),
+	.dapm_routes = rx_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(rx_audio_map),
 };
 
 static int rx_macro_probe(struct platform_device *pdev)
-- 
2.21.0

