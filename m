Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 261D074AC4C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 09:52:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6BC1DC;
	Fri,  7 Jul 2023 09:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6BC1DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688716333;
	bh=3WtipWPEPFR3HskxETHMU7xVbu5+R8gJsyiHacVuBYs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nZpCfmGdXDsqtkn/HVyk1DuRUjEvpn5pLUQI4F+SOmKUd9mpsSdEXtdq9nZJNS+GJ
	 6OOJCTbpKIh47AMKA5XMjn6Dn8aKe+TmCxEVPNHopUgBN5mBWep+w4AmPsrDM249Nm
	 Uq3DMXee+b5Q6Btymj9iZ+yMLpNAiW23Cs415hVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 530B2F80093; Fri,  7 Jul 2023 09:51:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75753F80100;
	Fri,  7 Jul 2023 09:51:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDB1FF80125; Fri,  7 Jul 2023 09:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3DFDF80100
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 09:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3DFDF80100
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHgF7-0005T1-8f; Fri, 07 Jul 2023 09:51:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHgF6-00CgJr-EF; Fri, 07 Jul 2023 09:51:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHgF5-002wtp-LH; Fri, 07 Jul 2023 09:51:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH 1/2] ALSA: pcmtest: Convert to platform remove callback
 returning void
Date: Fri,  7 Jul 2023 09:50:57 +0200
Message-Id: <20230707075058.3402832-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=3WtipWPEPFR3HskxETHMU7xVbu5+R8gJsyiHacVuBYs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkp8Pgk9jNOr9j82G2ygT8dYHnckt2Li5RlhGss
 dRLaH8bDHmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKfD4AAKCRCPgPtYfRL+
 Tn4qB/99gB6P9GzB4TFvvSeaU00RM5XZZTVVAc00qQjBS59TqUFoWULywbvVvP4161Nf0++HpTJ
 cCDg16Xqa35OzabvEeQ04xWjPYp+j21jmz8Gc8U58TOyCxzNDYqmSegGBdKTOgYTYAJ//NGkQy7
 xOzsCNq/TzR/ii/rNTBhT4r0j6XUZ769JX1k/Y0tJSLbG+zz/E0j9ohJau30leSOOqi+PTi2/0z
 NiCeS+hsjvGc9tMTT2ELwG6ywm8jBmbooDwWPXCW8uFVaB9tt1h1MQvRyYS6AeG+DOkY5q5BZeH
 6S23HNJIvCfL0uLI6ggIkkbkIYWo+lIq2qGA6ODKZ8r66606
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: D4KPZRPRB3WVEI26AR4GQWHDQ3WGPT3R
X-Message-ID-Hash: D4KPZRPRB3WVEI26AR4GQWHDQ3WGPT3R
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4KPZRPRB3WVEI26AR4GQWHDQ3WGPT3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/drivers/pcmtest.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 2ae912a64d16..1fff85feaf82 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -576,10 +576,9 @@ static int pcmtst_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pdev_remove(struct platform_device *dev)
+static void pdev_remove(struct platform_device *dev)
 {
 	snd_pcmtst_free(pcmtst);
-	return 0;
 }
 
 static struct platform_device pcmtst_pdev = {
@@ -589,7 +588,7 @@ static struct platform_device pcmtst_pdev = {
 
 static struct platform_driver pcmtst_pdrv = {
 	.probe =	pcmtst_probe,
-	.remove =	pdev_remove,
+	.remove_new =	pdev_remove,
 	.driver =	{
 		.name = "pcmtest",
 	},

base-commit: 5133c9e51de41bfa902153888e11add3342ede18
-- 
2.39.2

