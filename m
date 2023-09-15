Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3E47A1F0F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:45:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 004B4E80;
	Fri, 15 Sep 2023 14:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 004B4E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781931;
	bh=zPy+3sccQoKNgoc0xK4zF+WWBM6gv5CjZjz0dOBjI6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LFRiVEKjPgb7y/sraSHTTprmzUjrHkG7lWjFUbae9WMHvJp/wUZi1r4Zmg6Eb73uv
	 J8gY/OlTkuQjcwS7TgG4yiX7hOfGDV+u3BbUyAdxfsezX86DvqCSuAr2Rw/AiEwIpG
	 YhZzuP4KeIdHhawVjXGJ7OTHW5cb0yfSjG10PNTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 317F8F8061C; Fri, 15 Sep 2023 14:41:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B3EFF8061D;
	Fri, 15 Sep 2023 14:41:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0803F805D7; Fri, 15 Sep 2023 14:40:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB13FF805C4
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB13FF805C4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LsuaEtCP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781644; x=1726317644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zPy+3sccQoKNgoc0xK4zF+WWBM6gv5CjZjz0dOBjI6c=;
  b=LsuaEtCP6dehHBHOMow8mbe/VIU6Nq3ox6sDEN6bzZ//zgBkYLXv+dwD
   24ORphbTuE9EVL8PDaxlMC0BaY5xBnF0x4/DLj7VUJ2StCF7qMQUp/wgF
   UpQ1ar1on7Yy2YdaG7N5fcTrVTPExfn/AW/VTJDlZLPccztKkVl1yQgR3
   EDVVbIpYsqpxvx0virzfpA/yvSSQm9sCAOZhGEOd89y9StnDZSobBbxOE
   N5WjVa/5VYyubxaj8lX2+DPDpazLKWomoJljGvd3bs7xv+b9jIKv+clKb
   0xTKj5mVMQIO047jnrDpdR38OA/vsbDsMn5LBNoFkdsXEm+8sLPr70HHm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653217"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653217"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304612"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304612"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 13/19] ASoC: Intel: nuvoton-common: support nau8318 amplifier
Date: Fri, 15 Sep 2023 20:48:46 +0800
Message-Id: <20230915124852.1696857-14-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7YGITBTB3DHHAHSMKUMQMMKRHWJHHXXQ
X-Message-ID-Hash: 7YGITBTB3DHHAHSMKUMQMMKRHWJHHXXQ
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YGITBTB3DHHAHSMKUMQMMKRHWJHHXXQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Implement nau8318 support code in this common module so it could be
shared between multiple SOF machine drivers.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig              |  3 +
 sound/soc/intel/boards/Makefile             |  3 +
 sound/soc/intel/boards/sof_nuvoton_common.c | 73 +++++++++++++++++++++
 sound/soc/intel/boards/sof_nuvoton_common.h | 22 +++++++
 4 files changed, 101 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_nuvoton_common.c
 create mode 100644 sound/soc/intel/boards/sof_nuvoton_common.h

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 6da6cad7fd05..d32098e0c576 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -38,6 +38,9 @@ config SND_SOC_INTEL_SOF_REALTEK_COMMON
 config SND_SOC_INTEL_SOF_CIRRUS_COMMON
 	tristate
 
+config SND_SOC_INTEL_SOF_NUVOTON_COMMON
+	tristate
+
 config SND_SOC_INTEL_SOF_SSP_COMMON
 	tristate
 
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index ce03a0be1a92..70eb596f4ec3 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -97,5 +97,8 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_REALTEK_COMMON) += snd-soc-intel-sof-realtek-comm
 snd-soc-intel-sof-cirrus-common-objs += sof_cirrus_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CIRRUS_COMMON) += snd-soc-intel-sof-cirrus-common.o
 
+snd-soc-intel-sof-nuvoton-common-objs += sof_nuvoton_common.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_NUVOTON_COMMON) += snd-soc-intel-sof-nuvoton-common.o
+
 snd-soc-intel-sof-ssp-common-objs += sof_ssp_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON) += snd-soc-intel-sof-ssp-common.o
diff --git a/sound/soc/intel/boards/sof_nuvoton_common.c b/sound/soc/intel/boards/sof_nuvoton_common.c
new file mode 100644
index 000000000000..549a412f5d53
--- /dev/null
+++ b/sound/soc/intel/boards/sof_nuvoton_common.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This file defines data structures and functions used in Machine
+ * Driver for Intel platforms with Nuvoton Codecs.
+ *
+ * Copyright 2023 Intel Corporation.
+ */
+#include <linux/module.h>
+#include <sound/sof.h>
+#include "sof_nuvoton_common.h"
+
+/*
+ * Nuvoton NAU8318
+ */
+static const struct snd_kcontrol_new nau8318_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("Spk"),
+};
+
+static const struct snd_soc_dapm_widget nau8318_widgets[] = {
+	SND_SOC_DAPM_SPK("Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route nau8318_routes[] = {
+	{ "Spk", NULL, "Speaker" },
+};
+
+static struct snd_soc_dai_link_component nau8318_components[] = {
+	{
+		.name = NAU8318_DEV0_NAME,
+		.dai_name = NAU8318_CODEC_DAI,
+	}
+};
+
+static int nau8318_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, nau8318_widgets,
+					ARRAY_SIZE(nau8318_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add nau8318 widgets, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, nau8318_kcontrols,
+					ARRAY_SIZE(nau8318_kcontrols));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add nau8318 kcontrols, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, nau8318_routes,
+				      ARRAY_SIZE(nau8318_routes));
+
+	if (ret) {
+		dev_err(rtd->dev, "fail to add nau8318 routes, ret %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+void nau8318_set_dai_link(struct snd_soc_dai_link *link)
+{
+	link->codecs = nau8318_components;
+	link->num_codecs = ARRAY_SIZE(nau8318_components);
+	link->init = nau8318_init;
+}
+EXPORT_SYMBOL_NS(nau8318_set_dai_link, SND_SOC_INTEL_SOF_NUVOTON_COMMON);
+
+MODULE_DESCRIPTION("ASoC Intel SOF Nuvoton helpers");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_nuvoton_common.h b/sound/soc/intel/boards/sof_nuvoton_common.h
new file mode 100644
index 000000000000..53a84f9a67c0
--- /dev/null
+++ b/sound/soc/intel/boards/sof_nuvoton_common.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This file defines data structures used in Machine Driver for Intel
+ * platforms with Nuvoton Codecs.
+ *
+ * Copyright 2023 Intel Corporation.
+ */
+#ifndef __SOF_NUVOTON_COMMON_H
+#define __SOF_NUVOTON_COMMON_H
+
+#include <sound/soc.h>
+#include "sof_ssp_common.h"
+
+/*
+ * Nuvoton NAU8318
+ */
+#define NAU8318_CODEC_DAI	"nau8315-hifi"
+#define NAU8318_DEV0_NAME	"i2c-" NAU8318_ACPI_HID ":00"
+
+void nau8318_set_dai_link(struct snd_soc_dai_link *link);
+
+#endif /* __SOF_NUVOTON_COMMON_H */
-- 
2.25.1

