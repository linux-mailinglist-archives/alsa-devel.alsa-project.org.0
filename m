Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75532A769
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:10:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F3211849;
	Tue,  2 Mar 2021 18:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F3211849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614705011;
	bh=k/tJs5BN8FRe48EJ6sctzdDsgwWERTbFQO7O6G/00u8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sblj5SX0OSjVCDLUNgCFlV7DP+co0AeH+0eoIetDMvOYM90qDil3lJr1rgEW0ekrB
	 zpPtIDyU0IjwLODJMb1mRooZlQEMahb6XTkgEUmL7pC6Ip0H29ukfu33tGp/cM6l8V
	 6cik3kwq/7PCsDFytuy6nqhYjdIKPpC3BhV+NMtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EECB0F804E3;
	Tue,  2 Mar 2021 18:05:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98F39F804B0; Tue,  2 Mar 2021 18:05:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B42F1F802A9
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B42F1F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LgqRDF7o"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122H1q3K022910; Tue, 2 Mar 2021 11:05:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uEj5ZIOlpg1j1E+0wNPoMN6JX9ZzpCiLBva1l5WJfi0=;
 b=LgqRDF7oP0vY9IddZ4OOK3xwpsATiNz5htV3JAu70ewNljcCFVwcFZBTOrT35xVX47DM
 XCIXFJ1GDj2FRMM50+UgnredR9Tvf8i/Ud+6u8piwBlYNzZkC2E+phWWVz+m0zZw4tCR
 XeApij4CgVvRoBoEbkzW/UuYKMWzE/c3BN0M+XH9l7g06IF9fQPMQAJWcR++fVpVP8ZK
 pC9HdbmuDZbiNnQ4uS1Cq7hlbMBJdMxgKdjdAD8uZuch3gdG4bvFJkSoz+C+87F2syio
 MaoY/BzNuT31q5tihogCaCFOgXVMSixysZF/qAd47Gt3UcawizpvJq2oBBwqIVZt3jAi IA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc6usg9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Mar 2021 11:05:03 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Mar 2021
 17:05:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 2 Mar 2021 17:05:00 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8DB4411D6;
 Tue,  2 Mar 2021 17:05:00 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>
Subject: [PATCH 06/15] ASoC: cs42l42: Provide finer control on playback path
Date: Tue, 2 Mar 2021 17:04:45 +0000
Message-ID: <20210302170454.39679-7-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=773 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020131
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Removing cs42l42_hpdrv_evt that enables the entire chain and replace by
a set of widgets that can better define the codec

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 65 +++++++++++++-------------------------
 sound/soc/codecs/cs42l42.h |  8 ++---
 2 files changed, 26 insertions(+), 47 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 834b702fe4297..663a6a8104171 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -461,54 +461,33 @@ static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 				0x3e, 1, mixer_tlv)
 };
 
