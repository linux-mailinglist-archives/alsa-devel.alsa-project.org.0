Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2995778B6A6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 19:41:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9F8B7F1;
	Mon, 28 Aug 2023 19:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9F8B7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693244499;
	bh=hULBkFMaAlOe1KDtrTulqoXs02sRJhosLLO8RUHDjMA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GJJDdtszXRkXDiPDn65EVMKXXrTe7jwlKlniTS1VBmx5JMzQ4P5O42sJuTUamxYdT
	 3urvKB2Y9pEiWyhEl7rC0twCqrfTD2lGm6p8c+MVn2Wp/Fh+MZrMxCR68bMDc9QsJ8
	 YmW5O2KGd0YO9JqmCcpb98WcgLpHkdKOaL20lzKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A69FF80236; Mon, 28 Aug 2023 19:40:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD4FF80155;
	Mon, 28 Aug 2023 19:40:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60F64F80158; Mon, 28 Aug 2023 19:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E484F800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 19:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E484F800F5
X-IronPort-AV: E=Sophos;i="6.02,208,1688396400";
   d="scan'208";a="177944208"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Aug 2023 02:40:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 39ED54009BED;
	Tue, 29 Aug 2023 02:40:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] ASoC: wm8580: Simplify probe()
Date: Mon, 28 Aug 2023 18:40:19 +0100
Message-Id: <20230828174019.119250-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5VUBUJ35IKODJHB5UQYT53UB6KGYHPDX
X-Message-ID-Hash: 5VUBUJ35IKODJHB5UQYT53UB6KGYHPDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5VUBUJ35IKODJHB5UQYT53UB6KGYHPDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify probe() by replacing of_match_device->i2c_get_match_data() and
extend matching support for ID table.

While at it, remove comma in the terminator entry and simplify probe()
by replacing dev_err->dev_err_probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
Note:
 This patch is only compile tested.

v1->v2:
 * Added Ack from Charles Keepax.
 * Removed comma in the terminator entry.
 * Restored original error code -EINVAL
---
 sound/soc/codecs/wm8580.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 6d22f7d40ec2..28c0ba348634 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -988,16 +988,8 @@ static const struct wm8580_driver_data wm8581_data = {
 	.num_dacs = 4,
 };
 
-static const struct of_device_id wm8580_of_match[] = {
-	{ .compatible = "wlf,wm8580", .data = &wm8580_data },
-	{ .compatible = "wlf,wm8581", .data = &wm8581_data },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, wm8580_of_match);
-
 static int wm8580_i2c_probe(struct i2c_client *i2c)
 {
-	const struct of_device_id *of_id;
 	struct wm8580_priv *wm8580;
 	int ret, i;
 
@@ -1022,14 +1014,9 @@ static int wm8580_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, wm8580);
 
-	of_id = of_match_device(wm8580_of_match, &i2c->dev);
-	if (of_id)
-		wm8580->drvdata = of_id->data;
-
-	if (!wm8580->drvdata) {
-		dev_err(&i2c->dev, "failed to find driver data\n");
-		return -EINVAL;
-	}
+	wm8580->drvdata = i2c_get_match_data(i2c);
+	if (!wm8580->drvdata)
+		return dev_err_probe(&i2c->dev, -EINVAL, "failed to find driver data\n");
 
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_wm8580, wm8580_dai, ARRAY_SIZE(wm8580_dai));
@@ -1037,6 +1024,13 @@ static int wm8580_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
+static const struct of_device_id wm8580_of_match[] = {
+	{ .compatible = "wlf,wm8580", .data = &wm8580_data },
+	{ .compatible = "wlf,wm8581", .data = &wm8581_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wm8580_of_match);
+
 static const struct i2c_device_id wm8580_i2c_id[] = {
 	{ "wm8580", (kernel_ulong_t)&wm8580_data },
 	{ "wm8581", (kernel_ulong_t)&wm8581_data },
-- 
2.25.1

