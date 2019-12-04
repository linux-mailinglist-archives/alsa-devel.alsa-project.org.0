Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B2F113595
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 20:22:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C42C4166C;
	Wed,  4 Dec 2019 20:21:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C42C4166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575487340;
	bh=0GOWpiARvaQ088MimwZsm8qVDYN5dsokMWvYd6G1m7E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gRADU6Btk+V445/D22P8ghwRuaexjFkSsAz643sXI1zXVxRQsDnEncXlvgFm4V0tx
	 CFKb1C4gL9nAmFER8Gjt2sSQIB35V3LwUMojDepKJcskiOZwWQWnH53EH2uajel9p7
	 3KHVaxONleIug+ukJKGzFQ52FLiSNDxNQauetVVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC08AF801EC;
	Wed,  4 Dec 2019 20:20:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA7BF801EC; Wed,  4 Dec 2019 20:20:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B59ADF800F0
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 20:20:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B59ADF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="opyk4bGW"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4JK4ij047032;
 Wed, 4 Dec 2019 13:20:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1575487205;
 bh=9uyPvlOAcm8aoIG/iPTno+48I0NiZsM9pggOxAKIsrc=;
 h=From:To:CC:Subject:Date;
 b=opyk4bGW0eGhxzBUeBlGlxIOr+Zvc2Io3gwwdbAbvyaIQ9seLuRBSiOiL+sUlHxf9
 S44GTSdqhkGMI3lNRd93jHYtXrcjaYC223kcB9VV3U7L4e+9iCDmSQ9EXmk0nEmnAh
 1hOl6s0H9NGwjKwOltv7cOPooFxVAVWngimmDjMo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4JK41S126243
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Dec 2019 13:20:04 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 13:20:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 13:20:03 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4JK2qT057519;
 Wed, 4 Dec 2019 13:20:02 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 4 Dec 2019 21:20:05 +0200
Message-ID: <20191204192005.31210-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ASoC: ti: davinci-mcasp: Improve the sysclk
	selection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When McASP is master the bclk can be generated from two main source:
AUXCLK: functional clock for McASP or
AHCLK: from external source or internal mux in dra7x family

With this patch it is possible to select between the two source. The patch
is not breaking existing machine drivers since historically the clk_id was
ignored and left as 0 in all cases.

When output clock is configured - which can be only the AHCLK, we select
the AUXCLK as source for the internal HCLK. In this case the HCLK rate is
the same as the output clock.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 35 ++++++++++++++++++++++++++++-------
 sound/soc/ti/davinci-mcasp.h |  4 ++++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 8e5371801d88..e1e937eb1dc1 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -664,18 +664,39 @@ static int davinci_mcasp_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(dai);
 
 	pm_runtime_get_sync(mcasp->dev);
-	if (dir == SND_SOC_CLOCK_OUT) {
+
+	if (dir == SND_SOC_CLOCK_IN) {
+		switch (clk_id) {
+		case MCASP_CLK_HCLK_AHCLK:
+			mcasp_clr_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG,
+				       AHCLKXE);
+			mcasp_clr_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG,
+				       AHCLKRE);
+			clear_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
+			break;
+		case MCASP_CLK_HCLK_AUXCLK:
+			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG,
+				       AHCLKXE);
+			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG,
+				       AHCLKRE);
+			set_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
+			break;
+		default:
+			dev_err(mcasp->dev, "Invalid clk id: %d\n", clk_id);
+			goto out;
+		}
+	} else {
+		/* Select AUXCLK as HCLK */
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG, AHCLKXE);
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG, AHCLKRE);
 		set_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
-	} else {
-		mcasp_clr_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG, AHCLKXE);
-		mcasp_clr_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG, AHCLKRE);
-		clear_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
 	}
-
+	/*
+	 * When AHCLK X/R is selected to be output it means that the HCLK is
+	 * the same clock - coming via AUXCLK.
+	 */
 	mcasp->sysclk_freq = freq;
-
+out:
 	pm_runtime_put(mcasp->dev);
 	return 0;
 }
diff --git a/sound/soc/ti/davinci-mcasp.h b/sound/soc/ti/davinci-mcasp.h
index bc705d6ca48b..5de2b8a31061 100644
--- a/sound/soc/ti/davinci-mcasp.h
+++ b/sound/soc/ti/davinci-mcasp.h
@@ -295,6 +295,10 @@
 #define NUMEVT(x)	(((x) & 0xFF) << 8)
 #define NUMDMA_MASK	(0xFF)
 
+/* Source of High-frequency transmit/receive clock */
+#define MCASP_CLK_HCLK_AHCLK		0 /* AHCLKX/R */
+#define MCASP_CLK_HCLK_AUXCLK		1 /* Internal functional clock */
+
 /* clock divider IDs */
 #define MCASP_CLKDIV_AUXCLK		0 /* HCLK divider from AUXCLK */
 #define MCASP_CLKDIV_BCLK		1 /* BCLK divider from HCLK */
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
