Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D707FD741
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:56:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FEC0846;
	Wed, 29 Nov 2023 13:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FEC0846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262591;
	bh=ysltkv8OSTNC/+P5RvArVkOpO874veRrhwy8C1sagck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YDvj9wz14zXwNfmbosY7WZb9eKEwZoAYOZDiuehBgFbwkK3BnS21VFaR9aY1MtYgd
	 OaUKFO0Euj/PttfbQNefVVAAev37eTtKqq9W4E1tjDzcO9ea/UJyg17fm9OxXaeI80
	 P9BtCKbvhNApeuVSIqlEZ2EtsC+w8ROohsHv7B7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39A50F805AE; Wed, 29 Nov 2023 13:53:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C0C6F8072D;
	Wed, 29 Nov 2023 13:53:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F1CF8070B; Wed, 29 Nov 2023 13:53:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DBC6F80615
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:53:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DBC6F80615
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zu/yRCXK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262403; x=1732798403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ysltkv8OSTNC/+P5RvArVkOpO874veRrhwy8C1sagck=;
  b=Zu/yRCXKizFlf4tme2bzHaC0NcTdyc3t1+spJy89EEZZtOoh1ai/ANfB
   zNujWHuhU5lVxB1PgtDy+ix9qvGAwn48fbKcEPBlIfU0YN8VdDrJR9XuC
   sd4Cf2wkxG6fsKyQI/Ic4taRyrT/B7tS0tP7CvDw5sjCKdzTRlVnUNSF/
   C1ROEG9c85rBt/e3M6tXJ/utAd3WN3GczGK+e8LBNtzO9jUGzc8mTvyC1
   PIubjJEuLBMxUM6XQMB3UD5spAYRG60fpbJKuzggiJKJC+KGvpczy9pr3
   QQfrq/UylSeCCfj5e6Yz0ZCXYNzxT7hKu9EOL6O3ZoKe9N63ZDkRknuyt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022981"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174649"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:19 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 13/13] ASoC: SOF: core: Implement IPC version fallback if
 firmware files are missing
Date: Wed, 29 Nov 2023 14:53:27 +0200
Message-ID: <20231129125327.23708-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DOR5WIQ4VKLXNTXRZQBX4ZKC2CXONFLK
X-Message-ID-Hash: DOR5WIQ4VKLXNTXRZQBX4ZKC2CXONFLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOR5WIQ4VKLXNTXRZQBX4ZKC2CXONFLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If a firmware file is missing for the selected IPC type then try to switch
to other supported IPC type and check if that one can be used instead.

If for example a platform is changed to IPC4 as default version but the
given machine does not yet have the needed topology file created then we
will fall back to IPC3 which should have all the needed files.

Relocate the sof_init_environment() to be done at a later phase, in
sof_probe_continue().

This will only have changes in behavior if
CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE is enabled (Intel HDA platforms) by
not failing the module probe, but it is not going to be different case
compared to for example failed firmware booting or topology loading error.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/Kconfig           |  11 ++
 sound/soc/sof/core.c            | 104 ++++++++++-----
 sound/soc/sof/fw-file-profile.c | 226 +++++++++++++++++++++++++++++---
 3 files changed, 292 insertions(+), 49 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index a741ed96e789..32ffd345e07f 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -126,6 +126,17 @@ config SND_SOC_SOF_STRICT_ABI_CHECKS
 	  If you are not involved in SOF releases and CI development,
 	  select "N".
 
+config SND_SOC_SOF_ALLOW_FALLBACK_TO_NEWER_IPC_VERSION
+	bool "SOF allow fallback to newer IPC version"
+	help
+	  This option will allow the kernel to try to 'fallback' to a newer IPC
+	  version if there are missing firmware files to satisfy the default IPC
+	  version.
+	  IPC version fallback to older versions is not affected by this option,
+	  it is always available.
+	  Say Y if you are involved in SOF development and need this option.
+	  If not, select N.
+
 config SND_SOC_SOF_DEBUG
 	bool "SOF debugging features"
 	help
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index a2e9506e0f85..a2afec8f5879 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -212,14 +212,6 @@ static int sof_select_ipc_and_paths(struct snd_sof_dev *sdev)
 	struct device *dev = sdev->dev;
 	int ret;
 
