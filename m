Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3776BB76D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:18:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721671232;
	Wed, 15 Mar 2023 16:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721671232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893536;
	bh=mFvkIcFN4FuZoyt7/T0UfkiuDrS1wyOZqQq1Iq+y7J8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mwv4RCSs+LcllyE8nwNvpSf9z3YdwwhlBinaVKleGsgBx6K0d7o0Up21ikzNEW29I
	 5cvo9Nf/zmMF9jc9Wmkh2e5HlYgVp+wbUDpsJy11LCMuJns6M9CPXfAbiwKyy5ewkR
	 7La6STHfxTDyAoUT5L5p6+kIFdZk31k4Bn0juO/8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FA74F805D6;
	Wed, 15 Mar 2023 16:10:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2598F80652; Wed, 15 Mar 2023 16:08:53 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 68770F804FE
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68770F804FE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjY-0007Vc-SN; Wed, 15 Mar 2023 16:08:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjY-004KXV-7N; Wed, 15 Mar 2023 16:08:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-0057f3-FD; Wed, 15 Mar 2023 16:08:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 050/173] ASoC: codecs: lpass-tx-macro: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:42 +0100
Message-Id: <20230315150745.67084-51-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=mFvkIcFN4FuZoyt7/T0UfkiuDrS1wyOZqQq1Iq+y7J8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd292QriMI/8GNGHyDzetxPiSptb6GKhIV7h2
 VeXj06BG92JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdvQAKCRDB/BR4rcrs
 CU7LB/9kA8x+elzgwnSgCH8w3XCV6VKpLqMooJMWr15cTmiA3RgFKB8YPKjIdi4JloDI94qgwY2
 /edAUic8ABTDauGLvX5RxNL3ou+r1k27zV21oJkEa3brvjnGpE3QA5CZy1GJ7JZD9naPPsUa3gf
 ALYRrnM9LP7HAKwMqzzL2ihEpdcKE0Z/aFdpQj0wimmCYtlwaurUQnAbFqsVDqgUpKE6ASAP71c
 vPP1YOjRlVF4A1xlttHl4H9MoqcC3pL110x4XQlfZHoI+H+bV064F8m/FDAKvSHFo7mxgXCd4j2
 XNoWoNgneFOwep4adwfbhJ7c8MSNc06U14+VO4AF6nkZHwuW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: OKULGIT7EX5BXDRCA43FTWVCMQD44DRV
X-Message-ID-Hash: OKULGIT7EX5BXDRCA43FTWVCMQD44DRV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKULGIT7EX5BXDRCA43FTWVCMQD44DRV/>
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
 sound/soc/codecs/lpass-tx-macro.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index bf27bdd5be20..60c207a4f9ee 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2075,7 +2075,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tx_macro_remove(struct platform_device *pdev)
+static void tx_macro_remove(struct platform_device *pdev)
 {
 	struct tx_macro *tx = dev_get_drvdata(&pdev->dev);
 
@@ -2086,8 +2086,6 @@ static int tx_macro_remove(struct platform_device *pdev)
 	clk_disable_unprepare(tx->fsgen);
 
 	lpass_macro_pds_exit(tx->pds);
-
-	return 0;
 }
 
 static int __maybe_unused tx_macro_runtime_suspend(struct device *dev)
@@ -2159,7 +2157,7 @@ static struct platform_driver tx_macro_driver = {
 		.pm = &tx_macro_pm_ops,
 	},
 	.probe = tx_macro_probe,
-	.remove = tx_macro_remove,
+	.remove_new = tx_macro_remove,
 };
 
 module_platform_driver(tx_macro_driver);
-- 
2.39.2

