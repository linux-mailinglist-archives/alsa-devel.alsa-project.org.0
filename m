Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE31CA766
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 11:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C49161848;
	Fri,  8 May 2020 11:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C49161848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588931066;
	bh=mX13jf7jO/9CRW0UsieoAnCpXEV3cFoaaDn/tClp5x8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQF/g0397LOgTtQO8QumNrGSN3bO9bzpIn52gDjcLszChYY67ip2GP0sR6HELqfzh
	 fF9gfpHRMHv1JC4lmRG3QRR0iwubwic8d/ZlvBsstCzis6ItU4HdDLQpuKiZcdcRmT
	 xN4y9Q1oXYawcmpt2+HXZVWSSHiRSr8Y7mVTJfTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7279F8025F;
	Fri,  8 May 2020 11:42:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75782F8025F; Fri,  8 May 2020 11:42:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8DDDF80234;
 Fri,  8 May 2020 11:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8DDDF80234
IronPort-SDR: azrY9gV3m395YVGXfFqcoFEwlS1vPRLJJPZlXDCb3sn2SPcki5N51wkH0NgLWS7VMWcV0SfIFG
 RLy5s3LrS8vg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 02:42:14 -0700
IronPort-SDR: VOMWZ4Loj/SLuOjgrVvhZ4lQI7l92K5jX7f+PtGespmkslVLE6Q18g3d+5KsGn0tRFK0Vhnu5m
 K5vn1gXceuSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; d="scan'208";a="435619137"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.34.170])
 by orsmga005.jf.intel.com with ESMTP; 08 May 2020 02:42:13 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] soundwire: (cosmetic) remove multiple superfluous
 "else" statements
Date: Fri,  8 May 2020 02:30:45 +0200
Message-Id: <20200508003046.23162-2-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508003046.23162-1-guennadi.liakhovetski@linux.intel.com>
References: <20200508003046.23162-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

No need for an "else" after a "return" statement. Remove multiple such
occurrences in bus.c.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/soundwire/bus.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 488c3c9..32de017 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -284,9 +284,10 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
 	msg->flags = flags;
 	msg->buf = buf;
 
-	if (addr < SDW_REG_NO_PAGE) { /* no paging area */
+	if (addr < SDW_REG_NO_PAGE) /* no paging area */
 		return 0;
-	} else if (addr >= SDW_REG_MAX) { /* illegal addr */
+
+	if (addr >= SDW_REG_MAX) { /* illegal addr */
 		pr_err("SDW: Invalid address %x passed\n", addr);
 		return -EINVAL;
 	}
@@ -306,7 +307,9 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
 	if (!slave) {
 		pr_err("SDW: No slave for paging addr\n");
 		return -EINVAL;
-	} else if (!slave->prop.paging_support) {
+	}
+
+	if (!slave->prop.paging_support) {
 		dev_err(&slave->dev,
 			"address %x needs paging but no support\n", addr);
 		return -EINVAL;
@@ -375,8 +378,8 @@ static int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
 	ret = sdw_transfer(bus, &msg);
 	if (ret < 0)
 		return ret;
-	else
-		return buf;
+
+	return buf;
 }
 
 static int
@@ -471,8 +474,8 @@ int sdw_read(struct sdw_slave *slave, u32 addr)
 	ret = sdw_nread(slave, addr, 1, &buf);
 	if (ret < 0)
 		return ret;
-	else
-		return buf;
+
+	return buf;
 }
 EXPORT_SYMBOL(sdw_read);
 
-- 
1.9.3

