Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694656BB812
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:38:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B77E01443;
	Wed, 15 Mar 2023 16:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B77E01443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894719;
	bh=3pXZEm4vbM3TzF+vbhXKPVBTOr6mlALGPy9M/ma52OE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=avDwUA1LyouY52mwDcb/C8yRE8T8sfduwXOkmqpwiI4z1NlPfEyFZ8zJUe7JhfTh6
	 PMpYR8Hg6w9PIafJklUkLY27bdg1XOIibaT5UrPLayxPFmuuHoSVt3AUcicSc0dT8u
	 a16AiCISoilZA2zQgHn5USP4pf5T0CYEcqd5NFlA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2C8DF8086C;
	Wed, 15 Mar 2023 16:14:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9109EF805F1; Wed, 15 Mar 2023 16:10:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6879F805FE
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6879F805FE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSju-0000BZ-1e; Wed, 15 Mar 2023 16:08:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjp-004KdM-G1; Wed, 15 Mar 2023 16:08:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-0057jx-LW; Wed, 15 Mar 2023 16:08:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 126/173] ASoC: samsung: odroid: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:58 +0100
Message-Id: <20230315150745.67084-127-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=3pXZEm4vbM3TzF+vbhXKPVBTOr6mlALGPy9M/ma52OE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6somnnWVBDgMFbDL5P6Ynm+1rc8oaB7Qlip
 IcMXgEiJ7KJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHerAAKCRDB/BR4rcrs
 CYjyCACVTLtBf+CB2WZ4lq1yy0aSRg6YzzOqVFdiIbAKSkX5Bz5OBdZLrIkH3oaJxdNxfcct6kk
 JHMxxZnpJK+98fsZdODfy6amSiwviFq38wm+zRnxweq4KSoSO4Q30voBGXppkOJ5cRvID/ukDgD
 2z77gtvLvxa6YTNzUBAfq/4nPtI87R3NGhTKvHCmYslldXyCM7L614IzmXQCUyM6IHzCy3qd46F
 lQZGwxlhLh1/rv1M0O1zwZs5q8yyZw8z1eUqcXHp55okCZPFx/31XJlXkZMGvSMY4KMTpkd2J5a
 CxJb0FR+wMObwTUuutbPVGnF/vanhwOo4gV3kFWGh1MVqj7P
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: SVMBIO4XV7QDAXDDFKASOGKMTZMH7TGM
X-Message-ID-Hash: SVMBIO4XV7QDAXDDFKASOGKMTZMH7TGM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVMBIO4XV7QDAXDDFKASOGKMTZMH7TGM/>
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
 sound/soc/samsung/odroid.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 1e0fefa89ad5..fd95a79cc9fa 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -331,15 +331,13 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int odroid_audio_remove(struct platform_device *pdev)
+static void odroid_audio_remove(struct platform_device *pdev)
 {
 	struct odroid_priv *priv = platform_get_drvdata(pdev);
 
 	snd_soc_of_put_dai_link_codecs(&priv->card.dai_link[1]);
 	clk_put(priv->sclk_i2s);
 	clk_put(priv->clk_i2s_bus);
-
-	return 0;
 }
 
 static const struct of_device_id odroid_audio_of_match[] = {
@@ -358,7 +356,7 @@ static struct platform_driver odroid_audio_driver = {
 		.pm		= &snd_soc_pm_ops,
 	},
 	.probe	= odroid_audio_probe,
-	.remove	= odroid_audio_remove,
+	.remove_new = odroid_audio_remove,
 };
 module_platform_driver(odroid_audio_driver);
 
-- 
2.39.2

