Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E66BB778
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:20:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5206B12D8;
	Wed, 15 Mar 2023 16:19:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5206B12D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893648;
	bh=mKzyEEFucC/0pFzfqiyNksqXxTXd6g40Rmd9mtv2udw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mErFj5CzVF6xvNCxvud4MIUIhKKZB6EER9/KuZf+ngnmFe78o2woFzLA4Akh2Uid4
	 spwUkiVUs5tBCRAHPk2r+sD7ktrxDiVrcZVuW8U5xJq9uKFVjPaNkV8w5n0g3Z7oJz
	 f9n50pwiTIBtzokFnfQ+eYntGU2V241cTC36RMUE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A950AF805AB;
	Wed, 15 Mar 2023 16:11:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63449F8057E; Wed, 15 Mar 2023 16:08:59 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E6E9F80589
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E6E9F80589
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjV-0007Mb-Lc; Wed, 15 Mar 2023 16:08:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-004KWC-TB; Wed, 15 Mar 2023 16:08:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-0057dv-Jg; Wed, 15 Mar 2023 16:08:03 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Peter Rosin <peda@axentia.se>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 033/173] ASoC: atmel: tse850-pcm5142: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:25 +0100
Message-Id: <20230315150745.67084-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=mKzyEEFucC/0pFzfqiyNksqXxTXd6g40Rmd9mtv2udw=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2MwwhMR74VoaEJeDAsd0NdTXyU3Kf8y0FLR
 i6EV1E1pdqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdjAAKCRDB/BR4rcrs
 CbYEB/913uNz0078rK2/1XPUgqViAJXMxgf7+W4G6+WXkFaJ42TZDjZVT9Kgi4/S/x8zZI65f5P
 VpMmj7FRq/CX7WHz51NE2CCisGvk1EsjifPQjIS66epLq4kLz9Fuk2G8sSGEv0/iJLIrel8QNEf
 n06E39IFSl9jatbQySUwjWzafa1HoYvEW4G91PlyFBnuaVh/b9h4eQAWofAva/QkBLvVPg64mZK
 jYVbs1Nm8mURyvDG+jhV/HttFbJ2qzfJa7HoSVcniOjHCjdE1WEYHDKpsE1LIFKb4JQwbExRdZv
 wO2YkO9Ii1V1bKz7gKoWrhLnO8AiloT3SoYc2iYL39xN+5sk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: BPAAS7XMDWQPLV35EBFRSE7F4SEAYNMD
X-Message-ID-Hash: BPAAS7XMDWQPLV35EBFRSE7F4SEAYNMD
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPAAS7XMDWQPLV35EBFRSE7F4SEAYNMD/>
List-Archive: <>
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
 sound/soc/atmel/tse850-pcm5142.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index ef537de7719c..efead272d92b 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -412,15 +412,13 @@ static int tse850_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tse850_remove(struct platform_device *pdev)
+static void tse850_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
 	regulator_disable(tse850->ana);
-
-	return 0;
 }
 
 static const struct of_device_id tse850_dt_ids[] = {
@@ -435,7 +433,7 @@ static struct platform_driver tse850_driver = {
 		.of_match_table = of_match_ptr(tse850_dt_ids),
 	},
 	.probe = tse850_probe,
-	.remove = tse850_remove,
+	.remove_new = tse850_remove,
 };
 
 module_platform_driver(tse850_driver);
-- 
2.39.2

