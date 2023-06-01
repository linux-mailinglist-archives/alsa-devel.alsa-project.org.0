Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD6971EE85
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B547868;
	Thu,  1 Jun 2023 18:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B547868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685636245;
	bh=D1WXxQvCONZw9vKeOeHo9QXCsHUFNj5md2XeIHWczVY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BmWm2Wug/od6L7wWtAQBl64UQ5nGDiRIEdPUPalR94MR2EfA6QflpAyVPR+Lq+xy6
	 n9aQe8G1UUwMhT0omurw6LloWEXFSl9XXrKqQpiCm5txosm8FkzR6dxfHQEyMb3NOK
	 /EAXq32Ifah83Fe3+KywEDG8YBWrGlDxOL/QvNzE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3189BF804DA; Thu,  1 Jun 2023 18:16:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BCD0F80132;
	Thu,  1 Jun 2023 18:16:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ED35F8047D; Thu,  1 Jun 2023 18:16:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E0DFCF800ED
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 18:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0DFCF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=N5Xabbob
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351BpAhO020645;
	Thu, 1 Jun 2023 11:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oGO1kJjV3yrfT9NmYjrlFN16c9sOtoFELGONCNpx4eo=;
 b=N5XabbobvAah4nrKOWXkAsageJ86p4w5gn4NzY/p1YVHpEHlFsNkoitaNK6MOgYfmDmF
 14mpVD2RFYr7AK2wF664kQSiY5pVhWxMPwSWyXwlYiVboE7JTY3K29BGD0V8odq0xAFQ
 PC/n7kHepgV9XJn0sQhus1OxtVo0WN+HgCvED0M+0F18oYMgjudBs2k9fDVUNA9f3hOA
 2PkNlC5GJT2pY578wG/DV/2ekebF2i42uT2PMykNADcSULUJfLJfkdVJDF+Bp5Cv5YJ5
 Ds+EQpEbAwEWgZs6sPBeqzOlfmh5rYHVMG2DF50zRGUoW2QhEJFDvK1gVS0ghR1uKSSQ wQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mxmbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 11:16:24 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 17:16:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 1 Jun 2023 17:16:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BD1C0475;
	Thu,  1 Jun 2023 16:16:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 2/4] soundwire: bandwidth allocation: Remove pointless
 variable
Date: Thu, 1 Jun 2023 17:16:20 +0100
Message-ID: <20230601161622.1808135-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
References: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mv5dnun0rvrvMjAOTZzC2XqxkfjFI0JH
X-Proofpoint-ORIG-GUID: mv5dnun0rvrvMjAOTZzC2XqxkfjFI0JH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VPIAITZUIRWF6T6IVTXYY4YSAQCF2FTM
X-Message-ID-Hash: VPIAITZUIRWF6T6IVTXYY4YSAQCF2FTM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPIAITZUIRWF6T6IVTXYY4YSAQCF2FTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The block_offset variable in _sdw_compute_port_params adds nothing
either functionally or in terms of code clarity, remove it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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

