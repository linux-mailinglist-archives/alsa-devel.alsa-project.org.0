Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE036BB825
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:42:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF4D1483;
	Wed, 15 Mar 2023 16:41:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF4D1483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894926;
	bh=jvU7ygEInOmx/cF0f3yVtLZnqi+/vqLXkGO3jVzqefI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JTP0L7KQ/uxSiqciLqzsZw2PbsoeLEsffL/Pxl0YOUy55WaVh2NRw6KX/X+o98KTr
	 URdKGU9S6ipnoyjtpIuatVIIMaNkNm7k3VcrhI22lXG2EFfgGaLNqmLNbWD8I2cPmz
	 rAh3TFTWVbZr5aQmUtwUzArRJlSvRmaSQrerBy+0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC33BF80C43;
	Wed, 15 Mar 2023 16:15:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1338FF805F8; Wed, 15 Mar 2023 16:10:19 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B83C7F8060E
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B83C7F8060E
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjx-0000Nl-M1; Wed, 15 Mar 2023 16:08:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-004Keb-6k; Wed, 15 Mar 2023 16:08:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjr-0057kk-Hb; Wed, 15 Mar 2023 16:08:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 139/173] ASoC: stm: stm32_spdifrx: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:11 +0100
Message-Id: <20230315150745.67084-140-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=jvU7ygEInOmx/cF0f3yVtLZnqi+/vqLXkGO3jVzqefI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7UNtXy7hf+SoCky6y/BdsqAnVT3qt0hrnt+
 q769hD4HRWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe1AAKCRDB/BR4rcrs
 CdBIB/9wNtNYu6Z9CDMtcblJUy8Ow3xZop7E/DXPoOFZTpA/dP7f4Ys5RAS5wIa+tE8T33DJfTp
 m8DbJ/Hb33d3JuC+g0i+npWqa8bXsAx1CBGieRffBZ2xveBOSNHO9FmSXOdSG/PSF3nyopsGCXw
 tW254RS67iTOpFBxy75ixIfbZB74rIfXYyxXPc9D/EUaUSNdx226Z/mBOpyd1SMrdGyP0/zSi52
 QWnCQjAR9W1pib1i7Tqcppi+YNR1G5ougCqWdQwoHG89aElsDzFtkBCY6IQY8qA4yVxav7B+1zY
 Rs7A7TLGfk1RFvXYNsjI99ffdc5E3qhLPYgcRPb7aaWXVTCQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: D7HK6EI6CCTN77BVN755F23EDANP7M2N
X-Message-ID-Hash: D7HK6EI6CCTN77BVN755F23EDANP7M2N
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7HK6EI6CCTN77BVN755F23EDANP7M2N/>
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
 sound/soc/stm/stm32_spdifrx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index d399c906bb92..a4066f271f2d 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -939,7 +939,7 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 	return 0;
 }
 
-static int stm32_spdifrx_remove(struct platform_device *pdev)
+static void stm32_spdifrx_remove(struct platform_device *pdev)
 {
 	struct stm32_spdifrx_data *spdifrx = platform_get_drvdata(pdev);
 
@@ -952,8 +952,6 @@ static int stm32_spdifrx_remove(struct platform_device *pdev)
 	snd_dmaengine_pcm_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int stm32_spdifrx_probe(struct platform_device *pdev)
@@ -1078,7 +1076,7 @@ static struct platform_driver stm32_spdifrx_driver = {
 		.pm = &stm32_spdifrx_pm_ops,
 	},
 	.probe = stm32_spdifrx_probe,
-	.remove = stm32_spdifrx_remove,
+	.remove_new = stm32_spdifrx_remove,
 };
 
 module_platform_driver(stm32_spdifrx_driver);
-- 
2.39.2

