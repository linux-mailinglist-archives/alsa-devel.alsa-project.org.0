Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A2F8AAAD2
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 10:47:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C69DF6;
	Fri, 19 Apr 2024 10:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C69DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713516466;
	bh=MyupNMaIvtBD2qJkEhmX479Ymxd/FbMHKmafV5JA2lw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JKhgBDDcHfxvDbEpJEf6Ai9P+JBI+E9FyapAkBih5dCnEO3all768kdZj+i3r44Fq
	 HoZeD3IAzIoVK4dSg4xjPSR/MBHaWib9nv8OLLvb5uGOR78AHo6NUTEeLdL2nAVscV
	 5+arHMxSEGTdbXGi+fKfPkH3zbMaf8C/MPDFgt20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06363F805AF; Fri, 19 Apr 2024 10:47:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99E69F80579;
	Fri, 19 Apr 2024 10:47:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E674F80423; Fri, 19 Apr 2024 10:42:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EF45F8025A
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 10:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF45F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fMVd0iDZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713516120; x=1745052120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MyupNMaIvtBD2qJkEhmX479Ymxd/FbMHKmafV5JA2lw=;
  b=fMVd0iDZuWfmLvlF+oHXmCbb57fi5RXSaYpmityI34hZrVAW7GwEAjxl
   VH8SomzKlc6zcWrZAezXpqmMBcC/SyezZyokY5PrC9Fta0syltgAUEaZB
   rHSqhStd2FAa8h4T7L9Zgw+zDhMaH39DrfhfRBxGUR5LysSy3XnReOla9
   fBSrfREwsdD4+VgELRsnMgne3GJY79bY7cxQRWnR735vIW04hW+HacSWR
   XV648ZXPpZzshA0ZoQrFqNzPHJ/V61ohV3eSsQyHayVpvoNny/SjvHDfp
   bLFBe6+EIWUjTnDTQwLbkKkBT5lb1/T/wbmAogW1ajsGTffi4sbkBxlZS
   g==;
X-CSE-ConnectionGUID: JEUAmz2eScKbt6Z2BH14Vw==
X-CSE-MsgGUID: du5MXgyESsudIuzrUgN9Jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9233749"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="9233749"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:41:51 -0700
X-CSE-ConnectionGUID: v+3nAfGER6ui9TbUpD7lPw==
X-CSE-MsgGUID: mkV1IBbpS6mYzLJ7yi39fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000";
   d="scan'208";a="23353180"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2024 01:41:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	rafael@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] ASoC: Intel: avs: Switch to ACPI NHLT
Date: Fri, 19 Apr 2024 10:43:07 +0200
Message-Id: <20240419084307.2718881-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419084307.2718881-1-cezary.rojewski@intel.com>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EUZ3X6LS3H46JM2OVYV3VGMFEUNJXOMV
X-Message-ID-Hash: EUZ3X6LS3H46JM2OVYV3VGMFEUNJXOMV
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUZ3X6LS3H46JM2OVYV3VGMFEUNJXOMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Now that NHLT support in ACPI framework was introduced, migrate avs
driver to new API.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig               |  1 +
 sound/soc/intel/avs/avs.h             |  1 -
 sound/soc/intel/avs/board_selection.c |  7 +++---
 sound/soc/intel/avs/core.c            | 10 ++++-----
 sound/soc/intel/avs/path.c            | 32 +++++++++++++--------------
 5 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 4b9e498e3303..38b61dfd1487 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -214,6 +214,7 @@ config SND_SOC_INTEL_AVS
 	depends on X86 || COMPILE_TEST
 	depends on PCI
 	depends on COMMON_CLK
+	select ACPI_NHLT if ACPI
 	select SND_SOC_ACPI if ACPI
 	select SND_SOC_TOPOLOGY
 	select SND_SOC_HDA
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index f80f79415344..900786eb81e4 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -151,7 +151,6 @@ struct avs_dev {
 	struct completion fw_ready;
 	struct work_struct probe_work;
 
-	struct nhlt_acpi_table *nhlt;
 	struct list_head comp_list;
 	struct mutex comp_list_mutex;
 	struct list_head path_list;
diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 8360ce557401..290ea314ace8 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -10,10 +10,10 @@
 #include <linux/module.h>
 #include <linux/dmi.h>
 #include <linux/pci.h>
+#include <acpi/nhlt.h>
 #include <linux/platform_device.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_register.h>
-#include <sound/intel-nhlt.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-component.h>
 #include "avs.h"
@@ -434,8 +434,7 @@ static int avs_register_dmic_board(struct avs_dev *adev)
 	struct snd_soc_acpi_mach mach = {{0}};
 	int ret;
 
-	if (!adev->nhlt ||
-	    !intel_nhlt_has_endpoint_type(adev->nhlt, NHLT_LINK_DMIC)) {
+	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, -1, -1)) {
 		dev_dbg(adev->dev, "no DMIC endpoints present\n");
 		return 0;
 	}
