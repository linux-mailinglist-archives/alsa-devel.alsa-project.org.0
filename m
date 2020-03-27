Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C28195230
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 08:41:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75CAD166F;
	Fri, 27 Mar 2020 08:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75CAD166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585294876;
	bh=xul483JebXqy3sOYWEklRssOb7UVeyV4c117Dh2aJAc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F+GYfBS/ULwRWZuoIByespoyKNhyoQYJv5Grl7MESIluGJHgU21iWd3p218QXfGX6
	 1gEbpX0K5NdLuV3RgEsoMLdiMzkUpAmAYIi5/AQ1yAUWIdtl03X5BpjQOtqX+HI3/9
	 GZr1RAZhFsgyd6mMyWJPznGPknoKstMJwAukrLkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E501F8015A;
	Fri, 27 Mar 2020 08:39:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94AA6F80158; Fri, 27 Mar 2020 08:39:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F91FF8011B
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 08:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F91FF8011B
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 02R7dAfX005565,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 02R7dAfX005565
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 15:39:10 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 27 Mar 2020 15:39:10 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Fri, 27 Mar
 2020 15:39:09 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682: move DAI clock registry to I2S mode
Date: Fri, 27 Mar 2020 15:38:49 +0800
Message-ID: <20200327073849.18291-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, rander.wang@intel.com, albertchen@realtek.com,
 derek.fang@realtek.com, bard.liao@intel.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
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

The SoundWire mode doesn't need the DAI clocks.
Therefore, the DAI clock registry moves to I2S mode case.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5682.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d5a9e8a48607..c9268a230daa 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2856,26 +2856,6 @@ static int rt5682_probe(struct snd_soc_component *component)
 #endif
 	rt5682->component = component;
 
-#ifdef CONFIG_COMMON_CLK
-	/* Check if MCLK provided */
-	rt5682->mclk = devm_clk_get(component->dev, "mclk");
-	if (IS_ERR(rt5682->mclk)) {
-		if (PTR_ERR(rt5682->mclk) != -ENOENT) {
-			ret = PTR_ERR(rt5682->mclk);
-			return ret;
-		}
-		rt5682->mclk = NULL;
-	}
-
-	/* Register CCF DAI clock control */
-	ret = rt5682_register_dai_clks(component);
-	if (ret)
-		return ret;
-
-	/* Initial setup for CCF */
-	rt5682->lrck[RT5682_AIF1] = CLK_48;
-#endif
-
 	if (rt5682->is_sdw) {
 		slave = rt5682->slave;
 		time = wait_for_completion_timeout(
@@ -2885,6 +2865,25 @@ static int rt5682_probe(struct snd_soc_component *component)
 			dev_err(&slave->dev, "Initialization not complete, timed out\n");
 			return -ETIMEDOUT;
 		}
+	} else {
+#ifdef CONFIG_COMMON_CLK
+		/* Check if MCLK provided */
+		rt5682->mclk = devm_clk_get(component->dev, "mclk");
+		if (IS_ERR(rt5682->mclk)) {
+			if (PTR_ERR(rt5682->mclk) != -ENOENT) {
+				ret = PTR_ERR(rt5682->mclk);
+				return ret;
+			}
+			rt5682->mclk = NULL;
+		} else {
+			/* Register CCF DAI clock control */
+			ret = rt5682_register_dai_clks(component);
+			if (ret)
+				return ret;
+		}
+		/* Initial setup for CCF */
+		rt5682->lrck[RT5682_AIF1] = CLK_48;
+#endif
 	}
 
 	return 0;
-- 
2.25.1

