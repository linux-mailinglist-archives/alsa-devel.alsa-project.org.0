Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86215802F87
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 11:03:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EC3DDEB;
	Mon,  4 Dec 2023 11:03:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EC3DDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701684208;
	bh=XiAEsYgaEZphn3bNM73kOFZvVSBHn7mOihZTT2IJY+4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q2vI6xX39uWj12O4NsOuQHp1lzCVBcX+wFU0zFGQrDL282Mfr3HPtb/nKCTlUVoY5
	 w/FyN6YjDutw4hYE25Kb0VQvj0Vd2FmQqBa1YXmMDwfaTzk+Dosqe46VePYNPXDh6A
	 Sl1pMBn4kC4MAurVaWgYTpVhWe153S1D87e+K0HA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1A2CF805EC; Mon,  4 Dec 2023 11:02:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ADD4F805EE;
	Mon,  4 Dec 2023 11:02:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5F14F8024E; Mon,  4 Dec 2023 11:01:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61A98F800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 11:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61A98F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ujRRlVMa
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ca03103155so8506491fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Dec 2023 02:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701684083; x=1702288883;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZudBhO/WCplbQCp3KVlqjf1fHRbAS/TfrewGCqAIPY=;
        b=ujRRlVMaKaVFhpu05OMgFnW0tRObgmcqYL5ncbaroYaKhd6U9ur8HvverwzA6Zy3/Z
         cVjxo68fjoRl0dJ2ogUJwGtfCJsV7F7GqjhdQjnDBoyfM8WHFcx0cGvMv3pNjS18Hx4v
         FaSgsNWOrMUTCcPv/8P8qt7pl7T9xan2kuzXbgpfToOuGSpPyKq+agg77/YHoyaOATzf
         9SXTYCEMJ28YiX4C5gbHON0CnJzG4yOw9xs2KK0bpp0FmXl96p7nExbo5HJbQOVqeUc7
         7USBruUYSO1muojl+YXF//SyADaIB6arURrQnThp8hC80q/7kg6yz3liMU9z3XcDJT7m
         jV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701684083; x=1702288883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZudBhO/WCplbQCp3KVlqjf1fHRbAS/TfrewGCqAIPY=;
        b=NCEfa/qL4cXrG0EWpP55h0cWOU1Nybf59h3Ax1KVNl8iheUiKpYDCU3RgTIDtXXs0V
         1glizfTcXg4B94bNKvmiy1skLslA+aDc7Vgrlwb1Dv+Sn/z5daF40V6WGXAbVvU7urMH
         DYi2jQyozPLVuJN/+Wo/gZ64bGNdGz+cuKjAvAkpJrFMAPeV3QW851KJV3FbROXUpQad
         zZh8C9FX/W/l9sY4HkP4jrN7Jic4FcByf9cNCiwL2SM8ujNF1ZWpE5KDVQVqdQPPgxuc
         l15i/ALhpujq9A6bLl9eBqsW1/p6zEEg9FFBsd85TGlqRmg9CS8vw6I8fSBog1Rs8JnZ
         g2Hg==
X-Gm-Message-State: AOJu0YzMYMTzTkVYza58FmfhOSJE4dKUToiwvsihBkaMs7TGSb4KGCkC
	7Y91D23aQFUY5t6FklD2EvPasgm5c6r4PNeTxPc=
X-Google-Smtp-Source: 
 AGHT+IEDH45bXF+mWwkq6P/83Vxtzbob4paKWveQYD4Oa84mb7HX7jeUMe6GVsa5KVjC2XQoi2C8Xw==
X-Received: by 2002:a2e:82c3:0:b0:2c9:f7fb:4e0f with SMTP id
 n3-20020a2e82c3000000b002c9f7fb4e0fmr770674ljh.101.1701684082678;
        Mon, 04 Dec 2023 02:01:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 pj21-20020a170906d79500b00a188fe9563esm5065572ejb.131.2023.12.04.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 02:01:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: qcom: Add x1e80100 sound machine driver
