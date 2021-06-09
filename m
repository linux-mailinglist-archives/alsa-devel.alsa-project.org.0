Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F193A0F72
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 11:14:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA66A16E2;
	Wed,  9 Jun 2021 11:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA66A16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623230061;
	bh=nhv4uIq+hZ+D2vcxA/vy1p8Bpi+VYxVRrcYSEjzlDLU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A7jlcR81krI0JVvkqCGVSWgLyzbkQPPmHGnXnYyPH1rK3RlgrdfRpgWzdSFVf+9ZI
	 /qxv/XDsqN/FBVtwk+TP1JhHHOyV2kC9tI7GMamobm5OzV0ox06AseEHDqoAIZkVhC
	 NbMpCkUFokoxTUv4wlHkCXQ/1LJlWN/oMzgz6TmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE79F804FD;
	Wed,  9 Jun 2021 11:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0821EF804C1; Wed,  9 Jun 2021 11:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66437F804CC
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 11:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66437F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dMdC2CZm"
Received: by mail-wr1-x430.google.com with SMTP id a20so24679432wrc.0
 for <alsa-devel@alsa-project.org>; Wed, 09 Jun 2021 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y93hdNcnw0E4Yi2H2c7HfE/xyf7sdHZA6dsM2AZsEKw=;
 b=dMdC2CZm7BdZL0ecS3dbEBgCCHN9pkSmAE7z6yIMgVvBrYhgNYTspj2mBT4lgdaRtI
 ffMOS3idvBzrNdaqbEdAO9QCJd8KGn519S4mpP1eK54HmiCs03IZ3jvnULbSNNZwzTUL
 bJsVRUc4eIxDOggPiC6WOPT/pjj0loSNfg/laBGq0ZwdpVa/LR4HJf2V0aSpWy/lhV9G
 WUSXm+VDGdCXOnnsSM3m1Y4PZ/Ss3Nc8Bk7Dwh2zngnHJcSBLPX2VlaKh3/O5GpUdtF1
 hKuFo36qXKRxAVlfspJh+ejvtrhmFZuY5Lt/O+CAp3uOolYkA0PNr94BJfq9d6WHkW3f
 hlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y93hdNcnw0E4Yi2H2c7HfE/xyf7sdHZA6dsM2AZsEKw=;
 b=jhW7qMS3qFaurgv4AxEZwOMSjjHMh6jfGtC0V6kLfH8qyQGC6M4qfKx/GCUT02+3FJ
 cZgzk73Q47URgnEe8pwdGmNGA42hcv8wvgwXxLXjNdAnFu8EgLATJOd56WG2RFxhAZIT
 FprX9ftThxfSTByuc87JED5+zLffQPtjRnv2VlRBwDQaJKoiJy8t/3KNpRfEjHarBrQY
 tTIjjkO8xEffbZeCmKxfmv7oVHD1R9Ca08ZVW8X67F0zs+iuhCzzG9A6a7HL/HJ2HpEH
 zbI2Miq+UeqIGomKI27HX7kk+Cy2apWZm3XVU5lKYALdmrqi/FyC1ai6k+vFafqJYZ3x
 yz/Q==
X-Gm-Message-State: AOAM5337qTJp/5G7v3L4QrH5kTXrFXbJWpdfMoa+ES0CDk9SoR2Uasfk
 8NShvLoDgELdOUxrWxS/1D7ofA==
X-Google-Smtp-Source: ABdhPJy/9OYhZ5oA3KbbIKr0VzTuX/T04Ro0v7b1BUJ8ME7UoLg2TbpuatYhW2ZWibVH+E+8BAankw==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr18844933wrc.122.1623229809440; 
 Wed, 09 Jun 2021 02:10:09 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v18sm25165385wrb.10.2021.06.09.02.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 02:10:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v9 9/9] ASoC: codecs: wcd938x: add audio routing and Kconfig
Date: Wed,  9 Jun 2021 10:09:43 +0100
Message-Id: <20210609090943.7896-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210609090943.7896-1-srinivas.kandagatla@linaro.org>
References: <20210609090943.7896-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

