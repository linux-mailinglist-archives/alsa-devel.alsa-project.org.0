Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73BA4C9515
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 20:52:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 301F11AA2;
	Tue,  1 Mar 2022 20:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 301F11AA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646164332;
	bh=Jg8eeRpXN3KyAy29VO2q5rBOhw/+sRIGyyHHcOCu0j8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tcjUOVpuSOorp3azBiRPhV4+VIcs/lhhWYyoWw5rzCpJBsBYlNpoBmbqwQuVs/LPB
	 LcmJB9ZFU+IBGfha3myE6E+nEPBPzDcuIdRW15DlSIHBcZXkBzPfvK3D37XlihH/8m
	 19XI4sfHyz1d8uw8N1U4LfSWViHPto8XpiaDmVdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4050F80534;
	Tue,  1 Mar 2022 20:49:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9326F80227; Tue,  1 Mar 2022 20:49:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C13C4F80508
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 20:49:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C13C4F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RCBSUrDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646164164; x=1677700164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jg8eeRpXN3KyAy29VO2q5rBOhw/+sRIGyyHHcOCu0j8=;
 b=RCBSUrDOfDU91JtpRrFjtJN2h6Hx4ZsjSLQMZ8FFmwT7U0oNvu7ZsXWn
 yK4vCxIHiz2GPWk73J1/FlGbX6X9R6XyHuAG8J5+1Z8NmaocjA3kLQb2K
 V1WNZi0/gNuAa+jmJ6I8x1G2o/LMTAdO/0aNAS3PjtlUuzcFd65S2rw+K
 rzLHIQ3s0WdXIORJOtBLsZzL1W11fZAQwXqhVTboCQn+s7FwaQ6pPU7QE
 kzZc/7B0MKMptunGvdEPFlYYoJnYAA5OUQQ4VEv58HxIOSEVrV5UUMqil
 807eCva0q6151S2CWhj7CQLgC/Ocvmw2dDEv0CuTWXCePIRF153bu7Jl3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233841071"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233841071"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="630131863"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.131.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:16 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ASoC: Intel: cirrus-common: support cs35l41 amplifier
Date: Tue,  1 Mar 2022 13:49:01 -0600
Message-Id: <20220301194903.60859-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Implement cs35l41 support code in this common module so it could be
shared between multiple SOF machine drivers.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig             |   3 +
 sound/soc/intel/boards/Makefile            |   3 +
 sound/soc/intel/boards/sof_cirrus_common.c | 163 +++++++++++++++++++++
 sound/soc/intel/boards/sof_cirrus_common.h |  25 ++++
 4 files changed, 194 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_cirrus_common.c
 create mode 100644 sound/soc/intel/boards/sof_cirrus_common.h

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index d96ebc335249..f29f9b731ed9 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -35,6 +35,9 @@ config SND_SOC_INTEL_SOF_MAXIM_COMMON
 config SND_SOC_INTEL_SOF_REALTEK_COMMON
 	tristate
 
+config SND_SOC_INTEL_SOF_CIRRUS_COMMON
+	tristate
+
 if SND_SOC_INTEL_CATPT
 
 config SND_SOC_INTEL_HASWELL_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index b2966020e7ed..d0ef71b7af6e 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -91,3 +91,6 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_MAXIM_COMMON) += snd-soc-intel-sof-maxim-common.o
 
 snd-soc-intel-sof-realtek-common-objs += sof_realtek_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_REALTEK_COMMON) += snd-soc-intel-sof-realtek-common.o
