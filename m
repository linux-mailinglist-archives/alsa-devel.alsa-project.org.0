Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FB86BB868
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:49:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A1EB14D7;
	Wed, 15 Mar 2023 16:48:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A1EB14D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895352;
	bh=IwlsE4Vc9Qt7mC6XrfSGUhCWfafElqIfLGaSkpDgDog=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p0zdqymxNzGH1CKZpbWy+KoHrLb8xyxfael7dq9gLHqsbkt/vIrC62fTv9UpT3tYJ
	 Rl1Pr+2Q70AShl/vwz/wIGfAl1WQEXKpxE0vzYFJXGwfKDbt5PUt8UpnVCWN6OxP6X
	 IMst9ir349y4jroryGBtMwUiSLjnG1mFXGT37hBQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB7A3F896CB;
	Wed, 15 Mar 2023 16:16:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83C97F805E4; Wed, 15 Mar 2023 16:10:44 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BDC70F80632
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC70F80632
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0000PV-1X; Wed, 15 Mar 2023 16:08:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-004Kem-MO; Wed, 15 Mar 2023 16:08:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-0057l1-GI; Wed, 15 Mar 2023 16:08:28 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ban Tao <fengzheng923@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 143/173] ASoC: sunxi: sun50i-dmic: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:15 +0100
Message-Id: <20230315150745.67084-144-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=IwlsE4Vc9Qt7mC6XrfSGUhCWfafElqIfLGaSkpDgDog=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7hk/lU18iuI7quSK7gC681Bl2helTb8zSFn
 GRRHJfnZXaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe4QAKCRDB/BR4rcrs
 CfstB/9Pg8kpWZGCGXRT82VSg0XoKrXcmlBDwbQ8GeocE33K92rsyE0l89zSRODY7l/tycU+RKB
 wQCEa0VM3uOnOHqvx1Eyy9NIrdwSa3zsn9KPoz7RUKmi7IZWQjkdIOw1Bmr1aEHNR0UcSKsyK4v
 cWZ9xkGEf7MmX5+IeCpK2U/07zj62M5yn17GT5q/PXjqvihffYLozvRZp+dSrJaTu/zdNNJFapp
 yAuzw1eYtOqZjkGpNMCUSJXE+agujbsxwA0FE2KtMh6G3FMpjjx8thNqJOLv8oVkJvFm6LEmXxb
 4bySqddGQB2HR1b3y4hbv/YC9uaLIx0bMSORFiIk2TfDqIM+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: HDZIB23QC3ONSZL3C54V3P4FRY66Z3LN
X-Message-ID-Hash: HDZIB23QC3ONSZL3C54V3P4FRY66Z3LN
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDZIB23QC3ONSZL3C54V3P4FRY66Z3LN/>
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
 sound/soc/sunxi/sun50i-dmic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 069c993acb31..c10439b9e0a2 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -373,13 +373,11 @@ static int sun50i_dmic_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun50i_dmic_remove(struct platform_device *pdev)
+static void sun50i_dmic_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		sun50i_dmic_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops sun50i_dmic_pm = {
@@ -394,7 +392,7 @@ static struct platform_driver sun50i_dmic_driver = {
 		.pm     = &sun50i_dmic_pm,
 	},
 	.probe          = sun50i_dmic_probe,
-	.remove         = sun50i_dmic_remove,
+	.remove_new     = sun50i_dmic_remove,
 };
 
 module_platform_driver(sun50i_dmic_driver);
-- 
2.39.2

