Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 505516BB8A6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:54:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803121566;
	Wed, 15 Mar 2023 16:53:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803121566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895671;
	bh=1ASzZt86yis4aCe6OEj+FqtnlDZuoEFAOf3gLepHO20=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aI46NrwR741rQ27ShTH+4L2dvcxI/+91dABRGPb0v4WsnzLodewpR9aDmCslD6Cp4
	 1g5N1AdCcbWfdbZNSR/YyEynp3SeNQHTlqqaBib0hdxc3QVPl6XkwPhEsng4pwf0wg
	 8Fj0ol3+XLFufbUW300OnsF250JWK8kVgay/TQxQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29C52F805F4;
	Wed, 15 Mar 2023 16:18:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32EADF80624; Wed, 15 Mar 2023 16:11:03 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B076DF80570
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B076DF80570
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjn-0008Hq-8d; Wed, 15 Mar 2023 16:08:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-004KbK-NM; Wed, 15 Mar 2023 16:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSji-0057i9-IC; Wed, 15 Mar 2023 16:08:18 +0100
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
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Turkin <andrey.turkin@gmail.com>,
	Muralidhar Reddy <muralidhar.reddy@intel.com>,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 099/173] ASoC: Intel: sof_es8336: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:31 +0100
Message-Id: <20230315150745.67084-100-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=1ASzZt86yis4aCe6OEj+FqtnlDZuoEFAOf3gLepHO20=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5Ww18B9CZ8jHmkm52t9BH0be8MX9zazDCv3
 oTu9JSys72JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeVgAKCRDB/BR4rcrs
 CeqQB/98l4yj+XLwUdcktxIM7f0wIHDZw52rC9bKNQ0wsGU74aCQXDHpAWC6Hs1wTBWszb6Ignw
 baPqv4JOCGuOqKxx12yhQQnyQ9zNgwjTVGw3clK51q004N3Tj3qRr6/u2s8Binnrt3uqeaHnTh5
 AUyeqNdpwDfv3yeV099jUXw9hlG2coIRWGCW0cYR4Hx2fwsCZOX1kBnR8Opm3h3Lb4sArCM2uAK
 ma4SdZ5cCCiCpB1/MH7/ohRwi0PeTAXIjPUqw1xlJXgGZTgf2kKZRonEyL2NGHX5NUIQhrvVRwu
 QdQYES9G4P5dkMoK3eCFyYq2e0QVQgLNzcElcGS5/3gLmHrm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: BGKMBWGHNB6OWRWCTDDGEG6FPIEOPC5R
X-Message-ID-Hash: BGKMBWGHNB6OWRWCTDDGEG6FPIEOPC5R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGKMBWGHNB6OWRWCTDDGEG6FPIEOPC5R/>
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
 sound/soc/intel/boards/sof_es8336.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 894b6610b9e2..adf5852b2c9a 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -780,7 +780,7 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sof_es8336_remove(struct platform_device *pdev)
+static void sof_es8336_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
@@ -789,8 +789,6 @@ static int sof_es8336_remove(struct platform_device *pdev)
 	gpiod_put(priv->gpio_speakers);
 	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
-
-	return 0;
 }
 
 static const struct platform_device_id board_ids[] = {
@@ -817,7 +815,7 @@ static struct platform_driver sof_es8336_driver = {
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = sof_es8336_probe,
-	.remove = sof_es8336_remove,
+	.remove_new = sof_es8336_remove,
 	.id_table = board_ids,
 };
 module_platform_driver(sof_es8336_driver);
-- 
2.39.2

