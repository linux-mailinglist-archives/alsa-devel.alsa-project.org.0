Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F089F3C7CE3
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 05:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 159C71691;
	Wed, 14 Jul 2021 05:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 159C71691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626233096;
	bh=eEtf74edK6Uk57gJ0/s0TwXBj7x5dshDtEPJTewN+Zw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=POGGWWz8WwhLGbWxmvu/5hQjsnwIfIQ48lo14r8hrVEgg4g6aaONPCWwfbW7ehQbD
	 UunDcrj9ETRUytXWoeJhc74nw3Cl747KFiuqb+5rsHAn/SZ0hER1RDJoYFF3RfiT/2
	 gM5Lp4gshpAS25WJM1TbsGAA8RarvPPO7HFCYYjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD895F804E0;
	Wed, 14 Jul 2021 05:22:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 155B3F804DA; Wed, 14 Jul 2021 05:22:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2389BF80253
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 05:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2389BF80253
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232086414"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="232086414"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="459818123"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 02/10] ASoC: soc-acpi: cnl: add table for SoundWire mockup
 devices
Date: Wed, 14 Jul 2021 11:22:01 +0800
Message-Id: <20210714032209.11284-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add support for two configurations with SoundWire mockup devices that
emulate the two CometLake configurations with one and two amps. This
patch helps test the SOF firmware on an UpExtreme board without any
hardware connected, e.g. by doing a loopback of the playback stream on
capture streams.

The mapping of the partIDs is as follows:

0xAAAA: generic full-duplex codec (not currently used)
0xAA55: headset codec (mock-up of RT711/RT5682) - full-duplex
0x55AA: amplifier (mock-up of RT1308/RT1316/Maxim 98373) - playback
with IV sense feedback
0x5555: mic codec (mock-up of RT715) - capture-only

The tables are added in a separate file to allow for mockup codecs to be
added on other platforms, but the mapping to specific topologies
remains platform-specific.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/Makefile               |   3 +-
 .../intel/common/soc-acpi-intel-cnl-match.c   |  15 ++
 .../common/soc-acpi-intel-sdw-mockup-match.c  | 166 ++++++++++++++++++
 .../common/soc-acpi-intel-sdw-mockup-match.h  |  17 ++
 4 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h

diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 12a205ccdeeb..fef0b2d1de68 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -9,7 +9,8 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-cml-match.o soc-acpi-intel-icl-match.o \
 	soc-acpi-intel-tgl-match.o soc-acpi-intel-ehl-match.o \
 	soc-acpi-intel-jsl-match.o soc-acpi-intel-adl-match.o \