-	/* check IPC support */
-	if (!(BIT(base_profile->ipc_type) & plat_data->desc->ipc_supported_mask)) {
-		dev_err(dev,
-			"ipc_type %d is not supported on this platform, mask is %#x\n",
-			base_profile->ipc_type, plat_data->desc->ipc_supported_mask);
-		return -EINVAL;
-	}
-
 	if (base_profile->ipc_type != plat_data->desc->ipc_default)
 		dev_info(dev,
 			 "Module parameter used, overriding default IPC %d to %d\n",
@@ -260,19 +252,14 @@ static int sof_select_ipc_and_paths(struct snd_sof_dev *sdev)
 	plat_data->fw_filename_prefix = out_profile.fw_path;
 	plat_data->fw_lib_prefix = out_profile.fw_lib_path;
 	plat_data->tplg_filename_prefix = out_profile.tplg_path;
-	plat_data->tplg_filename = out_profile.tplg_name;
 
 	return 0;
 }
 
-static int sof_init_environment(struct snd_sof_dev *sdev)
+static int validate_sof_ops(struct snd_sof_dev *sdev)
 {
 	int ret;
 
-	ret = sof_select_ipc_and_paths(sdev);
-	if (ret)
-		return ret;
-
 	/* init ops, if necessary */
 	ret = sof_ops_init(sdev);
 	if (ret < 0)
@@ -297,6 +284,71 @@ static int sof_init_environment(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int sof_init_sof_ops(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	struct sof_loadable_file_profile *base_profile = &plat_data->ipc_file_profile_base;
+
+	/* check IPC support */
+	if (!(BIT(base_profile->ipc_type) & plat_data->desc->ipc_supported_mask)) {
+		dev_err(sdev->dev,
+			"ipc_type %d is not supported on this platform, mask is %#x\n",
+			base_profile->ipc_type, plat_data->desc->ipc_supported_mask);
+		return -EINVAL;
+	}
+
+	/*
+	 * Save the selected IPC type and a topology name override before
+	 * selecting ops since platform code might need this information
+	 */
+	plat_data->ipc_type = base_profile->ipc_type;
+	plat_data->tplg_filename = base_profile->tplg_name;
+
+	return validate_sof_ops(sdev);
+}
+
+static int sof_init_environment(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	struct sof_loadable_file_profile *base_profile = &plat_data->ipc_file_profile_base;
+	int ret;
+
+	/* probe the DSP hardware */
+	ret = snd_sof_probe(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to probe DSP %d\n", ret);
+		sof_ops_free(sdev);
+		return ret;
+	}
+
+	/* check machine info */
+	ret = sof_machine_check(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to get machine info %d\n", ret);
+		goto err_machine_check;
+	}
+
+	ret = sof_select_ipc_and_paths(sdev);
+	if (!ret && plat_data->ipc_type != base_profile->ipc_type) {
+		/* IPC type changed, re-initialize the ops */
+		sof_ops_free(sdev);
+
+		ret = validate_sof_ops(sdev);
+		if (ret < 0) {
+			snd_sof_remove(sdev);
+			return ret;
+		}
+	}
+
+err_machine_check:
+	if (ret) {
+		snd_sof_remove(sdev);
+		sof_ops_free(sdev);
+	}
+
+	return ret;
+}
+
 /*
  *			FW Boot State Transition Diagram
  *
@@ -342,23 +394,13 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *plat_data = sdev->pdata;
 	int ret;
 
-	/* probe the DSP hardware */
-	ret = snd_sof_probe(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
-		goto probe_err;
-	}
+	/* Initialize loadable file paths and check the environment validity */
+	ret = sof_init_environment(sdev);
+	if (ret)
+		return ret;
 
 	sof_set_fw_state(sdev, SOF_FW_BOOT_PREPARE);
 
-	/* check machine info */
-	ret = sof_machine_check(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to get machine info %d\n",
-			ret);
-		goto dsp_err;
-	}
-
 	/* set up platform component driver */
 	snd_sof_new_platform_drv(sdev);
 
@@ -478,9 +520,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 ipc_err:
 dbg_err:
 	snd_sof_free_debug(sdev);
-dsp_err:
 	snd_sof_remove(sdev);
-probe_err:
 	snd_sof_remove_late(sdev);
 	sof_ops_free(sdev);
 
@@ -535,8 +575,8 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 		}
 	}
 
