Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0D6BB7DF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:32:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8DF1374;
	Wed, 15 Mar 2023 16:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8DF1374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894374;
	bh=OGPo9ZzjFiyT3hFV+92ViHoT5jJAEqeRXaGwuuIK6xw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E7HcGCt8n8S4S4U+vt10L82NuoO9EubNSH1xQ/g4Xhjs72G7xORWD29FP4xXedOjK
	 H1LcAZFN8bXL5xw1ZMWQvHum7yR25z5WLdkiRFP8rtJ6tv3oMp8kJ1Zu9uctXdXEnJ
	 /Fo/m2fFpekAJudHHnTpjy7h+3Zu1Y1xW3rpqy1g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62D18F8074B;
	Wed, 15 Mar 2023 16:13:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E7F9F805D8; Wed, 15 Mar 2023 16:09:48 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A1B0F805EA
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A1B0F805EA
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-0008GC-LO; Wed, 15 Mar 2023 16:08:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-004Kb6-Az; Wed, 15 Mar 2023 16:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjg-0057hc-JF; Wed, 15 Mar 2023 16:08:16 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 090/173] ASoC: img: img-spdif-out: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:22 +0100
Message-Id: <20230315150745.67084-91-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OGPo9ZzjFiyT3hFV+92ViHoT5jJAEqeRXaGwuuIK6xw=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd46atZtvUe29pMPmzx2RVlbEtjx8sjEIxX5n
 5bK4YirQD2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeOgAKCRDB/BR4rcrs
 Cb5cCACJB9Cy9BthaghIPAVeGJPO0PlczsgJh0C1W+BqqhUzkFTwA97TzD/vrgrBmm57KEwe+xV
 34H0ifVbbPLUafe/5a+vXt4t4Hio/8bHIZbd3249CHLp6fbWe3nYGcJx4B9leiZKwj+gOu2Z19O
 B6f8/XxZm5DZBOVhga83TZQ/EDMpWz8VmihNUp3715tvNy4wwU4U+iAChv/OqTO28JN4nPet0IT
 kBvMfyG8MpEVBAPwPjAm+2fEsLnfyNqOvHZG1WCmnMAahO06rX1X7rt8M+VI4gImlXNCzJoks9z
 d3vmJ0d0UK820q90J9/RtQBcDMIFOdNgn9I/HrdP+XC1acKn
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: L3CKEDNEX3RQHRPQVAEJ4DJ3AI2TVGHG
X-Message-ID-Hash: L3CKEDNEX3RQHRPQVAEJ4DJ3AI2TVGHG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L3CKEDNEX3RQHRPQVAEJ4DJ3AI2TVGHG/>
List-Archive: <>
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
 sound/soc/img/img-spdif-out.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index 983761d3fa7e..b13e128e50d6 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -402,13 +402,11 @@ static int img_spdif_out_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int img_spdif_out_dev_remove(struct platform_device *pdev)
+static void img_spdif_out_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_spdif_out_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -470,7 +468,7 @@ static struct platform_driver img_spdif_out_driver = {
 		.pm = &img_spdif_out_pm_ops
 	},
 	.probe = img_spdif_out_probe,
-	.remove = img_spdif_out_dev_remove
+	.remove_new = img_spdif_out_dev_remove
 };
 module_platform_driver(img_spdif_out_driver);
 
-- 
2.39.2

