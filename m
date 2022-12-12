Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3106C64A904
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:59:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C53602A42;
	Mon, 12 Dec 2022 21:58:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C53602A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878751;
	bh=FQwHTF3hYRhq5XmNiFdDqGE836fxN7GA4Erq1Ivhv3E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EoYx30ZkJv4WHtk26lYXLMLTKA9NddikJ+4dsW9dISks8sxvwrGMrGvVaKDDvDIBd
	 1lgeOoIyQZUo3/GPddAJlq7jj4My2uy/lJf0mxQ3Nj5pGcelnkvBhR1DPgynhl8UXd
	 1Kq7LERMOSTD1Qdv56dQenHp6TjhPnugSjkrUsqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF9C9F805B4;
	Mon, 12 Dec 2022 21:54:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79492F805B1; Mon, 12 Dec 2022 21:54:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0365AF805AC
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0365AF805AC
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poT-00015u-CT; Mon, 12 Dec 2022 21:54:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poQ-00463z-Py; Mon, 12 Dec 2022 21:54:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poQ-004aha-Ph; Mon, 12 Dec 2022 21:54:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 03/15] ASoC: atmel-classd: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:53:54 +0100
Message-Id: <20221212205406.3771071-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=FQwHTF3hYRhq5XmNiFdDqGE836fxN7GA4Erq1Ivhv3E=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5TBSiNsSSYIVTDUnwRJn1pXEj4x2GNOw6P69Y3d
 L3Dt6DWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eUwQAKCRDB/BR4rcrsCSySB/
 9Egie4JJjgCG4ULHFjiQxT8lKQ54g/RMSK2bH/DSjxUNEHi5IrF+h2g5ihnvHVK731ePBCkjo/eNCg
 bSCrvevD7EI5pXwaL81MUzX1Sh/ZltxNjUFEPuMdYLeGwBsFl0WDdYLUzfhRRmhY1CDFN4H+rM8570
 rpSH1nRql3El3sTsS7faeson2RFMln02f3uBb4Qvxajph9zuQysfPD/s1GVrv/J2OZYz4VuEgP4yew
 DOH/6CyuAxoNNNNkGxfMPkFiCruHryEqjq7uC1POI+HGjLBuXdSdBObsgvER1MujlzS9g976QBJoQz
 z1039xv9gIs6TZlnC0qDk0vhqkma31
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/atmel/atmel-classd.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 87d6d6ed026b..9883e6867fd1 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -616,11 +616,6 @@ static int atmel_classd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int atmel_classd_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver atmel_classd_driver = {
 	.driver	= {
 		.name		= "atmel-classd",
@@ -628,7 +623,6 @@ static struct platform_driver atmel_classd_driver = {
 		.pm		= &snd_soc_pm_ops,
 	},
 	.probe	= atmel_classd_probe,
-	.remove	= atmel_classd_remove,
 };
 module_platform_driver(atmel_classd_driver);
 
-- 
2.38.1

