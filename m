Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301A5627A8B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 11:32:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFD441680;
	Mon, 14 Nov 2022 11:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFD441680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668421939;
	bh=RqQ8J3Oj9LtnV1xt2HgUacKT//wkn0/acH5Ub3s+Rzw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O8i0g1zFPWheE3eA0/4GeJyXKAKidKz97HoSBub5YkXkJxbpXCPWdPgJglSE7pk9f
	 5CoWjcT0/IgNCEysCmWcNJU8BgCMe77paGoNTECX3wIXhu//atRTV+/uRaQnSSAxzl
	 sd318WvwlId3BCuK/tbUwPh72sZyF+jOWUbHawMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B8AF8056F;
	Mon, 14 Nov 2022 11:30:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE762F8055A; Mon, 14 Nov 2022 11:30:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC587F80448
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 11:30:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC587F80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Pz4b01vd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AE8Wcie019990; Mon, 14 Nov 2022 04:29:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=wR8WznTLjHtXuxSzrfRxj5uzxnQfyrE3rhFbBYPUl9E=;
 b=Pz4b01vd4pkAmDey1/iXQitssuwC7GwX/0K9JnvGvgzq+o8fE3FKSzfVCrzQ8Jc8bLdH
 hUZSQjs7aVA0wl0SY5u41xvH6fdat2Wubil7qfcEUfs9dZQ3KTbUesGKBmTQyQFnxmGC
 CaKTjyNWg9bPUOBXfPX6p5I7RVetKAbVq68YEF28OxaYf5e9Qyzy5eI30XtRmrsNR3C0
 zEr97UTqDoo65QFwA6CpB4DA0ybLEgHy07ISEsYOJSeJ2ryxUpVICeaRcVYBvHHCjexb
 7CQ+/rz5wt7GIMPpJhiwKZUDjCrLGKKpBh2AmtA1srIZGO+B0LUVym/B/Ge74BkQwZdG uA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kt8sst0cm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 04:29:59 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Mon, 14 Nov
 2022 04:29:56 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via
 Frontend Transport; Mon, 14 Nov 2022 04:29:56 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 66CF8B2F;
 Mon, 14 Nov 2022 10:29:56 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
Date: Mon, 14 Nov 2022 10:29:55 +0000
Message-ID: <20221114102956.914468-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114102956.914468-1-ckeepax@opensource.cirrus.com>
References: <20221114102956.914468-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Q3wEA4SA0jb2CYzwI9IxJadDNNpQfAj0
X-Proofpoint-ORIG-GUID: Q3wEA4SA0jb2CYzwI9IxJadDNNpQfAj0
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

It is rather inefficient to be constantly enabling/disabling the PM
runtime as we print out each individual register, switch to holding a PM
runtime reference across the whole register output.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/debugfs.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 49900cd207bc7..0718e9cda138a 100644
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
@@ -55,6 +56,10 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
 	if (!buf)
 		return -ENOMEM;
 
+	ret = pm_runtime_resume_and_get(&slave->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
 	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
 
 	/* DP0 non-banked registers */
@@ -112,6 +117,10 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
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

