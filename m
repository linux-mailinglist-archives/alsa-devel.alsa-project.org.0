Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A84851D5
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D177716EC;
	Wed,  5 Jan 2022 12:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D177716EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382346;
	bh=S66yPmA/1vdpbe5bzpPXSpjRZN7UubWDCTOHP/4Bdm4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h3dgrrJ6zBqyjwj7agniXZZACsTtOCV16kEO+Vscn5ebbpnJsXtYnS1nmK5bs8JPf
	 BiwLnfRcab2IP805TFFE+E2PUO0zOvWcjG5HYdrBbaBRiQTlA7xgfXLTc4TcTq6y7u
	 q4UhF4SgsiEFZT00SwmAowpkspUVTswBvqkyWei8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67BBEF8020C;
	Wed,  5 Jan 2022 12:30:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8731F8020C; Wed,  5 Jan 2022 12:30:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D44CF8020C
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D44CF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OXjr8j1x"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2059Ifs9015775;
 Wed, 5 Jan 2022 05:30:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=nzty4nodsc2qyZwtqQV2bGFjJqhZptZY+I8rHxlZf24=;
 b=OXjr8j1xXqT9RpmaE0l293Xy+W7LNMefTa31vUDEw0pDhRbvL7ySumDGsEwX5TSwCdTm
 Lbe3bTTfailKmtkdOHQzjr9d4rWO6ggCmF+F3oFK+nFJVpK2Ubc3rY9qRXAwwkegkB1d
 BXkKVv5JCY8HSVqQ0gZI1UIytI38S0+pP3pUpT5ctopBhRy5pQUzill1dJfQmDqAjGJy
 zFx+V7ZA+lzxO4cgrvubiuP3Sw3YAQWA99H5cAzmKKFxlV57L3CVBrCLigUaef5YILUn
 vz4My1We9j5x0AZd33IpPQ0zkDz6Ef2y/ys3e7tI+4JfkoQnT//YAfN8yluMiWtg7O9W xw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dd8jy839d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 05:30:29 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 11:30:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 11:30:27 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EF9F9475;
 Wed,  5 Jan 2022 11:30:26 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/8] ASoC: cs35l41: Remove incorrect comment
Date: Wed, 5 Jan 2022 11:30:20 +0000
Message-ID: <20220105113026.18955-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: mPd2V5NLYZuW3rzKkHnjLD4fYfKovOOG
X-Proofpoint-ORIG-GUID: mPd2V5NLYZuW3rzKkHnjLD4fYfKovOOG
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
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

The IRQ is not used for the PDN_DONE bit, this is polled during the DAPM
sequence, remove the misleading comment.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index d9e6e84e64d0b..980294c1bcdba 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1338,8 +1338,6 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 	ret = devm_request_threaded_irq(cs35l41->dev, cs35l41->irq, NULL, cs35l41_irq,
 					IRQF_ONESHOT | IRQF_SHARED | irq_pol,
 					"cs35l41", cs35l41);
-
-	/* CS35L41 needs INT for PDN_DONE */
 	if (ret != 0) {
 		dev_err(cs35l41->dev, "Failed to request IRQ: %d\n", ret);
 		goto err;
-- 
2.11.0

