Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0410188635
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 00:47:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 967F6165F;
	Sat, 10 Aug 2019 00:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 967F6165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565390833;
	bh=3QOa0kVoIM5YfK91bhm87Y+pjiMMmTBpmpZ131uUEvo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=coIEZWo2CaBw4/WM+RuyLZ9zBc7s7TOIBXMF1fz9fCqoJlpveS2GGuLR3vU49ygDu
	 C8WBlsr8JiGI4abTO7Ha2AZWa8H4tytU+o9XA+BMmNGWVrTjQz8NDY9SypruLLQheh
	 LD/bsyeQmuZ+PZuTYOuWnU/FQ/H8cWsKCAVPVdBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20466F805E2;
	Sat, 10 Aug 2019 00:44:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C4CAF805E1; Sat, 10 Aug 2019 00:44:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12AD0F804CA
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 00:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12AD0F804CA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 15:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,367,1559545200"; d="scan'208";a="175279579"
Received: from rmmeyer-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.252.138.140])
 by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2019 15:43:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 17:43:40 -0500
Message-Id: <20190809224341.15726-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809224341.15726-1-pierre-louis.bossart@linux.intel.com>
References: <20190809224341.15726-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 2/3] soundwire: cadence_master: add debugfs
	register dump
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

Add debugfs file to dump the Cadence master registers

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 104 +++++++++++++++++++++++++++++
 drivers/soundwire/cadence_master.h |   2 +
 2 files changed, 106 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 665632dbdeb5..4c65b78adcf9 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -8,6 +8,7 @@
 
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -223,6 +224,109 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
 	return -EAGAIN;
 }
 
+/*
+ * debugfs
+ */
+
+#define RD_BUF (2 * PAGE_SIZE)
+
+static ssize_t cdns_sprintf(struct sdw_cdns *cdns,
+			    char *buf, size_t pos, unsigned int reg)
+{
+	return scnprintf(buf + pos, RD_BUF - pos,
+			 "%4x\t%8x\n", reg, cdns_readl(cdns, reg));
+}
+
+static int cdns_reg_show(struct seq_file *s, void *data)
+{
+	struct sdw_cdns *cdns = s->private;
+	char *buf;
+	ssize_t ret;
+	int num_ports;
+	int i, j;
+
+	buf = kzalloc(RD_BUF, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nMCP Registers\n");
+	/* 8 MCP registers */
+	for (i = CDNS_MCP_CONFIG; i <= CDNS_MCP_PHYCTRL; i += sizeof(u32))
+		ret += cdns_sprintf(cdns, buf, ret, i);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret,
+			 "\nStatus & Intr Registers\n");
+	/* 13 Status & Intr registers (offsets 0x70 and 0x74 not defined) */
+	for (i = CDNS_MCP_STAT; i <=  CDNS_MCP_FIFOSTAT; i += sizeof(u32))
+		ret += cdns_sprintf(cdns, buf, ret, i);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret,
+			 "\nSSP & Clk ctrl Registers\n");
+	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_SSP_CTRL0);
+	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_SSP_CTRL1);
+	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_CLK_CTRL0);
+	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_CLK_CTRL1);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret,
+			 "\nDPn B0 Registers\n");
+
+	/*
+	 * in sdw_cdns_pdi_init() we filter out the Bulk PDIs,
+	 * so the indices need to be corrected again
+	 */
+	num_ports = cdns->num_ports + CDNS_PCM_PDI_OFFSET;
+
+	for (i = 0; i < num_ports; i++) {
+		ret += scnprintf(buf + ret, RD_BUF - ret,
+				 "\nDP-%d\n", i);
+		for (j = CDNS_DPN_B0_CONFIG(i);
+		     j < CDNS_DPN_B0_ASYNC_CTRL(i); j += sizeof(u32))
+			ret += cdns_sprintf(cdns, buf, ret, j);
+	}
+
+	ret += scnprintf(buf + ret, RD_BUF - ret,
+			 "\nDPn B1 Registers\n");
+	for (i = 0; i < num_ports; i++) {
+		ret += scnprintf(buf + ret, RD_BUF - ret,
+				 "\nDP-%d\n", i);
+
+		for (j = CDNS_DPN_B1_CONFIG(i);
+		     j < CDNS_DPN_B1_ASYNC_CTRL(i); j += sizeof(u32))
+			ret += cdns_sprintf(cdns, buf, ret, j);
+	}
+
+	ret += scnprintf(buf + ret, RD_BUF - ret,
+			 "\nDPn Control Registers\n");
+	for (i = 0; i < num_ports; i++)
+		ret += cdns_sprintf(cdns, buf, ret,
+				CDNS_PORTCTRL + i * CDNS_PORT_OFFSET);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret,
+			 "\nPDIn Config Registers\n");
+
+	/* number of PDI and ports is interchangeable */
+	for (i = 0; i < num_ports; i++)
+		ret += cdns_sprintf(cdns, buf, ret, CDNS_PDI_CONFIG(i));
+
+	seq_printf(s, "%s", buf);
+	kfree(buf);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(cdns_reg);
+
+/**
+ * sdw_cdns_debugfs_init() - Cadence debugfs init
+ * @cdns: Cadence instance
+ * @root: debugfs root
+ */
+void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
+{
+	debugfs_create_file("cdns-registers", 0400, root, cdns, &cdns_reg_fops);
+}
+EXPORT_SYMBOL_GPL(sdw_cdns_debugfs_init);
+
 /*
  * IO Calls
  */
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index fe2af62958b1..c0bf6ff00a44 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -163,6 +163,8 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 		      struct sdw_cdns_stream_config config);
 int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
 
+void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
+
 int sdw_cdns_get_stream(struct sdw_cdns *cdns,
 			struct sdw_cdns_streams *stream,
 			u32 ch, u32 dir);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
