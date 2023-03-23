Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F446C5EFB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:35:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2CF7ED3;
	Thu, 23 Mar 2023 06:34:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2CF7ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549719;
	bh=i8UIQbcY1RfdSYTZStIqpYEudpa7eTQXB2/ovkpVbLI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YZu3jiOJfcFnZZ/1nE8fsWjNRu7HwwQKdJ8/GrpufcwlmrEFAOUXQj1NHrjgt+fFP
	 YCGgctTeaGKiXyydHaQLge/V4rP8YQVTe+n2sFwY9rRtfXtzVnRzAe2xvIdegvns67
	 6+neoUNz5ybVvSbwfCiWCxJeKoKTXnGuGo5B9PZE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E80ECF80558;
	Thu, 23 Mar 2023 06:32:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 919D8F80549; Thu, 23 Mar 2023 06:30:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C6CEF80527
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C6CEF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OsMALcgX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549425; x=1711085425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i8UIQbcY1RfdSYTZStIqpYEudpa7eTQXB2/ovkpVbLI=;
  b=OsMALcgXPUDnUaXLEzq88E8SHw+3/3QI+Q0x++APCLPLN0R4knm+vmIW
   2ETJ+he7uPm85DBhOKsmmjlfMED3YFngDtExXTQcRtj023AA0wyElB+Z+
   dsMs9pdYQlKHAXX0YzM0VL+hzxYAbLvKEciY9nVteXhkz5hbntdg7GbUP
   jI+8+ouNV/mCqCBdF5BDcXnSaXUVhhEwUW5wza3M2AuWiuO3vP274Acp+
   ohzLZoHd59zEgLNOgDd7Q/cGI1STcZKF9LeCB5rRTMzZGA3QVY/UPVuXy
   P6iakbYHbQb4L4kWXX2iXNFdxk3hoOUaMfHhqAxz/0CeCgj6GO6YwjRyV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779400"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779400"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567094"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567094"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 10/20] soundwire: intel_ace2x: add debugfs support
Date: Thu, 23 Mar 2023 13:44:42 +0800
Message-Id: <20230323054452.1543233-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ICOFGGM54QH4FOXP7LW54LM2QTT2CIGY
X-Message-ID-Hash: ICOFGGM54QH4FOXP7LW54LM2QTT2CIGY
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICOFGGM54QH4FOXP7LW54LM2QTT2CIGY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add access to registers in SHIM and SHIM_VS (vendor-specific) areas.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/Makefile              |   3 +-
 drivers/soundwire/intel.h               |   8 ++
 drivers/soundwire/intel_ace2x.c         |   2 +
 drivers/soundwire/intel_ace2x_debugfs.c | 147 ++++++++++++++++++++++++
 4 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soundwire/intel_ace2x_debugfs.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index d7212777a927..c57571c82e04 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -20,7 +20,8 @@ soundwire-cadence-y := cadence_master.o
 obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
 
 #Intel driver
-soundwire-intel-y :=	intel.o  intel_ace2x.o intel_auxdevice.o intel_init.o dmi-quirks.o \
+soundwire-intel-y :=	intel.o intel_ace2x.o intel_ace2x_debugfs.o \
+			intel_auxdevice.o intel_init.o dmi-quirks.o \
 			intel_bus_common.o
 obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o
 
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index cf9db4906de4..511932c55216 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -95,6 +95,14 @@ static inline void intel_writew(void __iomem *base, int offset, u16 value)
 					 (sdw)->link_res->hw_ops->cb)
 #define SDW_INTEL_OPS(sdw, cb)		((sdw)->link_res->hw_ops->cb)
 
+#ifdef CONFIG_DEBUG_FS
+void intel_ace2x_debugfs_init(struct sdw_intel *sdw);
+void intel_ace2x_debugfs_exit(struct sdw_intel *sdw);
+#else
+static inline void intel_ace2x_debugfs_init(struct sdw_intel *sdw) {}
+static inline void intel_ace2x_debugfs_exit(struct sdw_intel *sdw) {}
+#endif
+
 static inline void sdw_intel_debugfs_init(struct sdw_intel *sdw)
 {
 	if (SDW_INTEL_CHECK_OPS(sdw, debugfs_init))
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 623e4fd7db91..1c47bb2adb93 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -15,5 +15,7 @@
 #include "intel.h"
 
 const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
+	.debugfs_init = intel_ace2x_debugfs_init,
+	.debugfs_exit = intel_ace2x_debugfs_exit,
 };
 EXPORT_SYMBOL_NS(sdw_intel_lnl_hw_ops, SOUNDWIRE_INTEL);
