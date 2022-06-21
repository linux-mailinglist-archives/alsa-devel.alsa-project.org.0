Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA5B552F9E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 12:22:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 790F9244C;
	Tue, 21 Jun 2022 12:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 790F9244C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655806975;
	bh=WWXI52V51xJB3lUbs6WxbhCPBatPZSTWxSkIOGzxyoc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXK7a3A1XqGgLpCe+rUeTSFrgsDvCexO3XjbxIAsQdGTrCfhS0fP8BxsUf2QaxUcT
	 eRmfeEmVXWNiWF58w3MTDQEXSXhqPMDvdrxVEAjPxTj7OqXYt/QwgWTfY/HMxBaV6V
	 8gFR2mOP8VyMQm549p+/gpF65cKJSSuoELZQbzA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5420BF80537;
	Tue, 21 Jun 2022 12:21:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCC7FF80535; Tue, 21 Jun 2022 12:20:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 665AFF80253
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 12:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 665AFF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DkP1GMkr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L7wQ93011194;
 Tue, 21 Jun 2022 05:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=fB9ln2+/kLOhJUlPJhQ32wpqQpdn6uB0gaQIeYvrdh4=;
 b=DkP1GMkrKOomvn/RG5WREXq0wJB2ELm8h7p8L84ANWCB6oja9bzHSDirDmALrgpBAfx8
 ghwBrwMU+L0xeMbEvJqpjQkM8SXvS3lOnhp7l7VBB8/cIKFN5Lz0DUt5SATDLUV5LUjX
 v20/HPY559khAaPyJvk8n1Dmgk9XupEDGBP6SohHVJanNFepBd7N9+Idh/O780TrbFaB
 Vvo915+Xa4W9L+4419ztN1Zj3bzXHhtkEZP0VIipw7104TVPOen3dHJAvALsLlnZMtbL
 FuxvwRWnzsez8aIMGC7x1XvV+FPPM0buxJyjBL+7va4OQvn2o9gLsY5BlOQ/AoBwKVbr QA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41bcxp-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jun 2022 05:20:45 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 21 Jun
 2022 11:20:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 21 Jun 2022 11:20:42 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1C162478;
 Tue, 21 Jun 2022 10:20:42 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/4] ASoC: cs35l41: Correct some control names
Date: Tue, 21 Jun 2022 11:20:40 +0100
Message-ID: <20220621102041.1713504-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621102041.1713504-1-ckeepax@opensource.cirrus.com>
References: <20220621102041.1713504-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: astuIhIZfLIGurtNCJkGU_1qrz48YpmV
X-Proofpoint-ORIG-GUID: astuIhIZfLIGurtNCJkGU_1qrz48YpmV
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
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

Various boolean controls on cs35l41 are missing the required "Switch" in
the name, add these.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index a115ea35b92d4..8766e19d85f11 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -333,7 +333,7 @@ static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
 	SOC_SINGLE("HW Noise Gate Enable", CS35L41_NG_CFG, 8, 63, 0),
 	SOC_SINGLE("HW Noise Gate Delay", CS35L41_NG_CFG, 4, 7, 0),
 	SOC_SINGLE("HW Noise Gate Threshold", CS35L41_NG_CFG, 0, 7, 0),
-	SOC_SINGLE("Aux Noise Gate CH1 Enable",
+	SOC_SINGLE("Aux Noise Gate CH1 Switch",
 		   CS35L41_MIXER_NGATE_CH1_CFG, 16, 1, 0),
 	SOC_SINGLE("Aux Noise Gate CH1 Entry Delay",
 		   CS35L41_MIXER_NGATE_CH1_CFG, 8, 15, 0),
@@ -341,15 +341,15 @@ static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
 		   CS35L41_MIXER_NGATE_CH1_CFG, 0, 7, 0),
 	SOC_SINGLE("Aux Noise Gate CH2 Entry Delay",
 		   CS35L41_MIXER_NGATE_CH2_CFG, 8, 15, 0),
-	SOC_SINGLE("Aux Noise Gate CH2 Enable",
+	SOC_SINGLE("Aux Noise Gate CH2 Switch",
 		   CS35L41_MIXER_NGATE_CH2_CFG, 16, 1, 0),
 	SOC_SINGLE("Aux Noise Gate CH2 Threshold",
 		   CS35L41_MIXER_NGATE_CH2_CFG, 0, 7, 0),
-	SOC_SINGLE("SCLK Force", CS35L41_SP_FORMAT, CS35L41_SCLK_FRC_SHIFT, 1, 0),
-	SOC_SINGLE("LRCLK Force", CS35L41_SP_FORMAT, CS35L41_LRCLK_FRC_SHIFT, 1, 0),
-	SOC_SINGLE("Invert Class D", CS35L41_AMP_DIG_VOL_CTRL,
+	SOC_SINGLE("SCLK Force Switch", CS35L41_SP_FORMAT, CS35L41_SCLK_FRC_SHIFT, 1, 0),
+	SOC_SINGLE("LRCLK Force Switch", CS35L41_SP_FORMAT, CS35L41_LRCLK_FRC_SHIFT, 1, 0),
+	SOC_SINGLE("Invert Class D Switch", CS35L41_AMP_DIG_VOL_CTRL,
 		   CS35L41_AMP_INV_PCM_SHIFT, 1, 0),
-	SOC_SINGLE("Amp Gain ZC", CS35L41_AMP_GAIN_CTRL,
+	SOC_SINGLE("Amp Gain ZC Switch", CS35L41_AMP_GAIN_CTRL,
 		   CS35L41_AMP_GAIN_ZC_SHIFT, 1, 0),
 	WM_ADSP2_PRELOAD_SWITCH("DSP1", 1),
 	WM_ADSP_FW_CONTROL("DSP1", 0),
-- 
2.30.2

