Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B927FD72C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:53:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C156CBC0;
	Wed, 29 Nov 2023 13:53:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C156CBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262435;
	bh=cXLGZEakbaAkxmkvwPl6WOp7DGM87+pLBb4YKcO2cGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M0ezGrREI27aobtCFGbVZSg9lzEqt2Wk9aimFYhvdhvnANUk6B1Fqi28x+0oOjvt5
	 gZe9h+kOLvlA+YKdJDS856xqaftVRKWtQjEz5rNO5uftM7pnThe/8bO22Fp9Uhwsz3
	 SQRax8vuBU2qalchniw4fJ8fJazNcyV2CI3PqkEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2BCBF805BF; Wed, 29 Nov 2023 13:53:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 759AFF805C0;
	Wed, 29 Nov 2023 13:53:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0540F8025A; Wed, 29 Nov 2023 13:53:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6443BF80166
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:52:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6443BF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CM/O9eeT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262379; x=1732798379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cXLGZEakbaAkxmkvwPl6WOp7DGM87+pLBb4YKcO2cGM=;
  b=CM/O9eeTkGU+qGXZivikmFgCovDJDdDAbw0H7gvFWcfkez2N3/BMN+gf
   lGalGGUKdFpmvzCYeutaFEfr7J6UnWXJ0D4TeIyn4h6CcmlKVFxH56pr5
   81hGoh6gm1q3+HNZCUbrox2da8a6OwR40a+dM1Xp3uxWgb9nEbtwEtsO0
   +E4APJx0VkJG7YQ/MmXK3pA8Iie07HGyfUB56wD/WZf1nHmj2dt1zdpcm
   uCuAPF0ss32SfFqPjrwo5YEN9DE861KfoO5dSKitalmX+XLJ2qEG0Vvld
   nAmDr+87y0AbdOCq74E9AVHEVxRGYRDv/aMR23cNg/lsf6ivi/fIPuJtu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022885"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174601"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:52:56 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 02/13] ASoC: SOF: Move sof_machine_* functions from
 sof-audio.c to core.c
Date: Wed, 29 Nov 2023 14:53:16 +0200
Message-ID: <20231129125327.23708-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MJWK3ZMOSDJ24HB7WFF7BOEDUUHRL6IF
X-Message-ID-Hash: MJWK3ZMOSDJ24HB7WFF7BOEDUUHRL6IF
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJWK3ZMOSDJ24HB7WFF7BOEDUUHRL6IF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Relocate the machine handling functions from sof-audio.c to core.c to
maintain code separation.

While doing the move, drop the redundant
IS_ERR_OR_NULL(plat_data->pdev_mach) check from
sof_machine_unregister()

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c      | 95 +++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.c | 98 ---------------------------------------
 sound/soc/sof/sof-priv.h  |  2 -
 3 files changed, 95 insertions(+), 100 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index d7b090224f1b..a87522ea4301 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -13,6 +13,7 @@
 #include <sound/soc.h>
 #include <sound/sof.h>
 #include "sof-priv.h"
+#include "sof-of-dev.h"
 #include "ops.h"
 
 #define CREATE_TRACE_POINTS
@@ -143,6 +144,66 @@ void sof_set_fw_state(struct snd_sof_dev *sdev, enum sof_fw_state new_state)
 }
 EXPORT_SYMBOL(sof_set_fw_state);
 
+/* SOF Driver enumeration */
+static int sof_machine_check(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_soc_acpi_mach *mach;
+
+	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)) {
+		const struct snd_sof_of_mach *of_mach;
+
+		if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+		    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+			goto nocodec;
+
+		/* find machine */
+		mach = snd_sof_machine_select(sdev);
+		if (mach) {
+			sof_pdata->machine = mach;
+
+			if (sof_pdata->subsystem_id_set) {
+				mach->mach_params.subsystem_vendor = sof_pdata->subsystem_vendor;
+				mach->mach_params.subsystem_device = sof_pdata->subsystem_device;
+				mach->mach_params.subsystem_id_set = true;
+			}
+
+			snd_sof_set_mach_params(mach, sdev);
+			return 0;
+		}
+
+		of_mach = sof_of_machine_select(sdev);
+		if (of_mach) {
+			sof_pdata->of_machine = of_mach;
+			return 0;
+		}
+
+		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)) {
+			dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
+			return -ENODEV;
+		}
+	} else {
+		dev_warn(sdev->dev, "Force to use nocodec mode\n");
+	}
+
+nocodec:
+	/* select nocodec mode */
+	dev_warn(sdev->dev, "Using nocodec machine driver\n");
+	mach = devm_kzalloc(sdev->dev, sizeof(*mach), GFP_KERNEL);
+	if (!mach)
+		return -ENOMEM;
+
+	mach->drv_name = "sof-nocodec";
+	if (!sof_pdata->tplg_filename)
+		sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
+
+	sof_pdata->machine = mach;
+	snd_sof_set_mach_params(mach, sdev);
+
+	return 0;
+}
+
 /*
  *			FW Boot State Transition Diagram
  *
@@ -527,6 +588,40 @@ int snd_sof_device_shutdown(struct device *dev)
 }
 EXPORT_SYMBOL(snd_sof_device_shutdown);
 
+/* Machine driver registering and unregistering */
+int sof_machine_register(struct snd_sof_dev *sdev, void *pdata)
+{
+	struct snd_sof_pdata *plat_data = pdata;
+	const char *drv_name;
+	const void *mach;
+	int size;
+
+	drv_name = plat_data->machine->drv_name;
+	mach = plat_data->machine;
+	size = sizeof(*plat_data->machine);
+
+	/* register machine driver, pass machine info as pdata */
+	plat_data->pdev_mach =
+		platform_device_register_data(sdev->dev, drv_name,
+					      PLATFORM_DEVID_NONE, mach, size);
+	if (IS_ERR(plat_data->pdev_mach))
+		return PTR_ERR(plat_data->pdev_mach);
+
+	dev_dbg(sdev->dev, "created machine %s\n",
+		dev_name(&plat_data->pdev_mach->dev));
+
+	return 0;
+}
+EXPORT_SYMBOL(sof_machine_register);
+
+void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata)
+{
+	struct snd_sof_pdata *plat_data = pdata;
+
+	platform_device_unregister(plat_data->pdev_mach);
+}
+EXPORT_SYMBOL(sof_machine_unregister);
+
 MODULE_AUTHOR("Liam Girdwood");
 MODULE_DESCRIPTION("Sound Open Firmware (SOF) Core");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 4972a66c6007..9163975c9c3f 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -11,7 +11,6 @@
 #include <linux/bitfield.h>
 #include <trace/events/sof.h>
 #include "sof-audio.h"
