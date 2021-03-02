Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60586329570
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 01:34:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 834281688;
	Tue,  2 Mar 2021 01:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 834281688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614645298;
	bh=GGkgk8i8406IIU5f2KmmsGCtsFQ5fH2M4lqAstO0krg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGChfA3N/NhypXbhS6bMH6mMX46hxmn8QQTFB17PBRR16SybFLmSz58zqmcVL+w6B
	 PfA3gno0YdCmmBJh+FmnnW9Yz0j2s6GH1Htrk7vgDV5kohg3KUzb/tJgs+l1RRrxZs
	 lSRnqohMEWNd2TYRbkF26cTYJjh9U0ErMgCSwm0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51CDCF80150;
	Tue,  2 Mar 2021 01:31:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27BBCF80482; Tue,  2 Mar 2021 01:31:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODYSUB_5,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F18CF802E0
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 01:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F18CF802E0
IronPort-SDR: crv0JNjN6tHsNyg/1y9e9vpfPi3DEb1mqDZ038q+JvgmdlolFXAM/BtjzMAq1dy+NGqDavKqev
 434aaeUGG0ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248048798"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248048798"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:48 -0800
IronPort-SDR: FnGPyA0XuhZwZyBIWTEwS3Ty4L5cUlqumPrHGwtQCacOn35KWmhZ/bIoQPn25rurx8kUqQktjO
 dSeT3LqLto1Q==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="444512611"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ALSA: hda: move Intel SoundWire ACPI scan to dedicated
 module
Date: Mon,  1 Mar 2021 18:31:24 -0600
Message-Id: <20210302003125.1178419-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arnd@arndb.de, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard Liao <bard.liao@intel.com>
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

The ACPI scan capabilities is called from the intel-dspconfig as well
as the SOF/HDaudio drivers. This creates dependencies and randconfig issues
when HDaudio and SOF/SoundWire are not all configured as modules.

To simplify Kconfig dependencies between HDAudio, SoundWire, SOF and
intel-dspconfig, move the ACPI scan helpers to a dedicated
module. This follows the same idea as NHLT helpers which are already
handled as a dedicated module.

The only functional change is that the kernel parameter to filter
links is now handled by a different module, but that was only provided
for developers needing work-arounds for early BIOS releases.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 drivers/soundwire/intel.h           |   2 -
 drivers/soundwire/intel_init.c      | 158 -------------------------
 include/linux/soundwire/sdw_intel.h |   2 +
 sound/hda/Kconfig                   |   4 +
 sound/hda/Makefile                  |   3 +
 sound/hda/intel-dsp-config.c        |   2 +-
 sound/hda/intel-sdw-acpi.c          | 174 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/Kconfig         |   1 +
 sound/soc/sof/intel/hda.c           |   1 +
 9 files changed, 186 insertions(+), 161 deletions(-)
 create mode 100644 sound/hda/intel-sdw-acpi.c

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 76820d0b9deb..06bac8ba14e9 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -48,8 +48,6 @@ struct sdw_intel {
 #endif
 };
 
-#define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
-
 int intel_master_startup(struct platform_device *pdev);
 int intel_master_process_wakeen_event(struct platform_device *pdev);
 
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index bc8520eb385e..05b726cdfebc 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -18,42 +18,12 @@
 #include "cadence_master.h"
 #include "intel.h"
 
-#define SDW_LINK_TYPE		4 /* from Intel ACPI documentation */
-#define SDW_MAX_LINKS		4
 #define SDW_SHIM_LCAP		0x0
 #define SDW_SHIM_BASE		0x2C000
 #define SDW_ALH_BASE		0x2C800
 #define SDW_LINK_BASE		0x30000
 #define SDW_LINK_SIZE		0x10000
 
-static int ctrl_link_mask;
-module_param_named(sdw_link_mask, ctrl_link_mask, int, 0444);
-MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
-
-static bool is_link_enabled(struct fwnode_handle *fw_node, int i)
-{
-	struct fwnode_handle *link;
-	char name[32];
-	u32 quirk_mask = 0;
-
-	/* Find master handle */
-	snprintf(name, sizeof(name),
-		 "mipi-sdw-link-%d-subproperties", i);
-
-	link = fwnode_get_named_child_node(fw_node, name);
-	if (!link)
-		return false;
-
-	fwnode_property_read_u32(link,
-				 "intel-quirk-mask",
-				 &quirk_mask);
-
-	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
-		return false;
-
-	return true;
-}
-
 static int sdw_intel_cleanup(struct sdw_intel_ctx *ctx)
 {
 	struct sdw_intel_link_res *link = ctx->links;
@@ -81,74 +51,6 @@ static int sdw_intel_cleanup(struct sdw_intel_ctx *ctx)
 	return 0;
 }
 
