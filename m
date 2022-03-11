Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA44D64B4
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:33:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4991119FE;
	Fri, 11 Mar 2022 16:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4991119FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647012797;
	bh=9PPiCUtIkqEjC4P3Fl3EIqpxK86Jp/gOqXOPnJ1cjFY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVf63n34uPoQxWJhr1uc9fgXyKxF9NzOwGJfFPxXiXb0BQy4omHSyqvbqI6EfQOps
	 YzLzdW06pRQcyCMr448rH0eC8KVkLMQ36K3AjTVWDgEeXMkR70G+rxA7ycvkfYr9zF
	 z6Zw/91Z+i5J78Rh5qPCZrirqCFTaWyh7G5/z8w8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1885F805B1;
	Fri, 11 Mar 2022 16:28:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69B07F805B0; Fri, 11 Mar 2022 16:28:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4FABF8057D
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:28:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4FABF8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gPo+lk+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647012508; x=1678548508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9PPiCUtIkqEjC4P3Fl3EIqpxK86Jp/gOqXOPnJ1cjFY=;
 b=gPo+lk+v/Ltr8o8ARWilIjoko2jCYMxUV3+xBcYRtQvhEUxdfuyTsSTx
 X8HFNOlhx/5k3nydrQGnAW/FQBg/QqZmCcMyIOPdzDWNXbd/Bg6GRwEww
 dg6KuaT9Pl8NpLfsPUF9KknWCHy2hE8K16kbvgkB0+uUjq0IJDzvolehR
 0+eusl4nIolFSwFVmF0UbDBwZknH5BokE8Y2TjELOb7BfGEyYUbjQYo3v
 fTRQF79SlMx1JGGRdRnoAoncjDXELMAtfQ+C/XyOTLZch87/kcDhD2Zi0
 cMN6eB05EvG1wF9vLAlSu2lRxTxk8EAC5htNn7MDl7nfhIXMGr6UYlktw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318813415"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="318813415"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:28:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="514532928"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 07:28:22 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 14/17] ASoC: Intel: avs: General code loading flow
Date: Fri, 11 Mar 2022 16:35:41 +0100
Message-Id: <20220311153544.136854-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311153544.136854-1-cezary.rojewski@intel.com>
References: <20220311153544.136854-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

Code loading is a complex procedure and requires combined effort of DMA
and IPCs. With IPCs already in place, lay out ground for specific DMA
transfer operations.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile    |   2 +-
 sound/soc/intel/avs/avs.h       |  17 +++
 sound/soc/intel/avs/core.c      |  61 +++++++++
 sound/soc/intel/avs/dsp.c       |  26 ++++
 sound/soc/intel/avs/loader.c    | 235 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h |   6 +
 6 files changed, 346 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/core.c
 create mode 100644 sound/soc/intel/avs/loader.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index d9f92c5f5407..d9c793160612 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o
+snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 17ef8b5de1df..c7e9be27be1e 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -10,8 +10,11 @@
 #define __SOUND_SOC_INTEL_AVS_H
 
 #include <linux/device.h>
+#include <linux/firmware.h>
 #include <sound/hda_codec.h>
+#include <sound/hda_register.h>
 #include "messages.h"
+#include "registers.h"
 
 struct avs_dev;
 
@@ -32,6 +35,9 @@ struct avs_dsp_ops {
 	irqreturn_t (* const irq_handler)(int, void *);
 	irqreturn_t (* const irq_thread)(int, void *);
 	void (* const int_control)(struct avs_dev *, bool);
+	int (* const load_basefw)(struct avs_dev *, struct firmware *);
+	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
+	int (* const transfer_mods)(struct avs_dev *, bool, struct avs_module_entry *, u32);
 };
 
 #define avs_dsp_op(adev, op, ...) \
@@ -45,6 +51,7 @@ struct avs_spec {
 	const char *name;
 
 	const struct avs_dsp_ops *const dsp_ops;
+	struct avs_fw_version min_fw_version; /* anything below is rejected */
 
 	const u32 core_init_mask;	/* used during DSP boot */
 	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
@@ -90,6 +97,7 @@ struct avs_dev {
 	struct ida ppl_ida;
 	struct list_head fw_list;
 	int *core_refs;		/* reference count per core */
+	char **lib_names;
 
 	struct completion fw_ready;
 };
@@ -215,4 +223,13 @@ int avs_dsp_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
 			    bool lp, u16 attributes, u8 *instance_id);
 int avs_dsp_delete_pipeline(struct avs_dev *adev, u8 instance_id);
 
