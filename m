Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2E418F0C6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 09:23:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 643661614;
	Mon, 23 Mar 2020 09:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 643661614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584951818;
	bh=lVHPU/0Hqrt9pDB8MLA5A6KsahsX1Wz/dqEXCB6b8FA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bfZ9kyb0NLIgCBBAP7wGeNQePFEyYGO8W/SHql0qelDLOnCd0SyCqr/pMGixqvEQ2
	 6mLHJj6gUXPKfKazOExyUrL8v5SrpIxNda175PxbIDOJIaB5GDa6SkjAbPLR1f3rqt
	 nuqBSnEXIQEvOAURsyyxUSiPwKGaeuwsEXUrUf6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D2D8F800F6;
	Mon, 23 Mar 2020 09:21:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B979F8020B; Mon, 23 Mar 2020 09:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0133F800F6
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 09:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0133F800F6
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 02N8Lfug015121,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 02N8Lfug015121
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 16:21:41 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 23 Mar 2020 16:21:41 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 23 Mar
 2020 16:21:40 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [v3 2/3] ASoC: rt5682: Add a property for DMIC delay
Date: Mon, 23 Mar 2020 16:21:35 +0800
Message-ID: <20200323082136.7820-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323082136.7820-1-oder_chiou@realtek.com>
References: <20200323082136.7820-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, cychiang@google.com, derek.fang@realtek.com,
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

The patch adds a property for DMIC delay (ms) to avoid pop noise and
changes the default delay setting.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 include/sound/rt5682.h    |  1 +
 sound/soc/codecs/rt5682.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/sound/rt5682.h b/include/sound/rt5682.h
index 96b268ac96bd..e1f790561ac1 100644
--- a/include/sound/rt5682.h
+++ b/include/sound/rt5682.h
@@ -39,6 +39,7 @@ struct rt5682_platform_data {
 	enum rt5682_jd_src jd_src;
 	unsigned int btndet_delay;
 	unsigned int dmic_clk_rate;
+	unsigned int dmic_delay;
 
 	const char *dai_clk_names[RT5682_DAI_NUM_CLKS];
 };
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 20a571bfe05c..d5a9e8a48607 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1544,10 +1544,18 @@ static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
 static int set_dmic_power(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	unsigned int delay = 50;
+
+	if (rt5682->pdata.dmic_delay)
+		delay = rt5682->pdata.dmic_delay;
+
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		/*Add delay to avoid pop noise*/
-		msleep(150);
+		msleep(delay);
 		break;
 
 	default:
@@ -3236,6 +3244,8 @@ static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 		&rt5682->pdata.btndet_delay);
 	device_property_read_u32(dev, "realtek,dmic-clk-rate-hz",
 		&rt5682->pdata.dmic_clk_rate);
+	device_property_read_u32(dev, "realtek,dmic-delay-ms",
+		&rt5682->pdata.dmic_delay);
 
 	rt5682->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
 		"realtek,ldo1-en-gpios", 0);
-- 
2.25.1

