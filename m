Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F13789CCE
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 11:46:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A58CEA4D;
	Sun, 27 Aug 2023 11:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A58CEA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693129613;
	bh=RPdJpzQFzxTByvZFMN4O1z+CFu3Vg6Ca/qJOqzlO58g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kRl3jNHxUeuf7AuxWpcLcUQ0pBhJAgl+ZP5jmGfOoLGJNEszJp0VOg/R4nBVF8KqX
	 ia6pGjNDAJber6DZuPXF/+XMb1SjStZRUzrVjWNZdoq4bvPtiXjAaTaRsNhOJ1jMKm
	 6/jy5pE3nC7Oaa8XMmtFNj7e7/OKIyJChomsTBew=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F441F800D1; Sun, 27 Aug 2023 11:46:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDE53F80155;
	Sun, 27 Aug 2023 11:46:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6447F80158; Sun, 27 Aug 2023 11:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 78559F800D1
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 11:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78559F800D1
X-IronPort-AV: E=Sophos;i="6.02,204,1688396400";
   d="scan'208";a="177796622"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2023 18:45:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8836E41AE7AD;
	Sun, 27 Aug 2023 18:45:38 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <x1077012@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: tlv320aic32x4-i2c: Simplify probe()
Date: Sun, 27 Aug 2023 10:45:36 +0100
Message-Id: <20230827094536.49511-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DJ3YWT3TVXSAINC54Z7JFCNZ3ZTWOLG5
X-Message-ID-Hash: DJ3YWT3TVXSAINC54Z7JFCNZ3ZTWOLG5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJ3YWT3TVXSAINC54Z7JFCNZ3ZTWOLG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify probe() by replacing of_match_node() and i2c_match_id() with
i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 sound/soc/codecs/tlv320aic32x4-i2c.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index 49b33a256cd7..513f257818ca 100644
--- a/sound/soc/codecs/tlv320aic32x4-i2c.c
+++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
@@ -16,9 +16,6 @@
 
 #include "tlv320aic32x4.h"
 
-static const struct of_device_id aic32x4_of_id[];
-static const struct i2c_device_id aic32x4_i2c_id[];
-
 static int aic32x4_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap *regmap;
@@ -30,17 +27,7 @@ static int aic32x4_i2c_probe(struct i2c_client *i2c)
 
 	regmap = devm_regmap_init_i2c(i2c, &config);
 
-	if (i2c->dev.of_node) {
-		const struct of_device_id *oid;
-
-		oid = of_match_node(aic32x4_of_id, i2c->dev.of_node);
-		dev_set_drvdata(&i2c->dev, (void *)oid->data);
-	} else {
-		const struct i2c_device_id *id;
-
-		id = i2c_match_id(aic32x4_i2c_id, i2c);
-		dev_set_drvdata(&i2c->dev, (void *)id->driver_data);
-	}
+	dev_set_drvdata(&i2c->dev, (void *)i2c_get_match_data(i2c));
 
 	return aic32x4_probe(&i2c->dev, regmap);
 }
-- 
2.25.1

