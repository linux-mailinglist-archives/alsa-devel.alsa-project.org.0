Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B775C6AA277
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 22:48:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F647E74;
	Fri,  3 Mar 2023 22:47:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F647E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677880102;
	bh=F3NoOOYlAfGhlHphkBlJjylv7gfqdUjywibnVvhv6U4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RziBZ0e6CGK9I/2BFZhSPVeT6VRNcmIweUpgIZVEp6j8BcBsdQuu9KSXVGWsC6EPo
	 /xiTlQwSlCC0t3SLCbkaYQawKO7Z4FgYcEGKXZfruoJVvm1pzca64hBwY1dDOHY928
	 zxCowVMz/BfLlp9AaS8uo5NKlgWLSwRI7b0wAyrI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E83D2F8052D;
	Fri,  3 Mar 2023 22:47:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2802F804FE; Fri,  3 Mar 2023 22:47:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8726F80266
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 22:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8726F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i6iBoX78
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7959B61919;
	Fri,  3 Mar 2023 21:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830D3C4339C;
	Fri,  3 Mar 2023 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677880034;
	bh=F3NoOOYlAfGhlHphkBlJjylv7gfqdUjywibnVvhv6U4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i6iBoX786w4vgJ4kabz9QS+dpH8NJTcr6GikZCC+uENfIKNEoIwUQRNb73mgMqHRu
	 fts0r1L20gYkGn8bbWfKaZtshuPu+wPnnJDj6es4VruPWCFrVBtS+hplMAIQJbm8PA
	 gyDjaj1NpGjklFBR0hzKNATXt/jhK1owGclLv8fQd4UVdmoDSSWUPAt2S/cSGcXyzD
	 7suLgbkaTfpEm6Obgd6/VN5m2oX1NOinBg9A02jFoQLJ7VuDHDIPoCS+9cGxV+SgMj
	 lOffzEFbBwEu6eKxL2NN5B0aYo85VpiS1tSkDHTB6RrQnOxiSsVhB/DaeZ3NVbxI4Q
	 EL4pxPBMGeyAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 50/50] soundwire: cadence: Drain the RX FIFO
 after an IO timeout
Date: Fri,  3 Mar 2023 16:45:31 -0500
Message-Id: <20230303214531.1450154-50-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214531.1450154-1-sashal@kernel.org>
References: <20230303214531.1450154-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y5NLASYHJOEM5FOWFN3QVKOX6IURF6PP
X-Message-ID-Hash: Y5NLASYHJOEM5FOWFN3QVKOX6IURF6PP
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
 yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5NLASYHJOEM5FOWFN3QVKOX6IURF6PP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit 0603a47bd3a8f439d7844b841eee1819353063e0 ]

If wait_for_completion_timeout() times-out in _cdns_xfer_msg() it
is possible that something could have been written to the RX FIFO.
In this case, we should drain the RX FIFO so that anything in it
doesn't carry over and mess up the next transfer.

Obviously, if we got to this state something went wrong, and we
don't really know the state of everything. The cleanup in this
situation cannot be bullet-proof but we should attempt to avoid
breaking future transaction, if only to reduce the amount of
error noise when debugging the failure from a kernel log.

Note that this patch only implements the draining for blocking
(non-deferred) transfers. The deferred API doesn't have any proper
handling of error conditions and would need some re-design before
implementing cleanup. That is a task for a separate patch...

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20221202161812.4186897-4-rf@opensource.cirrus.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/cadence_master.c | 50 ++++++++++++++++--------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index b229e1e0d7d97..842e08c56796b 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -555,6 +555,29 @@ cdns_fill_msg_resp(struct sdw_cdns *cdns,
 	return SDW_CMD_OK;
 }
 
+static void cdns_read_response(struct sdw_cdns *cdns)
+{
+	u32 num_resp, cmd_base;
+	int i;
+
+	/* RX_FIFO_AVAIL can be 2 entries more than the FIFO size */
+	BUILD_BUG_ON(ARRAY_SIZE(cdns->response_buf) < CDNS_MCP_CMD_LEN + 2);
+
+	num_resp = cdns_readl(cdns, CDNS_MCP_FIFOSTAT);
+	num_resp &= CDNS_MCP_RX_FIFO_AVAIL;
+	if (num_resp > ARRAY_SIZE(cdns->response_buf)) {
+		dev_warn(cdns->dev, "RX AVAIL %d too long\n", num_resp);
+		num_resp = ARRAY_SIZE(cdns->response_buf);
+	}
+
+	cmd_base = CDNS_MCP_CMD_BASE;
+
+	for (i = 0; i < num_resp; i++) {
+		cdns->response_buf[i] = cdns_readl(cdns, cmd_base);
+		cmd_base += CDNS_MCP_CMD_WORD_LEN;
+	}
+}
+
 static enum sdw_command_response
 _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
 	       int offset, int count, bool defer)
@@ -596,6 +619,10 @@ _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
 		dev_err(cdns->dev, "IO transfer timed out, cmd %d device %d addr %x len %d\n",
 			cmd, msg->dev_num, msg->addr, msg->len);
 		msg->len = 0;
+
+		/* Drain anything in the RX_FIFO */
+		cdns_read_response(cdns);
+
 		return SDW_CMD_TIMEOUT;
 	}
 
@@ -764,29 +791,6 @@ EXPORT_SYMBOL(cdns_reset_page_addr);
  * IRQ handling
  */
 
-static void cdns_read_response(struct sdw_cdns *cdns)
-{
-	u32 num_resp, cmd_base;
-	int i;
-
-	/* RX_FIFO_AVAIL can be 2 entries more than the FIFO size */
-	BUILD_BUG_ON(ARRAY_SIZE(cdns->response_buf) < CDNS_MCP_CMD_LEN + 2);
-
-	num_resp = cdns_readl(cdns, CDNS_MCP_FIFOSTAT);
-	num_resp &= CDNS_MCP_RX_FIFO_AVAIL;
-	if (num_resp > ARRAY_SIZE(cdns->response_buf)) {
-		dev_warn(cdns->dev, "RX AVAIL %d too long\n", num_resp);
-		num_resp = ARRAY_SIZE(cdns->response_buf);
-	}
-
-	cmd_base = CDNS_MCP_CMD_BASE;
-
-	for (i = 0; i < num_resp; i++) {
-		cdns->response_buf[i] = cdns_readl(cdns, cmd_base);
-		cmd_base += CDNS_MCP_CMD_WORD_LEN;
-	}
-}
-
 static int cdns_update_slave_status(struct sdw_cdns *cdns,
 				    u64 slave_intstat)
 {
-- 
2.39.2

