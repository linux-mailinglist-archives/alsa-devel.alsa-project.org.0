Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FF246D1E7
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:16:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8A9256D;
	Wed,  8 Dec 2021 12:15:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8A9256D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962207;
	bh=glAgPzCZ0xJMbAPz2lCUpavAdNRVnmoYfuZyRVWPliA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XdOfu8wiSgUedffeV0aj91z06XLBvgpVTQg//FYQGA5ohkVRjSUp/msjQMc4QMsGX
	 JJPk3lzoH+neK0/NFFSD1hFEzmA9iJd/Ds6LPkq4zFVp9YIbP1K2XWlUtiY8eNhS1q
	 Imcn5tslHdXVEavWaTgG0m2QvHTxVneMCzJ+TuAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A67AF8056F;
	Wed,  8 Dec 2021 12:11:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AAF4F80566; Wed,  8 Dec 2021 12:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FC27F8055C
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FC27F8055C
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548360"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548360"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:11:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600215"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:11:39 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 15/37] ASoC: Intel: avs: Firmware resources management utilities
Date: Wed,  8 Dec 2021 12:12:39 +0100
Message-Id: <20211208111301.1817725-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

With basefw runtime parameter handlers added, implement utility
functions to ease pipeline and module allocation. IDA is enlisted to
help with that. Also, as firmware is modular and multiple binaries can
be loaded throughout the lifetime of a driver, custom firmware caching
mechanism is added.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile |   2 +-
 sound/soc/intel/avs/avs.h    |  29 ++++
 sound/soc/intel/avs/utils.c  | 282 +++++++++++++++++++++++++++++++++++
 3 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/utils.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index c0824f30fd3b..d9f92c5f5407 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o ipc.o messages.o
+snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 8620d2f7fee0..d12b19a7299b 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -52,6 +52,13 @@ struct avs_spec {
 	const u32 hipc_ctl_offset;
 };
 
+struct avs_fw_entry {
+	char *name;
+	const struct firmware *fw;
+
+	struct list_head node;
+};
+
 struct avs_dev {
 	struct hda_bus base;
 	struct device *dev;
@@ -60,6 +67,14 @@ struct avs_dev {
 	const struct avs_spec *spec;
 	struct avs_ipc *ipc;
 
+	struct avs_fw_cfg fw_cfg;
+	struct avs_hw_cfg hw_cfg;
+	struct avs_mods_info *mods_info;
+	struct ida **mod_idas;
+	struct mutex modres_mutex;
+	struct ida ppl_ida;
+	struct list_head fw_list;
+
 	struct completion fw_ready;
 };
 
@@ -154,4 +169,18 @@ void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable);
 int avs_ipc_init(struct avs_ipc *ipc, struct device *dev);
 void avs_ipc_block(struct avs_ipc *ipc);
 
