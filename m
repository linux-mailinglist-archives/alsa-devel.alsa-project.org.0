Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C36BB7D8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:31:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D089113B1;
	Wed, 15 Mar 2023 16:30:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D089113B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894295;
	bh=Gvew36y30KZaSjscw1P3MRFZiS7QSiA3KSnhv+WKp4E=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K4Jhq5x20fpEUoZXb/E8BmaM+NUM27zwK8moyFOqUWSa7iz7nZ9sFHD5+3+MO+C37
	 xnWltk7936csqIVkK2jzZmDI3T3iQZs1jXUoRhIyj2tD/ifbjTBQAARtEtMaeopkvV
	 VE+pOHjfJjTmtuF9Bt9Nd61HFHBPFW0reOTEVMBw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17870F8058C;
	Wed, 15 Mar 2023 16:13:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C93AFF805C7; Wed, 15 Mar 2023 16:09:43 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 293B3F805E0
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 293B3F805E0
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSji-00083Z-V6; Wed, 15 Mar 2023 16:08:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjg-004KaD-C4; Wed, 15 Mar 2023 16:08:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-0057hJ-HH; Wed, 15 Mar 2023 16:08:15 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 085/173] ASoC: generic: test-component: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:17 +0100
Message-Id: <20230315150745.67084-86-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Gvew36y30KZaSjscw1P3MRFZiS7QSiA3KSnhv+WKp4E=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4sGmBH3qh+vMSv41z++ZXBISnzRrlnABd4A
 4dZoPNAo9WJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeLAAKCRDB/BR4rcrs
 CXcQCACfmQGQrBDyoI6FQAszjAiPcCoCiwolWAn76pwLoTr32dREAEiyD1bQU91M6ALad1pvJxz
 6D3aAFLZagbhaBnCnGVtmVjd+1WCWoVtuauAzmagQfRvU4GHMQPUQ//DSqRXtj8wJ6RFqBAuCP0
 o377LnxznWVIRbQg7gx7sI8gYLN9vxMhEcc7RIIE1HE6eLjXbilC2mVfiWRSF/VJUJqiQ2jmgNg
 e82WhF+T6fQih8Y68CeCwxosp3FLV1qCtTvUIYOctjrm5qTFKZ2fd3WFoKRVNlkG56fxKSSVn8J
 zPXO+UHIz4M+Q5CQOSZnkmSt1Yi2PDnEtAo6Y/fxy6f9c552
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: VVCYJCHQ5LLXTNMEEBIJRAC33DLONVVW
X-Message-ID-Hash: VVCYJCHQ5LLXTNMEEBIJRAC33DLONVVW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVCYJCHQ5LLXTNMEEBIJRAC33DLONVVW/>
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
 sound/soc/generic/test-component.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 98c8990596a8..e10e5bf28432 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -635,11 +635,9 @@ static int test_driver_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int test_driver_remove(struct platform_device *pdev)
+static void test_driver_remove(struct platform_device *pdev)
 {
 	mile_stone_x(&pdev->dev);
-
-	return 0;
 }
 
 static struct platform_driver test_driver = {
@@ -648,7 +646,7 @@ static struct platform_driver test_driver = {
 		.of_match_table = test_of_match,
 	},
 	.probe  = test_driver_probe,
-	.remove = test_driver_remove,
+	.remove_new = test_driver_remove,
 };
 module_platform_driver(test_driver);
 
-- 
2.39.2

