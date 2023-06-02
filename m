Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCFD71FEB9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 12:14:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81ECF83E;
	Fri,  2 Jun 2023 12:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81ECF83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685700846;
	bh=VfQkYHY1ZqtGWJYSXowsoVDB3aWU5MV9g90gh90HnZU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WZpVxhw3iFcwPSSKx2u0SMMLU7m30PUL0rrullf+Frh2BnUKGsSyaijwCYvvpSIFm
	 dG1x/smr6ZSAQLPLj8ZluQaBCrPn102jPlahTheUtJ05vPF7mTRlFarG6s76EOFccR
	 /ZAa6yzRHeUAWTsz9rtilKdomcEk4vmrYfCd4bOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 361CAF805A1; Fri,  2 Jun 2023 12:12:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8553BF80580;
	Fri,  2 Jun 2023 12:12:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3BB0F80558; Fri,  2 Jun 2023 12:12:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9084F80132
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 12:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9084F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PRBjBC6K
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3529pNL5008786;
	Fri, 2 Jun 2023 05:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=TBrMIq8lNLq6LXZ22105Me5KRw2T5hajdIlSi0oqyZ4=;
 b=PRBjBC6KAAu8AF730aSdv4vxPv7Iwu7bd31XVYRsDm9ifxiSDdFMDnLd/9HHF1+FqvCn
 PN9IlrCuMGPQXorBCl5Biw6tGirQE8gHaT4JW3zOmHl9G5ofv3GZuMIhi8D9PqgUZruw
 RHWL0cQDmlAQHcBCdrW7blpaS0IBeBLDknSM8fHVN6nPK4HKcC28FzcNhULs0AxKrtSu
 4WWATWN494DkVH3ZkBMm8gaUDiluWNQnctJTbgkXjACrrJ01jtOvO2/NpHErcuSmFd85
 ysRKFD4uN9D0woNuM4V/yzdYtZKXiMIOnCI48+AIqYxo924Z4yObb2GcXvqEkQNinupo uA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90y83v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 05:11:43 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 2 Jun
 2023 11:11:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 2 Jun 2023 11:11:40 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B735711AA;
	Fri,  2 Jun 2023 10:11:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH v2 3/5] soundwire: stream: Remove unneeded checks for NULL bus
Date: Fri, 2 Jun 2023 11:11:38 +0100
Message-ID: <20230602101140.2040141-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
References: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ttStr9w0m9_VGqBI0a0LwYRjYUnmlaIQ
X-Proofpoint-ORIG-GUID: ttStr9w0m9_VGqBI0a0LwYRjYUnmlaIQ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DP3BZLELLOBBQVVJ25BFFIJ7JVYTX2CD
X-Message-ID-Hash: DP3BZLELLOBBQVVJ25BFFIJ7JVYTX2CD
X-MailFrom: prvs=1517dd3c90=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DP3BZLELLOBBQVVJ25BFFIJ7JVYTX2CD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Version of the code prior to commit d014688eb373 ("soundwire: stream:
remove bus->dev from logs on multiple buses"), used bus->dev in the
error message after do_bank_switch, this necessitated some checking to
ensure the bus pointer was valid. As the code no longer uses bus->dev
said checking is now redundant, so remove it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Left the duplicate error prints in.

Thanks,
Charles

 drivers/soundwire/stream.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 379228f221869..6595f47b403b5 100644
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
@@ -1382,11 +1382,6 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 		}
 	}
 
-	if (!bus) {
-		pr_err("Configuration error in %s\n", __func__);
-		return -EINVAL;
-	}
-
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
 		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
@@ -1467,7 +1462,7 @@ EXPORT_SYMBOL(sdw_prepare_stream);
 static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
-	struct sdw_bus *bus = NULL;
+	struct sdw_bus *bus;
 	int ret;
 
 	/* Enable Master(s) and Slave(s) port(s) associated with stream */
@@ -1490,11 +1485,6 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 		}
 	}
 
-	if (!bus) {
-		pr_err("Configuration error in %s\n", __func__);
-		return -EINVAL;
-	}
-
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
 		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
-- 
2.30.2

