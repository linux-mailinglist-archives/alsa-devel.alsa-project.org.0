Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA438271BC2
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 09:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76E1916A3;
	Mon, 21 Sep 2020 09:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76E1916A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600673318;
	bh=9m1Bq1+lLKjkQjdVZ2BzCZY4sKlgaipmgohvZ14YkZI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RqKIsNlmBW2fCvNrOYGcFa8sKcXGQ7oGA4BJPOND1FJIwmGtjBvR9fdHyvTy7Y/5g
	 Ivy5CArOhtJmV9hpkbjUU93HyMkfCjNDRVBaiHFYXqpv6Xa94CF1Mu7RRUNHu0Tw6d
	 82ZD02tcg/Yjkoq5Jt72qYB2FCOG9T+8nBHz9PeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9BD0F802C4;
	Mon, 21 Sep 2020 09:26:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64834F8028D; Mon, 21 Sep 2020 09:26:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46F4BF80171
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 09:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F4BF80171
IronPort-SDR: glRKwYo0uwnNeDtSVnC6uGasetOWoHirU1OeDkH4xVZWflHDj2LY69PPCh13LdeP8OQ2WSXgpP
 12QMJBefauKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="139824327"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="139824327"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 00:25:57 -0700
IronPort-SDR: qVMxYWARWXK3ntzuJG4+M42B4oPESz9UEp+IA1jqDd0eQrWGJnmu0VmYIBu/apJxn1DcW/raU1
 nXuZrG66+RrQ==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="485325712"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 00:25:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/3] soundwire: cadence: add data port test fail interrupt
Date: Mon, 21 Sep 2020 03:32:07 +0800
Message-Id: <20200920193207.31241-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200920193207.31241-1-yung-chuan.liao@linux.intel.com>
References: <20200920193207.31241-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The Master ports can report errors in test data modes, enable the
interrupt and just log a message. This capability is useful for Master
sink ports only (Master source ports generate data).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 19d445ef6764..9fa55164354a 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -175,6 +175,7 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_DPN_HCTRL_LCTRL			GENMASK(10, 8)
 
 #define CDNS_PORTCTRL				0x130
+#define CDNS_PORTCTRL_TEST_FAILED		BIT(1)
 #define CDNS_PORTCTRL_DIRN			BIT(7)
 #define CDNS_PORTCTRL_BANK_INVERT		BIT(8)
 
@@ -870,6 +871,19 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 		dev_err_ratelimited(cdns->dev, "Bus clash for data word\n");
 	}
 
+	if (cdns->bus.params.m_data_mode != SDW_PORT_DATA_MODE_NORMAL &&
+	    int_status & CDNS_MCP_INT_DPINT) {
+		u32 port_intstat;
+
+		/* just log which ports report an error */
+		port_intstat = cdns_readl(cdns, CDNS_MCP_PORT_INTSTAT);
+		dev_err_ratelimited(cdns->dev, "DP interrupt: PortIntStat %8x\n",
+				    port_intstat);
+
+		/* clear status w/ write1 */
+		cdns_writel(cdns, CDNS_MCP_PORT_INTSTAT, port_intstat);
+	}
+
 	if (int_status & CDNS_MCP_INT_SLAVE_MASK) {
 		/* Mask the Slave interrupt and wake thread */
 		cdns_updatel(cdns, CDNS_MCP_INTMASK,
@@ -994,7 +1008,9 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state)
 	mask |= CDNS_MCP_INT_CTRL_CLASH | CDNS_MCP_INT_DATA_CLASH |
 		CDNS_MCP_INT_PARITY;
 
-	/* no detection of port interrupts for now */
+	/* port interrupt limited to test modes for now */
+	if (cdns->bus.params.m_data_mode != SDW_PORT_DATA_MODE_NORMAL)
+		mask |= CDNS_MCP_INT_DPINT;
 
 	/* enable detection of RX fifo level */
 	mask |= CDNS_MCP_INT_RX_WL;
@@ -1624,11 +1640,16 @@ void sdw_cdns_config_stream(struct sdw_cdns *cdns,
 {
 	u32 offset, val = 0;
 
-	if (dir == SDW_DATA_DIR_RX)
+	if (dir == SDW_DATA_DIR_RX) {
 		val = CDNS_PORTCTRL_DIRN;
 
+		if (cdns->bus.params.m_data_mode != SDW_PORT_DATA_MODE_NORMAL)
+			val |= CDNS_PORTCTRL_TEST_FAILED;
+	}
 	offset = CDNS_PORTCTRL + pdi->num * CDNS_PORT_OFFSET;
-	cdns_updatel(cdns, offset, CDNS_PORTCTRL_DIRN, val);
+	cdns_updatel(cdns, offset,
+		     CDNS_PORTCTRL_DIRN | CDNS_PORTCTRL_TEST_FAILED,
+		     val);
 
 	val = pdi->num;
 	val |= CDNS_PDI_CONFIG_SOFT_RESET;
-- 
2.17.1

