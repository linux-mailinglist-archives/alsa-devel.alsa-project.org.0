Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F76BB7FE
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:36:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B94F1419;
	Wed, 15 Mar 2023 16:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B94F1419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894580;
	bh=dFzHDZxFY1LnF/vH5qoG7cREA6ZssUK4dysHkK1fy3A=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h2HTMhhTYgmY8C8wWqTWGSR4Z81gprQMR27HmCo1DhxP82tlXGpcD8fKD/WnaM7nH
	 C3YkjiMJw5+TmysKBA5ApJkR/vrGzQ9J5gtm8EL2rudvSoY9YvvuCCVCbqMbdOMA4t
	 qeBWS9jfqQOlTydASgB2I1si9btqCELttm06ghdc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62508F805B5;
	Wed, 15 Mar 2023 16:14:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00D99F805E2; Wed, 15 Mar 2023 16:09:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AA60F805F6
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AA60F805F6
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008Ss-Lv; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004KcQ-M1; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-0057j8-0A; Wed, 15 Mar 2023 16:08:22 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 114/173] ASoC: meson: aiu: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:06:46 +0100
Message-Id: <20230315150745.67084-115-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=dFzHDZxFY1LnF/vH5qoG7cREA6ZssUK4dysHkK1fy3A=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6IFDyIZ+oP9ndVzNSV6myRohvWzvUoe1phQ
 d70M0WZcFGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeiAAKCRDB/BR4rcrs
 CedYCACaTxr2Cr6x7kpn5otGsM2h3AKhrioeNQ8GDsl1gB4YmGd9E1ofZNVLrIZTrNUaWI0Zde7
 Y1zXna1xWS3sHW9SJCuBa+HQ/xaETvenpY4Fe+wV304I0Apc9wOMK+cm1L56OfMmTKcFowRQV5w
 4ua2v/XE+PN1Z/YYoZk+NXdcmR/MDs2X4Fd/mfYn4QdYpfeOC598kaD2KQow3eBjWAis2TClebj
 SFO6orzadXQ7yAjJoAt/pOVhjOaDP4/jU10XNl18SKLlFveYaHXQStNg/mhYO6c+o0BjON1RTVK
 dLpi1gJ8qzhs/LzSOEhsE1ZIUC5GqBxDNsuzwMdOu7E3tOU5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: I74NJUFG5X426Q7ZEM6AON6TQJ3REH46
X-Message-ID-Hash: I74NJUFG5X426Q7ZEM6AON6TQJ3REH46
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I74NJUFG5X426Q7ZEM6AON6TQJ3REH46/>
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
 sound/soc/meson/aiu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 88e611e64d14..da351a60df0c 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -331,11 +331,9 @@ static int aiu_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int aiu_remove(struct platform_device *pdev)
+static void aiu_remove(struct platform_device *pdev)
 {
 	snd_soc_unregister_component(&pdev->dev);
-
-	return 0;
 }
 
 static const struct aiu_platform_data aiu_gxbb_pdata = {
@@ -364,7 +362,7 @@ MODULE_DEVICE_TABLE(of, aiu_of_match);
 
 static struct platform_driver aiu_pdrv = {
 	.probe = aiu_probe,
-	.remove = aiu_remove,
+	.remove_new = aiu_remove,
 	.driver = {
 		.name = "meson-aiu",
 		.of_match_table = aiu_of_match,
-- 
2.39.2

