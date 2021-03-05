Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3A32F179
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 18:39:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C6CC1906;
	Fri,  5 Mar 2021 18:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C6CC1906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614965982;
	bh=8Xs9wryr48QMxC6dZcBBdEQIBFKYugtlTXH2xZI6qi8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mK7rRDDqcmRCwkFoOUkbjZ3iJy893Ij6Tp8Ik1fEIQlI8OmfZrEu6/XoyT1wZejHf
	 EiaCfSwriB67L8p2NwFDViM4Eh0cJeHDj5oq7UntYU5uN6toCNO7ESV01bWb6J7sfA
	 i37WruM6HyaKJMJUWMPsiXy+CyI2K3YpidYewdS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B865F804E0;
	Fri,  5 Mar 2021 18:35:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21510F804AF; Fri,  5 Mar 2021 18:35:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ECFBF8026F
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 18:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECFBF8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oScXme1J"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125HWLWb005729; Fri, 5 Mar 2021 11:34:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=KdjiM3IXibc73Kw+22ypN9V9939VUbz3xp3KwNqFEzU=;
 b=oScXme1J1dGowBTobtrMDxPFIsfowcY7T2Uv6qVWY5YL8NO62z+tF0+UxOh0a7j3XrAD
 1xan+JtOaTUHfqmRWtHtr82syh6wT+cv675NUDOMpB1Q/DbIj6AAraF8EslP4UmzmAl2
 JOVhO/Zou/kD7VSf30ZLgJws1jSbxPP2RVG1tSLV+gA/lmfDlNJT3sZ07Wn+YW9KzPv1
 cwRxWeG67kmJz1+LrEgKRIGRANg35dS80jFdSF6xHk3M6Su39ThbqMCtkgp7yk86LzVN
 a8/BFiWi8MGztUjw+pem3GJhPevFOOrcbeY3csIAuQHfgnUqkL8OMyyC/vIxeQWOCJOm 7g== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc70eyn-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 05 Mar 2021 11:34:49 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 5 Mar 2021
 17:34:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:34:47 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7C2C711D6;
 Fri,  5 Mar 2021 17:34:47 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v2 08/15] ASoC: cs42l42: Provide finer control on playback path
Date: Fri, 5 Mar 2021 17:34:35 +0000
Message-ID: <20210305173442.195740-9-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
References: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=749 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103050090
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
Changes in v2:
- No changes

 sound/soc/codecs/cs42l42.c | 65 +++++++++++++-------------------------
 sound/soc/codecs/cs42l42.h |  8 ++---
 2 files changed, 26 insertions(+), 47 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 33c072f71867b..cad623e73d0fd 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -462,54 +462,33 @@ static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 				0x3f, 1, mixer_tlv)
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
index 866d7c873e3c9..4b448c102f538 100644
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

