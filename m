Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E14CD752
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:10:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95AE31B10;
	Fri,  4 Mar 2022 16:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95AE31B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646406600;
	bh=PJBPb8uB8qnQ8z8PeyyQRtMt1sdTQiFHr2xieNX0ek0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YZ14SVmlKSOJqOWJTdLeArkb59hlZiY5pngFkZgao7V8R1Zgll+q5VJxJ21g6A5of
	 7w8ybfL2zakLcX5CyrGU02TRNabD4ILVkCv/+pe2BaPyGonjrZbG3ljaCYElEtMhGh
	 hmXm+DuXme9gV4KI67XxVV90Y44++Cc74VIZUFM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1DFEF80533;
	Fri,  4 Mar 2022 16:07:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3DE8F80527; Fri,  4 Mar 2022 16:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3D11F80224
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 16:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3D11F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GXMmKAcE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2244w2hH013723;
 Fri, 4 Mar 2022 09:07:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=xtsITB9MtsbQbh9Pg7CKoJN9r/LR7G1l1Q0NK9S3HWk=;
 b=GXMmKAcEDKZz9m79azSLkQtB74mgqlRr7NZ7HERWK4cmmQXnDmREiJF9P3sbRvIyrPmr
 lmizC8wgKrgK9SQq9nLHRvyrpuiWS68PjIoM5jPxBSniGR4Hh2bWW+nP77mooB2uhEla
 63jRGBMxUt394hMb9tpSJ48oCV6wVZzwLutuC/csflrLX6o2wNez6E0RlSp8Ui2jg0QZ
 UGZmIa+PvOlGsEbMhHaIfdfOXctDywUUor1Dg45jErHDgH1ZV7BW7/nHOYLVusk7peEy
 UzbBktdBDaznF/8elbTwim/jN4cXL0JNY5CJCasM7Hd7F32yqd6/BhgTlyokK6wQNfnF oA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3h414-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 09:07:28 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 15:07:24 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 15:07:24 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7A8727C;
 Fri,  4 Mar 2022 15:07:24 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 03/20] ASoC: cs35l41: Fix DSP mbox start command and global
 enable order
Date: Fri, 4 Mar 2022 15:07:04 +0000
Message-ID: <20220304150721.3802-4-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
References: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: v53xgvSt1xnUz19cGb4h6JaH_adorjaA
X-Proofpoint-ORIG-GUID: v53xgvSt1xnUz19cGb4h6JaH_adorjaA
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
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

Global enable must happen before CSPL_MBOX_CMD_RESUME command
is sent. Move it to PRE_PMU as both events use
SND_SOC_DAPM_OUT_DRV_E macro.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index f3787d77f892..05de94fd2e55 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -573,7 +573,7 @@ static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
 	int ret = 0;
 
 	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
+	case SND_SOC_DAPM_PRE_PMU:
 		regmap_multi_reg_write_bypassed(cs35l41->regmap,
 						cs35l41_pup_patch,
 						ARRAY_SIZE(cs35l41_pup_patch));
@@ -649,7 +649,7 @@ static const struct snd_soc_dapm_widget cs35l41_dapm_widgets[] = {
 
 	SND_SOC_DAPM_OUT_DRV_E("Main AMP", CS35L41_PWR_CTRL2, 0, 0, NULL, 0,
 			       cs35l41_main_amp_event,
-			       SND_SOC_DAPM_POST_PMD |	SND_SOC_DAPM_POST_PMU),
+			       SND_SOC_DAPM_POST_PMD |	SND_SOC_DAPM_PRE_PMU),
 
 	SND_SOC_DAPM_MUX("ASP TX1 Source", SND_SOC_NOPM, 0, 0, &asp_tx1_mux),
 	SND_SOC_DAPM_MUX("ASP TX2 Source", SND_SOC_NOPM, 0, 0, &asp_tx2_mux),
-- 
2.35.1

