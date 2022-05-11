Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1D523B5D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 19:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881D41ABA;
	Wed, 11 May 2022 19:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881D41ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652289581;
	bh=lpfFqSR9+i25q/GqGep0lhnie6BZLABwC9YYiuUZpaA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1LYZ01DKvH+yhSlaJt6st9AmY42IbeKvUj3KX8PF3jxv27dGM6BGwRUiKN7qXsxf
	 1yhqxekpEyWmUYhQ+yagEOS7j0IzMetftcnO+zLY2KNEz9MlRF9XtUSNEq+gDLpKAg
	 ZlWKPIj+CtVDHojXTy453a/P2amcvcqu4sE/7cvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 593AEF80533;
	Wed, 11 May 2022 19:17:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41F69F80526; Wed, 11 May 2022 19:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41341F8015B
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 19:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41341F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gQJEKYXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652289427; x=1683825427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lpfFqSR9+i25q/GqGep0lhnie6BZLABwC9YYiuUZpaA=;
 b=gQJEKYXBkxzdXmp+JhMBpAP4cdC4uaOqsG0K93VFN6m6zscZuhu4YESe
 z6Ge+pMkcZ+RCSj1w3EmvXT71FUrJ0znk1x+NnkrvORB8BC/Np2NagKmn
 zNpILrDbNnTjf7v56W5wiXVRgjWz5UranHV+Cm3I40G+vcJ3376wRTrSG
 P+Aw5GHchxYfABGQQsMtMEP8LLhR07RiTgfz517vbvu4lYIbEMMuX7L3u
 mjngLRXdKcEDVV79P+U7DYpBNBT3eq6Ao51HAnyLAH5xfSLkX/oxVWptr
 7oW16aLQO8QgW/tEigJtubZyZd1EKYVT9tewwfklFEhMvc1RZLqvDvoQu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269431639"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269431639"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="697663181"
Received: from sjbrune-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.32.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:55 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: SOF: IPC4: Add FW loader ops
Date: Wed, 11 May 2022 10:16:47 -0700
Message-Id: <20220511171648.1622993-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
References: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

Define and add the FW loader ops for IPC4. Also, introduce a new
structure, struct sof_ipc4_private_data that will be used to define some
IPC4-sepcific data.

Co-developed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Makefile      |   2 +-
 sound/soc/sof/ipc4-loader.c | 210 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h   |  17 +++
 sound/soc/sof/ipc4.c        |   2 +
 4 files changed, 230 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/ipc4-loader.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 482a4c85f4c8..8a79f03207fe 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -3,7 +3,7 @@
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
 		ipc3-topology.o ipc3-control.o ipc3.o ipc3-pcm.o ipc3-loader.o\
