Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7149951135C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:14:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0927117D6;
	Wed, 27 Apr 2022 10:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0927117D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651047263;
	bh=8YvNAC1rsPhICtGgS5AZuFFvu7TWZxMLTZxU3elVtFc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qREo1rO1CCk1dC5hnHQCnIJT7VYsdlX1MpUJstnY5abX0vaMZudptCvmOOlPR7VBa
	 BVgYd0k/QeEdSF/qo21tFtKfY83WzIGWYf2u3InX3EgZI1ioOEw873aCqZxz7VPyP+
	 foLyoYavbo7kwIHWss1RHF8Ig69T7rnI/lj2iY/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8144DF805A0;
	Wed, 27 Apr 2022 10:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0491DF80155; Wed, 27 Apr 2022 10:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB2AEF80253
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB2AEF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YXjGYdZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651046953; x=1682582953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8YvNAC1rsPhICtGgS5AZuFFvu7TWZxMLTZxU3elVtFc=;
 b=YXjGYdZyK/EendIHibrdOmoDQKZOOB0HcrhYeIp/RIbebzqTdyEm3tKR
 IBC/2PfcaImfZJ3T7li+A9Cm93/vf/xLqUKcT5bFsPcXsFEPwVRRlTlCn
 ersr8klfpOyis7HZB/RXX12w2RDeiGs5/saiiGk9Qit0iB9KsKwdGbwvZ
 L7gWt+HClBeMtvd82D53Bk3Gi9e2tojpIgsNwGppUuaADhiPxyxto+7Lc
 BN7YqA9gRA/JEr6ks8tgSyoQVnPcBJSjPCVd2HNWDzKLBC21s6BU7qb3P
 xmECQNKB7/KQgw0SdMm1MuMhQU3y+JW4AngDAB408T1ouq/vr1np32CV2 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291006200"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="291006200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705437380"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2022 01:09:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 04/14] ASoC: Intel: avs: Add DMIC machine board
Date: Wed, 27 Apr 2022 10:18:52 +0200
Message-Id: <20220427081902.3525183-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427081902.3525183-1-cezary.rojewski@intel.com>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
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