This patch adds audio routing for both playback and capture and
Makefile and Kconfigs changes for wcd938x

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig   | 14 ++++++
 sound/soc/codecs/Makefile  |  4 ++
 sound/soc/codecs/wcd938x.c | 94 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index bd8583f5ebae..2d80836ef220 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -234,6 +234,8 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_UDA1380
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
+	imply SND_SOC_WCD937X
+	imply SND_SOC_WCD938X
 	imply SND_SOC_LPASS_RX_MACRO
 	imply SND_SOC_LPASS_TX_MACRO
 	imply SND_SOC_WL1273
@@ -1554,6 +1556,18 @@ config SND_SOC_WCD934X
 	  The WCD9340/9341 is a audio codec IC Integrated in
 	  Qualcomm SoCs like SDM845.
 
+config SND_SOC_WCD938X
+	tristate
+
+config SND_SOC_WCD938X_SDW
+	tristate "WCD9380/WCD9385 Codec - SDW"
+	select SND_SOC_WCD938X
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+	help
+	  The WCD9380/9385 is a audio codec IC Integrated in
+	  Qualcomm SoCs like SM8250.
+
 config SND_SOC_WL1273
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 9d17a374a825..de8b83dd2c76 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -255,6 +255,8 @@ snd-soc-uda1380-objs := uda1380.o
 snd-soc-wcd-mbhc-objs := wcd-mbhc-v2.o
 snd-soc-wcd9335-objs := wcd-clsh-v2.o wcd9335.o
 snd-soc-wcd934x-objs := wcd-clsh-v2.o wcd934x.o
+snd-soc-wcd938x-objs := wcd938x.o wcd-clsh-v2.o
+snd-soc-wcd938x-sdw-objs := wcd938x-sdw.o
 snd-soc-wl1273-objs := wl1273.o
 snd-soc-wm-adsp-objs := wm_adsp.o
 snd-soc-wm0010-objs := wm0010.o
@@ -580,6 +582,8 @@ obj-$(CONFIG_SND_SOC_UDA1380)	+= snd-soc-uda1380.o
 obj-$(CONFIG_SND_SOC_WCD_MBHC)	+= snd-soc-wcd-mbhc.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
 obj-$(CONFIG_SND_SOC_WCD934X)	+= snd-soc-wcd934x.o
+obj-$(CONFIG_SND_SOC_WCD938X)	+= snd-soc-wcd938x.o
+obj-$(CONFIG_SND_SOC_WCD938X_SDW) += snd-soc-wcd938x-sdw.o
 obj-$(CONFIG_SND_SOC_WL1273)	+= snd-soc-wl1273.o
 obj-$(CONFIG_SND_SOC_WM0010)	+= snd-soc-wm0010.o
 obj-$(CONFIG_SND_SOC_WM1250_EV1) += snd-soc-wm1250-ev1.o
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 2cf6145b7219..a2c76dc8fd89 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3133,6 +3133,98 @@ static const struct snd_soc_dapm_widget wcd938x_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("AUX"),
 	SND_SOC_DAPM_OUTPUT("HPHL"),
 	SND_SOC_DAPM_OUTPUT("HPHR"),
