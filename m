Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB1828FF
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 03:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D09AF16D0;
	Tue,  6 Aug 2019 03:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D09AF16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565053519;
	bh=pRLB+n1Ek3wi5Vsk8/8yiIHtEiKgtfVQDP8r3Fo3t2E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ooSbThfNjdwXQCkhp71AsOim3pJQw/84U1nbHz/zktCHr7POmHBxf/icNWn9H9xas
	 LQUXz+1hgkOMhZv1kFD8wMg0BOEuAaTDe8ZbOmWpRKvuDKbC8DY7yjEqONQmlH7l7e
	 4T/087d4CndjQwyYeEpimEAJV2GoyMWQbO//BzlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1AA8F806ED;
	Tue,  6 Aug 2019 02:55:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FCAFF80675; Tue,  6 Aug 2019 02:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 993D8F80659
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 02:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 993D8F80659
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198153214"
Received: from sahluwal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.202.215])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 17:55:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  5 Aug 2019 19:55:17 -0500
Message-Id: <20190806005522.22642-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 12/17] soundwire: cadence_master: make use of
	mclk_freq property
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

Now that the prototype and Intel implementation are enabled, use this
property to avoid hard-coded values.

For example for ICL the mclk_freq value is 38.4 MHz while on CNL/CML
it's 24 MHz. The mclk_freq should not be confused with the
max_clk_freq, which si the maximum bus clock. The mclk_freq is
typically tied to the oscillator frequency and does not change between
platforms. The max_clk_freq value is linked to the maximum bandwidth
needed and topology/trace length.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 89c55e4bb72c..049ecfad2c00 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -175,8 +175,6 @@
 #define CDNS_PDI_CONFIG_PORT			GENMASK(4, 0)
 
 /* Driver defaults */
-
-#define CDNS_DEFAULT_CLK_DIVIDER		0
 #define CDNS_DEFAULT_SSP_INTERVAL		0x18
 #define CDNS_TX_TIMEOUT				2000
 
@@ -922,7 +920,10 @@ static u32 cdns_set_initial_frame_shape(int n_rows, int n_cols)
  */
 int sdw_cdns_init(struct sdw_cdns *cdns)
 {
+	struct sdw_bus *bus = &cdns->bus;
+	struct sdw_master_prop *prop = &bus->prop;
 	u32 val;
+	int divider;
 	int ret;
 
 	/* Exit clock stop */
@@ -934,9 +935,11 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 	}
 
 	/* Set clock divider */
+	divider	= (prop->mclk_freq / prop->max_clk_freq) - 1;
 	val = cdns_readl(cdns, CDNS_MCP_CLK_CTRL0);
-	val |= CDNS_DEFAULT_CLK_DIVIDER;
+	val |= divider;
 	cdns_writel(cdns, CDNS_MCP_CLK_CTRL0, val);
+	cdns_writel(cdns, CDNS_MCP_CLK_CTRL1, val);
 
 	/*
 	 * Frame shape changes after initialization have to be done
@@ -984,6 +987,7 @@ EXPORT_SYMBOL(sdw_cdns_init);
 
 int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
 {
+	struct sdw_master_prop *prop = &bus->prop;
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
 	int mcp_clkctrl_off, mcp_clkctrl;
 	int divider;
@@ -993,7 +997,9 @@ int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
 		return -EINVAL;
 	}
 
-	divider	= (params->max_dr_freq / params->curr_dr_freq) - 1;
+	divider	= prop->mclk_freq * SDW_DOUBLE_RATE_FACTOR /
+		params->curr_dr_freq;
+	divider--; /* divider is 1/(N+1) */
 
 	if (params->next_bank)
 		mcp_clkctrl_off = CDNS_MCP_CLK_CTRL1;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
