Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF36F78B6BC
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 19:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8D67F1;
	Mon, 28 Aug 2023 19:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8D67F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693245008;
	bh=ZB9r55bc66lcpToCQZAAkbfn4jJDROA1+rW3n39cKUE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JL6EjsRuvi2xQYzAbm3iBCvcUSZ+m4UZMyCIIgfY+g0yGzH3aD4ftwt491mrTZJ9w
	 GYCNvHoKpxTayP1vqQrHIcpUHcmfLxPZbWz5nbWmd5QJCvqD6nlj+Bc+ipWZ+PqQs0
	 XWJlFWOlY5MiuLIX3MY/4brCm+6dVvnvSWKY3zsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 158BBF80155; Mon, 28 Aug 2023 19:49:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C599FF80155;
	Mon, 28 Aug 2023 19:49:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3301EF80158; Mon, 28 Aug 2023 19:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id E54F6F800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 19:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E54F6F800F5
X-IronPort-AV: E=Sophos;i="6.02,208,1688396400";
   d="scan'208";a="174236471"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2023 02:49:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D72F34048F0A;
	Tue, 29 Aug 2023 02:48:58 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: cs42xx8-i2c: Simplify probe()
Date: Mon, 28 Aug 2023 18:48:56 +0100
Message-Id: <20230828174856.122559-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2CW5WEXKHQP3ANBZARB5274HBGLCOXTY
X-Message-ID-Hash: 2CW5WEXKHQP3ANBZARB5274HBGLCOXTY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CW5WEXKHQP3ANBZARB5274HBGLCOXTY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify probe() by replacing of_match_device->i2c_get_match_data() and
extend matching support for ID table. Also replace
dev_err()->dev_err_probe() to simplify the code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
Note:
 This patch is only compile tested.

v1->v2:
 * Added Ack from Charles Keepax.
 * Restored the error EINVAL.
---
 sound/soc/codecs/cs42xx8-i2c.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index a422472820fb..9028c0f0fe77 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -18,21 +18,15 @@
 
 #include "cs42xx8.h"
 
-static const struct of_device_id cs42xx8_of_match[];
-
 static int cs42xx8_i2c_probe(struct i2c_client *i2c)
 {
 	int ret;
 	struct cs42xx8_driver_data *drvdata;
-	const struct of_device_id *of_id;
-
-	of_id = of_match_device(cs42xx8_of_match, &i2c->dev);
-	if (!of_id) {
-		dev_err(&i2c->dev, "failed to find driver data\n");
-		return -EINVAL;
-	}
 
-	drvdata = (struct cs42xx8_driver_data *)of_id->data;
+	drvdata = (struct cs42xx8_driver_data *)i2c_get_match_data(i2c);
+	if (!drvdata)
+		return dev_err_probe(&i2c->dev, -EINVAL,
+				     "failed to find driver data\n");
 
 	ret = cs42xx8_probe(&i2c->dev,
 		devm_regmap_init_i2c(i2c, &cs42xx8_regmap_config), drvdata);
-- 
2.25.1

