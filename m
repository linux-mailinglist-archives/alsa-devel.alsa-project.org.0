Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4367326D
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 08:26:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2982E5878;
	Thu, 19 Jan 2023 08:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2982E5878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674113164;
	bh=vexI4bXkLQNgnzQp46b1BOfBvYLiQ1hk43f3ShONtl8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ixZ6/aBAY0pgsTPn40S6I/rxw5EJjMFE/w4ZRcLxGqC7F/mUx2SJo01MJCyL7utjh
	 Ez5EaN2cwJgbQmc5FOMzWLwp2FwPWiDdiehyzlvh6rP4EYA33VV8JnmOjdzqWqViLE
	 cWKmB2XHsJ1oVJBRiqqfSbKdEjDzSlTb9NGkcF28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDC24F80558;
	Thu, 19 Jan 2023 08:24:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9359F80557; Thu, 19 Jan 2023 08:23:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47920F80548
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 08:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47920F80548
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n1X18AGW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674113036; x=1705649036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vexI4bXkLQNgnzQp46b1BOfBvYLiQ1hk43f3ShONtl8=;
 b=n1X18AGWpEHQbZiFJY7Pk2tC/V+7uNzf5kyLWPzH60Pjz4T+R6AklHT/
 5CZNATNMYz+BoezcfhRzwp2iFA2ShPZnoJyelIflPmShXP1hU60bUKG/V
 B/Y2LAjcFnT/4hlEy2ksgUhXpujP84gqLrNawpg3NNW4sBRWSmCZTGLLv
 MuXGquzcchXe6fCJH7ooRuZYaQL5LYLgKL+AjcHG9Yb3TQe7DL2kukipJ
 dyISKKdUzs04OujxZRHoRYCHqpE7DCQuJ7naK277OZAi/2x5k90Uz8rVk
 UCqNX4ZBI5pvwxTGte20ZPzB9SKXJu1l6J+cm1Sni5UZIL2MTOHLmz6Uc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322902683"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="322902683"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 23:23:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="662028052"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="662028052"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 23:23:46 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 4/4] soundwire: cadence: further simplify low-level
 xfer_msg_defer() callback
Date: Thu, 19 Jan 2023 15:32:11 +0800
Message-Id: <20230119073211.85979-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119073211.85979-1-yung-chuan.liao@linux.intel.com>
References: <20230119073211.85979-1-yung-chuan.liao@linux.intel.com>
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

The message pointer is already stored in the bus->defer structure, not
need to pass it as an argument.

Suggested-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c            | 2 +-
 drivers/soundwire/cadence_master.c | 5 +++--
 drivers/soundwire/cadence_master.h | 2 +-
 include/linux/soundwire/sdw.h      | 5 +++--
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fc192d0c61e7..ed94c92bc575 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -237,7 +237,7 @@ static inline int do_transfer_defer(struct sdw_bus *bus,
 	init_completion(&defer->complete);
 
 	for (i = 0; i <= retry; i++) {
-		resp = bus->ops->xfer_msg_defer(bus, msg);
+		resp = bus->ops->xfer_msg_defer(bus);
 		ret = find_response_code(resp);
 		/* if cmd is ok or ignored return */
 		if (ret == 0 || ret == -ENODATA)
diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 2365395cb181..ece0ad89746f 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -749,10 +749,11 @@ cdns_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg)
 EXPORT_SYMBOL(cdns_xfer_msg);
 
 enum sdw_command_response
-cdns_xfer_msg_defer(struct sdw_bus *bus,
-		    struct sdw_msg *msg)
+cdns_xfer_msg_defer(struct sdw_bus *bus)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
+	struct sdw_defer *defer = &bus->defer_msg;
+	struct sdw_msg *msg = defer->msg;
 	int cmd = 0, ret;
 
 	/* for defer only 1 message is supported */
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 53029d22822d..63c58b9b1f59 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -187,7 +187,7 @@ enum sdw_command_response
 cdns_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg);
 
 enum sdw_command_response
-cdns_xfer_msg_defer(struct sdw_bus *bus, struct sdw_msg *msg);
+cdns_xfer_msg_defer(struct sdw_bus *bus);
 
 u32 cdns_read_ping_status(struct sdw_bus *bus);
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index fb2bd1524a26..86e320cf27b1 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -837,7 +837,8 @@ struct sdw_defer {
  * @read_prop: Read Master properties
  * @override_adr: Override value read from firmware (quirk for buggy firmware)
  * @xfer_msg: Transfer message callback
- * @xfer_msg_defer: Defer version of transfer message callback
+ * @xfer_msg_defer: Defer version of transfer message callback. The message is handled with the
+ * bus struct @sdw_defer
  * @reset_page_addr: Reset the SCP page address registers
  * @set_bus_conf: Set the bus configuration
  * @pre_bank_switch: Callback for pre bank switch
@@ -852,7 +853,7 @@ struct sdw_master_ops {
 	enum sdw_command_response (*xfer_msg)
 			(struct sdw_bus *bus, struct sdw_msg *msg);
 	enum sdw_command_response (*xfer_msg_defer)
-			(struct sdw_bus *bus, struct sdw_msg *msg);
+			(struct sdw_bus *bus);
 	enum sdw_command_response (*reset_page_addr)
 			(struct sdw_bus *bus, unsigned int dev_num);
 	int (*set_bus_conf)(struct sdw_bus *bus,
-- 
2.25.1

