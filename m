Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 946BD82900
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 03:06:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2584616DE;
	Tue,  6 Aug 2019 03:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2584616DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565053565;
	bh=pcJQhQZ3MMOnbeI4azGalutlzT5LYjFgy8ld6sujybM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=poX47c2NuZuC68KyrkMEkORigM3WzByylpNc/XupmDOiCsncPxfDYdlTrMbNilfx5
	 FvIIcI0cQXkK+wvNyAgFTiaNuUhPAs8S8tSarpUtGiTYy0NMzCSPfwdRlDyQVx1apL
	 BaBxgn3jUUm/ERfVPx1f+vryn6pVLdORH6LOK35Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84F21F8070D;
	Tue,  6 Aug 2019 02:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C8DEF8067B; Tue,  6 Aug 2019 02:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29B9AF8065D
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 02:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29B9AF8065D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198153222"
Received: from sahluwal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.202.215])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 17:55:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  5 Aug 2019 19:55:18 -0500
Message-Id: <20190806005522.22642-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 13/17] soundwire: cadence_master: fix divider
	setting in clock register
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
 drivers/soundwire/cadence_master.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 049ecfad2c00..fb198a806efd 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -59,6 +59,7 @@
 #define CDNS_MCP_SSP_CTRL1			0x28
 #define CDNS_MCP_CLK_CTRL0			0x30
 #define CDNS_MCP_CLK_CTRL1			0x38
+#define CDNS_MCP_CLK_MCLKD_MASK		GENMASK(7, 0)
 
 #define CDNS_MCP_STAT				0x40
 
@@ -936,10 +937,11 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 
 	/* Set clock divider */
 	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
-	val = cdns_readl(cdns, CDNS_MCP_CLK_CTRL0);
-	val |= divider;
-	cdns_writel(cdns, CDNS_MCP_CLK_CTRL0, val);
-	cdns_writel(cdns, CDNS_MCP_CLK_CTRL1, val);
+
+	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL0,
+		     CDNS_MCP_CLK_MCLKD_MASK, divider);
+	cdns_updatel(cdns, CDNS_MCP_CLK_CTRL1,
+		     CDNS_MCP_CLK_MCLKD_MASK, divider);
 
 	/*
 	 * Frame shape changes after initialization have to be done
@@ -989,7 +991,7 @@ int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
 {
 	struct sdw_master_prop *prop = &bus->prop;
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
-	int mcp_clkctrl_off, mcp_clkctrl;
+	int mcp_clkctrl_off;
 	int divider;
 
 	if (!params->curr_dr_freq) {
@@ -1006,9 +1008,7 @@ int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
 	else
 		mcp_clkctrl_off = CDNS_MCP_CLK_CTRL0;
 
-	mcp_clkctrl = cdns_readl(cdns, mcp_clkctrl_off);
-	mcp_clkctrl |= divider;
-	cdns_writel(cdns, mcp_clkctrl_off, mcp_clkctrl);
+	cdns_updatel(cdns, mcp_clkctrl_off, CDNS_MCP_CLK_MCLKD_MASK, divider);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
