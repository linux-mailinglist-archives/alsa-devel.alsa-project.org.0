Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589881CFEE
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 23:52:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8CD3DF9;
	Fri, 22 Dec 2023 23:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8CD3DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703285521;
	bh=oNyOtJmRK/PlWo4BKGbaCJgMzouADPvq3uSryPTzQhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IuKLYtMS4xirijslTrtv64B0wYutd5JkUz4FLU28gQT6R9vw2L084lo8hdNfxOYqM
	 LA8tFRu5HE9Z17e2t4hleP68JalW3Em+a7QyDCekjqJlkDx3NLrrHeN/AawFNP8Gbo
	 9ny8030olqMrG7ylpT5ejSpYuBfeAU2/2HWp+7Pw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15ECFF80425; Fri, 22 Dec 2023 23:51:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55BEAF80578;
	Fri, 22 Dec 2023 23:51:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FFDFF8016E; Fri, 22 Dec 2023 23:51:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85198F80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 23:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85198F80124
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGoML-0005bm-T8; Fri, 22 Dec 2023 23:51:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGoMK-000qvD-D7; Fri, 22 Dec 2023 23:51:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGoML-000FfO-1L;
	Fri, 22 Dec 2023 23:51:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 06/13] irqchip/madera: Convert to platform remove callback
 returning void
Date: Fri, 22 Dec 2023 23:50:37 +0100
Message-ID: 
 <64c2f79760c53f29651e7126418c407ff699317d.1703284359.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
References: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=oNyOtJmRK/PlWo4BKGbaCJgMzouADPvq3uSryPTzQhI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlhhK9Y8lRVhNFkK9eJWWYKEZRt6Vy9FJ7h2sj6
 VryWfbz2laJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZYYSvQAKCRCPgPtYfRL+
 TngFCACHKhMzBPTBKVocA6VfvDGmuukvynuqR9RfEljwyjneu/L12qaidTDwjPFQtNSEm6HZUBa
 K7ywfUFIwGDqS1YVFVeBCOV8jGXoZQ1+LY1U/MmzIzFuLOaUIu8bU2Rtqzq4dKUaXpuQFQ4XgN/
 zHN+B6RKZtpT46Rivq79vpIoz+ujbj3zvTwiti73wKa72M9tvxC8H0l0UV1oqbQtq8wqtMMTNru
 aZL67AYTcfqSmIXXkOi0XtADOuwcMMChC1mY4F/J7L2+ro3Wf8NrGMpdohxtssProziTgnyhXrJ
 LUKLwQ6vOC4EWnqbFzHzpsKePslWuOr8y1HurRhaWAvl7i9V
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 2XTNERJJ6RVNCKKWKEVHZQZYNPAIDI3M
X-Message-ID-Hash: 2XTNERJJ6RVNCKKWKEVHZQZYNPAIDI3M
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XTNERJJ6RVNCKKWKEVHZQZYNPAIDI3M/>
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
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/irqchip/irq-madera.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-madera.c b/drivers/irqchip/irq-madera.c
index 3eb1f8cdf674..b424c0a327f7 100644
--- a/drivers/irqchip/irq-madera.c
+++ b/drivers/irqchip/irq-madera.c
@@ -222,7 +222,7 @@ static int madera_irq_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int madera_irq_remove(struct platform_device *pdev)
+static void madera_irq_remove(struct platform_device *pdev)
 {
 	struct madera *madera = dev_get_drvdata(pdev->dev.parent);
 
@@ -232,13 +232,11 @@ static int madera_irq_remove(struct platform_device *pdev)
 	 */
 	madera->irq_dev = NULL;
 	regmap_del_irq_chip(madera->irq, madera->irq_data);
-
-	return 0;
 }
 
 static struct platform_driver madera_irq_driver = {
 	.probe	= &madera_irq_probe,
-	.remove = &madera_irq_remove,
+	.remove_new = madera_irq_remove,
 	.driver = {
 		.name	= "madera-irq",
 		.pm	= &madera_irq_pm_ops,
-- 
2.42.0

