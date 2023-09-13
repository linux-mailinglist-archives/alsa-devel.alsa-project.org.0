Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAED79EDF1
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 18:06:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1DB3A4B;
	Wed, 13 Sep 2023 18:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1DB3A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694621187;
	bh=Oz5iiZNvtxr89NA3fsohT1srtVWaKZA9oGqgbsUaX+8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Sb43xLznbapwskNmdKevVerweO4Ix2prSHE1waLqqv1ailwcqrfhe0cpMjRGm9+YR
	 mRvS7voCuwexb4dTGM7gy+dYFT2bRVERZxEqluLZ4yxG58sFvNoBWXXsRd/QLw7h6g
	 h6rZhmvI/qhcJle9tbUNeRPflpBPH9nk3RcCU/5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0AFCF80551; Wed, 13 Sep 2023 18:05:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 442EFF801F5;
	Wed, 13 Sep 2023 18:05:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C39DF80425; Wed, 13 Sep 2023 18:05:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2D12F801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 18:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D12F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=M34Tx9z8
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38DFQcjq002023;
	Wed, 13 Sep 2023 11:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=x
	7xY/Bo54rmkapWVRvyY9QbwaOEFq2pdNqDed36g8Fw=; b=M34Tx9z8kUskTNPCn
	hlPmo2rEf5LjHQEN7z1S5dyMGd1vDZJ5DANq37yP2Vloj+qUl+B/RQB5N5/UqbuK
	E03MLhfOVznwMrj/ZLQmPehyMjCIguQfx7HnLBcMeUvpavpRyd7CIgiadkDgLTwo
	rVSMSl9oP0w6coIQOaKInxe3P69KnlOfXbUNkWGSlFl8l2t70f2zkKA0tERNRWVp
	pggCSm7+vW8pO3+iX2A8b3swgmviwK67D90gJyulpOIppP6ZP8A3xA/vLejD7AfZ
	AV4nerBGPFBOlWc7VewhkgP/0Raf9QA4SZ//ijLClDvrlRXXw9DlUcPndVA2g12i
	ecGng==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7sh0qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 11:05:24 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 13 Sep
 2023 17:05:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 13 Sep 2023 17:05:23 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0873515B9;
	Wed, 13 Sep 2023 16:05:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] firmware: cirrus: cs_dsp: Only log list of algorithms in
 debug build
Date: Wed, 13 Sep 2023 17:05:23 +0100
Message-ID: <20230913160523.3701189-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LcYtPJMkHiOR5iOEnMyA45-FaDiOlyKX
X-Proofpoint-ORIG-GUID: LcYtPJMkHiOR5iOEnMyA45-FaDiOlyKX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HBP6SB62W42G5Y37A7OYDSJLWECCQPFA
X-Message-ID-Hash: HBP6SB62W42G5Y37A7OYDSJLWECCQPFA
X-MailFrom: prvs=4620548a1c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBP6SB62W42G5Y37A7OYDSJLWECCQPFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the logging of each algorithm from info level to debug level.

On the original devices supported by this code there were typically only
one or two algorithms in a firmware and one or two DSPs so this logging
only used a small number of log lines.

However, for the latest devices there could be 30-40 algorithms in a
firmware and 8 DSPs being loaded in parallel, so using 300+ lines of log
for information that isn't particularly important to have logged.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 17b7198b87dc..4d702442565e 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1827,15 +1827,15 @@ static int cs_dsp_adsp2_setup_algs(struct cs_dsp *dsp)
 		return PTR_ERR(adsp2_alg);
 
 	for (i = 0; i < n_algs; i++) {
-		cs_dsp_info(dsp,
-			    "%d: ID %x v%d.%d.%d XM@%x YM@%x ZM@%x\n",
-			    i, be32_to_cpu(adsp2_alg[i].alg.id),
-			    (be32_to_cpu(adsp2_alg[i].alg.ver) & 0xff0000) >> 16,
-			    (be32_to_cpu(adsp2_alg[i].alg.ver) & 0xff00) >> 8,
-			    be32_to_cpu(adsp2_alg[i].alg.ver) & 0xff,
-			    be32_to_cpu(adsp2_alg[i].xm),
-			    be32_to_cpu(adsp2_alg[i].ym),
-			    be32_to_cpu(adsp2_alg[i].zm));
+		cs_dsp_dbg(dsp,
+			   "%d: ID %x v%d.%d.%d XM@%x YM@%x ZM@%x\n",
+			   i, be32_to_cpu(adsp2_alg[i].alg.id),
+			   (be32_to_cpu(adsp2_alg[i].alg.ver) & 0xff0000) >> 16,
+			   (be32_to_cpu(adsp2_alg[i].alg.ver) & 0xff00) >> 8,
+			   be32_to_cpu(adsp2_alg[i].alg.ver) & 0xff,
+			   be32_to_cpu(adsp2_alg[i].xm),
+			   be32_to_cpu(adsp2_alg[i].ym),
+			   be32_to_cpu(adsp2_alg[i].zm));
 
 		alg_region = cs_dsp_create_region(dsp, WMFW_ADSP2_XM,
 						  adsp2_alg[i].alg.id,
@@ -1960,14 +1960,14 @@ static int cs_dsp_halo_setup_algs(struct cs_dsp *dsp)
 		return PTR_ERR(halo_alg);
 
 	for (i = 0; i < n_algs; i++) {
-		cs_dsp_info(dsp,
-			    "%d: ID %x v%d.%d.%d XM@%x YM@%x\n",
-			    i, be32_to_cpu(halo_alg[i].alg.id),
-			    (be32_to_cpu(halo_alg[i].alg.ver) & 0xff0000) >> 16,
-			    (be32_to_cpu(halo_alg[i].alg.ver) & 0xff00) >> 8,
-			    be32_to_cpu(halo_alg[i].alg.ver) & 0xff,
-			    be32_to_cpu(halo_alg[i].xm_base),
-			    be32_to_cpu(halo_alg[i].ym_base));
+		cs_dsp_dbg(dsp,
+			   "%d: ID %x v%d.%d.%d XM@%x YM@%x\n",
+			   i, be32_to_cpu(halo_alg[i].alg.id),
+			   (be32_to_cpu(halo_alg[i].alg.ver) & 0xff0000) >> 16,
+			   (be32_to_cpu(halo_alg[i].alg.ver) & 0xff00) >> 8,
+			   be32_to_cpu(halo_alg[i].alg.ver) & 0xff,
+			   be32_to_cpu(halo_alg[i].xm_base),
+			   be32_to_cpu(halo_alg[i].ym_base));
 
 		ret = cs_dsp_halo_create_regions(dsp, halo_alg[i].alg.id,
 						 halo_alg[i].alg.ver,
-- 
2.30.2

