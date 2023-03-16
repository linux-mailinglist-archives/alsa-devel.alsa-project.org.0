Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1BC6BD47C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:58:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3444910DB;
	Thu, 16 Mar 2023 16:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3444910DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678982321;
	bh=wh2ncfWA9fsUStaeuBhB1EgIxUEL0K6LB8MRtJYYzks=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=TAZ5O398ZyUe1AvEM+psTtfRWMDtF1JlAWypHn6mOV57ovqQsH8pSM/kid1s9nHji
	 4UOCzqSxUNWI75gD5aH2NRSfD52qnM5LGF0l5vLMhFWJ3WSq6x485wgGO8icjAHpT0
	 iH+xZZAbx7A/Zal//PFEIGGDrZL9x0AoFClPx6pc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59828F80272;
	Thu, 16 Mar 2023 16:57:50 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH 1/2] soundwire: bus: Remove now outdated comments on no_pm IO
Date: Thu, 16 Mar 2023 15:57:33 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EE2JTGMWIPAVEO65RFG7YBYV74LPM6RX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <167898226908.26.506808194693360278@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2CA3F80425; Thu, 16 Mar 2023 16:57:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A82EF800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A82EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=P++aAizv
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GFplkA021731;
	Thu, 16 Mar 2023 10:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=DBXtww78yw07xf9T00m7b4gxjriMUFYYNxflYL9yAX0=;
 b=P++aAizvRUKMh9a5zG+BIjh0ItErYLQgnujmolCAIUFOMPaWEzWDjYtHjUHB4JNZ9v2t
 SLe6KSjzzjZZHbHEN12GIT/bX2bOwhdueB94hojxZ2BH52e07TBZ9/TLAGfsEK68NfXg
 nCc2Iqa6Xnh+7Y1/CHPAilo2vIA6v1EczhY177L6ZsnoWZp7ijqhjmCcm6xiJWOJbwY1
 VpFhelTZiGSlKHApblgedBKic9jmzCp7A9sXUY6S3Upi8lLAp6w8abAR/BilYruZSOtK
 cgLANeNU1WElyDwqIvXQ/ffG/8qb2yOhfeiQlLnDXT4wpITY9416WXVOoSMtdKjab0p5 dA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pbs3b8qyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 10:57:36 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 16 Mar
 2023 10:57:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Thu, 16 Mar 2023 10:57:34 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 105C811AD;
	Thu, 16 Mar 2023 15:57:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH 1/2] soundwire: bus: Remove now outdated comments on no_pm IO
Date: Thu, 16 Mar 2023 15:57:33 +0000
Message-ID: <20230316155734.3191577-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4al91LoX_baKzo5Y6d5dK3uo_Ah7pDJI
X-Proofpoint-ORIG-GUID: 4al91LoX_baKzo5Y6d5dK3uo_Ah7pDJI
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EE2JTGMWIPAVEO65RFG7YBYV74LPM6RX
X-Message-ID-Hash: EE2JTGMWIPAVEO65RFG7YBYV74LPM6RX
X-MailFrom: prvs=843980a8d3=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EE2JTGMWIPAVEO65RFG7YBYV74LPM6RX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Things have moved more towards end drivers using the no_pm versions of
the IO functions. See commits:

commit 167790abb90f ("soundwire: export sdw_write/read_no_pm functions")
commit 62dc9f3f2fd0 ("soundwire: bus: export sdw_nwrite_no_pm and
                      sdw_nread_no_pm functions")

As such this comment is now misleading, so remove it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b6aca59c31300..3c67266f94834 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -384,9 +384,6 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
 
 /*
  * Read/Write IO functions.
- * no_pm versions can only be called by the bus, e.g. while enumerating or
- * handling suspend-resume sequences.
- * all clients need to use the pm versions
  */
 
 int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
-- 
2.30.2

