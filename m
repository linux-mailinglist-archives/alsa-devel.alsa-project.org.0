Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F4046D204
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:19:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D95552615;
	Wed,  8 Dec 2021 12:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D95552615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962378;
	bh=gySp7/ZHvPYILt+ahxAosIe/fC7nPaMf+Y37VOX/8m4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TBlz6YFZuJ2bqABi+bnW9ANqAXnrcjVvlZNFoVRhj3VuFPVVsvLg93Rs81cZyAXV3
	 A+NtE7V4EB1wRYTK+OeNkU1VGHekcF8WxDKNf97+hY57KrT6Gj5xl7p9Mru/5AHqKK
	 PLSi0uYBaIQaaZ65KoZlVSlzjDEJBbx8zklKTzUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 550CFF805D8;
	Wed,  8 Dec 2021 12:12:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19F14F805CB; Wed,  8 Dec 2021 12:12:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4E4AF805B3
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4E4AF805B3
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548405"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548405"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600312"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:01 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 21/37] ASoC: Intel: avs: General code loading flow
Date: Wed,  8 Dec 2021 12:12:45 +0100
Message-Id: <20211208111301.1817725-22-cezary.rojewski@intel.com>
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

Code loading is a complex procedure and requires combined effort of DMA
and IPCs. With IPCs already in place, lay out ground for specific DMA
transfer operations.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile    |   3 +-
 sound/soc/intel/avs/avs.h       |  22 +++
 sound/soc/intel/avs/core.c      |  62 +++++++
 sound/soc/intel/avs/dsp.c       |  26 +++
 sound/soc/intel/avs/loader.c    | 307 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h |   6 +
 6 files changed, 425 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/core.c
 create mode 100644 sound/soc/intel/avs/loader.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 41a11506e5b8..31a51b08774d 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o topology.o path.o
+snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o topology.o path.o \
+		    core.o loader.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 45861db1a4c3..c34a2734f31e 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -10,12 +10,17 @@
 #define __SOUND_SOC_INTEL_AVS_H
 
 #include <linux/device.h>
+#include <linux/firmware.h>
 #include <sound/hda_codec.h>
+#include <sound/hda_register.h>
 #include <sound/soc-component.h>
 #include "messages.h"
+#include "registers.h"
 
 struct avs_dev;
 struct avs_tplg;
