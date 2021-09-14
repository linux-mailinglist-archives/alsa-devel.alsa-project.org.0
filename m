Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F9540B05A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 16:16:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7D0817C1;
	Tue, 14 Sep 2021 16:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7D0817C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631628995;
	bh=WMEfxu03MEa3blwJhRgd3RTHICo9R+fnBfXqA1VcmgA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVsQuyc1PAUxJ8/pEGng+QXh5Uxc86lWDAI2VTZLWo13mbNAmoNAmbjmwCXLmftO8
	 OsbNKGrlr70oORnLJcZYIsXiENm1nh+yogFJhJpbeBDbK+P3mJpvwaatiDEbMgawRp
	 JtjNkOUdfPo6f52xMDdfsIg1r8qa0bOFa4aDKRlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF14DF804FA;
	Tue, 14 Sep 2021 16:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C59D9F804B3; Tue, 14 Sep 2021 16:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38431F8025A
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 16:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38431F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nougotZi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E5NPuK016714; 
 Tue, 14 Sep 2021 09:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=MbU3qZPFy5rq4er5sXRfQ/R20zzWCE2U95OeQ64fpMQ=;
 b=nougotZi/3AgBZxxgn//Vk8Jix/H6YqWW+vSvMLXdonmjR9mlSQXeFTCJOzh6/Uv2PCV
 Z7l+oN3V54U6O6UjLWfIlicIQXzCTM4n8iiQ7rv6ZiN1af5My3eLxIqvrAYSs01m6m1A
 RfCSf6PTsqbk//fZTegrk7DoVi78Tz6GccYTjCFsGraI5FVTV6C6bFu/dsaJjLReqeI0
 1mhpmvFHED48RvuXJUuxymbJVw+FooI1AnbpEU8t+QjNbHAUzILM2IMZc2vzlrTnlhDY
 PorfAFW1vAw8RW7bGFoomwu2Bm9ZSCGJArw7A2KaK83m8FIeWL373ywDOxO0pbaQl9s6 fA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b2gkx8qtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Sep 2021 09:13:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 14 Sep
 2021 15:13:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 14 Sep 2021 15:13:49 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9CBF1478;
 Tue, 14 Sep 2021 14:13:49 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/6] ASoC: cs35l41: Use regmap_read_poll_timeout to wait for
 OTP boot
Date: Tue, 14 Sep 2021 15:13:45 +0100
Message-ID: <20210914141349.30218-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
References: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yK_qRdEe3DVQTRg3dR9n1lcs6YwSK3JA
X-Proofpoint-GUID: yK_qRdEe3DVQTRg3dR9n1lcs6YwSK3JA
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 james.schulman@cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com
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

Just clean up the code a little by using the helper rather than open
coding waiting for OTP_BOOT_DONE.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index d2a11cc336833..8c2c695813cd7 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1323,7 +1323,6 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 {
 	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
 	int irq_pol = 0;
-	int timeout;
 	int ret;
 
 	if (pdata) {
@@ -1377,18 +1376,14 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 
 	usleep_range(2000, 2100);
 
-	timeout = 100;
-	do {
-		if (timeout == 0) {
-			dev_err(cs35l41->dev,
-				"Timeout waiting for OTP_BOOT_DONE\n");
-			ret = -EBUSY;
-			goto err;
-		}
-		usleep_range(1000, 1100);
-		regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS4, &int_status);
-		timeout--;
-	} while (!(int_status & CS35L41_OTP_BOOT_DONE));
+	ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4,
+				       int_status, int_status & CS35L41_OTP_BOOT_DONE,
+				       1000, 100000);
+	if (ret) {
+		dev_err(cs35l41->dev,
+			"Failed waiting for OTP_BOOT_DONE: %d\n", ret);
+		goto err;
+	}
 
 	regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_status);
 	if (int_status & CS35L41_OTP_BOOT_ERR) {
-- 
2.11.0

