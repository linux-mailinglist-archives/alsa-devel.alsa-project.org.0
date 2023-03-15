Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA766BB7BB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:27:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB76123E;
	Wed, 15 Mar 2023 16:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB76123E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894072;
	bh=4KrXWTDf4zwf+OYLklG7MbvlDBPMg5fJsMKLrEZj0lU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BBYHNjVGlPsccOh4/iKe7ufYdDd/vw4VXcOPc3LRzY45WtL44FXemji7urMtFNRgE
	 NLmRBvikAWuq2kMyjLHs1Qv2CqiVaJ4nd+bhJczZWa0jmpHpxIxUBJj8fhdJTrQjMK
	 jtNB3ELBp5U3yh9HNWP3xlgvmpL9JkRghBrV17mo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD3FF806CC;
	Wed, 15 Mar 2023 16:12:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B972F805C0; Wed, 15 Mar 2023 16:09:31 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EC26BF805C3
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC26BF805C3
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0007km-IP; Wed, 15 Mar 2023 16:08:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-004KZ2-Q9; Wed, 15 Mar 2023 16:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-0057gF-SU; Wed, 15 Mar 2023 16:08:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 069/173] ASoC: fsl: fsl_esai: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:01 +0100
Message-Id: <20230315150745.67084-70-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=4KrXWTDf4zwf+OYLklG7MbvlDBPMg5fJsMKLrEZj0lU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3+oDckhhmheTXcok/jAk62jWM2ZXXO7d8QA
 tG/OVpBLS6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd/gAKCRDB/BR4rcrs
 CU2KCACAOqylsnwSZ46KWtSGC7JjDOHDFfeXRAFNcL814Xzz5MyjfAM39UPjtT/96fpaEmZPW8y
 IvPI9lCpy9w08Z8o2W8Y8Yz/zg8bp/A3HYN/2hSvLZAP95ugLif7JNf9zBjk1aHuxXyJ3PF1RlH
 lSSIjkLosYa5X+v2yHcazKhYRmhUIn9OOt/L4Va1SdSNOqgCB7WzPk6BXgwF+nba22022d7JSrj
 wrdU7t8gXG2aw2VjQgazyYTssn1Jse/OsTPgwSDWOz6yDdiFqFMgIwbrFvQJK4qj4omTbOpvDvQ
 EuKtkfYzkpM8zKn3f8w9iMLByF++VRCMm5Mte6MZ0wvEdGaS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: I37AS5HM3U53RFBSQYBUFVHZXRQPKHXO
X-Message-ID-Hash: I37AS5HM3U53RFBSQYBUFVHZXRQPKHXO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I37AS5HM3U53RFBSQYBUFVHZXRQPKHXO/>
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
 sound/soc/fsl/fsl_esai.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 17fefd27ec90..936f0cd4b06d 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1101,7 +1101,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_esai_remove(struct platform_device *pdev)
+static void fsl_esai_remove(struct platform_device *pdev)
 {
 	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
 
@@ -1110,8 +1110,6 @@ static int fsl_esai_remove(struct platform_device *pdev)
 		fsl_esai_runtime_suspend(&pdev->dev);
 
 	cancel_work_sync(&esai_priv->work);
-
-	return 0;
 }
 
 static const struct of_device_id fsl_esai_dt_ids[] = {
@@ -1200,7 +1198,7 @@ static const struct dev_pm_ops fsl_esai_pm_ops = {
 
 static struct platform_driver fsl_esai_driver = {
 	.probe = fsl_esai_probe,
-	.remove = fsl_esai_remove,
+	.remove_new = fsl_esai_remove,
 	.driver = {
 		.name = "fsl-esai-dai",
 		.pm = &fsl_esai_pm_ops,
-- 
2.39.2

