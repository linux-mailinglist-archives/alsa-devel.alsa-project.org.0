Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B474CC411
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:37:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 920E91B2C;
	Thu,  3 Mar 2022 18:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 920E91B2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646329043;
	bh=g1P/lM3wi1ug8f0SFgyK+wr2tP//Blqytb9zBPzFpiY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHu+MhfTAyrjzFQxV39CuxALfYoi73fY85eMlxgU5mqm/pKSXDP5C1/KFqKNKw3cT
	 1Q5cYomZkTSYZXRcR2PeKj5je9hN5iOATrcBJ/zVwiYyg4kYW5ppR9+zdgqGQErcOM
	 VBbQRKlNjcSpEkCjLO6D9SVeBXfDA7aHMdKPWvjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE492F805B4;
	Thu,  3 Mar 2022 18:31:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C16E5F8055C; Thu,  3 Mar 2022 18:31:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0819BF80149
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0819BF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LuPbN9hs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 223509T2013880;
 Thu, 3 Mar 2022 11:31:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4eGzIDYtnF1ZJ7ItCxqOSnRC0d6QLyqAmjli4+VrIM4=;
 b=LuPbN9hsZRet/dmn/kH38mErDCQRrlIAWn2NlJf+KQySd1Jh2DoPuXSEhQ84YPrrgVg/
 NvSVkdGjN31stihZ5Ph4r+9tAwLfyRcyBG3vEZ4BpUUW13eMJ9S25j+bGd+QyocgW2nU
 rZni9sPBViBOnFE/OFoKffKt4qmnH4sPaYbdT46BagfWVU1IsHkwertbXopqHo+tgTin
 K7exULuIjR2GOgzZnzZIJmdZpyJu21h41K4BQi8uxVf4w1fgwi1SoM5XYV+36+ZCJXMQ
 H36ggTBoBNwjyUMvIKcrWXKeBcAdl+IrOaF7sbWtb+GDnZcnvoG/eu81hKAQvcVDM3gW MA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ejncq8ybn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 11:31:05 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:31:04 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 17:31:04 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BBB242A1;
 Thu,  3 Mar 2022 17:31:03 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 04/20] ASoC: cs35l41: Remove unnecessary param
Date: Thu, 3 Mar 2022 17:30:43 +0000
Message-ID: <20220303173059.269657-5-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RBm-16dzIMir7j9eIV36zMW3CPgjb9Oh
X-Proofpoint-GUID: RBm-16dzIMir7j9eIV36zMW3CPgjb9Oh
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
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

cs35l41_private is not used on cs35l41_handle_pdata

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 05de94fd2e55..6b784a62df0c 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1115,9 +1115,7 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l41 = {
 	.set_sysclk = cs35l41_component_set_sysclk,
 };
 
-static int cs35l41_handle_pdata(struct device *dev,
-				struct cs35l41_platform_data *pdata,
-				struct cs35l41_private *cs35l41)
+static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_platform_data *pdata)
 {
 	struct cs35l41_irq_cfg *irq_gpio1_config = &pdata->irq_config1;
 	struct cs35l41_irq_cfg *irq_gpio2_config = &pdata->irq_config2;
@@ -1260,7 +1258,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 	if (pdata) {
 		cs35l41->pdata = *pdata;
 	} else {
-		ret = cs35l41_handle_pdata(cs35l41->dev, &cs35l41->pdata, cs35l41);
+		ret = cs35l41_handle_pdata(cs35l41->dev, &cs35l41->pdata);
 		if (ret != 0)
 			return ret;
 	}
-- 
2.35.1

