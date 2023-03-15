Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D32AE6BB86E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7AE1519;
	Wed, 15 Mar 2023 16:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7AE1519
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895415;
	bh=wz4JaAqwfndZ/27pVHObLVq7KIs3mkSYU0vvTlqtGVk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=obN7vAlo1a6OOAoEP3S/N7ZLA/LqJBHwXrMzMHb7wldklVJd5B5mOEGqzaZa4fC0v
	 0syiv9shVxyqhXjHKDRHCS10Gssjo7SfkA+TItl8SIgvxHO34tJMmhAtgIYI+sgYMZ
	 S9v3TuSa0ONM93T+39b1FXNgDx7DurGtYJbCNjIA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 485BEF805F0;
	Wed, 15 Mar 2023 16:16:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 241F4F8061C; Wed, 15 Mar 2023 16:10:48 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DA3A9F80633
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA3A9F80633
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjn-0008KC-P3; Wed, 15 Mar 2023 16:08:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-004KbZ-8A; Wed, 15 Mar 2023 16:08:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSji-0057iD-OW; Wed, 15 Mar 2023 16:08:18 +0100
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
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 100/173] ASoC: Intel: sof_pcm512x: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:32 +0100
Message-Id: <20230315150745.67084-101-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=wz4JaAqwfndZ/27pVHObLVq7KIs3mkSYU0vvTlqtGVk=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5Z7oF5bmIHqmJ8Jkeb117SNqw9IR9nqRdUT
 Uy46WrLvqeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeWQAKCRDB/BR4rcrs
 CU9HB/9+PF79G+NBerhnls93epUWB1mfZuQphaNWDUI1BZM32bm2VDLFdJgxH40NLwTtItfnRTY
 +Y+0TL2/Grboz5jVOJu+N/OFL2Q1BoORbbXMq/c0VyEwv2WibItGz2MnjQ/ZuI8RbEgsqLBSKL2
 BG+tkr/11S0RkVQ947QIWtG3y0/1t6UKk4+IZpMgYzaNXyrT3PDFtTRBe1cb8xxXUCqCDcqLYv3
 6bzKpxH6ycJvdujc1FL7ZiGZ/Do88MA3TeH+F46lNY447PP75AfiSjeWeyldT4Cfevb6wjZ1OsD
 vuEfbV8HdNjqlJHiSS/NnkE0lGhuL6qXd7tdezcfgP5ku3Px
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: WFBEDG7RPN6AI4ADGH3OXLBQDQDMLEPF
X-Message-ID-Hash: WFBEDG7RPN6AI4ADGH3OXLBQDQDMLEPF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFBEDG7RPN6AI4ADGH3OXLBQDQDMLEPF/>
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
 sound/soc/intel/boards/sof_pcm512x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index d4c67d5340a9..5192e02b3cee 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -416,7 +416,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 					  &sof_audio_card_pcm512x);
 }
 
-static int sof_pcm512x_remove(struct platform_device *pdev)
+static void sof_pcm512x_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct snd_soc_component *component;
@@ -427,13 +427,11 @@ static int sof_pcm512x_remove(struct platform_device *pdev)
 			break;
 		}
 	}
-
-	return 0;
 }
 
 static struct platform_driver sof_audio = {
 	.probe = sof_audio_probe,
-	.remove = sof_pcm512x_remove,
+	.remove_new = sof_pcm512x_remove,
 	.driver = {
 		.name = "sof_pcm512x",
 		.pm = &snd_soc_pm_ops,
-- 
2.39.2

