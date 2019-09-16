Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D3CB40EF
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 21:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2544B1672;
	Mon, 16 Sep 2019 21:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2544B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568661315;
	bh=DOGp6ovxSNuUtwlCY88ObrtIcZ5S/CByvEEeyQ+++o4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TxeoonR5lOVSyH9t2bNiUDi76z0hRzQHhdkzOvppiXfMtMo5SH634d5FHeINeay40
	 ZirAGSmhkK3MjoX2ggYeT4w5eAdbQPmBb+IjmJ0eM2NV46CAVcjbursVsoqpZlwpKG
	 q8712NKQXLewAAdVf9dBg7Un14lBZ7iTfRXjgsQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF740F80636;
	Mon, 16 Sep 2019 21:10:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBB0BF805FC; Mon, 16 Sep 2019 21:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23C14F80534
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 21:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C14F80534
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 12:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; d="scan'208";a="191161749"
Received: from jvhicko1-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.104.227])
 by orsmga006.jf.intel.com with ESMTP; 16 Sep 2019 12:10:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 16 Sep 2019 14:09:50 -0500
Message-Id: <20190916190952.32388-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916190952.32388-1-pierre-louis.bossart@linux.intel.com>
References: <20190916190952.32388-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 4/5] soundwire: intel/cadence: add flag for
	interrupt enable
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

Prepare for future PM support and fix error handling by disabling
interrupts as needed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 18 ++++++++++++------
 drivers/soundwire/cadence_master.h |  2 +-
 drivers/soundwire/intel.c          | 12 +++++++-----
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 5f900cf2acb9..a71df99ca18f 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -819,14 +819,17 @@ EXPORT_SYMBOL(sdw_cdns_exit_reset);
  * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
  * @cdns: Cadence instance
  */
-int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
+int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state)
 {
-	u32 mask;
+	u32 slave_intmask0 = 0;
+	u32 slave_intmask1 = 0;
+	u32 mask = 0;
+
+	if (!state)
+		goto update_masks;
 
-	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0,
-		    CDNS_MCP_SLAVE_INTMASK0_MASK);
-	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1,
-		    CDNS_MCP_SLAVE_INTMASK1_MASK);
+	slave_intmask0 = CDNS_MCP_SLAVE_INTMASK0_MASK;
+	slave_intmask1 = CDNS_MCP_SLAVE_INTMASK1_MASK;
 
 	/* enable detection of all slave state changes */
 	mask = CDNS_MCP_INT_SLAVE_MASK;
@@ -849,6 +852,9 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
 	if (interrupt_mask) /* parameter override */
 		mask = interrupt_mask;
 
+update_masks:
+	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0, slave_intmask0);
+	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1, slave_intmask1);
 	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
 
 	/* commit changes */
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 1a67728c5000..302351808098 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -162,7 +162,7 @@ int sdw_cdns_init(struct sdw_cdns *cdns);
 int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 		      struct sdw_cdns_stream_config config);
 int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
-int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
+int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state);
 
 #ifdef CONFIG_DEBUG_FS
 void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index cdb3243e8823..08530c136c5f 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1036,7 +1036,7 @@ static int intel_probe(struct platform_device *pdev)
 	ret = sdw_add_bus_master(&sdw->cdns.bus);
 	if (ret) {
 		dev_err(&pdev->dev, "sdw_add_bus_master fail: %d\n", ret);
-		goto err_master_reg;
+		return ret;
 	}
 
 	if (sdw->cdns.bus.prop.hw_disabled) {
@@ -1067,7 +1067,7 @@ static int intel_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
+	ret = sdw_cdns_enable_interrupt(&sdw->cdns, true);
 	if (ret < 0) {
 		dev_err(sdw->cdns.dev, "cannot enable interrupts\n");
 		goto err_init;
@@ -1076,7 +1076,7 @@ static int intel_probe(struct platform_device *pdev)
 	ret = sdw_cdns_exit_reset(&sdw->cdns);
 	if (ret < 0) {
 		dev_err(sdw->cdns.dev, "unable to exit bus reset sequence\n");
-		goto err_init;
+		goto err_interrupt;
 	}
 
 	/* Register DAIs */
@@ -1084,18 +1084,19 @@ static int intel_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(sdw->cdns.dev, "DAI registration failed: %d\n", ret);
 		snd_soc_unregister_component(sdw->cdns.dev);
-		goto err_dai;
+		goto err_interrupt;
 	}
 
 	intel_debugfs_init(sdw);
 
 	return 0;
 
+err_interrupt:
+	sdw_cdns_enable_interrupt(&sdw->cdns, false);
 err_dai:
 	free_irq(sdw->res->irq, sdw);
 err_init:
 	sdw_delete_bus_master(&sdw->cdns.bus);
-err_master_reg:
 	return ret;
 }
 
@@ -1107,6 +1108,7 @@ static int intel_remove(struct platform_device *pdev)
 
 	if (!sdw->cdns.bus.prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
+		sdw_cdns_enable_interrupt(&sdw->cdns, false);
 		free_irq(sdw->res->irq, sdw);
 		snd_soc_unregister_component(sdw->cdns.dev);
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
