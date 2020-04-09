Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D621A3A32
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 21:08:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235C316B1;
	Thu,  9 Apr 2020 21:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235C316B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586459306;
	bh=aiR8kmQZ40dqXApUoCdvm1wAlsMkderNBDvQx7GOuxo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JaMJNNaAXIZ5mDRwz6MMxo1DRmmBqWPkSF5MDAqA/d/TY+1YXd2s9bqg6SnezyJbK
	 /Qwdg6MddW8C1NgMi2AinNNIinh+H685Hb2ZnPqNQPfsRY3Owb0bNvylxj2vmcwCsq
	 3FFKhdtvXGCePrckMx/LhIe0TA0veJayTgAIPTSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B902BF80107;
	Thu,  9 Apr 2020 21:03:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B7C6F80213; Thu,  9 Apr 2020 21:03:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AA28F80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AA28F80107
IronPort-SDR: eiA43xCyLroJ4Qkk4gIYpPPyDSfBdzyaOrBQY3QcW6isFhcqgg6vdGR+2ZR+DdN6koMtCL/Kdl
 wb1jFqjwR7ig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:03:03 -0700
IronPort-SDR: NYYnLB5WkXk6v1wqR318cQ5P1QAYZxOAwjuCuJtFR0hi5xXat2TUpBCIfdLFMICFfuFyGLDYvj
 5IF2BuJbunKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242734635"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:03:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: add autodetection for SoundWire
Date: Thu,  9 Apr 2020 14:02:51 -0500
Message-Id: <20200409190251.16569-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

When an ACPI companion device is present and the SoundWire link mask
information is available, use SoundWire instead of legacy HDA or
Skylake drivers.

The SOF driver is selected when SoundWire or DMIC are detected. There
is no precedence at this level. In the SOF driver proper, SoundWire
will be handled first since it is mutually exclusive with HDaudio.

Known devices with an existing DMI quirk bypass this detection to
avoid any dependency on ACPI/DSDT tables.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 97 ++++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 16 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index be1df80ed013..1c1fdab2a55f 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -1,10 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2019 Jaroslav Kysela <perex@perex.cz>
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_intel.h>
 #include <sound/core.h>
 #include <sound/intel-dsp-config.h>
 #include <sound/intel-nhlt.h>
@@ -14,9 +17,13 @@ static int dsp_driver;
 module_param(dsp_driver, int, 0444);
 MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF)");
 
-#define FLAG_SST		BIT(0)
-#define FLAG_SOF		BIT(1)
-#define FLAG_SOF_ONLY_IF_DMIC	BIT(16)
+#define FLAG_SST			BIT(0)
+#define FLAG_SOF			BIT(1)
+#define FLAG_SOF_ONLY_IF_DMIC		BIT(16)
+#define FLAG_SOF_ONLY_IF_SOUNDWIRE	BIT(17)
+
+#define FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE (FLAG_SOF_ONLY_IF_DMIC | \
+					    FLAG_SOF_ONLY_IF_SOUNDWIRE)
 
 struct config_entry {
 	u32 flags;
@@ -166,7 +173,7 @@ static const struct config_entry config_table[] = {
 		}
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x9dc8,
 	},
 #endif
@@ -187,7 +194,7 @@ static const struct config_entry config_table[] = {
 		}
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0xa348,
 	},
 #endif
@@ -204,18 +211,50 @@ static const struct config_entry config_table[] = {
 					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 				}
 			},
+			{
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "09C6")
+				},
+			},
+			{
+				/* early version of SKU 09C6 */
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0983")
+				},
+			},
 			{}
 		}
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x02c8,
 	},
 #endif
 /* Cometlake-H */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.flags = FLAG_SOF,
+		.device = 0x06c8,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "098F"),
+				},
+			},
+			{
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0990"),
+				},
+			},
+			{}
+		}
+	},
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x06c8,
 	},
 #endif
@@ -236,7 +275,7 @@ static const struct config_entry config_table[] = {
 		}
 	},
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x34c8,
 	},
 #endif
@@ -256,9 +295,8 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
-
 	{
-		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0xa0c8,
 	},
 #endif
@@ -303,6 +341,28 @@ static int snd_intel_dsp_check_dmic(struct pci_dev *pci)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+static int snd_intel_dsp_check_soundwire(struct pci_dev *pci)
+{
+	struct sdw_intel_acpi_info info;
+	acpi_handle handle;
+	int ret;
+
+	handle = ACPI_HANDLE(&pci->dev);
+
+	ret = sdw_intel_acpi_scan(handle, &info);
+	if (ret < 0)
+		return ret;
+
+	return info.link_mask;
+}
+#else
+static int snd_intel_dsp_check_soundwire(struct pci_dev *pci)
+{
+	return 0;
+}
+#endif
+
 int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 {
 	const struct config_entry *cfg;
@@ -336,14 +396,18 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 		return SND_INTEL_DSP_DRIVER_ANY;
 
 	if (cfg->flags & FLAG_SOF) {
-		if (cfg->flags & FLAG_SOF_ONLY_IF_DMIC) {
-			if (snd_intel_dsp_check_dmic(pci)) {
-				dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SOF driver\n");
-				return SND_INTEL_DSP_DRIVER_SOF;
-			}
-		} else {
+		if (cfg->flags & FLAG_SOF_ONLY_IF_SOUNDWIRE &&
+		    snd_intel_dsp_check_soundwire(pci) > 0) {
+			dev_info(&pci->dev, "SoundWire enabled on CannonLake+ platform, using SOF driver\n");
+			return SND_INTEL_DSP_DRIVER_SOF;
+		}
+		if (cfg->flags & FLAG_SOF_ONLY_IF_DMIC &&
+		    snd_intel_dsp_check_dmic(pci)) {
+			dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SOF driver\n");
 			return SND_INTEL_DSP_DRIVER_SOF;
 		}
+		if (!(cfg->flags & FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE))
+			return SND_INTEL_DSP_DRIVER_SOF;
 	}
 
 	if (cfg->flags & FLAG_SST)
@@ -355,3 +419,4 @@ EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel DSP config driver");
+MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
-- 
2.20.1

