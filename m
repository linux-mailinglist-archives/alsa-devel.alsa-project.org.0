Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D10C6BB788
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:22:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7684312ED;
	Wed, 15 Mar 2023 16:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7684312ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893757;
	bh=YTRyBE6/DXYQhd9fyvBICqCmhcKbm9DGsMWL3121F+U=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b87HShTr3HMEj3IM93MLDJeg58y74yTilma9JP8ctGFz0je4KyOU7Ic5kcLRcj3zb
	 TitesOMlbEYUcg+YA/TJ9eq+vqIBkMV4/Yr+A8xbt9bdy9CcG7qGVnTeOdtOFZH1eC
	 sKCmcgwc0PFoI7EVhe/Z7XAdqS5NnpOrl22C63IA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 355BBF805FA;
	Wed, 15 Mar 2023 16:11:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01917F80655; Wed, 15 Mar 2023 16:09:06 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A57F4F805A9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A57F4F805A9
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-0007Gu-PC; Wed, 15 Mar 2023 16:08:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-004KVP-Nn; Wed, 15 Mar 2023 16:08:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-0057dQ-To; Wed, 15 Mar 2023 16:08:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 025/173] ASoC: atmel: atmel_wm8904: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:17 +0100
Message-Id: <20230315150745.67084-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=YTRyBE6/DXYQhd9fyvBICqCmhcKbm9DGsMWL3121F+U=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd10Z8XSNnZWQH18pRX98Kd13x77JICiRh0Gw
 JFYaDd5ep2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHddAAKCRDB/BR4rcrs
 CelCB/9FZqALVCiUWxpxbaA3wmoP33Gs8rktzng/subhW4OplR9D+6NvvXbsO/uVoF0dIOtvXyx
 e+DOrFflFE3cK1Xth0wjeAFZAlFfuU7htgXgWa452j+SgSqBbD9rqZHWWSh6jJNSnVC7fxWimC4
 7gbqk4OPYyc8omINsM3oFMtNCZiLihGTLQ5CISExeEYG03NHpoRPRCxe/dWS9XruFkINb7/pdpH
 uoI8YXQqV5Fo9sNm1kgFOUIRVe6w6ZzwNRaApVq+Yrs4az/pKhX09FPAt99KMMBnld2BGRP/M9V
 QzCzm6dUU+spxd98q/cRVmg+YXTcSTQT4+KESlbyWJEUSfg9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: GKCFGZCT7KLMIYJGTMIWGRV2FB46VI3B
X-Message-ID-Hash: GKCFGZCT7KLMIYJGTMIWGRV2FB46VI3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKCFGZCT7KLMIYJGTMIWGRV2FB46VI3B/>
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
 sound/soc/atmel/atmel_wm8904.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index 9c974c4e187d..00e98136bec2 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -161,7 +161,7 @@ static int atmel_asoc_wm8904_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int atmel_asoc_wm8904_remove(struct platform_device *pdev)
+static void atmel_asoc_wm8904_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct snd_soc_dai_link *dailink = &atmel_asoc_wm8904_dailink;
@@ -171,8 +171,6 @@ static int atmel_asoc_wm8904_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_card(card);
 	atmel_ssc_put_audio(id);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -190,7 +188,7 @@ static struct platform_driver atmel_asoc_wm8904_driver = {
 		.pm		= &snd_soc_pm_ops,
 	},
 	.probe = atmel_asoc_wm8904_probe,
-	.remove = atmel_asoc_wm8904_remove,
+	.remove_new = atmel_asoc_wm8904_remove,
 };
 
 module_platform_driver(atmel_asoc_wm8904_driver);
-- 
2.39.2