-	soc-acpi-intel-hda-match.o
+	soc-acpi-intel-hda-match.o \
+	soc-acpi-intel-sdw-mockup-match.o
 
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 39dad32564e6..94b650767e11 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -9,6 +9,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include "../skylake/skl.h"
+#include "soc-acpi-intel-sdw-mockup-match.h"
 
 static struct skl_machine_pdata cnl_pdata = {
 	.use_tplg_pcm = true,
@@ -60,6 +61,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_sdw_machines[] = {
 		.sof_fw_filename = "sof-cnl.ri",
 		.sof_tplg_filename = "sof-cnl-rt5682-sdw2.tplg"
 	},
+	{
+		.link_mask = GENMASK(3, 0),
+		.links = sdw_mockup_headset_2amps_mic,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-rt711-rt1308-rt715.tplg",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1) | BIT(3),
+		.links = sdw_mockup_headset_1amp_mic,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-rt711-rt1308-mono-rt715.tplg",
+	},
 	{}
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cnl_sdw_machines);
diff --git a/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c b/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c
new file mode 100644
index 000000000000..a3d33997736a
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// soc-acpi-intel-sdw-mockup-match.c - tables and support for SoundWire
+// mockup device ACPI enumeration.
+//
+// Copyright (c) 2021, Intel Corporation.
+//
+
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include "soc-acpi-intel-sdw-mockup-match.h"
+
+static const struct snd_soc_acpi_endpoint sdw_mockup_single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0,
+};
+
+static const struct snd_soc_acpi_endpoint sdw_mockup_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint sdw_mockup_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_adr_device sdw_mockup_headset_0_adr[] = {
+	{
+		.adr = 0x0000000105AA5500ull,
+		.num_endpoints = 1,
+		.endpoints = &sdw_mockup_single_endpoint,
+		.name_prefix = "sdw_mockup_headset0"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device sdw_mockup_headset_1_adr[] = {
+	{
+		.adr = 0x0001000105AA5500ull,
+		.num_endpoints = 1,
+		.endpoints = &sdw_mockup_single_endpoint,
+		.name_prefix = "sdw_mockup_headset1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device sdw_mockup_amp_1_adr[] = {
+	{
+		.adr = 0x000100010555AA00ull,
+		.num_endpoints = 1,
+		.endpoints = &sdw_mockup_single_endpoint,
+		.name_prefix = "sdw_mockup_amp1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device sdw_mockup_amp_2_adr[] = {
+	{
+		.adr = 0x000200010555AA00ull,
+		.num_endpoints = 1,
+		.endpoints = &sdw_mockup_single_endpoint,
+		.name_prefix = "sdw_mockup_amp2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device sdw_mockup_mic_0_adr[] = {
+	{
+		.adr = 0x0000000105555500ull,
+		.num_endpoints = 1,
+		.endpoints = &sdw_mockup_single_endpoint,
+		.name_prefix = "sdw_mockup_mic0"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device sdw_mockup_mic_3_adr[] = {
+	{
+		.adr = 0x0003000105555500ull,
+		.num_endpoints = 1,
+		.endpoints = &sdw_mockup_single_endpoint,
+		.name_prefix = "sdw_mockup_mic3"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device sdw_mockup_amp_1_group1_adr[] = {
+	{
+		.adr = 0x000100010555AA00ull,
+		.num_endpoints = 1,
+		.endpoints = &sdw_mockup_l_endpoint,
+		.name_prefix = "sdw_mockup_amp1_l"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device sdw_mockup_amp_2_group1_adr[] = {
+	{
+		.adr = 0x000200010555AA00ull,
+		.num_endpoints = 1,
+		.endpoints = &sdw_mockup_r_endpoint,
+		.name_prefix = "sdw_mockup_amp2_r"
+	}
+};
+
+const struct snd_soc_acpi_link_adr sdw_mockup_headset_1amp_mic[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(sdw_mockup_headset_0_adr),
+		.adr_d = sdw_mockup_headset_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(sdw_mockup_amp_1_adr),
+		.adr_d = sdw_mockup_amp_1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(sdw_mockup_mic_3_adr),
+		.adr_d = sdw_mockup_mic_3_adr,
+	},
+	{}
+};
+
+const struct snd_soc_acpi_link_adr sdw_mockup_headset_2amps_mic[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(sdw_mockup_headset_0_adr),
+		.adr_d = sdw_mockup_headset_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(sdw_mockup_amp_1_group1_adr),
+		.adr_d = sdw_mockup_amp_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(sdw_mockup_amp_2_group1_adr),
+		.adr_d = sdw_mockup_amp_2_group1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(sdw_mockup_mic_3_adr),
+		.adr_d = sdw_mockup_mic_3_adr,
+	},
+	{}
+};
+
+const struct snd_soc_acpi_link_adr sdw_mockup_mic_headset_1amp[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(sdw_mockup_headset_1_adr),
+		.adr_d = sdw_mockup_headset_1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(sdw_mockup_amp_2_adr),
+		.adr_d = sdw_mockup_amp_2_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(sdw_mockup_mic_0_adr),
+		.adr_d = sdw_mockup_mic_0_adr,
+	},
+	{}
+};
diff --git a/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h b/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h
new file mode 100644
index 000000000000..c99eecd19e03
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * soc-acpi-intel-sdw-mockup-match.h - tables and support for SoundWire
+ * mockup device ACPI enumeration.
+ *
+ * Copyright (c) 2021, Intel Corporation.
+ *
+ */
+
+#ifndef _SND_SOC_ACPI_INTEL_SDW_MOCKUP_MATCH
+#define _SND_SOC_ACPI_INTEL_SDW_MOCKUP_MATCH
+
+extern const struct snd_soc_acpi_link_adr sdw_mockup_headset_1amp_mic[];
+extern const struct snd_soc_acpi_link_adr sdw_mockup_headset_2amps_mic[];
+extern const struct snd_soc_acpi_link_adr sdw_mockup_mic_headset_1amp[];
+
+#endif
-- 
2.17.1

