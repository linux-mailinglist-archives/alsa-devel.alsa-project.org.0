Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC66523870
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 18:16:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C9891A9D;
	Wed, 11 May 2022 18:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C9891A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652285815;
	bh=8YvNAC1rsPhICtGgS5AZuFFvu7TWZxMLTZxU3elVtFc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNvmA0Es6dLAHQ6mU/3r8tkJKtV6QxXIB2XdP5vA34EsthFJX0LoEPvfCbOzzBLEP
	 TZ/tYHTPdS48//nkSfxNLyFeUrKxMWSJy/eFc1Z2/xXhHM4cPCzB7cL+B/DWxTPdu0
	 QJm89U3WBz0IqSZd/rVMcNv5jzMFQz/HAKIAW2oU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E17F80533;
	Wed, 11 May 2022 18:14:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 703A4F80529; Wed, 11 May 2022 18:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BF62F80529
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 18:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF62F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fnahTy1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652285688; x=1683821688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8YvNAC1rsPhICtGgS5AZuFFvu7TWZxMLTZxU3elVtFc=;
 b=fnahTy1t7mRuBUqWpXLphRx6ZABR8AD5gBDps2ownSuvRDGHqV4n8PMh
 RgZaqfsAm3ADPKk7+17/rIBmXX5df7DPTey0ou4zcY+KeLwuMyL8unyS4
 9xAT48sS4wLCtgkG4uijhry0l5HKfK7/FbS+90OqOYJOzZP+1m8xI9AtV
 w7FxWKU9++Xq3WM5nQNof2iOlfnxp9pJFwh0W+pV0/93pbIJBc+BBa4V6
 6WHKNCKguUs8jWcMT1GyQ5iJVUeFW+I94R3dWXZYXXV891ss6/Pyw8hgG
 yK/KMQzU6KnX9Vo4YbywNelyr9ul3OzyLwMQE97ZmPbvcrqvVNLMtY//s A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269679993"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269679993"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 09:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="594209717"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 09:14:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 04/14] ASoC: Intel: avs: Add DMIC machine board
Date: Wed, 11 May 2022 18:23:53 +0200
Message-Id: <20220511162403.3987658-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511162403.3987658-1-cezary.rojewski@intel.com>
References: <20220511162403.3987658-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 kai.vehmanen@linux.intel.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Support AVS-DMIC configuration by implementing board connecting AVS
platform component with DMIC codec one.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/Kconfig  |  8 +++
 sound/soc/intel/avs/boards/Makefile |  2 +
 sound/soc/intel/avs/boards/dmic.c   | 93 +++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/dmic.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index de62c0437f6e..1d4597fa9814 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -4,6 +4,14 @@ menu "Intel AVS Machine drivers"
 
 comment "Available DSP configurations"
 
+config SND_SOC_INTEL_AVS_MACH_DMIC
+	tristate "DMIC generic board"
+	select SND_SOC_DMIC
+	help
+	  This adds support for AVS with Digital Mic array configuration.
+	  Say Y or m if you have such a device. This is a recommended option.
+	  If unsure select "N".
+
 config SND_SOC_INTEL_AVS_MACH_HDAUDIO
 	tristate "HD-Audio generic board"
 	select SND_SOC_HDA
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index e5281148e5d4..2ff35d4d97d8 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+snd-soc-avs-dmic-objs := dmic.o
 snd-soc-avs-hdaudio-objs := hdaudio.o
 
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO) += snd-soc-avs-hdaudio.o
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
new file mode 100644
index 000000000000..90a921638572
--- /dev/null
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+
+SND_SOC_DAILINK_DEF(dmic_pin, DAILINK_COMP_ARRAY(COMP_CPU("DMIC Pin")));
+SND_SOC_DAILINK_DEF(dmic_wov_pin, DAILINK_COMP_ARRAY(COMP_CPU("DMIC WoV Pin")));
+SND_SOC_DAILINK_DEF(dmic_codec, DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
+/* Name overridden on probe */
+SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("")));
+
+static struct snd_soc_dai_link card_dai_links[] = {
+	/* Back ends */
+	{
+		.name = "DMIC",
+		.id = 0,
+		.dpcm_capture = 1,
+		.nonatomic = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
+	},
+	{
+		.name = "DMIC WoV",
+		.id = 1,
+		.dpcm_capture = 1,
+		.nonatomic = 1,
+		.no_pcm = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(dmic_wov_pin, dmic_codec, platform),
+	},
+};
+
+static const struct snd_soc_dapm_widget card_widgets[] = {
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_route card_routes[] = {
+	{"DMic", NULL, "SoC DMIC"},
+	{"DMIC Rx", NULL, "Capture"},
+	{"DMIC WoV Rx", NULL, "Capture"},
+};
+
+static int avs_dmic_probe(struct platform_device *pdev)
+{
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	mach = dev_get_platdata(dev);
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->name = "avs_dmic";
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->dai_link = card_dai_links;
+	card->num_links = ARRAY_SIZE(card_dai_links);
+	card->dapm_widgets = card_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
+	card->dapm_routes = card_routes;
+	card->num_dapm_routes = ARRAY_SIZE(card_routes);
+	card->fully_routed = true;
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_dmic_driver = {
+	.probe = avs_dmic_probe,
+	.driver = {
+		.name = "avs_dmic",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_dmic_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_dmic");
-- 
2.25.1

