Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4F840D470
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 10:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C052917AE;
	Thu, 16 Sep 2021 10:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C052917AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631780718;
	bh=yAmEkDPYC+PlxqWrMz7Eli7JbV5g5YmC6HpHBOnxGgs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BRqUPDpKKZ11VONJyfG1dUv8gw1z63nO7s+k8yMl2hpRWNcfkGkUeQGag/fpbrFuT
	 OMpeyTm7MBexo8x+JApLDMzA7jJ/Ej8l6W/cpZslfiai87Yg2ukoFdNXqLmAgHTLA3
	 ysIBK2V57UCA8jCirXStQvW1p1+C1URyP4t6i/Io=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6373F80271;
	Thu, 16 Sep 2021 10:24:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA5DEF8025E; Thu, 16 Sep 2021 10:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AFADF800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 10:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AFADF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VL45JlNi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18G8Mppe022857; 
 Thu, 16 Sep 2021 03:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=tsERORqlHJhhB3X5/4HJwIJ9mtKSa5B/mmxj2Xn40RE=;
 b=VL45JlNi5twFOuB80foeLa5qHEIJYB5SW+VMEp0xy4AjLFQPKHzvKirq6tGOpZ2/a8vd
 NAApi4KLdscT4uZPSjhDFX0kCoXObdH8MyxIfGsmHyHVGQ9fcf/UQngzxCcgpQcuBFIv
 i/cL+xT7y9zdGrxuAS98n2XXDMXIxEcF5L5obq4HsVcryF2rMyjVK2+DwzKLtHHgDJfR
 4k6nMWmAWoj08yT99YXB1E3G75qRFr1WBUrZJcUeUoKLkojMHtcAOyl6XDexYmlLaeEL
 z26SmUvnV4CwCa+XwcxymNOkBuvosG5VN0vngKWjE4kzGjVApM/UwlEQPb8G60JCiUEh SA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b42c3g013-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Sep 2021 03:23:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 16 Sep
 2021 09:23:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 16 Sep 2021 09:23:46 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 474B8B15;
 Thu, 16 Sep 2021 08:23:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] misc: cs35l41: Remove unused pdn variable
Date: Thu, 16 Sep 2021 09:23:46 +0100
Message-ID: <20210916082346.12001-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: -mSYlCiGO3vpFm_CLwneOkAckjetwqZ3
X-Proofpoint-ORIG-GUID: -mSYlCiGO3vpFm_CLwneOkAckjetwqZ3
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

Remove pdn variable that was made redundant in an earlier patch.

Fixes: c2f14cc2bcdd ("ASoC: cs35l41: Fix use of an uninitialised variable")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index ad86c030d9cb5..b16eb6610c0e9 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -564,7 +564,6 @@ static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
 	struct cs35l41_private *cs35l41 = snd_soc_component_get_drvdata(component);
 	unsigned int val;
 	int ret = 0;
-	bool pdn;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -582,7 +581,6 @@ static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
 		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1,
 				   CS35L41_GLOBAL_EN_MASK, 0);
 
-		pdn = false;
 		ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
 					       val, val &  CS35L41_PDN_DONE_MASK,
 					       1000, 100000);
-- 
2.11.0

