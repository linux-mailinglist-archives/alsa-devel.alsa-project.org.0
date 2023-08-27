Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DB3789C0F
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 10:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D12A5A4B;
	Sun, 27 Aug 2023 10:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D12A5A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693123872;
	bh=a79IGQNg8ZZYGq4XgfXAYG8kAPpcgW4hkZXZOG97X10=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A5rAROg2hFe6fmcYG7JHIY9osY+srytFjMwcf6XLZAGJW293JDlvWFubUEsvdAhth
	 a88MymQYZqT4C+hwb66FSyus0qn19ya4r//xujXHUni5Kd+2qR9Z9mW/GUchoCskzd
	 EUrq6yR58+YZlJq/NQtHLoYw2y/jrbkoQjkcS68U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7963AF80158; Sun, 27 Aug 2023 10:10:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12BB9F80074;
	Sun, 27 Aug 2023 10:10:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1A25F80158; Sun, 27 Aug 2023 10:09:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
	by alsa1.perex.cz (Postfix) with ESMTP id C0155F800D1
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 10:09:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0155F800D1
X-IronPort-AV: E=Sophos;i="6.02,204,1688396400";
   d="scan'208";a="177793568"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 17:09:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 78A3A4004474;
	Sun, 27 Aug 2023 17:09:34 +0900 (JST)
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: cs42xx8-i2c: Simplify probe()
Date: Sun, 27 Aug 2023 09:09:31 +0100
Message-Id: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U7VDOUACJUTQN5GJNYAU3KIYQFLCBB7U
X-Message-ID-Hash: U7VDOUACJUTQN5GJNYAU3KIYQFLCBB7U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7VDOUACJUTQN5GJNYAU3KIYQFLCBB7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify probe() by replacing of_match_device->i2c_get_match_data() and
extend matching support for ID table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 sound/soc/codecs/cs42xx8-i2c.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index a422472820fb..0f8e2d8cc876 100644
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
+		return dev_err_probe(&i2c->dev, -ENODEV,
+				     "failed to find driver data\n");
 
 	ret = cs42xx8_probe(&i2c->dev,
 		devm_regmap_init_i2c(i2c, &cs42xx8_regmap_config), drvdata);
-- 
2.25.1