-		ipc4.o
+		ipc4.o ipc4-loader.o
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-objs += sof-client.o
 endif
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
new file mode 100644
index 000000000000..9fadae8fd011
--- /dev/null
+++ b/sound/soc/sof/ipc4-loader.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+
+#include <linux/firmware.h>
+#include <sound/sof/ext_manifest4.h>
+#include <sound/sof/ipc4/header.h>
+#include "ipc4-priv.h"
+#include "sof-audio.h"
+#include "sof-priv.h"
+#include "ops.h"
+
+static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	struct sof_man4_fw_binary_header *fw_header;
+	const struct firmware *fw = plat_data->fw;
+	struct sof_ext_manifest4_hdr *ext_man_hdr;
+	struct sof_man4_module_config *fm_config;
+	struct sof_ipc4_fw_module *fw_module;
+	struct sof_man4_module *fm_entry;
+	ssize_t remaining;
+	u32 fw_hdr_offset;
+	int i;
+
+	if (!ipc4_data) {
+		dev_err(sdev->dev, "%s: ipc4_data is not available\n", __func__);
+		return -EINVAL;
+	}
+
+	remaining = fw->size;
+	if (remaining <= sizeof(*ext_man_hdr)) {
+		dev_err(sdev->dev, "Firmware size is too small: %zu\n", remaining);
+		return -EINVAL;
+	}
+
+	ext_man_hdr = (struct sof_ext_manifest4_hdr *)fw->data;
+
+	fw_hdr_offset = ipc4_data->manifest_fw_hdr_offset;
+	if (!fw_hdr_offset)
+		return -EINVAL;
+
+	if (remaining <= ext_man_hdr->len + fw_hdr_offset + sizeof(*fw_header)) {
+		dev_err(sdev->dev, "Invalid firmware size %zu, should be at least %zu\n",
+			remaining, ext_man_hdr->len + fw_hdr_offset + sizeof(*fw_header));
+		return -EINVAL;
+	}
+
+	fw_header = (struct sof_man4_fw_binary_header *)
+				(fw->data + ext_man_hdr->len + fw_hdr_offset);
+	remaining -= (ext_man_hdr->len + fw_hdr_offset);
+
+	if (remaining <= fw_header->len) {
+		dev_err(sdev->dev, "Invalid fw_header->len %u\n", fw_header->len);
+		return -EINVAL;
+	}
+
+	dev_info(sdev->dev, "Loaded firmware version: %u.%u.%u.%u\n",
+		 fw_header->major_version, fw_header->minor_version,
+		 fw_header->hotfix_version, fw_header->build_version);
+	dev_dbg(sdev->dev, "Firmware name: %s, header length: %u, module count: %u\n",
+		fw_header->name, fw_header->len, fw_header->num_module_entries);
+
+	ipc4_data->fw_modules = devm_kmalloc_array(sdev->dev,
+						   fw_header->num_module_entries,
+						   sizeof(*fw_module), GFP_KERNEL);
+	if (!ipc4_data->fw_modules)
+		return -ENOMEM;
+
+	ipc4_data->num_fw_modules = fw_header->num_module_entries;
+	fw_module = ipc4_data->fw_modules;
+
+	fm_entry = (struct sof_man4_module *)((u8 *)fw_header + fw_header->len);
+	remaining -= fw_header->len;
+
+	if (remaining < fw_header->num_module_entries * sizeof(*fm_entry)) {
+		dev_err(sdev->dev, "Invalid num_module_entries %u\n",
+			fw_header->num_module_entries);
+		return -EINVAL;
+	}
+
+	fm_config = (struct sof_man4_module_config *)
+				(fm_entry + fw_header->num_module_entries);
+	remaining -= (fw_header->num_module_entries * sizeof(*fm_entry));
+	for (i = 0; i < fw_header->num_module_entries; i++) {
+		memcpy(&fw_module->man4_module_entry, fm_entry, sizeof(*fm_entry));
+
+		if (fm_entry->cfg_count) {
+			if (remaining < (fm_entry->cfg_offset + fm_entry->cfg_count) *
+			    sizeof(*fm_config)) {
+				dev_err(sdev->dev, "Invalid module cfg_offset %u\n",
+					fm_entry->cfg_offset);
+				return -EINVAL;
+			}
+
+			/* a module's config is always the same size */
+			fw_module->bss_size = fm_config[fm_entry->cfg_offset].is_bytes;
+
+			dev_dbg(sdev->dev,
+				"module %s: UUID %pUL cfg_count: %u, bss_size: %#x\n",
+				fm_entry->name, &fm_entry->uuid, fm_entry->cfg_count,
+				fw_module->bss_size);
+		} else {
+			fw_module->bss_size = 0;
+
+			dev_dbg(sdev->dev, "module %s: UUID %pUL\n", fm_entry->name,
+				&fm_entry->uuid);
+		}
+
+		fw_module->man4_module_entry.id = i;
+		ida_init(&fw_module->m_ida);
+		fw_module->private = NULL;
+
+		fw_module++;
+		fm_entry++;
+	}
+
+	return ext_man_hdr->len;
+}
+
+static int sof_ipc4_validate_firmware(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	u32 fw_hdr_offset = ipc4_data->manifest_fw_hdr_offset;
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	struct sof_man4_fw_binary_header *fw_header;
+	const struct firmware *fw = plat_data->fw;
+	struct sof_ext_manifest4_hdr *ext_man_hdr;
+
+	ext_man_hdr = (struct sof_ext_manifest4_hdr *)fw->data;
+	fw_header = (struct sof_man4_fw_binary_header *)
+				(fw->data + ext_man_hdr->len + fw_hdr_offset);
+
+	/* TODO: Add firmware verification code here */
+
+	dev_dbg(sdev->dev, "Validated firmware version: %u.%u.%u.%u\n",
+		fw_header->major_version, fw_header->minor_version,
+		fw_header->hotfix_version, fw_header->build_version);
+
+	return 0;
+}
+
+static int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
+{
+	const struct sof_ipc_ops *iops = sdev->ipc->ops;
+	struct sof_ipc4_fw_version *fw_ver;
+	struct sof_ipc4_tuple *tuple;
+	struct sof_ipc4_msg msg;
+	size_t offset = 0;
+	int ret;
+
+	/* Get the firmware configuration */
+	msg.primary = SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MOD_ID(SOF_IPC4_MOD_INIT_BASEFW_MOD_ID);
+	msg.primary |= SOF_IPC4_MOD_INSTANCE(SOF_IPC4_MOD_INIT_BASEFW_INSTANCE_ID);
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_FW_PARAM_FW_CONFIG);
+
+	msg.data_size = sdev->ipc->max_payload_size;
+	msg.data_ptr = kzalloc(msg.data_size, GFP_KERNEL);
+	if (!msg.data_ptr)
+		return -ENOMEM;
+
+	ret = iops->set_get_data(sdev, &msg, msg.data_size, false);
+	if (ret)
+		goto out;
+
+	while (offset < msg.data_size) {
+		tuple = (struct sof_ipc4_tuple *)((u8 *)msg.data_ptr + offset);
+
+		switch (tuple->type) {
+		case SOF_IPC4_FW_CFG_FW_VERSION:
+			fw_ver = (struct sof_ipc4_fw_version *)tuple->value;
+
+			dev_info(sdev->dev,
+				 "Booted firmware version: %u.%u.%u.%u\n",
+				 fw_ver->major, fw_ver->minor, fw_ver->hotfix,
+				 fw_ver->build);
+			break;
+		case SOF_IPC4_FW_CFG_DL_MAILBOX_BYTES:
+			dev_vdbg(sdev->dev, "DL mailbox size: %u\n", *tuple->value);
+			break;
+		case SOF_IPC4_FW_CFG_UL_MAILBOX_BYTES:
+			dev_vdbg(sdev->dev, "UL mailbox size: %u\n", *tuple->value);
+			break;
+		case SOF_IPC4_FW_CFG_TRACE_LOG_BYTES:
+			dev_vdbg(sdev->dev, "Trace log size: %u\n", *tuple->value);
+			break;
+		default:
+			break;
+		}
+
+		offset += sizeof(*tuple) + tuple->size;
+	}
+
+out:
+	kfree(msg.data_ptr);
+
+	return ret;
+}
+
+const struct sof_ipc_fw_loader_ops ipc4_loader_ops = {
+	.validate = sof_ipc4_validate_firmware,
+	.parse_ext_manifest = sof_ipc4_fw_parse_ext_man,
+	.query_fw_configuration = sof_ipc4_query_fw_configuration,
+};
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 3a1b97e93a7d..2b71d5675933 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -10,6 +10,7 @@
 #define __SOUND_SOC_SOF_IPC4_PRIV_H
 
 #include <linux/idr.h>
+#include <sound/sof/ext_manifest4.h>
 #include "sof-priv.h"
 
 /**
@@ -24,4 +25,20 @@ struct sof_ipc4_fw_data {
 	void *fw_modules;
 };
 
+/**
+ * struct sof_ipc4_fw_module - IPC4 module info
+ * @sof_man4_module : Module info
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
+extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
+
 #endif
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index b561312a3e0f..658802c86685 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -12,6 +12,7 @@
 #include <sound/sof/ipc4/header.h>
 #include "sof-priv.h"
 #include "sof-audio.h"
+#include "ipc4-priv.h"
 #include "ops.h"
 
 #ifdef DEBUG_VERBOSE
@@ -601,4 +602,5 @@ const struct sof_ipc_ops ipc4_ops = {
 	.rx_msg = sof_ipc4_rx_msg,
 	.set_get_data = sof_ipc4_set_get_data,
 	.get_reply = sof_ipc4_get_reply,
+	.fw_loader = &ipc4_loader_ops,
 };
-- 
2.25.1

