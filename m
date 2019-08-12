Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C72A8ABBB
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 02:03:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1899D1675;
	Tue, 13 Aug 2019 02:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1899D1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565654613;
	bh=YuDLu7mIpfWkZRcjwu9cUNrXTHZXGhQGcjX3REi3u0M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDzLQnVHREpbRTKRhvhvbq38nhfZDWeLZMYZjsbS8iOdUjlGA9d0Pakp7h95jxJlR
	 0L7zjd/Int3PXL/EMVWcaOdOagz89nb0zbcy/uV6SX6UEJZQl4snwnolzSm7l2y3fq
	 niilP+gcb4yvzNX1nzt1lSy9j7m9VlBUztiwD4XI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97014F805F9;
	Tue, 13 Aug 2019 02:00:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27504F80518; Tue, 13 Aug 2019 02:00:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7A88F8015B
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 01:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7A88F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 16:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,379,1559545200"; d="scan'208";a="177639042"
Received: from firin-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.252.205.59])
 by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2019 16:59:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 12 Aug 2019 18:59:42 -0500
Message-Id: <20190812235942.7120-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
References: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v2 3/3] soundwire: intel: add debugfs register
	dump
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add debugfs file to dump the Intel SoundWire registers

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 121 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index c82ca4e13de7..db3b6afd2f63 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -16,6 +17,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
 #include "cadence_master.h"
+#include "bus.h"
 #include "intel.h"
 
 /* Intel SHIM Registers Definition */
@@ -83,6 +85,7 @@
 
 /* Intel ALH Register definitions */
 #define SDW_ALH_STRMZCFG(x)		(0x000 + (0x4 * (x)))
+#define SDW_ALH_NUM_STREAMS		64
 
 #define SDW_ALH_STRMZCFG_DMAT_VAL	0x3
 #define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
@@ -98,6 +101,9 @@ struct sdw_intel {
 	struct sdw_cdns cdns;
 	int instance;
 	struct sdw_intel_link_res *res;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs;
+#endif
 };
 
 #define cdns_to_intel(_cdns) container_of(_cdns, struct sdw_intel, cdns)
@@ -161,6 +167,118 @@ static int intel_set_bit(void __iomem *base, int offset, u32 value, u32 mask)
 	return -EAGAIN;
 }
 
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
+	void __iomem *s = sdw->res->shim;
+	void __iomem *a = sdw->res->alh;
+	char *buf;
+	ssize_t ret;
+	int i, j;
+	unsigned int links, reg;
+
+	buf = kzalloc(RD_BUF, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	links = intel_readl(s, SDW_SHIM_LCAP) & GENMASK(2, 0);
+
+	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nShim\n");
+
+	for (i = 0; i < links; i++) {
+		reg = SDW_SHIM_LCAP + i * 4;
+		ret += intel_sprintf(s, true, buf, ret, reg);
+	}
+
+	for (i = 0; i < links; i++) {
+		ret += scnprintf(buf + ret, RD_BUF - ret, "\nLink%d\n", i);
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLSCAP(i));
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLS0CM(i));
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLS1CM(i));
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLS2CM(i));
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLS3CM(i));
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_PCMSCAP(i));
+
+		ret += scnprintf(buf + ret, RD_BUF - ret, "\n PCMSyCH registers\n");
+
+		/*
+		 * the value 10 is the number of PDIs. We will need a
+		 * cleanup to remove hard-coded Intel configurations
+		 * from cadence_master.c
+		 */
+		for (j = 0; j < 10; j++) {
+			ret += intel_sprintf(s, false, buf, ret,
+					SDW_SHIM_PCMSYCHM(i, j));
+			ret += intel_sprintf(s, false, buf, ret,
+					SDW_SHIM_PCMSYCHC(i, j));
+		}
+		ret += scnprintf(buf + ret, RD_BUF - ret, "\n PDMSCAP, IOCTL, CTMCTL\n");
+
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_PDMSCAP(i));
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_IOCTL(i));
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTMCTL(i));
+	}
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nWake registers\n");
+	ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_WAKEEN);
+	ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_WAKESTS);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nALH STRMzCFG\n");
+	for (i = 0; i < SDW_ALH_NUM_STREAMS; i++)
+		ret += intel_sprintf(a, true, buf, ret, SDW_ALH_STRMZCFG(i));
+
+	seq_printf(s_file, "%s", buf);
+	kfree(buf);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(intel_reg);
+
+static void intel_debugfs_init(struct sdw_intel *sdw)
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
+	sdw_cdns_debugfs_init(&sdw->cdns, sdw->debugfs);
+}
+
+static void intel_debugfs_exit(struct sdw_intel *sdw)
+{
+	debugfs_remove_recursive(sdw->debugfs);
+}
+#else
+static void intel_debugfs_init(struct sdw_intel *sdw) {}
+static void intel_debugfs_exit(struct sdw_intel *sdw) {}
+#endif /* CONFIG_DEBUG_FS */
+
 /*
  * shim ops
  */
@@ -885,6 +1003,8 @@ static int intel_probe(struct platform_device *pdev)
 		goto err_dai;
 	}
 
+	intel_debugfs_init(sdw);
+
 	return 0;
 
 err_dai:
@@ -901,6 +1021,7 @@ static int intel_remove(struct platform_device *pdev)
 
 	sdw = platform_get_drvdata(pdev);
 
+	intel_debugfs_exit(sdw);
 	free_irq(sdw->res->irq, sdw);
 	snd_soc_unregister_component(sdw->cdns.dev);
 	sdw_delete_bus_master(&sdw->cdns.bus);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
