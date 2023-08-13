Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B2D77A56F
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 09:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB272828;
	Sun, 13 Aug 2023 09:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB272828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691912234;
	bh=d2NkZyO/REAjlLuk7qTnJ57oj5m44xN4O2EwW5rISpw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kZNfSAXpc8Cil7U6kb7D+o8mV63zx2yonV2fzM+D0nBBSGx65lIUiK5BM5VoXBA+r
	 8EYmSsqbLWWeal5RILfOlRNlHA6WauLJRs+28l3ArqXWoiGv4IH1gt4dXQhz4k4kWI
	 9AUmk5jkFdZ3XRtmyqz1egaYk+KkLs0LMUnNkzEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAB42F80552; Sun, 13 Aug 2023 09:36:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A04F80254;
	Sun, 13 Aug 2023 09:36:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CBD9F8025F; Sun, 13 Aug 2023 09:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id 21A2BF801EB
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 09:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21A2BF801EB
X-IronPort-AV: E=Sophos;i="6.01,169,1684767600";
   d="scan'208";a="172812623"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Aug 2023 16:35:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id ADED94197BE3;
	Sun, 13 Aug 2023 16:35:00 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	alsa-devel@alsa-project.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: ak4613: Simplify probe()
Date: Sun, 13 Aug 2023 08:34:58 +0100
Message-Id: <20230813073458.59606-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FHPRCXEXLUZZBXPNFSTERCO2JCY4GCSW
X-Message-ID-Hash: FHPRCXEXLUZZBXPNFSTERCO2JCY4GCSW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHPRCXEXLUZZBXPNFSTERCO2JCY4GCSW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
retrieving match data by i2c_get_match_data().

While at it, drop unused local variable np from probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/codecs/ak4613.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index ad56caec9dac..619a817ee91c 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -880,20 +880,11 @@ static void ak4613_parse_of(struct ak4613_priv *priv,
 static int ak4613_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
-	struct device_node *np = dev->of_node;
 	const struct regmap_config *regmap_cfg;
 	struct regmap *regmap;
 	struct ak4613_priv *priv;
 
-	regmap_cfg = NULL;
-	if (np)
-		regmap_cfg = of_device_get_match_data(dev);
-	else {
-		const struct i2c_device_id *id =
-			i2c_match_id(ak4613_i2c_id, i2c);
-		regmap_cfg = (const struct regmap_config *)id->driver_data;
-	}
-
+	regmap_cfg = i2c_get_match_data(i2c);
 	if (!regmap_cfg)
 		return -EINVAL;
 
-- 
2.25.1

