Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9006BB77F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:21:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ADF012F2;
	Wed, 15 Mar 2023 16:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ADF012F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893680;
	bh=hNc4dORXpE5ELuQNf49V9GlI4t5cUYGeUxy0X2bMhZY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H9vPbv7dOy5HsRAWdn3smNKTIri3EWRKtv1/7dVZmlecDGKLI2mKrWecvy4p0YFIp
	 FAeBmNIdVerDmALsUeWvT7fK7m4TxtRnvU9Ff2u8mTSZbhEEDijkfUvrNsUCoCK/rf
	 nNVitlw9RrnLKErbu3EmmEPmh4/kECL4Z6ZsXG3M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5C0CF8062F;
	Wed, 15 Mar 2023 16:11:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89432F80580; Wed, 15 Mar 2023 16:09:01 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C542F8059F
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C542F8059F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-0007Jh-LS; Wed, 15 Mar 2023 16:08:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-004KVg-LY; Wed, 15 Mar 2023 16:08:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-0057dX-9X; Wed, 15 Mar 2023 16:08:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 027/173] ASoC: atmel: mchp-pdmc: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:19 +0100
Message-Id: <20230315150745.67084-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=hNc4dORXpE5ELuQNf49V9GlI4t5cUYGeUxy0X2bMhZY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd161keJ2fEgfATr0pqgJ6wrK5JULpHbtirqN
 uOJEkpojsuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdegAKCRDB/BR4rcrs
 CdKWB/0ZkXsDM/L75VXSPbERtrJI98YjKCoj9L7x49D5Okv3IF2zuQKk+R138JJJMvfHKrnvvJN
 /xDCqRZIIMC/OVT0b6Y+XV3wi/tHHE1rgR501GF8A1ENMfEvjuVSSdX2gWOrzJArVgJYi77dZ5U
 ymcfRoeRC7y1Z2UprdcRXlv24zy1RJeQzPjoXtP162df/M3avKmtwnsQMHnxC4le691LQz8x+pz
 F8eY7HJtBJU5LF1gzocPp2XmW3KmbKZudnL7IqaCBLVWtVMAkRzV2ptDCTAAUiN49sQoOgbqHxG
 Ab/junDvO9Kv+jr9nxUDamXI1RRt5sAfQrngruiN0IgB28Ct
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 5CFXOFJOVW65MHPOXIS27CEVNI7HPTGR
X-Message-ID-Hash: 5CFXOFJOVW65MHPOXIS27CEVNI7HPTGR
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CFXOFJOVW65MHPOXIS27CEVNI7HPTGR/>
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
 sound/soc/atmel/mchp-pdmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 1aed3baa9369..7fd2c3e100e8 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -1134,7 +1134,7 @@ static int mchp_pdmc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mchp_pdmc_remove(struct platform_device *pdev)
+static void mchp_pdmc_remove(struct platform_device *pdev)
 {
 	struct mchp_pdmc *dd = platform_get_drvdata(pdev);
 
@@ -1142,8 +1142,6 @@ static int mchp_pdmc_remove(struct platform_device *pdev)
 		mchp_pdmc_runtime_suspend(dd->dev);
 
 	pm_runtime_disable(dd->dev);
-
-	return 0;
 }
 
 static const struct of_device_id mchp_pdmc_of_match[] = {
@@ -1168,7 +1166,7 @@ static struct platform_driver mchp_pdmc_driver = {
 		.pm		= pm_ptr(&mchp_pdmc_pm_ops),
 	},
 	.probe	= mchp_pdmc_probe,
-	.remove = mchp_pdmc_remove,
+	.remove_new = mchp_pdmc_remove,
 };
 module_platform_driver(mchp_pdmc_driver);
 
-- 
2.39.2

