Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2EB632557
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 15:16:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CA7C1666;
	Mon, 21 Nov 2022 15:15:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CA7C1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669040161;
	bh=GCHlWhSc/Rr451Yld20fvBkjPbjtwLMhr0L53tuPqw4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqBAuJSKJfQFS/kUk6V95ERxuCP9G39d12DcJ2eYlP1MnBDiNPSvOvAqTyfbdTJlp
	 lFfT22dnT2VbaP3dnu3de95Gi+NLqtlNQObxCRsbteXq0lcKEJaXV7p9Ix6flIWiEE
	 f7oTQZVDjBcxYqX1Nkt899fcLKesWc9C/NpEvY3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 998D5F8055A;
	Mon, 21 Nov 2022 15:14:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F80AF8051B; Mon, 21 Nov 2022 15:14:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2E95F800F3
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 15:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E95F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="b9/wyJYV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ALCtMm8002614; Mon, 21 Nov 2022 08:14:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=HOjHRSQXtgdhVwHZ+HgWlY2gRn1pGVLV5kYH7Y3cWP4=;
 b=b9/wyJYVR6zKDn7TmOWEyZp7y2CGDoT4s1dh4aL9ulfPmV6CkboCudhC1Pws0wYdp/ft
 lW/rlzCsPPkHWWks2Xn6dOv2pfmNB7xFiVI29vVwYyQl2LnLw0OCvfFN3CYLguEXOct1
 ltQCKz//iPx4ntYBHjf6p0RMYI7tL6YhRXgLoQQCc8F7ykT3PkN5x813h4W9q5KjHmJN
 ZM5a19acfKNEJQTp5TxULRNaEA91BbCzLe6/OoTdskVYih2SoQ6fZ8Kn8inbHdG398JE
 VU4tDfY11ZMBxupqdp2vs4BGIZesYtIYlFSGS9tO1oZCQfz5lroE5n79R3tqHMowbSn1 cw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6t7hc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 08:14:09 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 08:14:06 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Mon, 21 Nov 2022 08:14:06 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8D8DCB2F;
 Mon, 21 Nov 2022 14:14:06 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v3 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
Date: Mon, 21 Nov 2022 14:14:05 +0000
Message-ID: <20221121141406.3840561-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121141406.3840561-1-ckeepax@opensource.cirrus.com>
References: <20221121141406.3840561-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qPXzth3N1MEWtS2ZGVhcfBvE3yho6Y1O
X-Proofpoint-GUID: qPXzth3N1MEWtS2ZGVhcfBvE3yho6Y1O
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

It is rather inefficient to be constantly playing with the runtime
PM reference for each individual register, switch to holding a PM
runtime reference across the whole register output.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Added Pierre's reviewed-by.
 - Fixed memory leak of buf on error path.

 drivers/soundwire/debugfs.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 49900cd207bc7..dea782e0edc4b 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -4,6 +4,7 @@
 #include <linux/device.h>
 #include <linux/debugfs.h>
 #include <linux/mod_devicetable.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -35,7 +36,7 @@ static ssize_t sdw_sprintf(struct sdw_slave *slave,
 {
 	int value;
 
-	value = sdw_read(slave, reg);
+	value = sdw_read_no_pm(slave, reg);
 
 	if (value < 0)
 		return scnprintf(buf + pos, RD_BUF - pos, "%3x\tXX\n", reg);
@@ -55,6 +56,12 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
 	if (!buf)
 		return -ENOMEM;
 
+	ret = pm_runtime_resume_and_get(&slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		kfree(buf);
+		return ret;
+	}
+
 	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
 
 	/* DP0 non-banked registers */
@@ -112,6 +119,10 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
 	}
 
 	seq_printf(s_file, "%s", buf);
+
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put(&slave->dev);
+
 	kfree(buf);
 
 	return 0;
-- 
2.30.2

