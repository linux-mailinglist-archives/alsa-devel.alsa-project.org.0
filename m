Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42613136D1
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 03:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C206A18AF;
	Sat,  4 May 2019 03:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C206A18AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556932006;
	bh=hTZSEHexeFReSKYsMRxKbta46W1jDOnHX68STR+XdQY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vi2OoXO04Nf+6yNXX2mtRt8n1rjxUo+xxWbCwv4Jsi1jG4vli3oQwJmuzjCTpyOeF
	 FT/G9zGhb9gyUZgni2/H1vY7DQjqWD6JOSkdGkNFuy1Pe09fU6rPlhxhBDISRj02dE
	 YzfEYe3gL13FsaC4LYV964LDctv/2Us3razgSK+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 338D5F89746;
	Sat,  4 May 2019 03:01:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A074AF89735; Sat,  4 May 2019 03:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22A88F8972D
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 03:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A88F8972D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 18:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="148114240"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga007.fm.intel.com with ESMTP; 03 May 2019 18:00:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 20:00:30 -0500
Message-Id: <20190504010030.29233-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 7/7] soundwire: intel: add debugfs register
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add debugfs file to dump the Intel SoundWire registers

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. The main change
is the use of scnprintf to avoid known issues with snprintf.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 115 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 4ac141730b13..7fb2cd6d5bb5 100644
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
@@ -98,6 +100,7 @@ struct sdw_intel {
 	struct sdw_cdns cdns;
 	int instance;
 	struct sdw_intel_link_res *res;
+	struct dentry *fs;
 };
 
 #define cdns_to_intel(_cdns) container_of(_cdns, struct sdw_intel, cdns)
@@ -161,6 +164,115 @@ static int intel_set_bit(void __iomem *base, int offset, u32 value, u32 mask)
 	return -EAGAIN;
 }
 
+/*
+ * debugfs
+ */
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
+static ssize_t intel_reg_read(struct file *file, char __user *user_buf,
+			      size_t count, loff_t *ppos)
+{
+	struct sdw_intel *sdw = file->private_data;
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
+	for (i = 0; i < 4; i++) {
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
+		for (j = 0; j < 8; j++) {
+			ret += intel_sprintf(s, false, buf, ret,
+					SDW_SHIM_PCMSYCHM(i, j));
+			ret += intel_sprintf(s, false, buf, ret,
+					SDW_SHIM_PCMSYCHC(i, j));
+		}
+
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_PDMSCAP(i));
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_IOCTL(i));
+		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTMCTL(i));
+	}
+
+	ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_WAKEEN);
+	ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_WAKESTS);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nALH\n");
+	for (i = 0; i < 8; i++)
+		ret += intel_sprintf(a, true, buf, ret, SDW_ALH_STRMZCFG(i));
+
+	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
+	kfree(buf);
+
+	return ret;
+}
+
+static const struct file_operations intel_reg_fops = {
+	.open = simple_open,
+	.read = intel_reg_read,
+	.llseek = default_llseek,
+};
+
+static void intel_debugfs_init(struct sdw_intel *sdw)
+{
+	struct dentry *root = sdw_bus_debugfs_get_root(sdw->cdns.bus.debugfs);
+
+	if (!root)
+		return;
+
+	sdw->fs = debugfs_create_dir("intel-sdw", root);
+	if (IS_ERR_OR_NULL(sdw->fs)) {
+		dev_err(sdw->cdns.dev, "debugfs root creation failed\n");
+		sdw->fs = NULL;
+		return;
+	}
+
+	debugfs_create_file("intel-registers", 0400, sdw->fs, sdw,
+			    &intel_reg_fops);
+
+	sdw_cdns_debugfs_init(&sdw->cdns, sdw->fs);
+}
+
+static void intel_debugfs_exit(struct sdw_intel *sdw)
+{
+	debugfs_remove_recursive(sdw->fs);
+}
+
 /*
  * shim ops
  */
@@ -890,6 +1002,8 @@ static int intel_probe(struct platform_device *pdev)
 		goto err_dai;
 	}
 
+	intel_debugfs_init(sdw);
+
 	return 0;
 
 err_dai:
@@ -906,6 +1020,7 @@ static int intel_remove(struct platform_device *pdev)
 
 	sdw = platform_get_drvdata(pdev);
 
+	intel_debugfs_exit(sdw);
 	free_irq(sdw->res->irq, sdw);
 	snd_soc_unregister_component(sdw->cdns.dev);
 	sdw_delete_bus_master(&sdw->cdns.bus);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
