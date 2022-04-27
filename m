Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A7451134D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:11:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B5A1798;
	Wed, 27 Apr 2022 10:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B5A1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651047095;
	bh=cRLUvRl17Y4pq/2SMiEqfcoxUhYEIuPyPVIdQb8x1Is=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHzSt3EpwVVowyJUhjn0x6Vl0rHb1XPL45sxHMRlUEjHW790gZ9jmognlPh4l7BDl
	 W9WYLSYixePX2dU2tVir1IE31jAYShW/Ll+jG1i/ylsTR/FVHxQaYmBr4L33wLtCGK
	 uzfPvGhT1YQF4Xu3CYoKqbOPDXq7CBslnjEQCcB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76017F80537;
	Wed, 27 Apr 2022 10:09:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 445BDF80537; Wed, 27 Apr 2022 10:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A51BDF8051A
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A51BDF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nUyCk/nN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651046979; x=1682582979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cRLUvRl17Y4pq/2SMiEqfcoxUhYEIuPyPVIdQb8x1Is=;
 b=nUyCk/nNRYvNSQrp9zcbSs034rNTEg/9jyOdWFf3RV788VjX5M1ejh0W
 rgfZW4LEtXRUr7oL+0HClTnc+hLwk5b/1bkXY0gX938xi4WbHfMb1X3qT
 FqjaLtWbCsQZBCZgAJVtfrt1YBx8Qn/tszz317d+dQXkTflmRi6MWommS
 4maK5PViUXNiDjOabqhAGdUD74HKthUwXnMzZQkOCQvDP/spBG5AfVcHk
 uaDMHu9J9N85amKStyEwdpZVlthJQdCrVmzjyGXxxvpzwp8Nyr09jKmGT
 1wWxlsZCurpv778mYlD3wqXx8OvLlQSiMzYPSFYoNhObUl67kVc8+vFvj A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291006216"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="291006216"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705437429"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2022 01:09:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 05/14] ASoC: Intel: avs: Add ssp-test machine board
Date: Wed, 27 Apr 2022 10:18:53 +0200
Message-Id: <20220427081902.3525183-6-cezary.rojewski@intel.com>
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

Allow for testing audio streaming over I2S interface through SSP-test
board. No actual codec is needed here as board is intended for SSP
loopback scenarios only. One playback and one capture endpoint is
exposed per SSP port.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/Kconfig    |   6 +
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/ssp_test.c | 178 ++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/ssp_test.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 1d4597fa9814..ea2f094758f9 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -20,4 +20,10 @@ config SND_SOC_INTEL_AVS_MACH_HDAUDIO
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
 
+config SND_SOC_INTEL_AVS_MACH_SSP_TEST
+	tristate "SSP test board"
+	help
+	   This adds support for SSP test board which can be used to verify
+	   transfer over I2S interface with loopback scenarios.
+
 endmenu
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index 2ff35d4d97d8..1c860ca165de 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -2,6 +2,8 @@
 
 snd-soc-avs-dmic-objs := dmic.o
 snd-soc-avs-hdaudio-objs := hdaudio.o
