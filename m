Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09507602B77
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:15:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E5919C5D;
	Tue, 18 Oct 2022 14:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E5919C5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095316;
	bh=hZgl3woEKt0iQ2/fqekzUrO6+Dpt1h1GPW1lxu+Q+ic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iJeOQZsT7DZXhjApb4dnnGnvigV6fAFcI5Jw4l9mHnQZHW0uew7KlUO3r27+sHbYd
	 qqDYEs9dDVjR54c8h2HtSnx1aNnpJ8X7gFyfTW2fFqH5aL7LSUVxNxN5RAurRusvNg
	 RjQ0GEVLxS8DdiXmV76HKc17SCgM4aOwKgtlFw60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9AEAF805EB;
	Tue, 18 Oct 2022 14:09:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D050F805D7; Tue, 18 Oct 2022 14:09:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3792FF805D7
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3792FF805D7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Oz2sZqRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094986; x=1697630986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hZgl3woEKt0iQ2/fqekzUrO6+Dpt1h1GPW1lxu+Q+ic=;
 b=Oz2sZqRs/2H2Co8FMjWSR16aTMiPS7brODqBxbnu8z5pcsXui5L8ZJFH
 M0NA0bQVCaULXaRu9Y8T6dZNV4PGbsPi/4jspuJgicWcGsK+7gFpLk8Zo
 tbcGX4SPF2UBosx8Cbik3znRhVfz1E7ZxJEWYpa7SwsAVGgFMHORdkc1R
 +0jNb0gUJDSRWIiGussVdgvdjN+VTU8+Im6nDNENYV/mRxvaYLfRflOq6
 BUqd/wafoi0+w+UXoG2nMsn7Y6UGnftrPZP0HUy3Uqi9XNgzsDh3c4GHL
 A8C910Y9LPe2IWxsAdC7fGPuuaj6b/FhG1Grjc9ulHM7zPQ532CeVIpRy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293453046"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293453046"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:43 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579758103"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579758103"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:41 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 19/19] ASoC: SOF: ipc4-loader: Support for loading external
 libraries
Date: Tue, 18 Oct 2022 15:09:16 +0300
Message-Id: <20221018120916.19820-20-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

In case the requested module is not available among the loaded libraries,
try to load it as external library.

The kernel will try to load the file from <fw_lib_prefix>/<module_uuid>.bin

If the file found, then the ext manifest of it is parsed, placed it under
XArray and the pointer to the module is returned to the caller.

Releasing the firmware will be done on ipc cleanup time.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 155 ++++++++++++++++++++++++++++++++++--
 sound/soc/sof/ipc4-priv.h   |   2 +
 sound/soc/sof/ipc4.c        |   2 +-
 3 files changed, 153 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index dbe3ee4ef08c..af0018b38cf0 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -14,6 +14,9 @@
 #include "sof-priv.h"
 #include "ops.h"
 
+/* The module ID includes the id of the library it is part of at offset 12 */
+#define SOF_IPC4_MOD_LIB_ID_SHIFT	12
+
 static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev,
 					struct sof_ipc4_fw_library *fw_lib)
 {
@@ -71,17 +74,18 @@ static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
-	dev_info(sdev->dev, "Loaded firmware version: %u.%u.%u.%u\n",
-		 fw_header->major_version, fw_header->minor_version,
+	dev_info(sdev->dev, "Loaded firmware library: %s, version: %u.%u.%u.%u\n",
+		 fw_header->name, fw_header->major_version, fw_header->minor_version,
 		 fw_header->hotfix_version, fw_header->build_version);
-	dev_dbg(sdev->dev, "Firmware name: %s, header length: %u, module count: %u\n",
-		fw_header->name, fw_header->len, fw_header->num_module_entries);
+	dev_dbg(sdev->dev, "Header length: %u, module count: %u\n",
+		fw_header->len, fw_header->num_module_entries);
 
 	fw_lib->modules = devm_kmalloc_array(sdev->dev, fw_header->num_module_entries,
 					     sizeof(*fw_module), GFP_KERNEL);
 	if (!fw_lib->modules)
 		return -ENOMEM;
 
+	fw_lib->name = fw_header->name;
 	fw_lib->num_modules = fw_header->num_module_entries;
 	fw_module = fw_lib->modules;
 
@@ -160,13 +164,111 @@ static size_t sof_ipc4_fw_parse_basefw_ext_man(struct snd_sof_dev *sdev)
 	return payload_offset;
 }
 
+static int sof_ipc4_load_library_by_uuid(struct snd_sof_dev *sdev,
+					 unsigned long lib_id, const guid_t *uuid)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_fw_library *fw_lib;
+	const char *fw_filename;
+	size_t payload_offset;
+	int ret, i, err;
+
+	if (!sdev->pdata->fw_lib_prefix) {
+		dev_err(sdev->dev,
+			"Library loading is not supported due to not set library path\n");
+		return -EINVAL;
+	}
+
+	if (!ipc4_data->load_library) {
+		dev_err(sdev->dev, "Library loading is not supported on this platform\n");
+		return -EOPNOTSUPP;
+	}
+
+	fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
+	if (!fw_lib)
+		return -ENOMEM;
+
+	fw_filename = kasprintf(GFP_KERNEL, "%s/%pUL.bin",
+				sdev->pdata->fw_lib_prefix, uuid);
+	if (!fw_filename) {
+		ret = -ENOMEM;
+		goto free_fw_lib;
+	}
+
+	ret = request_firmware(&fw_lib->sof_fw.fw, fw_filename, sdev->dev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Library file '%s' is missing\n", fw_filename);
+		goto free_filename;
+	} else {
+		dev_dbg(sdev->dev, "Library file '%s' loaded\n", fw_filename);
+	}
+
+	payload_offset = sof_ipc4_fw_parse_ext_man(sdev, fw_lib);
+	if (payload_offset <= 0) {
+		if (!payload_offset)
+			ret = -EINVAL;
+		else
+			ret = payload_offset;
+
+		goto release;
+	}
+
+	fw_lib->sof_fw.payload_offset = payload_offset;
+	fw_lib->id = lib_id;
+
+	/* Fix up the module ID numbers within the library */
+	for (i = 0; i < fw_lib->num_modules; i++)
+		fw_lib->modules[i].man4_module_entry.id |= (lib_id << SOF_IPC4_MOD_LIB_ID_SHIFT);
+
+	/*
+	 * Make sure that the DSP is booted and stays up while attempting the
+	 * loading the library for the first time
+	 */
+	ret = pm_runtime_resume_and_get(sdev->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(sdev->dev, "%s: pm_runtime resume failed: %d\n",
+				    __func__, ret);
+		goto release;
+	}
+
+	ret = ipc4_data->load_library(sdev, fw_lib, false);
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev, "%s: pm_runtime idle failed: %d\n",
+				    __func__, err);
+
+	if (ret)
+		goto release;
+
+	ret = xa_insert(&ipc4_data->fw_lib_xa, lib_id, fw_lib, GFP_KERNEL);
+	if (unlikely(ret))
+		goto release;
+
+	kfree(fw_filename);
+
+	return 0;
+
+release:
+	release_firmware(fw_lib->sof_fw.fw);
+	/* Allocated within sof_ipc4_fw_parse_ext_man() */
+	devm_kfree(sdev->dev, fw_lib->modules);
+free_filename:
+	kfree(fw_filename);
+free_fw_lib:
+	devm_kfree(sdev->dev, fw_lib);
+
+	return ret;
+}
+
 struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
 							const guid_t *uuid)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct sof_ipc4_fw_library *fw_lib;
 	unsigned long lib_id;
