Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2CB34A40F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 10:18:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 600D2852;
	Fri, 26 Mar 2021 10:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 600D2852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616750294;
	bh=fgGsgsJqjbBBhZksJNtNwNNXJ3IB09PE7EkyhiGweeM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sIz2UbRyyIKhYgXj4VbGTHbB5TTqvqZsZP842vcBRvKjeojE/RSn2TFamZRA8OXSt
	 3kK113TJG8Mj9EAhu5us21dTMNCG7VHzrbz+0qr9+z/+ujYDNVfdPMfXdchuTuxIsg
	 9jBUtTxQlUbzNaqXmRz4Mb0lUBdLnVv4CJlT6DHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F056F8042F;
	Fri, 26 Mar 2021 10:15:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 875B0F8032C; Fri, 26 Mar 2021 10:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E214F802DB
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 10:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E214F802DB
IronPort-SDR: YnVVtah4dZrdD8wkYvGj6pUxUAygT2iarPUlCoNmm0Xek+DY8zvsOeDHXDCbPzLIyDIxcISYaf
 JKeuIDQKWd0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276249441"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="276249441"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:42 -0700
IronPort-SDR: a+Ips0hBo8a/YVK4bEK2GPju3/bfUOE/mDrHpqDvrPQp3AgeFwQHQDLf0k2NsYQjGBmds7yvKO
 OjXHLnxErFow==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="416463167"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 05/11] soundwire: bus: uniquify dev_err() for SCP_INT
 access
Date: Fri, 26 Mar 2021 17:15:08 +0800
Message-Id: <20210326091514.20751-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
References: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
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

We have multiple cases where we read/write SCP_INT registers, but the
same error message in all cases. Add a distinct error message for each
case to help debug.

Reported-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 8b6d8fe934ae..a38b017f7a54 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1636,7 +1636,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		ret = sdw_read_no_pm(slave, SDW_SCP_INT1);
 		if (ret < 0) {
 			dev_err(&slave->dev,
-				"SDW_SCP_INT1 read failed:%d\n", ret);
+				"SDW_SCP_INT1 recheck read failed:%d\n", ret);
 			goto io_err;
 		}
 		_buf = ret;
@@ -1644,7 +1644,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, _buf2);
 		if (ret < 0) {
 			dev_err(&slave->dev,
-				"SDW_SCP_INT2/3 read failed:%d\n", ret);
+				"SDW_SCP_INT2/3 recheck read failed:%d\n", ret);
 			goto io_err;
 		}
 
@@ -1652,7 +1652,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 			if (ret < 0) {
 				dev_err(&slave->dev,
-					"SDW_DP0_INT read failed:%d\n", ret);
+					"SDW_DP0_INT recheck read failed:%d\n", ret);
 				goto io_err;
 			}
 			sdca_cascade = ret & SDW_DP0_SDCA_CASCADE;
-- 
2.17.1

