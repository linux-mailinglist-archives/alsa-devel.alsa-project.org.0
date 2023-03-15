Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CAF6BB81E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:40:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7BDC13A9;
	Wed, 15 Mar 2023 16:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7BDC13A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894816;
	bh=2EZkQh4bCPryjNd8miKoVCiUSUuad0w0KQWPOfXF+Ek=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AWzx0iUP4zEvIZLne4s6T1d5xAlz6mdPmosG2+PjaCFE0ln9sr32HINsQOLT85ac3
	 j+LtRaf9q3U4uAQLZ3+MeAqcKdKYiP2T6QiE9X/byCOvQ79Mi5051a9K/3jXQqHlMN
	 OO3OaBwqzaoYkI9Fb6Yw73uWJOgOsac79RlZpHlQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D5EEF80423;
	Wed, 15 Mar 2023 16:14:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE111F805F7; Wed, 15 Mar 2023 16:10:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 52856F80609
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52856F80609
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-0008Dw-66; Wed, 15 Mar 2023 16:08:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSji-004Kas-K0; Wed, 15 Mar 2023 16:08:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-0057hv-MB; Wed, 15 Mar 2023 16:08:17 +0100
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
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Moises Cardona <moisesmcardona@gmail.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 095/173] ASoC: Intel: bytcr_rt5640: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:27 +0100
Message-Id: <20230315150745.67084-96-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=2EZkQh4bCPryjNd8miKoVCiUSUuad0w0KQWPOfXF+Ek=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5JogqMbXzpYTLvjSkQgDGF9udcw2ZhFUFvI
 h6Uk3M1B3yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeSQAKCRDB/BR4rcrs
 CbZYB/0TwaHEbp/rwVoG3kZyZj2X3vrMcFNkJVR3pLAH0+XBa+/EGHXX7qiPvPQuyFSllST23tU
 Tf8uMo12jZqptDafETdmNa+kKmsLv+NEXZxU5mxMXpAoe6rwn51G1o9K+gqabhOUXPcnToPQGCa
 RA+5xZJH+PdhL7r/+QHS/CDD55YZHfCTKPjewmYXtKV35nX3n6WFPUYv3mdfe8cLaaHmvj6bj+s
 hO/rD89CBPcdNA43FhX+QxwpFVjiyh/SKudliUgTZesr1dwL5ZaSu6hlJJt4PHbdbJye/azSRNa
 eIEpkQnHbPoCE0VIexUfVnMcfDnivrSbFTCMAUWfBbL2XDq5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: WBQGYEX36376UVREPCW7PFQWDYHHHKW7
X-Message-ID-Hash: WBQGYEX36376UVREPCW7PFQWDYHHHKW7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBQGYEX36376UVREPCW7PFQWDYHHHKW7/>
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
 sound/soc/intel/boards/bytcr_rt5640.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 79e0039c79a3..789609eb0884 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1844,7 +1844,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	return ret_val;
 }
 
-static int snd_byt_rt5640_mc_remove(struct platform_device *pdev)
+static void snd_byt_rt5640_mc_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
@@ -1854,7 +1854,6 @@ static int snd_byt_rt5640_mc_remove(struct platform_device *pdev)
 
 	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
-	return 0;
 }
 
 static struct platform_driver snd_byt_rt5640_mc_driver = {
@@ -1862,7 +1861,7 @@ static struct platform_driver snd_byt_rt5640_mc_driver = {
 		.name = "bytcr_rt5640",
 	},
 	.probe = snd_byt_rt5640_mc_probe,
-	.remove = snd_byt_rt5640_mc_remove,
+	.remove_new = snd_byt_rt5640_mc_remove,
 };
 
 module_platform_driver(snd_byt_rt5640_mc_driver);
-- 
2.39.2