-	/* Initialize loadable file paths and check the environment validity */
-	ret = sof_init_environment(sdev);
+	/* Initialize sof_ops based on the initial selected IPC version */
+	ret = sof_init_sof_ops(sdev);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
index 58b55516049e..138a1ca2c4a8 100644
--- a/sound/soc/sof/fw-file-profile.c
+++ b/sound/soc/sof/fw-file-profile.c
@@ -6,17 +6,99 @@
 // Copyright(c) 2023 Intel Corporation. All rights reserved.
 //
 
+#include <linux/firmware.h>
 #include <sound/sof.h>
+#include <sound/sof/ext_manifest4.h>
 #include "sof-priv.h"
 
+static int sof_test_firmware_file(struct device *dev,
+				  struct sof_loadable_file_profile *profile,
+				  enum sof_ipc_type *ipc_type_to_adjust)
+{
+	enum sof_ipc_type fw_ipc_type;
+	const struct firmware *fw;
+	const char *fw_filename;
+	const u32 *magic;
+	int ret;
+
+	fw_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
+				profile->fw_name);
+	if (!fw_filename)
+		return -ENOMEM;
+
+	ret = firmware_request_nowarn(&fw, fw_filename, dev);
+	if (ret < 0) {
+		dev_dbg(dev, "Failed to open firmware file: %s\n", fw_filename);
+		kfree(fw_filename);
+		return ret;
+	}
+
+	/* firmware file exists, check the magic number */
+	magic = (const u32 *)fw->data;
+	switch (*magic) {
+	case SOF_EXT_MAN_MAGIC_NUMBER:
+		fw_ipc_type = SOF_IPC_TYPE_3;
+		break;
+	case SOF_EXT_MAN4_MAGIC_NUMBER:
+		fw_ipc_type = SOF_IPC_TYPE_4;
+		break;
+	default:
+		dev_err(dev, "Invalid firmware magic: %#x\n", *magic);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (ipc_type_to_adjust) {
+		*ipc_type_to_adjust = fw_ipc_type;
+	} else if (fw_ipc_type != profile->ipc_type) {
+		dev_err(dev,
+			"ipc type mismatch between %s and expected: %d vs %d\n",
+			fw_filename, fw_ipc_type, profile->ipc_type);
+		ret = -EINVAL;
+	}
+out:
+	release_firmware(fw);
+	kfree(fw_filename);
+
+	return ret;
+}
+
+static int sof_test_topology_file(struct device *dev,
+				  struct sof_loadable_file_profile *profile)
+{
+	const struct firmware *fw;
+	const char *tplg_filename;
+	int ret;
+
+	if (!profile->tplg_path || !profile->tplg_name)
+		return 0;
+
+	tplg_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->tplg_path,
+				  profile->tplg_name);
+	if (!tplg_filename)
+		return -ENOMEM;
+
+	ret = firmware_request_nowarn(&fw, tplg_filename, dev);
+	if (!ret)
+		release_firmware(fw);
+	else
+		dev_dbg(dev, "Failed to open topology file: %s\n", tplg_filename);
+
+	kfree(tplg_filename);
+
+	return ret;
+}
+
 static int
