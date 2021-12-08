Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E79546D0D9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 11:19:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A80D221D;
	Wed,  8 Dec 2021 11:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A80D221D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638958746;
	bh=6xeb0wvfyWAZ978TaqBwAxq8nuR61zpVyMKPZF6H+n8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kfh6FqcHgg7b7F9XQYiHeaYk1bDwo3UMiP1A4oj2JHEV2VCm/1hKuvxTlDTZvO4Y9
	 66JI8PSQoNChcT0D6334/beQ1KPhHKUKKExIIHhvbT0q8Lu6VLxJeaTT/0W6UqKdrI
	 FyTzmR2XwlePmlZvo6lOhZORirQcjXMuhJJ8sAwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFBBAF800AB;
	Wed,  8 Dec 2021 11:17:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3298DF804F1; Wed,  8 Dec 2021 11:17:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0F6FF804E5
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 11:17:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0F6FF804E5
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1B8AHO1v8029551,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1B8AHO1v8029551
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 8 Dec 2021 18:17:24 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 8 Dec 2021 18:17:24 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 8 Dec 2021 18:17:23 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt5682s: add delay time to fix pop sound issue
Date: Wed, 8 Dec 2021 18:17:18 +0800
Message-ID: <20211208101718.28945-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/08/2021 10:01:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzEyLzggpFekyCAwNjozOTowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 Trevor.Wu@mediatek.com, Shuming Fan <shumingf@realtek.com>, flove@realtek.com
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

From: Shuming Fan <shumingf@realtek.com>

There is a pop noise at the beginning of the capture data.
This patch adds the delay time before stereo1 ADC unmute to fix the pop sound issue.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/rt5682s.h    |  1 +
 sound/soc/codecs/rt5682s.c | 34 +++++++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/include/sound/rt5682s.h b/include/sound/rt5682s.h
index accfbc2dcdd2..f18d91308b9a 100644
--- a/include/sound/rt5682s.h
+++ b/include/sound/rt5682s.h
@@ -40,6 +40,7 @@ struct rt5682s_platform_data {
 	enum rt5682s_jd_src jd_src;
 	unsigned int dmic_clk_rate;
 	unsigned int dmic_delay;
+	unsigned int amic_delay;
 	bool dmic_clk_driving_high;
 
 	const char *dai_clk_names[RT5682S_DAI_NUM_CLKS];
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index d49a4f68566d..efa1016831dd 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -1367,6 +1367,31 @@ static int rt5682s_hp_amp_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int rt5682s_stereo1_adc_mixl_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
+	unsigned int delay = 0;
+
+	if (rt5682s->pdata.amic_delay)
+		delay = rt5682s->pdata.amic_delay;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		msleep(delay);
+		snd_soc_component_update_bits(component, RT5682S_STO1_ADC_DIG_VOL,
+			RT5682S_L_MUTE, 0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		snd_soc_component_update_bits(component, RT5682S_STO1_ADC_DIG_VOL,
+			RT5682S_L_MUTE, RT5682S_L_MUTE);
+		break;
+	}
+
+	return 0;
+}
+
 static int sar_power_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
@@ -1680,9 +1705,10 @@ static const struct snd_soc_dapm_widget rt5682s_dapm_widgets[] = {
 	/* ADC Mixer */
 	SND_SOC_DAPM_SUPPLY("ADC Stereo1 Filter", RT5682S_PWR_DIG_2,
 		RT5682S_PWR_ADC_S1F_BIT, 0, set_filter_clk, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_MIXER("Stereo1 ADC MIXL", RT5682S_STO1_ADC_DIG_VOL,
-		RT5682S_L_MUTE_SFT, 1, rt5682s_sto1_adc_l_mix,
-		ARRAY_SIZE(rt5682s_sto1_adc_l_mix)),
+	SND_SOC_DAPM_MIXER_E("Stereo1 ADC MIXL", SND_SOC_NOPM, 0, 0,
+		rt5682s_sto1_adc_l_mix, ARRAY_SIZE(rt5682s_sto1_adc_l_mix),
+		rt5682s_stereo1_adc_mixl_event,
+		SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_MIXER("Stereo1 ADC MIXR", RT5682S_STO1_ADC_DIG_VOL,
 		RT5682S_R_MUTE_SFT, 1, rt5682s_sto1_adc_r_mix,
 		ARRAY_SIZE(rt5682s_sto1_adc_r_mix)),
@@ -2885,6 +2911,8 @@ static int rt5682s_parse_dt(struct rt5682s_priv *rt5682s, struct device *dev)
 		&rt5682s->pdata.dmic_clk_rate);
 	device_property_read_u32(dev, "realtek,dmic-delay-ms",
 		&rt5682s->pdata.dmic_delay);
+	device_property_read_u32(dev, "realtek,amic-delay-ms",
+		&rt5682s->pdata.amic_delay);
 
 	rt5682s->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
 		"realtek,ldo1-en-gpios", 0);
-- 
2.34.1