-#include "sof-of-dev.h"
 #include "ops.h"
 
 static bool is_virtual_widget(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
@@ -1006,100 +1005,3 @@ int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd)
 	return sof_dai_get_clk(rtd, SOF_DAI_CLK_INTEL_SSP_BCLK);
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
-
-/*
- * SOF Driver enumeration.
- */
-int sof_machine_check(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_pdata *sof_pdata = sdev->pdata;
-	const struct sof_dev_desc *desc = sof_pdata->desc;
-	struct snd_soc_acpi_mach *mach;
-
-	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)) {
-		const struct snd_sof_of_mach *of_mach;
-
-		if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
-		    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
-			goto nocodec;
-
-		/* find machine */
-		mach = snd_sof_machine_select(sdev);
-		if (mach) {
-			sof_pdata->machine = mach;
-
-			if (sof_pdata->subsystem_id_set) {
-				mach->mach_params.subsystem_vendor = sof_pdata->subsystem_vendor;
-				mach->mach_params.subsystem_device = sof_pdata->subsystem_device;
-				mach->mach_params.subsystem_id_set = true;
-			}
-
-			snd_sof_set_mach_params(mach, sdev);
-			return 0;
-		}
-
-		of_mach = sof_of_machine_select(sdev);
-		if (of_mach) {
-			sof_pdata->of_machine = of_mach;
-			return 0;
-		}
-
-		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)) {
-			dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
-			return -ENODEV;
-		}
-	} else {
-		dev_warn(sdev->dev, "Force to use nocodec mode\n");
-	}
-
-nocodec:
-	/* select nocodec mode */
-	dev_warn(sdev->dev, "Using nocodec machine driver\n");
-	mach = devm_kzalloc(sdev->dev, sizeof(*mach), GFP_KERNEL);
-	if (!mach)
-		return -ENOMEM;
-
-	mach->drv_name = "sof-nocodec";
-	if (!sof_pdata->tplg_filename)
-		sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
-
-	sof_pdata->machine = mach;
-	snd_sof_set_mach_params(mach, sdev);
-
-	return 0;
-}
-EXPORT_SYMBOL(sof_machine_check);
-
-int sof_machine_register(struct snd_sof_dev *sdev, void *pdata)
-{
-	struct snd_sof_pdata *plat_data = pdata;
-	const char *drv_name;
-	const void *mach;
-	int size;
-
-	drv_name = plat_data->machine->drv_name;
-	mach = plat_data->machine;
-	size = sizeof(*plat_data->machine);
-
-	/* register machine driver, pass machine info as pdata */
-	plat_data->pdev_mach =
-		platform_device_register_data(sdev->dev, drv_name,
-					      PLATFORM_DEVID_NONE, mach, size);
-	if (IS_ERR(plat_data->pdev_mach))
-		return PTR_ERR(plat_data->pdev_mach);
-
-	dev_dbg(sdev->dev, "created machine %s\n",
-		dev_name(&plat_data->pdev_mach->dev));
-
-	return 0;
-}
-EXPORT_SYMBOL(sof_machine_register);
-
-void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata)
-{
-	struct snd_sof_pdata *plat_data = pdata;
-
-	if (!IS_ERR_OR_NULL(plat_data->pdev_mach))
-		platform_device_unregister(plat_data->pdev_mach);
-}
-EXPORT_SYMBOL(sof_machine_unregister);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index f4185012eb69..faa8a19ed737 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -814,8 +814,6 @@ int sof_stream_pcm_open(struct snd_sof_dev *sdev,
 int sof_stream_pcm_close(struct snd_sof_dev *sdev,
 			 struct snd_pcm_substream *substream);
 
-int sof_machine_check(struct snd_sof_dev *sdev);
-
 /* SOF client support */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_CLIENT)
 int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name, u32 id,
-- 
2.43.0