+
+snd-soc-intel-sof-cirrus-common-objs += sof_cirrus_common.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_CIRRUS_COMMON) += snd-soc-intel-sof-cirrus-common.o
diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
new file mode 100644
index 000000000000..e71d74ec1b0b
--- /dev/null
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This file defines data structures and functions used in Machine
+ * Driver for Intel platforms with Cirrus Logic Codecs.
+ *
+ * Copyright 2022 Intel Corporation.
+ */
+#include <linux/module.h>
+#include <sound/sof.h>
+#include "../../codecs/cs35l41.h"
+#include "sof_cirrus_common.h"
+
+/*
+ * Cirrus Logic CS35L41/CS35L53
+ */
+static const struct snd_kcontrol_new cs35l41_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("WL Spk"),
+	SOC_DAPM_PIN_SWITCH("WR Spk"),
+	SOC_DAPM_PIN_SWITCH("TL Spk"),
+	SOC_DAPM_PIN_SWITCH("TR Spk"),
+};
+
+static const struct snd_soc_dapm_widget cs35l41_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("WL Spk", NULL),
+	SND_SOC_DAPM_SPK("WR Spk", NULL),
+	SND_SOC_DAPM_SPK("TL Spk", NULL),
+	SND_SOC_DAPM_SPK("TR Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route cs35l41_dapm_routes[] = {
+	/* speaker */
+	{"WL Spk", NULL, "WL SPK"},
+	{"WR Spk", NULL, "WR SPK"},
+	{"TL Spk", NULL, "TL SPK"},
+	{"TR Spk", NULL, "TR SPK"},
+};
+
+static struct snd_soc_dai_link_component cs35l41_components[] = {
+	{
+		.name = CS35L41_DEV0_NAME,
+		.dai_name = CS35L41_CODEC_DAI,
+	},
+	{
+		.name = CS35L41_DEV1_NAME,
+		.dai_name = CS35L41_CODEC_DAI,
+	},
+	{
+		.name = CS35L41_DEV2_NAME,
+		.dai_name = CS35L41_CODEC_DAI,
+	},
+	{
+		.name = CS35L41_DEV3_NAME,
+		.dai_name = CS35L41_CODEC_DAI,
+	},
+};
+
+static struct snd_soc_codec_conf cs35l41_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(CS35L41_DEV0_NAME),
+		.name_prefix = "WL",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(CS35L41_DEV1_NAME),
+		.name_prefix = "WR",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(CS35L41_DEV2_NAME),
+		.name_prefix = "TL",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(CS35L41_DEV3_NAME),
+		.name_prefix = "TR",
+	},
+};
+
+static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, cs35l41_dapm_widgets,
+					ARRAY_SIZE(cs35l41_dapm_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add dapm controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, cs35l41_kcontrols,
+					ARRAY_SIZE(cs35l41_kcontrols));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, cs35l41_dapm_routes,
+				      ARRAY_SIZE(cs35l41_dapm_routes));
+
+	if (ret)
+		dev_err(rtd->dev, "fail to add dapm routes, ret %d\n", ret);
+
+	return ret;
+}
+
+static int cs35l41_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	int clk_freq, i, ret;
+
+	clk_freq = sof_dai_get_bclk(rtd); /* BCLK freq */
+
+	if (clk_freq <= 0) {
+		dev_err(rtd->dev, "fail to get bclk freq, ret %d\n", clk_freq);
+		return -EINVAL;
+	}
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		/* call dai driver's set_sysclk() callback */
+		ret = snd_soc_dai_set_sysclk(codec_dai, CS35L41_CLKID_SCLK,
+					     clk_freq, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "fail to set sysclk, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		/* call component driver's set_sysclk() callback */
+		ret = snd_soc_component_set_sysclk(codec_dai->component,
+						   CS35L41_CLKID_SCLK, 0,
+						   clk_freq, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "fail to set component sysclk, ret %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops cs35l41_ops = {
+	.hw_params = cs35l41_hw_params,
+};
+
+void cs35l41_set_dai_link(struct snd_soc_dai_link *link)
+{
+	link->codecs = cs35l41_components;
+	link->num_codecs = ARRAY_SIZE(cs35l41_components);
+	link->init = cs35l41_init;
+	link->ops = &cs35l41_ops;
+}
+EXPORT_SYMBOL_NS(cs35l41_set_dai_link, SND_SOC_INTEL_SOF_CIRRUS_COMMON);
+
+void cs35l41_set_codec_conf(struct snd_soc_card *card)
+{
+	card->codec_conf = cs35l41_codec_conf;
+	card->num_configs = ARRAY_SIZE(cs35l41_codec_conf);
+}
+EXPORT_SYMBOL_NS(cs35l41_set_codec_conf, SND_SOC_INTEL_SOF_CIRRUS_COMMON);
+
+MODULE_DESCRIPTION("ASoC Intel SOF Cirrus Logic helpers");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_cirrus_common.h b/sound/soc/intel/boards/sof_cirrus_common.h
new file mode 100644
index 000000000000..ca438c12c386
--- /dev/null
+++ b/sound/soc/intel/boards/sof_cirrus_common.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This file defines data structures used in Machine Driver for Intel
+ * platforms with Cirrus Logic Codecs.
+ *
+ * Copyright 2022 Intel Corporation.
+ */
+#ifndef __SOF_CIRRUS_COMMON_H
+#define __SOF_CIRRUS_COMMON_H
+
+#include <sound/soc.h>
+
+/*
+ * Cirrus Logic CS35L41/CS35L53
+ */
+#define CS35L41_CODEC_DAI	"cs35l41-pcm"
+#define CS35L41_DEV0_NAME	"i2c-CSC3541:00"
+#define CS35L41_DEV1_NAME	"i2c-CSC3541:01"
+#define CS35L41_DEV2_NAME	"i2c-CSC3541:02"
+#define CS35L41_DEV3_NAME	"i2c-CSC3541:03"
+
+void cs35l41_set_dai_link(struct snd_soc_dai_link *link);
+void cs35l41_set_codec_conf(struct snd_soc_card *card);
+
+#endif /* __SOF_CIRRUS_COMMON_H */
-- 
2.25.1

