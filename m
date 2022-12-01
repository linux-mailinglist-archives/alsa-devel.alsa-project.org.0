Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3C363F65A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:43:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A0D91832;
	Thu,  1 Dec 2022 18:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A0D91832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916632;
	bh=FqpfiovHF+2KcxXkLOOP+nWMHHV3gxU5jNKKz4Px7qw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=att3cvHxUbElbrbBR9Jh568F1WptgIao6cSjZ8LGlNOiITCMQ0aVe+l8AlbRHeIia
	 oOTmoxbBGGgmSFF5uvL5W0WcHh8cA1FH+eVJWM6Aj0iXcpGO0ACvxUXR2BNvTZFYj0
	 jwBWGnRUWlXfAMiB45e5xOTZCgrgGkhb3CwrXsTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29122F805D2;
	Thu,  1 Dec 2022 18:39:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 032D0F805C5; Thu,  1 Dec 2022 18:39:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CE40F805BA
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE40F805BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bZSYZ3zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916384; x=1701452384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FqpfiovHF+2KcxXkLOOP+nWMHHV3gxU5jNKKz4Px7qw=;
 b=bZSYZ3zrfWELy0JT9ceydMGFTGBs8gul1LOqgX+jj2I5XfT0FXTWgTtS
 RPfnFphAOrl4+rUdOPTI3xKp9o8RV0KoUHyfJlA8luEN/05O/Lcag5F8i
 N95s+1oE+UDpx9sMHivRLvV2gmp8X17zID7XziDXbUlGD7yak5UNC8QLu
 RiS0bOIhRwCDnED7DJcHu9WmW4yczrspQEaigocJ+SBBr4D9nCE2pSEjq
 f2MGW7H/BYdrXzt0vzpKfIlCtSBEy466EnUaI0/pVevNVOXXzKA31CmvL
 qQwMgmagg7PxpU6eTQMjdy3hz1qqSxwrKekPzHCLdUhFKYnBs/i43Feq8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908460"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908460"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889824049"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889824049"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:40 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 12/16] ASoC: Intel: avs: Add probe machine board
Date: Thu,  1 Dec 2022 18:56:15 +0100
Message-Id: <20221201175619.504758-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201175619.504758-1-cezary.rojewski@intel.com>
References: <20221201175619.504758-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Stub machine board driver with no custom DAPM routes and single FE DAI
link for userspace to interact with.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 33 ++++++++++++++
 sound/soc/intel/avs/boards/Kconfig    |  8 ++++
 sound/soc/intel/avs/boards/Makefile   |  2 +
 sound/soc/intel/avs/boards/probe.c    | 64 +++++++++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/probe.c

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 02cc1ce8f5f5..b2823c2107f7 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -291,6 +291,33 @@ static void board_pdev_unregister(void *data)
 	platform_device_unregister(data);
 }
 
+static int __maybe_unused avs_register_probe_board(struct avs_dev *adev)
+{
+	struct platform_device *board;
+	struct snd_soc_acpi_mach mach = {{0}};
+	int ret;
+
+	ret = avs_probe_platform_register(adev, "probe-platform");
+	if (ret < 0)
+		return ret;
+
+	mach.mach_params.platform = "probe-platform";
+
+	board = platform_device_register_data(NULL, "avs_probe_mb", PLATFORM_DEVID_NONE,
+					      (const void *)&mach, sizeof(mach));
+	if (IS_ERR(board)) {
+		dev_err(adev->dev, "probe board register failed\n");
+		return PTR_ERR(board);
+	}
+
+	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
+	if (ret < 0) {
+		platform_device_unregister(board);
+		return ret;
+	}
+	return 0;
+}
+
 static int avs_register_dmic_board(struct avs_dev *adev)
 {
 	struct platform_device *codec, *board;
@@ -500,6 +527,12 @@ int avs_register_all_boards(struct avs_dev *adev)
 {
 	int ret;
 
+#ifdef CONFIG_DEBUG_FS
+	ret = avs_register_probe_board(adev);
+	if (ret < 0)
+		dev_warn(adev->dev, "enumerate PROBE endpoints failed: %d\n", ret);
+#endif
+
 	ret = avs_register_dmic_board(adev);
 	if (ret < 0)
 		dev_warn(adev->dev, "enumerate DMIC endpoints failed: %d\n",
diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 9bd40fdd9028..e4c230efe8d7 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -77,6 +77,14 @@ config SND_SOC_INTEL_AVS_MACH_NAU8825
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
+config SND_SOC_INTEL_AVS_MACH_PROBE
+	tristate "Probing (data) board"
+	depends on DEBUG_FS
+	select SND_HWDEP
+	help
+	   This adds support for data probing board which can be used to
+	   gather data from runtime stream over compress operations.
+
 config SND_SOC_INTEL_AVS_MACH_RT274
 	tristate "rt274 in I2S mode"
 	depends on I2C
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index 4d70b8d09ce5..b81343420370 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -8,6 +8,7 @@ snd-soc-avs-max98927-objs := max98927.o
 snd-soc-avs-max98357a-objs := max98357a.o
 snd-soc-avs-max98373-objs := max98373.o
 snd-soc-avs-nau8825-objs := nau8825.o
+snd-soc-avs-probe-objs := probe.o
 snd-soc-avs-rt274-objs := rt274.o
 snd-soc-avs-rt286-objs := rt286.o
 snd-soc-avs-rt298-objs := rt298.o
@@ -22,6 +23,7 @@ obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98927) += snd-soc-avs-max98927.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98357A) += snd-soc-avs-max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98373) += snd-soc-avs-max98373.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_NAU8825) += snd-soc-avs-nau8825.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_PROBE) += snd-soc-avs-probe.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT274) += snd-soc-avs-rt274.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT286) += snd-soc-avs-rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT298) += snd-soc-avs-rt298.o
diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
new file mode 100644
index 000000000000..411acaee74f9
--- /dev/null
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -0,0 +1,64 @@
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
+SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
+SND_SOC_DAILINK_DEF(probe_cp, DAILINK_COMP_ARRAY(COMP_CPU("Probe Extraction CPU DAI")));
+SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("probe-platform")));
+
+static struct snd_soc_dai_link probe_mb_dai_links[] = {
+	{
+		.name = "Compress Probe Capture",
+		.nonatomic = 1,
+		SND_SOC_DAILINK_REG(probe_cp, dummy, platform),
+	},
+};
+
+static int avs_probe_mb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	int ret;
+
+	mach = dev_get_platdata(dev);
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->name = "avs_probe_mb";
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->dai_link = probe_mb_dai_links;
+	card->num_links = ARRAY_SIZE(probe_mb_dai_links);
+	card->fully_routed = true;
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_probe_mb_driver = {
+	.probe = avs_probe_mb_probe,
+	.driver = {
+		.name = "avs_probe_mb",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_probe_mb_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_probe_mb");
-- 
2.25.1

