Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42C7A1EE8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:42:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79E6EA4A;
	Fri, 15 Sep 2023 14:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79E6EA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781726;
	bh=9SpmP9nyA0bIyq9diuUGx7TkBuhSmaRmDr/P1UcmsIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pXzLRaQIzPV0xb1JddQ+GkstIQVQPSSMkgAWgqeEkdJ6bF8yhr/5VmGTeAl1WqGwM
	 yLu9sRS3XmnlY3aDmiMA3lIyt6vENSabuua87qMMddW9enZ+pOoK/lCjP0cJIPyzSl
	 aaU4eZyKwyaE2NS+uuikpXMqqcryzXU54IvbgMFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6BA0F8057C; Fri, 15 Sep 2023 14:40:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AEEBF8007C;
	Fri, 15 Sep 2023 14:40:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 495AFF8056F; Fri, 15 Sep 2023 14:40:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E19C9F80425
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E19C9F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UF53dgRq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781618; x=1726317618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9SpmP9nyA0bIyq9diuUGx7TkBuhSmaRmDr/P1UcmsIQ=;
  b=UF53dgRqbuYeCULEneyI98nO5QtxbVyv+4oFjeLRJDl4PMOnNu4ZE9jz
   AiXMgqMwNB0cVwrwuCenZ2Am5nho5PRemfMoFv4b1CVyqZQDR3Bk9wpSU
   LoLDNr15eqGDi2mocMILQIPaRQasK6mBebXC9hjo3Re+knvp0PuNwMV4t
   jQSLCPksIEkjV94rWHuM6T6934kFk+rfg5aXBBkmAnY45AQfqWz/fQDEY
   yepRM+5edL2lDstAcy1R+NIr9jLznUdaAMMgmUGPdWVo+YP86ttsDBVaI
   vDv8A3Mj/mXpn+Ww0f5eOKbdlmbo/3NakTFhH6pijYrURleH/fW8r/AeJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653113"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653113"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304534"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304534"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:10 -0700
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
Subject: [PATCH 02/19] ASoC: Intel: ssp-common: support codec detection
Date: Fri, 15 Sep 2023 20:48:35 +0800
Message-Id: <20230915124852.1696857-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TV6XQCXYRESF7M6LFGCCTLJPAQJ4HB4K
X-Message-ID-Hash: TV6XQCXYRESF7M6LFGCCTLJPAQJ4HB4K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TV6XQCXYRESF7M6LFGCCTLJPAQJ4HB4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Create a new common module to host functions which could be shared
among SSP machine drivers. Add functions to detect headphone codec and
speaker amplifier via ACPI system at runtime in order to remove codec
type quirks in machine drivers.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig          |   3 +
 sound/soc/intel/boards/Makefile         |   3 +
 sound/soc/intel/boards/sof_ssp_common.c | 101 ++++++++++++++++++++++++
 sound/soc/intel/boards/sof_ssp_common.h |  71 +++++++++++++++++
 4 files changed, 178 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_ssp_common.c
 create mode 100644 sound/soc/intel/boards/sof_ssp_common.h

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index f5974619889f..2b735a1ac181 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -38,6 +38,9 @@ config SND_SOC_INTEL_SOF_REALTEK_COMMON
 config SND_SOC_INTEL_SOF_CIRRUS_COMMON
 	tristate
 
+config SND_SOC_INTEL_SOF_SSP_COMMON
+	tristate
+
 if SND_SOC_INTEL_CATPT
 
 config SND_SOC_INTEL_HASWELL_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 936888112952..ce03a0be1a92 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -96,3 +96,6 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_REALTEK_COMMON) += snd-soc-intel-sof-realtek-comm
 
 snd-soc-intel-sof-cirrus-common-objs += sof_cirrus_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CIRRUS_COMMON) += snd-soc-intel-sof-cirrus-common.o
