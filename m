Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC6F6BB7AD
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:26:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 679ED1315;
	Wed, 15 Mar 2023 16:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 679ED1315
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893980;
	bh=p14DcH32AG7Ktxe05+Ink0Ff/ihkS6ozdHQd/IETROU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KO3cCu2SG/4qIK/14lIB4ljw9zRSY4xPiNIFKYuEwz8uZTFlyzrDNaQPiKrlz3Cq+
	 ARsAhj3CPS9tb1cfU5r9P0ZjR8x4u25zQUH04T/9lyEnNwMbNR+2CkG0qXhVO1/PYY
	 /rMBOA2MR+9sucOlXXfoVHGc/D3Xa9nsN72rPoNo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80C89F806B2;
	Wed, 15 Mar 2023 16:12:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B1B8F8065C; Wed, 15 Mar 2023 16:09:26 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F3DCF805BF
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F3DCF805BF
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0007gW-1u; Wed, 15 Mar 2023 16:08:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-004KYk-4p; Wed, 15 Mar 2023 16:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-0057g2-86; Wed, 15 Mar 2023 16:08:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 066/173] ASoC: fsl: fsl_audmix: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:58 +0100
Message-Id: <20230315150745.67084-67-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=p14DcH32AG7Ktxe05+Ink0Ff/ihkS6ozdHQd/IETROU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd31I/9A4lr9791ZKRRFlqtLTp1eIYSzhtr8B
 b9371qwCoOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd9QAKCRDB/BR4rcrs
 CS8TCACCK38290AID6HfDq+ysqKNir8PuJ1Nhg+EOguGMKWr0AKVTWCubphk3WkxjWeHcByk5l3
 AIlzOfRSHBEXAofFLBh6UmNBYPYC0SBsL7Wazofzn0uem/JyzGFKYdXWilN7J/qhjVnFl5aeZg2
 wGRwE98Cv99QkvFln8buDWX2dUj0JVdmbTxza7os4oPcadrDdp04NEii3X/RfV5ZWT7E0rq1+TT
 PPNae4d5ZUZVgVDL48oi2r5gA79IGDuke+6j11694DfWg9dpF57eK+JxC3+AzQVSq98AWtJME0I
 q6AemPqaMZ10pG8t3l9PYWwEuTu937ljE+hCHkGGddQ5UREZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: MQUIIQRQ7Z3HQFH7F35YCTBYRWA3I4C3
X-Message-ID-Hash: MQUIIQRQ7Z3HQFH7F35YCTBYRWA3I4C3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQUIIQRQ7Z3HQFH7F35YCTBYRWA3I4C3/>
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
 sound/soc/fsl/fsl_audmix.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 672148dd4b23..0ab2c1962117 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -506,7 +506,7 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_audmix_remove(struct platform_device *pdev)
+static void fsl_audmix_remove(struct platform_device *pdev)
 {
 	struct fsl_audmix *priv = dev_get_drvdata(&pdev->dev);
 
@@ -514,8 +514,6 @@ static int fsl_audmix_remove(struct platform_device *pdev)
 
 	if (priv->pdev)
 		platform_device_unregister(priv->pdev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -558,7 +556,7 @@ static const struct dev_pm_ops fsl_audmix_pm = {
 
 static struct platform_driver fsl_audmix_driver = {
 	.probe = fsl_audmix_probe,
-	.remove = fsl_audmix_remove,
+	.remove_new = fsl_audmix_remove,
 	.driver = {
 		.name = "fsl-audmix",
 		.of_match_table = fsl_audmix_ids,
-- 
2.39.2

