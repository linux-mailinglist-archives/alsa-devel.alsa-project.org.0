Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7306BB7A3
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:25:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D34B12FE;
	Wed, 15 Mar 2023 16:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D34B12FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893933;
	bh=5jL6O+ApFmtRfs3+b4ICx/fhDGO9uoeIVxFm54GS2pk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=erHyRFC77trLLGa90WYgFv2ROzsSgyT/qWJJ+qGmkXs+kspwJBccg4nIArOws+s3e
	 itS2YHK3Sa4LYeCaOjux6AoBJFrEPQwSzLFfIy+GMUgVhyuWGZsmUCJUJMvAfp9YS3
	 cvji14iIu1HLYQ+snr4/1/SYLOzKQ0WQYQqchSFo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F286EF806A4;
	Wed, 15 Mar 2023 16:12:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26213F805B5; Wed, 15 Mar 2023 16:09:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12957F805BA
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12957F805BA
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-0007ZR-H1; Wed, 15 Mar 2023 16:08:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSja-004KY8-Lc; Wed, 15 Mar 2023 16:08:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjZ-0057fY-9B; Wed, 15 Mar 2023 16:08:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Zhang Qilong <zhangqilong3@huawei.com>
Subject: [PATCH 058/173] ASoC: codecs: wm5110: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:50 +0100
Message-Id: <20230315150745.67084-59-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=5jL6O+ApFmtRfs3+b4ICx/fhDGO9uoeIVxFm54GS2pk=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3cPnhUnUJpUxH4UGvct4v9HhRCgnfitTkld
 bjDDpzfG0uJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd3AAKCRDB/BR4rcrs
 CSXeB/sG68qgPHhfbNB3IWguDNsi67tqpCURO+KcQiK8nphijcJBwY1xrdSMZ7QNH9xqrfK4fW1
 Er7FOnizw1/+2KzQyZDA/gWSbouIbii8O7OOa9rj0OVgvST9T6zMoaquE2OBzO9K9mbSUXJyARX
 QI7mx9n8jgDj10DBxvtLIvo0KEyKVWptcED7SXs3Y2acnBQBUVch5zjUvMRATJBtKQUkggAQsiF
 1TMW9LF2/tMIL/SrDzR2OQSjOe3k72pLD8asbJ2Bxn/gf5+QlieeQqdA/FtHKxxq2a4CnnLWTOO
 HS07H8O5CDT3pn6R1ENRopkqVnaPOXXqk+9CBilJYDonYINj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: FAHZ7BYSKHB6SABLD7ANLIAM4KZOMA3P
X-Message-ID-Hash: FAHZ7BYSKHB6SABLD7ANLIAM4KZOMA3P
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAHZ7BYSKHB6SABLD7ANLIAM4KZOMA3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/wm5110.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index e0b971620d0f..ad670300de8d 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2506,7 +2506,7 @@ static int wm5110_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wm5110_remove(struct platform_device *pdev)
+static void wm5110_remove(struct platform_device *pdev)
 {
 	struct wm5110_priv *wm5110 = platform_get_drvdata(pdev);
 	struct arizona *arizona = wm5110->core.arizona;
@@ -2523,8 +2523,6 @@ static int wm5110_remove(struct platform_device *pdev)
 	arizona_free_irq(arizona, ARIZONA_IRQ_DSP_IRQ1, wm5110);
 
 	arizona_jack_codec_dev_remove(&wm5110->core);
-
-	return 0;
 }
 
 static struct platform_driver wm5110_codec_driver = {
@@ -2532,7 +2530,7 @@ static struct platform_driver wm5110_codec_driver = {
 		.name = "wm5110-codec",
 	},
 	.probe = wm5110_probe,
-	.remove = wm5110_remove,
+	.remove_new = wm5110_remove,
 };
 
 module_platform_driver(wm5110_codec_driver);
-- 
2.39.2

