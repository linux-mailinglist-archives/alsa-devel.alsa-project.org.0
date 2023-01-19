Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E285C673266
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 08:25:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7659557A3;
	Thu, 19 Jan 2023 08:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7659557A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674113130;
	bh=NeP4OdNK8sHTuHKWYhMhhSE6AcrppUIxgnz/ptxTTv8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eYIjymWQEED0wmVxUHw3aOa17tAN/T5rrpkVVI9lU3cCOxMWN+5W4kSc0KHq6W8IY
	 93nXFosUGu+YOshMJ3bbOvh1xjMQ0K74vSRG4/JK+gIAF8OZxdWb3VbVeB61bqU73V
	 ug8YIQNHLptByDiP9fyA2D9oKkNOC4n1z/utf9NA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A4E5F804EC;
	Thu, 19 Jan 2023 08:23:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34715F8053D; Thu, 19 Jan 2023 08:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF67FF804EC
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 08:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF67FF804EC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UHIoCyjZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674113029; x=1705649029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NeP4OdNK8sHTuHKWYhMhhSE6AcrppUIxgnz/ptxTTv8=;
 b=UHIoCyjZBPLkkPT78Aubt+Zm/Jsfj6gKk89NJRk13y5INmepURhw0QbO
 qfpLiFt05PaDcCGkSI7ti47jsLZXU+DGRjlL9XYbBkZ+eDaRSRIFaB2ZN
 i04O0WhPISOrryHcrWm+KNUzj2ZTuRGNdAi2hODjFiHX+JuVqA4zc15qg
 Q9SXiRAwwsIozTZ+nJZLLSTFvpKSdRUISGOyTzfNhocGxo33p0KKYoXpY
 DZC3nxHE21tsOQAe2PM5JD0wMFOVEDWgukhlvzesIFuWQ+gyPgQIdlZDK
 07f4NuMEl8UKYZh0p1VW8ctJD7WOgnG39VAS6Ct+s7oakUnGNx9hwxE4o A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322902669"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="322902669"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 23:23:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="662028032"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="662028032"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 23:23:41 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/4] soundwire: bus: remove sdw_defer argument in
 sdw_transfer_defer()
Date: Thu, 19 Jan 2023 15:32:09 +0800
Message-Id: <20230119073211.85979-3-yung-chuan.liao@linux.intel.com>
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

There's no point in passing an argument that is a pointer to a bus
member. We can directly get the member and do an indirection when
needed.

This is a first step before simplifying the hardware-specific
callbacks further.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c    | 10 ++++------
 drivers/soundwire/bus.h    |  3 +--
 drivers/soundwire/stream.c |  4 +---
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 633d411b64f3..572cc9a9af41 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -225,9 +225,9 @@ static inline int do_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
 }
 
 static inline int do_transfer_defer(struct sdw_bus *bus,
-				    struct sdw_msg *msg,
-				    struct sdw_defer *defer)
+				    struct sdw_msg *msg)
 {
+	struct sdw_defer *defer = &bus->defer_msg;
 	int retry = bus->prop.err_threshold;
 	enum sdw_command_response resp;
 	int ret = 0, i;
@@ -335,19 +335,17 @@ EXPORT_SYMBOL(sdw_show_ping_status);
  * sdw_transfer_defer() - Asynchronously transfer message to a SDW Slave device
  * @bus: SDW bus
  * @msg: SDW message to be xfered
- * @defer: Defer block for signal completion
  *
  * Caller needs to hold the msg_lock lock while calling this
  */
-int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
-		       struct sdw_defer *defer)
+int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg)
 {
 	int ret;
 
 	if (!bus->ops->xfer_msg_defer)
 		return -ENOTSUPP;
 
-	ret = do_transfer_defer(bus, msg, defer);
+	ret = do_transfer_defer(bus, msg);
 	if (ret != 0 && ret != -ENODATA)
 		dev_err(bus->dev, "Defer trf on Slave %d failed:%d\n",
 			msg->dev_num, ret);
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 7631ef5e71fb..96927a143796 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -151,8 +151,7 @@ int sdw_configure_dpn_intr(struct sdw_slave *slave, int port,
 			   bool enable, int mask);
 
 int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg);
-int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
-		       struct sdw_defer *defer);
+int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg);
 
 #define SDW_READ_INTR_CLEAR_RETRY	10
 
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 9c13dbd2b26e..2e39587ed1de 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -684,8 +684,6 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
 	if (!wr_msg)
 		return -ENOMEM;
 
-	bus->defer_msg.msg = wr_msg;
-
 	wbuf = kzalloc(sizeof(*wbuf), GFP_KERNEL);
 	if (!wbuf) {
 		ret = -ENOMEM;
@@ -713,7 +711,7 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
 	multi_link = bus->multi_link && (m_rt_count >= bus->hw_sync_min_links);
 
 	if (multi_link)
-		ret = sdw_transfer_defer(bus, wr_msg, &bus->defer_msg);
+		ret = sdw_transfer_defer(bus, wr_msg);
 	else
 		ret = sdw_transfer(bus, wr_msg);
 
-- 
2.25.1

