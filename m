Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03C27A703
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 07:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8566D18A1;
	Mon, 28 Sep 2020 07:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8566D18A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601271682;
	bh=moKBLfxVo04PCNiD4wLraPe+ysalwkJWuWYpG7MF3vM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oxy6St+20h2RKl3QkUWt3MK6e8hZGI93XWb78mZhe7I671t7mGLtZGjQuIZx0pFQW
	 UOJKLMdCEMP7piETUwhWHlnj3odWDiauEZE+vuVjSCyWrW2uccVHUGjGqDJ6da9i/h
	 aaDMmpEL8n6UgaoFp3VjbZ7GvmBOIHF0Du5KUiG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 680FCF800FD;
	Mon, 28 Sep 2020 07:39:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 357BFF801F9; Mon, 28 Sep 2020 07:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 794D3F800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 794D3F800FD
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 08S5dKjB5023640,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 08S5dKjB5023640
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Sep 2020 13:39:20 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 28 Sep
 2020 13:39:20 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682: Enable the power of "MICBIAS" and "Vref2" for
 the DMIC clock
Date: Mon, 28 Sep 2020 13:39:12 +0800
Message-ID: <20200928053912.16664-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB01.realtek.com.tw (172.21.6.94) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, cychiang@google.com, albertchen@realtek.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

The power of "MICBIAS" and "Vref2" was needed while the DMIC clcok was from
the PLL output.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt5682.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 93ebf0279b62..a9acce7b6cca 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1529,16 +1529,35 @@ static int set_dmic_power(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	unsigned int delay = 50;
+	unsigned int delay = 50, val;
 
 	if (rt5682->pdata.dmic_delay)
 		delay = rt5682->pdata.dmic_delay;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
+		val = snd_soc_component_read(component, RT5682_GLB_CLK);
+		val &= RT5682_SCLK_SRC_MASK;
+		if (val == RT5682_SCLK_SRC_PLL1 || val == RT5682_SCLK_SRC_PLL2)
+			snd_soc_component_update_bits(component,
+				RT5682_PWR_ANLG_1,
+				RT5682_PWR_VREF2 | RT5682_PWR_MB,
+				RT5682_PWR_VREF2 | RT5682_PWR_MB);
+
 		/*Add delay to avoid pop noise*/
 		msleep(delay);
 		break;
+
+	case SND_SOC_DAPM_POST_PMD:
+		if (!rt5682->jack_type) {
+			if (!snd_soc_dapm_get_pin_status(w->dapm, "MICBIAS"))
+				snd_soc_component_update_bits(component,
+					RT5682_PWR_ANLG_1, RT5682_PWR_MB, 0);
+			if (!snd_soc_dapm_get_pin_status(w->dapm, "Vref2"))
+				snd_soc_component_update_bits(component,
+					RT5682_PWR_ANLG_1, RT5682_PWR_VREF2, 0);
+		}
+		break;
 	}
 
 	return 0;
@@ -1644,7 +1663,8 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("DMIC CLK", SND_SOC_NOPM, 0, 0,
 		set_dmic_clk, SND_SOC_DAPM_PRE_PMU),
 	SND_SOC_DAPM_SUPPLY("DMIC1 Power", RT5682_DMIC_CTRL_1,
-		RT5682_DMIC_1_EN_SFT, 0, set_dmic_power, SND_SOC_DAPM_POST_PMU),
+		RT5682_DMIC_1_EN_SFT, 0, set_dmic_power,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 
 	/* Boost */
 	SND_SOC_DAPM_PGA("BST1 CBJ", SND_SOC_NOPM,
-- 
2.28.0

