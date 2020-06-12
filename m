Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A81F7367
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 07:19:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F73C1685;
	Fri, 12 Jun 2020 07:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F73C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591939177;
	bh=E2Jvz3IZs1a1KXZEjhlctW2AiaQeu6Noiyyg2xyl+kU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oo7opjlgfJKJw/yCx433NGP5ctb4Q/rDUsCWt9kjnKvNXNnekTCjY7wafOuXyLazQ
	 sdrJlCX3FLy1vKO5MfHMe9IZSsQnOaVkX/LeEyRfcEZYAeNbH2enWhhULmHn6sMUyh
	 LEuht1FLJnSQwOkA0aTli58dQr6wK1FlvzzP/rVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C939EF802A8;
	Fri, 12 Jun 2020 07:16:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 805EDF8021E; Fri, 12 Jun 2020 07:16:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D4CBF80228
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 07:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D4CBF80228
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 05C5FtvX6027415,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 05C5FtvX6027415
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 12 Jun 2020 13:15:55 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 12 Jun 2020 13:15:54 +0800
Received: from derek-pvm.localdomain (172.22.234.205) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 12 Jun 2020 13:15:54 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/5] ASoC: rt5682: Enable Vref2 under using PLL2
Date: Fri, 12 Jun 2020 13:15:21 +0800
Message-ID: <1591938925-1070-1-git-send-email-derek.fang@realtek.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.234.205]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
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

Enable Vref2 under long term using PLL2 to avoid clock unstable.

Signed-off-by: derek.fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d324512..ca8e1f2 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -960,13 +960,12 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 		rt5682_enable_push_button_irq(component, false);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
 			RT5682_TRIG_JD_MASK, RT5682_TRIG_JD_LOW);
-		if (snd_soc_dapm_get_pin_status(dapm, "MICBIAS"))
+		if (!snd_soc_dapm_get_pin_status(dapm, "MICBIAS"))
 			snd_soc_component_update_bits(component,
-				RT5682_PWR_ANLG_1, RT5682_PWR_VREF2, 0);
-		else
+				RT5682_PWR_ANLG_1, RT5682_PWR_MB, 0);
+		if (!snd_soc_dapm_get_pin_status(dapm, "Vref2"))
 			snd_soc_component_update_bits(component,
-				RT5682_PWR_ANLG_1,
-				RT5682_PWR_VREF2 | RT5682_PWR_MB, 0);
+				RT5682_PWR_ANLG_1, RT5682_PWR_VREF2, 0);
 		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_3,
 			RT5682_PWR_CBJ, 0);
 
@@ -1601,8 +1600,7 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 		0, set_filter_clk, SND_SOC_DAPM_PRE_PMU),
 	SND_SOC_DAPM_SUPPLY("Vref1", RT5682_PWR_ANLG_1, RT5682_PWR_VREF1_BIT, 0,
 		rt5682_set_verf, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
-	SND_SOC_DAPM_SUPPLY("Vref2", RT5682_PWR_ANLG_1, RT5682_PWR_VREF2_BIT, 0,
-		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Vref2", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MICBIAS", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	/* ASRC */
@@ -2485,6 +2483,15 @@ static int rt5682_wclk_prepare(struct clk_hw *hw)
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS");
 	snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
 				RT5682_PWR_MB, RT5682_PWR_MB);
+
+	snd_soc_dapm_force_enable_pin_unlocked(dapm, "Vref2");
+	snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
+			RT5682_PWR_VREF2 | RT5682_PWR_FV2,
+			RT5682_PWR_VREF2);
+	usleep_range(55000, 60000);
+	snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
+			RT5682_PWR_FV2, RT5682_PWR_FV2);
+
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "I2S1");
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "PLL2F");
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "PLL2B");
@@ -2510,9 +2517,12 @@ static void rt5682_wclk_unprepare(struct clk_hw *hw)
 	snd_soc_dapm_mutex_lock(dapm);
 
 	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS");
+	snd_soc_dapm_disable_pin_unlocked(dapm, "Vref2");
 	if (!rt5682->jack_type)
 		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
+				RT5682_PWR_VREF2 | RT5682_PWR_FV2 |
 				RT5682_PWR_MB, 0);
+
 	snd_soc_dapm_disable_pin_unlocked(dapm, "I2S1");
 	snd_soc_dapm_disable_pin_unlocked(dapm, "PLL2F");
 	snd_soc_dapm_disable_pin_unlocked(dapm, "PLL2B");
-- 
2.7.4

