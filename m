Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7AD71EE8F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10C6CDED;
	Thu,  1 Jun 2023 18:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10C6CDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685636295;
	bh=WP+Wjk3T+igc9wYPVkjMPJwfOuhq+1rVzRNpxD6oeuI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N5pZFTfZqQLG4r6yZ56He/D30qJcUqb9uzbXKLyyROsjpg7LH8TEm3xoPA/PtMY9h
	 JsBCirXIdZrErocYue3coUC9VaXAoFILixjKc4KUtJQR/89oZTVRP5xuLYNEwsKz01
	 ObPntiM7XAvuRjZOGtj5g0WoiPqnkIce9WB+ebYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10503F80527; Thu,  1 Jun 2023 18:16:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F34CF80132;
	Thu,  1 Jun 2023 18:16:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2193F80199; Thu,  1 Jun 2023 18:16:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 294F6F80149
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 18:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 294F6F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=b9MVpmVj
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351BpAhP020645;
	Thu, 1 Jun 2023 11:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=WVl77aDZPiiy/Xm2MeadfaVYJBvh09LDGtM6Q0gPMuI=;
 b=b9MVpmVjFCP1W+VRojkkvlCYHS0nH3raAy/dPqlNwsNtapxNZYsvU5SaZzEAXYd7K5gw
 FZ7Hma7K7r6K2eOedz/ZIKgpQUwPJk1727uNeyElo8Krro4/NSn/jssjkBSiwsUhhwbZ
 01Ue0A7BpglNDQocs4fTxfHQek6V+REulUvHUdVIdrExINHLsuJg1yd+npmhtghZfsIQ
 I2pQ5vPMc9tPVB+mSGjcecnQnR1xhsv5fBriOXzml7pkxTgq+ktZ8xdBLVz4g3dlzAM7
 gXdyoWe6mVHKS3XR8/L8TvfmHSvQu/z33Wd9e2ns7myQ7Jpe/PEN25L7nIMPwBay2zdB ug==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mxmbs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 11:16:25 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 17:16:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 1 Jun 2023 17:16:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AEFBF468;
	Thu,  1 Jun 2023 16:16:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 1/4] soundwire: stream: Add missing clear of alloc_slave_rt
Date: Thu, 1 Jun 2023 17:16:19 +0100
Message-ID: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _k6sMXl3nmUC_5yfSH5nMaB7j9PP9N91
X-Proofpoint-ORIG-GUID: _k6sMXl3nmUC_5yfSH5nMaB7j9PP9N91
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SSGU35BWBOBZR3UQK3LMNZ5HMP2UGUEM
X-Message-ID-Hash: SSGU35BWBOBZR3UQK3LMNZ5HMP2UGUEM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSGU35BWBOBZR3UQK3LMNZ5HMP2UGUEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current path that skips allocating the slave runtime does not clear
the alloc_slave_rt flag, this is clearly incorrect. Add the missing
clear, so the runtime won't be erroneously cleaned up.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/stream.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index c2191c07442b0..379228f221869 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -2021,8 +2021,10 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 
 skip_alloc_master_rt:
 	s_rt = sdw_slave_rt_find(slave, stream);
-	if (s_rt)
+	if (s_rt) {
+		alloc_slave_rt = false;
 		goto skip_alloc_slave_rt;
+	}
 
 	s_rt = sdw_slave_rt_alloc(slave, m_rt);
 	if (!s_rt) {
-- 
2.30.2