+struct avs_tplg_library;
+struct avs_soc_component;
 
 struct avs_dsp_ops {
 	int (* const power)(struct avs_dev *, u32, bool);
@@ -24,6 +29,10 @@ struct avs_dsp_ops {
 	irqreturn_t (* const irq_handler)(int, void *);
 	irqreturn_t (* const irq_thread)(int, void *);
 	void (* const int_control)(struct avs_dev *, bool);
+	int (* const load_basefw)(struct avs_dev *, struct firmware *);
+	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
+	int (* const transfer_mods)(struct avs_dev *, bool,
+				    struct avs_module_entry *, u32);
 };
 
 #define avs_dsp_op(adev, op, ...) \
@@ -37,6 +46,7 @@ struct avs_spec {
 	const char *name;
 
 	const struct avs_dsp_ops *const dops;
+	struct avs_fw_version min_fw_version; /* anything below is rejected */
 
 	const u32 core_init_mask;	/* used during DSP boot */
 	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
@@ -77,6 +87,7 @@ struct avs_dev {
 	struct ida ppl_ida;
 	struct list_head fw_list;
 	atomic_t *core_refs;
+	char **lib_names;
 
 	struct completion fw_ready;
 
@@ -206,6 +217,17 @@ int avs_dsp_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
 			    bool lp, u16 attributes, u8 *instance_id);
 int avs_dsp_delete_pipeline(struct avs_dev *adev, u8 instance_id);
 
+/* Firmware loading */
+
+void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable);
+void avs_hda_power_gating_enable(struct avs_dev *adev, bool enable);
+void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable);
+
+int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs,
+			   u32 num_libs);
+int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge);
+int avs_dsp_first_boot_firmware(struct avs_dev *adev);
+
 /* Soc component members */
 
 struct avs_soc_component {
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
new file mode 100644
index 000000000000..b240ef3bde4e
--- /dev/null
+++ b/sound/soc/intel/avs/core.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
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
+static void avs_hdac_clock_gating_enable(struct hdac_bus *bus, bool enable)
+{
+	u32 value;
+
+	value = enable ? AZX_CGCTL_MISCBDCGE_MASK : 0;
+	avs_hda_update_config_dword(bus, AZX_PCIREG_CGCTL,
+				    AZX_CGCTL_MISCBDCGE_MASK, value);
+}
+
+void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable)
+{
+	avs_hdac_clock_gating_enable(&adev->base.core, enable);
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
+void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable)
+{
+	u32 value;
+
+	value = enable ? AZX_VS_EM2_L1SEN : 0;
+	snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN, value);
+}
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index 5e6b0ecbd255..77d4ec939531 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -200,6 +200,7 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 			u16 *instance_id)
 {
 	struct avs_module_entry mentry;
+	bool was_loaded = false;
 	int ret, id;
 
 	id = avs_module_id_alloc(adev, module_id);
@@ -214,6 +215,16 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
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
@@ -225,6 +236,8 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 	return 0;
 
 err_ipc:
+	if (was_loaded)
+		avs_dsp_op(adev, transfer_mods, false, &mentry, 1);
 	avs_dsp_put_core(adev, core_id);
 err_mod_entry:
 	avs_module_id_free(adev, module_id, id);
@@ -234,12 +247,25 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
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
index 000000000000..bcacb7f60fce
--- /dev/null
+++ b/sound/soc/intel/avs/loader.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
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
+#include "topology.h"
+
+#define AVS_FW_INIT_TIMEOUT_MS		3000
+
+#define AVS_ROOT_DIR			"intel/avs"
+#define AVS_BASEFW_FILENAME		"dsp_basefw.bin"
+#define AVS_EXT_MANIFEST_MAGIC		0x31454124
+#define SKL_MANIFEST_MAGIC		0x00000006
+#define SKL_ADSPFW_OFFSET		0x284
+
+static bool debug_ignore_fw_version_check;
+module_param_named(ignore_fw_version, debug_ignore_fw_version_check, bool, 0444);
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
+		if (!debug_ignore_fw_version_check)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs,
+			   u32 num_libs)
+{
+	int start, id, i = 0;
+
+	/* Calculate the id to assign for the next lib. */
+	for (id = 0; id < adev->fw_cfg.max_libs_count; id++)
+		if (adev->lib_names[id][0] == '\0')
+			break;
+	if (id + num_libs >= adev->fw_cfg.max_libs_count)
+		return -EINVAL;
+
+	start = id;
+	while (i < num_libs) {
+		struct avs_fw_manifest *man;
+		const struct firmware *fw;
+		struct firmware stripped_fw;
+		char *filename;
+		int ret, j;
+
+		filename = kasprintf(GFP_KERNEL, "%s/%s/%s", AVS_ROOT_DIR,
+				     adev->spec->name, libs[i].name);
+		if (!filename)
+			return -ENOMEM;
+
+		ret = avs_request_firmware(adev, &fw, filename);
+		kfree(filename);
+		if (ret < 0)
+			return ret;
+
+		stripped_fw = *fw;
+		ret = avs_fw_manifest_strip_verify(adev, &stripped_fw, NULL);
+		if (ret) {
+			dev_err(adev->dev, "invalid library data: %d\n", ret);
+			return ret;
+		}
+
+		ret = avs_fw_manifest_offset(&stripped_fw);
+		if (ret < 0)
+			return ret;
+		man = (struct avs_fw_manifest *)(stripped_fw.data + ret);
+
+		/* Don't load anything that's already in DSP memory. */
+		for (j = 0; j < id; j++)
+			if (!strncmp(adev->lib_names[j], man->name,
+				     AVS_LIB_NAME_SIZE))
+				goto next_lib;
+
+		ret = avs_dsp_op(adev, load_lib, &stripped_fw, id);
+		if (ret)
+			return ret;
+
+		strncpy(adev->lib_names[id], man->name, AVS_LIB_NAME_SIZE);
+		id++;
+next_lib:
+		i++;
+	}
+
+	return start == id ? 1 : 0;
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
+	filename = kasprintf(GFP_KERNEL, "%s/%s/%s", AVS_ROOT_DIR, spec->name,
+			     AVS_BASEFW_FILENAME);
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
+		return ret;
+	}
+
+	ret = avs_dsp_op(adev, load_basefw, &stripped_fw);
+	if (ret < 0) {
+		dev_err(adev->dev, "basefw load failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&adev->fw_ready,
+					  msecs_to_jiffies(AVS_FW_INIT_TIMEOUT_MS));
+	if (!ret) {
+		dev_err(adev->dev, "firmware ready timeout\n");
+		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
+{
+	struct avs_soc_component *acomp;
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
+	if (ret)
+		goto reenable_gating;
+
+	mutex_lock(&adev->comp_list_mutex);
+	list_for_each_entry(acomp, &adev->comp_list, node) {
+		struct avs_tplg *tplg = acomp->tplg;
+
+		ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
+		if (ret < 0)
+			break;
+	}
+	mutex_unlock(&adev->comp_list_mutex);
+
+reenable_gating:
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
+		adev->lib_names[i] = devm_kzalloc(adev->dev, AVS_LIB_NAME_SIZE,
+						  GFP_KERNEL);
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
index 6bd7f2602cf8..4caa95aa3846 100644
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

