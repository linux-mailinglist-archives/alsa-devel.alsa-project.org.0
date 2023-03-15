Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E76BB813
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:38:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F9721381;
	Wed, 15 Mar 2023 16:38:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F9721381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894738;
	bh=iskRGe0e1NEGCS7ZHmi3EBejchItbPDswgJSbudaUeU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mb/Jan8kpHqvB3r1werSmzRZhAwiw2X3061DLWGvjsQxzbqc3JKuUCGg28Zh2rzqb
	 HUf1HxBHNzcj8Y/007s6XsC9UpeW96+TpBDegs9VCr2awN2xwpAM/XLf8qLNW0N1or
	 E+H8QPHjPZqBsDh2ux11OfwyPzv+251duDHNOXr0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69DEFF805C7;
	Wed, 15 Mar 2023 16:14:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23470F805F2; Wed, 15 Mar 2023 16:10:08 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3313EF80602
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3313EF80602
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008Tn-Ot; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004KcU-Rh; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-0057jC-6m; Wed, 15 Mar 2023 16:08:22 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 115/173] ASoC: mxs: mxs-sgtl5000: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:47 +0100
Message-Id: <20230315150745.67084-116-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=iskRGe0e1NEGCS7ZHmi3EBejchItbPDswgJSbudaUeU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6Lg/gNsBo6JMr3ON8DbURBj6KfkcNPv1ZwN
 ak71fFUY3qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeiwAKCRDB/BR4rcrs
 CTALB/9KOvXM/G3yE8Hng/r+wNaWy/ust4Mr67X7D+ahaMcBRi6ZkTnmu+zj5E6+4uziPE0p9pz
 e4ZoUZZTyoI7nE/pki7ui3AbsQt9AUH2HkpjWg5xVZh0KZohBXxxFVPSgohAvMTwXh3G+tLPtQ3
 CPIBHolzkIpMGJy9+5BkLxa648IaMpxPN0Y/0olvuVRV2ePBvXfrfR99WzvfCBcoMSymVQjNvHK
 0q+0QGC4Nqpp5P1K5YyXvlgovhyXg5m9quadT9Kf9dc50CrV4SsvI8ROA5FPhKPUH8Hod9MFE+b
 zKMq/fxxTaXWRpluZUTwSQO45QNUUq1CbYVM3/aE8NUNpdIg
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 4ECF4FYXGZ7GAXJZYSW46XOL5YZHKUJF
X-Message-ID-Hash: 4ECF4FYXGZ7GAXJZYSW46XOL5YZHKUJF
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ECF4FYXGZ7GAXJZYSW46XOL5YZHKUJF/>
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
 sound/soc/mxs/mxs-sgtl5000.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 746f40938675..e24e89cc1270 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -169,11 +169,9 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mxs_sgtl5000_remove(struct platform_device *pdev)
+static void mxs_sgtl5000_remove(struct platform_device *pdev)
 {
 	mxs_saif_put_mclk(0);
-
-	return 0;
 }
 
 static const struct of_device_id mxs_sgtl5000_dt_ids[] = {
@@ -188,7 +186,7 @@ static struct platform_driver mxs_sgtl5000_audio_driver = {
 		.of_match_table = mxs_sgtl5000_dt_ids,
 	},
 	.probe = mxs_sgtl5000_probe,
-	.remove = mxs_sgtl5000_remove,
+	.remove_new = mxs_sgtl5000_remove,
 };
 
 module_platform_driver(mxs_sgtl5000_audio_driver);
-- 
2.39.2