Date: Mon,  4 Dec 2023 11:01:15 +0100
Message-Id: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XRVSFX5TF4BRN4NNEUA3DVAWCMWUKGUZ
X-Message-ID-Hash: XRVSFX5TF4BRN4NNEUA3DVAWCMWUKGUZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRVSFX5TF4BRN4NNEUA3DVAWCMWUKGUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sound machine driver for the soundcards on Qualcomm X1E80100 SoC,
supporting up to four channel audio playback over Soundwire bus.  The
driver is based on existing sc8280xp.c driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/Kconfig    |  12 +++
 sound/soc/qcom/Makefile   |   2 +
 sound/soc/qcom/x1e80100.c | 168 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 182 insertions(+)
 create mode 100644 sound/soc/qcom/x1e80100.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e7b00d1d9e99..762491d6f2f2 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -221,4 +221,16 @@ config SND_SOC_SC7280
 	  SC7280 SoC-based systems.
 	  Say Y or M if you want to use audio device on this SoCs.
 
+config SND_SOC_X1E80100
+	tristate "SoC Machine driver for X1E80100 boards"
+	depends on QCOM_APR && SOUNDWIRE
+	depends on COMMON_CLK
+	select SND_SOC_QDSP6
+	select SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_SDW
+	help
+	  Add support for audio on Qualcomm Technologies Inc.
+	  X1E80100 SoC-based systems.
+	  Say Y or M if you want to use audio device on this SoCs.
+
 endif #SND_SOC_QCOM
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 254350d9dc06..34f3fcb8ee9a 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -29,6 +29,7 @@ snd-soc-sm8250-objs := sm8250.o
 snd-soc-sc8280xp-objs := sc8280xp.o
 snd-soc-qcom-common-objs := common.o
 snd-soc-qcom-sdw-objs := sdw.o
+snd-soc-x1e80100-objs := x1e80100.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
@@ -40,6 +41,7 @@ obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
 obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
 obj-$(CONFIG_SND_SOC_QCOM_SDW) += snd-soc-qcom-sdw.o
+obj-$(CONFIG_SND_SOC_X1E80100) += snd-soc-x1e80100.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
new file mode 100644
index 000000000000..c3c8bf7ffb5b
--- /dev/null
+++ b/sound/soc/qcom/x1e80100.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2023, Linaro Limited
+
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/soundwire/sdw.h>
+#include <sound/pcm.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+
+#include "common.h"
+#include "qdsp6/q6afe.h"
+#include "sdw.h"
+
+struct x1e80100_snd_data {
+	bool stream_prepared[AFE_PORT_MAX];
+	struct snd_soc_card *card;
+	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
+	struct snd_soc_jack jack;
+	bool jack_setup;
+};
+
+static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+
+	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+}
+
+static void x1e80100_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	data->sruntime[cpu_dai->id] = NULL;
+	sdw_release_stream(sruntime);
+}
+
+static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				     struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_interval *rate = hw_param_interval(params,
+						      SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+							  SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	rate->min = rate->max = 48000;
+	switch (cpu_dai->id) {
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+		channels->min = 1;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+
+	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
+}
+
+static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	return qcom_snd_sdw_prepare(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
+}
+
+static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	return qcom_snd_sdw_hw_free(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
+}
+
+static const struct snd_soc_ops x1e80100_be_ops = {
+	.startup = qcom_snd_sdw_startup,
+	.shutdown = x1e80100_snd_shutdown,
+	.hw_params = x1e80100_snd_hw_params,
+	.hw_free = x1e80100_snd_hw_free,
+	.prepare = x1e80100_snd_prepare,
+};
+
+static void x1e80100_add_be_ops(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	for_each_card_prelinks(card, i, link) {
+		if (link->no_pcm == 1) {
+			link->init = x1e80100_snd_init;
+			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
+			link->ops = &x1e80100_be_ops;
+		}
+	}
+}
+
+static int x1e80100_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct x1e80100_snd_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+	/* Allocate the private data */
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	card->owner = THIS_MODULE;
+	card->dev = dev;
+	dev_set_drvdata(dev, card);
+	snd_soc_card_set_drvdata(card, data);
+
+	ret = qcom_snd_parse_of(card);
+	if (ret)
+		return ret;
+
+	card->driver_name = "x1e80100";
+	x1e80100_add_be_ops(card);
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct of_device_id snd_x1e80100_dt_match[] = {
+	{ .compatible = "qcom,x1e80100-sndcard", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, snd_x1e80100_dt_match);
+
+static struct platform_driver snd_x1e80100_driver = {
+	.probe  = x1e80100_platform_probe,
+	.driver = {
+		.name = "snd-x1e80100",
+		.of_match_table = snd_x1e80100_dt_match,
+	},
+};
+module_platform_driver(snd_x1e80100_driver);
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm X1E80100 ASoC Machine Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

