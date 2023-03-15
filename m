Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FAD6BB820
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:40:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7017D1468;
	Wed, 15 Mar 2023 16:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7017D1468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894847;
	bh=0vDgBEnl/fL1JI9E+OZXFid/nh+gpJ39ysHsOc7Kqqo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q2YRe05A22Ll74ZiomOSbsIF5cXrN9P/JymUMCL+dF0YYIYYlt+XzpoNpdcrim7GN
	 GX969RApjdH+lIWKAZKlAEamvfSidlsxq01TNPswpzzSh/xcZyUNUOyA8YN4jlqpt7
	 C5g6sCZN280Qjcc72iOdP0Enaxz4G1QVHXWGY0vg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E25DFF80C06;
	Wed, 15 Mar 2023 16:14:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 113BCF805F7; Wed, 15 Mar 2023 16:10:14 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E0F3F80607
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E0F3F80607
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjw-0000J6-2q; Wed, 15 Mar 2023 16:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjr-004KeA-U7; Wed, 15 Mar 2023 16:08:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjp-0057k4-3l; Wed, 15 Mar 2023 16:08:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 128/173] ASoC: samsung: snow: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:00 +0100
Message-Id: <20230315150745.67084-129-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=0vDgBEnl/fL1JI9E+OZXFid/nh+gpJ39ysHsOc7Kqqo=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6zVtSBj7d9Bs+6goXKAitwe5fWAH/n0In8Z
 6Clfh8r8AGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeswAKCRDB/BR4rcrs
 CYcbB/45oBd1uuwspQHRGEONOhL38G4Xo0n8gLLNPMyYR7xIkp1zeb18+Lm8fzFXFfaZ4Mqic1o
 hwfu4wCL/wdguNtYJK+OTfoVFkyj8hNo4UjOzY1SENedtzl8XF77RXEfKjkYuavrYKkOZJvb7Qa
 OdyRi1/xBGNRfg21yr88BeBHhSDrc24FueQIRCywArwjG+2i5cI97e0XhSW3czePSk8iQQ64x4c
 805Aku0iS2ebIk++siujwoioHF12rGn1lQoPgBzsMradnh/13vG/RSL0JZ4uRPaL6neQPUKAsnh
 GwhoNp2BFDjI/ABAnlNLv6jDnReTsK77Gsmcs/lZ7YJ/X1iH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: K77RTWZL44QBEUVI4AQU2MR2OYS4AYVO
X-Message-ID-Hash: K77RTWZL44QBEUVI4AQU2MR2OYS4AYVO
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K77RTWZL44QBEUVI4AQU2MR2OYS4AYVO/>
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
 sound/soc/samsung/snow.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index da342da03880..334080e631af 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -219,7 +219,7 @@ static int snow_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int snow_remove(struct platform_device *pdev)
+static void snow_remove(struct platform_device *pdev)
 {
 	struct snow_priv *priv = platform_get_drvdata(pdev);
 	struct snd_soc_dai_link *link = &priv->dai_link;
@@ -229,8 +229,6 @@ static int snow_remove(struct platform_device *pdev)
 	snd_soc_of_put_dai_link_codecs(link);
 
 	clk_put(priv->clk_i2s_bus);
-
-	return 0;
 }
 
 static const struct of_device_id snow_of_match[] = {
@@ -248,7 +246,7 @@ static struct platform_driver snow_driver = {
 		.of_match_table = snow_of_match,
 	},
 	.probe = snow_probe,
-	.remove = snow_remove,
+	.remove_new = snow_remove,
 };
 
 module_platform_driver(snow_driver);
-- 
2.39.2

