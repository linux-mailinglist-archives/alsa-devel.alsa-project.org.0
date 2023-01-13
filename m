Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A5A6692F5
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 10:30:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D267C7EEA;
	Fri, 13 Jan 2023 10:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D267C7EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673602199;
	bh=vexI4bXkLQNgnzQp46b1BOfBvYLiQ1hk43f3ShONtl8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oiInHsyHXSEN+vnLGfJgWuiUxhyDpjfqObLbxY0rsIWwGEP7hki6RjbxQLUHl1bse
	 H9+RKbRTFUSV6GPVquIIyk884QB6CTAQlFSTI/rLjVrhPXzKiJevY0V/olt7jdBpCF
	 68KsR2UG1fzN4Y5sfN5Ov94EZiOsHXEZsZpUrtHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB7FFF80570;
	Fri, 13 Jan 2023 10:27:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3342F80564; Fri, 13 Jan 2023 10:27:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9D84F80549
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 10:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9D84F80549
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KGl6+8gB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673602067; x=1705138067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vexI4bXkLQNgnzQp46b1BOfBvYLiQ1hk43f3ShONtl8=;
 b=KGl6+8gB5NM2148oe9zNQZhJ5QvllW9IRced3BqbWau9jZtTjmi+QTRu
 z6BuDtu+THsf3z/mSuOfsgOepjxVEaIhleekICfO+kl/x9g3OYbvDbnS4
 i33Ye/avSz+mx9pdl9vP8zfxo/XlahyV4ll2flt6Uk/5ibg/fg/2y+62Y
 TNPfP0WwDRzKq1lyDSoMed/mAGDfzfF8G7MY1kRgeWuewF+Y1+YmGm6s6
 0IgLqGa7Z+KWTvCwW8xU40zJHpYHkNmgBXi7WY1EMP0l7WsqEKNB+QvAr
 mM+Hk0j9NmKuVR/WcHEN09R0KCp7+fiSLIdFdYMArpxyU2+VdPd0mIlGE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="351189474"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="351189474"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="608116119"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="608116119"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:27 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/5] soundwire: cadence: further simplify low-level
 xfer_msg_defer() callback
Date: Fri, 13 Jan 2023 17:35:32 +0800
Message-Id: <20230113093532.3872113-6-yung-chuan.liao@linux.intel.com>
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

