Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F3A602B5F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A07D9CAC;
	Tue, 18 Oct 2022 14:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A07D9CAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095143;
	bh=WRiL5FicIm8MlioaADAFF1kA1ud1KmvJRcv93Oid9ec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BMCDck1y7m5z1Z1CIrp5uPXl+39kXTc2Om/Cnbfa2ajG7/WO+WZhh0d3uFXzWv8Mv
	 tzw31sYY3ukZ13vnYr2e/DCJLPhwkkGIA0fL7DruPm5Po1OR08X7kIPX9hGO758inb
	 qgM5aTPiElkzpnOyD2JjQgwr+VgW1DbE20oWU3Pk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3CC6F8056F;
	Tue, 18 Oct 2022 14:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3D1DF80580; Tue, 18 Oct 2022 14:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B1A4F80578
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B1A4F80578
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NqG9IlOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094968; x=1697630968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WRiL5FicIm8MlioaADAFF1kA1ud1KmvJRcv93Oid9ec=;
 b=NqG9IlOyACkMzLRQ4lV8JpuAbpbaiHRKQC6vNxUqb3u97Jg/9r6JmTX7
 Io/R0yjlKk9RsPGNSpNGp7C/UkLWJstCBCZqRIQkMjl/vTMKC+c0CbGqo
 Xz1as+9wper6Zp4SWC2bnvnFCVvvXaF7lrItJ6kvHbC+ip0onoHZOVoek
 sAv49ClF949ZHldCB/8u/Om55ZPnIygIXd2N0ogTexGT+HJNxlI4OB3CI
 hlv/ObW3ldUcd405gJAUECSHKVcNZOPDwQiuZlQCzFEkBwYlOkiJN/eCp
 J0hKjLUsJeRMl3/gTmnNFMB2D7UayOpGbOnixjBCqm720AgrLgZeoRfSL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293452952"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293452952"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757921"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757921"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 09/19] ASoC: SOF: ipc4: Convert the firmware handling (loader)
 to library convention
Date: Tue, 18 Oct 2022 15:09:06 +0300
Message-Id: <20221018120916.19820-10-peter.ujfalusi@linux.intel.com>
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

With IPC4 each DSP loadable binary is a library, which contains
ext_manifest section and loadable modules.
The basefw is no exception, it is always library 0 and it can contain
several modules, depending on the firmware build.

The current code assumes only one binary, which is the basefw and has no
concept of libraries.
This patch introduces the library+modules abstraction and represents the
basefw as library for the IPC4 loader codebase.
The basefw loading and handling is not changing, it is still done by the
generic code, but it's information is cloned under the library
representation.

The libraries are managed via XArray to offload the list and ID management.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c   | 45 +++++++++++++++++++++++------
 sound/soc/sof/ipc4-priv.h     | 53 +++++++++++++++++++++++------------
 sound/soc/sof/ipc4-topology.c | 20 ++++++-------
 sound/soc/sof/ipc4.c          | 32 +++++++++++++++++++++
 4 files changed, 113 insertions(+), 37 deletions(-)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 2495a205ef78..5506ec997328 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -14,11 +14,12 @@
 #include "sof-priv.h"
 #include "ops.h"
 
-static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev)
+static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev,
+					struct sof_ipc4_fw_library *fw_lib)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	const struct firmware *fw = fw_lib->sof_fw.fw;
 	struct sof_man4_fw_binary_header *fw_header;
-	const struct firmware *fw = sdev->basefw.fw;
 	struct sof_ext_manifest4_hdr *ext_man_hdr;
 	struct sof_man4_module_config *fm_config;
 	struct sof_ipc4_fw_module *fw_module;
@@ -76,14 +77,13 @@ static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev)
 	dev_dbg(sdev->dev, "Firmware name: %s, header length: %u, module count: %u\n",
 		fw_header->name, fw_header->len, fw_header->num_module_entries);
 
