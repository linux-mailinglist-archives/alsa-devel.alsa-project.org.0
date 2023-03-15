Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 256536BB743
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:13:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720BF127D;
	Wed, 15 Mar 2023 16:13:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720BF127D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893237;
	bh=w05buJVZkeC26R2yYlPyIK8jM9jm4BwZXV8XPr0nM7U=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jietCQaNpHTEp8A7xajeAGxsb4oTWL2RikjmItED+qlHofrrMl5p4ENi/bB4AdGJX
	 0QxS2/O3b4IJPVrB0nC6Z5uOBLI9j59OAXXupt6nO25YxPKrMOLH1oj92SHXAWVSXD
	 GnEfh3Fj0etvDJxMNbSOhmvPjFQsOeaz9zaqFpew=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEFFEF80529;
	Wed, 15 Mar 2023 16:09:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 914F0F805E8; Wed, 15 Mar 2023 16:08:32 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CE974F80542
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE974F80542
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjW-0007SZ-Sn; Wed, 15 Mar 2023 16:08:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjW-004KWh-7n; Wed, 15 Mar 2023 16:08:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjV-0057eN-8f; Wed, 15 Mar 2023 16:08:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 040/173] ASoC: cirrus: edb93xx: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:32 +0100
Message-Id: <20230315150745.67084-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=w05buJVZkeC26R2yYlPyIK8jM9jm4BwZXV8XPr0nM7U=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2gcrUeOnSJsfSwFJvGz21Bx74Ma9icmB2g9
 bFgZ+Ja+c6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdoAAKCRDB/BR4rcrs
 CWhXB/0ehYx6pdq1fDM5hB4PmiO5nOa99C1MyM93yeBoiy7nlWNV0iYLtJqrD7XGuIpLaTJ4tTG
 KqpdUAqR9D/saHdUYBDNNn7NpCHa4urDsG9HX1CFDKfZlfQlttKocKxjRdU2+BzENXS+S7eVeLA
 ow8aknRu/eTtrT/LL4uQW8MBohrvrMHYJAjjq9XXLbEu0EfVrNgG6kw3RYqBZmswDc53kTIXkv/
 +vcFRGrmPiPuIiyh/6GwtERdChRgCHbPFLVDRU+LXl/0DXL6HNbs/fHPrwdDPHHZlNIf+hgO3uN
 aYj/qhHqHH7qmtOzGkKo/MUmnhyxda0pH121RwU3D7+29rcb
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: ZQMQSU6EKE74KESC47ZSYU4NIW6CW5QX
X-Message-ID-Hash: ZQMQSU6EKE74KESC47ZSYU4NIW6CW5QX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQMQSU6EKE74KESC47ZSYU4NIW6CW5QX/>
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
 sound/soc/cirrus/edb93xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index 385290202912..f49caab21a25 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -93,14 +93,12 @@ static int edb93xx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int edb93xx_remove(struct platform_device *pdev)
+static void edb93xx_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
 	snd_soc_unregister_card(card);
 	ep93xx_i2s_release();
-
-	return 0;
 }
 
 static struct platform_driver edb93xx_driver = {
@@ -108,7 +106,7 @@ static struct platform_driver edb93xx_driver = {
 		.name	= "edb93xx-audio",
 	},
 	.probe		= edb93xx_probe,
-	.remove		= edb93xx_remove,
+	.remove_new	= edb93xx_remove,
 };
 
 module_platform_driver(edb93xx_driver);
-- 
2.39.2

