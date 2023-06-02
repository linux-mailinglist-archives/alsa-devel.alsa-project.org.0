Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD49371FEBA
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 12:14:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21026822;
	Fri,  2 Jun 2023 12:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21026822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685700875;
	bh=X5+dhwPz2vtC7tFcuysq9BoN/EerkDzTH6T2xFypBz4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jWCM0xieOrC8oqi136sMS2HCNFyicj4oChXwHHsJJGEGIirfvaLoM/b4sXiYpuCcE
	 C2OZUoRcA0nWC/flf3ka0S/dtraKjc9vZKLBy+l+lO6Q5veDs+rvX+vPsYm+sBCYc0
	 pvC6gji2pIP97f+s1u7wcG6glyOtogbDJxN8Mlt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00018F805A0; Fri,  2 Jun 2023 12:12:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76072F805A0;
	Fri,  2 Jun 2023 12:12:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F03BF805A9; Fri,  2 Jun 2023 12:12:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D406F8016B
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 12:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D406F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=gyLkkm8O
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35260jsw004169;
	Fri, 2 Jun 2023 05:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0oW6c0O7PIMw0dE08KvhlhAtSajGICopR4i8kG8wcME=;
 b=gyLkkm8O3KlbTvNnmk6WvVwBywdDuFsbRjEaKyjuafP96q9qi+oh9GI263hSR/zOBRkz
 oW6FM1uwimnbXkK1u9IgPvNr6jZ2l0EQsrvREm4khguD5nAKnCr7wSkEJxO9LF9qxhWl
 dtGmqM1iiroEZxvMR36v/v7BqTzLYHPfG00s/i5Wq2Sv9/wLUtdSg4L7Rj1ecqm7k+bK
 RdBClX3snO4QA/e+Rq9JKZcK60T9FIOpwK10Lr96xpSxo1Bzof4tnOgRaWVLNAYzaA9f
 zMFMS0DTzKRieGdQsY8xU/jDHLILmU9KmNsaLdlgD/QSJFWffsalYzWPlBbWtdBDeQhO IQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9myr1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 05:11:42 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 2 Jun
 2023 11:11:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 2 Jun 2023 11:11:40 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AD91211C6;
	Fri,  2 Jun 2023 10:11:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH v2 2/5] soundwire: bandwidth allocation: Remove pointless
 variable
Date: Fri, 2 Jun 2023 11:11:37 +0100
Message-ID: <20230602101140.2040141-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
References: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: To0M1bIXH1WGsEKk2leM4UQaVu5iD9rk
X-Proofpoint-ORIG-GUID: To0M1bIXH1WGsEKk2leM4UQaVu5iD9rk
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: E3CRHGRZEIO6HU2FHLWKRUTTK7EF5I5G
X-Message-ID-Hash: E3CRHGRZEIO6HU2FHLWKRUTTK7EF5I5G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3CRHGRZEIO6HU2FHLWKRUTTK7EF5I5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The block_offset variable in _sdw_compute_port_params adds nothing
either functionally or in terms of code clarity, remove it.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

Thanks,
Charles

 drivers/soundwire/generic_bandwidth_allocation.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 325c475b6a66d..31162f2b56381 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -139,20 +139,16 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
 {
 	struct sdw_master_runtime *m_rt;
 	int hstop = bus->params.col - 1;
-	int block_offset, port_bo, i;
+	int port_bo, i;
 
 	/* Run loop for all groups to compute transport parameters */
 	for (i = 0; i < count; i++) {
 		port_bo = 1;
-		block_offset = 1;
 
 		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
-			sdw_compute_master_ports(m_rt, &params[i],
-						 port_bo, hstop);
+			sdw_compute_master_ports(m_rt, &params[i], port_bo, hstop);
 
-			block_offset += m_rt->ch_count *
-					m_rt->stream->params.bps;
-			port_bo = block_offset;
+			port_bo += m_rt->ch_count * m_rt->stream->params.bps;
 		}
 
 		hstop = hstop - params[i].hwidth;
-- 
2.30.2