-	ipc4_data->fw_modules = devm_kmalloc_array(sdev->dev,
-						   fw_header->num_module_entries,
-						   sizeof(*fw_module), GFP_KERNEL);
-	if (!ipc4_data->fw_modules)
+	fw_lib->modules = devm_kmalloc_array(sdev->dev, fw_header->num_module_entries,
+					     sizeof(*fw_module), GFP_KERNEL);
+	if (!fw_lib->modules)
 		return -ENOMEM;
 
-	ipc4_data->num_fw_modules = fw_header->num_module_entries;
-	fw_module = ipc4_data->fw_modules;
+	fw_lib->num_modules = fw_header->num_module_entries;
+	fw_module = fw_lib->modules;
 
 	fm_entry = (struct sof_man4_module *)((u8 *)fw_header + fw_header->len);
 	remaining -= fw_header->len;
@@ -133,6 +133,33 @@ static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev)
 	return ext_man_hdr->len;
 }
 
+static size_t sof_ipc4_fw_parse_basefw_ext_man(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_fw_library *fw_lib;
+	size_t payload_offset;
+	int ret;
+
+	fw_lib = devm_kzalloc(sdev->dev, sizeof(*fw_lib), GFP_KERNEL);
+	if (!fw_lib)
+		return -ENOMEM;
+
+	fw_lib->sof_fw.fw = sdev->basefw.fw;
+
+	payload_offset = sof_ipc4_fw_parse_ext_man(sdev, fw_lib);
+	if (payload_offset > 0) {
+		fw_lib->sof_fw.payload_offset = payload_offset;
+
+		/* basefw ID is 0 */
+		fw_lib->id = 0;
+		ret = xa_insert(&ipc4_data->fw_lib_xa, 0, fw_lib, GFP_KERNEL);
+		if (ret)
+			return ret;
+	}
+
+	return payload_offset;
+}
+
 static int sof_ipc4_validate_firmware(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
@@ -224,6 +251,6 @@ static int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 
 const struct sof_ipc_fw_loader_ops ipc4_loader_ops = {
 	.validate = sof_ipc4_validate_firmware,
-	.parse_ext_manifest = sof_ipc4_fw_parse_ext_man,
+	.parse_ext_manifest = sof_ipc4_fw_parse_basefw_ext_man,
 	.query_fw_configuration = sof_ipc4_query_fw_configuration,
 };
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 7f5c7a47b3a7..bce168083f09 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -24,11 +24,43 @@ enum sof_ipc4_mtrace_type {
 	SOF_IPC4_MTRACE_INTEL_CAVS_2,
 };
 
+/**
+ * struct sof_ipc4_fw_module - IPC4 module info
+ * @sof_man4_module: Module info
+ * @m_ida: Module instance identifier
+ * @bss_size: Module object size
+ * @private: Module private data
+ */
+struct sof_ipc4_fw_module {
+	struct sof_man4_module man4_module_entry;
+	struct ida m_ida;
+	u32 bss_size;
+	void *private;
+};
+
+/**
+ * struct sof_ipc4_fw_library - IPC4 library information
+ * @sof_fw: SOF Firmware of the library
+ * @id: Library ID. 0 is reserved for basefw, external libraries must have unique
+ *	ID number between 1 and (sof_ipc4_fw_data.max_libs_count - 1)
+ *	Note: sof_ipc4_fw_data.max_libs_count == 1 implies that external libraries
+ *	are not supported
+ * @num_modules : Number of FW modules in the library
+ * @modules: Array of FW modules
+ */
+struct sof_ipc4_fw_library {
+	struct sof_firmware sof_fw;
+	u32 id;
+	int num_modules;
+	struct sof_ipc4_fw_module *modules;
+};
+
 /**
  * struct sof_ipc4_fw_data - IPC4-specific data
  * @manifest_fw_hdr_offset: FW header offset in the manifest
- * @num_fw_modules : Number of modules in base FW
- * @fw_modules: Array of base FW modules
+ * @fw_lib_xa: XArray for firmware libraries, including basefw (ID = 0)
+ *	       Used to store the FW libraries and to manage the unique IDs of the
+ *	       libraries.
  * @nhlt: NHLT table either from the BIOS or the topology manifest
  * @mtrace_type: mtrace type supported on the booted platform
  * @mtrace_log_bytes: log bytes as reported by the firmware via fw_config reply
@@ -37,28 +69,13 @@ enum sof_ipc4_mtrace_type {
  */
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
-	int num_fw_modules;
-	void *fw_modules;
+	struct xarray fw_lib_xa;
 	void *nhlt;
 	enum sof_ipc4_mtrace_type mtrace_type;
 	u32 mtrace_log_bytes;
 	u32 max_libs_count;
 };
 
