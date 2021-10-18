Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604F431E96
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 16:02:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B09E31740;
	Mon, 18 Oct 2021 16:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B09E31740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634565760;
	bh=Fek8dFbr7RMhcqTfob7U577FwVDD5/cJburZHWcgahc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q2q9lqCczGTIXP/S3WZfJFZrHrSETMYKtQD4laO2qPIaRMTj6nVGnYSMg46aD6hrz
	 LggpqClxBcDLz+hvY6Q2baCXRxyU1FKBXag7Xm57XOuzFMNhC1eL8FVYXFTvEBiB+Y
	 +2mvJJ3ovaR0YF1DO35CQLqN1xUlSOu80P0T/OK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 221E9F801DB;
	Mon, 18 Oct 2021 16:01:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8465AF80253; Mon, 18 Oct 2021 16:01:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91C69F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 16:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C69F801DB
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e87a:7c37:aec5:5884])
 by andre.telenet-ops.be with bizsmtp
 id 7S1D2600322VXnz01S1DK3; Mon, 18 Oct 2021 16:01:13 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mcTCS-005v0i-Pv; Mon, 18 Oct 2021 16:01:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mcTCS-00Ddmw-6W; Mon, 18 Oct 2021 16:01:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Adam Ford <aford173@gmail.com>, patches@opensource.cirrus.com
Subject: [PATCH] ASoC: wm8962: Convert to devm_clk_get_optional()
Date: Mon, 18 Oct 2021 16:01:11 +0200
Message-Id: <c2a8a1a628804a4439732d02847e25c227083690.1634565564.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
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

Use the existing devm_clk_get_optional() helper instead of building a
similar construct on top of devm_clk_get() that fails to handle all
errors but -EPROBE_DEFER.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 sound/soc/codecs/wm8962.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index ba16bdf9e478ca5f..a5584ba962dcf005 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3538,9 +3538,8 @@ static int wm8962_set_pdata_from_of(struct i2c_client *i2c,
 				pdata->gpio_init[i] = 0x0;
 		}
 
-	pdata->mclk = devm_clk_get(&i2c->dev, NULL);
-
-	return 0;
+	pdata->mclk = devm_clk_get_optional(&i2c->dev, NULL);
+	return PTR_ERR_OR_ZERO(pdata->mclk);
 }
 
 static int wm8962_i2c_probe(struct i2c_client *i2c,
@@ -3572,14 +3571,6 @@ static int wm8962_i2c_probe(struct i2c_client *i2c,
 			return ret;
 	}
 
-	/* Mark the mclk pointer to NULL if no mclk assigned */
-	if (IS_ERR(wm8962->pdata.mclk)) {
-		/* But do not ignore the request for probe defer */
-		if (PTR_ERR(wm8962->pdata.mclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		wm8962->pdata.mclk = NULL;
-	}
-
 	for (i = 0; i < ARRAY_SIZE(wm8962->supplies); i++)
 		wm8962->supplies[i].supply = wm8962_supply_names[i];
 
-- 
2.25.1