-sof_file_profile_for_ipc_type(struct device *dev,
+sof_file_profile_for_ipc_type(struct snd_sof_dev *sdev,
+			      enum sof_ipc_type ipc_type,
 			      const struct sof_dev_desc *desc,
 			      struct sof_loadable_file_profile *base_profile,
 			      struct sof_loadable_file_profile *out_profile)
 {
-	enum sof_ipc_type ipc_type = base_profile->ipc_type;
+	struct snd_sof_pdata *plat_data = sdev->pdata;
 	bool fw_lib_path_allocated = false;
+	struct device *dev = sdev->dev;
 	bool fw_path_allocated = false;
 	int ret = 0;
 
@@ -41,6 +123,25 @@ sof_file_profile_for_ipc_type(struct device *dev,
 	else
 		out_profile->fw_name = desc->default_fw_filename[ipc_type];
 
+	/*
+	 * Check the custom firmware path/filename and adjust the ipc_type to
+	 * match with the existing file for the remaining path configuration.
+	 *
+	 * For default path and firmware name do a verification before
+	 * continuing further.
+	 */
+	if (base_profile->fw_path || base_profile->fw_name) {
+		ret = sof_test_firmware_file(dev, out_profile, &ipc_type);
+		if (ret)
+			return ret;
+
+		if (!(desc->ipc_supported_mask & BIT(ipc_type))) {
+			dev_err(dev, "Unsupported IPC type %d needed by %s/%s\n",
+				ipc_type, out_profile->fw_path,
+				out_profile->fw_name);
+			return -EINVAL;
+		}
+	}
 
 	/* firmware library path */
 	if (base_profile->fw_lib_path) {
@@ -75,11 +176,17 @@ sof_file_profile_for_ipc_type(struct device *dev,
 		out_profile->tplg_path = desc->default_tplg_path[ipc_type];
 
 	/* topology name */
-	if (base_profile->tplg_name)
-		out_profile->tplg_name = base_profile->tplg_name;
+	out_profile->tplg_name = plat_data->tplg_filename;
 
 	out_profile->ipc_type = ipc_type;
 
+	/* Test only default firmware file */
+	if (!base_profile->fw_path && !base_profile->fw_name)
+		ret = sof_test_firmware_file(dev, out_profile, NULL);
+
+	if (!ret)
+		ret = sof_test_topology_file(dev, out_profile);
+
 out:
 	if (ret) {
 		/* Free up path strings created with devm_kasprintf */
@@ -94,19 +201,76 @@ sof_file_profile_for_ipc_type(struct device *dev,
 	return ret;
 }
 
-static void sof_print_profile_info(struct device *dev,
+static void
+sof_print_missing_firmware_info(struct snd_sof_dev *sdev,
+				enum sof_ipc_type ipc_type,
+				struct sof_loadable_file_profile *base_profile)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	const struct sof_dev_desc *desc = plat_data->desc;
+	struct device *dev = sdev->dev;
+	int ipc_type_count, i;
+	char *marker;
+
+	dev_err(dev, "SOF firmware and/or topology file not found.\n");
+	dev_info(dev, "Supported default profiles\n");
+
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_ALLOW_FALLBACK_TO_NEWER_IPC_VERSION))
+		ipc_type_count = SOF_IPC_TYPE_COUNT - 1;
+	else
+		ipc_type_count = base_profile->ipc_type;
+
+	for (i = 0; i <= ipc_type_count; i++) {
+		if (!(desc->ipc_supported_mask & BIT(i)))
+			continue;
+
+		if (i == ipc_type)
+			marker = "Requested";
+		else
+			marker = "Fallback";
+
+		dev_info(dev, "- ipc type %d (%s):\n", i, marker);
+		if (base_profile->fw_path_postfix)
+			dev_info(dev, " Firmware file: %s/%s/%s\n",
+				 desc->default_fw_path[i],
+				 base_profile->fw_path_postfix,
+				 desc->default_fw_filename[i]);
+		else
+			dev_info(dev, " Firmware file: %s/%s\n",
+				 desc->default_fw_path[i],
+				 desc->default_fw_filename[i]);
+
+		dev_info(dev, " Topology file: %s/%s\n",
+			 desc->default_tplg_path[i],
+			 plat_data->tplg_filename);
+	}
+
+	if (base_profile->fw_path || base_profile->fw_name ||
+	    base_profile->tplg_path || base_profile->tplg_name)
+		dev_info(dev, "Verify the path/name override module parameters.\n");
+
+	dev_info(dev, "Check if you have 'sof-firmware' package installed.\n");
+	dev_info(dev, "Optionally it can be manually downloaded from:\n");
+	dev_info(dev, "   https://github.com/thesofproject/sof-bin/\n");
+}
+
+static void sof_print_profile_info(struct snd_sof_dev *sdev,
+				   enum sof_ipc_type ipc_type,
 				   struct sof_loadable_file_profile *profile)
 {
+	struct device *dev = sdev->dev;
+
+	if (ipc_type != profile->ipc_type)
+		dev_info(dev,
+			 "Using fallback IPC type %d (requested type was %d)\n",
+			 profile->ipc_type, ipc_type);
+
 	dev_info(dev, "Firmware paths/files for ipc type %d:\n", profile->ipc_type);
 
 	dev_info(dev, " Firmware file:     %s/%s\n", profile->fw_path, profile->fw_name);
 	if (profile->fw_lib_path)
 		dev_info(dev, " Firmware lib path: %s\n", profile->fw_lib_path);
-	if (profile->tplg_name)
-		dev_info(dev, " Topology file:     %s/%s\n", profile->tplg_path,
-			profile->tplg_name);
-	else
-		dev_info(dev, " Topology path:     %s\n", profile->tplg_path);
+	dev_info(dev, " Topology file:     %s/%s\n", profile->tplg_path, profile->tplg_name);
 }
 
 int sof_create_ipc_file_profile(struct snd_sof_dev *sdev,
@@ -114,17 +278,45 @@ int sof_create_ipc_file_profile(struct snd_sof_dev *sdev,
 				struct sof_loadable_file_profile *out_profile)
 {
 	const struct sof_dev_desc *desc = sdev->pdata->desc;
-	struct device *dev = sdev->dev;
-	int ret;
+	int ipc_fallback_start, ret, i;
 
 	memset(out_profile, 0, sizeof(*out_profile));
 
-	ret = sof_file_profile_for_ipc_type(dev, desc, base_profile, out_profile);
-	if (ret)
-		return ret;
+	ret = sof_file_profile_for_ipc_type(sdev, base_profile->ipc_type, desc,
+					    base_profile, out_profile);
+	if (!ret)
+		goto out;
+
+	/*
+	 * No firmware file was found for the requested IPC type, as fallback
+	 * if SND_SOC_SOF_ALLOW_FALLBACK_TO_NEWER_IPC_VERSION is selected, check
+	 * all IPC versions in a backwards direction (from newer to older)
+	 * if SND_SOC_SOF_ALLOW_FALLBACK_TO_NEWER_IPC_VERSION is not selected,
+	 * check only older IPC versions than the selected/default version
+	 */
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_ALLOW_FALLBACK_TO_NEWER_IPC_VERSION))
+		ipc_fallback_start = SOF_IPC_TYPE_COUNT - 1;
+	else
+		ipc_fallback_start = (int)base_profile->ipc_type - 1;
 
-	sof_print_profile_info(dev, out_profile);
+	for (i = ipc_fallback_start; i >= 0 ; i--) {
+		if (i == base_profile->ipc_type ||
+		    !(desc->ipc_supported_mask & BIT(i)))
+			continue;
 
-	return 0;
+		ret = sof_file_profile_for_ipc_type(sdev, i, desc, base_profile,
+						    out_profile);
+		if (!ret)
+			break;
+	}
+
+out:
+	if (ret)
+		sof_print_missing_firmware_info(sdev, base_profile->ipc_type,
+						base_profile);
+	else
+		sof_print_profile_info(sdev, base_profile->ipc_type, out_profile);
+
+	return ret;
 }
 EXPORT_SYMBOL(sof_create_ipc_file_profile);
-- 
2.43.0

