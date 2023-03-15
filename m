Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA57A6BB80A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:37:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C9F113A9;
	Wed, 15 Mar 2023 16:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C9F113A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894671;
	bh=JoZBkZsaiKa+CxmsPZr1F3gcsY0YIJeDYYrO6zREfOw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lxh3zbfK05pv0UqBaxrwbcKRVV1QHZAKvMegzLp1sBpj/jTlCLjji5WI1RLiRhMZa
	 jE4yNIhu7gmiTa4PMudfgxW/WyeaUbJvM1ePlcfs638mCVdkq+Wg7U6kinVW1cVaQd
	 FDrtx4e+BRucdGgy58H5pdvS/Bbvg/Gwi6QUHAT4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4ADCF80853;
	Wed, 15 Mar 2023 16:14:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C64A5F805E2; Wed, 15 Mar 2023 16:10:03 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AD6D4F805FC
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD6D4F805FC
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSju-0000Bb-1i; Wed, 15 Mar 2023 16:08:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjp-004KdN-Gd; Wed, 15 Mar 2023 16:08:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-0057jt-ES; Wed, 15 Mar 2023 16:08:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 125/173] ASoC: samsung: i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:57 +0100
Message-Id: <20230315150745.67084-126-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=JoZBkZsaiKa+CxmsPZr1F3gcsY0YIJeDYYrO6zREfOw=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6p5vGhEZz9mIMtTPI6lh2Mf2w2Rg4uK2WAa
 5H2GWQMoBeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeqQAKCRDB/BR4rcrs
 CT9uB/4/jUBgAYEYbAzVnGSBbIlzTqehym2Kl0IBlCexreeriemel9przG8IwEO3DQUBGJbh9y2
 SZOnNlxSp6uSyUlwy673QVwMJO4YI8j5PvAEGW4YzCe/urbU+ukoXmz4vK1LwnJXl9K5qt3/MMN
 LIsY5GN/xkE/IVV+8BUctLMokvgswKp0vBnmYoUozW+kM9LpwSJ2ddHKTg+D8S482QbcsgIVBZ2
 DVKZRDEchlnis/sXm//NUtFZfEt+rYabXH3/OctR9xwnME+2298XW3S7s8sxsRqciZjP9JY4ACF
 TcldmceR9YwORckRZmf+aAaVGSmkjnKdzUABSk3vTs/KikGt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: KPHEZILCKAAPVG6BZJNSBSIFGVPZQ3EO
X-Message-ID-Hash: KPHEZILCKAAPVG6BZJNSBSIFGVPZQ3EO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPHEZILCKAAPVG6BZJNSBSIFGVPZQ3EO/>
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
 sound/soc/samsung/i2s.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 6f96032090de..ca995db406b0 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1560,13 +1560,13 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int samsung_i2s_remove(struct platform_device *pdev)
+static void samsung_i2s_remove(struct platform_device *pdev)
 {
 	struct samsung_i2s_priv *priv = dev_get_drvdata(&pdev->dev);
 
 	/* The secondary device has no driver data assigned */
 	if (!priv)
-		return 0;
+		return;
 
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -1576,8 +1576,6 @@ static int samsung_i2s_remove(struct platform_device *pdev)
 	clk_disable_unprepare(priv->clk);
 
 	pm_runtime_put_noidle(&pdev->dev);
-
-	return 0;
 }
 
 static void fsd_i2s_fixup_early(struct snd_pcm_substream *substream,
@@ -1746,7 +1744,7 @@ static const struct dev_pm_ops samsung_i2s_pm = {
 
 static struct platform_driver samsung_i2s_driver = {
 	.probe  = samsung_i2s_probe,
-	.remove = samsung_i2s_remove,
+	.remove_new = samsung_i2s_remove,
 	.id_table = samsung_i2s_driver_ids,
 	.driver = {
 		.name = "samsung-i2s",
-- 
2.39.2