+snd-soc-avs-ssp-test-objs := ssp_test.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO) += snd-soc-avs-hdaudio.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_SSP_TEST) += snd-soc-avs-ssp-test.o
diff --git a/sound/soc/intel/avs/boards/ssp_test.c b/sound/soc/intel/avs/boards/ssp_test.c
new file mode 100644
index 000000000000..cabaf615b9ae
--- /dev/null
+++ b/sound/soc/intel/avs/boards/ssp_test.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+
+static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
+			       struct snd_soc_dai_link **dai_link)
+{
+	struct snd_soc_dai_link_component *platform;
+	struct snd_soc_dai_link *dl;
+
+	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
+	if (!dl || !platform)
+		return -ENOMEM;
+
+	platform->name = platform_name;
+
+	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
+	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
+	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
+	if (!dl->name || !dl->cpus || !dl->codecs)
+		return -ENOMEM;
+
+	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
+	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "snd-soc-dummy");
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "snd-soc-dummy-dai");
+	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
+		return -ENOMEM;
+
+	dl->num_cpus = 1;
+	dl->num_codecs = 1;
+	dl->platforms = platform;
+	dl->num_platforms = 1;
+	dl->id = 0;
+	dl->nonatomic = 1;
+	dl->no_pcm = 1;
+	dl->dpcm_capture = 1;
+	dl->dpcm_playback = 1;
+
+	*dai_link = dl;
+
+	return 0;
+}
+
+static int avs_create_dapm_routes(struct device *dev, int ssp_port,
+				  struct snd_soc_dapm_route **routes, int *num_routes)
+{
+	struct snd_soc_dapm_route *dr;
+	const int num_dr = 2;
+
+	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	dr[0].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%dpb", ssp_port);
+	dr[0].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
+	if (!dr[0].sink || !dr[0].source)
+		return -ENOMEM;
+
+	dr[1].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
+	dr[1].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%dcp", ssp_port);
+	if (!dr[1].sink || !dr[1].source)
+		return -ENOMEM;
+
+	*routes = dr;
+	*num_routes = num_dr;
+
+	return 0;
+}
+
+static int avs_create_dapm_widgets(struct device *dev, int ssp_port,
+				   struct snd_soc_dapm_widget **widgets, int *num_widgets)
+{
+	struct snd_soc_dapm_widget *dw;
+	const int num_dw = 2;
+
+	dw = devm_kcalloc(dev, num_dw, sizeof(*dw), GFP_KERNEL);
+	if (!dw)
+		return -ENOMEM;
+
+	dw[0].id = snd_soc_dapm_hp;
+	dw[0].reg = SND_SOC_NOPM;
+	dw[0].name = devm_kasprintf(dev, GFP_KERNEL, "ssp%dpb", ssp_port);
+	if (!dw[0].name)
+		return -ENOMEM;
+
+	dw[1].id = snd_soc_dapm_mic;
+	dw[1].reg = SND_SOC_NOPM;
+	dw[1].name = devm_kasprintf(dev, GFP_KERNEL, "ssp%dcp", ssp_port);
+	if (!dw[1].name)
+		return -ENOMEM;
+
+	*widgets = dw;
+	*num_widgets = num_dw;
+
+	return 0;
+}
+
+static int avs_ssp_test_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dapm_widget *widgets;
+	struct snd_soc_dapm_route *routes;
+	struct snd_soc_dai_link *dai_link;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	struct device *dev = &pdev->dev;
+	const char *pname;
+	int num_routes, num_widgets, ret;
+
+	mach = dev_get_platdata(dev);
+	pname = mach->mach_params.platform;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->name = devm_kasprintf(dev, GFP_KERNEL, "ssp%ld-loopback", __ffs(mach->link_mask));
+	if (!card->name)
+		return -ENOMEM;
+
+	ret = avs_create_dai_link(dev, pname, __ffs(mach->link_mask), &dai_link);
+	if (ret) {
+		dev_err(dev, "Failed to create dai link: %d\n", ret);
+		return ret;
+	}
+
+	ret = avs_create_dapm_routes(dev, __ffs(mach->link_mask), &routes, &num_routes);
+	if (ret) {
+		dev_err(dev, "Failed to create dapm routes: %d\n", ret);
+		return ret;
+	}
+
+	ret = avs_create_dapm_widgets(dev, __ffs(mach->link_mask), &widgets, &num_widgets);
+	if (ret) {
+		dev_err(dev, "Failed to create dapm widgets: %d\n", ret);
+		return ret;
+	}
+
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->dai_link = dai_link;
+	card->num_links = 1;
+	card->dapm_routes = routes;
+	card->num_dapm_routes = num_routes;
+	card->dapm_widgets = widgets;
+	card->num_dapm_widgets = num_widgets;
+	card->fully_routed = true;
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_ssp_test_driver = {
+	.probe = avs_ssp_test_probe,
+	.driver = {
+		.name = "avs_ssp_test",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_ssp_test_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_ssp_test");
-- 
2.25.1

