Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A64E978B7E6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 21:12:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E81084B;
	Mon, 28 Aug 2023 21:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E81084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693249949;
	bh=8vY8xeqtFdqiV87QJu2Ur/AgU568Mbrm4OmYBAJn16s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dTIuF4P2SIIXgSmH6omf86F20fAT9gv3GvpE9XJrRVF0myZvBeW3rxnqF3QTdTm6Z
	 TDi7Y4EnnDXU4UF9hhNf0ro71x6+zz7KmwjScTn2Hn8l0T1Ytn1myPRJNTG7aa1gbP
	 9SwuZ7E48Q6wpy8HFCYM/y8Q6jXlJe2YCiw1/8jo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 124B8F8055B; Mon, 28 Aug 2023 21:10:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A95DAF804F3;
	Mon, 28 Aug 2023 21:10:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BF48F800F5; Mon, 28 Aug 2023 21:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id AFF96F80158
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 21:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFF96F80158
X-IronPort-AV: E=Sophos;i="6.02,208,1688396400";
   d="scan'208";a="174239901"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2023 04:10:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 92B284055156;
	Tue, 29 Aug 2023 04:10:25 +0900 (JST)
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
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] ASoC: tlv320aic32x4-i2c: Simplify probe()
Date: Mon, 28 Aug 2023 20:10:14 +0100
Message-Id: <20230828191014.138310-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
References: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X7APVMCLVXTNNLR34EAWW3PDHJNZHAF3
X-Message-ID-Hash: X7APVMCLVXTNNLR34EAWW3PDHJNZHAF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7APVMCLVXTNNLR34EAWW3PDHJNZHAF3/>
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
v1->v2:
 * Return value of i2c_get_match_data() passed to type paramemter in
   aic32x4_probe().
---
 sound/soc/codecs/tlv320aic32x4-i2c.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index 713f3f63b5e3..b27b5ae1e4b2 100644
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
@@ -30,18 +27,7 @@ static int aic32x4_i2c_probe(struct i2c_client *i2c)
 	config.val_bits = 8;
 
 	regmap = devm_regmap_init_i2c(i2c, &config);
-
-	if (i2c->dev.of_node) {
-		const struct of_device_id *oid;
-
-		oid = of_match_node(aic32x4_of_id, i2c->dev.of_node);
-		type = (uintptr_t)oid->data;
-	} else {
-		const struct i2c_device_id *id;
-
-		id = i2c_match_id(aic32x4_i2c_id, i2c);
-		type = id->driver_data;
-	}
+	type = (uintptr_t)i2c_get_match_data(i2c);
 
 	return aic32x4_probe(&i2c->dev, regmap, type);
 }
-- 
2.25.1

