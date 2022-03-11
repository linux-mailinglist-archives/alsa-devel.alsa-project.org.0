Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC874D64BA
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:34:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C7C1A9C;
	Fri, 11 Mar 2022 16:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C7C1A9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647012867;
	bh=qBklkAYeOX9szcoeSb+hI7FY9ad68/jZnrbanD3Rrqk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mn1Kdbwq4A2xWmixl0Am6SZZA0Rwah5whGqO1SS42OUr9NehnS0UlSVSfZya5rc8t
	 c87StoHZj08NbY3gGcG/HcS8iry/Bw40IoCgfGWX5NcSpZMdmvPI/VJHYebO4TGnjA
	 511apI9MB+U/i56N/3NzhgOf6mW47+hPEsb46B90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34BE3F805C3;
	Fri, 11 Mar 2022 16:28:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61FA2F805C5; Fri, 11 Mar 2022 16:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C83EF802D2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C83EF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hfRj3XAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647012469; x=1678548469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qBklkAYeOX9szcoeSb+hI7FY9ad68/jZnrbanD3Rrqk=;
 b=hfRj3XADdS5QG5JHHCEIAWoYaW/I5r3WfObVyYndYBLsRa/AUGy5UkEW
 4PfrzPBlmb8AkiXxB3fKt/+2FsyAcHA8jEK+1UaRBUbF+Iknqz2DUg+W9
 aVoCInBstWyRFi/kIf/74T5qKBIoFN+92MKWy0f0yBhOVaYqDjnyPwufU
 IN3VmEqR8GvCgoamMenykf/qyxjGQlh2vzB76USZHRp2xHxNy+NFq+k/1
 io49ZIVpfVjDSppYTS/QBEBjWy9Lpu9l3fA4tXRXhaXo5bX9zVNFH37/w
 nhG6ryNH5grunU7Oe/ShPXyeFmAfxDyHAyvpv51OktdKTb7WnWt4ikbZK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318813309"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="318813309"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:27:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="514532724"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 07:27:43 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 03/17] ASoC: Intel: Introduce AVS driver
Date: Fri, 11 Mar 2022 16:35:30 +0100
Message-Id: <20220311153544.136854-4-cezary.rojewski@intel.com>
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

Declare base structures and core DSP operations for the avs solution.
The base structures describe PCI HDAudio bus device and platform-type
differentiations. First set of operations added controls the lifecycle
of any Audio DSP core: (un)powering, (un)resetting and (un)stalling.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig         |  11 ++++
 sound/soc/intel/Makefile        |   1 +
 sound/soc/intel/avs/Makefile    |   5 ++
 sound/soc/intel/avs/avs.h       |  71 +++++++++++++++++++++
 sound/soc/intel/avs/dsp.c       | 107 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h |  22 +++++++
 6 files changed, 217 insertions(+)
 create mode 100644 sound/soc/intel/avs/Makefile
 create mode 100644 sound/soc/intel/avs/avs.h
 create mode 100644 sound/soc/intel/avs/dsp.c
 create mode 100644 sound/soc/intel/avs/registers.h

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index f3a4a907b29d..e9768c4aa1a9 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -209,5 +209,16 @@ config SND_SOC_INTEL_KEEMBAY
 	  If you have a Intel Keembay platform then enable this option
 	  by saying Y or m.
 
+config SND_SOC_INTEL_AVS
+	tristate "Intel AVS driver"
+	depends on PCI && ACPI
+	depends on COMMON_CLK
+	select SND_SOC_ACPI
+	select SND_HDA_EXT_CORE
+	help
+	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
+	  capabilities. This includes Skylake, Kabylake, Amberlake and
+	  Apollolake.
+
 # ASoC codec drivers
 source "sound/soc/intel/boards/Kconfig"
diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
index 7c5038803be7..d44b2652c707 100644
--- a/sound/soc/intel/Makefile
+++ b/sound/soc/intel/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
 obj-$(CONFIG_SND_SOC_INTEL_CATPT) += catpt/
 obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += skylake/
 obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/
