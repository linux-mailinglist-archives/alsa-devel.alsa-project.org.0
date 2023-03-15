Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7896A6BB76E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:19:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1317A12E4;
	Wed, 15 Mar 2023 16:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1317A12E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893552;
	bh=gVmQ2LG4FEG5o+QO3u7Ff0dmh2zPnPIqpyigSB2evR0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j4CIuyvK6HzwtEMwP3UcCLQCJd5qZMZnI2V+9RXxJCIM5QKZRHrQsWGQ1hLtbZe1D
	 Hm/WoHSTVyzK3/2t/eLD+yLyZwV1OviR1lLIEonHaP3ckKvOEYdAaGkaCWykSBP46L
	 7in6zaJI6hPtW2VawvGztMGcaPJh32L+/z1cbqU4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE5BF8053B;
	Wed, 15 Mar 2023 16:10:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77513F80652; Wed, 15 Mar 2023 16:08:54 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ECC09F8057E
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECC09F8057E
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjV-0007Ku-83; Wed, 15 Mar 2023 16:08:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-004KVy-Bi; Wed, 15 Mar 2023 16:08:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-0057do-5P; Wed, 15 Mar 2023 16:08:03 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 031/173] ASoC: atmel: sam9g20_wm8731: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:23 +0100
Message-Id: <20230315150745.67084-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=gVmQ2LG4FEG5o+QO3u7Ff0dmh2zPnPIqpyigSB2evR0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2Gqm/5mmz/SaGW/HcgXBKDsS35JLeW2hQRB
 nYmuy46x/2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdhgAKCRDB/BR4rcrs
 CW7dB/9DNjfTVXBbG+A1NYJw7mX1Ujb39pvaDmbqyau7SGwdoI7iqgjGIU/5fxUG0L+K00A41Wu
 djWn8/ahvS+r3ipOXw46KVqglflx1iMCPyGeJidqdrOGpdeIaqD+rlC8Qk1wW9Tw6nye09niJYY
 vPV9A8gjceideas2qEbU0DHoyiqEYHYFlguZBIiCIDtUnfZCgva0/rkdB01NuFgaONTLNyk+eA7
 w9yDgDQRhjp7YXgGc6aULElH/o97ziu1qIlV1oyFzqCIMiJxhiHuQH+HbwKXnTFACTD1SmQ36ZS
 /2ERxsUkuQJK9s65veaHhlR4RbdE8Yc0Qb9Egpm5WIekFDtK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: EW5ICIBZ5NHDP5RTWSXZGK6DYD2JVJAF
X-Message-ID-Hash: EW5ICIBZ5NHDP5RTWSXZGK6DYD2JVJAF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EW5ICIBZ5NHDP5RTWSXZGK6DYD2JVJAF/>
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
 sound/soc/atmel/sam9g20_wm8731.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index 785b9d01d8af..baf38964b491 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -186,14 +186,12 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int at91sam9g20ek_audio_remove(struct platform_device *pdev)
+static void at91sam9g20ek_audio_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
 	snd_soc_unregister_card(card);
 	atmel_ssc_put_audio(0);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -210,7 +208,7 @@ static struct platform_driver at91sam9g20ek_audio_driver = {
 		.of_match_table = of_match_ptr(at91sam9g20ek_wm8731_dt_ids),
 	},
 	.probe	= at91sam9g20ek_audio_probe,
-	.remove	= at91sam9g20ek_audio_remove,
+	.remove_new = at91sam9g20ek_audio_remove,
 };
 
 module_platform_driver(at91sam9g20ek_audio_driver);
-- 
2.39.2

