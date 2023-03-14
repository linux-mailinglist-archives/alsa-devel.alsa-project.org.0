Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D346B87CE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:46:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F861491;
	Tue, 14 Mar 2023 02:45:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F861491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758388;
	bh=BsMbslJQaFseT5Cv+EGJHhXHzftwhtvi7GC9ZvR/ymM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CWnbBgKb7tsgfODVUrWiaK7o2kIA3gLdDfUzv8mDu+FqzcHZumAq2Sl2fKxEl+U5d
	 kE/iLRJ3jbk7SpXIsR35UMH2lhXFAShKEQ6EZ8GxD8AJW/EXk4H5RLuYjLuYnvewmX
	 emMTCdhNNnlUE8/B+dzPnVqwDRNHhKa318UQPOJ4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE9E4F805C4;
	Tue, 14 Mar 2023 02:41:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC60F8057E; Tue, 14 Mar 2023 02:41:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F013F8055C
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F013F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=knOJNfyW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758098; x=1710294098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BsMbslJQaFseT5Cv+EGJHhXHzftwhtvi7GC9ZvR/ymM=;
  b=knOJNfyWpr1I34X+xYE1BGNsmBbS0AL3prkVRbS8NLxe/hR92/ClQw32
   l4oYMjRK6qfF1hFtzq9r+pE0xzbwJvgy1bcJHWBET/rFL8kaBHFF/a4Uj
   lk0e1RA/rV02Whfagadcy3fnzUtubKLLZjdMHMAcvShxO03LismMABNiP
   4INWxypH+vSXQn8bHU+xHGZIatKgZ6BzHh/LWrVfIxbi11Z7EhmnQbmt3
   KTVXo8iZpyUrcKq27YS2d95tPhettAPY3ZYForEAPSqDzA6x5CAzxLkBp
   LNoD76AwYLvR7RRVzozgx/GIQtnXrciRUY3GGxfSVZiwxIYIxleuZdcbj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949311"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949311"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327558"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327558"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 14/16] soundwire: cadence: split access to IP_MCP_CONTROL
 fields
Date: Tue, 14 Mar 2023 09:54:08 +0800
Message-Id: <20230314015410.487311-15-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B4REOUAERP4JV37N45RNAGCLFBDR7IEJ
X-Message-ID-Hash: B4REOUAERP4JV37N45RNAGCLFBDR7IEJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4REOUAERP4JV37N45RNAGCLFBDR7IEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The latest Cadence IP splits the MCP_CONTROL fields in two registers:
MCP_CONTROL and IP_MCP_CONTROL. Rename the relevant fields and change
the access methods used for those fields.

For existing solutions, this is an iso-functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 41 ++++++++++++++++++------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index f7499e126404..4c82712944b9 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -41,15 +41,18 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 
 #define CDNS_MCP_CONTROL			0x4
 
-#define CDNS_MCP_CONTROL_RST_DELAY		GENMASK(10, 8)
 #define CDNS_MCP_CONTROL_CMD_RST		BIT(7)
 #define CDNS_MCP_CONTROL_SOFT_RST		BIT(6)
-#define CDNS_MCP_CONTROL_SW_RST			BIT(5)
 #define CDNS_MCP_CONTROL_HW_RST			BIT(4)
-#define CDNS_MCP_CONTROL_CLK_PAUSE		BIT(3)
 #define CDNS_MCP_CONTROL_CLK_STOP_CLR		BIT(2)
-#define CDNS_MCP_CONTROL_CMD_ACCEPT		BIT(1)
-#define CDNS_MCP_CONTROL_BLOCK_WAKEUP		BIT(0)
+
+#define CDNS_IP_MCP_CONTROL			0x4  /* IP offset added at run-time */
+
+#define CDNS_IP_MCP_CONTROL_RST_DELAY		GENMASK(10, 8)
+#define CDNS_IP_MCP_CONTROL_SW_RST		BIT(5)
+#define CDNS_IP_MCP_CONTROL_CLK_PAUSE		BIT(3)
+#define CDNS_IP_MCP_CONTROL_CMD_ACCEPT		BIT(1)
+#define CDNS_IP_MCP_CONTROL_BLOCK_WAKEUP	BIT(0)
 
 #define CDNS_MCP_CMDCTRL			0x8
 