-static int
-sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
-{
-	struct acpi_device *adev;
-	int ret, i;
-	u8 count;
-
-	if (acpi_bus_get_device(info->handle, &adev))
-		return -EINVAL;
-
-	/* Found controller, find links supported */
-	count = 0;
-	ret = fwnode_property_read_u8_array(acpi_fwnode_handle(adev),
-					    "mipi-sdw-master-count", &count, 1);
-
-	/*
-	 * In theory we could check the number of links supported in
-	 * hardware, but in that step we cannot assume SoundWire IP is
-	 * powered.
-	 *
-	 * In addition, if the BIOS doesn't even provide this
-	 * 'master-count' property then all the inits based on link
-	 * masks will fail as well.
-	 *
-	 * We will check the hardware capabilities in the startup() step
-	 */
-
-	if (ret) {
-		dev_err(&adev->dev,
-			"Failed to read mipi-sdw-master-count: %d\n", ret);
-		return -EINVAL;
-	}
-
-	/* Check count is within bounds */
-	if (count > SDW_MAX_LINKS) {
-		dev_err(&adev->dev, "Link count %d exceeds max %d\n",
-			count, SDW_MAX_LINKS);
-		return -EINVAL;
-	}
-
-	if (!count) {
-		dev_warn(&adev->dev, "No SoundWire links detected\n");
-		return -EINVAL;
-	}
-	dev_dbg(&adev->dev, "ACPI reports %d SDW Link devices\n", count);
-
-	info->count = count;
-	info->link_mask = 0;
-
-	for (i = 0; i < count; i++) {
-		if (ctrl_link_mask && !(ctrl_link_mask & BIT(i))) {
-			dev_dbg(&adev->dev,
-				"Link %d masked, will not be enabled\n", i);
-			continue;
-		}
-
-		if (!is_link_enabled(acpi_fwnode_handle(adev), i)) {
-			dev_dbg(&adev->dev,
-				"Link %d not selected in firmware\n", i);
-			continue;
-		}
-
-		info->link_mask |= BIT(i);
-	}
-
-	return 0;
-}
-
 #define HDA_DSP_REG_ADSPIC2             (0x10)
 #define HDA_DSP_REG_ADSPIS2             (0x14)
 #define HDA_DSP_REG_ADSPIC2_SNDW        BIT(5)
@@ -357,66 +259,6 @@ sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
 	return 0;
 }
 
