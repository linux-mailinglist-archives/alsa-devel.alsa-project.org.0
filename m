Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A06BB7B5
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:27:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCDED1261;
	Wed, 15 Mar 2023 16:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCDED1261
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894029;
	bh=MLaFMwKz9kXOQDqJ5rFiUNPx5qayl46gRkFmbQjZlC0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ogcB/m/x6dVU0LhwS61/stLYlFlh15mUk1N0T/xz/n8JxgzgmM0/EpUfntLeursFo
	 QNP/5qzDW8iALpRZWXX5tPJIpXbzNzMrPdgoWHN0DufF2E8oV6qRPS1HB8HpzYwS0I
	 rnI7MF8yGxXeCLakv9xlpzPdMrvW1AXoEYckNtEo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7FA0F806B9;
	Wed, 15 Mar 2023 16:12:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5C1BF8065C; Wed, 15 Mar 2023 16:09:28 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BA13CF80423
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA13CF80423
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-0007w1-Cd; Wed, 15 Mar 2023 16:08:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-004KZl-Rx; Wed, 15 Mar 2023 16:08:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0057gv-5N; Wed, 15 Mar 2023 16:08:14 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 079/173] ASoC: fsl: mpc5200_psc_ac97: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:11 +0100
Message-Id: <20230315150745.67084-80-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=MLaFMwKz9kXOQDqJ5rFiUNPx5qayl46gRkFmbQjZlC0=;
 b=owEBawGU/pANAwAKAcH8FHityuwJAcsmYgBkEd4bZewCOwt/PAZGJRFkbcq8PVUaIbUkFIfx/
 K0lVNr3ThWJATEEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeGwAKCRDB/BR4rcrs
 CZOHB+4hQagnf/vO+lkWUgFf2OyMzlaUJCvmJO3kFJQp85U9W9y3oICYtLv8kRAUy9OHrDpQvTv
 d5ChleoCh6VSD4kvklzjeTh2tCZZUO3Mt1IkPA1BL9iS5GNZLS32L9OFIkOzBuNzjBVWPagldMo
 0vEhGFYBykazqxqTrZfFPGAnSVc27qKweSbEKvoGz16fAp/TaZHqaMbysZTW7N8/aADc6hYCh4X
 razju89lV1IbcG16436TG3hDKSEEwY6J0nNzc4SrwfpWHEP2OeR/m/3hPJAGzerFVs99t33I/0w
 jAXvMfapu2nsaJZfKCWVZ8ug/smc89FN56DmAn+RmCEw5Q==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: KB6P3KG3BIQTA4AKQ4BI7E57PSW3YWTR
X-Message-ID-Hash: KB6P3KG3BIQTA4AKQ4BI7E57PSW3YWTR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KB6P3KG3BIQTA4AKQ4BI7E57PSW3YWTR/>
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
 sound/soc/fsl/mpc5200_psc_ac97.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index a082ae636a4f..40a4a2667394 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -311,12 +311,11 @@ static int psc_ac97_of_probe(struct platform_device *op)
 	return 0;
 }
 
-static int psc_ac97_of_remove(struct platform_device *op)
+static void psc_ac97_of_remove(struct platform_device *op)
 {
 	mpc5200_audio_dma_destroy(op);
 	snd_soc_unregister_component(&op->dev);
 	snd_soc_set_ac97_ops(NULL);
-	return 0;
 }
 
 /* Match table for of_platform binding */
@@ -329,7 +328,7 @@ MODULE_DEVICE_TABLE(of, psc_ac97_match);
 
 static struct platform_driver psc_ac97_driver = {
 	.probe = psc_ac97_of_probe,
-	.remove = psc_ac97_of_remove,
+	.remove_new = psc_ac97_of_remove,
 	.driver = {
 		.name = "mpc5200-psc-ac97",
 		.of_match_table = psc_ac97_match,
-- 
2.39.2

