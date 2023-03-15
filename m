Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B66F6BB770
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:19:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADA651268;
	Wed, 15 Mar 2023 16:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADA651268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893568;
	bh=RZWxDhTwA9XiLOzSTXLQmnZb1vKcSEg0e0jTzF63mek=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZpzgMllSn/5/p+MjiNbw7lGFou0FWTN4SOqHwPlEpSxRWVUdq/25kvRhhGYlwlD64
	 ocUOqneuE3ojwQW6u5bMpyF5vSmoSzqGYewPW/U8egKJuN+USUYqQJcbP8IwVWazi+
	 S33cu2sVJu8j+Gz9LFCzLDDjfcUcjt2WljO2wImg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D3F7F805E6;
	Wed, 15 Mar 2023 16:10:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 279D3F8057E; Wed, 15 Mar 2023 16:08:55 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ECD02F8057F
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECD02F8057F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-0007Gy-Pr; Wed, 15 Mar 2023 16:08:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-004KVQ-OJ; Wed, 15 Mar 2023 16:08:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-0057dT-3c; Wed, 15 Mar 2023 16:08:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 026/173] ASoC: atmel: mchp-i2s-mcc: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:18 +0100
Message-Id: <20230315150745.67084-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=RZWxDhTwA9XiLOzSTXLQmnZb1vKcSEg0e0jTzF63mek=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd13i7qsJvPILZOsSvkjrxCMCI3O8QnQ4HLTd
 Gh0t48XD7SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHddwAKCRDB/BR4rcrs
 CZPSB/9xBGIEWsf6k2/9ZWABIU50k6BFyNgavZ4rdjbqHdLb5tQPJwBcUw9o1i7vDcX1uWqusgF
 OSRcaXMUPRN3Cr7/niOMNRuQUgumhYRlPjQANA/jrQRm8rR/De0jDe2J5QX9s44nt4JvJCWN3Oo
 y0Ldili0WbU2CqEyr7V64K2QK+ClXCZHPWqslXolvkxVQBjoAipwFQOXuV7gFO31JZoCdbqHnYA
 lyghLC4f19iVPFHWsxa6CmHzAqBH817L64Vr/p5StFn/iTmtHSZBZmfILTXB5au+13F3Zc1bhnA
 7oDjmVdBCVOsC0lj+vspQxbmOT3JvE71or6Kem2mN9BJTsTu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: GVWGIE6YYNH2S75ACE2ILKEF6JFA44TP
X-Message-ID-Hash: GVWGIE6YYNH2S75ACE2ILKEF6JFA44TP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVWGIE6YYNH2S75ACE2ILKEF6JFA44TP/>
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
 sound/soc/atmel/mchp-i2s-mcc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 6dfb96c576ff..7c83d48ca1a0 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1088,13 +1088,11 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mchp_i2s_mcc_remove(struct platform_device *pdev)
+static void mchp_i2s_mcc_remove(struct platform_device *pdev)
 {
 	struct mchp_i2s_mcc_dev *dev = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(dev->pclk);
-
-	return 0;
 }
 
 static struct platform_driver mchp_i2s_mcc_driver = {
@@ -1103,7 +1101,7 @@ static struct platform_driver mchp_i2s_mcc_driver = {
 		.of_match_table	= of_match_ptr(mchp_i2s_mcc_dt_ids),
 	},
 	.probe		= mchp_i2s_mcc_probe,
-	.remove		= mchp_i2s_mcc_remove,
+	.remove_new	= mchp_i2s_mcc_remove,
 };
 module_platform_driver(mchp_i2s_mcc_driver);
 
-- 
2.39.2

