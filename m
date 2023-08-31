Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D04B78F448
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 22:49:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 917BE1FE;
	Thu, 31 Aug 2023 22:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 917BE1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693514978;
	bh=JPqAeZdrS+9DiUFuZF4TvS9r/CIVIY4YTYIzp0EgJUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=guhhMbHW+viDP/oR1Aj/Hub3nYUzACmbH1GqEsTx4emixoTDwgith74cVbfYgL1Pm
	 8pi5Oeihc0UdpB/OsiatZdZCXIeek2S8btyUJEgn1IrMaxShWBSnsAoUmJ6YScq0bi
	 ujiO8b1DY+BA1WUAYNOkQYzAEF8VDtVp8XHgopd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A10D4F80527; Thu, 31 Aug 2023 22:47:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 855F3F804F3;
	Thu, 31 Aug 2023 22:47:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47B9AF80158; Thu, 31 Aug 2023 22:47:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id EA3D5F800F5
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 22:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA3D5F800F5
X-IronPort-AV: E=Sophos;i="6.02,217,1688396400";
   d="scan'208";a="174635229"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2023 05:47:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 474AB402951B;
	Fri,  1 Sep 2023 05:47:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/2] ASoC: ak4642: Minor cleanups in probe()
Date: Thu, 31 Aug 2023 21:47:33 +0100
Message-Id: <20230831204734.104954-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831204734.104954-1-biju.das.jz@bp.renesas.com>
References: <20230831204734.104954-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TJEAEMLJSJ2TKCDYNFQHXN6A6OJMXQIA
X-Message-ID-Hash: TJEAEMLJSJ2TKCDYNFQHXN6A6OJMXQIA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJEAEMLJSJ2TKCDYNFQHXN6A6OJMXQIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some minor cleanups:
 Replace local variable np with dev_fwnode()
 Replace dev_err()->dev_err_probe().
 Remove comma in the terminator entry for OF table.
 Drop a space in the terminator entry for ID table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 sound/soc/codecs/ak4642.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 2a8984c1fa9c..901014909c0f 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -633,13 +633,12 @@ static const struct i2c_device_id ak4642_i2c_id[];
 static int ak4642_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
-	struct device_node *np = dev->of_node;
 	const struct ak4642_drvdata *drvdata = NULL;
 	struct regmap *regmap;
 	struct ak4642_priv *priv;
 	struct clk *mcko = NULL;
 
-	if (np) {
+	if (dev_fwnode(dev)) {
 		const struct of_device_id *of_id;
 
 		mcko = ak4642_of_parse_mcko(dev);
@@ -655,10 +654,8 @@ static int ak4642_i2c_probe(struct i2c_client *i2c)
 		drvdata = (const struct ak4642_drvdata *)id->driver_data;
 	}
 
-	if (!drvdata) {
-		dev_err(dev, "Unknown device type\n");
-		return -EINVAL;
-	}
+	if (!drvdata)
+		return dev_err_probe(dev, -EINVAL, "Unknown device type\n");
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -681,7 +678,7 @@ static const struct of_device_id ak4642_of_match[] = {
 	{ .compatible = "asahi-kasei,ak4642",	.data = &ak4642_drvdata},
 	{ .compatible = "asahi-kasei,ak4643",	.data = &ak4643_drvdata},
 	{ .compatible = "asahi-kasei,ak4648",	.data = &ak4648_drvdata},
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, ak4642_of_match);
 
@@ -689,7 +686,7 @@ static const struct i2c_device_id ak4642_i2c_id[] = {
 	{ "ak4642", (kernel_ulong_t)&ak4642_drvdata },
 	{ "ak4643", (kernel_ulong_t)&ak4643_drvdata },
 	{ "ak4648", (kernel_ulong_t)&ak4648_drvdata },
-	{ }
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ak4642_i2c_id);
 
-- 
2.25.1