+/* Firmware resources management */
+
+int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry);
+int avs_get_module_id_entry(struct avs_dev *adev, u32 module_id, struct avs_module_entry *entry);
+int avs_get_module_id(struct avs_dev *adev, const guid_t *uuid);
+bool avs_is_module_ida_empty(struct avs_dev *adev, u32 module_id);
+
+int avs_module_info_init(struct avs_dev *adev, bool purge);
+void avs_module_info_free(struct avs_dev *adev);
+int avs_module_id_alloc(struct avs_dev *adev, u16 module_id);
+void avs_module_id_free(struct avs_dev *adev, u16 module_id, u8 instance_id);
+int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, const char *name);
+void avs_release_firmwares(struct avs_dev *adev);
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
new file mode 100644
index 000000000000..cf8663c32609
--- /dev/null
+++ b/sound/soc/intel/avs/utils.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/firmware.h>
+#include <linux/slab.h>
+#include "avs.h"
+#include "messages.h"
+
+/* Caller responsible for holding adev->modres_mutex. */
+static int avs_module_entry_index(struct avs_dev *adev, const guid_t *uuid)
+{
+	int i;
+
+	for (i = 0; i < adev->mods_info->count; i++) {
+		struct avs_module_entry *module;
+
+		module = &adev->mods_info->entries[i];
+		if (guid_equal(&module->uuid, uuid))
+			return i;
+	}
+
+	return -ENOENT;
+}
+
+/* Caller responsible for holding adev->modres_mutex. */
+static int avs_module_id_entry_index(struct avs_dev *adev, u32 module_id)
+{
+	int i;
+
+	for (i = 0; i < adev->mods_info->count; i++) {
+		struct avs_module_entry *module;
+
+		module = &adev->mods_info->entries[i];
+		if (module->module_id == module_id)
+			return i;
+	}
+
+	return -ENOENT;
+}
+
+int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry)
+{
+	int idx;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_entry_index(adev, uuid);
+	if (idx >= 0)
+		memcpy(entry, &adev->mods_info->entries[idx], sizeof(*entry));
+
+	mutex_unlock(&adev->modres_mutex);
+	return (idx < 0) ? idx : 0;
+}
+
+int avs_get_module_id_entry(struct avs_dev *adev, u32 module_id, struct avs_module_entry *entry)
+{
+	int idx;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_id_entry_index(adev, module_id);
+	if (idx >= 0)
+		memcpy(entry, &adev->mods_info->entries[idx], sizeof(*entry));
+
+	mutex_unlock(&adev->modres_mutex);
+	return (idx < 0) ? idx : 0;
+}
+
+int avs_get_module_id(struct avs_dev *adev, const guid_t *uuid)
+{
+	struct avs_module_entry module;
+	int ret;
+
+	ret = avs_get_module_entry(adev, uuid, &module);
+	return !ret ? module.module_id : -ENOENT;
+}
+
+bool avs_is_module_ida_empty(struct avs_dev *adev, u32 module_id)
+{
+	bool ret = false;
+	int idx;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_id_entry_index(adev, module_id);
+	if (idx >= 0)
+		ret = ida_is_empty(adev->mod_idas[idx]);
+
+	mutex_unlock(&adev->modres_mutex);
+	return ret;
+}
+
+/* Caller responsible for holding adev->modres_mutex. */
+static void avs_module_ida_destroy(struct avs_dev *adev)
+{
+	int i = adev->mods_info ? adev->mods_info->count : 0;
+
+	while (i--) {
+		ida_destroy(adev->mod_idas[i]);
+		kfree(adev->mod_idas[i]);
+	}
+	kfree(adev->mod_idas);
+}
+
+/* Caller responsible for holding adev->modres_mutex. */
+static int
+avs_module_ida_alloc(struct avs_dev *adev, struct avs_mods_info *newinfo, bool purge)
+{
+	struct avs_mods_info *oldinfo = adev->mods_info;
+	struct ida **ida_ptrs;
+	u32 tocopy_count = 0;
+	int i;
+
+	if (!purge && oldinfo) {
+		if (oldinfo->count >= newinfo->count)
+			dev_warn(adev->dev, "refreshing %d modules info with %d\n",
+				 oldinfo->count, newinfo->count);
+		tocopy_count = oldinfo->count;
+	}
+
+	ida_ptrs = kcalloc(newinfo->count, sizeof(*ida_ptrs), GFP_KERNEL);
+	if (!ida_ptrs)
+		return -ENOMEM;
+
+	if (tocopy_count)
+		memcpy(ida_ptrs, adev->mod_idas, tocopy_count * sizeof(*ida_ptrs));
+
+	for (i = tocopy_count; i < newinfo->count; i++) {
+		ida_ptrs[i] = kzalloc(sizeof(**ida_ptrs), GFP_KERNEL);
+		if (!ida_ptrs[i]) {
+			while (i--)
+				kfree(ida_ptrs[i]);
+
+			kfree(ida_ptrs);
+			return -ENOMEM;
+		}
+
+		ida_init(ida_ptrs[i]);
+	}
+
+	/* If old elements have been reused, don't wipe them. */
+	if (tocopy_count)
+		kfree(adev->mod_idas);
+	else
+		avs_module_ida_destroy(adev);
+
+	adev->mod_idas = ida_ptrs;
+	return 0;
+}
+
+int avs_module_info_init(struct avs_dev *adev, bool purge)
+{
+	struct avs_mods_info *info;
+	int ret;
+
+	ret = avs_ipc_get_modules_info(adev, &info);
+	if (ret)
+		return AVS_IPC_RET(ret);
+
+	mutex_lock(&adev->modres_mutex);
+
+	ret = avs_module_ida_alloc(adev, info, purge);
+	if (ret < 0) {
+		dev_err(adev->dev, "initialize module idas failed: %d\n", ret);
+		goto exit;
+	}
+
+	/* Refresh current information with newly received table. */
+	kfree(adev->mods_info);
+	adev->mods_info = info;
+
+exit:
+	mutex_unlock(&adev->modres_mutex);
+	return ret;
+}
+
+void avs_module_info_free(struct avs_dev *adev)
+{
+	mutex_lock(&adev->modres_mutex);
+
+	avs_module_ida_destroy(adev);
+	kfree(adev->mods_info);
+	adev->mods_info = NULL;
+
+	mutex_unlock(&adev->modres_mutex);
+}
+
+int avs_module_id_alloc(struct avs_dev *adev, u16 module_id)
+{
+	int ret, idx, max_id;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_id_entry_index(adev, module_id);
+	if (idx == -ENOENT) {
+		WARN(1, "invalid module id: %d", module_id);
+		ret = -EINVAL;
+		goto exit;
+	}
+	max_id = adev->mods_info->entries[idx].instance_max_count - 1;
+	ret = ida_alloc_max(adev->mod_idas[idx], max_id, GFP_KERNEL);
+exit:
+	mutex_unlock(&adev->modres_mutex);
+	return ret;
+}
+
+void avs_module_id_free(struct avs_dev *adev, u16 module_id, u8 instance_id)
+{
+	int idx;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_id_entry_index(adev, module_id);
+	if (idx == -ENOENT) {
+		WARN(1, "invalid module id: %d", module_id);
+		goto exit;
+	}
+
+	ida_free(adev->mod_idas[idx], instance_id);
+exit:
+	mutex_unlock(&adev->modres_mutex);
+}
+
+/*
+ * Once driver loads FW it should keep it in memory, so we are not affected
+ * by FW removal from filesystem or even worse by loading different FW at
+ * runtime suspend/resume.
+ */
+int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, const char *name)
+{
+	struct avs_fw_entry *entry;
+	int ret;
+
+	/* first check in list if it is not already loaded */
+	list_for_each_entry(entry, &adev->fw_list, node) {
+		if (!strcmp(name, entry->name)) {
+			*fw_p = entry->fw;
+			return 0;
+		}
+	}
+
+	/* FW is not loaded, let's load it now and add to the list */
+	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->name = kstrdup(name, GFP_KERNEL);
+	if (!entry->name) {
+		kfree(entry);
+		return -ENOMEM;
+	}
+
+	ret = request_firmware(&entry->fw, name, adev->dev);
+	if (ret < 0) {
+		kfree(entry->name);
+		kfree(entry);
+		return ret;
+	}
+
+	*fw_p = entry->fw;
+
+	list_add_tail(&entry->node, &adev->fw_list);
+
+	return 0;
+}
+
+void avs_release_firmwares(struct avs_dev *adev)
+{
+	struct avs_fw_entry *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &adev->fw_list, node) {
+		list_del(&entry->node);
+		release_firmware(entry->fw);
+		kfree(entry->name);
+		kfree(entry);
+	}
+}
-- 
2.25.1

