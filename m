Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A30708920
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 22:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725D31FA;
	Thu, 18 May 2023 22:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725D31FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684440607;
	bh=kXEoI/MUqXSOlgrXvsOJmCghoMDgJk9+/YDxliWR/9w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rsw9jPyUh+Q7B1/PdfkOnL8HrwcoUYFWQpcuX8/qHgaLJi7Xrxm9SlWsR7RZxUZe+
	 MPvEgRbMrA0ppLhfYZ6YoKhDX3UA7GKnRZdbufj3tjTKJi5KRzj14gONsb1DjjsBiQ
	 ncdc18lQn41nE0Ol+KvUfHQZbw2OkZryVIIkgJmI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C2C4F80272; Thu, 18 May 2023 22:08:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46065F80087;
	Thu, 18 May 2023 22:08:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE91CF80272; Thu, 18 May 2023 22:08:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C0C9F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 22:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C0C9F80087
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzjvO-000103-6P; Thu, 18 May 2023 22:08:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzjvL-0019tE-HV; Thu, 18 May 2023 22:08:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzjvK-005kSy-FU; Thu, 18 May 2023 22:08:30 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH] soundwire: amd: Improve error message in remove callback
Date: Thu, 18 May 2023 22:08:23 +0200
Message-Id: <20230518200823.249795-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=kXEoI/MUqXSOlgrXvsOJmCghoMDgJk9+/YDxliWR/9w=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZoW2bhAWVTSOr6/rGPIIzuDYm6TsLGBtuYkyx
 O4txTnChKGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGaFtgAKCRCPgPtYfRL+
 TmmTB/4yRo3GnaGeLWjcsm7sFm1ThXExzfHFYcSssMcKU+8BOWYHF+mTbrikWI1JOuk3eX7VoK8
 u47VxNm13gL/6MccC8EZEdL0SWN5ZG+jzhfpseJzVrcJvRsYE4/SmhQM69XbDsQ0Rfe2pyr7mBc
 f3N22goEAoeoxm4Sae/UmuJbHTimO8Z03Dvavh8JyOnRqERJWwUXzf1q3z+xwOhSL5LfrLwdQtW
 Q2UikhWutWpGoc8+aD8mdW1eAkIp6nQVzFWF9yhFsuWmIs4XaJNrTzoV9oBKW2Gbk4uSbqMOLcf
 kqxGXt+M5uRngTrpwzztqAm2BTC5PTSmv6Myr25HaFEjawsP
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: G5D5ZZOBGCIXRFTSSAIY3U5UIO53UQZI
X-Message-ID-Hash: G5D5ZZOBGCIXRFTSSAIY3U5UIO53UQZI
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5D5ZZOBGCIXRFTSSAIY3U5UIO53UQZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Returning an error code in the remove callback yields to an error
message

	remove callback returned a non-zero value. This will be ignored.

After that the device is removed anyhow. Improve the error message to at
least say what the actual problem is. While touching that code, convert
the driver to the .remove_new() callback which returns no value with the
same effect as returning zero in a .remove() callback.

As the return value is ignored by the core the only effect of this patch
is to improve the error message. (And the motivating effect is that
there is one less driver using .remove().)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/soundwire/amd_manager.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 9fb7f91ca182..08aeb7ed00e1 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -972,15 +972,18 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int amd_sdw_manager_remove(struct platform_device *pdev)
+static void amd_sdw_manager_remove(struct platform_device *pdev)
 {
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
+	int ret;
 
 	pm_runtime_disable(&pdev->dev);
 	cancel_work_sync(&amd_manager->probe_work);
 	amd_disable_sdw_interrupts(amd_manager);
 	sdw_bus_master_delete(&amd_manager->bus);
-	return amd_disable_sdw_manager(amd_manager);
+	ret = amd_disable_sdw_manager(amd_manager);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to disable device (%pe)\n", ERR_PTR(ret));
 }
 
 static int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
@@ -1194,7 +1197,7 @@ static const struct dev_pm_ops amd_pm = {
 
 static struct platform_driver amd_sdw_driver = {
 	.probe	= &amd_sdw_manager_probe,
-	.remove = &amd_sdw_manager_remove,
+	.remove_new = &amd_sdw_manager_remove,
 	.driver = {
 		.name	= "amd_sdw_manager",
 		.pm = &amd_pm,

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

