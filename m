Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E71FA454735
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 14:27:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 862A91911;
	Wed, 17 Nov 2021 14:26:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 862A91911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637155668;
	bh=PylKyHKKMn6zrW7HNydXwOQN9nKd7SzVbFmfJZ9BXHs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=grUDLpWQInmbT4AlJwttUxaAD9LlGMPA6NKcYezG/ZzTntKkr1Yw5x6ZLPko8tuS5
	 Jv9op+Jr2XRzWAcAAntPpspEDyzwgY25y7jrFCeCV6P2hK2YZ5Lawv7v4mQprbpAYn
	 Y7kMH6TiQ8rAlALwBS+glzQl/qdX0BOEoH/TO6OA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84CE7F8052E;
	Wed, 17 Nov 2021 14:23:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4552FF80524; Wed, 17 Nov 2021 14:23:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D5A6F804BD
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 14:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5A6F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mHEbxYJN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH4qhZg020405;
 Wed, 17 Nov 2021 07:23:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=QAoxXsT5eQgbB1Noac3ZqDQBjgotizDF6cr+IrrWqsI=;
 b=mHEbxYJN7mHu/UgzetWQK7GGEKqplMSi6H+tFwSkYzB4qfkX62FoDwIpwNvT+oU++fzV
 nuOtCRaIhYQb/hrgI/oMgcLG8tH3zSOktsNhI+kF75l2rQbqx9kS8Qk8SfPQC4Qyxewb
 smus31LAJfXBdNuooXn8B2+9zG+4yPLRtikn142dIcDpaFTqqrFlNwCKWrV0NFE36fzT
 sXzmali+gRv5i221XylMRjZM5kRLtioJju0mwB8s3jWFIXiCEjyPWbl6MNQkno9nnorN
 PVUlWdA94t77J9K/jq/hhcsdLsWWWSRGcRMP9YnpaaCFPJNyMq8csf4QcAFK+jVTzrrW 9A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ccgtn14sf-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Nov 2021 07:23:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 13:23:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 17 Nov 2021 13:23:00 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EF60911AF;
 Wed, 17 Nov 2021 13:23:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 10/10] firmware: cs_dsp: Allow creation of event controls
Date: Wed, 17 Nov 2021 13:23:00 +0000
Message-ID: <20211117132300.1290-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
References: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: V8N9hBfA7MLYggb5yBQ70DlRFey8WrsP
X-Proofpoint-ORIG-GUID: V8N9hBfA7MLYggb5yBQ70DlRFey8WrsP
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some firmwares contain controls intended to convey firmware state back
to the host. Whilst more infrastructure will probably be needed for
these in time, as a first step allow creation of the controls, so said
firmwares arn't completely rejected.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c     | 1 +
 include/linux/firmware/cirrus/wmfw.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 5fe08de91ecd3..3814cbba0a544 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1177,6 +1177,7 @@ static int cs_dsp_parse_coeff(struct cs_dsp *dsp,
 				return -EINVAL;
 			break;
 		case WMFW_CTL_TYPE_HOSTEVENT:
+		case WMFW_CTL_TYPE_FWEVENT:
 			ret = cs_dsp_check_coeff_flags(dsp, &coeff_blk,
 						       WMFW_CTL_FLAG_SYS |
 						       WMFW_CTL_FLAG_VOLATILE |
diff --git a/include/linux/firmware/cirrus/wmfw.h b/include/linux/firmware/cirrus/wmfw.h
index a19bf7c6fc8b0..74e5a4f6c13a0 100644
--- a/include/linux/firmware/cirrus/wmfw.h
+++ b/include/linux/firmware/cirrus/wmfw.h
@@ -29,6 +29,7 @@
 #define WMFW_CTL_TYPE_ACKED       0x1000 /* acked control */
 #define WMFW_CTL_TYPE_HOSTEVENT   0x1001 /* event control */
 #define WMFW_CTL_TYPE_HOST_BUFFER 0x1002 /* host buffer pointer */
+#define WMFW_CTL_TYPE_FWEVENT     0x1004 /* firmware event control */
 
 struct wmfw_header {
 	char magic[4];
-- 
2.11.0

