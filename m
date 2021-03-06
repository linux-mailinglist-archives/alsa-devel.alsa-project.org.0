Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BFC32FCA9
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Mar 2021 20:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58D5B1EDD;
	Sat,  6 Mar 2021 20:15:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58D5B1EDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615058170;
	bh=gTcmM7mcqTvvhmabUVO+KNHWrRA/y25XEZq+Wy+WAa4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GnAHP6syQOb2lsgL0fus7RLx6w/uek0UVkQpCux4TY5SR89P88V51ao71+7fVMElO
	 r7T+q9SAuRajMAhC9LlOCYBDkXtQ+4NFGQDT42FEVCY4NObo71g7RupKb5BHnYEhmO
	 UqEJKEyyPwTpDszfjp9h9lXqlOM1AyNBEbVdaCWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 913CDF800F3;
	Sat,  6 Mar 2021 20:13:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88050F8049C; Sat,  6 Mar 2021 20:13:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98973F80269
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 20:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98973F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="S2Ti0THz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 126J6uDH011401; Sat, 6 Mar 2021 13:13:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=g+uVrj2vk3sLaGnylrZQrietKgfFQiATKUhtVSUm6hU=;
 b=S2Ti0THzBudjUhQc61iZP2AsjFFxWkaCujjJfYB+RWj9tRwN86RiV/3RwYsB8aZAWjp4
 AVIceIyrTyunCqmnfQo/5UxRNzIOaQP8vSzEaSQHMYDRmmK/NVWM1e9G730BWNQ6llN4
 VQ2PX72oNfjcZCfGtmj/seUwu6EHIX+8tSFhfIvhA6Qckih3RW/m5FaR018C5ePd6SVH
 foq+lEIo6iEbm9gGFYxP97drYFm6ENC4FRojH+dJEX9TbOi16v1vu+W0XZQDN7OBrKf+
 IVV7GGJzp/tWiS8+pKeTPtIzBmW29xnpID6ww7derkGu00pfJ16+U3/0K+Rwwh3Y/9XW hw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3748198d06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 06 Mar 2021 13:13:31 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 6 Mar 2021
 18:56:26 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Sat, 6 Mar 2021 18:56:26 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AFD7211CF;
 Sat,  6 Mar 2021 18:56:21 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v3 02/15] ASoC: cs42l42: Fix channel width support
Date: Sat, 6 Mar 2021 18:55:40 +0000
Message-ID: <20210306185553.62053-3-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
References: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103060119
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

Remove the hard coded 32 bits width and replace with the correct width
calculated by params_width.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
Changes in v3:
- No changes

Changes in v2:
- No changes

 sound/soc/codecs/cs42l42.c | 47 ++++++++++++++++++--------------------
 sound/soc/codecs/cs42l42.h |  1 -
 2 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index df0d5fec0287a..4f9ad95479292 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -691,24 +691,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 					CS42L42_CLK_OASRC_SEL_MASK,
 					CS42L42_CLK_OASRC_SEL_12 <<
 					CS42L42_CLK_OASRC_SEL_SHIFT);
-			/* channel 1 on low LRCLK, 32 bit */
-			snd_soc_component_update_bits(component,
-					CS42L42_ASP_RX_DAI0_CH1_AP_RES,
-					CS42L42_ASP_RX_CH_AP_MASK |
-					CS42L42_ASP_RX_CH_RES_MASK,
-					(CS42L42_ASP_RX_CH_AP_LOW <<
-					CS42L42_ASP_RX_CH_AP_SHIFT) |
-					(CS42L42_ASP_RX_CH_RES_32 <<
-					CS42L42_ASP_RX_CH_RES_SHIFT));
-			/* Channel 2 on high LRCLK, 32 bit */
-			snd_soc_component_update_bits(component,
-					CS42L42_ASP_RX_DAI0_CH2_AP_RES,
-					CS42L42_ASP_RX_CH_AP_MASK |
-					CS42L42_ASP_RX_CH_RES_MASK,
-					(CS42L42_ASP_RX_CH_AP_HI <<
-					CS42L42_ASP_RX_CH_AP_SHIFT) |
-					(CS42L42_ASP_RX_CH_RES_32 <<
-					CS42L42_ASP_RX_CH_RES_SHIFT));
 			if (pll_ratio_table[i].mclk_src_sel == 0) {
 				/* Pass the clock straight through */
 				snd_soc_component_update_bits(component,
@@ -824,14 +806,29 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
-	int retval;
+	unsigned int width = (params_width(params) / 8) - 1;
+	unsigned int val = 0;
 
 	cs42l42->srate = params_rate(params);
-	cs42l42->swidth = params_width(params);
 
-	retval = cs42l42_pll_config(component);
+	switch(substream->stream) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		val |= width << CS42L42_ASP_RX_CH_RES_SHIFT;
+		/* channel 1 on low LRCLK */
+		snd_soc_component_update_bits(component, CS42L42_ASP_RX_DAI0_CH1_AP_RES,
+							 CS42L42_ASP_RX_CH_AP_MASK |
+							 CS42L42_ASP_RX_CH_RES_MASK, val);
+		/* Channel 2 on high LRCLK */
+		val |= CS42L42_ASP_RX_CH_AP_HI << CS42L42_ASP_RX_CH_AP_SHIFT;
+		snd_soc_component_update_bits(component, CS42L42_ASP_RX_DAI0_CH2_AP_RES,
+							 CS42L42_ASP_RX_CH_AP_MASK |
+							 CS42L42_ASP_RX_CH_RES_MASK, val);
+		break;
+	default:
+		break;
+	}
 
-	return retval;
+	return cs42l42_pll_config(component);
 }
 
 static int cs42l42_set_sysclk(struct snd_soc_dai *dai,
@@ -896,9 +893,9 @@ static int cs42l42_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return 0;
 }
 
-#define CS42L42_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S18_3LE | \
-			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE | \
-			SNDRV_PCM_FMTBIT_S32_LE)
+#define CS42L42_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE )
 
 
 static const struct snd_soc_dai_ops cs42l42_ops = {
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 1f0d67c95a9ad..9b017b76828a4 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -757,7 +757,6 @@ struct  cs42l42_private {
 	struct completion pdn_done;
 	u32 sclk;
 	u32 srate;
-	u32 swidth;
 	u8 plug_state;
 	u8 hs_type;
 	u8 ts_inv;
-- 
2.30.1

