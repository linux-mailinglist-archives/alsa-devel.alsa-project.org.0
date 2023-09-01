Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 487A878F8E1
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 09:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BE1DDE5;
	Fri,  1 Sep 2023 09:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BE1DDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693551830;
	bh=aF/XXG0s6sA5xxzCPUnxbKnft9a3KHOxH2r2KHH5IsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M/F/gvnFNIrwtfMmVOyZROvqV4zGgKXvKb6Ja+Qxy0GIBmUSiiLE3HUpaSoptf9Hy
	 SgvZv3nXOPq4qO0ktMt1lg1EsdcWZLd6VUAU+aSc+OC0n+LMQCoct+Ux+nxMLe6+Wx
	 WXJo01+NGsJzoZmhSilOa8J73n6I4jGddik844TQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CEA3F80245; Fri,  1 Sep 2023 09:02:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95F13F8023B;
	Fri,  1 Sep 2023 09:02:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11C13F8023B; Fri,  1 Sep 2023 09:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CD97F800D1
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 09:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CD97F800D1
X-IronPort-AV: E=Sophos;i="6.02,218,1688396400";
   d="scan'208";a="178409324"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Sep 2023 16:00:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D1255400264E;
	Fri,  1 Sep 2023 15:59:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 1/3] ASoC: wm8580: Simplify probe()
Date: Fri,  1 Sep 2023 07:59:50 +0100
Message-Id: <20230901065952.18760-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
References: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JAPL3XXISMXL6O5HJZBCJDRC3XGQEHFK
X-Message-ID-Hash: JAPL3XXISMXL6O5HJZBCJDRC3XGQEHFK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAPL3XXISMXL6O5HJZBCJDRC3XGQEHFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify probe() by replacing of_match_device->i2c_get_match_data()
and extend matching support for ID table.

While at it, remove comma in the terminator entry and simplify probe()
by replacing dev_err()->dev_err_probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3->v4:
 * No change.
v2->v3:
 * Added Rb tag from Andy.
 * Restored OF table postion and moved in patch#2
v1->v2:
 * Added Ack from Charles Keepax.
 * Removed comma in the terminator entry.
 * Restored original error code -EINVAL
---
 sound/soc/codecs/wm8580.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 6d22f7d40ec2..826c39ec4a1e 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -997,7 +997,6 @@ MODULE_DEVICE_TABLE(of, wm8580_of_match);
 
 static int wm8580_i2c_probe(struct i2c_client *i2c)
 {
-	const struct of_device_id *of_id;
 	struct wm8580_priv *wm8580;
 	int ret, i;
 
@@ -1022,14 +1021,9 @@ static int wm8580_i2c_probe(struct i2c_client *i2c)
 
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
-- 
2.25.1