@@ -523,7 +522,7 @@ static int avs_register_i2s_boards(struct avs_dev *adev)
 	struct snd_soc_acpi_mach *mach;
 	int ret;
 
-	if (!adev->nhlt || !intel_nhlt_has_endpoint_type(adev->nhlt, NHLT_LINK_SSP)) {
+	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_SSP, -1, -1, -1)) {
 		dev_dbg(adev->dev, "no I2S endpoints present\n");
 		return 0;
 	}
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index d7f8940099ce..a61ce42b426c 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -14,15 +14,16 @@
 // foundation of this driver
 //
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <acpi/nhlt.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
 #include <sound/hdaudio.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/intel-dsp-config.h>
-#include <sound/intel-nhlt.h>
 #include "../../codecs/hda.h"
 #include "avs.h"
 #include "cldma.h"
@@ -214,9 +215,7 @@ static void avs_hda_probe_work(struct work_struct *work)
 	if (ret < 0)
 		return;
 
-	adev->nhlt = intel_nhlt_init(adev->dev);
-	if (!adev->nhlt)
-		dev_info(bus->dev, "platform has no NHLT\n");
+	acpi_nhlt_get_gbl_table();
 	avs_debugfs_init(adev);
 
 	avs_register_all_boards(adev);
@@ -549,8 +548,7 @@ static void avs_pci_remove(struct pci_dev *pci)
 	avs_unregister_all_boards(adev);
 
 	avs_debugfs_exit(adev);
-	if (adev->nhlt)
-		intel_nhlt_free(adev->nhlt);
+	acpi_nhlt_put_gbl_table();
 
 	if (avs_platattr_test(adev, CLDMA))
 		hda_cldma_free(&code_loader);
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index e785fc2a7008..531a086642be 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -6,7 +6,8 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
-#include <sound/intel-nhlt.h>
+#include <linux/acpi.h>
+#include <acpi/nhlt.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "avs.h"
@@ -143,10 +144,10 @@ static bool avs_dma_type_is_input(u32 dma_type)
 
 static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 {
-	struct nhlt_acpi_table *nhlt = adev->nhlt;
 	struct avs_tplg_module *t = mod->template;
 	struct avs_copier_cfg *cfg;
-	struct nhlt_specific_cfg *ep_blob;
+	struct acpi_nhlt_format_config *ep_blob;
+	struct acpi_nhlt_endpoint *ep;
 	union avs_connector_node_id node_id = {0};
 	size_t cfg_size, data_size = 0;
 	void *data = NULL;
@@ -174,18 +175,18 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 		else
 			fmt = t->cfg_ext->copier.out_fmt;
 
-		ep_blob = intel_nhlt_get_endpoint_blob(adev->dev,
-			nhlt, t->cfg_ext->copier.vindex.i2s.instance,
-			NHLT_LINK_SSP, fmt->valid_bit_depth, fmt->bit_depth,
-			fmt->num_channels, fmt->sampling_freq, direction,
-			NHLT_DEVICE_I2S);
+		ep = acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_SSP,
+					     ACPI_NHLT_DEVICETYPE_CODEC, direction,
+					     t->cfg_ext->copier.vindex.i2s.instance);
+		ep_blob = acpi_nhlt_endpoint_find_fmtcfg(ep, fmt->num_channels, fmt->sampling_freq,
+							 fmt->valid_bit_depth, fmt->bit_depth);
 		if (!ep_blob) {
 			dev_err(adev->dev, "no I2S ep_blob found\n");
 			return -ENOENT;
 		}
 
-		data = ep_blob->caps;
-		data_size = ep_blob->size;
+		data = ep_blob->config.capabilities;
+		data_size = ep_blob->config.capabilities_size;
 		/* I2S gateway's vindex is statically assigned in topology */
 		node_id.vindex = t->cfg_ext->copier.vindex.val;
 
@@ -199,17 +200,16 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 		else
 			fmt = t->in_fmt;
 
-		ep_blob = intel_nhlt_get_endpoint_blob(adev->dev, nhlt, 0,
-				NHLT_LINK_DMIC, fmt->valid_bit_depth,
-				fmt->bit_depth, fmt->num_channels,
-				fmt->sampling_freq, direction, NHLT_DEVICE_DMIC);
+		ep = acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, direction, 0);
+		ep_blob = acpi_nhlt_endpoint_find_fmtcfg(ep, fmt->num_channels, fmt->sampling_freq,
+							 fmt->valid_bit_depth, fmt->bit_depth);
 		if (!ep_blob) {
 			dev_err(adev->dev, "no DMIC ep_blob found\n");
 			return -ENOENT;
 		}
 
-		data = ep_blob->caps;
-		data_size = ep_blob->size;
+		data = ep_blob->config.capabilities;
+		data_size = ep_blob->config.capabilities_size;
 		/* DMIC gateway's vindex is statically assigned in topology */
 		node_id.vindex = t->cfg_ext->copier.vindex.val;
 
-- 
2.25.1