@@ -1050,6 +1053,7 @@ static void cdns_update_slave_status_work(struct work_struct *work)
 void sdw_cdns_check_self_clearing_bits(struct sdw_cdns *cdns, const char *string,
 				       bool initial_delay, int reset_iterations)
 {
+	u32 ip_mcp_control;
 	u32 mcp_control;
 	u32 mcp_config_update;
 	int i;
@@ -1057,6 +1061,12 @@ void sdw_cdns_check_self_clearing_bits(struct sdw_cdns *cdns, const char *string
 	if (initial_delay)
 		usleep_range(1000, 1500);
 
+	ip_mcp_control = cdns_ip_readl(cdns, CDNS_IP_MCP_CONTROL);
+
+	/* the following bits should be cleared immediately */
+	if (ip_mcp_control & CDNS_IP_MCP_CONTROL_SW_RST)
+		dev_err(cdns->dev, "%s failed: IP_MCP_CONTROL_SW_RST is not cleared\n", string);
+
 	mcp_control = cdns_readl(cdns, CDNS_MCP_CONTROL);
 
 	/* the following bits should be cleared immediately */
@@ -1064,10 +1074,9 @@ void sdw_cdns_check_self_clearing_bits(struct sdw_cdns *cdns, const char *string
 		dev_err(cdns->dev, "%s failed: MCP_CONTROL_CMD_RST is not cleared\n", string);
 	if (mcp_control & CDNS_MCP_CONTROL_SOFT_RST)
 		dev_err(cdns->dev, "%s failed: MCP_CONTROL_SOFT_RST is not cleared\n", string);
-	if (mcp_control & CDNS_MCP_CONTROL_SW_RST)
-		dev_err(cdns->dev, "%s failed: MCP_CONTROL_SW_RST is not cleared\n", string);
 	if (mcp_control & CDNS_MCP_CONTROL_CLK_STOP_CLR)
 		dev_err(cdns->dev, "%s failed: MCP_CONTROL_CLK_STOP_CLR is not cleared\n", string);
+
 	mcp_config_update = cdns_readl(cdns, CDNS_MCP_CONFIG_UPDATE);
 	if (mcp_config_update & CDNS_MCP_CONFIG_UPDATE_BIT)
 		dev_err(cdns->dev, "%s failed: MCP_CONFIG_UPDATE_BIT is not cleared\n", string);
@@ -1344,8 +1353,8 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 		     CDNS_MCP_CONTROL_CMD_RST);
 
 	/* Set cmd accept mode */
-	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_ACCEPT,
-		     CDNS_MCP_CONTROL_CMD_ACCEPT);
+	cdns_ip_updatel(cdns, CDNS_IP_MCP_CONTROL, CDNS_IP_MCP_CONTROL_CMD_ACCEPT,
+			CDNS_IP_MCP_CONTROL_CMD_ACCEPT);
 
 	/* Configure mcp config */
 	val = cdns_readl(cdns, CDNS_MCP_CONFIG);
@@ -1606,9 +1615,9 @@ int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
 	 * in clock stop state
 	 */
 	if (block_wake)
-		cdns_updatel(cdns, CDNS_MCP_CONTROL,
-			     CDNS_MCP_CONTROL_BLOCK_WAKEUP,
-			     CDNS_MCP_CONTROL_BLOCK_WAKEUP);
+		cdns_ip_updatel(cdns, CDNS_IP_MCP_CONTROL,
+				CDNS_IP_MCP_CONTROL_BLOCK_WAKEUP,
+				CDNS_IP_MCP_CONTROL_BLOCK_WAKEUP);
 
 	list_for_each_entry(slave, &cdns->bus.slaves, node) {
 		if (slave->status == SDW_SLAVE_ATTACHED ||
@@ -1681,11 +1690,11 @@ int sdw_cdns_clock_restart(struct sdw_cdns *cdns, bool bus_reset)
 		return ret;
 	}
 
-	cdns_updatel(cdns, CDNS_MCP_CONTROL,
-		     CDNS_MCP_CONTROL_BLOCK_WAKEUP, 0);
+	cdns_ip_updatel(cdns, CDNS_IP_MCP_CONTROL,
+			CDNS_IP_MCP_CONTROL_BLOCK_WAKEUP, 0);
 
-	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_ACCEPT,
-		     CDNS_MCP_CONTROL_CMD_ACCEPT);
+	cdns_ip_updatel(cdns, CDNS_IP_MCP_CONTROL, CDNS_IP_MCP_CONTROL_CMD_ACCEPT,
+			CDNS_IP_MCP_CONTROL_CMD_ACCEPT);
 
 	if (!bus_reset) {
 
-- 
2.25.1

