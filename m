Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4271EE95
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:18:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA616DF4;
	Thu,  1 Jun 2023 18:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA616DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685636316;
	bh=AHftZeeEX4lMWU8R+1V7rUeX1298pFYswdLpESDgaOc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B2alEM47RcVcCR1pHap0D+Q70CETGma5pduUef9neqvSjVjBls0q3Db9zX4ZXHzJ9
	 aksBLabT4Ug/EeeUA9LuNyP80IVCvGgiLmkRjRc5cBhpVRTjPs9/eIA6CvSaSYO3EM
	 n16XmKi4tvz7lhFA3nWXhnfZq/1tvp7UwfFz8LF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A97F80579; Thu,  1 Jun 2023 18:16:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B83CF80579;
	Thu,  1 Jun 2023 18:16:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CBEAF80149; Thu,  1 Jun 2023 18:16:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2D21F80132
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 18:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D21F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UnT+dCfq
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3517XPpJ025991;
	Thu, 1 Jun 2023 11:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=8aVpdlwW2w+KYJE7+AHWZW/cn5CRFeVkk84n9PBWCZg=;
 b=UnT+dCfq2a2bFjbclyx2HycRQiGETWpiqvhOfPpN7Gd99gL0/qednxFwBQ83aDKqn6kv
 vC0OtM6h+7BwfaIsf+6wKMeRIYgXRirdwU/9JX2vVeJo/bNa2223eE0Yhst/HtRmHjUW
 4Qq7fNxE2rUpDfQcLBFtvxo3fND0T3B7OzuoCTsJ/ul5cgQ3+S5AJo8n8mWg7pX4DUmZ
 W2Du4LiZS/3HxI+WMWXqizuyzHEJy+Mb0eGADGEnJpdST9ML+a0ns+sGXlRKGSH29Amr
 JwKF4kQxFOGgwNzdDe86WSOrtBPZCkTO6VG7dAp1cTg8frQS2y+yV9MEW1GOdEcDns4O vg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mxmbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 11:16:24 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 17:16:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 1 Jun 2023 17:16:23 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EACCD15B7;
	Thu,  1 Jun 2023 16:16:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 4/4] soundwire: stream: Tidy do_bank_switch error messages
Date: Thu, 1 Jun 2023 17:16:22 +0100
Message-ID: <20230601161622.1808135-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
References: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lPtkQwjhyZbOsug5tD47n3WRBjOJE70v
X-Proofpoint-ORIG-GUID: lPtkQwjhyZbOsug5tD47n3WRBjOJE70v
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: W5H2AT6I3CHHRUXF4OT2TCE5RIXIMM2G
X-Message-ID-Hash: W5H2AT6I3CHHRUXF4OT2TCE5RIXIMM2G
X-MailFrom: prvs=1516d3aa90=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5H2AT6I3CHHRUXF4OT2TCE5RIXIMM2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Every error path in do_bank_switch prints an error message so there is no
need for the callers to also print error messages. Indeed in multi-master
cases these extra messages are confusing because they print out against a
random bus device whereas the do_bank_switch messages print against the bus
that actually failed.

This also allows clean up of a couple of if's and variable initialisations
that were only there to silence potentially uninitialised variable
warnings on the bus variable.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/stream.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 248ab243ec6e4..b5c7a52aac19e 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1338,7 +1338,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 			       bool update_params)
 {
 	struct sdw_master_runtime *m_rt;
-	struct sdw_bus *bus = NULL;
+	struct sdw_bus *bus;
 	struct sdw_master_prop *prop;
 	struct sdw_bus_params params;
 	int ret;
@@ -1380,16 +1380,9 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 		}
 	}
 
-	if (!bus) {
-		pr_err("Configuration error in %s\n", __func__);
-		return -EINVAL;
-	}
-
 	ret = do_bank_switch(stream);
-	if (ret < 0) {
-		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
+	if (ret < 0)
 		goto restore_params;
-	}
 
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		bus = m_rt->bus;
@@ -1465,7 +1458,7 @@ EXPORT_SYMBOL(sdw_prepare_stream);
 static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
-	struct sdw_bus *bus = NULL;
+	struct sdw_bus *bus;
 	int ret;
 
 	/* Enable Master(s) and Slave(s) port(s) associated with stream */
@@ -1488,16 +1481,9 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 		}
 	}
 
-	if (!bus) {
-		pr_err("Configuration error in %s\n", __func__);
-		return -EINVAL;
-	}
-
 	ret = do_bank_switch(stream);
-	if (ret < 0) {
-		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	stream->state = SDW_STREAM_ENABLED;
 	return 0;
@@ -1571,10 +1557,8 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
 	}
 
 	ret = do_bank_switch(stream);
-	if (ret < 0) {
-		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* make sure alternate bank (previous current) is also disabled */
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
-- 
2.30.2