+/* Firmware loading */
+
+void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable);
+void avs_hda_power_gating_enable(struct avs_dev *adev, bool enable);
+void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable);
+
+int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge);
+int avs_dsp_first_boot_firmware(struct avs_dev *adev);
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
new file mode 100644
index 000000000000..a4d063d12fec
--- /dev/null
+++ b/sound/soc/intel/avs/core.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+// Special thanks to:
+//    Krzysztof Hejmowski <krzysztof.hejmowski@intel.com>
+//    Michal Sienkiewicz <michal.sienkiewicz@intel.com>
+//    Filip Proborszcz
+//
+// for sharing Intel AudioDSP expertise and helping shape the very
+// foundation of this driver
+//
+
+#include <linux/pci.h>
+#include <sound/hdaudio.h>
+#include "avs.h"
+
+static void
+avs_hda_update_config_dword(struct hdac_bus *bus, u32 reg, u32 mask, u32 value)
+{
+	struct pci_dev *pci = to_pci_dev(bus->dev);
+	u32 data;
+
+	pci_read_config_dword(pci, reg, &data);
+	data &= ~mask;
+	data |= (value & mask);
+	pci_write_config_dword(pci, reg, data);
+}
+
+void avs_hda_power_gating_enable(struct avs_dev *adev, bool enable)
+{
+	u32 value;
+
+	value = enable ? 0 : AZX_PGCTL_LSRMD_MASK;
+	avs_hda_update_config_dword(&adev->base.core, AZX_PCIREG_PGCTL,
+				    AZX_PGCTL_LSRMD_MASK, value);
+}
+
+static void avs_hdac_clock_gating_enable(struct hdac_bus *bus, bool enable)
+{
+	u32 value;
+
+	value = enable ? AZX_CGCTL_MISCBDCGE_MASK : 0;
+	avs_hda_update_config_dword(bus, AZX_PCIREG_CGCTL, AZX_CGCTL_MISCBDCGE_MASK, value);
+}
+
+void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable)
+{
+	avs_hdac_clock_gating_enable(&adev->base.core, enable);
+}
+
+void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable)
+{
+	u32 value;
+
+	value = enable ? AZX_VS_EM2_L1SEN : 0;
+	snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN, value);
+}
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index 53925eae92b3..3ff17bd22a5a 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -198,6 +198,7 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 			u16 *instance_id)
 {
 	struct avs_module_entry mentry;
+	bool was_loaded = false;
 	int ret, id;
 
 	id = avs_module_id_alloc(adev, module_id);
@@ -212,6 +213,16 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 	if (ret)
 		goto err_mod_entry;
 
+	/* Load code into memory if this is the first instance. */
+	if (!id && !avs_module_entry_is_loaded(&mentry)) {
+		ret = avs_dsp_op(adev, transfer_mods, true, &mentry, 1);
+		if (ret) {
+			dev_err(adev->dev, "load modules failed: %d\n", ret);
+			goto err_mod_entry;
+		}
+		was_loaded = true;
+	}
+
 	ret = avs_ipc_init_instance(adev, module_id, id, ppl_instance_id,
 				    core_id, domain, param, param_size);
 	if (ret) {
@@ -223,6 +234,8 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 	return 0;
 
 err_ipc:
+	if (was_loaded)
+		avs_dsp_op(adev, transfer_mods, false, &mentry, 1);
 	avs_dsp_put_core(adev, core_id);
 err_mod_entry:
 	avs_module_id_free(adev, module_id, id);
@@ -232,12 +245,25 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u16 instance_id,
 			   u8 ppl_instance_id, u8 core_id)
 {
+	struct avs_module_entry mentry;
+	int ret;
+
 	/* Modules not owned by any pipeline need to be freed explicitly. */
 	if (ppl_instance_id == INVALID_PIPELINE_ID)
 		avs_ipc_delete_instance(adev, module_id, instance_id);
 
 	avs_module_id_free(adev, module_id, instance_id);
 
+	ret = avs_get_module_id_entry(adev, module_id, &mentry);
+	/* Unload occupied memory if this was the last instance. */
+	if (!ret && mentry.type.load_type == AVS_MODULE_LOAD_TYPE_LOADABLE) {
+		if (avs_is_module_ida_empty(adev, module_id)) {
+			ret = avs_dsp_op(adev, transfer_mods, false, &mentry, 1);
+			if (ret)
+				dev_err(adev->dev, "unload modules failed: %d\n", ret);
+		}
+	}
+
 	avs_dsp_put_core(adev, core_id);
 }
 
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
new file mode 100644
index 000000000000..96c979b44f60
--- /dev/null
+++ b/sound/soc/intel/avs/loader.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include "avs.h"
+#include "messages.h"
+#include "registers.h"
+
+#define AVS_FW_INIT_TIMEOUT_MS		3000
+
+#define AVS_ROOT_DIR			"intel/avs"
+#define AVS_BASEFW_FILENAME		"dsp_basefw.bin"
+#define AVS_EXT_MANIFEST_MAGIC		0x31454124
+#define SKL_MANIFEST_MAGIC		0x00000006
+#define SKL_ADSPFW_OFFSET		0x284
+
+/* Occasionally, engineering (release candidate) firmware is provided for testing. */
+static bool debug_ignore_fw_version;
+module_param_named(ignore_fw_version, debug_ignore_fw_version, bool, 0444);
+MODULE_PARM_DESC(ignore_fw_version, "Verify FW version 0=yes (default), 1=no");
+
+#define AVS_LIB_NAME_SIZE	8
+
+struct avs_fw_manifest {
+	u32 id;
+	u32 len;
+	char name[AVS_LIB_NAME_SIZE];
+	u32 preload_page_count;
+	u32 img_flags;
+	u32 feature_mask;
+	struct avs_fw_version version;
+} __packed;
+
+struct avs_fw_ext_manifest {
+	u32 id;
+	u32 len;
+	u16 version_major;
+	u16 version_minor;
+	u32 entries;
+} __packed;
+
+static int avs_fw_ext_manifest_strip(struct firmware *fw)
+{
+	struct avs_fw_ext_manifest *man;
+
+	if (fw->size < sizeof(*man))
+		return -EINVAL;
+
+	man = (struct avs_fw_ext_manifest *)fw->data;
+	if (man->id == AVS_EXT_MANIFEST_MAGIC) {
+		fw->data += man->len;
+		fw->size -= man->len;
+	}
+
+	return 0;
+}
+
+static int avs_fw_manifest_offset(struct firmware *fw)
+{
+	/* Header type found in first DWORD of fw binary. */
+	u32 magic = *(u32 *)fw->data;
+
+	switch (magic) {
+	case SKL_MANIFEST_MAGIC:
+		return SKL_ADSPFW_OFFSET;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int avs_fw_manifest_strip_verify(struct avs_dev *adev, struct firmware *fw,
+					const struct avs_fw_version *min)
+{
+	struct avs_fw_manifest *man;
+	int offset, ret;
+
+	ret = avs_fw_ext_manifest_strip(fw);
+	if (ret)
+		return ret;
+
+	offset = avs_fw_manifest_offset(fw);
+	if (offset < 0)
+		return offset;
+
+	if (fw->size < offset + sizeof(*man))
+		return -EINVAL;
+	if (!min)
+		return 0;
+
+	man = (struct avs_fw_manifest *)(fw->data + offset);
+	if (man->version.major != min->major ||
+	    man->version.minor != min->minor ||
+	    man->version.hotfix != min->hotfix ||
+	    man->version.build < min->build) {
+		dev_warn(adev->dev, "bad FW version %d.%d.%d.%d, expected %d.%d.%d.%d or newer\n",
+			 man->version.major, man->version.minor,
+			 man->version.hotfix, man->version.build,
+			 min->major, min->minor, min->hotfix, min->build);
+
+		if (!debug_ignore_fw_version)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int avs_dsp_load_basefw(struct avs_dev *adev)
+{
+	const struct avs_fw_version *min_req;
+	const struct avs_spec *const spec = adev->spec;
+	const struct firmware *fw;
+	struct firmware stripped_fw;
+	char *filename;
+	int ret;
+
+	filename = kasprintf(GFP_KERNEL, "%s/%s/%s", AVS_ROOT_DIR, spec->name, AVS_BASEFW_FILENAME);
+	if (!filename)
+		return -ENOMEM;
+
+	ret = avs_request_firmware(adev, &fw, filename);
+	kfree(filename);
+	if (ret < 0) {
+		dev_err(adev->dev, "request firmware failed: %d\n", ret);
+		return ret;
+	}
+
+	stripped_fw = *fw;
+	min_req = &adev->spec->min_fw_version;
+
+	ret = avs_fw_manifest_strip_verify(adev, &stripped_fw, min_req);
+	if (ret < 0) {
+		dev_err(adev->dev, "invalid firmware data: %d\n", ret);
+		goto release_fw;
+	}
+
+	ret = avs_dsp_op(adev, load_basefw, &stripped_fw);
+	if (ret < 0) {
+		dev_err(adev->dev, "basefw load failed: %d\n", ret);
+		goto release_fw;
+	}
+
+	ret = wait_for_completion_timeout(&adev->fw_ready,
+					  msecs_to_jiffies(AVS_FW_INIT_TIMEOUT_MS));
+	if (!ret) {
+		dev_err(adev->dev, "firmware ready timeout\n");
+		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
+		ret = -ETIMEDOUT;
+		goto release_fw;
+	}
+
+	return 0;
+
+release_fw:
+	avs_release_last_firmware(adev);
+	return ret;
+}
+
+int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
+{
+	int ret, i;
+
+	/* Full boot, clear cached data except for basefw (slot 0). */
+	for (i = 1; i < adev->fw_cfg.max_libs_count; i++)
+		memset(adev->lib_names[i], 0, AVS_LIB_NAME_SIZE);
+
+	avs_hda_clock_gating_enable(adev, false);
+	avs_hda_l1sen_enable(adev, false);
+
+	ret = avs_dsp_load_basefw(adev);
+
+	avs_hda_l1sen_enable(adev, true);
+	avs_hda_clock_gating_enable(adev, true);
+
+	if (ret < 0)
+		return ret;
+
+	/* With all code loaded, refresh module information. */
+	ret = avs_module_info_init(adev, true);
+	if (ret) {
+		dev_err(adev->dev, "init module info failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int avs_dsp_first_boot_firmware(struct avs_dev *adev)
+{
+	int ret, i;
+
+	ret = avs_dsp_boot_firmware(adev, true);
+	if (ret < 0) {
+		dev_err(adev->dev, "firmware boot failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = avs_ipc_get_hw_config(adev, &adev->hw_cfg);
+	if (ret) {
+		dev_err(adev->dev, "get hw cfg failed: %d\n", ret);
+		return AVS_IPC_RET(ret);
+	}
+
+	ret = avs_ipc_get_fw_config(adev, &adev->fw_cfg);
+	if (ret) {
+		dev_err(adev->dev, "get fw cfg failed: %d\n", ret);
+		return AVS_IPC_RET(ret);
+	}
+
+	adev->core_refs = devm_kcalloc(adev->dev, adev->hw_cfg.dsp_cores,
+				       sizeof(*adev->core_refs), GFP_KERNEL);
+	adev->lib_names = devm_kcalloc(adev->dev, adev->fw_cfg.max_libs_count,
+				       sizeof(*adev->lib_names), GFP_KERNEL);
+	if (!adev->core_refs || !adev->lib_names)
+		return -ENOMEM;
+
+	for (i = 0; i < adev->fw_cfg.max_libs_count; i++) {
+		adev->lib_names[i] = devm_kzalloc(adev->dev, AVS_LIB_NAME_SIZE, GFP_KERNEL);
+		if (!adev->lib_names[i])
+			return -ENOMEM;
+	}
+
+	/* basefw always occupies slot 0 */
+	strcpy(&adev->lib_names[0][0], "BASEFW");
+
+	ida_init(&adev->ppl_ida);
+
+	return 0;
+}
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 775701454a28..73699d46821b 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -9,6 +9,12 @@
 #ifndef __SOUND_SOC_INTEL_AVS_REGS_H
 #define __SOUND_SOC_INTEL_AVS_REGS_H
 
+#define AZX_PCIREG_PGCTL		0x44
+#define AZX_PCIREG_CGCTL		0x48
+#define AZX_PGCTL_LSRMD_MASK		BIT(4)
+#define AZX_CGCTL_MISCBDCGE_MASK	BIT(6)
+#define AZX_VS_EM2_L1SEN		BIT(13)
+
 /* Intel HD Audio General DSP Registers */
 #define AVS_ADSP_GEN_BASE		0x0
 #define AVS_ADSP_REG_ADSPCS		(AVS_ADSP_GEN_BASE + 0x04)
-- 
2.25.1

