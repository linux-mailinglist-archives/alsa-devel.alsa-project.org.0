Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B20B76BB7DB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:32:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B96CD13D9;
	Wed, 15 Mar 2023 16:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B96CD13D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894325;
	bh=caJXpXbDDNsn9Xq29RP9miXgv1XnX3Zojhb2eBbQQak=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U7U5GnFGVr2LghJ6VLo3Kad8uXkJ2iMDp6oYJDA35ErSHpSQxLUOTbrcgTI1IWrmw
	 AlCPEsXzOQGIlKVAW6tg34GNLlyicaVJCDjZQpSfBvmuFLP/LeUprGHpgsKXGVAn/X
	 878BGlUUcEIDlZP6rzHEGSf0XmTsrY1Md28VJCtQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99559F80730;
	Wed, 15 Mar 2023 16:13:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 882EBF805D4; Wed, 15 Mar 2023 16:09:45 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 45B0CF8052D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B0CF8052D
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-00086s-VE; Wed, 15 Mar 2023 16:08:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-004KaR-4q; Wed, 15 Mar 2023 16:08:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjg-0057hY-Cu; Wed, 15 Mar 2023 16:08:16 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Minghao Chi <chi.minghao@zte.com.cn>
Subject: [PATCH 089/173] ASoC: img: img-spdif-in: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:21 +0100
Message-Id: <20230315150745.67084-90-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=caJXpXbDDNsn9Xq29RP9miXgv1XnX3Zojhb2eBbQQak=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd43wLBFADjTRQBBjlRR599tdH/NQgu8Q34iN
 Vn19E7Q/pyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeNwAKCRDB/BR4rcrs
 CfIECACbM8Og6xFPLVdWIrRwXuRVxZvAkzGhBft25AZAFOHf/+md28oYgfWvxCeh+nEK11w2NUa
 M2KaRRWOGb9H8lenlPnwqpPuj7AaJyQQH2TkR1lcx2wmGJoSvro7Mom7GSgczZmgXss+/APh7d0
 1xN8eufwyvyrGYoLGQAnnZomNVn9eJwkTsJfoFDGacA7cUI/BoXBu0UaxDnOQaVWXp6GYHT+UpV
 NSecZGtUv6rNCna8hIkLBX6DrHkEpcqLV7jd5cWpbUwIlyQx2vabe96UYzLa1LvzfhzmBpBcXI3
 xyj1itXUBwsvC16amLZ2M9D0X5j5HMOFN4l+7k7cXlezEZTd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: J66CDCEGHIIGPJF5I2NQYPE5OO5GFYUC
X-Message-ID-Hash: J66CDCEGHIIGPJF5I2NQYPE5OO5GFYUC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J66CDCEGHIIGPJF5I2NQYPE5OO5GFYUC/>
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
 sound/soc/img/img-spdif-in.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index 3f1d1a7e8735..558062a1804a 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -810,13 +810,11 @@ static int img_spdif_in_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int img_spdif_in_dev_remove(struct platform_device *pdev)
+static void img_spdif_in_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_spdif_in_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -880,7 +878,7 @@ static struct platform_driver img_spdif_in_driver = {
 		.pm = &img_spdif_in_pm_ops
 	},
 	.probe = img_spdif_in_probe,
-	.remove = img_spdif_in_dev_remove
+	.remove_new = img_spdif_in_dev_remove
 };
 module_platform_driver(img_spdif_in_driver);
 
-- 
2.39.2

