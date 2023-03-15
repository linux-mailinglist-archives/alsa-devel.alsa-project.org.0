Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004EE6BB7BA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:27:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84B741352;
	Wed, 15 Mar 2023 16:26:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84B741352
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894056;
	bh=dDnW86Gv49lCBe7mcignad6VQa0+Mv+vJCSTI6E/ApA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u1/87E5L1FfNysTun4NNrbpoIdvJ/gnKyeojgpoibSf1DCYvOw2gOeq/mBlvemYzx
	 nOyWGpMh7ca1g+ofAt9KlPljn7medEjdMQYRJGI7PEe9mtnYMw8FnmlHSkYK6Hy7pA
	 iJBMpq0SHiGvrk2rnYq7BPDZ/ScWPTiLg4JL/xiE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84BB4F805A0;
	Wed, 15 Mar 2023 16:12:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75AEFF805B6; Wed, 15 Mar 2023 16:09:30 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BFB85F805C1
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFB85F805C1
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-0007mN-A0; Wed, 15 Mar 2023 16:08:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-004KZ7-4v; Wed, 15 Mar 2023 16:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-0057gO-90; Wed, 15 Mar 2023 16:08:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 071/173] ASoC: fsl: fsl_rpmsg: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:03 +0100
Message-Id: <20230315150745.67084-72-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=dDnW86Gv49lCBe7mcignad6VQa0+Mv+vJCSTI6E/ApA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4E3hZje9ZrldUwq37J/08EqTMfAuvM9Ri0o
 d+opEQENRaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeBAAKCRDB/BR4rcrs
 CXcRB/wKAxpo1T8zKiYbnRw0OHFAATABwRDpVypmmzre3YQA2J7b0ByHtJA3GrfhaA9Oj8wzUXV
 B79hrNwI33HRYbYeQWPI23mxiTsFMicb6O53flu+15mEWORrWFxm3UPxsut/yjrmT5ub1rWi7WP
 DqANNJe1MvGIK4Oos/5bfcvb0jZnMHXPxzkTEzm8ZezIiUR+xj5oAemn0mrKhqIvd4LJpdNfXo3
 QfHdd/GxC/I6ROwGzdQ/0B8wbFXQlwMrlXZbZIyQJti8J3iyB3ZrvHs9eOSuUgXlnw7/ByhOTMe
 /I4QYIHvsuTG2E/jXP/EDUI+p9Msly6jMkBT+eKVdSw+bEV+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: Z44EM5ZNNX6F2GDFCQFDXL7HSKBJSTYZ
X-Message-ID-Hash: Z44EM5ZNNX6F2GDFCQFDXL7HSKBJSTYZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z44EM5ZNNX6F2GDFCQFDXL7HSKBJSTYZ/>
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
 sound/soc/fsl/fsl_rpmsg.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 46c7868a2653..15b48b5ea856 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -247,14 +247,12 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fsl_rpmsg_remove(struct platform_device *pdev)
+static void fsl_rpmsg_remove(struct platform_device *pdev)
 {
 	struct fsl_rpmsg *rpmsg = platform_get_drvdata(pdev);
 
 	if (rpmsg->card_pdev)
 		platform_device_unregister(rpmsg->card_pdev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -302,7 +300,7 @@ static const struct dev_pm_ops fsl_rpmsg_pm_ops = {
 
 static struct platform_driver fsl_rpmsg_driver = {
 	.probe  = fsl_rpmsg_probe,
-	.remove = fsl_rpmsg_remove,
+	.remove_new = fsl_rpmsg_remove,
 	.driver = {
 		.name = "fsl_rpmsg",
 		.pm = &fsl_rpmsg_pm_ops,
-- 
2.39.2

