Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9F62C271B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 14:28:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50AB41683;
	Tue, 24 Nov 2020 14:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50AB41683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606224519;
	bh=J5GrLXeqbAXZgi/Tp5JOd62olshIV5xw9gfaAr5Pe7Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sfCOuEBu/Y61dpQjtHFQN+6g6YsVo0A28dkNgD9iyMCrIq85SztduRSjY2isU27q+
	 lhLZ0JjjF3q3fQCbqq2nx8GGVA8NITkLd1vdWN+RX6ugNj0/Fh5Kk7uPDxgpU3R3Oi
	 PeM4OMf1BPEMR7GflO+VvPOoWKGQOHzkGbDpBCfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D82AF800C1;
	Tue, 24 Nov 2020 14:26:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2481FF804BD; Tue, 24 Nov 2020 14:26:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7689EF804BC
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 14:26:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7689EF804BC
IronPort-SDR: yXoDiT6L9Ot0ZednGQXRyacR7Wnjvb5PxMyAxehx80aYHeCLXW2Een/3UuEqFjcabqzum+xqfR
 Y/hhc9ZLojAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="172039567"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="172039567"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 05:26:13 -0800
IronPort-SDR: CFMAu0lT0wubz9oezkMeE+x7exoMJProi5RciL3JMtyNeMfhDrJsDcHTcvBwrfsnHZk9EeL4Kw
 KHdyQAsLfSbQ==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="546830645"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 05:26:10 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/5] soundwire: bus: only clear valid DP0 interrupts
Date: Tue, 24 Nov 2020 09:33:17 +0800
Message-Id: <20201124013318.8963-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124013318.8963-1-yung-chuan.liao@linux.intel.com>
References: <20201124013318.8963-1-yung-chuan.liao@linux.intel.com>
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

We should only access the fields that are relevant for DP0, and never
write to reserved or read-only SDCA_CASCADE fields.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d6e646521819..f66a804f9b74 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1280,7 +1280,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 
 static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 {
-	u8 clear = 0, impl_int_mask;
+	u8 clear, impl_int_mask;
 	int status, status2, ret, count = 0;
 
 	status = sdw_read(slave, SDW_DP0_INT);
@@ -1291,6 +1291,8 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 	}
 
 	do {
+		clear = status & ~SDW_DP0_INTERRUPTS;
+
 		if (status & SDW_DP0_INT_TEST_FAIL) {
 			dev_err(&slave->dev, "Test fail for port 0\n");
 			clear |= SDW_DP0_INT_TEST_FAIL;
@@ -1319,7 +1321,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 			*slave_status = clear;
 		}
 
-		/* clear the interrupt */
+		/* clear the interrupts but don't touch reserved and SDCA_CASCADE fields */
 		ret = sdw_write(slave, SDW_DP0_INT, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
@@ -1340,7 +1342,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 		count++;
 
 		/* we can get alerts while processing so keep retrying */
-	} while (status != 0 && count < SDW_READ_INTR_CLEAR_RETRY);
+	} while ((status & SDW_DP0_INTERRUPTS) && (count < SDW_READ_INTR_CLEAR_RETRY));
 
 	if (count == SDW_READ_INTR_CLEAR_RETRY)
 		dev_warn(slave->bus->dev, "Reached MAX_RETRY on DP0 read\n");
-- 
2.17.1