-static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
-				     void *cdata, void **return_value)
-{
-	struct sdw_intel_acpi_info *info = cdata;
-	struct acpi_device *adev;
-	acpi_status status;
-	u64 adr;
-
-	status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, &adr);
-	if (ACPI_FAILURE(status))
-		return AE_OK; /* keep going */
-
-	if (acpi_bus_get_device(handle, &adev)) {
-		pr_err("%s: Couldn't find ACPI handle\n", __func__);
-		return AE_NOT_FOUND;
-	}
-
-	info->handle = handle;
-
-	/*
-	 * On some Intel platforms, multiple children of the HDAS
-	 * device can be found, but only one of them is the SoundWire
-	 * controller. The SNDW device is always exposed with
-	 * Name(_ADR, 0x40000000), with bits 31..28 representing the
-	 * SoundWire link so filter accordingly
-	 */
-	if (FIELD_GET(GENMASK(31, 28), adr) != SDW_LINK_TYPE)
-		return AE_OK; /* keep going */
-
-	/* device found, stop namespace walk */
-	return AE_CTRL_TERMINATE;
-}
-
-/**
- * sdw_intel_acpi_scan() - SoundWire Intel init routine
- * @parent_handle: ACPI parent handle
- * @info: description of what firmware/DSDT tables expose
- *
- * This scans the namespace and queries firmware to figure out which
- * links to enable. A follow-up use of sdw_intel_probe() and
- * sdw_intel_startup() is required for creation of devices and bus
- * startup
- */
-int sdw_intel_acpi_scan(acpi_handle *parent_handle,
-			struct sdw_intel_acpi_info *info)
-{
-	acpi_status status;
-
-	info->handle = NULL;
-	status = acpi_walk_namespace(ACPI_TYPE_DEVICE,
-				     parent_handle, 1,
-				     sdw_intel_acpi_cb,
-				     NULL, info, NULL);
-	if (ACPI_FAILURE(status) || info->handle == NULL)
-		return -ENODEV;
-
-	return sdw_intel_scan_controller(info);
-}
-EXPORT_SYMBOL_NS(sdw_intel_acpi_scan, SOUNDWIRE_INTEL_INIT);
-
 /**
  * sdw_intel_probe() - SoundWire Intel probe routine
  * @res: resource data
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 120ffddc03d2..3a5446ac014a 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -187,4 +187,6 @@ void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable);
 
 irqreturn_t sdw_intel_thread(int irq, void *dev_id);
 
+#define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
+
 #endif
diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index 9ed5cfa3c18c..57595f1552c9 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -44,9 +44,13 @@ config SND_INTEL_NHLT
 config SND_INTEL_DSP_CONFIG
 	tristate
 	select SND_INTEL_NHLT if ACPI
+	select SND_INTEL_SOUNDWIRE_ACPI if ACPI
 	# this config should be selected only for Intel DSP platforms.
 	# A fallback is provided so that the code compiles in all cases.
 
+config SND_INTEL_SOUNDWIRE_ACPI
+	tristate
+
 config SND_INTEL_BYT_PREFER_SOF
 	bool "Prefer SOF driver over SST on BY/CHT platforms"
 	depends on SND_SST_ATOM_HIFI2_PLATFORM_ACPI && SND_SOC_SOF_BAYTRAIL
diff --git a/sound/hda/Makefile b/sound/hda/Makefile
index 601e617918b8..78f487a635f8 100644
--- a/sound/hda/Makefile
+++ b/sound/hda/Makefile
@@ -17,3 +17,6 @@ obj-$(CONFIG_SND_HDA_EXT_CORE) += ext/
 snd-intel-dspcfg-objs := intel-dsp-config.o
 snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o
 obj-$(CONFIG_SND_INTEL_DSP_CONFIG) += snd-intel-dspcfg.o
+
+snd-intel-sdw-acpi-objs := intel-sdw-acpi.o
+obj-$(CONFIG_SND_INTEL_SOUNDWIRE_ACPI) += snd-intel-sdw-acpi.o
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index d1eb9d34993a..ab5ff7867eb9 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -557,4 +557,4 @@ EXPORT_SYMBOL_GPL(snd_intel_acpi_dsp_driver_probe);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel DSP config driver");
-MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
+MODULE_IMPORT_NS(SND_INTEL_SOUNDWIRE_ACPI);
diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
new file mode 100644
index 000000000000..6359936a1503
--- /dev/null
+++ b/sound/hda/intel-sdw-acpi.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2015-2021 Intel Corporation.
+
+/*
+ * SDW Intel ACPI scan helpers
+ */
+
+#include <linux/acpi.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/soundwire/sdw_intel.h>
+#include <linux/string.h>
+
+#define SDW_LINK_TYPE		4 /* from Intel ACPI documentation */
+#define SDW_MAX_LINKS		4
+
+static int ctrl_link_mask;
+module_param_named(sdw_link_mask, ctrl_link_mask, int, 0444);
+MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
+
+static bool is_link_enabled(struct fwnode_handle *fw_node, int i)
+{
+	struct fwnode_handle *link;
+	char name[32];
+	u32 quirk_mask = 0;
+
+	/* Find master handle */
+	snprintf(name, sizeof(name),
+		 "mipi-sdw-link-%d-subproperties", i);
+
+	link = fwnode_get_named_child_node(fw_node, name);
+	if (!link)
+		return false;
+
+	fwnode_property_read_u32(link,
+				 "intel-quirk-mask",
+				 &quirk_mask);
+
+	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
+		return false;
+
+	return true;
+}
+
+static int
+sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
+{
+	struct acpi_device *adev;
+	int ret, i;
+	u8 count;
+
+	if (acpi_bus_get_device(info->handle, &adev))
+		return -EINVAL;
+
+	/* Found controller, find links supported */
+	count = 0;
+	ret = fwnode_property_read_u8_array(acpi_fwnode_handle(adev),
+					    "mipi-sdw-master-count", &count, 1);
+
+	/*
+	 * In theory we could check the number of links supported in
+	 * hardware, but in that step we cannot assume SoundWire IP is
+	 * powered.
+	 *
+	 * In addition, if the BIOS doesn't even provide this
+	 * 'master-count' property then all the inits based on link
+	 * masks will fail as well.
+	 *
+	 * We will check the hardware capabilities in the startup() step
+	 */
+
+	if (ret) {
+		dev_err(&adev->dev,
+			"Failed to read mipi-sdw-master-count: %d\n", ret);
+		return -EINVAL;
+	}
+
+	/* Check count is within bounds */
+	if (count > SDW_MAX_LINKS) {
+		dev_err(&adev->dev, "Link count %d exceeds max %d\n",
+			count, SDW_MAX_LINKS);
+		return -EINVAL;
+	}
+
+	if (!count) {
+		dev_warn(&adev->dev, "No SoundWire links detected\n");
+		return -EINVAL;
+	}
+	dev_dbg(&adev->dev, "ACPI reports %d SDW Link devices\n", count);
+
+	info->count = count;
+	info->link_mask = 0;
+
+	for (i = 0; i < count; i++) {
+		if (ctrl_link_mask && !(ctrl_link_mask & BIT(i))) {
+			dev_dbg(&adev->dev,
+				"Link %d masked, will not be enabled\n", i);
+			continue;
+		}
+
+		if (!is_link_enabled(acpi_fwnode_handle(adev), i)) {
+			dev_dbg(&adev->dev,
+				"Link %d not selected in firmware\n", i);
+			continue;
+		}
+
+		info->link_mask |= BIT(i);
+	}
+
+	return 0;
+}
+
+static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
+				     void *cdata, void **return_value)
+{
+	struct sdw_intel_acpi_info *info = cdata;
+	struct acpi_device *adev;
+	acpi_status status;
+	u64 adr;
+
+	status = acpi_evaluate_integer(handle, METHOD_NAME__ADR, NULL, &adr);
+	if (ACPI_FAILURE(status))
+		return AE_OK; /* keep going */
+
+	if (acpi_bus_get_device(handle, &adev)) {
+		pr_err("%s: Couldn't find ACPI handle\n", __func__);
+		return AE_NOT_FOUND;
+	}
+
+	info->handle = handle;
+
+	/*
+	 * On some Intel platforms, multiple children of the HDAS
+	 * device can be found, but only one of them is the SoundWire
+	 * controller. The SNDW device is always exposed with
+	 * Name(_ADR, 0x40000000), with bits 31..28 representing the
+	 * SoundWire link so filter accordingly
+	 */
+	if (FIELD_GET(GENMASK(31, 28), adr) != SDW_LINK_TYPE)
+		return AE_OK; /* keep going */
+
+	/* device found, stop namespace walk */
+	return AE_CTRL_TERMINATE;
+}
+
+/**
+ * sdw_intel_acpi_scan() - SoundWire Intel init routine
+ * @parent_handle: ACPI parent handle
+ * @info: description of what firmware/DSDT tables expose
+ *
+ * This scans the namespace and queries firmware to figure out which
+ * links to enable. A follow-up use of sdw_intel_probe() and
+ * sdw_intel_startup() is required for creation of devices and bus
+ * startup
+ */
+int sdw_intel_acpi_scan(acpi_handle *parent_handle,
+			struct sdw_intel_acpi_info *info)
+{
+	acpi_status status;
+
+	info->handle = NULL;
+	status = acpi_walk_namespace(ACPI_TYPE_DEVICE,
+				     parent_handle, 1,
+				     sdw_intel_acpi_cb,
+				     NULL, info, NULL);
+	if (ACPI_FAILURE(status) || info->handle == NULL)
+		return -ENODEV;
+
+	return sdw_intel_scan_controller(info);
+}
+EXPORT_SYMBOL_NS(sdw_intel_acpi_scan, SND_INTEL_SOUNDWIRE_ACPI);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("Intel Soundwire ACPI helpers");
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 21e24a3c64fb..da1c396f529d 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -286,6 +286,7 @@ config SND_SOC_SOF_INTEL_SOUNDWIRE
 	depends on ACPI && SOUNDWIRE
 	depends on !(SOUNDWIRE=m && SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=y)
 	select SOUNDWIRE_INTEL
+	select SND_INTEL_SOUNDWIRE_ACPI
 	help
 	  This adds support for SoundWire with Sound Open Firmware
 	  for Intel(R) platforms.
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2b2829655bfb..0e092877f550 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1277,4 +1277,5 @@ MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS(SND_INTEL_SOUNDWIRE_ACPI);
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
-- 
2.25.1

