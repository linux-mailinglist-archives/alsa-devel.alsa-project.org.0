Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0EC6692F0
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 10:29:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F3848AA8;
	Fri, 13 Jan 2023 10:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F3848AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673602183;
	bh=9EfKDqwT5iUG/3vSHRo63HrB7tHmjW3+OTAvgNE6xiU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oS40RW42+lVhE5DC5eZg551xy2nwCiHDntiu2pcpXk58TW2AEG1TW2B7PEZ9W9Spw
	 NPOuwogdC4+D5Q0BQehlBuPq97UNyrVF8euQLq3Iu/oy83o4w28Cb4EIPG0qkz5Hz0
	 waZDg/3xUVp9JwBC6iLKsIZfv0mVXkmA+7oAcyH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57CEAF80567;
	Fri, 13 Jan 2023 10:27:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 375D2F80558; Fri, 13 Jan 2023 10:27:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E7A4F80543
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 10:27:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E7A4F80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Of90vXmV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673602066; x=1705138066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9EfKDqwT5iUG/3vSHRo63HrB7tHmjW3+OTAvgNE6xiU=;
 b=Of90vXmVyJzZEP2w7inipb3BNV4RuwiEln05PUdiyJ0vnqHDt4hHfl/8
 kzOXvzIkeQWvJJ99yjorQDbx5kw+jm8TKRLnjv42xLrH+td32fsPRBz+3
 WKf4tFM6O0i3b1xE4FiZoufcCQfjmUgjePvN5/BJFZ0GfTFKNO79UxEh+
 EjuLGVVKydI+59Jy0/JNFMCh4bhON0uzCFVS4FEzLz2p7GZMeSau0iKXZ
 GFxOrC9NTYeNsZfxqHuDLGRr2KlUXUGac3Xxz435Ulk6xJuTw7hbrjclj
 uaGWGpC/pQIYtTTyCDq4D290t7P39QJhdN2/qloqaHWUrlZOJp++LuaFh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="351189462"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="351189462"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="608116112"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="608116112"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:25 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/5] soundwire: cadence: use directly bus sdw_defer structure
Date: Fri, 13 Jan 2023 17:35:31 +0800
Message-Id: <20230113093532.3872113-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113093532.3872113-1-yung-chuan.liao@linux.intel.com>
References: <20230113093532.3872113-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Copying the bus sdw_defer structure into the Cadence internals leads
to using stale pointers and kernel oopses on errors. It's just simpler
and safer to use the bus sdw_defer structure directly.

Link: https://github.com/thesofproject/linux/issues/4056
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c            |  2 +-
 drivers/soundwire/cadence_master.c | 17 ++++++++---------
 drivers/soundwire/cadence_master.h |  5 +----
 include/linux/soundwire/sdw.h      |  3 +--
 4 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 572cc9a9af41..fc192d0c61e7 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -237,7 +237,7 @@ static inline int do_transfer_defer(struct sdw_bus *bus,
 	init_completion(&defer->complete);
 
 	for (i = 0; i <= retry; i++) {
-		resp = bus->ops->xfer_msg_defer(bus, msg, defer);
+		resp = bus->ops->xfer_msg_defer(bus, msg);
 		ret = find_response_code(resp);
 		/* if cmd is ok or ignored return */
 		if (ret == 0 || ret == -ENODATA)
diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 521387322145..2365395cb181 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -750,7 +750,7 @@ EXPORT_SYMBOL(cdns_xfer_msg);
 
 enum sdw_command_response
 cdns_xfer_msg_defer(struct sdw_bus *bus,
-		    struct sdw_msg *msg, struct sdw_defer *defer)
+		    struct sdw_msg *msg)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
 	int cmd = 0, ret;
@@ -763,9 +763,6 @@ cdns_xfer_msg_defer(struct sdw_bus *bus,
 	if (ret)
 		return SDW_CMD_FAIL_OTHER;
 
-	cdns->defer = defer;
-	cdns->defer->length = msg->len;
-
 	return _cdns_xfer_msg(cdns, msg, cmd, 0, msg->len, true);
 }
 EXPORT_SYMBOL(cdns_xfer_msg_defer);
@@ -893,13 +890,15 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	if (int_status & CDNS_MCP_INT_RX_WL) {
+		struct sdw_bus *bus = &cdns->bus;
+		struct sdw_defer *defer = &bus->defer_msg;
+
 		cdns_read_response(cdns);
 
-		if (cdns->defer) {
-			cdns_fill_msg_resp(cdns, cdns->defer->msg,
-					   cdns->defer->length, 0);
-			complete(&cdns->defer->complete);
-			cdns->defer = NULL;
+		if (defer && defer->msg) {
+			cdns_fill_msg_resp(cdns, defer->msg,
+					   defer->length, 0);
+			complete(&defer->complete);
 		} else {
 			complete(&cdns->tx_complete);
 		}
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index fa9dc38264a4..53029d22822d 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -109,7 +109,6 @@ struct sdw_cdns_dai_runtime {
  * @instance: instance number
  * @response_buf: SoundWire response buffer
  * @tx_complete: Tx completion
- * @defer: Defer pointer
  * @ports: Data ports
  * @num_ports: Total number of data ports
  * @pcm: PCM streams
@@ -130,7 +129,6 @@ struct sdw_cdns {
 	u32 response_buf[CDNS_MCP_IP_MAX_CMD_LEN + 2];
 
 	struct completion tx_complete;
-	struct sdw_defer *defer;
 
 	struct sdw_cdns_port *ports;
 	int num_ports;
@@ -189,8 +187,7 @@ enum sdw_command_response
 cdns_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg);
 
 enum sdw_command_response
-cdns_xfer_msg_defer(struct sdw_bus *bus,
-		    struct sdw_msg *msg, struct sdw_defer *defer);
+cdns_xfer_msg_defer(struct sdw_bus *bus, struct sdw_msg *msg);
 
 u32 cdns_read_ping_status(struct sdw_bus *bus);
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 3cd2a761911f..fb2bd1524a26 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -852,8 +852,7 @@ struct sdw_master_ops {
 	enum sdw_command_response (*xfer_msg)
 			(struct sdw_bus *bus, struct sdw_msg *msg);
 	enum sdw_command_response (*xfer_msg_defer)
-			(struct sdw_bus *bus, struct sdw_msg *msg,
-			struct sdw_defer *defer);
+			(struct sdw_bus *bus, struct sdw_msg *msg);
 	enum sdw_command_response (*reset_page_addr)
 			(struct sdw_bus *bus, unsigned int dev_num);
 	int (*set_bus_conf)(struct sdw_bus *bus,
-- 
2.25.1