-static int cs42l42_hpdrv_evt(struct snd_soc_dapm_widget *w,
-				struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-
-	if (event & SND_SOC_DAPM_POST_PMU) {
-		/* Enable the channels */
-		snd_soc_component_update_bits(component, CS42L42_ASP_RX_DAI0_EN,
-				CS42L42_ASP_RX0_CH_EN_MASK,
-				(CS42L42_ASP_RX0_CH1_EN |
-				CS42L42_ASP_RX0_CH2_EN) <<
-				CS42L42_ASP_RX0_CH_EN_SHIFT);
-
-		/* Power up */
-		snd_soc_component_update_bits(component, CS42L42_PWR_CTL1,
-			CS42L42_ASP_DAI_PDN_MASK | CS42L42_MIXER_PDN_MASK |
-				CS42L42_HP_PDN_MASK, 0);
-	} else if (event & SND_SOC_DAPM_PRE_PMD) {
-		/* Disable the channels */
-		snd_soc_component_update_bits(component, CS42L42_ASP_RX_DAI0_EN,
-				CS42L42_ASP_RX0_CH_EN_MASK, 0);
-
-		/* Power down */
-		snd_soc_component_update_bits(component, CS42L42_PWR_CTL1,
-			CS42L42_ASP_DAI_PDN_MASK | CS42L42_MIXER_PDN_MASK |
-				CS42L42_HP_PDN_MASK,
-			CS42L42_ASP_DAI_PDN_MASK | CS42L42_MIXER_PDN_MASK |
-				CS42L42_HP_PDN_MASK);
-	} else {
-		dev_err(component->dev, "Invalid event 0x%x\n", event);
-	}
-	return 0;
-}
-
 static const struct snd_soc_dapm_widget cs42l42_dapm_widgets[] = {
+	/* Playback Path */
 	SND_SOC_DAPM_OUTPUT("HP"),
-	SND_SOC_DAPM_AIF_IN("SDIN", NULL, 0, CS42L42_ASP_CLK_CFG,
-					CS42L42_ASP_SCLK_EN_SHIFT, false),
-	SND_SOC_DAPM_OUT_DRV_E("HPDRV", SND_SOC_NOPM, 0,
-					0, NULL, 0, cs42l42_hpdrv_evt,
-					SND_SOC_DAPM_POST_PMU |
-					SND_SOC_DAPM_PRE_PMD)
+	SND_SOC_DAPM_DAC("DAC", NULL, CS42L42_PWR_CTL1, CS42L42_HP_PDN_SHIFT, 1),
+	SND_SOC_DAPM_MIXER("MIXER", CS42L42_PWR_CTL1, CS42L42_MIXER_PDN_SHIFT, 1, NULL, 0),
+	SND_SOC_DAPM_AIF_IN("SDIN1", NULL, 0, CS42L42_ASP_RX_DAI0_EN, CS42L42_ASP_RX0_CH1_SHIFT, 0),
+	SND_SOC_DAPM_AIF_IN("SDIN2", NULL, 1, CS42L42_ASP_RX_DAI0_EN, CS42L42_ASP_RX0_CH2_SHIFT, 0),
+
+	/* Playback Requirements */
+	SND_SOC_DAPM_SUPPLY("ASP DAI0", CS42L42_PWR_CTL1, CS42L42_ASP_DAI_PDN_SHIFT, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SCLK", CS42L42_ASP_CLK_CFG, CS42L42_ASP_SCLK_EN_SHIFT, 0, NULL, 0),
 };
 
 static const struct snd_soc_dapm_route cs42l42_audio_map[] = {
-	{"SDIN", NULL, "Playback"},
-	{"HPDRV", NULL, "SDIN"},
-	{"HP", NULL, "HPDRV"}
+	/* Playback Path */
+	{"HP", NULL, "DAC"},
+	{"DAC", NULL, "MIXER"},
+	{"MIXER", NULL, "SDIN1"},
+	{"MIXER", NULL, "SDIN2"},
+	{"SDIN1", NULL, "Playback"},
+	{"SDIN2", NULL, "Playback"},
+
+	/* Playback Requirements */
+	{"SDIN1", NULL, "ASP DAI0"},
+	{"SDIN2", NULL, "ASP DAI0"},
+	{"SDIN1", NULL, "SCLK"},
+	{"SDIN2", NULL, "SCLK"},
 };
 
 static int cs42l42_component_probe(struct snd_soc_component *component)
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 2bd370b184e1d..e17a0c0aeb4a0 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -695,10 +695,10 @@
 #define CS42L42_ASP_RX_DAI0_EN		(CS42L42_PAGE_2A + 0x01)
 #define CS42L42_ASP_RX0_CH_EN_SHIFT	2
 #define CS42L42_ASP_RX0_CH_EN_MASK	(0xf << CS42L42_ASP_RX0_CH_EN_SHIFT)
-#define CS42L42_ASP_RX0_CH1_EN		1
-#define CS42L42_ASP_RX0_CH2_EN		2
-#define CS42L42_ASP_RX0_CH3_EN		4
-#define CS42L42_ASP_RX0_CH4_EN		8
+#define CS42L42_ASP_RX0_CH1_SHIFT	2
+#define CS42L42_ASP_RX0_CH2_SHIFT	3
+#define CS42L42_ASP_RX0_CH3_SHIFT	4
+#define CS42L42_ASP_RX0_CH4_SHIFT	5
 
 #define CS42L42_ASP_RX_DAI0_CH1_AP_RES	(CS42L42_PAGE_2A + 0x02)
 #define CS42L42_ASP_RX_DAI0_CH1_BIT_MSB	(CS42L42_PAGE_2A + 0x03)
-- 
2.30.1

