Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 232372687C5
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 11:00:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAECB1675;
	Mon, 14 Sep 2020 10:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAECB1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600074033;
	bh=2KHTyYsC4dmh1Kz4Yq9kAh0nkCZcqCi5YE14/yI8QFI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BGXmdFXdl6ostguz4Gmwmp3uCRjpLSXH54jy8ghMdep5xXfNV6387bslY3sPYg2v5
	 apSt+eczXRH7vt2WTr1psU6dsopMvUUCuKm+y0tuscZEnxCebhDkl/d9TsJoLsWH7p
	 A4ntSFh7KLOdQ1AjOAnZC1aqiF6FjBtoL2Xhg6Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BF13F800F1;
	Mon, 14 Sep 2020 10:58:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92A36F80150; Mon, 14 Sep 2020 10:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 281DFF80150
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 10:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 281DFF80150
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 08E8vqaiF030357,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 08E8vqaiF030357
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 14 Sep 2020 16:57:52 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 14 Sep 2020 16:57:51 +0800
Received: from derek-pvm.localdomain (172.22.239.23) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 14 Sep 2020 16:57:50 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: rt1015: Fix DC calibration on bypass boost mode
Date: Mon, 14 Sep 2020 16:57:18 +0800
Message-ID: <1600073839-6762-1-git-send-email-derek.fang@realtek.com>
X-Mailer: git-send-email 2.7.4
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

Fix the DC calibration unsuccessful issue on rt1015
bypass boost mode.

Signed-off-by: derek.fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt1015.c | 48 +++++++++++++++++++++++++++++++++--------------
 sound/soc/codecs/rt1015.h |  1 +
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 548f686..ba1b6b3 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -484,6 +484,33 @@ static int rt1015_bypass_boost_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static void rt1015_calibrate(struct rt1015_priv *rt1015)
+{
+	struct snd_soc_component *component = rt1015->component;
+	struct regmap *regmap = rt1015->regmap;
+
+	snd_soc_dapm_mutex_lock(&component->dapm);
+	regcache_cache_bypass(regmap, true);
+
+	regmap_write(regmap, RT1015_PWR1, 0xd7df);
+	regmap_write(regmap, RT1015_PWR4, 0x00b2);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL8, 0x2008);
+	regmap_write(regmap, RT1015_CLSD_INTERNAL9, 0x0140);
+	regmap_write(regmap, RT1015_GAT_BOOST, 0x0efe);
+	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000d);
+	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000e);
+	regmap_write(regmap, RT1015_DC_CALIB_CLSD1, 0x5a00);
+	regmap_write(regmap, RT1015_DC_CALIB_CLSD1, 0x5a01);
+	regmap_write(regmap, RT1015_DC_CALIB_CLSD1, 0x5a05);
+	msleep(500);
+	regmap_write(regmap, RT1015_PWR1, 0x0);
+
+	regcache_cache_bypass(regmap, false);
+	regcache_mark_dirty(regmap);
+	regcache_sync(regmap);
+	snd_soc_dapm_mutex_unlock(&component->dapm);
+}
+
 static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
@@ -494,20 +521,12 @@ static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 
 	if (!rt1015->dac_is_used) {
 		rt1015->bypass_boost = ucontrol->value.integer.value[0];
-		if (rt1015->bypass_boost == RT1015_Bypass_Boost) {
-			snd_soc_component_write(component,
-				RT1015_PWR4, 0x00b2);
-			snd_soc_component_write(component,
-				RT1015_CLSD_INTERNAL8, 0x2008);
-			snd_soc_component_write(component,
-				RT1015_CLSD_INTERNAL9, 0x0140);
-			snd_soc_component_write(component,
-				RT1015_GAT_BOOST, 0x0efe);
-			snd_soc_component_write(component,
-				RT1015_PWR_STATE_CTRL, 0x000d);
-			msleep(500);
-			snd_soc_component_write(component,
-				RT1015_PWR_STATE_CTRL, 0x000e);
+		if (rt1015->bypass_boost == RT1015_Bypass_Boost &&
+			!rt1015->cali_done) {
+			rt1015_calibrate(rt1015);
+			rt1015->cali_done = 1;
+
+			regmap_write(rt1015->regmap, RT1015_MONO_DYNA_CTRL, 0x0010);
 		}
 	} else
 		dev_err(component->dev, "DAC is being used!\n");
@@ -888,6 +907,7 @@ static int rt1015_probe(struct snd_soc_component *component)
 
 	rt1015->component = component;
 	rt1015->bclk_ratio = 0;
+	rt1015->cali_done = 0;
 	snd_soc_component_write(component, RT1015_BAT_RPO_STEP1, 0x061c);
 
 	return 0;
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index 7bd159e..4d11f58 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -389,6 +389,7 @@ struct rt1015_priv {
 	int bypass_boost;
 	int amp_ver;
 	int dac_is_used;
+	int cali_done;
 };
 
 #endif /* __RT1015_H__ */
-- 
2.7.4

