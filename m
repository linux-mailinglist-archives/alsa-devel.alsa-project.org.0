Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C472175BC8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 02:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B3951F7F;
	Fri, 26 Jul 2019 01:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B3951F7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564099220;
	bh=T8fl5QX4vsITtD8+AuvtGqTY7s+adcUXxl+y113Ta7k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEMRUlbsY+pni1wixOqM8d8KoOTOWXi/by4xVhu0Wc1LT8vyB6uD6zU908pk5hsjV
	 loQm+I4wVIGddpxICf1FK7Tzv/N0rn8ZqSdYoxZTivm4bVnOTOghTT+dxAg6GfMNMh
	 K5zUXBTsOr5NP+E/FZtRSgh4jAIHsjkORcEMNSpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F2CBF8077B;
	Fri, 26 Jul 2019 01:41:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44279F80709; Fri, 26 Jul 2019 01:41:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A3EAF806E5
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 01:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A3EAF806E5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 16:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="369874792"
Received: from amrutaku-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.230.75])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 16:41:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 18:40:18 -0500
Message-Id: <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 26/40] soundwire: cadence_master: fix
	divider setting in clock register
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

From: Rander Wang <rander.wang@linux.intel.com>

The existing code uses an OR operation which would mix the original
divider setting with the new one, resulting in an invalid
configuration that can make codecs hang.

Add the mask definition and use cdns_updatel to update divider

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 10ebcef2e84e..18c6ac026e85 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -57,6 +57,7 @@
 #define CDNS_MCP_SSP_CTRL1			0x28
 #define CDNS_MCP_CLK_CTRL0			0x30
 #define CDNS_MCP_CLK_CTRL1			0x38
+#define CDNS_MCP_CLK_MCLKD_MASK		GENMASK(7, 0)
 
 #define CDNS_MCP_STAT				0x40
 
@@ -988,9 +989,11 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 	/* Set clock divider */
 	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
 	val = cdns_readl(cdns, CDNS_MCP_CLK_CTRL0);
-	val |= divider;
-	cdns_writel(cdns, CDNS_MCP_CLK_CTRL0, val);
-	cdns_writel(cdns, CDNS_MCP_CLK_CTRL1, val);
+
+	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL0,
+		     CDNS_MCP_CLK_MCLKD_MASK, divider);
+	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL1,
+		     CDNS_MCP_CLK_MCLKD_MASK, divider);
 
 	pr_err("plb: mclk %d max_freq %d divider %d register %x\n",
 	       prop->mclk_freq,
@@ -1064,8 +1067,7 @@ int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
 		mcp_clkctrl_off = CDNS_MCP_CLK_CTRL0;
 
 	mcp_clkctrl = cdns_readl(cdns, mcp_clkctrl_off);
-	mcp_clkctrl |= divider;
-	cdns_writel(cdns, mcp_clkctrl_off, mcp_clkctrl);
+	cdns_updatel(cdns, mcp_clkctrl_off, CDNS_MCP_CLK_MCLKD_MASK, divider);
 
 	pr_err("plb: mclk * 2 %d curr_dr_freq %d divider %d register %x\n",
 	       prop->mclk_freq * SDW_DOUBLE_RATE_FACTOR,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
