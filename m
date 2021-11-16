Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239B45377C
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E7F1178F;
	Tue, 16 Nov 2021 17:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E7F1178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637080204;
	bh=wedYZ7Nxm5Qaepw3wdmqCDTjukW+ygqDG2/iWJwr94Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g3mx+7a1wZ0AAfdQgH8baQF7ceI4gP/LWocifOLyThOANa8QskTxeYu6y4TnjyjeC
	 5jeZqZLY/smz6fTEFNbKV0pPxWZRVTZhYXPKWsV44Xm7FAfM1wCbkg792voE53w1h5
	 PCr+yFka1ezJSbtKlhJ/tU/Q2Z3HO8t58YLxShG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 244D2F804FF;
	Tue, 16 Nov 2021 17:27:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19FCEF804FC; Tue, 16 Nov 2021 17:27:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E56F5F804BC
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E56F5F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="FRDpcuuh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7FCki005416;
 Tue, 16 Nov 2021 10:27:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ObYlyY35mrZ2j4brNyTBAcoYXoMTcTAqrHnnuwZZOKU=;
 b=FRDpcuuh7Ab+y90RB6NoV2Pzk2mJPjlRn5P2ExVuO/8LngxRG9mCBKlpImYLJ84Y0340
 YTGVFaJPaNc8i/jPppbAf8DZGeNJiU3EDNF3NKx+IS/4/qm5ZdVr3HsszDT4pUhQ/rtw
 X++So6no3aRP11TmZGdpFesvqC8sOnvTZgvjl7UmDJFVDVEgYipe1QOmsdR5d1CsmxEY
 +rKqkmG8AZwXE9EPZQiJ8iK/MqwWfjEWQMaf9mDA03Z1KbvJefsQs2r+8dNmtsIi8Xhs
 rweYvpXUC6ZMXwPFmVk7DH2uxsleF+cUqXg7cJ1lCQdPyrqx3ZqcWZNWNMGOLFhEiOgR qg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cbdjgt3be-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:27:01 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:26:58 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:26:58 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.41])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 26A2811DB;
 Tue, 16 Nov 2021 16:26:58 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: cs42l42: Remove redundant pll_divout member
Date: Tue, 16 Nov 2021 16:26:52 +0000
Message-ID: <20211116162652.45225-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116162652.45225-1-rf@opensource.cirrus.com>
References: <20211116162652.45225-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8Qg-uD-MuvEcyGcM2u1TK5tvl-Lna8Ip
X-Proofpoint-GUID: 8Qg-uD-MuvEcyGcM2u1TK5tvl-Lna8Ip
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Now that struct cs42l42_private has pll_config, the current PLL
configuration can be looked up directly in pll_ratio_table. This
makes the pll_divout member of cs42l42_private redundant since it
was only a copy of the value from pll_ratio_table.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 9 +++------
 sound/soc/codecs/cs42l42.h | 1 -
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 8efcee3e60d3..0c4303547fd8 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -734,10 +734,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 					CS42L42_PLL_DIVOUT_MASK,
 					(pll_ratio_table[i].pll_divout * pll_ratio_table[i].n)
 					<< CS42L42_PLL_DIVOUT_SHIFT);
-				if (pll_ratio_table[i].n != 1)
-					cs42l42->pll_divout = pll_ratio_table[i].pll_divout;
-				else
-					cs42l42->pll_divout = 0;
 				snd_soc_component_update_bits(component,
 					CS42L42_PLL_CAL_RATIO,
 					CS42L42_PLL_CAL_RATIO_MASK,
@@ -1004,12 +1000,13 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 				snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
 							      CS42L42_PLL_START_MASK, 1);
 
-				if (cs42l42->pll_divout) {
+				if (pll_ratio_table[cs42l42->pll_config].n > 1) {
 					usleep_range(CS42L42_PLL_DIVOUT_TIME_US,
 						     CS42L42_PLL_DIVOUT_TIME_US * 2);
+					regval = pll_ratio_table[cs42l42->pll_config].pll_divout;
 					snd_soc_component_update_bits(component, CS42L42_PLL_CTL3,
 								      CS42L42_PLL_DIVOUT_MASK,
-								      cs42l42->pll_divout <<
+								      regval <<
 								      CS42L42_PLL_DIVOUT_SHIFT);
 				}
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index c8b3267a318b..75ade987d0db 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -845,7 +845,6 @@ struct  cs42l42_private {
 	int bclk;
 	u32 sclk;
 	u32 srate;
-	u8 pll_divout;
 	u8 plug_state;
 	u8 hs_type;
 	u8 ts_inv;
-- 
2.11.0

