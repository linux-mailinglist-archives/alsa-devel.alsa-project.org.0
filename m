Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2F2C2754
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 14:29:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53E7A16BB;
	Tue, 24 Nov 2020 14:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53E7A16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606224579;
	bh=IRSExc5EPqBMtx9nXBUcg9vmiw/rXkwU0En6NUOJHr0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fh3Ty12bGpawkHVnxO0wHA3jWyd5xSuArnHOLRXPIKOfJafqVpLqhJqJ9zACDnpvZ
	 lMEA9fGicsFMlM/+fkGSYG5cLX3yQUjZREsV6gdUelX+uwK5buTNTYfHELzqkS4NDU
	 rN6AI6ZXZY14cvcgoFosc1JLJScicxttq0ztxDbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 820CCF804E6;
	Tue, 24 Nov 2020 14:26:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA714F804CC; Tue, 24 Nov 2020 14:26:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2275DF80166
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 14:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2275DF80166
IronPort-SDR: 55i1ejQrj+SHlbX8SVFUTOZ/MdPTRbJW6spDGupl0cZLIwiDioKaV08/4AUSSaBmcWxxTRTRb2
 BxTfXQz5CxUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="172039574"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="172039574"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 05:26:17 -0800
IronPort-SDR: O/T+2ymNcpD6lR9K7QuPFLdxhLVUivm/bSYnoehkIrziTbwPG1MHuwboS+7hmuhEI5GdYYcgbu
 q+G0QbvD5hPw==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="546830661"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 05:26:13 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/5] soundwire: bus: only clear valid DPN interrupts
Date: Tue, 24 Nov 2020 09:33:18 +0800
Message-Id: <20201124013318.8963-6-yung-chuan.liao@linux.intel.com>
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

Mirror the changes made for DP0 and don't modify reserved fields.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index f66a804f9b74..d1e8c3a54976 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1353,7 +1353,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 				     int port, u8 *slave_status)
 {
-	u8 clear = 0, impl_int_mask;
+	u8 clear, impl_int_mask;
 	int status, status2, ret, count = 0;
 	u32 addr;
 
@@ -1370,6 +1370,8 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 	}
 
 	do {
+		clear = status & ~SDW_DPN_INTERRUPTS;
+
 		if (status & SDW_DPN_INT_TEST_FAIL) {
 			dev_err(&slave->dev, "Test fail for port:%d\n", port);
 			clear |= SDW_DPN_INT_TEST_FAIL;
@@ -1392,7 +1394,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 			*slave_status = clear;
 		}
 
-		/* clear the interrupt */
+		/* clear the interrupt but don't touch reserved fields */
 		ret = sdw_write(slave, addr, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
@@ -1413,7 +1415,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		count++;
 
 		/* we can get alerts while processing so keep retrying */
-	} while (status != 0 && count < SDW_READ_INTR_CLEAR_RETRY);
+	} while ((status & SDW_DPN_INTERRUPTS) && (count < SDW_READ_INTR_CLEAR_RETRY));
 
 	if (count == SDW_READ_INTR_CLEAR_RETRY)
 		dev_warn(slave->bus->dev, "Reached MAX_RETRY on port read");
-- 
2.17.1

