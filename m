Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C16A40A7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 12:30:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1BC829;
	Mon, 27 Feb 2023 12:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1BC829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677497436;
	bh=m23x4eA0Yje5e+qIqySChAy8CI4F7s0YtX6wdZ1mTg0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q87bUQoVn2/NBFG9rDJavviq0KIhZK+0kasolhZjoC3MiyfAXrZTh/CfDH2Cff+11
	 eyMainuL3JbkK0gm+BY4OyC8qr/eYtd0mNAgz8QZvi9Pw+G9FSkG3cUDjbc4pOE0a+
	 JYths/s26pp7Anmyfe1s0xoWI/AYw048namrNar8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9B8F802BE;
	Mon, 27 Feb 2023 12:29:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAAE7F8049C; Mon, 27 Feb 2023 12:29:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96970F80236
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 12:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96970F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Njk7cQYU
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31R7xdxf008785;
	Mon, 27 Feb 2023 05:29:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=Of2uJxpH147M/PfixXcWrSpU2yZj/3O1vyiEt2/kYYs=;
 b=Njk7cQYUYGCJiIyKvsHL4uzQv5Xy0JDJgn5DM6Hxp1NLcNZAyiN1d9gooKGhTaGdubIT
 vbZklTJNB0fKql8Um2LXgC8sFXA/Mu3TkWcmMKAIYc8o3XVidhFVhNh83jLxC0UiguX8
 4uvYHmB/cuBvcFjoAANwrFc5RpXpc2OGWjvj4HZgDt2epL4FTy7IQYppTAnOIW5Bi3y2
 s17SXKty4rHNCOaeTUJakvWFH7dBfB9jkHlxI60cSB76xrFs/LXxfSRwApqM6znLrQ6i
 oky/tFZNhNbdTlBq5Ae+4pJMdONrN+UcBmn4JqH51YhvRNuehjWOhvYKXRiRY5gTrgo9 wA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nyfmt318y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 05:29:34 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 27 Feb
 2023 05:29:33 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 27 Feb 2023 05:29:33 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 43F282A1;
	Mon, 27 Feb 2023 11:29:33 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH] soundwire: bus: Fix unbalanced pm_runtime_put() causing usage
 count underflow
Date: Mon, 27 Feb 2023 11:29:33 +0000
Message-ID: <20230227112933.1593997-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GBWC0_m8lQofO7J-JHQhJm6sDI-NNg1B
X-Proofpoint-GUID: GBWC0_m8lQofO7J-JHQhJm6sDI-NNg1B
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2OORCUKRE6JBRIUACKJ4ACF6W2FOZWT6
X-Message-ID-Hash: 2OORCUKRE6JBRIUACKJ4ACF6W2FOZWT6
X-MailFrom: prvs=74223fc41f=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OORCUKRE6JBRIUACKJ4ACF6W2FOZWT6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This reverts commit
443a98e649b4 ("soundwire: bus: use pm_runtime_resume_and_get()")

Change calls to pm_runtime_resume_and_get() back to pm_runtime_get_sync().
This fixes a usage count underrun caused by doing a pm_runtime_put() even
though pm_runtime_resume_and_get() returned an error.

The three affected functions ignore -EACCES error from trying to get
pm_runtime, and carry on, including a put at the end of the function.
But pm_runtime_resume_and_get() does not increment the usage count if it
returns an error. So in the -EACCES case you must not call
pm_runtime_put().

The documentation for pm_runtime_get_sync() says:
 "Consider using pm_runtime_resume_and_get() ...  as this is likely to
 result in cleaner code."

In this case I don't think it results in cleaner code because the
pm_runtime_put() at the end of the function would have to be conditional on
the return value from pm_runtime_resume_and_get() at the top of the
function.

pm_runtime_get_sync() doesn't have this problem because it always
increments the count, so always needs a put. The code can just flow through
and do the pm_runtime_put() unconditionally.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 76515c33e639..4fd221d0cc81 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -571,9 +571,11 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&slave->dev);
-	if (ret < 0 && ret != -EACCES)
+	ret = pm_runtime_get_sync(&slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(&slave->dev);
 		return ret;
+	}
 
 	ret = sdw_nread_no_pm(slave, addr, count, val);
 
@@ -595,9 +597,11 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&slave->dev);
-	if (ret < 0 && ret != -EACCES)
+	ret = pm_runtime_get_sync(&slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(&slave->dev);
 		return ret;
+	}
 
 	ret = sdw_nwrite_no_pm(slave, addr, count, val);
 
@@ -1565,9 +1569,10 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
 
-	ret = pm_runtime_resume_and_get(&slave->dev);
+	ret = pm_runtime_get_sync(&slave->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
+		pm_runtime_put_noidle(&slave->dev);
 		return ret;
 	}
 
-- 
2.30.2

