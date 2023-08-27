Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB218789C8C
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 11:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3054793A;
	Sun, 27 Aug 2023 11:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3054793A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693127861;
	bh=OtHByik3G6qnXcXGFERBplwh5xo2Ok4HwC462V02hno=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EW1bqxqYqRRgq5dPAlz9g8U/OFqMe/+8wiGBWso0eixQEAbLgv0g5mWqYIhw+lRU9
	 tkuWS8CqOiP4UqVSz7DuXJ6Gm2Wp6zkocBcKMBmb3Sjjs9ryJ4jcGpa63UjgsFO9vT
	 IT+CVncc1IuRYYb/NAbq51VYjhdm5lqJLjIpyaaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E8CDF8023B; Sun, 27 Aug 2023 11:16:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27FF5F80155;
	Sun, 27 Aug 2023 11:16:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5F6DF80158; Sun, 27 Aug 2023 11:15:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFB4F800D1
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 11:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEFB4F800D1
X-IronPort-AV: E=Sophos;i="6.02,204,1688396400";
   d="scan'208";a="177795749"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 18:15:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B68AB41A6E4A;
	Sun, 27 Aug 2023 18:15:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	alsa-devel@alsa-project.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: tas571x: Simplify probe()
Date: Sun, 27 Aug 2023 10:15:25 +0100
Message-Id: <20230827091525.39263-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UHHGOSKUEEYEIMEMY26CHOGX4CW2NIYQ
X-Message-ID-Hash: UHHGOSKUEEYEIMEMY26CHOGX4CW2NIYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHHGOSKUEEYEIMEMY26CHOGX4CW2NIYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify probe() by replacing of_match_device->i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 sound/soc/codecs/tas571x.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 1756edb35961..a220342c3d77 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -829,14 +829,10 @@ static struct snd_soc_dai_driver tas571x_dai = {
 	.ops = &tas571x_dai_ops,
 };
 
-static const struct of_device_id tas571x_of_match[] __maybe_unused;
-static const struct i2c_device_id tas571x_i2c_id[];
-
 static int tas571x_i2c_probe(struct i2c_client *client)
 {
 	struct tas571x_private *priv;
 	struct device *dev = &client->dev;
-	const struct of_device_id *of_id;
 	int i, ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -844,14 +840,7 @@ static int tas571x_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 	i2c_set_clientdata(client, priv);
 
-	of_id = of_match_device(tas571x_of_match, dev);
-	if (of_id)
-		priv->chip = of_id->data;
-	else {
-		const struct i2c_device_id *id =
-			i2c_match_id(tas571x_i2c_id, client);
-		priv->chip = (void *) id->driver_data;
-	}
+	priv->chip = i2c_get_match_data(client);
 
 	priv->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(priv->mclk) && PTR_ERR(priv->mclk) != -ENOENT) {
-- 
2.25.1

