Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 329136BB866
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:48:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A76F41500;
	Wed, 15 Mar 2023 16:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A76F41500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895317;
	bh=Xf5bOoH1MuminEEvN7xrWq25qG+rKH+DUyT1lZpw864=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=miHcd3Vgrd8pu9qwG27ReoD3HoGXr/L0sP+hJV/MOE3vJ/EaTQMOl5IXSBfQST5sM
	 TDdMVHigt6rCZkM1KXCuCqUOLr3tPX8Z58rVj2kTCyfrvNPWGsR0OFTYdjtX9PrePQ
	 2L6xVJQPnB5VDbZuh3DWNkrtqQlDuDniah/VB9ak=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B18B6F896B2;
	Wed, 15 Mar 2023 16:16:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE36AF80614; Wed, 15 Mar 2023 16:10:42 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BCC58F8056F
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCC58F8056F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-0008H9-Pu; Wed, 15 Mar 2023 16:08:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-004KbE-I0; Wed, 15 Mar 2023 16:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-0057hk-2B; Wed, 15 Mar 2023 16:08:17 +0100
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
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 092/173] ASoC: Intel: sst-mfld-platform-pcm: Convert to
 platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:24 +0100
Message-Id: <20230315150745.67084-93-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Xf5bOoH1MuminEEvN7xrWq25qG+rKH+DUyT1lZpw864=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5AjIQMsP1ZGmj+E8+PZMMYcWdQIgsKkHCVk
 O64mDbHPaGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeQAAKCRDB/BR4rcrs
 CcQEB/4kPikCvuYbKzprnOo2czc58UQugsjW3XyAx8akyThZEkMmY26c07ChRMLXXQvW22t1BMf
 rVAdaoxXlZhOQVyIZZUWybIsdr1YCNUVTNw9MiIzKqJ8OU617Kc5BZKZuvkFS3vO0k9w9zfQ47U
 qsX+2qmi37Oq/1/TMw+Hk5/O5j+SaMT8UOQXhWrt2FGVHro4sGYGEgsGNkmlX8DDY6Ku+KXZgdf
 y6jEz8cEcGuSm0cnJhqxM7uiJIrhgJcjCjkAOxe48CGkBdTmfCaUPrYLmhTV85TFgFuik5jOb8j
 ZhO+sBjhDYT7EHBaTCviMTTDBtLI8inQmJb8o5CCk+pYWSvK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: CHWJDRLMY4LDFEV3ML3YIYBGA6QUJJMQ
X-Message-ID-Hash: CHWJDRLMY4LDFEV3ML3YIYBGA6QUJJMQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHWJDRLMY4LDFEV3ML3YIYBGA6QUJJMQ/>
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
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index c75616a5fd0a..ba4597bdf32e 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -741,10 +741,9 @@ static int sst_platform_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sst_platform_remove(struct platform_device *pdev)
+static void sst_platform_remove(struct platform_device *pdev)
 {
 	dev_dbg(&pdev->dev, "sst_platform_remove success\n");
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -813,7 +812,7 @@ static struct platform_driver sst_platform_driver = {
 		.pm             = &sst_platform_pm,
 	},
 	.probe		= sst_platform_probe,
-	.remove		= sst_platform_remove,
+	.remove_new	= sst_platform_remove,
 };
 
 module_platform_driver(sst_platform_driver);
-- 
2.39.2

