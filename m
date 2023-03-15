Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B58D6BB764
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:17:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83E2D12D9;
	Wed, 15 Mar 2023 16:17:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83E2D12D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893470;
	bh=KsNaPZaC9O+CBLoIkyU0csD2LEDsbYyKNK9/eq9pJV4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mojtZzYA4ZN8qFs6au6Yq4ASFIqN+hYd7hpphg1E8IfX4pyGjLsUtlgegydPUg3ZK
	 hLZ6x7TgBKIwU2hiE5u3+GRCUgI0VKledpY/TCa2sgCHx116FnxwZv5TpY5jvGz6uB
	 HOWVLVzLxo9wbwiznnStJa0OS5Yh3mNFeyst1/04=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9544AF805FE;
	Wed, 15 Mar 2023 16:10:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CBC7F8063D; Wed, 15 Mar 2023 16:08:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C4F8BF80578
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4F8BF80578
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-0007SY-6E; Wed, 15 Mar 2023 16:08:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjW-004KWg-7K; Wed, 15 Mar 2023 16:08:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjV-0057eS-Ev; Wed, 15 Mar 2023 16:08:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 041/173] ASoC: cirrus: ep93xx-i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:33 +0100
Message-Id: <20230315150745.67084-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=KsNaPZaC9O+CBLoIkyU0csD2LEDsbYyKNK9/eq9pJV4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2jJvg/fR5SiZgkPhiiu450UBtVHCGdfL9CT
 oPyuBIetXmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdowAKCRDB/BR4rcrs
 CallB/wOd3jvGs0wb0bAURMs6iyy6SlDUHMJ1VXV1WiNTNzLgxXXo0VnfqH27/Oiv/jTEEOsRn6
 M0EXDq2DleLCWxTXsFbdxbSIH7gSa91evNYZs/lqTKYUtr60L63xcogmklMrRADY4aKPO/ihGYm
 mTnCbDf7SOjnNhrfQyCNi+6fyM6E48pxXjHbcBLtFYf8SLTIr1/k9BTnkDOtPhBvXcaq8a/3tW5
 xXGNxoi+AQWoF1NVYmznavDYZoXdpCobPHQgzSDnuZBSLsyzBEDqzl865w42E3WhQR1DsQIvl7m
 pyUIKXu4dpVeALyti0FIwzNP7BRV6c4LkOYihaTyo9KYwHG8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: L2WEKFMVCZLISHJFWUUHMCNKI4227HN2
X-Message-ID-Hash: L2WEKFMVCZLISHJFWUUHMCNKI4227HN2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2WEKFMVCZLISHJFWUUHMCNKI4227HN2/>
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
 sound/soc/cirrus/ep93xx-i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 70840f27d4a7..9760453d9d79 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -495,19 +495,18 @@ static int ep93xx_i2s_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int ep93xx_i2s_remove(struct platform_device *pdev)
+static void ep93xx_i2s_remove(struct platform_device *pdev)
 {
 	struct ep93xx_i2s_info *info = dev_get_drvdata(&pdev->dev);
 
 	clk_put(info->lrclk);
 	clk_put(info->sclk);
 	clk_put(info->mclk);
-	return 0;
 }
 
 static struct platform_driver ep93xx_i2s_driver = {
 	.probe	= ep93xx_i2s_probe,
-	.remove	= ep93xx_i2s_remove,
+	.remove_new = ep93xx_i2s_remove,
 	.driver	= {
 		.name	= "ep93xx-i2s",
 	},
-- 
2.39.2