diff --git a/drivers/soundwire/intel_ace2x_debugfs.c b/drivers/soundwire/intel_ace2x_debugfs.c
new file mode 100644
index 000000000000..3d24661ffd37
--- /dev/null
+++ b/drivers/soundwire/intel_ace2x_debugfs.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2023 Intel Corporation. All rights reserved.
+
+#include <linux/acpi.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/pm_runtime.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_intel.h>
+#include <linux/soundwire/sdw_registers.h>
+#include "bus.h"
+#include "cadence_master.h"
+#include "intel.h"
+
+/*
+ * debugfs
+ */
+#ifdef CONFIG_DEBUG_FS
+
+#define RD_BUF (2 * PAGE_SIZE)
+
+static ssize_t intel_sprintf(void __iomem *mem, bool l,
+			     char *buf, size_t pos, unsigned int reg)
+{
+	int value;
+
+	if (l)
+		value = intel_readl(mem, reg);
+	else
+		value = intel_readw(mem, reg);
+
+	return scnprintf(buf + pos, RD_BUF - pos, "%4x\t%4x\n", reg, value);
+}
+
+static int intel_reg_show(struct seq_file *s_file, void *data)
+{
+	struct sdw_intel *sdw = s_file->private;
+	void __iomem *s = sdw->link_res->shim;
+	void __iomem *vs_s = sdw->link_res->shim_vs;
+	ssize_t ret;
+	u32 pcm_cap;
+	int pcm_bd;
+	char *buf;
+	int j;
+
+	buf = kzalloc(RD_BUF, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nShim\n");
+
+	ret += intel_sprintf(s, true, buf, ret, SDW_SHIM2_LECAP);
+	ret += intel_sprintf(s, false, buf, ret, SDW_SHIM2_PCMSCAP);
+
+	pcm_cap = intel_readw(s, SDW_SHIM2_PCMSCAP);
+	pcm_bd = FIELD_GET(SDW_SHIM2_PCMSCAP_BSS, pcm_cap);
+
+	for (j = 0; j < pcm_bd; j++) {
+		ret += intel_sprintf(s, false, buf, ret,
+				SDW_SHIM2_PCMSYCHM(j));
+		ret += intel_sprintf(s, false, buf, ret,
+				SDW_SHIM2_PCMSYCHC(j));
+	}
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nVS CLK controls\n");
+	ret += intel_sprintf(vs_s, true, buf, ret, SDW_SHIM2_INTEL_VS_LVSCTL);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nVS Wake registers\n");
+	ret += intel_sprintf(vs_s, false, buf, ret, SDW_SHIM2_INTEL_VS_WAKEEN);
+	ret += intel_sprintf(vs_s, false, buf, ret, SDW_SHIM2_INTEL_VS_WAKESTS);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nVS IOCTL, ACTMCTL\n");
+	ret += intel_sprintf(vs_s, false, buf, ret, SDW_SHIM2_INTEL_VS_IOCTL);
+	ret += intel_sprintf(vs_s, false, buf, ret, SDW_SHIM2_INTEL_VS_ACTMCTL);
+
+	seq_printf(s_file, "%s", buf);
+	kfree(buf);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(intel_reg);
+
+static int intel_set_m_datamode(void *data, u64 value)
+{
+	struct sdw_intel *sdw = data;
+	struct sdw_bus *bus = &sdw->cdns.bus;
+
+	if (value > SDW_PORT_DATA_MODE_STATIC_1)
+		return -EINVAL;
+
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	bus->params.m_data_mode = value;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(intel_set_m_datamode_fops, NULL,
+			 intel_set_m_datamode, "%llu\n");
+
+static int intel_set_s_datamode(void *data, u64 value)
+{
+	struct sdw_intel *sdw = data;
+	struct sdw_bus *bus = &sdw->cdns.bus;
+
+	if (value > SDW_PORT_DATA_MODE_STATIC_1)
+		return -EINVAL;
+
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	bus->params.s_data_mode = value;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(intel_set_s_datamode_fops, NULL,
+			 intel_set_s_datamode, "%llu\n");
+
+void intel_ace2x_debugfs_init(struct sdw_intel *sdw)
+{
+	struct dentry *root = sdw->cdns.bus.debugfs;
+
+	if (!root)
+		return;
+
+	sdw->debugfs = debugfs_create_dir("intel-sdw", root);
+
+	debugfs_create_file("intel-registers", 0400, sdw->debugfs, sdw,
+			    &intel_reg_fops);
+
+	debugfs_create_file("intel-m-datamode", 0200, sdw->debugfs, sdw,
+			    &intel_set_m_datamode_fops);
+
+	debugfs_create_file("intel-s-datamode", 0200, sdw->debugfs, sdw,
+			    &intel_set_s_datamode_fops);
+
+	sdw_cdns_debugfs_init(&sdw->cdns, sdw->debugfs);
+}
+
+void intel_ace2x_debugfs_exit(struct sdw_intel *sdw)
+{
+	debugfs_remove_recursive(sdw->debugfs);
+}
+#endif /* CONFIG_DEBUG_FS */
-- 
2.25.1

