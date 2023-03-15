Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 779626BB74D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:15:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068601288;
	Wed, 15 Mar 2023 16:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068601288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893315;
	bh=KU1xfjhHq+zCkX6+R5uusEZuFumtSMUlcQdAWocSlGY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ai9dNLjdyP2Smu9tb0QLQtoSrBZdoSYhk6lpoJaKLx+p4cV7VJJxqrAAMFNUUZTNG
	 sK75h4xWxb1CTq1T7zndynS/PfCASY71NvgL1QkDlSqWunH03tROcdZey5TBwpbI4o
	 1DHxf3MmMgEUfgBmubbnzYySp/2IkwioYjxVN6co=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10E04F805C4;
	Wed, 15 Mar 2023 16:09:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A4AF805F6; Wed, 15 Mar 2023 16:08:38 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DFD71F80553
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD71F80553
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjY-0007Up-8s; Wed, 15 Mar 2023 16:08:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-004KXE-Ld; Wed, 15 Mar 2023 16:08:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-0057eu-14; Wed, 15 Mar 2023 16:08:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 048/173] ASoC: codecs: inno_rk3036: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:40 +0100
Message-Id: <20230315150745.67084-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=KU1xfjhHq+zCkX6+R5uusEZuFumtSMUlcQdAWocSlGY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd23WszcQEFjJkN7Qv7VFQ/C42HKLTLY8MBgm
 62d4R0+MkmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdtwAKCRDB/BR4rcrs
 CdnNB/9/CEAPTjP2j28JDme5Sp7cooiikaxeUZeXCPmfLKmEVd3E4gkRLuM/FDARlatx3U4JGn3
 sMTmLQGuRV82BMgVcJB9DG+SeyHyOYEI1qoQ390O307CUPlp9PTpV7yjIElg9MExqmWmOhjPRr/
 An8/d+Ic92elkIRXswOxYI+/8IntjIroYOHP8QNsO3tqo7uk9RaedK0b+5nXgdZVggmihWKeqZ4
 Oc86iOQCcdJBKaBA784+H9EoYyE5eE46sBc8Sg0mqxH8YSrt4hNey++lX3wDuAaM+9Ir4coRiOT
 +xyxIo7/TwCHUKeN1xWIzkW1tJKKlMIf1EjEKfdx80kG2Rog
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 63VEV5IHLK7KIMFYEBRWGSJ77AETXCSA
X-Message-ID-Hash: 63VEV5IHLK7KIMFYEBRWGSJ77AETXCSA
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
Archived-At: <>
List-Archive: <>
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
 sound/soc/codecs/inno_rk3036.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/inno_rk3036.c b/sound/soc/codecs/inno_rk3036.c
index 8222cde6e3b9..11320423c69c 100644
--- a/sound/soc/codecs/inno_rk3036.c
+++ b/sound/soc/codecs/inno_rk3036.c
@@ -457,13 +457,11 @@ static int rk3036_codec_platform_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rk3036_codec_platform_remove(struct platform_device *pdev)
+static void rk3036_codec_platform_remove(struct platform_device *pdev)
 {
 	struct rk3036_codec_priv *priv = dev_get_drvdata(&pdev->dev);
 
 	clk_disable_unprepare(priv->pclk);
-
-	return 0;
 }
 
 static const struct of_device_id rk3036_codec_of_match[] __maybe_unused = {
@@ -478,7 +476,7 @@ static struct platform_driver rk3036_codec_platform_driver = {
 		.of_match_table = of_match_ptr(rk3036_codec_of_match),
 	},
 	.probe = rk3036_codec_platform_probe,
-	.remove = rk3036_codec_platform_remove,
+	.remove_new = rk3036_codec_platform_remove,
 };
 
 module_platform_driver(rk3036_codec_platform_driver);
-- 
2.39.2

