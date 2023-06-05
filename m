Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EA5722B14
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 17:31:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B011982A;
	Mon,  5 Jun 2023 17:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B011982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685979060;
	bh=UruFh6U7bhpdZyDxBIlHCtnZk2zvtnd0T9fe9urbU2s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oFLqOd9pX1JHjEWDV1z8sa7YvPsBrxozrl0YX74tIdAuttcrZ4XJpBggBq5Opus1D
	 jXf1J1uXshg1aLRWLiYE2UdnxVwYeABsx987VPfgIKvjlqDMYDDvQplGeaxnFsPODR
	 6M8vFLC/hSbW1ef4+YCNFju2sVyDusGSCnvjTg2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC5F5F80557; Mon,  5 Jun 2023 17:29:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3F10F80549;
	Mon,  5 Jun 2023 17:29:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FF59F80290; Mon,  5 Jun 2023 17:29:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C70BCF80199
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 17:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C70BCF80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XVQdMUiw
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3558sEEH030588;
	Mon, 5 Jun 2023 10:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=eYBg8d8Hvj15ndjFUQ9ONSXAzqhuPZlCNKFw2fRkfqM=;
 b=XVQdMUiwFCV1xgNobYOpoj9ynBGEzVnZ6JJ3gBWqNrVNWPfPo4muzn0cPgaqmzqzAnjq
 wGLZBoykwwYlRmpypyPmNla7qZl4URHILlna33kGiE5Iur9bKKpZERte/bCgH6bl1Pqh
 M6dUfgQBsrbM+SVU4hItxeSFTVG55wzaZcF8QpKFvLHEO7io2k6q0YTXuA1m0jehNhUc
 uaL7o14dtL6d4+YItJ4qrfM5iEjb3akyAFSPGHbNL5B6iDEsSvB5UdVHW1CklS5782A2
 BGvayWngHQPc+xCFZhxXhAvURIFIDyk/eN1oBFAXIwYnzG07nPuCPEPE8322/BYaOQz8 8A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r01xna179-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 10:29:05 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 5 Jun
 2023 16:29:03 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 5 Jun 2023 16:29:03 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (NEWNC1SL3J3.ad.cirrus.com
 [198.90.238.20])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 322B611C6;
	Mon,  5 Jun 2023 15:29:03 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 2/3] ALSA: hda: cs35l41: Fix endian conversions
Date: Mon, 5 Jun 2023 16:28:54 +0100
Message-ID: <20230605152855.448115-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605152855.448115-1-sbinding@opensource.cirrus.com>
References: <20230605152855.448115-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jfXpQQwIbuQLEB63hjr0rcaSYRFwu9AC
X-Proofpoint-GUID: jfXpQQwIbuQLEB63hjr0rcaSYRFwu9AC
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 77ZDWS7WXE3SZ54DTCVOC7VIKFST4NBH
X-Message-ID-Hash: 77ZDWS7WXE3SZ54DTCVOC7VIKFST4NBH
X-MailFrom: prvs=1520dfaea3=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77ZDWS7WXE3SZ54DTCVOC7VIKFST4NBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Found during static analysis, ensure variables are correct
types before endian conversion.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d100189e15b83..ce5faa6205170 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -308,8 +308,8 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 }
 
 #if IS_ENABLED(CONFIG_EFI)
-static int cs35l41_apply_calibration(struct cs35l41_hda *cs35l41, unsigned int ambient,
-				     unsigned int r0, unsigned int status, unsigned int checksum)
+static int cs35l41_apply_calibration(struct cs35l41_hda *cs35l41, __be32 ambient, __be32 r0,
+				     __be32 status, __be32 checksum)
 {
 	int ret;
 
@@ -745,7 +745,7 @@ static int cs35l41_runtime_resume(struct device *dev)
 
 static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 {
-	int halo_sts;
+	__be32 halo_sts;
 	int ret;
 
 	ret = cs35l41_init_dsp(cs35l41);
@@ -773,7 +773,7 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 				&halo_sts, sizeof(halo_sts));
 
 	if (ret) {
-		dev_err(cs35l41->dev, "Timeout waiting for HALO Core to start. State: %d\n",
+		dev_err(cs35l41->dev, "Timeout waiting for HALO Core to start. State: %u\n",
 			 halo_sts);
 		goto clean_dsp;
 	}
-- 
2.34.1

