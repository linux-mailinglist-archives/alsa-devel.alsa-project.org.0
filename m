Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B10166BB7B2
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:26:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16066131F;
	Wed, 15 Mar 2023 16:26:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16066131F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894010;
	bh=iKAaVVxOf7lkZ7V5ze5WCctnJM8IctRpFOwS/9Y0IyM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PBUu+9dXNMagmbhZcueG+cw6quSc9wBI27oYlqzN8xRpLxYFIVUfbdM6X+B32Hay3
	 PMVolua6DTrqeuQfDxXP6hBxRqFlruu7vNSCLdY3UKt2QiIgGOC8PJH4DEQ1oCpHpC
	 jhscpk9cpHX6kptxGry1uGDj8fEDlUBh6LldQ1uI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD52DF806BA;
	Wed, 15 Mar 2023 16:12:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1C94F8065C; Wed, 15 Mar 2023 16:09:27 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BF1CCF80520
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1CCF80520
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0007k6-I8; Wed, 15 Mar 2023 16:08:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-004KYx-MY; Wed, 15 Mar 2023 16:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-0057gJ-2n; Wed, 15 Mar 2023 16:08:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 070/173] ASoC: fsl: fsl_mqs: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:02 +0100
Message-Id: <20230315150745.67084-71-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=iKAaVVxOf7lkZ7V5ze5WCctnJM8IctRpFOwS/9Y0IyM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4BMf3TI/WQHJSyWvAcll0fBswed0xdEhhKa
 hIcZ1ta/xCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeAQAKCRDB/BR4rcrs
 CSTqCACK7rgbB40bywWv6gpJ6k6MERqBKvI2XsLkFby6yuP0Izhvzb72/SKO1cH/HBtpzIKJq1y
 7q1KCC2cmUaOUx6eqO3rPhaPBqVvo+o7OFcaUSHnjR76wwE19k9LURfwD/8+fb8uCUbWwGypqQO
 KRr1t7MksiW944RHdkqY7nnyOvjm+w2WtElA/Pt5hbXdc33qZQjC44AANOW6q2dn2wKL9PZQ/TR
 5hqUOmM6PcE184DRarIOzel7EtUksD6K5RJguguRKdESL6kx+nZ80oBleTwBNM/jJYE6KCeBO1O
 usaE6LSVaD0GeZ6W6EOPpmHOPohUBdKjKD9NO9/DMOHplZdX
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: VMLFMI2MRODDB7BUOF42QDKDUSYZCXU4
X-Message-ID-Hash: VMLFMI2MRODDB7BUOF42QDKDUSYZCXU4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMLFMI2MRODDB7BUOF42QDKDUSYZCXU4/>
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
 sound/soc/fsl/fsl_mqs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 4922e6795b73..3fb3d3e4d09a 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -261,10 +261,9 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_mqs_remove(struct platform_device *pdev)
+static void fsl_mqs_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -360,7 +359,7 @@ MODULE_DEVICE_TABLE(of, fsl_mqs_dt_ids);
 
 static struct platform_driver fsl_mqs_driver = {
 	.probe		= fsl_mqs_probe,
-	.remove		= fsl_mqs_remove,
+	.remove_new	= fsl_mqs_remove,
 	.driver		= {
 		.name	= "fsl-mqs",
 		.of_match_table = fsl_mqs_dt_ids,
-- 
2.39.2

