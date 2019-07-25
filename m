Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5C775BE2
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 02:07:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01AD21FBF;
	Fri, 26 Jul 2019 02:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01AD21FBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564099627;
	bh=eG54uPMh2TgstylIcgCfgxzriwk8avbJrlhI33db7eA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMlGFT60lU7SnIvUaLTQhMyolPbrDCMz8WtWuMc5NERRG4us3ooT6LdybO+WrzBke
	 6JjxFmlZsABCD0IAauBeAtAml0cBpvYhQmstulqTYvJgAF9SvREnb7Iz2/TqqxhdC3
	 9YHZzsIZ7TMvTkJtr9CipRUsj4pOJHDxTKqfCbe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80617F80CAA;
	Fri, 26 Jul 2019 01:42:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BE04F8087B; Fri, 26 Jul 2019 01:42:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1934CF8085B
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 01:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1934CF8085B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 16:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="369874857"
Received: from amrutaku-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.230.75])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 16:41:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 18:40:28 -0500
Message-Id: <20190725234032.21152-37-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 36/40] soundwire: intel: disable interrupts
	on suspend
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

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 42 +++++++++++++++++-------------
 drivers/soundwire/cadence_master.h |  2 +-
 drivers/soundwire/intel.c          |  6 +++--
 3 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index f486fe15fb46..fa7230b0f200 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -814,33 +814,39 @@ EXPORT_SYMBOL(sdw_cdns_exit_reset);
  * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
  * @cdns: Cadence instance
  */
-int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
+int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state)
 {
 	u32 mask;
 
-	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0,
-		    CDNS_MCP_SLAVE_INTMASK0_MASK);
-	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1,
-		    CDNS_MCP_SLAVE_INTMASK1_MASK);
+	if (state) {
+		cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0,
+			    CDNS_MCP_SLAVE_INTMASK0_MASK);
+		cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1,
+			    CDNS_MCP_SLAVE_INTMASK1_MASK);
 
-	/* enable detection of slave state changes */
-	mask = CDNS_MCP_INT_SLAVE_RSVD | CDNS_MCP_INT_SLAVE_ALERT |
-		CDNS_MCP_INT_SLAVE_ATTACH | CDNS_MCP_INT_SLAVE_NATTACH;
+		/* enable detection of slave state changes */
+		mask = CDNS_MCP_INT_SLAVE_RSVD | CDNS_MCP_INT_SLAVE_ALERT |
+			CDNS_MCP_INT_SLAVE_ATTACH | CDNS_MCP_INT_SLAVE_NATTACH;
 
-	/* enable detection of bus issues */
-	mask |= CDNS_MCP_INT_CTRL_CLASH | CDNS_MCP_INT_DATA_CLASH |
-		CDNS_MCP_INT_PARITY;
+		/* enable detection of bus issues */
+		mask |= CDNS_MCP_INT_CTRL_CLASH | CDNS_MCP_INT_DATA_CLASH |
+			CDNS_MCP_INT_PARITY;
 
-	/* no detection of port interrupts for now */
+		/* no detection of port interrupts for now */
 
-	/* enable detection of RX fifo level */
-	mask |= CDNS_MCP_INT_RX_WL;
+		/* enable detection of RX fifo level */
+		mask |= CDNS_MCP_INT_RX_WL;
 
-	/* now enable all of the above */
-	mask |= CDNS_MCP_INT_IRQ;
+		/* now enable all of the above */
+		mask |= CDNS_MCP_INT_IRQ;
 
-	if (interrupt_mask) /* parameter override */
-		mask = interrupt_mask;
+		if (interrupt_mask) /* parameter override */
+			mask = interrupt_mask;
+	} else {
+		cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0, 0);
+		cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1, 0);
+		mask = 0;
+	}
 
 	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
 
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 2b551f9226f3..1a0ba36dd78f 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -162,7 +162,7 @@ int sdw_cdns_init(struct sdw_cdns *cdns);
 int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 		      struct sdw_cdns_stream_config config);
 int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
-int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
+int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state);
 
 void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
 
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 9ebe38e4d979..1192d5775484 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1110,7 +1110,7 @@ static int intel_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
+	ret = sdw_cdns_enable_interrupt(&sdw->cdns, true);
 
 	ret = sdw_cdns_exit_reset(&sdw->cdns);
 
@@ -1169,6 +1169,8 @@ static int intel_suspend(struct device *dev)
 		return 0;
 	}
 
+	sdw_cdns_enable_interrupt(&sdw->cdns, false);
+
 	ret = intel_link_power_down(sdw);
 	if (ret) {
 		dev_err(dev, "Link power down failed: %d", ret);
@@ -1199,7 +1201,7 @@ static int intel_resume(struct device *dev)
 		return ret;
 	}
 
-	sdw_cdns_enable_interrupt(&sdw->cdns);
+	sdw_cdns_enable_interrupt(&sdw->cdns, true);
 
 	ret = sdw_cdns_exit_reset(&sdw->cdns);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
