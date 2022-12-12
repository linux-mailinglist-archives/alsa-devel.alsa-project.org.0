Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F42D64A8EF
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:56:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AEA7188F;
	Mon, 12 Dec 2022 21:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AEA7188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878613;
	bh=Y0kjMd8NuteJJ3+VzZHpJcRWhbk4mCFMu+bNANGeCsM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S5tF3tYo/k380z6UWGMNgmyBpAhIlQgCCQrDmL0yVNqE3EB1WQ9JDQVUgIGxX4409
	 ZF839iCS8UUMDxjq/9ZNTCjqTZLT3Uk+xX8LklTkGfehYT56XmfhuHgJ/ggkhQZIVx
	 j08TIBkZXCSeobd6B1oZ3gdqTQ5EbQUwNg9uoBWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 619DCF80544;
	Mon, 12 Dec 2022 21:54:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0815DF80518; Mon, 12 Dec 2022 21:54:24 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DEDCF804B4
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DEDCF804B4
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poW-00019X-2U; Mon, 12 Dec 2022 21:54:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poU-00464h-Hy; Mon, 12 Dec 2022 21:54:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poU-004aiA-HC; Mon, 12 Dec 2022 21:54:14 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 12/15] ASoC: pxa: e740_wm9705: Drop empty platform remove
 function
Date: Mon, 12 Dec 2022 21:54:03 +0100
Message-Id: <20221212205406.3771071-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Y0kjMd8NuteJJ3+VzZHpJcRWhbk4mCFMu+bNANGeCsM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5Te1L1m6LwWzc+byfnA4/UOV8ATd2uewDXCXfoT
 b77XSemJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eU3gAKCRDB/BR4rcrsCUCqB/
 9klyaqlMYzfDk3Q4+4yhM5Dj1RmsaFSOXwGpDeIGM78ObNtdxWFheVjfwwBRLTju7pqpAMcgYnFo16
 8afkQKT7yAv+mh+x2F1t4vb2IZ+55oeiGgGF2jF5BK/GN0KDwc6Tub5nDjJZL6nEFUvcS224r2xWfY
 rK6p11W6TIpkt1Mpj57XKOnbOo8OITbWL7yBvGeR/jF5W7O/1W3gbE64Yov4lacP2MfWC4sO3bTTWe
 eBKZ//duSZAe9uEM0dIYXQmEH3I4NZ9JXxQ7yUQlDRz4t3DdumU8iqWWZGmqZXweaHkLiPY9vaWCjO
 nacnI94S1mRRR9GQthlEcBo+yq6qLx
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
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>,
 kernel@pengutronix.de, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/pxa/e740_wm9705.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/pxa/e740_wm9705.c b/sound/soc/pxa/e740_wm9705.c
index 4e0e9b778d4c..ec37da331a91 100644
--- a/sound/soc/pxa/e740_wm9705.c
+++ b/sound/soc/pxa/e740_wm9705.c
@@ -145,18 +145,12 @@ static int e740_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int e740_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver e740_driver = {
 	.driver		= {
 		.name	= "e740-audio",
 		.pm     = &snd_soc_pm_ops,
 	},
 	.probe		= e740_probe,
-	.remove		= e740_remove,
 };
 
 module_platform_driver(e740_driver);
-- 
2.38.1

