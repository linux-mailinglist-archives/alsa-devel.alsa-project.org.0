Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523A746D1DC
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC58A23E9;
	Wed,  8 Dec 2021 12:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC58A23E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962082;
	bh=4DmH5iX/a0CXWf4nOKFJU9XrvRAL8V/DRf244llffdo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QcN176b/HG70/2JNY6kmSX+Ol7OosBoVSB1rLs0mkhrLN+dzNnbua6A+ck5R8YFa7
	 NAEa2FGY86FkCnvHHayGDvSnTuJhUJfCuz7027LaniRGdtIAyC67UnEKbg9Er/Nfgp
	 DDZnGXZSrJiyHPD/6q9I0eARe/UH8wU6+wsU5pUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26756F80529;
	Wed,  8 Dec 2021 12:11:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6ABCF80528; Wed,  8 Dec 2021 12:11:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFA90F8051D
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA90F8051D
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="301192835"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="301192835"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:11:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600110"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:11:09 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 07/37] ASoC: Intel: Introduce AVS driver
Date: Wed,  8 Dec 2021 12:12:31 +0100
Message-Id: <20211208111301.1817725-8-cezary.rojewski@intel.com>
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

Declare base structures and core DSP operations for the avs solution.
The base structures describe PCI HDAudio bus device and platform-type
differentiations. First set of operations added controls the lifecycle
of any Audio DSP core: (un)powering, (un)resetting and (un)stalling.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig         |  14 +++++
 sound/soc/intel/Makefile        |   1 +
 sound/soc/intel/avs/Makefile    |   5 ++
 sound/soc/intel/avs/avs.h       |  64 +++++++++++++++++++
 sound/soc/intel/avs/dsp.c       | 107 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h |  22 +++++++
 6 files changed, 213 insertions(+)
 create mode 100644 sound/soc/intel/avs/Makefile
 create mode 100644 sound/soc/intel/avs/avs.h
 create mode 100644 sound/soc/intel/avs/dsp.c
 create mode 100644 sound/soc/intel/avs/registers.h

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index f3a4a907b29d..5b4941d88101 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -209,5 +209,19 @@ config SND_SOC_INTEL_KEEMBAY
 	  If you have a Intel Keembay platform then enable this option
 	  by saying Y or m.
 
+config SND_SOC_INTEL_AVS
+	tristate "Intel AVS driver"
+	depends on PCI && ACPI
+	depends on COMMON_CLK
+	depends on SND_SOC_INTEL_SKYLAKE_FAMILY=n
+	default n
+	select SND_SOC_ACPI
+	select SND_HDA_EXT_CORE
+	help
+	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
+	  capabilities. This includes Skylake, Kabylake, Amberlake and
+	  Apollolake. This option is mutually exclusive with SKYLAKE
+	  driver.
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
index 000000000000..7ece210b0777
--- /dev/null
+++ b/sound/soc/intel/avs/avs.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
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
+	((adev)->spec->dops->op(adev, ## __VA_ARGS__))
+
+#define avs_platattr_test(adev, attr) \
+	((adev)->spec->attributes & AVS_PLATATTR_##attr)
+
+/* Platform specific descriptor */
+struct avs_spec {
+	const char *name;
+
+	const struct avs_dsp_ops *const dops;
+
+	const u32 core_init_mask;	/* used during DSP boot */
+	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
+};
+
+struct avs_dev {
+	struct hda_bus base;
+	struct device *dev;
+
+	void __iomem *adsp_ba;
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
+int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool active);
+int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset);
+int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
+int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask);
+int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask);
+
+#endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
new file mode 100644
index 000000000000..258544277bbb
--- /dev/null
+++ b/sound/soc/intel/avs/dsp.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
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
+#define AVS_ADSPCS_TIMEOUT_US		10000
+
+int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool active)
+{
+	u32 value, mask, reg;
+	int ret;
+
+	mask = AVS_ADSPCS_SPA_MASK(core_mask);
+	value = active ? mask : 0;
+
+	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
+
+	mask = AVS_ADSPCS_CPA_MASK(core_mask);
+	value = active ? mask : 0;
+
+	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
+				       reg, (reg & mask) == value,
+				       AVS_ADSPCS_INTERVAL_US,
+				       AVS_ADSPCS_TIMEOUT_US);
+	if (ret)
+		dev_err(adev->dev, "core_mask %d %spower failed: %d\n",
+			core_mask, active ? "" : "un", ret);
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
+		dev_err(adev->dev, "core_mask %d %sreset failed: %d\n",
+			core_mask, reset ? "" : "un", ret);
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
+	/* Be permissive to allow for full DSP shutdown in disable path. */
+	avs_dsp_op(adev, stall, core_mask, true);
+	avs_dsp_op(adev, reset, core_mask, true);
+
+	return avs_dsp_op(adev, power, core_mask, false);
+}
+
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
new file mode 100644
index 000000000000..e0b6c8ffe633
--- /dev/null
+++ b/sound/soc/intel/avs/registers.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
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

