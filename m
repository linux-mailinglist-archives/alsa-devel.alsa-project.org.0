Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711178F449
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 22:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFFFB208;
	Thu, 31 Aug 2023 22:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFFFB208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693514982;
	bh=sX71RSsD6GGnd8TVgxMaT8eJGTV+LXkr5kNVRCTvNaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vohsg7/ti/uINt8CtZ27i6Sd0EEV9r10aP6uJ5ofS1fGZOfR5Aqcfwot1N80D581a
	 7+65lpfqtPJhjXeWKFRvxzF33aISGFLxm5tf6/p/vkp/doKOU3dQOS0LZrrkBPxSj7
	 T8HBwZqompgK8fUJ+uesIiaZFyZ/54zRXFCpdHPg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2BF7F80567; Thu, 31 Aug 2023 22:48:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F7CF8055C;
	Thu, 31 Aug 2023 22:48:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF93FF80094; Thu, 31 Aug 2023 22:47:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BBF5F80094
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 22:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BBF5F80094
X-IronPort-AV: E=Sophos;i="6.02,217,1688396400";
   d="scan'208";a="178342519"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Sep 2023 05:47:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A0C594029216;
	Fri,  1 Sep 2023 05:47:43 +0900 (JST)
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
Subject: [PATCH v3 2/2] ASoC: ak4642: Simplify probe()
Date: Thu, 31 Aug 2023 21:47:34 +0100
Message-Id: <20230831204734.104954-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831204734.104954-1-biju.das.jz@bp.renesas.com>
References: <20230831204734.104954-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TFHWMNXNDIYZCMP2JSWWGVUQ2Q5ENGGQ
X-Message-ID-Hash: TFHWMNXNDIYZCMP2JSWWGVUQ2Q5ENGGQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFHWMNXNDIYZCMP2JSWWGVUQ2Q5ENGGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
retrieving match data by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Removing local variable np is handled in patch#1.
v1->v2:
 * Removed forward declaration ak4642_of_match and ak4642_i2c_id.
 * Restored error EINVAL.
 * Used dev_fwnode() and replaced dev->of_node.
 * Removed comma in the terminator entry.
---
 sound/soc/codecs/ak4642.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 901014909c0f..8a40c6b3f4d8 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -628,32 +628,21 @@ static struct clk *ak4642_of_parse_mcko(struct device *dev)
 #define ak4642_of_parse_mcko(d) 0
 #endif
 
-static const struct of_device_id ak4642_of_match[];
-static const struct i2c_device_id ak4642_i2c_id[];
 static int ak4642_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
-	const struct ak4642_drvdata *drvdata = NULL;
+	const struct ak4642_drvdata *drvdata;
 	struct regmap *regmap;
 	struct ak4642_priv *priv;
 	struct clk *mcko = NULL;
 
 	if (dev_fwnode(dev)) {
-		const struct of_device_id *of_id;
-
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
 
+	drvdata = i2c_get_match_data(i2c);
 	if (!drvdata)
 		return dev_err_probe(dev, -EINVAL, "Unknown device type\n");
 
-- 
2.25.1

