Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 624EA73019F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 16:22:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26DEC822;
	Wed, 14 Jun 2023 16:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26DEC822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686752541;
	bh=/jfwFr7Zebz/JAzse5PxOog56vbDL98xSdmwuI5tkBI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FoKQ5+DBgljiZB0Vl3um8YfpX+w9aTAQrLOqwNeWO1Ef8q9hu0O8E6f7WV1Sv8osQ
	 OQv7Bwr5dBlYEY2K+sKjTMvkXVdLy55NA2uikk1eKLjMdi3LzqBenCJMlyfzpD45vL
	 i9bwwZnqjYGn4SvbLiPPX8UKpcHvnviVxdBT/K/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98E9EF80533; Wed, 14 Jun 2023 16:21:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58D63F80132;
	Wed, 14 Jun 2023 16:21:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F9C1F80149; Wed, 14 Jun 2023 16:21:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A8340F80093
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 16:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8340F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=H6LmPnpK
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35E6jo01013361;
	Wed, 14 Jun 2023 09:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=qsdtg+KSTnLECmUdxnV2TOt3cZZQJt1+Bw7bX47d++s=;
 b=H6LmPnpKnJXNTAQbpFZrfL3WGo1erMbRs6QXOAMYsuyrmeSjKpQELoxs6a1BqJYm/SnL
 MP0stRBHvmDiai9h199Ni3wPSi29vXkJ/vK07V+wOal4MqEx046u/uMPEq2y/PspTXAy
 vzL8fljTry5mb84LNTZW0Yvkn2vUln1eJbXAvzetefT04OPQCn3tooG2f2/aOU3HqyPp
 /lsa5oMzP0TtRyfr54sTAR7lyXf7wtmNMGX2oMT/qEOEwa7GL5GlKkmoUHHmuvUw5m9A
 g15lZZ9AuAlYgkpWB2lJJgIFJkPuELNgZT5D8KtXOEBYOMVHM6vxfMM51P+ImgBPrnzg AQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r75nu8jxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jun 2023 09:21:18 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 14 Jun
 2023 15:21:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 14 Jun 2023 15:21:16 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8349845;
	Wed, 14 Jun 2023 14:21:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <rander.wang@intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: intel: sof_sdw: Fixup typo in device link checking
Date: Wed, 14 Jun 2023 15:21:16 +0100
Message-ID: <20230614142116.1059677-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: DyuQbFBcIJT8qbsUw-OTnuJT58GjKrng
X-Proofpoint-GUID: DyuQbFBcIJT8qbsUw-OTnuJT58GjKrng
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7OWECTN2KXQ4ZLXVELYJGWKYECSO5QOP
X-Message-ID-Hash: 7OWECTN2KXQ4ZLXVELYJGWKYECSO5QOP
X-MailFrom: prvs=15294dbfaa=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OWECTN2KXQ4ZLXVELYJGWKYECSO5QOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The loop checking for multiple different devices on a single sdw link
contains a typo accidentally using i twice instead of j. Correct to the
correct index variable.

Fixes: dc5a3e60a4b5 ("ASoC: Intel: sof_sdw: append codec type to dai link name")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6faf4a43eaf5a..144f082c63fda 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1347,7 +1347,7 @@ static int sof_card_dai_links_create(struct device *dev,
 				if ((SDW_PART_ID(adr_link->adr_d[i].adr) !=
 				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
 				    (SDW_MFG_ID(adr_link->adr_d[i].adr) !=
-				    SDW_MFG_ID(adr_link->adr_d[i].adr))) {
+				    SDW_MFG_ID(adr_link->adr_d[j].adr))) {
 					append_codec_type = true;
 					goto out;
 				}
-- 
2.30.2

