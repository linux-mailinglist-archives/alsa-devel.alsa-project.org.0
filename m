Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEA1702573
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:53:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57524857;
	Mon, 15 May 2023 08:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57524857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133627;
	bh=XvfbnjlaB9am2ZcV6awW54L+055YaQ1c356nRelvRBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uP2xEti2IlUjUyjA/mQ1UnBXi6D7l/QPzJ54YLHV7C6K6CLbeRr6wCkasfb2xgYDX
	 9IKCsKAN9AO/K6aWA+QoT70iqOL51qp0SJT8Yz4EcEfthp646Y8MLHaNyVfAXT0uz9
	 3nWgTnzs7UHQNwvNwV0voKTyBjhTHRP8DxtbXMJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B106F805D3; Mon, 15 May 2023 08:51:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2461FF805D4;
	Mon, 15 May 2023 08:51:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BE00F805BE; Mon, 15 May 2023 08:50:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7BA9F80431
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7BA9F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IOpe8aQ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133447; x=1715669447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XvfbnjlaB9am2ZcV6awW54L+055YaQ1c356nRelvRBE=;
  b=IOpe8aQ0QwbBXpw4NoEq2D+MPTTchtUp6TZ/an+7nbCjL7JafjfrB8Kg
   oJmKWftir2RyhqhZrjpqzzK7IJJXsVNFzPmD8mGmImsV6W/2r1mwnsWew
   9QrgGWCEH6u+T9TIfL05lftDIZMmyaODJ/AcKH16T/mHLYNlUYnqh1Ygr
   VRP9rsHie6Wggr4lWYIHzLjpYFS8BJzaoibb6aFLCz5KlWy3VMSo+LJ4e
   Rj7tVqiSK0Uj3kRKW/XAVvIyUnIxSlR0P0dA1CBTKevflZn5l++mHUODL
   4AYGUuh+gkEk/P8NwAt8hqfQ/fl//eltw6F96oeN2aJxYsKgHd55K2CRp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966373"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966373"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908683"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908683"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 10/26] soundwire: intel_ace2x: add debugfs support
Date: Mon, 15 May 2023 15:10:26 +0800
Message-Id: <20230515071042.2038-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YEXOCBPDTBHAZIH47ZSBZMGAISL33ARM
X-Message-ID-Hash: YEXOCBPDTBHAZIH47ZSBZMGAISL33ARM
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YEXOCBPDTBHAZIH47ZSBZMGAISL33ARM/>
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
index 5d612c9b6362..c3d3ab3262d3 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -24,7 +24,8 @@ soundwire-cadence-y := cadence_master.o
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

