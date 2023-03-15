Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4E6BB7CC
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:30:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF0F13A3;
	Wed, 15 Mar 2023 16:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF0F13A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894212;
	bh=Snt/UTlj6cCx+ffjjMvek8Oo3uNSPrhcycQrRNAXJTQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T49F4MwYezsMzqWno5jsFS9wVRbRA0nzPYbYE8LMThVFytqJ3GjynHr89JhT1dpwX
	 h3Iei5CCx1M7TYDF0THJPVfrFqtQSxSotLCsBcouBMAGgLuWV6+Qo7bwhWyvd7Oz1H
	 KBJAbnEYkYLPzEr8+a1J+rfoOD6EZ/QBVFQ/n3Iw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1DE2F806F7;
	Wed, 15 Mar 2023 16:12:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8EDDF805C5; Wed, 15 Mar 2023 16:09:38 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 80886F805CB
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80886F805CB
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSji-000806-6p; Wed, 15 Mar 2023 16:08:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-004Ka0-NG; Wed, 15 Mar 2023 16:08:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0057h6-Ry; Wed, 15 Mar 2023 16:08:14 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 082/173] ASoC: fsl: p1022_ds: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:14 +0100
Message-Id: <20230315150745.67084-83-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Snt/UTlj6cCx+ffjjMvek8Oo3uNSPrhcycQrRNAXJTQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4jRHwM8PynzC58uWNksFQTLp/zj7SS+Vuht
 T0phmrZGCyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeIwAKCRDB/BR4rcrs
 CY4yB/9zQL2r5jS86ekkTa0JfJGOGq/Ph5cs9T7khExt01w+sl4Wg60VB42mZfpdzutLmEAmkIW
 eD7IEcM+hppLqtRfd6OSD6y3QR7rGYJgH+T28ipMOpmLyB8WgL7fZGJ2W/vg05bsEk5DHKeVi7O
 TQnaBWCQiUot1rxwDvxUsKQtAS+N6deXpqOkEqt9vYaiw/tZP1WsbRDEHPHcbU8EQUTHQCi6djW
 D9EDeKrwvImNJjRTkMYPehP761KwF68LFtH9s/Mhq+jDY/Hx8LU+xeoIgA2sDX5qYhaxNHgYK/S
 6F9UMnHF/EVOFNM/EV/6DA7n0BwD0jV6TGVW8Rcyhidue3h0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: SH3QIPSYD46O6U6PUUKTYD4OGRVPUWCN
X-Message-ID-Hash: SH3QIPSYD46O6U6PUUKTYD4OGRVPUWCN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SH3QIPSYD46O6U6PUUKTYD4OGRVPUWCN/>
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
 sound/soc/fsl/p1022_ds.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index b45742931b0d..0b1418abeb9c 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -396,7 +396,7 @@ static int p1022_ds_probe(struct platform_device *pdev)
  *
  * This function is called when the platform device is removed.
  */
-static int p1022_ds_remove(struct platform_device *pdev)
+static void p1022_ds_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct machine_data *mdata =
@@ -404,13 +404,11 @@ static int p1022_ds_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_card(card);
 	kfree(mdata);
-
-	return 0;
 }
 
 static struct platform_driver p1022_ds_driver = {
 	.probe = p1022_ds_probe,
-	.remove = p1022_ds_remove,
+	.remove_new = p1022_ds_remove,
 	.driver = {
 		/*
 		 * The name must match 'compatible' property in the device tree,
-- 
2.39.2

