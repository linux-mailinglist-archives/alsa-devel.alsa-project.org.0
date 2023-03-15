Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189DD6BB87E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:52:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9162E1542;
	Wed, 15 Mar 2023 16:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9162E1542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895525;
	bh=PKZLUUN2FnYm9E45kDT+erWezzQ4AUZAVT1pyOCNUaE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lN9kMFkyUtR7yGT6mnrLrYa7PyXNxLO78Jrm4jumdYJhBnFmmWEQALAN9NdBl5EXH
	 jLR6O4Ti9F6OOYoNgwBGKoKiZ7UKsyb8TjgaTMrZw+WCbgCtGyLpsZrDEGZNm9jCsB
	 BxVyEu/33rKWRh+zJOexlduhD3bkGbLDb6kHENew=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 888EBF89708;
	Wed, 15 Mar 2023 16:17:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32D22F8061F; Wed, 15 Mar 2023 16:10:54 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 75E5AF80641
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75E5AF80641
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0000QT-9y; Wed, 15 Mar 2023 16:08:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-004Ker-T0; Wed, 15 Mar 2023 16:08:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-0057l4-MI; Wed, 15 Mar 2023 16:08:28 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 144/173] ASoC: sunxi: sun8i-codec: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:16 +0100
Message-Id: <20230315150745.67084-145-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=PKZLUUN2FnYm9E45kDT+erWezzQ4AUZAVT1pyOCNUaE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7kJZBA5L8T3lsg8WMR+VXbx+6E9hoN/Zgx9
 P1VmeBcBcKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe5AAKCRDB/BR4rcrs
 Ceg1B/4gksIQaHhoSv2yjkYstPXz3vvl3ILg0AUMo5CJN4UP+IJdXd4OU3/Vx3/OMVm003lxeAd
 8wMO+ljo4kxN5KGbScBlE1R5aYVEjiCe0DmxIK6CzTX+miVfdhuCO6R0Hdk82lHO4i5boNn7XlO
 8Eqf2TVLSC8JBav8DGGrt6WiGL51y5JQESOLgErWxloaNylKpsGTbY7vivhn67BtJLQntHs3sG9
 O7jMcwH3+nEWJn99pnm+tJeq4kY45Ac7tWIp6Ec7JKjYhOgYn1mUFeG7+LwJhtvOyL8Sjah+buw
 Y5MFjzWijMWzrBui0GanOVa2OmIQp0Wz3iU7dev92ls530la
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: SET4CHQNHP5H4BMCBDJ2XZGDYFNFYHWJ
X-Message-ID-Hash: SET4CHQNHP5H4BMCBDJ2XZGDYFNFYHWJ
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SET4CHQNHP5H4BMCBDJ2XZGDYFNFYHWJ/>
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
 sound/soc/sunxi/sun8i-codec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 9844978d91e6..4c0d0d7d3e58 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -1349,13 +1349,11 @@ static int sun8i_codec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun8i_codec_remove(struct platform_device *pdev)
+static void sun8i_codec_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		sun8i_codec_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct sun8i_codec_quirks sun8i_a33_quirks = {
@@ -1385,7 +1383,7 @@ static struct platform_driver sun8i_codec_driver = {
 		.pm = &sun8i_codec_pm_ops,
 	},
 	.probe = sun8i_codec_probe,
-	.remove = sun8i_codec_remove,
+	.remove_new = sun8i_codec_remove,
 };
 module_platform_driver(sun8i_codec_driver);
 
-- 
2.39.2