+
+};
+
+static const struct snd_soc_dapm_route wcd938x_audio_map[] = {
+	{"ADC1_OUTPUT", NULL, "ADC1_MIXER"},
+	{"ADC1_MIXER", "Switch", "ADC1 REQ"},
+	{"ADC1 REQ", NULL, "ADC1"},
+	{"ADC1", NULL, "AMIC1"},
+
+	{"ADC2_OUTPUT", NULL, "ADC2_MIXER"},
+	{"ADC2_MIXER", "Switch", "ADC2 REQ"},
+	{"ADC2 REQ", NULL, "ADC2"},
+	{"ADC2", NULL, "HDR12 MUX"},
+	{"HDR12 MUX", "NO_HDR12", "ADC2 MUX"},
+	{"HDR12 MUX", "HDR12", "AMIC1"},
+	{"ADC2 MUX", "INP3", "AMIC3"},
+	{"ADC2 MUX", "INP2", "AMIC2"},
+
+	{"ADC3_OUTPUT", NULL, "ADC3_MIXER"},
+	{"ADC3_MIXER", "Switch", "ADC3 REQ"},
+	{"ADC3 REQ", NULL, "ADC3"},
+	{"ADC3", NULL, "HDR34 MUX"},
+	{"HDR34 MUX", "NO_HDR34", "ADC3 MUX"},
+	{"HDR34 MUX", "HDR34", "AMIC5"},
+	{"ADC3 MUX", "INP4", "AMIC4"},
+	{"ADC3 MUX", "INP6", "AMIC6"},
+
+	{"ADC4_OUTPUT", NULL, "ADC4_MIXER"},
+	{"ADC4_MIXER", "Switch", "ADC4 REQ"},
+	{"ADC4 REQ", NULL, "ADC4"},
+	{"ADC4", NULL, "ADC4 MUX"},
+	{"ADC4 MUX", "INP5", "AMIC5"},
+	{"ADC4 MUX", "INP7", "AMIC7"},
+
+	{"DMIC1_OUTPUT", NULL, "DMIC1_MIXER"},
+	{"DMIC1_MIXER", "Switch", "DMIC1"},
+
+	{"DMIC2_OUTPUT", NULL, "DMIC2_MIXER"},
+	{"DMIC2_MIXER", "Switch", "DMIC2"},
+
+	{"DMIC3_OUTPUT", NULL, "DMIC3_MIXER"},
+	{"DMIC3_MIXER", "Switch", "DMIC3"},
+
+	{"DMIC4_OUTPUT", NULL, "DMIC4_MIXER"},
+	{"DMIC4_MIXER", "Switch", "DMIC4"},
+
+	{"DMIC5_OUTPUT", NULL, "DMIC5_MIXER"},
+	{"DMIC5_MIXER", "Switch", "DMIC5"},
+
+	{"DMIC6_OUTPUT", NULL, "DMIC6_MIXER"},
+	{"DMIC6_MIXER", "Switch", "DMIC6"},
+
+	{"DMIC7_OUTPUT", NULL, "DMIC7_MIXER"},
+	{"DMIC7_MIXER", "Switch", "DMIC7"},
+
+	{"DMIC8_OUTPUT", NULL, "DMIC8_MIXER"},
+	{"DMIC8_MIXER", "Switch", "DMIC8"},
+
+	{"IN1_HPHL", NULL, "VDD_BUCK"},
+	{"IN1_HPHL", NULL, "CLS_H_PORT"},
+
+	{"RX1", NULL, "IN1_HPHL"},
+	{"RX1", NULL, "RXCLK"},
+	{"RDAC1", NULL, "RX1"},
+	{"HPHL_RDAC", "Switch", "RDAC1"},
+	{"HPHL PGA", NULL, "HPHL_RDAC"},
+	{"HPHL", NULL, "HPHL PGA"},
+
+	{"IN2_HPHR", NULL, "VDD_BUCK"},
+	{"IN2_HPHR", NULL, "CLS_H_PORT"},
+	{"RX2", NULL, "IN2_HPHR"},
+	{"RDAC2", NULL, "RX2"},
+	{"RX2", NULL, "RXCLK"},
+	{"HPHR_RDAC", "Switch", "RDAC2"},
+	{"HPHR PGA", NULL, "HPHR_RDAC"},
+	{"HPHR", NULL, "HPHR PGA"},
+
+	{"IN3_AUX", NULL, "VDD_BUCK"},
+	{"IN3_AUX", NULL, "CLS_H_PORT"},
+	{"RX3", NULL, "IN3_AUX"},
+	{"RDAC4", NULL, "RX3"},
+	{"RX3", NULL, "RXCLK"},
+	{"AUX_RDAC", "Switch", "RDAC4"},
+	{"AUX PGA", NULL, "AUX_RDAC"},
+	{"AUX", NULL, "AUX PGA"},
+
+	{"RDAC3_MUX", "RX3", "RX3"},
+	{"RDAC3_MUX", "RX1", "RX1"},
+	{"RDAC3", NULL, "RDAC3_MUX"},
+	{"EAR_RDAC", "Switch", "RDAC3"},
+	{"EAR PGA", NULL, "EAR_RDAC"},
+	{"EAR", NULL, "EAR PGA"},
 };
 
 static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
@@ -3300,6 +3392,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x = {
 	.num_controls = ARRAY_SIZE(wcd938x_snd_controls),
 	.dapm_widgets = wcd938x_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(wcd938x_dapm_widgets),
+	.dapm_routes = wcd938x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wcd938x_audio_map),
 };
 
 static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
-- 
2.21.0

