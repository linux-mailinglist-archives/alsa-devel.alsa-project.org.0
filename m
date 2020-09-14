Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D02687BF
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 10:59:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 991B11686;
	Mon, 14 Sep 2020 10:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 991B11686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600073991;
	bh=XB/k5QAYBlWGFRP24rCB3iMO6nWrTr5DTabEHXAecv0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c12skbEXJRCwzycSvrfvch1Xy3AE0Ei5PBd7JosUyTNusnJo7CH89CLDhooS0TyyN
	 VgyNORjMMUk10MsuezYEFUnUWkM1X61prhyTU/f+YOAp6G+ofO/wZLhFM1yCZok0TU
	 sd3PFK0vGzqQ5d/NFk3mC+HqUXX+GU0Iu/KRXy2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1EFCF8015A;
	Mon, 14 Sep 2020 10:58:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B137EF8015C; Mon, 14 Sep 2020 10:58:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 080E2F80105
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 10:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 080E2F80105
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 08E8vqajF030357,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 08E8vqajF030357
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 14 Sep 2020 16:57:52 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 14 Sep 2020 16:57:52 +0800
Received: from derek-pvm.localdomain (172.22.239.23) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 14 Sep 2020 16:57:51 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt1015: Fix the failure to flush DAC data before
 playback
Date: Mon, 14 Sep 2020 16:57:19 +0800
Message-ID: <1600073839-6762-2-git-send-email-derek.fang@realtek.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600073839-6762-1-git-send-email-derek.fang@realtek.com>
References: <1600073839-6762-1-git-send-email-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.239.23]
X-ClientProxiedBy: RTEXMB02.realtek.com.tw (172.21.6.95) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, kent_chen@realtek.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

From: "derek.fang" <derek.fang@realtek.com>

Fix the failure to flush DAC data before playback.

Signed-off-by: derek.fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt1015.c | 63 +++++++++++++++++++++++++++++++++++++++++------
 sound/soc/codecs/rt1015.h |  7 ++++++
 2 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index ba1b6b3..25fe2dd 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -534,6 +534,32 @@ static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static void rt1015_flush_work(struct work_struct *work)
+{
+	struct rt1015_priv *rt1015 = container_of(work, struct rt1015_priv,
+						flush_work.work);
+	struct snd_soc_component *component = rt1015->component;
+	unsigned int val, i = 0, count = 20;
+
+	while (i < count) {
+		usleep_range(1000, 1500);
+		dev_dbg(component->dev, "Flush DAC (retry:%u)\n", i);
+		regmap_read(rt1015->regmap, RT1015_CLK_DET, &val);
+		if (val & 0x800)
+			break;
+		i++;
+	}
+
+	regmap_write(rt1015->regmap, RT1015_SYS_RST1, 0x0597);
+	regmap_write(rt1015->regmap, RT1015_SYS_RST1, 0x05f7);
+	regmap_write(rt1015->regmap, RT1015_MAN_I2C, 0x0028);
+
+	if (val & 0x800)
+		dev_dbg(component->dev, "Flush DAC completed.\n");
+	else
+		dev_warn(component->dev, "Fail to flush DAC data.\n");
+}
+
 static const struct snd_kcontrol_new rt1015_snd_controls[] = {
 	SOC_SINGLE_TLV("DAC Playback Volume", RT1015_DAC1, RT1015_DAC_VOL_SFT,
 		127, 0, dac_vol_tlv),
@@ -587,12 +613,7 @@ static int r1015_dac_event(struct snd_soc_dapm_widget *w,
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
-		if (rt1015->bypass_boost == RT1015_Bypass_Boost) {
-			regmap_write(rt1015->regmap, RT1015_MAN_I2C, 0x00a8);
-			regmap_write(rt1015->regmap, RT1015_SYS_RST1, 0x0597);
-			regmap_write(rt1015->regmap, RT1015_SYS_RST1, 0x05f7);
-			regmap_write(rt1015->regmap, RT1015_MAN_I2C, 0x0028);
-		}
+		regmap_write(rt1015->regmap, RT1015_MAN_I2C, 0x00a8);
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
@@ -608,6 +629,8 @@ static int r1015_dac_event(struct snd_soc_dapm_widget *w,
 				RT1015_SYS_RST1, 0x05f5);
 		}
 		rt1015->dac_is_used = 0;
+
+		cancel_delayed_work_sync(&rt1015->flush_work);
 		break;
 
 	default:
@@ -616,6 +639,24 @@ static int r1015_dac_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int rt1015_amp_drv_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		if (rt1015->hw_config == RT1015_HW_28)
+			schedule_delayed_work(&rt1015->flush_work, msecs_to_jiffies(10));
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget rt1015_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("LDO2", RT1015_PWR1, RT1015_PWR_LDO2_BIT, 0,
 		NULL, 0),
@@ -649,6 +690,8 @@ static const struct snd_soc_dapm_widget rt1015_dapm_widgets[] = {
 		r1015_dac_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 		SND_SOC_DAPM_POST_PMD),
 
+	SND_SOC_DAPM_OUT_DRV_E("Amp Drv", SND_SOC_NOPM, 0, 0, NULL, 0,
+			rt1015_amp_drv_event, SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_OUTPUT("SPO"),
 };
 
@@ -667,7 +710,8 @@ static const struct snd_soc_dapm_route rt1015_dapm_routes[] = {
 	{ "DAC", NULL, "MIXERV" },
 	{ "DAC", NULL, "SUMV" },
 	{ "DAC", NULL, "VREFLV" },
-	{ "SPO", NULL, "DAC" },
+	{ "Amp Drv", NULL, "DAC" },
+	{ "SPO", NULL, "Amp Drv" },
 };
 
 static int rt1015_hw_params(struct snd_pcm_substream *substream,
@@ -910,6 +954,8 @@ static int rt1015_probe(struct snd_soc_component *component)
 	rt1015->cali_done = 0;
 	snd_soc_component_write(component, RT1015_BAT_RPO_STEP1, 0x061c);
 
+	INIT_DELAYED_WORK(&rt1015->flush_work, rt1015_flush_work);
+
 	return 0;
 }
 
@@ -917,6 +963,7 @@ static void rt1015_remove(struct snd_soc_component *component)
 {
 	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
 
+	cancel_delayed_work_sync(&rt1015->flush_work);
 	regmap_write(rt1015->regmap, RT1015_RESET, 0);
 }
 
@@ -1042,6 +1089,8 @@ static int rt1015_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	rt1015->hw_config = (i2c->addr == 0x29) ? RT1015_HW_29 : RT1015_HW_28;
+
 	regmap_read(rt1015->regmap, RT1015_DEVICE_ID, &val);
 	if ((val != RT1015_DEVICE_ID_VAL) && (val != RT1015_DEVICE_ID_VAL2)) {
 		dev_err(&i2c->dev,
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index 4d11f58..d3fdd30 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -373,6 +373,11 @@ enum {
 	RT1015_Bypass_Boost,
 };
 
+enum {
+	RT1015_HW_28 = 0,
+	RT1015_HW_29,
+};
+
 struct rt1015_priv {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
@@ -390,6 +395,8 @@ struct rt1015_priv {
 	int amp_ver;
 	int dac_is_used;
 	int cali_done;
+	int hw_config;
+	struct delayed_work flush_work;
 };
 
 #endif /* __RT1015_H__ */
-- 
2.7.4

