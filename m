Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E916BB822
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:41:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 747B0148F;
	Wed, 15 Mar 2023 16:40:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 747B0148F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894878;
	bh=QayUoddaZAI5MU8JitoewaMeahzu4AFBR53/KnjvjAA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mTEXktpLQg6yjnceURz0KGsqbc8VZghxghjtPOdsHUB6tAiqw2RZn81rSV5BtEdO4
	 HC3l2Wd6Ffs+z25XOY8P40xHFM+9oEXjOxxtR7164KIy5hhmchz79cR32nT+DvjEcl
	 Zcwwg0Os0PxW8A6YQARFuVQJL+rW6K+Kq17bjUm4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6F38F805C2;
	Wed, 15 Mar 2023 16:14:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55492F805F3; Wed, 15 Mar 2023 16:10:15 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9ABF1F80558
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ABF1F80558
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-0008GW-T9; Wed, 15 Mar 2023 16:08:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-004Kb9-EN; Wed, 15 Mar 2023 16:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSji-0057i1-3Q; Wed, 15 Mar 2023 16:08:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 097/173] ASoC: Intel: bytcr_wm5102: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:29 +0100
Message-Id: <20230315150745.67084-98-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=QayUoddaZAI5MU8JitoewaMeahzu4AFBR53/KnjvjAA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5Ol+d5O6FYCPD4ojnkkfzr/cx+WOxAUghl9
 VLJSx9BuwKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeTgAKCRDB/BR4rcrs
 CRGmCACbiMXwGKLolnqa3wF93WAFH4g/xEq3Vjf3slwkdx63WrQjTex9ffzwBuvctnactF7x02E
 KHfCajOupP5PrfDOF73IdF1UBbQ3CwfffPs7Aycd1uf4g+b7ysi4KFVcsYOwVfUj5KhO0sR+HHs
 ONk17tbxOmDKk84rXlWwqoSMGvu0rxbpjtQU6Yu89HMg3a281EdqtfQez2a0Wo6ZptjU3EtDXfs
 vT+b2puJzMHCIRZY1O12bsFic3Jn79MR611uwad5QHDVZQO+2C99qWomv2YMaYhHwVqk3KqLVqH
 /4/rc9B01aJ5VtkJKGkPcEhkNWmfdZjomoHfzQt1hPjQ5La7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: FFBZQLR4HLMXBWCKEBHCMT5UF6WVBFXV
X-Message-ID-Hash: FFBZQLR4HLMXBWCKEBHCMT5UF6WVBFXV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFBZQLR4HLMXBWCKEBHCMT5UF6WVBFXV/>
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
 sound/soc/intel/boards/bytcr_wm5102.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index c0706537f673..f2382d4cb76f 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -466,13 +466,12 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int snd_byt_wm5102_mc_remove(struct platform_device *pdev)
+static void snd_byt_wm5102_mc_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
 
 	gpiod_put(priv->spkvdd_en_gpio);
-	return 0;
 }
 
 static struct platform_driver snd_byt_wm5102_mc_driver = {
@@ -480,7 +479,7 @@ static struct platform_driver snd_byt_wm5102_mc_driver = {
 		.name = "bytcr_wm5102",
 	},
 	.probe = snd_byt_wm5102_mc_probe,
-	.remove = snd_byt_wm5102_mc_remove,
+	.remove_new = snd_byt_wm5102_mc_remove,
 };
 
 module_platform_driver(snd_byt_wm5102_mc_driver);
-- 
2.39.2

