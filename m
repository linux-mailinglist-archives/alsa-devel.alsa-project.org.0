Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9656B87CA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:45:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBACF145B;
	Tue, 14 Mar 2023 02:44:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBACF145B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758328;
	bh=sfcPRhRXNlasOblxff/iVuz7QEMX0M7uX02RWVIo8Q4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=giETEFBZVlZYnPIUkmLh1/bE/zDSX5mcTZ7jTSM6qn8gLZnu2Sz4z7tbwtB8zaDsQ
	 CSHT2hTPWqAyXIvBzyLImsSeiLh9WO94uK7FxztNarWm84rZso0nX/W59M66vUFEYn
	 ZXltxW7+SvWHAEW58XBZp1ouCWTDUTICzfnCQQfw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 551F1F805AB;
	Tue, 14 Mar 2023 02:41:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E7ADF80579; Tue, 14 Mar 2023 02:41:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF6AFF8055C
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF6AFF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aBLAq+qT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758094; x=1710294094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sfcPRhRXNlasOblxff/iVuz7QEMX0M7uX02RWVIo8Q4=;
  b=aBLAq+qTkgOqAbB5rpE5PVagUjeZQ3riJRPIWG7/3fNEHteoWJyeN5kk
   925JpqzUcDGPipnYvSlpdntnsWAX4IKdavt0F2Q/1ruTIUAcmt3dfUKWM
   F950fzGgldMi0SLzZDtRWTJOCsVqw2SwzcLerOCjuxG0ITbjikodONQNZ
   M56IZ5sY+WGl7wqEXM61CyF96c8rWMly1ThYtdD+NN6uDq5okOUS1ziGA
   A0JWYTRf1tb47/tHNKNc0mQIUzO7FfnvM8ebXcGa1Nu/KPIa50Nj74/9r
   OdQBE1sdF7BqPIjLSKwq/t0mfqV1/ksM/KYbLN9/Anikm4BidP0iFLCrB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949303"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949303"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327538"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327538"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 13/16] soundwire: cadence: split access to IP_MCP_CONFIG
 fields
Date: Tue, 14 Mar 2023 09:54:07 +0800
Message-Id: <20230314015410.487311-14-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U4OCWI5SQVACV37YD33P3QUV4A6L2RXB
X-Message-ID-Hash: U4OCWI5SQVACV37YD33P3QUV4A6L2RXB
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4OCWI5SQVACV37YD33P3QUV4A6L2RXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The latest Cadence IP splits the MCP_CONFIG fields in two registers:
MCP_CONFIG and IP_MCP_CONFIG. Rename the relevant fields and change
the access methods used for those fields.

For existing solutions, this is an iso-functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 47 +++++++++++++++++-------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 4461a7fa4124..f7499e126404 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -27,15 +27,17 @@ module_param_named(cnds_mcp_int_mask, interrupt_mask, int, 0444);
 MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 
 #define CDNS_MCP_CONFIG				0x0
-
-#define CDNS_MCP_CONFIG_MCMD_RETRY		GENMASK(27, 24)
-#define CDNS_MCP_CONFIG_MPREQ_DELAY		GENMASK(20, 16)
-#define CDNS_MCP_CONFIG_MMASTER			BIT(7)
 #define CDNS_MCP_CONFIG_BUS_REL			BIT(6)
-#define CDNS_MCP_CONFIG_SNIFFER			BIT(5)
-#define CDNS_MCP_CONFIG_CMD			BIT(3)
-#define CDNS_MCP_CONFIG_OP			GENMASK(2, 0)
-#define CDNS_MCP_CONFIG_OP_NORMAL		0
+
+#define CDNS_IP_MCP_CONFIG			0x0 /* IP offset added at run-time */
+
+#define CDNS_IP_MCP_CONFIG_MCMD_RETRY		GENMASK(27, 24)
+#define CDNS_IP_MCP_CONFIG_MPREQ_DELAY		GENMASK(20, 16)
+#define CDNS_IP_MCP_CONFIG_MMASTER		BIT(7)
+#define CDNS_IP_MCP_CONFIG_SNIFFER		BIT(5)
+#define CDNS_IP_MCP_CONFIG_CMD			BIT(3)
+#define CDNS_IP_MCP_CONFIG_OP			GENMASK(2, 0)
+#define CDNS_IP_MCP_CONFIG_OP_NORMAL		0
 
 #define CDNS_MCP_CONTROL			0x4
 
@@ -1348,28 +1350,33 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 	/* Configure mcp config */
 	val = cdns_readl(cdns, CDNS_MCP_CONFIG);
 
+	/* Disable auto bus release */
+	val &= ~CDNS_MCP_CONFIG_BUS_REL;
+
+	cdns_writel(cdns, CDNS_MCP_CONFIG, val);
+
+	/* Configure IP mcp config */
+	val = cdns_ip_readl(cdns, CDNS_IP_MCP_CONFIG);
+
 	/* enable bus operations with clock and data */
-	val &= ~CDNS_MCP_CONFIG_OP;
-	val |= CDNS_MCP_CONFIG_OP_NORMAL;
+	val &= ~CDNS_IP_MCP_CONFIG_OP;
+	val |= CDNS_IP_MCP_CONFIG_OP_NORMAL;
 
 	/* Set cmd mode for Tx and Rx cmds */
-	val &= ~CDNS_MCP_CONFIG_CMD;
+	val &= ~CDNS_IP_MCP_CONFIG_CMD;
 
 	/* Disable sniffer mode */
-	val &= ~CDNS_MCP_CONFIG_SNIFFER;
-
-	/* Disable auto bus release */
-	val &= ~CDNS_MCP_CONFIG_BUS_REL;
+	val &= ~CDNS_IP_MCP_CONFIG_SNIFFER;
 
 	if (cdns->bus.multi_link)
 		/* Set Multi-master mode to take gsync into account */
-		val |= CDNS_MCP_CONFIG_MMASTER;
+		val |= CDNS_IP_MCP_CONFIG_MMASTER;
 
 	/* leave frame delay to hardware default of 0x1F */
 
 	/* leave command retry to hardware default of 0 */
 
-	cdns_writel(cdns, CDNS_MCP_CONFIG, val);
+	cdns_ip_writel(cdns, CDNS_IP_MCP_CONFIG, val);
 
 	/* changes will be committed later */
 	return 0;
@@ -1683,9 +1690,9 @@ int sdw_cdns_clock_restart(struct sdw_cdns *cdns, bool bus_reset)
 	if (!bus_reset) {
 
 		/* enable bus operations with clock and data */
-		cdns_updatel(cdns, CDNS_MCP_CONFIG,
-			     CDNS_MCP_CONFIG_OP,
-			     CDNS_MCP_CONFIG_OP_NORMAL);
+		cdns_ip_updatel(cdns, CDNS_IP_MCP_CONFIG,
+				CDNS_IP_MCP_CONFIG_OP,
+				CDNS_IP_MCP_CONFIG_OP_NORMAL);
 
 		ret = cdns_config_update(cdns);
 		if (ret < 0) {
-- 
2.25.1

