Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58D6BB7A6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75C0E131F;
	Wed, 15 Mar 2023 16:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75C0E131F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893947;
	bh=l13I5jrhGds3caLy5Gkgbx0Pdgm2/RrdKTRpmuQWyqE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D04MPnEANzBPFUHITk+JnRObWdG7TS/uzsmnljDqsqkV8uQIDHKyvKoD6KiHwFDzL
	 O7KoWHz7vYP+Vou/lSBaUyQQHrdE7NH3yvI/+JRM/4AO6GszzGACiskAB7L2HxP1H+
	 1Ze/GmHfNYnbxKqTuaMukqrAiFzMrRDaXJIzAH1c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88749F806A9;
	Wed, 15 Mar 2023 16:12:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22FA8F8065C; Wed, 15 Mar 2023 16:09:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 238D0F805BB
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238D0F805BB
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSja-0007Ym-T1; Wed, 15 Mar 2023 16:08:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSja-004KXv-6U; Wed, 15 Mar 2023 16:08:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjZ-0057fU-11; Wed, 15 Mar 2023 16:08:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Zhang Qilong <zhangqilong3@huawei.com>
Subject: [PATCH 057/173] ASoC: codecs: wm5102: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:49 +0100
Message-Id: <20230315150745.67084-58-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=l13I5jrhGds3caLy5Gkgbx0Pdgm2/RrdKTRpmuQWyqE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3Zcyh5Ff1r7TFe99tp6xST51i4YqDxJDequ
 Ydy66wZSyWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd2QAKCRDB/BR4rcrs
 CX4BCACSai0+KIGtrUk1+6dANd0wRRUbuTi5AoiQHVWUGb4XJ7Nyx7EXYDhrfz/xzBprFw+VXM8
 EESOnAv/XEFIfylnKzq33mv3V37px3eSCQBGp6e84V9fq1eps/zXS9EWEVBsqO/JxFRmi0dj6Yl
 V6eSBLDljsGWX0YRj3oxnqxLBN5da4EqQ2gbgplQh5ZXDbJj5So2Ji49FMPrKa9iHh8J8LzBn4a
 gCUTnsoaqizhbcxFY6WOfCrTFkXIzFrdkzzZdckpzjC8yyEt7OKIUSw8mMHWi4vy2uqFZ8Teq/k
 iYkBxrEY5u3feidGYB2AWfMc+8kEEu19QTSe5eLGRNe2Cevr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: G7XYPGGGMGLOFIXEKU4O5IW3PW7GETIO
X-Message-ID-Hash: G7XYPGGGMGLOFIXEKU4O5IW3PW7GETIO
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
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
 sound/soc/codecs/wm5102.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index adaf886b0a9d..3bdbdf3770b5 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2148,7 +2148,7 @@ static int wm5102_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wm5102_remove(struct platform_device *pdev)
+static void wm5102_remove(struct platform_device *pdev)
 {
 	struct wm5102_priv *wm5102 = platform_get_drvdata(pdev);
 	struct arizona *arizona = wm5102->core.arizona;
@@ -2163,8 +2163,6 @@ static int wm5102_remove(struct platform_device *pdev)
 	arizona_free_irq(arizona, ARIZONA_IRQ_DSP_IRQ1, wm5102);
 
 	arizona_jack_codec_dev_remove(&wm5102->core);
-
-	return 0;
 }
 
 static struct platform_driver wm5102_codec_driver = {
@@ -2172,7 +2170,7 @@ static struct platform_driver wm5102_codec_driver = {
 		.name = "wm5102-codec",
 	},
 	.probe = wm5102_probe,
-	.remove = wm5102_remove,
+	.remove_new = wm5102_remove,
 };
 
 module_platform_driver(wm5102_codec_driver);
-- 
2.39.2

