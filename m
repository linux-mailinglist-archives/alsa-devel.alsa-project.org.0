Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662EA6BB79A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:25:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A70B12D2;
	Wed, 15 Mar 2023 16:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A70B12D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893901;
	bh=OJN6ocPIfdwkw9ZG2j8EszGX5IAYtHE4EOfTG8VOv+A=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WwOEzE4StEMehcgVagOv+uPrc7SfjdbZrT3c08HOtkpwNquSPZgqb7k9qAWVMIvT0
	 /Zk1eX6JhSlP1yhrOHQdlg5d3I4y+A1B8T4fnZ9h3VTcNby4t0DMg/JhzsSoIHn/I3
	 fT7ao8pJvFU3xpp4/H4+hkLGkx270xViMYY7G1ig=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B04F8069E;
	Wed, 15 Mar 2023 16:11:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC312F8065C; Wed, 15 Mar 2023 16:09:18 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C67B2F805B4
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C67B2F805B4
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-0007cL-LC; Wed, 15 Mar 2023 16:08:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-004KYL-CR; Wed, 15 Mar 2023 16:08:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSja-0057fh-4w; Wed, 15 Mar 2023 16:08:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 061/173] ASoC: codecs: wm8998: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:53 +0100
Message-Id: <20230315150745.67084-62-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OJN6ocPIfdwkw9ZG2j8EszGX5IAYtHE4EOfTG8VOv+A=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3lRIGnpTKW9XICzHUOJGISVHk7zXhREoyj/
 eib3bkk0+CJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd5QAKCRDB/BR4rcrs
 CeMGCACTqNRjllUB07rWCsojwr2ZsSXQzm3GvuL2vwNV/jX1DzbFSKpk4pG9KlhXD/ic8ATs7+u
 XxdU/Ms7ckXLlL3gRhE18x5VPDhvjsme9UW2iGro3Jjp7XVQmEAm6rAem2jMJjxZrLuj69/wVwh
 PcdKhhEBpV7b1+d6gtiN3Pfpn3oUEw6qdsRjMIO/96U6zZCP0hVdgUIdLvH8o7tGHT7SOXO9TwL
 hWx4PL9pkIxr7exlV0tkmO0Vm+5C9xLbo2dFLI4DRlrLwDYs56heVWCKLVuxnLAEAXOEcCkzLqm
 wSuw3+rq7iemImo36GBnKxe4IFmN/ZzFOaM+sDAbGQ/ymtHQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: H4MFIT5NGG5SAHHM4DF3774OOZLR3BVT
X-Message-ID-Hash: H4MFIT5NGG5SAHHM4DF3774OOZLR3BVT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4MFIT5NGG5SAHHM4DF3774OOZLR3BVT/>
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
 sound/soc/codecs/wm8998.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 79fc6bbaa3aa..3c2c4d12c08e 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1409,7 +1409,7 @@ static int wm8998_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wm8998_remove(struct platform_device *pdev)
+static void wm8998_remove(struct platform_device *pdev)
 {
 	struct wm8998_priv *wm8998 = platform_get_drvdata(pdev);
 	struct arizona *arizona = wm8998->core.arizona;
@@ -1419,8 +1419,6 @@ static int wm8998_remove(struct platform_device *pdev)
 	arizona_free_spk_irqs(arizona);
 
 	arizona_jack_codec_dev_remove(&wm8998->core);
-
-	return 0;
 }
 
 static struct platform_driver wm8998_codec_driver = {
@@ -1428,7 +1426,7 @@ static struct platform_driver wm8998_codec_driver = {
 		.name = "wm8998-codec",
 	},
 	.probe = wm8998_probe,
-	.remove = wm8998_remove,
+	.remove_new = wm8998_remove,
 };
 
 module_platform_driver(wm8998_codec_driver);
-- 
2.39.2

