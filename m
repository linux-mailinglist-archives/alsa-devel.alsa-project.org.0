Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA59F9608
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2024 17:09:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE63A6022A;
	Fri, 20 Dec 2024 17:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE63A6022A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734710981;
	bh=OBb4UteqoKqAjQG2C+x3g3GZZPxWGvGAYl/HZeOxyj8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BQECTfv9/Ljm9ZHLNGkCxLETL0//326pIzyZLTRAGpIHXsEWTTN14yv6417q00Uzm
	 sipUUy4WrZdhK/+WziPJ2NGiM/96juw2sisbpIU+9kNc6/g7w+T2kRGRLNlfMJB0tr
	 h5fyerNBNb3VzAswUVIDqLVestpbZmLAU/OFUDMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 918BBF805C0; Fri, 20 Dec 2024 17:09:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5934F805C0;
	Fri, 20 Dec 2024 17:09:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7374FF80508; Fri, 20 Dec 2024 17:08:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5403EF80104
	for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2024 17:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5403EF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=b3afgDXY
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4BK5g3n5016642;
	Fri, 20 Dec 2024 10:08:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=TUOOMpm1vrB7VfGN
	ouMTCHcSIZIOh7HkSWYm2rKRP/0=; b=b3afgDXYkfjWs20aulWccOOpokFNVuAN
	RYdFroYgwsUp/Af6hf/+3IOV5u6CORbL8NgiRyhiRzGpjfQ2xtJAvM3BClt0kd0g
	sjHABS58WpsxL9OeyldDKocITuIFsVcemG3cRcKhZ/ZJCGzC3ZCNvvIfqTs8J851
	AbS23vnewBDhu6RcKazl8x0cRNncRVJ8sJnb0wfN0dD3CC8kBrb54zwVMYaUg+UQ
	My2SAXmi+TJ+dulGcwRqC2SkkL2WnBUSiuiB/FfJHdrUku/gzysFrRrs0neOFq2i
	Cmerob8LNv/asoHChqb33JKotmHxDLHhoxDlX2tNtmFxyZ2Zb4btvQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7akfww3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 10:08:55 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 20 Dec
 2024 16:08:53 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 20 Dec 2024 16:08:53 +0000
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 688B1820247;
	Fri, 20 Dec 2024 16:08:53 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [alsa-ucm-conf] sof-soundwire: Use correct speaker data port and PCM
 for cs35l56 bridge
Date: Fri, 20 Dec 2024 16:08:51 +0000
Message-ID: <20241220160851.275061-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -gMWHECWQyOHwqZ13_vN1pBHsfMf11rI
X-Proofpoint-ORIG-GUID: -gMWHECWQyOHwqZ13_vN1pBHsfMf11rI
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XGYU6KE7DRV6BKAM2JKFTXC4IM5G3A6X
X-Message-ID-Hash: XGYU6KE7DRV6BKAM2JKFTXC4IM5G3A6X
X-MailFrom: prvs=908490ce8a=mstrozek@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGYU6KE7DRV6BKAM2JKFTXC4IM5G3A6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 ucm2/sof-soundwire/cs35l56-bridge.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ucm2/sof-soundwire/cs35l56-bridge.conf b/ucm2/sof-soundwire/cs35l56-bridge.conf
index 176f880..2e8c1c6 100644
--- a/ucm2/sof-soundwire/cs35l56-bridge.conf
+++ b/ucm2/sof-soundwire/cs35l56-bridge.conf
@@ -23,8 +23,8 @@ SectionDevice."Speaker" {
 	EnableSequence [
 		cset "name='cs42l43 Speaker L Input 1' 'ASPRX1'"
 		cset "name='cs42l43 Speaker R Input 1' 'ASPRX2'"
-		cset "name='cs42l43 ASPTX1 Input' 'DP5RX1'"
-		cset "name='cs42l43 ASPTX2 Input' 'DP5RX2'"
+		cset "name='cs42l43 ASPTX1 Input' 'DP6RX1'"
+		cset "name='cs42l43 ASPTX2 Input' 'DP6RX2'"
 
 		cset "name='AMPL ASP1 TX1 Source' 'DSP1TX1'"
 		cset "name='AMPL ASP1 TX2 Source' 'None'"
@@ -54,7 +54,7 @@ SectionDevice."Speaker" {
 
 	Value {
 		PlaybackPriority 100
-		PlaybackPCM "hw:${CardId},0"
+		PlaybackPCM "hw:${CardId},2"
 		PlaybackMixer "default:${CardId}"
 		PlaybackMixerElem "Speaker"
 	}
-- 
2.39.5

