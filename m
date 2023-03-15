Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957996BB7C7
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:29:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 589621338;
	Wed, 15 Mar 2023 16:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 589621338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894166;
	bh=ygayRBhrJGWkRKJxPwr2o7DgtTmFVHTcMDhPGXeoQcc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zc0i93xTlSRAAzQH/GYQhQzDd0muRiVgIaRv0pG4JjhZDSCDx5MzZJJoXpUBk8NuV
	 xU4poe+t8AtY6SIllwTmJS9ET8b9x9ZeqaJPbzMBUv9j0+6mpVZ1++mNb3j18O0iKK
	 Os4h+P8DYdLWQLveMqA3nOxqvSw/UDDJmMIqw8e0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68E84F8057B;
	Wed, 15 Mar 2023 16:12:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EF0FF805C4; Wed, 15 Mar 2023 16:09:36 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 08561F805C7
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08561F805C7
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjg-0007qq-Ar; Wed, 15 Mar 2023 16:08:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-004KZP-Ux; Wed, 15 Mar 2023 16:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-0057gf-97; Wed, 15 Mar 2023 16:08:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 075/173] ASoC: fsl: fsl_xcvr: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:07 +0100
Message-Id: <20230315150745.67084-76-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ygayRBhrJGWkRKJxPwr2o7DgtTmFVHTcMDhPGXeoQcc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4QhTUgiNTMI8YTKdqGt6kA2Zu6czVsU9CxQ
 8mahDTff6iJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeEAAKCRDB/BR4rcrs
 CXOlB/9PO05PjCrzxTd3qMfWhJAJM9qx1+CaJxwTL8nhe7QRB10wWGi2hTvyxn5PV0UHXLrYDvn
 397K4J/VID/YlJa3D4HY720ArE1gBfGEXzTLf35PkQC8jj+Z3A0i3adoHl8e6ICy5uchryLb1g3
 o4h/IgWbpM5wjP5QwqYvoWkge6uXHlH27xBnqEjSx8QaObGhKLtnFWJid7Ls7BYKvrUqElId6QG
 CtONunjrpHqNEgK2+G11PS0/b1Cyj3ULiCZlKBeDfHXC4BBFR0EOQUQMndHVtQ5fC5fO2T62qzG
 GhKxHxwvehpm8qG76CXeFijhN77WOtLTvy53xJhnuQ1TKb50
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: DWU5IWHF37VCOHBWBWCU76U764MSEARQ
X-Message-ID-Hash: DWU5IWHF37VCOHBWBWCU76U764MSEARQ
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWU5IWHF37VCOHBWBWCU76U764MSEARQ/>
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
 sound/soc/fsl/fsl_xcvr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 2a78243df752..318fe77683f5 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1339,10 +1339,9 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_xcvr_remove(struct platform_device *pdev)
+static void fsl_xcvr_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
@@ -1478,7 +1477,7 @@ static struct platform_driver fsl_xcvr_driver = {
 		.pm = &fsl_xcvr_pm_ops,
 		.of_match_table = fsl_xcvr_dt_ids,
 	},
-	.remove = fsl_xcvr_remove,
+	.remove_new = fsl_xcvr_remove,
 };
 module_platform_driver(fsl_xcvr_driver);
 
-- 
2.39.2

