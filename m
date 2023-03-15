Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EBC6BB7E8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:33:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBB831374;
	Wed, 15 Mar 2023 16:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBB831374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894433;
	bh=koWfqNykvz7tdkgZlN4qWKDgHoQvfRsTgvMjWDwhmWo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=od7U4HQd/Mtr6lQUMtCzhK8SnPaQX3cJqd0Aws/HQC1iqiffESBts0vRH/h9DOsOh
	 SFqEft1THeLDbY5ZceHRE4h1YGgHplqeG0KU/E+uI9wXiRMY3+wOE+d/eyToJgFQON
	 ocNzSq4ITZHp5gy+LSBEULiN4EnY82jO352lhc5c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6138F80760;
	Wed, 15 Mar 2023 16:13:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33915F805D5; Wed, 15 Mar 2023 16:09:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AD0AF805E9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AD0AF805E9
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjp-0008RI-Vr; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004Kc5-5w; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-0057ih-9n; Wed, 15 Mar 2023 16:08:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 107/173] ASoC: mediatek: mt2701-afe-pcm: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:39 +0100
Message-Id: <20230315150745.67084-108-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1800;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=koWfqNykvz7tdkgZlN4qWKDgHoQvfRsTgvMjWDwhmWo=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5ucK4eJxav+CKwEsT01ChAzCaqlzIv8d6dH
 VVRe7CFjDaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHebgAKCRDB/BR4rcrs
 CbZgB/9IiPRZCQsk2TcCq8DpBsxbaKQzOJPMb6WfwGKP8e0UNyi6D0TcOWODUdHan56YY07E6Jf
 WRXUEJR2VvMvmX03OsBOOP/O1YNl0dm6Cnl9YZisPAb89yBxPncJoypGeiK8Ov0Jmea3+ylSBpy
 SO9AfgDQnkCfot1KYwYFwBV9DOrid9PcYhZsCrDnfa0jV7w3q+wXTcPAs6N6wHc5R+y7phFwPed
 Sf/s0WmaqN8gcTF0eVHC1IL8S4WpcHiTJcasvbNvFhG9iC6+sOI5IoHII6m8MTf8mA5FWdHQd9t
 EhBw6LplS8ZgwS7iEaxsI1hp/4eZELOXh9JP2XREj9qavttQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: YDWOUGAPALSWKWTJZ23Q6RFKVOWYQWDU
X-Message-ID-Hash: YDWOUGAPALSWKWTJZ23Q6RFKVOWYQWDU
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 alsa-devel@alsa-project.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
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
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 0f178de92a0f..c9d4420e9b4c 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1439,14 +1439,12 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt2701_afe_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct mt2701_soc_variants mt2701_soc_v1 = {
@@ -1477,7 +1475,7 @@ static struct platform_driver mt2701_afe_pcm_driver = {
 		   .pm = &mt2701_afe_pm_ops,
 	},
 	.probe = mt2701_afe_pcm_dev_probe,
-	.remove = mt2701_afe_pcm_dev_remove,
+	.remove_new = mt2701_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt2701_afe_pcm_driver);
-- 
2.39.2

