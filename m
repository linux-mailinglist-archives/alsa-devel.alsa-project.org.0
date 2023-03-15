Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0216BB7B0
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:26:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262181325;
	Wed, 15 Mar 2023 16:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262181325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893993;
	bh=NBR+AVL8cNAlqinDBFGAK6/J8chnDfmAuUyzf/QyB3U=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aDUvO52cuzw3Qxwm0XW9FBmLnRn8BZGWwFrzr4ZgnQWg3UhzP462s5hZt+lozfc3W
	 Wnht/2eTBrkMnpkD3glGaLXV3TBxPl35WfI2mi0VR/y5x0O+WrNgKpCUvM7Ua4P5vu
	 pOIZZh/mgWDeYez4dHg+sMQSgjGushmvsmgtHY6I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D07F806B4;
	Wed, 15 Mar 2023 16:12:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 416F0F8065C; Wed, 15 Mar 2023 16:09:27 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BA3B7F805C0
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA3B7F805C0
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0007iz-7T; Wed, 15 Mar 2023 16:08:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-004KYs-Gm; Wed, 15 Mar 2023 16:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-0057g5-FJ; Wed, 15 Mar 2023 16:08:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 067/173] ASoC: fsl: fsl_dma: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:59 +0100
Message-Id: <20230315150745.67084-68-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=NBR+AVL8cNAlqinDBFGAK6/J8chnDfmAuUyzf/QyB3U=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd34QIS3bbz2bqxIB59RBNE98PPkP2+QtzfaV
 vMYjsJgqSmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd+AAKCRDB/BR4rcrs
 CabwB/9yft9ZbixnZyCeMdR/XfN8uFIROqays0L93RU64Y3xph+5QhZfG46rcPD0XOttVcTMC4S
 uCCT27uOdurmqeuHOP/QHH/9rvsM+VqSIaxSdrQyytVF0/MiVwUuRC9S79eqUfULr/v/lpFTxsc
 RS2Ae9KL/lL8bBfRZPjeK/fBIUXRvEd9RNNN6XbwAU7lkGOWPRMhRohnTVQ8uQlR+rj6T3FBFOZ
 i31m6jeWE4iBP7hCm6r0o2NoQm8UEw6eTgxfVASeGutlMzUx0cMCaPzfY3FerYoLjgUgXvkPCbj
 m4Bbx9TWOo3+GBicDL6q0uAobo2XiQDBPlSSolygBpm91i2C
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: QIGCQH33TXFDQVBJQOY62XREZQYD5SVA
X-Message-ID-Hash: QIGCQH33TXFDQVBJQOY62XREZQYD5SVA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QIGCQH33TXFDQVBJQOY62XREZQYD5SVA/>
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
 sound/soc/fsl/fsl_dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index 808fb61a7a0f..963f9774c883 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -890,15 +890,13 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fsl_soc_dma_remove(struct platform_device *pdev)
+static void fsl_soc_dma_remove(struct platform_device *pdev)
 {
 	struct dma_object *dma = dev_get_drvdata(&pdev->dev);
 
 	iounmap(dma->channel);
 	irq_dispose_mapping(dma->irq);
 	kfree(dma);
-
-	return 0;
 }
 
 static const struct of_device_id fsl_soc_dma_ids[] = {
@@ -913,7 +911,7 @@ static struct platform_driver fsl_soc_dma_driver = {
 		.of_match_table = fsl_soc_dma_ids,
 	},
 	.probe = fsl_soc_dma_probe,
-	.remove = fsl_soc_dma_remove,
+	.remove_new = fsl_soc_dma_remove,
 };
 
 module_platform_driver(fsl_soc_dma_driver);
-- 
2.39.2

