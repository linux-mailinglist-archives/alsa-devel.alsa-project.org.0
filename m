Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA63305F5
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 03:49:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 498A81900;
	Mon,  8 Mar 2021 03:48:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 498A81900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615171752;
	bh=pYTk2toTR6WmFaBhwS/qjpdO/OjXoCcMFcG/6yBfd4U=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MX0KC6uxz0lzayVKV7K/uaxWiIfyQEf2T/5hgN14fbyQT9vJiDsDQQ+vt9bTg6hmC
	 6h7iiiVJnb8MG+RfwSVNbrPPgaeuUbN3d3HCk+7WmpTpPuAR2CLGIlGP2k3iTBI3br
	 ucYMYo6aDnrM0Kyf7lND7DwiDocD9+hYBFVqsc6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6956F801ED;
	Mon,  8 Mar 2021 03:47:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99209F801D8; Mon,  8 Mar 2021 03:47:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 743CFF800D0
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 03:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 743CFF800D0
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 720F1200E4D;
 Mon,  8 Mar 2021 03:47:30 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CEBFF20177F;
 Mon,  8 Mar 2021 03:47:23 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1308A402C9;
 Mon,  8 Mar 2021 03:47:16 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 shengjiu.wang@nxp.com, festevam@gmail.com, gustavoars@kernel.org,
 sebastian.krzyszkowiak@puri.sm, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: wm8962: Relax bit clock divider searching
Date: Mon,  8 Mar 2021 10:34:37 +0800
Message-Id: <1615170877-25918-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

With S20_3LE format case, the sysclk = rate * 384,
the bclk = rate * 20 * 2, there is no proper bclk divider
for 384 / 40, because current condition needs exact match.
So driver fails to configure the clocking:

wm8962 3-001a: Unsupported BCLK ratio 9

Fix this by relaxing bitclk divider searching, so that when
no exact value can be derived from sysclk pick the closest
value greater than expected bitclk.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
changes in v2:
- Add debug message according to Charles's comments

 sound/soc/codecs/wm8962.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index ce4666a74793..34080f497584 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2403,6 +2403,7 @@ static const int sysclk_rates[] = {
 static void wm8962_configure_bclk(struct snd_soc_component *component)
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
+	int best, min_diff, diff;
 	int dspclk, i;
 	int clocking2 = 0;
 	int clocking4 = 0;
@@ -2473,23 +2474,25 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
 
 	dev_dbg(component->dev, "DSPCLK is %dHz, BCLK %d\n", dspclk, wm8962->bclk);
 
-	/* We're expecting an exact match */
+	/* Search a proper bclk, not exact match. */
+	best = 0;
+	min_diff = INT_MAX;
 	for (i = 0; i < ARRAY_SIZE(bclk_divs); i++) {
 		if (bclk_divs[i] < 0)
 			continue;
 
-		if (dspclk / bclk_divs[i] == wm8962->bclk) {
-			dev_dbg(component->dev, "Selected BCLK_DIV %d for %dHz\n",
-				bclk_divs[i], wm8962->bclk);
-			clocking2 |= i;
+		diff = (dspclk / bclk_divs[i]) - wm8962->bclk;
+		if (diff < 0) /* Table is sorted */
 			break;
+		if (diff < min_diff) {
+			best = i;
+			min_diff = diff;
 		}
 	}
-	if (i == ARRAY_SIZE(bclk_divs)) {
-		dev_err(component->dev, "Unsupported BCLK ratio %d\n",
-			dspclk / wm8962->bclk);
-		return;
-	}
+	wm8962->bclk = dspclk / bclk_divs[best];
+	clocking2 |= best;
+	dev_dbg(component->dev, "Selected BCLK_DIV %d for %dHz\n",
+		bclk_divs[best], wm8962->bclk);
 
 	aif2 |= wm8962->bclk / wm8962->lrclk;
 	dev_dbg(component->dev, "Selected LRCLK divisor %d for %dHz\n",
-- 
2.27.0

