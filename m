Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4588C7899C1
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 01:13:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9785484B;
	Sun, 27 Aug 2023 01:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9785484B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693091634;
	bh=F1pof+/TTChGaX5I0j20gxo3zNtz/W4od1TW3YlpiAE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sby2XNkMAFR+h7vtaGC5xP1ERwZVuRdB1sVLxIYtZ0PYxL+NJyVMrUrTGRyYe+EwK
	 XScualh0PP67L3R4cCIMrOdZduMebBq+LB02EbCJjOsUnq6hLOrJN5SpQD330RAJsV
	 ZAN7AO7uqduQkgrzlane5zM9nEPpp7ILumaepiVo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B875F80536; Sat, 26 Aug 2023 21:35:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDF4AF80158;
	Sat, 26 Aug 2023 21:35:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B807F8022B; Sat, 26 Aug 2023 21:35:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EAB2F800D1
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 21:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EAB2F800D1
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400";
   d="scan'208";a="174052354"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Aug 2023 04:34:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0910B4001957;
	Sun, 27 Aug 2023 04:34:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	alsa-devel@alsa-project.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: ak4642: Simplify probe()
Date: Sat, 26 Aug 2023 20:34:47 +0100
Message-Id: <20230826193447.113378-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SSB5KAUPCNLGKMBQN7RADY374MV3LYFB
X-Message-ID-Hash: SSB5KAUPCNLGKMBQN7RADY374MV3LYFB
X-MailFrom: biju.das.jz@bp.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSB5KAUPCNLGKMBQN7RADY374MV3LYFB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
retrieving match data by i2c_get_match_data().

While at it, drop local variable np from probe() by using dev->of_node.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 sound/soc/codecs/ak4642.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 2a8984c1fa9c..dc2d7cee0a4b 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -633,32 +633,20 @@ static const struct i2c_device_id ak4642_i2c_id[];
 static int ak4642_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
-	struct device_node *np = dev->of_node;
-	const struct ak4642_drvdata *drvdata = NULL;
+	const struct ak4642_drvdata *drvdata;
 	struct regmap *regmap;
 	struct ak4642_priv *priv;
 	struct clk *mcko = NULL;
 
-	if (np) {
-		const struct of_device_id *of_id;
-
+	if (dev->of_node) {
 		mcko = ak4642_of_parse_mcko(dev);
 		if (IS_ERR(mcko))
 			mcko = NULL;
-
-		of_id = of_match_device(ak4642_of_match, dev);
-		if (of_id)
-			drvdata = of_id->data;
-	} else {
-		const struct i2c_device_id *id =
-			i2c_match_id(ak4642_i2c_id, i2c);
-		drvdata = (const struct ak4642_drvdata *)id->driver_data;
 	}
 
-	if (!drvdata) {
-		dev_err(dev, "Unknown device type\n");
-		return -EINVAL;
-	}
+	drvdata = i2c_get_match_data(i2c);
+	if (!drvdata)
+		return dev_err_probe(dev, -ENODEV, "Unknown device type\n");
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-- 
2.25.1

