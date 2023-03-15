Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECC6BB824
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:41:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A2EA1468;
	Wed, 15 Mar 2023 16:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A2EA1468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894907;
	bh=LaYuducFRK2PP/9D2yS5gTCCrN1sjrJHdhHs+FEPv7c=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EPvxJTlZeETrBWPiMwUt806LShZoLewh30h0sJ974igI4tHuj+Ue/WmW8buB7gOnY
	 7ca8hOIcSoGV9wL3hKA1+NgFMW4+J5cjyWoI1gxgc90aw2NPQzBosptwwDiahH/bgx
	 WjJFgIQMGEnjwgW76bMw25P4UkqMRRB6bfS1zS1I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EDA7F805C1;
	Wed, 15 Mar 2023 16:15:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD36CF805F8; Wed, 15 Mar 2023 16:10:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 533ABF8060C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 533ABF8060C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjv-0000GM-BN; Wed, 15 Mar 2023 16:08:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjr-004Kdu-6j; Wed, 15 Mar 2023 16:08:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0057kM-6k; Wed, 15 Mar 2023 16:08:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 133/173] ASoC: sh: rz-ssi: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:07:05 +0100
Message-Id: <20230315150745.67084-134-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=LaYuducFRK2PP/9D2yS5gTCCrN1sjrJHdhHs+FEPv7c=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7BymI0nnGN/rE2TtFSPZ9Ym5VNksweMJj+0
 ZuOxTC3xDmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHewQAKCRDB/BR4rcrs
 CcL8B/4o9IYeDfdc0+uJCNMd0NKMGXqNRc4hQvr7qurETfb7aLd6emS7YCtb86s1TLapXzSajSf
 U1bp2Io68kiKu2LvYUtPTpB8ZyA5PmF4TDZ1IMkcgfmqIleTlVTRMfXuEsQO7yJF6LeJ17qoWls
 NP30+dF0UeCxleXW47TEeLcuLjEktZZDsAWVhNcIZ6baEfg+w9K0sqF4O9cuDe3iSM/GbNsVz7x
 raAMbUE2Huy/KDo302ZOvpgIlQKlUxWolQZS666v7oyu0vmNSR2rQMw5BBzIVjSOZcvbtJqNcDN
 8o5BvCPe72+3jNeKmEeZY2PCKYHMqZ3tkEzCZk1O7BhZlq2r
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: S22XZ5TXCYMOXWEDTRGJV3HJ7M5OYSQX
X-Message-ID-Hash: S22XZ5TXCYMOXWEDTRGJV3HJ7M5OYSQX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S22XZ5TXCYMOXWEDTRGJV3HJ7M5OYSQX/>
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
 sound/soc/sh/rz-ssi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 5d6bae33ae34..5b598843800e 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -1050,7 +1050,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rz_ssi_remove(struct platform_device *pdev)
+static void rz_ssi_remove(struct platform_device *pdev)
 {
 	struct rz_ssi_priv *ssi = dev_get_drvdata(&pdev->dev);
 
@@ -1059,8 +1059,6 @@ static int rz_ssi_remove(struct platform_device *pdev)
 	pm_runtime_put(ssi->dev);
 	pm_runtime_disable(ssi->dev);
 	reset_control_assert(ssi->rstc);
-
-	return 0;
 }
 
 static const struct of_device_id rz_ssi_of_match[] = {
@@ -1075,7 +1073,7 @@ static struct platform_driver rz_ssi_driver = {
 		.of_match_table = rz_ssi_of_match,
 	},
 	.probe		= rz_ssi_probe,
-	.remove		= rz_ssi_remove,
+	.remove_new	= rz_ssi_remove,
 };
 
 module_platform_driver(rz_ssi_driver);
-- 
2.39.2

