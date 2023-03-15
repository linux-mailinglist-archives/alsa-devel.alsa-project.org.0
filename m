Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B546BB79B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:25:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24C5F131A;
	Wed, 15 Mar 2023 16:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24C5F131A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893914;
	bh=fVvWWcSxAWVCYLSgVJ2+mg9xqEfsB3yTrujI5TtKEYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i1NqlPaQoAmVJPKXp0uFhTnnsxn2w9gb5GNoQqt53ms/rxX2CM0PtACufA+8y8ebz
	 +QfJ+/logWJasVf2yScFsrTYH8/6Qn6nLDnJT1lbGP/PB/AnNvzD8+ZJ/hyoNzdU0T
	 myVESdHido2xu5Dpnj3/1cyQtyZrDq5UODN0liU8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5B88F806A0;
	Wed, 15 Mar 2023 16:12:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECE20F8065C; Wed, 15 Mar 2023 16:09:19 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E6E2F805B5
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E6E2F805B5
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-0007eK-HH; Wed, 15 Mar 2023 16:08:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-004KYc-QE; Wed, 15 Mar 2023 16:08:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSja-0057fv-R3; Wed, 15 Mar 2023 16:08:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 064/173] ASoC: fsl: fsl_asrc: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:56 +0100
Message-Id: <20230315150745.67084-65-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fVvWWcSxAWVCYLSgVJ2+mg9xqEfsB3yTrujI5TtKEYQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3uMuLmZAxfoHgJe26zrAkHYfN1zZYOA4oFD
 gntxLorlVGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd7gAKCRDB/BR4rcrs
 CaEqB/9wpFf6xp/MBeIEw1xh9CGYyUDnTISBzgFczQvwHUi5lxtVbonj8QC7dxzGtdEr3OzkCrq
 qRj3Eqyu8Nfps0UnsRdgbgEqetTYqVgsCV4p9blh1/X5AsWS5aOXm2dL9DheDisbGIogTFpvppf
 diXf4I+U9p8g3aL25Dln1Ry8S1TCs8mHIi2lVvOtSGUJ2VOePhXJ59itPcgI5iIiYS8p0+FG+RT
 v+h5MA+0TY0rFSVL8SDNJftnGXOcf7rHty3vjccrjN2UTyKmuvSqmjM4Xmhh72vFvz0/DFAv+YW
 DM3G8QS3VESy84FmQ0w8cy5q7EmM+43H212Up+Z1rZYI9QXD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 5XEQRM67MAKXZYWLP3M7GOPQRC425SNU
X-Message-ID-Hash: 5XEQRM67MAKXZYWLP3M7GOPQRC425SNU
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XEQRM67MAKXZYWLP3M7GOPQRC425SNU/>
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
 sound/soc/fsl/fsl_asrc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index e16e7b3fa96c..adb8a59de2bd 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1252,13 +1252,11 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_asrc_remove(struct platform_device *pdev)
+static void fsl_asrc_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		fsl_asrc_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static int fsl_asrc_runtime_resume(struct device *dev)
@@ -1394,7 +1392,7 @@ MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
 
 static struct platform_driver fsl_asrc_driver = {
 	.probe = fsl_asrc_probe,
-	.remove = fsl_asrc_remove,
+	.remove_new = fsl_asrc_remove,
 	.driver = {
 		.name = "fsl-asrc",
 		.of_match_table = fsl_asrc_ids,
-- 
2.39.2

