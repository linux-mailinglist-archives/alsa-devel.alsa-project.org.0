Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACDFE0ED0
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 01:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC33C167D;
	Wed, 23 Oct 2019 01:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC33C167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571788701;
	bh=+yuF8AFWxGguM4Fdx7/hOD+JWMqkjNc32Vk2XVSU5P4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xrx8H1GC1JckMXYUjR9aKblZfPIzBO5moJFq21Jb/HKV+5C4VAztBSLdRo0Cgvf27
	 dHc1NB3BQWezPD6t/ts0Em4DRkX2tQDMvstZD0CBI9xqTWc8CqTeOEpdeVqrP5RC6c
	 zm6DZ4jVcACxjimY4Rokpm13Gxx24PnRMhZFYL0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 189D1F805FE;
	Wed, 23 Oct 2019 01:55:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33E6DF80539; Wed, 23 Oct 2019 01:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B743F8026A
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 01:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B743F8026A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 16:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,218,1569308400"; d="scan'208";a="196612839"
Received: from srajamoh-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.20.203])
 by fmsmga008.fm.intel.com with ESMTP; 22 Oct 2019 16:54:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 22 Oct 2019 18:54:44 -0500
Message-Id: <20191022235448.17586-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022235448.17586-1-pierre-louis.bossart@linux.intel.com>
References: <20191022235448.17586-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 1/5] soundwire: intel/cadence: fix startup
	sequence
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

Multiple changes squashed in single patch to avoid tick-tock effect
and avoid breaking compilation/bisect

1. Per the hardware documentation, all changes to MCP_CONFIG,
MCP_CONTROL, MCP_CMDCTRL and MCP_PHYCTRL need to be validated with a
self-clearing write to MCP_CONFIG_UPDATE. Add a helper and do the
update when the CONFIG is changed.

2. Move interrupt enable after interrupt handler registration

3. Add a new helper to start the hardware bus reset with maximum duration
to make sure the Slave(s) correctly detect the reset pattern and to
ensure electrical conflicts can be resolved.

4. flush command FIFOs

Better error handling will be provided after interrupt disable is
provided in follow-up patches.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 80 +++++++++++++++++++++---------
 drivers/soundwire/cadence_master.h |  1 +
 drivers/soundwire/intel.c          | 14 +++++-
 3 files changed, 69 insertions(+), 26 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index dbe386e179b4..5337ccacccd1 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -228,6 +228,22 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
 	return -EAGAIN;
 }
 
+/*
+ * all changes to the MCP_CONFIG, MCP_CONTROL, MCP_CMDCTRL and MCP_PHYCTRL
+ * need to be confirmed with a write to MCP_CONFIG_UPDATE
+ */
+static int cdns_update_config(struct sdw_cdns *cdns)
+{
+	int ret;
+
+	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE,
+			     CDNS_MCP_CONFIG_UPDATE_BIT);
+	if (ret < 0)
+		dev_err(cdns->dev, "Config update timedout\n");
+
+	return ret;
+}
+
 /*
  * debugfs
  */
@@ -745,7 +761,38 @@ EXPORT_SYMBOL(sdw_cdns_thread);
 /*
  * init routines
  */
-static int _cdns_enable_interrupt(struct sdw_cdns *cdns)
+
+/**
+ * sdw_cdns_exit_reset() - Program reset parameters and start bus operations
+ * @cdns: Cadence instance
+ */
+int sdw_cdns_exit_reset(struct sdw_cdns *cdns)
+{
+	/* program maximum length reset to be safe */
+	cdns_updatel(cdns, CDNS_MCP_CONTROL,
+		     CDNS_MCP_CONTROL_RST_DELAY,
+		     CDNS_MCP_CONTROL_RST_DELAY);
+
+	/* use hardware generated reset */
+	cdns_updatel(cdns, CDNS_MCP_CONTROL,
+		     CDNS_MCP_CONTROL_HW_RST,
+		     CDNS_MCP_CONTROL_HW_RST);
+
+	/* enable bus operations with clock and data */
+	cdns_updatel(cdns, CDNS_MCP_CONFIG,
+		     CDNS_MCP_CONFIG_OP,
+		     CDNS_MCP_CONFIG_OP_NORMAL);
+
+	/* commit changes */
+	return cdns_update_config(cdns);
+}
+EXPORT_SYMBOL(sdw_cdns_exit_reset);
+
+/**
+ * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
+ * @cdns: Cadence instance
+ */
+int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
 {
 	u32 mask;
 
@@ -777,24 +824,8 @@ static int _cdns_enable_interrupt(struct sdw_cdns *cdns)
 
 	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
 
-	return 0;
-}
-
-/**
- * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
- * @cdns: Cadence instance
- */
-int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
-{
-	int ret;
-
-	_cdns_enable_interrupt(cdns);
-	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE,
-			     CDNS_MCP_CONFIG_UPDATE_BIT);
-	if (ret < 0)
-		dev_err(cdns->dev, "Config update timedout\n");
-
-	return ret;
+	/* commit changes */
+	return cdns_update_config(cdns);
 }
 EXPORT_SYMBOL(sdw_cdns_enable_interrupt);
 
@@ -955,6 +986,10 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 	cdns_writel(cdns, CDNS_MCP_SSP_CTRL0, CDNS_DEFAULT_SSP_INTERVAL);
 	cdns_writel(cdns, CDNS_MCP_SSP_CTRL1, CDNS_DEFAULT_SSP_INTERVAL);
 
+	/* flush command FIFOs */
+	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_RST,
+		     CDNS_MCP_CONTROL_CMD_RST);
+
 	/* Set cmd accept mode */
 	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_ACCEPT,
 		     CDNS_MCP_CONTROL_CMD_ACCEPT);
@@ -977,13 +1012,10 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 	/* Set cmd mode for Tx and Rx cmds */
 	val &= ~CDNS_MCP_CONFIG_CMD;
 
-	/* Set operation to normal */
-	val &= ~CDNS_MCP_CONFIG_OP;
-	val |= CDNS_MCP_CONFIG_OP_NORMAL;
-
 	cdns_writel(cdns, CDNS_MCP_CONFIG, val);
 
-	return 0;
+	/* commit changes */
+	return cdns_update_config(cdns);
 }
 EXPORT_SYMBOL(sdw_cdns_init);
 
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index fbabd8afd3f5..6199e71edeab 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -141,6 +141,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id);
 int sdw_cdns_init(struct sdw_cdns *cdns);
 int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 		      struct sdw_cdns_stream_config config);
+int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
 int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index c984261fcc33..748f832e14f6 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -953,8 +953,6 @@ static int intel_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_init;
 
-	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
-
 	/* Read the PDI config and initialize cadence PDI */
 	intel_pdi_init(sdw, &config);
 	ret = sdw_cdns_pdi_init(&sdw->cdns, config);
@@ -972,6 +970,18 @@ static int intel_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
+	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
+	if (ret < 0) {
+		dev_err(sdw->cdns.dev, "cannot enable interrupts\n");
+		goto err_init;
+	}
+
+	ret = sdw_cdns_exit_reset(&sdw->cdns);
+	if (ret < 0) {
+		dev_err(sdw->cdns.dev, "unable to exit bus reset sequence\n");
+		goto err_init;
+	}
+
 	/* Register DAIs */
 	ret = intel_register_dai(sdw);
 	if (ret) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