+
+snd-soc-intel-sof-ssp-common-objs += sof_ssp_common.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON) += snd-soc-intel-sof-ssp-common.o
diff --git a/sound/soc/intel/boards/sof_ssp_common.c b/sound/soc/intel/boards/sof_ssp_common.c
new file mode 100644
index 000000000000..41a258e45a61
--- /dev/null
+++ b/sound/soc/intel/boards/sof_ssp_common.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2023 Intel Corporation. All rights reserved.
+
+#include <linux/device.h>
+#include <sound/soc-acpi.h>
+#include "sof_ssp_common.h"
+
+/*
+ * Codec probe function
+ */
+#define CODEC_MAP_ENTRY(n, h, t)	\
+	{				\
+		.name = n,		\
+		.acpi_hid = h,		\
+		.codec_type = t,	\
+	}
+
+struct codec_map {
+	const char *name;
+	const char *acpi_hid;
+	enum sof_ssp_codec codec_type;
+};
+
+static const struct codec_map codecs[] = {
+	/* Cirrus Logic */
+	CODEC_MAP_ENTRY("CS42L42", CS42L42_ACPI_HID, CODEC_CS42L42),
+
+	/* Dialog */
+	CODEC_MAP_ENTRY("DA7219", DA7219_ACPI_HID, CODEC_DA7219),
+
+	/* Everest */
+	CODEC_MAP_ENTRY("ES8316", ES8316_ACPI_HID, CODEC_ES8316),
+	CODEC_MAP_ENTRY("ES8326", ES8326_ACPI_HID, CODEC_ES8326),
+	CODEC_MAP_ENTRY("ES8336", ES8336_ACPI_HID, CODEC_ES8336),
+
+	/* Nuvoton */
+	CODEC_MAP_ENTRY("NAU8825", NAU8825_ACPI_HID, CODEC_NAU8825),
+
+	/* Realtek */
+	CODEC_MAP_ENTRY("RT5650", RT5650_ACPI_HID, CODEC_RT5650),
+	CODEC_MAP_ENTRY("RT5682", RT5682_ACPI_HID, CODEC_RT5682),
+	CODEC_MAP_ENTRY("RT5682S", RT5682S_ACPI_HID, CODEC_RT5682S),
+};
+
+static const struct codec_map amps[] = {
+	/* Cirrus Logic */
+	CODEC_MAP_ENTRY("CS35L41", CS35L41_ACPI_HID, CODEC_CS35L41),
+
+	/* Maxim */
+	CODEC_MAP_ENTRY("MAX98357A", MAX_98357A_ACPI_HID, CODEC_MAX98357A),
+	CODEC_MAP_ENTRY("MAX98360A", MAX_98360A_ACPI_HID, CODEC_MAX98360A),
+	CODEC_MAP_ENTRY("MAX98373", MAX_98373_ACPI_HID, CODEC_MAX98373),
+	CODEC_MAP_ENTRY("MAX98390", MAX_98390_ACPI_HID, CODEC_MAX98390),
+
+	/* Nuvoton */
+	CODEC_MAP_ENTRY("NAU8318", NAU8318_ACPI_HID, CODEC_NAU8318),
+
+	/* Realtek */
+	CODEC_MAP_ENTRY("RT1011", RT1011_ACPI_HID, CODEC_RT1011),
+	CODEC_MAP_ENTRY("RT1015", RT1015_ACPI_HID, CODEC_RT1015),
+	CODEC_MAP_ENTRY("RT1015P", RT1015P_ACPI_HID, CODEC_RT1015P),
+	CODEC_MAP_ENTRY("RT1019P", RT1019P_ACPI_HID, CODEC_RT1019P),
+	CODEC_MAP_ENTRY("RT1308", RT1308_ACPI_HID, CODEC_RT1308),
+};
+
+enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(codecs); i++) {
+		if (!acpi_dev_present(codecs[i].acpi_hid, NULL, -1))
+			continue;
+
+		dev_dbg(dev, "codec %s found\n", codecs[i].name);
+		return codecs[i].codec_type;
+	}
+
+	return CODEC_NONE;
+}
+EXPORT_SYMBOL_NS(sof_ssp_detect_codec_type, SND_SOC_INTEL_SOF_SSP_COMMON);
+
+enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(amps); i++) {
+		if (!acpi_dev_present(amps[i].acpi_hid, NULL, -1))
+			continue;
+
+		dev_dbg(dev, "amp %s found\n", amps[i].name);
+		return amps[i].codec_type;
+	}
+
+	return CODEC_NONE;
+}
+EXPORT_SYMBOL_NS(sof_ssp_detect_amp_type, SND_SOC_INTEL_SOF_SSP_COMMON);
+
+MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
+MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_ssp_common.h b/sound/soc/intel/boards/sof_ssp_common.h
new file mode 100644
index 000000000000..e3fd6fb1db1c
--- /dev/null
+++ b/sound/soc/intel/boards/sof_ssp_common.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2023 Intel Corporation.
+ */
+
+#ifndef __SOF_SSP_COMMON_H
+#define __SOF_SSP_COMMON_H
+
+/* Cirrus Logic */
+#define CS35L41_ACPI_HID	"CSC3541"
+#define CS42L42_ACPI_HID	"10134242"
+
+/* Dialog */
+#define DA7219_ACPI_HID		"DLGS7219"
+
+/* Everest */
+#define ES8316_ACPI_HID		"ESSX8316"
+#define ES8326_ACPI_HID		"ESSX8326"
+#define ES8336_ACPI_HID		"ESSX8336"
+
+#define MAX_98357A_ACPI_HID	"MX98357A"
+#define MAX_98360A_ACPI_HID	"MX98360A"
+#define MAX_98373_ACPI_HID	"MX98373"
+#define MAX_98390_ACPI_HID	"MX98390"
+
+/* Nuvoton */
+#define NAU8318_ACPI_HID	"NVTN2012"
+#define NAU8825_ACPI_HID	"10508825"
+
+/* Realtek */
+#define RT1011_ACPI_HID		"10EC1011"
+#define RT1015_ACPI_HID		"10EC1015"
+#define RT1015P_ACPI_HID	"RTL1015"
+#define RT1019P_ACPI_HID	"RTL1019"
+#define RT1308_ACPI_HID		"10EC1308"
+#define RT5650_ACPI_HID		"10EC5650"
+#define RT5682_ACPI_HID		"10EC5682"
+#define RT5682S_ACPI_HID	"RTL5682"
+
+enum sof_ssp_codec {
+	CODEC_NONE,
+
+	/* headphone codec */
+	CODEC_CS42L42,
+	CODEC_DA7219,
+	CODEC_ES8316,
+	CODEC_ES8326,
+	CODEC_ES8336,
+	CODEC_NAU8825,
+	CODEC_RT5650,
+	CODEC_RT5682,
+	CODEC_RT5682S,
+
+	/* speaker amplifier */
+	CODEC_CS35L41,
+	CODEC_MAX98357A,
+	CODEC_MAX98360A,
+	CODEC_MAX98373,
+	CODEC_MAX98390,
+	CODEC_NAU8318,
+	CODEC_RT1011,
+	CODEC_RT1015,
+	CODEC_RT1015P,
+	CODEC_RT1019P,
+	CODEC_RT1308,
+};
+
+enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev);
+enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev);
+
+#endif /* __SOF_SSP_COMMON_H */
-- 
2.25.1

