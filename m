Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 867286B87D6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C729F1494;
	Tue, 14 Mar 2023 02:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C729F1494
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758406;
	bh=Hzzq3OtEkkrFejYuV+z4cdtj/Bawg/u7wQf4bCyiLzc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HvnEKI3Eb/cliZHENE9RabcV+/JAgMVHpe8zQk0bBwQP27SQ8p/QpXqrc54mS9/+i
	 hSbXYoZWw2g2Xvw+ZbDopUyN/BfHAd+a6fDTqZrSoMb16dxtrFoImmlL9TWJTHih/w
	 +qr9md38ZT+VHN9d9DorLvpdkEFhhXr8TXQ91KdU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0868F805D2;
	Tue, 14 Mar 2023 02:42:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB8D9F8058C; Tue, 14 Mar 2023 02:41:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3DB7F80557
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3DB7F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oIGdwniS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758100; x=1710294100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hzzq3OtEkkrFejYuV+z4cdtj/Bawg/u7wQf4bCyiLzc=;
  b=oIGdwniS0Y+x2PhY3lVprtjbMoJrz/rFm3jFVcbXsLzFyUbquIK2nOZr
   s8U7sOV3zJXwJ/99+JExL6ydxppBRG7e0ZwqvoNy3s5Rv8qjW+r6ZL6qC
   QZsAplICm23SlH+Js/iFdtoNwlZEIMJeH4w3w4xAQ0XkHiIQuEni5xrw/
   wX1NG6H4v8nDtSrXIwPm7e4rdWG/cz0NZX2zmcoCNHvaR+GDr/1/4qg9u
   Fz7r0X/FKoMJfdTD+rtRYqtRrpV43zItR69wlDhgePPwKEgiR+xJM8EsM
   /BH30oqUOduheslxAoxnI3fTfbHIuGNpxOfP86M07fGdIqE4qqry0mLP2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949325"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949325"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327601"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327601"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 16/16] soundwire: cadence: change access to IP_MCP_CMD_BASE
Date: Tue, 14 Mar 2023 09:54:10 +0800
Message-Id: <20230314015410.487311-17-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WS7MYPVNSZ3V47EWYTUTIMJPW73PVBNR
X-Message-ID-Hash: WS7MYPVNSZ3V47EWYTUTIMJPW73PVBNR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WS7MYPVNSZ3V47EWYTUTIMJPW73PVBNR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The latest Cadence IP moves MCP_CMD_BASE and MCP_CMD_RESP to the
IP_MCP_CMD_BASE and IP_MCP_CMD_RESP registers located in different
area and accessed with a fixed offset.

Unlike other patches, the fields are not renamed to avoid a very
invasive and low-value set of changes.

For existing solutions, this is an iso-functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 5128923f051e..39502bc75712 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -129,8 +129,8 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_MCP_FIFOSTAT			0x7C
 #define CDNS_MCP_RX_FIFO_AVAIL			GENMASK(5, 0)
 
-#define CDNS_MCP_CMD_BASE			0x80
-#define CDNS_MCP_RESP_BASE			0x80
+#define CDNS_IP_MCP_CMD_BASE			0x80 /* IP offset added at run-time */
+#define CDNS_IP_MCP_RESP_BASE			0x80 /* IP offset added at run-time */
 /* FIFO can hold 8 commands */
 #define CDNS_MCP_CMD_LEN			8
 #define CDNS_MCP_CMD_WORD_LEN			0x4
@@ -590,10 +590,10 @@ static void cdns_read_response(struct sdw_cdns *cdns)
 		num_resp = ARRAY_SIZE(cdns->response_buf);
 	}
 
-	cmd_base = CDNS_MCP_CMD_BASE;
+	cmd_base = CDNS_IP_MCP_CMD_BASE;
 
 	for (i = 0; i < num_resp; i++) {
-		cdns->response_buf[i] = cdns_readl(cdns, cmd_base);
+		cdns->response_buf[i] = cdns_ip_readl(cdns, cmd_base);
 		cmd_base += CDNS_MCP_CMD_WORD_LEN;
 	}
 }
@@ -612,7 +612,7 @@ _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
 		cdns->msg_count = count;
 	}
 
-	base = CDNS_MCP_CMD_BASE;
+	base = CDNS_IP_MCP_CMD_BASE;
 	addr = msg->addr + offset;
 
 	for (i = 0; i < count; i++) {
@@ -625,7 +625,7 @@ _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
 			data |= msg->buf[i + offset];
 
 		data |= FIELD_PREP(CDNS_MCP_CMD_SSP_TAG, msg->ssp_sync);
-		cdns_writel(cdns, base, data);
+		cdns_ip_writel(cdns, base, data);
 		base += CDNS_MCP_CMD_WORD_LEN;
 	}
 
@@ -673,10 +673,10 @@ cdns_program_scp_addr(struct sdw_cdns *cdns, struct sdw_msg *msg)
 	data[0] |= msg->addr_page1;
 	data[1] |= msg->addr_page2;
 
-	base = CDNS_MCP_CMD_BASE;
-	cdns_writel(cdns, base, data[0]);
+	base = CDNS_IP_MCP_CMD_BASE;
+	cdns_ip_writel(cdns, base, data[0]);
 	base += CDNS_MCP_CMD_WORD_LEN;
-	cdns_writel(cdns, base, data[1]);
+	cdns_ip_writel(cdns, base, data[1]);
 
 	time = wait_for_completion_timeout(&cdns->tx_complete,
 					   msecs_to_jiffies(CDNS_TX_TIMEOUT));
-- 
2.25.1

