Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A69EF6692EC
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 10:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44317E96;
	Fri, 13 Jan 2023 10:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44317E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673602165;
	bh=7vfmYiwRnIv7Am96c9Qj/RTB4F0doxF2OEQMmfScbOc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r44Vg9v6k83co1O6ejmrFKNClcNnoWC6GUKt7pD2jSGEnH8wBJiwE9OOq9qsTV4Et
	 sAaUD2JVVhqo24lcwyB/ogaNXI6RstBfNALL4CU1ntdajuYgj1ial8Vseeps1bOK+y
	 J2gitCFSN36c9u6deWldAtpUGH3FP7Kg1YsQ7Kzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33AECF80557;
	Fri, 13 Jan 2023 10:27:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0124F80549; Fri, 13 Jan 2023 10:27:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D09F3F80543
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 10:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09F3F80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ibHUSLlJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673602065; x=1705138065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7vfmYiwRnIv7Am96c9Qj/RTB4F0doxF2OEQMmfScbOc=;
 b=ibHUSLlJZ5AQbt3mltkte5XKDE4VGzILlvAltCyQ9g7YZzLlhCm/fgom
 TxtzDdeZsIyKrZWm3qrgu2YU1Fx1ZKwbEAQO8yR7uw0oC28FNJaWQIT24
 uUGVryf246oOra9mpW8pdk+qVK5CGN6uixC7P5GzrpfCEKsDOng1Pc7kY
 fFl59Vx400CceJyBTb2mJqkKRC6o1qIYc3HWuI9wnjVj/IbVxPS+xHjmI
 zoevu1h+4sc8Wv+tZ34sJ4L631jZm9Ux/fQWz6c1xzbPxVeYm51/ugPET
 AmROzSvCUfaB6TxuuJL2E94Cb0WGFepiK1kklsJAjW/KlKdTu4mdZi8Ib w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="351189450"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="351189450"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="608116104"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="608116104"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 01:27:23 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/5] soundwire: bus: remove sdw_defer argument in
 sdw_transfer_defer()
Date: Fri, 13 Jan 2023 17:35:30 +0800
Message-Id: <20230113093532.3872113-4-yung-chuan.liao@linux.intel.com>
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
index f27bd37b154d..e0b0c63fc55c 100644
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