+obj-$(CONFIG_SND_SOC_INTEL_AVS) += avs/
 
 # Machine support
 obj-$(CONFIG_SND_SOC) += boards/
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
new file mode 100644
index 000000000000..5f7976a95fe2
--- /dev/null
+++ b/sound/soc/intel/avs/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+snd-soc-avs-objs := dsp.o
+
+obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
new file mode 100644
index 000000000000..2aefd1969644
--- /dev/null
+++ b/sound/soc/intel/avs/avs.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_H
+#define __SOUND_SOC_INTEL_AVS_H
+
+#include <linux/device.h>
+#include <sound/hda_codec.h>
+
+struct avs_dev;
+
+struct avs_dsp_ops {
+	int (* const power)(struct avs_dev *, u32, bool);
+	int (* const reset)(struct avs_dev *, u32, bool);
+	int (* const stall)(struct avs_dev *, u32, bool);
+};
+
+#define avs_dsp_op(adev, op, ...) \
+	((adev)->spec->dsp_ops->op(adev, ## __VA_ARGS__))
+
+#define avs_platattr_test(adev, attr) \
+	((adev)->spec->attributes & AVS_PLATATTR_##attr)
+
+/* Platform specific descriptor */
+struct avs_spec {
+	const char *name;
+
+	const struct avs_dsp_ops *const dsp_ops;
+
+	const u32 core_init_mask;	/* used during DSP boot */
+	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
+};
+
+/*
+ * struct avs_dev - Intel HD-Audio driver data
+ *
+ * @dev: PCI device
+ * @dsp_ba: DSP bar address
+ * @spec: platform-specific descriptor
+ */
+struct avs_dev {
+	struct hda_bus base;
+	struct device *dev;
+
+	void __iomem *dsp_ba;
+	const struct avs_spec *spec;
+};
+
+/* from hda_bus to avs_dev */
+#define hda_to_avs(hda) container_of(hda, struct avs_dev, base)
+/* from hdac_bus to avs_dev */
+#define hdac_to_avs(hdac) hda_to_avs(to_hda_bus(hdac))
+/* from device to avs_dev */
+#define to_avs_dev(dev) \
+({ \
+	struct hdac_bus *__bus = dev_get_drvdata(dev); \
+	hdac_to_avs(__bus); \
+})
+
+int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power);
+int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset);
+int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
+int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask);
+int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask);
+
+#endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
new file mode 100644
index 000000000000..63f5ce2698a2
--- /dev/null
+++ b/sound/soc/intel/avs/dsp.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/module.h>
+#include <sound/hdaudio_ext.h>
+#include "avs.h"
+#include "registers.h"
+
+#define AVS_ADSPCS_INTERVAL_US		500
+#define AVS_ADSPCS_TIMEOUT_US		50000
+
+int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power)
+{
+	u32 value, mask, reg;
+	int ret;
+
+	mask = AVS_ADSPCS_SPA_MASK(core_mask);
+	value = power ? mask : 0;
+
+	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
+
+	mask = AVS_ADSPCS_CPA_MASK(core_mask);
+	value = power ? mask : 0;
+
+	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
+				       reg, (reg & mask) == value,
+				       AVS_ADSPCS_INTERVAL_US,
+				       AVS_ADSPCS_TIMEOUT_US);
+	if (ret)
+		dev_err(adev->dev, "core_mask %d power %s failed: %d\n",
+			core_mask, power ? "on" : "off", ret);
+
+	return ret;
+}
+
+int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset)
+{
+	u32 value, mask, reg;
+	int ret;
+
+	mask = AVS_ADSPCS_CRST_MASK(core_mask);
+	value = reset ? mask : 0;
+
+	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
+
+	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
+				       reg, (reg & mask) == value,
+				       AVS_ADSPCS_INTERVAL_US,
+				       AVS_ADSPCS_TIMEOUT_US);
+	if (ret)
+		dev_err(adev->dev, "core_mask %d %s reset failed: %d\n",
+			core_mask, reset ? "enter" : "exit", ret);
+
+	return ret;
+}
+
+int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
+{
+	u32 value, mask, reg;
+	int ret;
+
+	mask = AVS_ADSPCS_CSTALL_MASK(core_mask);
+	value = stall ? mask : 0;
+
+	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
+
+	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
+				       reg, (reg & mask) == value,
+				       AVS_ADSPCS_INTERVAL_US,
+				       AVS_ADSPCS_TIMEOUT_US);
+	if (ret)
+		dev_err(adev->dev, "core_mask %d %sstall failed: %d\n",
+			core_mask, stall ? "" : "un", ret);
+
+	return ret;
+}
+
+int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask)
+{
+	int ret;
+
+	ret = avs_dsp_op(adev, power, core_mask, true);
+	if (ret)
+		return ret;
+
+	ret = avs_dsp_op(adev, reset, core_mask, false);
+	if (ret)
+		return ret;
+
+	return avs_dsp_op(adev, stall, core_mask, false);
+}
+
+int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask)
+{
+	/* No error checks to allow for complete DSP shutdown. */
+	avs_dsp_op(adev, stall, core_mask, true);
+	avs_dsp_op(adev, reset, core_mask, true);
+
+	return avs_dsp_op(adev, power, core_mask, false);
+}
+
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
new file mode 100644
index 000000000000..e6b49973bd8f
--- /dev/null
+++ b/sound/soc/intel/avs/registers.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_REGS_H
+#define __SOUND_SOC_INTEL_AVS_REGS_H
+
+/* Intel HD Audio General DSP Registers */
+#define AVS_ADSP_GEN_BASE		0x0
+#define AVS_ADSP_REG_ADSPCS		(AVS_ADSP_GEN_BASE + 0x04)
+
+#define AVS_ADSPCS_CRST_MASK(cm)	(cm)
+#define AVS_ADSPCS_CSTALL_MASK(cm)	((cm) << 8)
+#define AVS_ADSPCS_SPA_MASK(cm)		((cm) << 16)
+#define AVS_ADSPCS_CPA_MASK(cm)		((cm) << 24)
+#define AVS_MAIN_CORE_MASK		BIT(0)
+
+#endif /* __SOUND_SOC_INTEL_AVS_REGS_H */
-- 
2.25.1

