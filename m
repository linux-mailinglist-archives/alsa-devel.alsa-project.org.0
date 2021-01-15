Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A82F7251
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 06:41:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA9B17A8;
	Fri, 15 Jan 2021 06:40:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA9B17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610689266;
	bh=c16L2UmjxdNA3HdRbwCKje8jde+iaqRXKVWGaGH7gwc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fu8YsbWCjJDXoaG1i1JSJHENQ0HUv3pcjDqouZR9iXyaE849qye83sDQFqgjCzTa7
	 km+w/BXJCHgbWBYy6f2s5zEjDMFEuwjwwcFQZaFSybtI0DGpbfSPbQAsv6sEw82e2D
	 F/0+fmJrkavcFtfQ5eyEihGu+weahMwkXq7DIWR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56068F804E0;
	Fri, 15 Jan 2021 06:38:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 218B5F8026B; Fri, 15 Jan 2021 06:37:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF02AF80132
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 06:37:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF02AF80132
IronPort-SDR: +ObRv/2mcGUgoTaFpsWhSPNilo79+2+JBqBRvNSuYid/HT83ydsZ94K7RBB3i2bcpQTGsZje3A
 iqDwHB86+hWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240046289"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="240046289"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:47 -0800
IronPort-SDR: ewqWG8xDgNFLSwPtAA30s5IyQgMGygfb2JfnHnzckq47SJB6bdlNFvsM1xcxCaZoRT/dqSH6jH
 9oedpshJ5RGw==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="382542456"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:44 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/5] soundwire: bus: add more details to track failed transfers
Date: Fri, 15 Jan 2021 13:37:36 +0800
Message-Id: <20210115053738.22630-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
References: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
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

The current error log does not provide details on the type of
transfers and which address/count was requested. All this information
can help locate in which parts of the configuration process an error
occurred.

Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 3cc006bfae71..6e1c988f3845 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -267,8 +267,10 @@ static int sdw_transfer_unlocked(struct sdw_bus *bus, struct sdw_msg *msg)
 
 	ret = do_transfer(bus, msg);
 	if (ret != 0 && ret != -ENODATA)
-		dev_err(bus->dev, "trf on Slave %d failed:%d\n",
-			msg->dev_num, ret);
+		dev_err(bus->dev, "trf on Slave %d failed:%d %s addr %x count %d\n",
+			msg->dev_num, ret,
+			(msg->flags & SDW_MSG_FLAG_WRITE) ? "write" : "read",
+			msg->addr, msg->len);
 
 	if (msg->page)
 		sdw_reset_page(bus, msg->dev_num);
-- 
2.17.1

