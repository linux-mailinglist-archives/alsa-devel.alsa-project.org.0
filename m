Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3871FEB6
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 12:13:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C8574C;
	Fri,  2 Jun 2023 12:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C8574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685700822;
	bh=cTiMdjmtmj6wdslDAKuNb+WnHcsroR6lhnElIncFZ4E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MfLwgLxvdjq5yU6296rCn0v618lx7afORSnt0JlSGDRD8z0i9OQWvU9+qR/xaGoRB
	 nEleoZACwm8mJuUz6nwWqvz36Gw18X7ie04WMuac45Y26yDBULidiuE3uKQ9W4xh/6
	 0U6cTC2YvbYjuulsaINmsstaGtUJ6HJ7ombjNrX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BDC9F80551; Fri,  2 Jun 2023 12:12:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC98EF80551;
	Fri,  2 Jun 2023 12:12:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B1DBF8047D; Fri,  2 Jun 2023 12:12:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AC5F8F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 12:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC5F8F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SMryi0aj
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35260jsx004169;
	Fri, 2 Jun 2023 05:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=VY/AOYGe8kE5LixgK7zc3+p/NvDWHs/M2Doh1utN4ws=;
 b=SMryi0aj85pSMAXaYHnR0aVrsbB9Y6Ypr9VL5Tm5N3nL1RF/JeyNxZ3s5ylsN7ZF6V2+
 pz+8halmhNxaJYQYkBV7bJi43Z7JvqFCLC77T+SScPxuBuorW+WEbCy/zgBw3v3zLUlu
 tw8zSnmrYSqDm9uGUXXOOzXXsVIfWux2Wf6ultfjZIUj09MB125kwhX3kaM1kOZLhxem
 g2W0KNkamyGfo8pcVSxvczarowoZdW2iRDim+Z3+/XGW1jdMgPeQSsh8V4+7TMBmlAJ4
 3bIZfQSCt11EwtpGTrEH+NDtCBRFBrBN00521GSn4sPU96VCU9diN8sh69CBP5VDm8d3 OA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9myr1p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 05:11:42 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 2 Jun
 2023 11:11:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 11:11:40 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C6CF115B7;
	Fri,  2 Jun 2023 10:11:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH v2 4/5] soundwire: stream: Invert logic on runtime alloc flags
Date: Fri, 2 Jun 2023 11:11:39 +0100
Message-ID: <20230602101140.2040141-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
References: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Afi5gbP48EpeNbLOkZkYq-2s7ug2Ap7Z
X-Proofpoint-ORIG-GUID: Afi5gbP48EpeNbLOkZkYq-2s7ug2Ap7Z
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GRNGD6UYAZUWF43JKNZ32DWJR7FHTC3G
X-Message-ID-Hash: GRNGD6UYAZUWF43JKNZ32DWJR7FHTC3G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRNGD6UYAZUWF43JKNZ32DWJR7FHTC3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

sdw_stream_add_slave/master have flags to indicate if the master or
slave runtime where allocated in that call to the function. Currently
these flags are cleared on all the paths where the runtime is not
allocated, it is more logic and simpler to set the flag on the one path
where the runtime is allocated.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Split out of the goto patch to ease review

Also worth noting I guess this patch could be squashed with patch 1 in
the series really, but I opted to leave them separate as patch 1 is a
much simpler fix to be cherry-picked back to older kernels if someone
needs the fixup, rather than mixing the fixup and tidy up.

Thanks,
Charles

 drivers/soundwire/stream.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 6595f47b403b5..df5600a80c174 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1854,7 +1854,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 			  struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
-	bool alloc_master_rt = true;
+	bool alloc_master_rt = false;
 	int ret;
 
 	mutex_lock(&bus->bus_lock);
@@ -1876,10 +1876,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	 * it first), if so skip allocation and go to configuration
 	 */
 	m_rt = sdw_master_rt_find(bus, stream);
-	if (m_rt) {
-		alloc_master_rt = false;
+	if (m_rt)
 		goto skip_alloc_master_rt;
-	}
 
 	m_rt = sdw_master_rt_alloc(bus, stream);
 	if (!m_rt) {
@@ -1888,6 +1886,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		ret = -ENOMEM;
 		goto unlock;
 	}
+
+	alloc_master_rt = true;
 skip_alloc_master_rt:
 
 	if (sdw_master_port_allocated(m_rt))
@@ -1980,8 +1980,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 {
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_master_runtime *m_rt;
-	bool alloc_master_rt = true;
-	bool alloc_slave_rt = true;
+	bool alloc_master_rt = false;
+	bool alloc_slave_rt = false;
 
 	int ret;
 
@@ -1992,10 +1992,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 * and go to configuration
 	 */
 	m_rt = sdw_master_rt_find(slave->bus, stream);
-	if (m_rt) {
-		alloc_master_rt = false;
+	if (m_rt)
 		goto skip_alloc_master_rt;
-	}
 
 	/*
 	 * If this API is invoked by Slave first then m_rt is not valid.
@@ -2009,21 +2007,22 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		goto unlock;
 	}
 
+	alloc_master_rt = true;
+
 skip_alloc_master_rt:
 	s_rt = sdw_slave_rt_find(slave, stream);
-	if (s_rt) {
-		alloc_slave_rt = false;
+	if (s_rt)
 		goto skip_alloc_slave_rt;
-	}
 
 	s_rt = sdw_slave_rt_alloc(slave, m_rt);
 	if (!s_rt) {
 		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
-		alloc_slave_rt = false;
 		ret = -ENOMEM;
 		goto alloc_error;
 	}
 
+	alloc_slave_rt = true;
+
 skip_alloc_slave_rt:
 	if (sdw_slave_port_allocated(s_rt))
 		goto skip_port_alloc;
-- 
2.30.2

