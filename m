Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACEC523894
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 18:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5CC21A97;
	Wed, 11 May 2022 18:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5CC21A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652285950;
	bh=Rf2LkYwTX+nvq+ze2m18AYlTfY/YYasm4/D6qCbzyMA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lhmmIL51O3HrydyW7ZPUs/E0b1wo9on8lcfr3cp8vyIRCb90i54EfN3xQ6WOZ47E4
	 FTbvyoxjO77CrrsCk2jnxcHUCjp2+2sBUXCxUjiszZxaL5b7N+bgm6dKqJzHSEa0vo
	 qrLyxvr4bg6AmjZghrWIUq1N5w12yFpHskTNgxcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23671F8056F;
	Wed, 11 May 2022 18:16:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68034F80570; Wed, 11 May 2022 18:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9845F804B2
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 18:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9845F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jv55MwUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652285758; x=1683821758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rf2LkYwTX+nvq+ze2m18AYlTfY/YYasm4/D6qCbzyMA=;
 b=Jv55MwUsmeixX2Vy5A4x2uLc1ASe15FaaGIoBzmsroBnOsVcOI6zf2PY
 0s+uhGi4Ynn6lHiVXfecUOS2sw8+HMcSb9f3izBK/2t16Wb030fkwJspM
 N6GWMr6Dw0Jz+i36vmvOhVJuG8PNmEHgWpe4bk24Zj1cdPXVjJ3tF8VLC
 tK5hSHxNBqk+/zUjNCmMCygJWi33NMex4ApQNPUld17kPD2imZvcsYGrQ
 WNMf4uax56lybOUO4Z4VTr1YIQg1kq+uBifohZtGiXynxFica9Diy4SNO
 WetP0p1Q12BgsG9Xl7GcAr38zce3mmQCHl35RXF0s0WaMIzOgcS2q1jn7 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269680227"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269680227"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 09:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="594210143"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 09:15:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 12/14] ASoC: Intel: avs: Add max98357a machine board
Date: Wed, 11 May 2022 18:24:01 +0200
Message-Id: <20220511162403.3987658-13-cezary.rojewski@intel.com>
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

To support AVS-max98357a configuration add machine board connecting AVS
platform component driver with max98357a codec one.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/Kconfig     |  10 ++
 sound/soc/intel/avs/boards/Makefile    |   2 +
 sound/soc/intel/avs/boards/max98357a.c | 154 +++++++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/max98357a.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 7020e7bf196e..28e6691270d9 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -26,6 +26,16 @@ config SND_SOC_INTEL_AVS_MACH_I2S_TEST
 	   This adds support for I2S test-board which can be used to verify
 	   transfer over I2S interface with SSP loopback scenarios.
 
+config SND_SOC_INTEL_AVS_MACH_MAX98357A
+	tristate "max98357A I2S board"
+	depends on I2C
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_MAX98357A
+	help
+	  This adds support for AVS with MAX98357A I2S codec configuration.
+	  Say Y or m if you have such a device. This is a recommended option.
+	  If unsure select "N".
+
 config SND_SOC_INTEL_AVS_MACH_NAU8825
 	tristate "nau8825 I2S board"
 	depends on I2C
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index ea67fc711d9d..f7ac1151a8f7 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -3,6 +3,7 @@
 snd-soc-avs-dmic-objs := dmic.o
 snd-soc-avs-hdaudio-objs := hdaudio.o
 snd-soc-avs-i2s-test-objs := i2s_test.o
+snd-soc-avs-max98357a-objs := max98357a.o
 snd-soc-avs-nau8825-objs := nau8825.o
 snd-soc-avs-rt274-objs := rt274.o
 snd-soc-avs-rt286-objs := rt286.o
@@ -13,6 +14,7 @@ snd-soc-avs-ssm4567-objs := ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO) += snd-soc-avs-hdaudio.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_i2s_TEST) += snd-soc-avs-i2s-test.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98357A) += snd-soc-avs-max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_NAU8825) += snd-soc-avs-nau8825.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT274) += snd-soc-avs-rt274.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT286) += snd-soc-avs-rt286.o
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
new file mode 100644
index 000000000000..921f42caf7e0
--- /dev/null
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+
+static const struct snd_kcontrol_new card_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Spk"),
+};
+
+static const struct snd_soc_dapm_widget card_widgets[] = {
+	SND_SOC_DAPM_SPK("Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route card_base_routes[] = {
+	{ "Spk", NULL, "Speaker" },
+};
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
+	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "MX98357A:00");
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "HiFi");
+	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
+		return -ENOMEM;
+
+	dl->num_cpus = 1;
+	dl->num_codecs = 1;
+	dl->platforms = platform;
+	dl->num_platforms = 1;
+	dl->id = 0;
+	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->nonatomic = 1;
+	dl->no_pcm = 1;
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
+	const int num_base = ARRAY_SIZE(card_base_routes);
+	const int num_dr = num_base + 1;
+	int idx;
+
+	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
+
+	idx = num_base;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "HiFi Playback");
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	*routes = dr;
+	*num_routes = num_dr;
+
+	return 0;
+}
+
+static int avs_max98357a_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dapm_route *routes;
+	struct snd_soc_dai_link *dai_link;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	struct device *dev = &pdev->dev;
+	const char *pname;
+	int num_routes, ssp_port, ret;
+
+	mach = dev_get_platdata(dev);
+	pname = mach->mach_params.platform;
+	ssp_port = __ffs(mach->mach_params.i2s_link_mask);
+
+	ret = avs_create_dai_link(dev, pname, ssp_port, &dai_link);
+	if (ret) {
+		dev_err(dev, "Failed to create dai link: %d", ret);
+		return ret;
+	}
+
+	ret = avs_create_dapm_routes(dev, ssp_port, &routes, &num_routes);
+	if (ret) {
+		dev_err(dev, "Failed to create dapm routes: %d", ret);
+		return ret;
+	}
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->name = "avs_max98357a";
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->dai_link = dai_link;
+	card->num_links = 1;
+	card->controls = card_controls;
+	card->num_controls = ARRAY_SIZE(card_controls);
+	card->dapm_widgets = card_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
+	card->dapm_routes = routes;
+	card->num_dapm_routes = num_routes;
+	card->fully_routed = true;
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_max98357a_driver = {
+	.probe = avs_max98357a_probe,
+	.driver = {
+		.name = "avs_max98357a",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_max98357a_driver)
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_max98357a");
-- 
2.25.1

