Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B376BB756
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:16:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46987122B;
	Wed, 15 Mar 2023 16:15:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46987122B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893378;
	bh=G8+yKaSzuiespvqd5ebrIgBnnjP2K8CL3UaVJMKd6ic=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FtWeJEBpmBpl35oUuEoWimsRT/GC71HAx4KT+pL3oMUwUMdpZ1Qt4KmEdbNCt6fgQ
	 CmXB8/vsg7HRSbdbWeD50jrGcGFsJPKBcURgLRv9XAgH8UFdNVU6Kmi8sC0Z7Ept4i
	 boeHgJBZu4Kz5I8g/bz4BnJ6yX7LnnoOBYSU4mxA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECCF9F805D9;
	Wed, 15 Mar 2023 16:09:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6E32F8060C; Wed, 15 Mar 2023 16:08:43 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C471F8055C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C471F8055C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-00075W-QF; Wed, 15 Mar 2023 16:07:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-004KTl-L6; Wed, 15 Mar 2023 16:07:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjN-0057c4-Bk; Wed, 15 Mar 2023 16:07:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 004/173] ALSA: atmel: ac97: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:04:56 +0100
Message-Id: <20230315150745.67084-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=G8+yKaSzuiespvqd5ebrIgBnnjP2K8CL3UaVJMKd6ic=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd0zRBmY3rSLDDBNUogzxCTU0j81QYyMdwkv9
 ECyNCYJlcyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdMwAKCRDB/BR4rcrs
 CQODCACN7/vGkaS22Wu00DpozVOJ8A758O948C1CSVBUe+o9kJOq/FmHT//wvDJqlq/qPib7z13
 aYTlIRVFAHfBwVHFEC2IICVri0hKSNw+tBiPJMfXF3Z1E2DGg01VPXPVWIHCMTSAMlA3T8HOxl/
 Z0MQ++qE90AyPHZCEwj+54niF/hvx/m7XWfL4kDhTeqk89wZRg24B1//+m3q3Z2G0iWX/NiLC9l
 eozqjEFGw6055BALIY5XYXMszHBwh2yRjPkxk4wvLL5PjgQsnppc8h1kzBXlRYFnMQeVfSAe4NW
 KjqiNJRvGYdZEJgtPlm7HLrH+YXI7dAYcsttwc7dIGZduo25
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: KXWSCQBI7JA237MQABEKVRXUZL7YNKCO
X-Message-ID-Hash: KXWSCQBI7JA237MQABEKVRXUZL7YNKCO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXWSCQBI7JA237MQABEKVRXUZL7YNKCO/>
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
 sound/atmel/ac97c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 66ecbd4d034e..c8912b8a1dc5 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -843,7 +843,7 @@ static SIMPLE_DEV_PM_OPS(atmel_ac97c_pm, atmel_ac97c_suspend, atmel_ac97c_resume
 #define ATMEL_AC97C_PM_OPS	NULL
 #endif
 
-static int atmel_ac97c_remove(struct platform_device *pdev)
+static void atmel_ac97c_remove(struct platform_device *pdev)
 {
 	struct snd_card *card = platform_get_drvdata(pdev);
 	struct atmel_ac97c *chip = get_chip(card);
@@ -858,13 +858,11 @@ static int atmel_ac97c_remove(struct platform_device *pdev)
 	free_irq(chip->irq, chip);
 
 	snd_card_free(card);
-
-	return 0;
 }
 
 static struct platform_driver atmel_ac97c_driver = {
 	.probe		= atmel_ac97c_probe,
-	.remove		= atmel_ac97c_remove,
+	.remove_new	= atmel_ac97c_remove,
 	.driver		= {
 		.name	= "atmel_ac97c",
 		.pm	= ATMEL_AC97C_PM_OPS,
-- 
2.39.2