-/**
- * struct sof_ipc4_fw_module - IPC4 module info
- * @sof_man4_module : Module info
- * @m_ida: Module instance identifier
- * @bss_size: Module object size
- * @private: Module private data
- */
-struct sof_ipc4_fw_module {
-	struct sof_man4_module man4_module_entry;
-	struct ida m_ida;
-	u32 bss_size;
-	void *private;
-};
-
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
 extern const struct sof_ipc_tplg_ops ipc4_tplg_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a81af5f73a4b..98f7f5421ba5 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -290,19 +290,19 @@ static int sof_ipc4_widget_set_module_info(struct snd_sof_widget *swidget)
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
-	struct sof_ipc4_fw_module *fw_modules = ipc4_data->fw_modules;
+	struct sof_ipc4_fw_library *fw_lib;
+	unsigned long lib_id;
 	int i;
 
-	if (!fw_modules) {
-		dev_err(sdev->dev, "no fw_module information\n");
-		return -EINVAL;
-	}
+	xa_for_each(&ipc4_data->fw_lib_xa, lib_id, fw_lib) {
+		/* set module info */
+		for (i = 0; i < fw_lib->num_modules; i++) {
+			struct sof_ipc4_fw_module *module = &fw_lib->modules[i];
 
-	/* set module info */
-	for (i = 0; i < ipc4_data->num_fw_modules; i++) {
-		if (guid_equal(&swidget->uuid, &fw_modules[i].man4_module_entry.uuid)) {
-			swidget->module_info = &fw_modules[i];
-			return 0;
+			if (guid_equal(&swidget->uuid, &module->man4_module_entry.uuid)) {
+				swidget->module_info = module;
+				return 0;
+			}
 		}
 	}
 
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 6eaa18e27e5a..abbeb832027b 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -8,6 +8,7 @@
 // Authors: Rander Wang <rander.wang@linux.intel.com>
 //	    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
 //
+#include <linux/firmware.h>
 #include <sound/sof/header.h>
 #include <sound/sof/ipc4/header.h>
 #include "sof-priv.h"
@@ -657,7 +658,38 @@ static const struct sof_ipc_pm_ops ipc4_pm_ops = {
 	.set_core_state = sof_ipc4_set_core_state,
 };
 
+static int sof_ipc4_init(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+
+	xa_init_flags(&ipc4_data->fw_lib_xa, XA_FLAGS_ALLOC);
+
+	return 0;
+}
+
+static void sof_ipc4_exit(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_fw_library *fw_lib;
+	unsigned long lib_id;
+
+	xa_for_each(&ipc4_data->fw_lib_xa, lib_id, fw_lib) {
+		/*
+		 * The basefw (ID == 0) is handled by generic code, it is not
+		 * loaded by IPC4 code.
+		 */
+		if (lib_id != 0)
+			release_firmware(fw_lib->sof_fw.fw);
+
+		fw_lib->sof_fw.fw = NULL;
+	}
+
+	xa_destroy(&ipc4_data->fw_lib_xa);
+}
+
 const struct sof_ipc_ops ipc4_ops = {
+	.init = sof_ipc4_init,
+	.exit = sof_ipc4_exit,
 	.tx_msg = sof_ipc4_tx_msg,
 	.rx_msg = sof_ipc4_rx_msg,
 	.set_get_data = sof_ipc4_set_get_data,
-- 
2.38.0

