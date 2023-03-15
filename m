Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29B6BB841
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:43:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E62ED14A9;
	Wed, 15 Mar 2023 16:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E62ED14A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895036;
	bh=CLY5Z8vV7vd/CgtJa6KA5gKNMMbpMVJf4QlK8YL7Es4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jEfOVwJAhfeWIVLmbQ/xJpTfsBMBdRak7V00ouUpwwJXAEXIgvl/Td40VGgIHPiS0
	 v8vfAqHI2kY1REzQde7OQBzx99y63zAlocToH6lw2p3EUvU0Caq8sg5cX+Z9O2pS+F
	 6P4HQkIbAvLw6HfPqKTQK0/xnGa4UTk2UoF2Kl2o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A565F80C93;
	Wed, 15 Mar 2023 16:15:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7E88F805FC; Wed, 15 Mar 2023 16:10:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CCBAF80617
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CCBAF80617
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-0008Em-C5; Wed, 15 Mar 2023 16:08:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSji-004Kax-Sz; Wed, 15 Mar 2023 16:08:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-0057hs-G3; Wed, 15 Mar 2023 16:08:17 +0100
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
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 094/173] ASoC: Intel: bytcht_es8316: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:26 +0100
Message-Id: <20230315150745.67084-95-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=CLY5Z8vV7vd/CgtJa6KA5gKNMMbpMVJf4QlK8YL7Es4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5GyVg7enwY9EpFYKjYpS7WwuZzdCIzYzyf4
 4TRR5FU0FeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeRgAKCRDB/BR4rcrs
 CbZ+B/9h4IfCdvFBYOCE2IZOCKclMwTiyyvlLYn1ANm18hOkR5JZw6EGQIIh38bDab9oBO7YU0V
 9c04nWnHU61+kxivcTUxGLwPsMjQyJ8hvxkyppC4Q2AJf3DPkqudIhB/NZBhvP2srDyzpYDHn0e
 Vz7du36H38JY/CjqRsnSaA35VpBLSuDYUyszZY91IGGnDzNU4987ZA6/k0SHvbztp0IbznGXrqU
 blCUyzQffduAxrpzxJJQTXCN1lR/PkyjdTBUjEvP0BtMfqQZSqMyPSxczK+RqOMQSlX4CV+TlWt
 tOkSy7o5Xd682QeTJMjPmmSECt/IhQ5jKspsYlOX2lOojAth
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 7LR6DHCYUIBEIRPYGGPGWTWAUTJKXLTH
X-Message-ID-Hash: 7LR6DHCYUIBEIRPYGGPGWTWAUTJKXLTH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LR6DHCYUIBEIRPYGGPGWTWAUTJKXLTH/>
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
 sound/soc/intel/boards/bytcht_es8316.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index df157b01df8b..7a30d2d36f19 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -628,7 +628,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
+static void snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
@@ -636,7 +636,6 @@ static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
 	gpiod_put(priv->speaker_en_gpio);
 	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
-	return 0;
 }
 
 static struct platform_driver snd_byt_cht_es8316_mc_driver = {
@@ -644,7 +643,7 @@ static struct platform_driver snd_byt_cht_es8316_mc_driver = {
 		.name = "bytcht_es8316",
 	},
 	.probe = snd_byt_cht_es8316_mc_probe,
-	.remove = snd_byt_cht_es8316_mc_remove,
+	.remove_new = snd_byt_cht_es8316_mc_remove,
 };
 
 module_platform_driver(snd_byt_cht_es8316_mc_driver);
-- 
2.39.2

