Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55F6BB7C3
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:28:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07C9A1379;
	Wed, 15 Mar 2023 16:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07C9A1379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894122;
	bh=RsUrUTlIpuxTKGng9TMntRINqLup1gTtO3ir0dKPmeA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qYKR6ZuC8eQExtZlzOpSn2cXSh1G4WB0tNZEioicIu6lbu6GsOYiS5E9+0sOXJ7p3
	 M+TJH9qp8dfNfwVNz7m+y68PaLz5u615MzKE4myv+X8X6FWAUf0qyTeWij5CdhSp20
	 NR9KKxL486ypt8R8cNygHgEYDXO7PkRK81W1G9RY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80C25F806D8;
	Wed, 15 Mar 2023 16:12:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB6FDF805C3; Wed, 15 Mar 2023 16:09:33 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 91AD6F805C2
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91AD6F805C2
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-0007oF-Jb; Wed, 15 Mar 2023 16:08:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-004KZC-Gi; Wed, 15 Mar 2023 16:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-0057gS-Gw; Wed, 15 Mar 2023 16:08:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 072/173] ASoC: fsl: fsl_sai: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:04 +0100
Message-Id: <20230315150745.67084-73-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=RsUrUTlIpuxTKGng9TMntRINqLup1gTtO3ir0dKPmeA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4GiCmWEMOhsKK1SP7e5BFchKZRwxGpFp6aF
 Q3BVL3LYgKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeBgAKCRDB/BR4rcrs
 CWZHB/90dQMuUrCc+efXqqydr0kG3HapQtUN4xuYo0/uNaE4V5ng/W38pWti6GjhqV88/Bh509k
 vhCWGjOkVgYQGYKlIrN4VJ7U0y1HRHTIro8UOx+fbpDQaBrNCnJYvLBvMEEuE/r5U3dipd7FjMW
 YpGx5m1PQq933k0DET8/+WQ576uHh8hQSwzH2iun3tVgrSVtBHp5LOpraw6feIZecp6m6X1Ihnr
 TmbFkiS2jnZQ6B9vCGCZLA4WxCrfQujYliMfTgRQfv8tUB0AgOoknaK+cUIZYzOwJgw57IVqTXo
 z0PMXW67a8Yr6nuJRwWflYtf5NW9WwgdN1ACdjJvsL/7Ej8H
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: W3WCH7GKPLNMRWQWKRRCF4DRBLDOFYSI
X-Message-ID-Hash: W3WCH7GKPLNMRWQWKRRCF4DRBLDOFYSI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3WCH7GKPLNMRWQWKRRCF4DRBLDOFYSI/>
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
 sound/soc/fsl/fsl_sai.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 1b197478b3d9..a5e56e0484f2 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1489,13 +1489,11 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_sai_remove(struct platform_device *pdev)
+static void fsl_sai_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		fsl_sai_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
@@ -1696,7 +1694,7 @@ static const struct dev_pm_ops fsl_sai_pm_ops = {
 
 static struct platform_driver fsl_sai_driver = {
 	.probe = fsl_sai_probe,
-	.remove = fsl_sai_remove,
+	.remove_new = fsl_sai_remove,
 	.driver = {
 		.name = "fsl-sai",
 		.pm = &fsl_sai_pm_ops,
-- 
2.39.2

