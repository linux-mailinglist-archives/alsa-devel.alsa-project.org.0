Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED383E7C9B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 17:42:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68BD170E;
	Tue, 10 Aug 2021 17:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68BD170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628610136;
	bh=tG12jlCTnJ0e6CK5TwVhtixp695E5mcwD5sobIYghq8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2jc+BcB3ZuuRSwWqS4SVbf9oerCSskQSkweidnhwsYcWuBzOqSC4ZcnOZyF+jOlQ
	 5VmHExCGwIzSaXKL6yhNFeV4tEmBgvxaGy5nqCPhBze4x1IMmg1IsZMt69vCEiLV0i
	 RFRt6zOGMEkEYFAtUWzVqy8UNLsXxqX0lSt4WZKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D54FFF80517;
	Tue, 10 Aug 2021 17:38:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A986EF80279; Tue, 10 Aug 2021 17:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 713A7F802A0
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 713A7F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="j1K7YFSE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17A75fJR008310; 
 Tue, 10 Aug 2021 10:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=mKano9YDWLykHLXNNc6xzmZykAqhECfAc4nYZheaHPo=;
 b=j1K7YFSEzpovuSAmZ8fNtj0XeF9gT0MPl5Oqk39qRiqosiQXVSO08/KFWvyX031TtBB7
 p9Hf6o35boybmdQ4v9/cw4Hr+USAWpqNb18a6xKuccLDpoY/ukCci3Vm6vXoP8epA6sq
 Y8OOlUvbb4ybiae8Lus/fDgDb7mKEhKwEE9iyuFUjd4f9hNdR8HVK8bUVojxTFpsRnIV
 JidONZvVxyyiodE+WP45hxM3eE3aKuX+cVFjw4BC/UmibVUp+/9a4p9dtpC9OCwmWlQU
 mTp9pWx7oPQqvlEOQXgiWTTbsAxq6qsMATJxn6Mc+Br8D5vImNdBuvR5gZQnEH4w5zfX wg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3abmrkgkf6-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Aug 2021 10:38:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 10 Aug
 2021 16:38:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 10 Aug 2021 16:38:04 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.221])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5D0F546E;
 Tue, 10 Aug 2021 15:38:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 07/12] ASoC: cs42l42: Allow time for HP/ADC to power-up after
 enable
Date: Tue, 10 Aug 2021 16:37:54 +0100
Message-ID: <20210810153759.24333-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810153759.24333-1-rf@opensource.cirrus.com>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OcM8UVQDvSGGMpD_UWXmo7RwjkXPpgLS
X-Proofpoint-ORIG-GUID: OcM8UVQDvSGGMpD_UWXmo7RwjkXPpgLS
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100099
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

After enabling the HP or ADC by writing the corresponding PDN=0,
it takes around 20 milliseconds for it to power up and the midrail
supply to be stable. Add this wait into a DAPM widget callback.

If HP and ADC are both powering up in a DAPM sequence, there's no
need to do the wait twice. The widget will perform one wait in the
POST_PMU if there was a PRE_PMU for one or both.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 31 +++++++++++++++++++++++++++++--
 sound/soc/codecs/cs42l42.h |  2 ++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index dd677055a3c1..0b63dba07b6d 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -456,10 +456,36 @@ static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 				0x3f, 1, mixer_tlv)
 };
 
+static int cs42l42_hp_adc_ev(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		cs42l42->hp_adc_up_pending = true;
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* Only need one delay if HP and ADC are both powering-up */
+		if (cs42l42->hp_adc_up_pending) {
+			usleep_range(CS42L42_HP_ADC_EN_TIME_US,
+				     CS42L42_HP_ADC_EN_TIME_US + 1000);
+			cs42l42->hp_adc_up_pending = false;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget cs42l42_dapm_widgets[] = {
 	/* Playback Path */
 	SND_SOC_DAPM_OUTPUT("HP"),
-	SND_SOC_DAPM_DAC("DAC", NULL, CS42L42_PWR_CTL1, CS42L42_HP_PDN_SHIFT, 1),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, CS42L42_PWR_CTL1, CS42L42_HP_PDN_SHIFT, 1,
+			   cs42l42_hp_adc_ev, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_MIXER("MIXER", CS42L42_PWR_CTL1, CS42L42_MIXER_PDN_SHIFT, 1, NULL, 0),
 	SND_SOC_DAPM_AIF_IN("SDIN1", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SDIN2", NULL, 1, SND_SOC_NOPM, 0, 0),
@@ -469,7 +495,8 @@ static const struct snd_soc_dapm_widget cs42l42_dapm_widgets[] = {
 
 	/* Capture Path */
 	SND_SOC_DAPM_INPUT("HS"),
-	SND_SOC_DAPM_ADC("ADC", NULL, CS42L42_PWR_CTL1, CS42L42_ADC_PDN_SHIFT, 1),
+	SND_SOC_DAPM_ADC_E("ADC", NULL, CS42L42_PWR_CTL1, CS42L42_ADC_PDN_SHIFT, 1,
+			   cs42l42_hp_adc_ev, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_AIF_OUT("SDOUT1", NULL, 0, CS42L42_ASP_TX_CH_EN, CS42L42_ASP_TX0_CH1_SHIFT, 0),
 	SND_SOC_DAPM_AIF_OUT("SDOUT2", NULL, 1, CS42L42_ASP_TX_CH_EN, CS42L42_ASP_TX0_CH2_SHIFT, 0),
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index addb6560c649..d13749e9d8c5 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -762,6 +762,7 @@
 #define CS42L42_CLOCK_SWITCH_DELAY_US 150
 #define CS42L42_PLL_LOCK_POLL_US	250
 #define CS42L42_PLL_LOCK_TIMEOUT_US	1250
+#define CS42L42_HP_ADC_EN_TIME_US	20000
 
 static const char *const cs42l42_supply_names[CS42L42_NUM_SUPPLIES] = {
 	"VA",
@@ -795,6 +796,7 @@ struct  cs42l42_private {
 	u8 hs_bias_ramp_time;
 	u8 hs_bias_sense_en;
 	u8 stream_use;
+	bool hp_adc_up_pending;
 };
 
 #endif /* __CS42L42_H__ */
-- 
2.11.0

