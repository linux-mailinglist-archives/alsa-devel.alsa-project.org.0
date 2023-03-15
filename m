Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3BF6BB763
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:17:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755E712C9;
	Wed, 15 Mar 2023 16:16:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755E712C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893456;
	bh=vwG6ePc7di/fwbT4udyqDvX3neh4bVz4dwZcwKy8w+0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DYeC7L9nGg9lCv87S+WsfPXkAQDatk7DYkU4piUjaUNfG8g71em7xennLW1U95kP1
	 6eb1DpWc1dYVJp9hZCCeN2ns2tJ7FZ+pAZJMldf55Fgof3voZOFHrUkrbOFttdbiLA
	 KdP1Gn57TnvxMs+ST25fgmOyKW5bO361FgYmR+xY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C1E8F805F8;
	Wed, 15 Mar 2023 16:10:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7809F8063B; Wed, 15 Mar 2023 16:08:49 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7712AF80567
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7712AF80567
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjW-0007Qa-AA; Wed, 15 Mar 2023 16:08:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjV-004KWR-Jv; Wed, 15 Mar 2023 16:08:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-0057eG-Np; Wed, 15 Mar 2023 16:08:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 038/173] ASoC: bcm: bcm63xx-i2s-whistler: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:30 +0100
Message-Id: <20230315150745.67084-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=vwG6ePc7di/fwbT4udyqDvX3neh4bVz4dwZcwKy8w+0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2bKd/7WtVspYZ+g+4IKKiva+zh0NnLJYDkO
 aqvz7u6U1WJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdmwAKCRDB/BR4rcrs
 CUHTB/43v92YHRzo7Vxzl9ArMK4Z6rhALbax83jcCQc1eIgTfa5xozW7+/KMDZ2OYBTibjA/PTv
 xpC+YCFfPL+1FtrHT+UGOF+OjnZ/DQ8FS+HgrZHz3VsgFFdVQ3j3ynm3WkF/LOBOAzStjZXpKOI
 TQgu01VLQlKs47XeYPzi93EKMscjjxjo2mR+/wx2blHolOB6qmda+kem/P7zwm9gT3M8P0ht4ez
 K1kKLLgFB2sDwpkD7Y1j/enL8JUB/KLz2L/iQ+m88kEQ4KdU5s8HUz6RyILiNG2QSmgLzIHRPgB
 F2+o56ZwrvugBwqW0/UGu0XiStwyTEZevYBx2aKdFXj9hhKt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: XIBWUSON5IKUC3ISCED6DS2DRQEPRRIM
X-Message-ID-Hash: XIBWUSON5IKUC3ISCED6DS2DRQEPRRIM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIBWUSON5IKUC3ISCED6DS2DRQEPRRIM/>
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
 sound/soc/bcm/bcm63xx-i2s-whistler.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/bcm/bcm63xx-i2s-whistler.c b/sound/soc/bcm/bcm63xx-i2s-whistler.c
index 2da1384ffe91..18c51dbbc8dc 100644
--- a/sound/soc/bcm/bcm63xx-i2s-whistler.c
+++ b/sound/soc/bcm/bcm63xx-i2s-whistler.c
@@ -289,10 +289,9 @@ static int bcm63xx_i2s_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int bcm63xx_i2s_dev_remove(struct platform_device *pdev)
+static void bcm63xx_i2s_dev_remove(struct platform_device *pdev)
 {
 	bcm63xx_soc_platform_remove(pdev);
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -308,7 +307,7 @@ static struct platform_driver bcm63xx_i2s_driver = {
 		.of_match_table = of_match_ptr(snd_soc_bcm_audio_match),
 	},
 	.probe = bcm63xx_i2s_dev_probe,
-	.remove = bcm63xx_i2s_dev_remove,
+	.remove_new = bcm63xx_i2s_dev_remove,
 };
 
 module_platform_driver(bcm63xx_i2s_driver);
-- 
2.39.2

