Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 885261F7368
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 07:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31CE1168D;
	Fri, 12 Jun 2020 07:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31CE1168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591939224;
	bh=D4N+Bc4pnpQnOE37qwfIujo4d4aggTOju433eFPymJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u43sD+H6EnVT4+AnlzrQCx8btxaE0AAsA4fh+qaR17fIZwPx30nqOoeQPtG8oB7Mn
	 cAgYZMaaTmv0X9VefoXlsev+E7XWa18EB5RLqgA21SUmyZc+kNzef+oxu6XibN3oWd
	 Rif6kItP+6oXgolOn+MOB49VXe9H8vibOw8CBLVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E969FF802E0;
	Fri, 12 Jun 2020 07:16:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D26AF802DF; Fri, 12 Jun 2020 07:16:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ADD2F80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 07:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ADD2F80058
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 05C5FtxE6027422,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 05C5FtxE6027422
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 12 Jun 2020 13:15:55 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 12 Jun 2020 13:15:55 +0800
Received: from derek-pvm.localdomain (172.22.234.205) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 12 Jun 2020 13:15:55 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 4/5] ASoC: rt5682: DAI wclk supports 44100 Hz output
Date: Fri, 12 Jun 2020 13:15:24 +0800
Message-ID: <1591938925-1070-4-git-send-email-derek.fang@realtek.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591938925-1070-1-git-send-email-derek.fang@realtek.com>
References: <1591938925-1070-1-git-send-email-derek.fang@realtek.com>
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

DAI Wclk of rt5682 only supports 48000Hz output so far,
this patch lets it support 44100Hz.

Signed-off-by: derek.fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682.c | 49 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 5959b6a..f9d8d8c 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2461,8 +2461,8 @@ static int rt5682_set_bias_level(struct snd_soc_component *component,
 
 #ifdef CONFIG_COMMON_CLK
 #define CLK_PLL2_FIN 48000000
-#define CLK_PLL2_FOUT 24576000
 #define CLK_48 48000
+#define CLK_44 44100
 
 static bool rt5682_clk_check(struct rt5682_priv *rt5682)
 {
@@ -2544,13 +2544,22 @@ static unsigned long rt5682_wclk_recalc_rate(struct clk_hw *hw,
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
+	struct snd_soc_component *component = rt5682->component;
+	const char * const clk_name = __clk_get_name(hw->clk);
 
 	if (!rt5682_clk_check(rt5682))
 		return 0;
 	/*
-	 * Only accept to set wclk rate to 48kHz temporarily.
+	 * Only accept to set wclk rate to 44.1k or 48kHz.
 	 */
-	return CLK_48;
+	if (rt5682->lrck[RT5682_AIF1] != CLK_48 &&
+	    rt5682->lrck[RT5682_AIF1] != CLK_44) {
+		dev_warn(component->dev, "%s: clk %s only support %d or %d Hz output\n",
+			__func__, clk_name, CLK_44, CLK_48);
+		return 0;
+	}
+
+	return rt5682->lrck[RT5682_AIF1];
 }
 
 static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -2559,13 +2568,22 @@ static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
+	struct snd_soc_component *component = rt5682->component;
+	const char * const clk_name = __clk_get_name(hw->clk);
 
 	if (!rt5682_clk_check(rt5682))
 		return -EINVAL;
 	/*
-	 * Only accept to set wclk rate to 48kHz temporarily.
+	 * Only accept to set wclk rate to 44.1k or 48kHz.
+	 * It will force to 48kHz if not both.
 	 */
-	return CLK_48;
+	if (rate != CLK_48 && rate != CLK_44) {
+		dev_warn(component->dev, "%s: clk %s only support %d or %d Hz output\n",
+			__func__, clk_name, CLK_44, CLK_48);
+		rate = CLK_48;
+	}
+
+	return rate;
 }
 
 static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2578,6 +2596,7 @@ static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk *parent_clk;
 	const char * const clk_name = __clk_get_name(hw->clk);
 	int pre_div;
+	unsigned int clk_pll2_out;
 
 	if (!rt5682_clk_check(rt5682))
 		return -EINVAL;
@@ -2600,23 +2619,17 @@ static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
 			clk_name, CLK_PLL2_FIN);
 
 	/*
-	 * It's a temporary limitation. Only accept to set wclk rate to 48kHz.
-	 * It will force wclk to 48kHz even it's not.
-	 */
-	if (rate != CLK_48) {
-		dev_warn(component->dev, "clk %s only support %d Hz output\n",
-			clk_name, CLK_48);
-		rate = CLK_48;
-	}
-
-	/*
-	 * To achieve the rate conversion from 48MHz to 48kHz, PLL2 is needed.
+	 * To achieve the rate conversion from 48MHz to 44.1k or 48kHz,
+	 * PLL2 is needed.
 	 */
+	clk_pll2_out = rate * 512;
 	rt5682_set_component_pll(component, RT5682_PLL2, RT5682_PLL2_S_MCLK,
-		CLK_PLL2_FIN, CLK_PLL2_FOUT);
+		CLK_PLL2_FIN, clk_pll2_out);
 
 	rt5682_set_component_sysclk(component, RT5682_SCLK_S_PLL2, 0,
-		CLK_PLL2_FOUT, SND_SOC_CLOCK_IN);
+		clk_pll2_out, SND_SOC_CLOCK_IN);
+
+	rt5682->lrck[RT5682_AIF1] = rate;
 
 	pre_div = rl6231_get_clk_info(rt5682->sysclk, rate);
 
-- 
2.7.4