-	int i;
+	int i, ret;
 
 	if (guid_is_null(uuid))
 		return NULL;
@@ -178,6 +280,30 @@ struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev
 		}
 	}
 
+	/*
+	 * Do not attempt to load external library in case the maximum number of
+	 * firmware libraries have been already loaded
+	 */
+	if ((lib_id + 1) == ipc4_data->max_libs_count) {
+		dev_err(sdev->dev,
+			"%s: Maximum allowed number of libraries reached (%u)\n",
+			__func__, ipc4_data->max_libs_count);
+		return NULL;
+	}
+
+	/* The module cannot be found, try to load it as a library */
+	ret = sof_ipc4_load_library_by_uuid(sdev, lib_id + 1, uuid);
+	if (ret)
+		return NULL;
+
+	/* Look for the module in the newly loaded library, it should be available now */
+	xa_for_each_start(&ipc4_data->fw_lib_xa, lib_id, fw_lib, lib_id) {
+		for (i = 0; i < fw_lib->num_modules; i++) {
+			if (guid_equal(uuid, &fw_lib->modules[i].man4_module_entry.uuid))
+				return &fw_lib->modules[i];
+		}
+	}
+
 	return NULL;
 }
 
@@ -270,6 +396,25 @@ int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+int sof_ipc4_reload_fw_libraries(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_fw_library *fw_lib;
+	unsigned long lib_id;
+	int ret = 0;
+
+	xa_for_each_start(&ipc4_data->fw_lib_xa, lib_id, fw_lib, 1) {
+		ret = ipc4_data->load_library(sdev, fw_lib, true);
+		if (ret) {
+			dev_err(sdev->dev, "%s: Failed to reload library: %s, %d\n",
+				__func__, fw_lib->name, ret);
+			break;
+		}
+	}
+
+	return ret;
+}
+
 const struct sof_ipc_fw_loader_ops ipc4_loader_ops = {
 	.validate = sof_ipc4_validate_firmware,
 	.parse_ext_manifest = sof_ipc4_fw_parse_basefw_ext_man,
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index e4bd6d93fb0f..d6f35004c4b7 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -50,6 +50,7 @@ struct sof_ipc4_fw_module {
  */
 struct sof_ipc4_fw_library {
 	struct sof_firmware sof_fw;
+	const char *name;
 	u32 id;
 	int num_modules;
 	struct sof_ipc4_fw_module *modules;
@@ -91,6 +92,7 @@ int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state);
 int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core);
 
 int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev);
+int sof_ipc4_reload_fw_libraries(struct snd_sof_dev *sdev);
 struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
 							const guid_t *uuid);
 #endif
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index f1e5875675db..3e81bc5d7d44 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -692,7 +692,7 @@ static int sof_ipc4_post_boot(struct snd_sof_dev *sdev)
 	if (sdev->first_boot)
 		return sof_ipc4_query_fw_configuration(sdev);
 
-	return 0;
+	return sof_ipc4_reload_fw_libraries(sdev);
 }
 
 const struct sof_ipc_ops ipc4_ops = {
-- 
2.38.0

