Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18B6BB888
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:53:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01A3B1542;
	Wed, 15 Mar 2023 16:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01A3B1542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895590;
	bh=JddAPObZ84lwySN6Be3w4pNO4/DsN0onY+NRjxyszl0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HnDNT41PapKsOODeHr9MR4jnE13pvZv1EOGqhCh4bdQAXYPJOl39cysKGJF7uvTYv
	 syGQa8LMxutlJTZuKDscIUURuRHc17KKPmgEaQz00af+s9u4Wg8UHNqhY6tsZq/U7q
	 FlsZ1FTVdoX8g90zv/X5dSRZASECyDfI/sOBogUg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C08E8F89710;
	Wed, 15 Mar 2023 16:17:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AD8CF8061F; Wed, 15 Mar 2023 16:10:57 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 750B2F80640
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 750B2F80640
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSk3-0000gi-07; Wed, 15 Mar 2023 16:08:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-004Kga-Cc; Wed, 15 Mar 2023 16:08:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjx-0057ma-M9; Wed, 15 Mar 2023 16:08:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 167/173] ASoC: ux500: mop500: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:39 +0100
Message-Id: <20230315150745.67084-168-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=JddAPObZ84lwySN6Be3w4pNO4/DsN0onY+NRjxyszl0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8oxZgTckAsvrIqJC2Ne2tiMQ5DnLRpOT5VV
 nE+ssE9YIeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfKAAKCRDB/BR4rcrs
 CQxWCACM94onzu8df0Gu/DJs9+jzthDtmUGfb7Wj7m2+hLF28Fmc2Qu+YOTyOdC6ZjD1nZsn3d+
 dxfC6WQw2DFPWV4J4EVD3Wd/Y3kNvoX0tyUHrbZ3rg4ist/d6NXlmYPoRH+65NtB62hbIdp8kho
 +ZLKTpl3EfwFhzWfyX3WlYXfqVMPG69RftSbIspGPqYlrJEuHzCq0DHflOn2hywEV3UTi8DPz4+
 MTvMsKzYfi03ZhedRXDL4ld4crUiPXJYf8u8EcwMN6/GJ+J3zc+WH4uFXjAtsUXXcM47vUi3smB
 x0UVRRtRY8o1XjomwXVSJl3HEtrJRnoZw+nvGguY9TrvqhpL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: E2ODFTITJW5MOFSLRDKQFSLENLOBKFSW
X-Message-ID-Hash: E2ODFTITJW5MOFSLRDKQFSLENLOBKFSW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2ODFTITJW5MOFSLRDKQFSLENLOBKFSW/>
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
 sound/soc/ux500/mop500.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
index 325e75e96136..e0ab4534fe3e 100644
--- a/sound/soc/ux500/mop500.c
+++ b/sound/soc/ux500/mop500.c
@@ -134,7 +134,7 @@ static int mop500_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mop500_remove(struct platform_device *pdev)
+static void mop500_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
@@ -143,8 +143,6 @@ static int mop500_remove(struct platform_device *pdev)
 	snd_soc_unregister_card(card);
 	mop500_ab8500_remove(card);
 	mop500_of_node_put();
-
-	return 0;
 }
 
 static const struct of_device_id snd_soc_mop500_match[] = {
@@ -159,7 +157,7 @@ static struct platform_driver snd_soc_mop500_driver = {
 		.of_match_table = snd_soc_mop500_match,
 	},
 	.probe = mop500_probe,
-	.remove = mop500_remove,
+	.remove_new = mop500_remove,
 };
 
 module_platform_driver(snd_soc_mop500_driver);
-- 
2.39.2

