Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 698CF638C0B
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:22:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 045401749;
	Fri, 25 Nov 2022 15:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 045401749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386171;
	bh=lEhZVYNKRRmf7hoT5EM+6+7i672ZtrYB36Kz4bHA2NM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbKv8+EXLM7+ffwXVQ5CdkER/1HYko+3f72BKCvhu12eSubEKXie30+nCa62a948n
	 SRSfvZ7nXj9rjG8TeJHAOgETiMkc5lU5s+9K4CnZsOw+tRYb2TxJ41oGScvGBoLKeV
	 J20iOtaxepR0uWCaPPaJ1lc23w0uqhdJAEN6TtQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 783D8F80567;
	Fri, 25 Nov 2022 15:20:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 533CBF8047C; Fri, 25 Nov 2022 15:20:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09DD0F80171
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09DD0F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LhZNHUmH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2APCp6w8007040; Fri, 25 Nov 2022 08:20:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=fmtjNKPzLbqjNIqHltuZn0oCtwpbo1qpHKVTmVc8jZc=;
 b=LhZNHUmHWJLT2pQ9s4mQSKQ19X7WWiWy4sncMf3o6LmGyzTZeCKR8gmy91JjLXxkZIRu
 KpaZK20spzt7id3XxM2Lo2A4044JDGlVVxo3oU4oD3VWaR6P2PkmMhjpsI9dYjZosZpw
 8kdZ+4sOi2MKRU5/n9oo0PYCPbYO6+1GVo9MiNtvwRoOxtvZAwtIiyug6KGYBlHuV6lY
 e7u3rowcl+L4uns42OPO7kic7rr6IPRucSECJSWFWs6QjDEs5mlj5S89a+RY89w/4uzz
 9EuUEyDmOwj86Egmskc+MzJIsDE3snGlmdq+Nv0FsaiJ5hPSpH1p5wS6CkXnNUujM7Gb ew== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet7ccn-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 08:20:32 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 08:20:29 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Fri, 25 Nov 2022 08:20:29 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 27DF2B2F;
 Fri, 25 Nov 2022 14:20:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v4 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
Date: Fri, 25 Nov 2022 14:20:27 +0000
Message-ID: <20221125142028.1118618-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125142028.1118618-1-ckeepax@opensource.cirrus.com>
References: <20221125142028.1118618-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tbFnoGi_Ad1V39P-G-zMdKzR9s9Ew5e6
X-Proofpoint-GUID: tbFnoGi_Ad1V39P-G-zMdKzR9s9Ew5e6
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

No change since v3.

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

