Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4F605FEB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2701CB94E;
	Thu, 20 Oct 2022 14:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2701CB94E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268155;
	bh=unVOIJLzWUKjuuHK6VtGmnhPS0WTatffB2E3afDN5+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWhSYO79ksE62YAWIGe8pfSxrGXXIcZZ+JE0JtbpTBL75wj4c1xmFsZOrZx8xBzan
	 bx9nQig9piFbu9ShtQ/nuRnOEk51Sn8BiVZRqOfBQ7dergazZQo8DRv4EBMQ0RLCaU
	 dLM9B48fxSjyo8smAtqp9v4ZnWz/pnqWYdfpW5Ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10CF4F805AA;
	Thu, 20 Oct 2022 14:12:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECE11F805AA; Thu, 20 Oct 2022 14:12:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6686FF8057F
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6686FF8057F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DU6Clg0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267964; x=1697803964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=unVOIJLzWUKjuuHK6VtGmnhPS0WTatffB2E3afDN5+A=;
 b=DU6Clg0vxDBjaaEgXkXvkGEKM1fvvhEJ1kRcEPcEu3FQJVVGZwIJ+B3f
 DvQOq44HsNpct58NO/mFHwk52XY67Dw3zlzRwLi+l3VacmcyQVE91XZt6
 U/NErMAy5PzUsuyiP63aJa3pE7l7SV743Swc1STwZaBjUiHYH4tn8d8Ol
 ZhR+8OBEVhelvT4YePNpb69g6R8BCErJzDbNPgefngCau2f1qZilB7OEz
 kx938V5LCUMAp6cCTAZ8qvKksIrvmvbpXlPo40gD96zLnP/pqG9ls97ck
 sIuLPfg+XQRW1ojwpbw5/RQq9y240Tk19uhcACiwROt4ZcuPQfknSO6it Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256363"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256363"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663010017"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663010017"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 09/19] ASoC: SOF: ipc4: Convert the firmware handling
 (loader) to library convention
Date: Thu, 20 Oct 2022 15:12:28 +0300
Message-Id: <20221020121238.18339-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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
index 3c9b8692984a..cafbd75d8762 100644
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
2.38.1

