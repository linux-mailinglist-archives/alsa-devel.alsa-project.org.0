Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA256BB865
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:48:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BA8B14F3;
	Wed, 15 Mar 2023 16:47:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BA8B14F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895305;
	bh=iAXa+gQ5+QmAZ1eedjZp+aDygsbSmdKjE3s1Tf/TVrg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eATajf1e56reMP9Bg6qjUdJ1fr6jP/k7a1VtI9V/x54TeqdJYdGCohoR1v3qm6yQf
	 IE5YI5jBnQxS97Wg0NzcXRDq9tinV9QKmo07MPQYxUV00pmYyrmkVYWdSp0yBngv1L
	 4e5gowLksC0bOahwAbXZTsC3Fuk5L3FVlFHK8bpY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EDA9F8968D;
	Wed, 15 Mar 2023 16:16:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23BC1F80611; Wed, 15 Mar 2023 16:10:42 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E830EF80623
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E830EF80623
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSk3-0000jj-Om; Wed, 15 Mar 2023 16:08:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjz-004Kgz-8L; Wed, 15 Mar 2023 16:08:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0057mr-IK; Wed, 15 Mar 2023 16:08:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Max Filippov <jcmvbkbc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 171/173] ASoC: xtensa: xtfpga-i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:43 +0100
Message-Id: <20230315150745.67084-172-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1800;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=iAXa+gQ5+QmAZ1eedjZp+aDygsbSmdKjE3s1Tf/TVrg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8zyr82aJTdQ8YOVFWIy0tRydHZgVoe8tqp7
 HTWNDs6I9mJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfMwAKCRDB/BR4rcrs
 CQfgB/4i+oODZpz6sNeBnIrqgIdQArDSMtn+UMC8O7CDoowi1eOt4+x03juNePL/rAuLmcd6RIz
 hiJxs8ir2YUIRYTLLVA1GBvEy0jcqvIN9GxX73EgMkm3rlD4YMm/MwKzbjbzohDuXegtq6/Yk5o
 lyfkbaOCvydFhplpg8KUs/V2q7Yb+EQMmcAixdfjmG0ZWmOo3dbod7NNP381wMWEq2r+3tYFYjZ
 sEiAKhoF+qMa5kIriczBBZnyY0lXA1jgXh1VYbN7ohO7EnbHtduiBYGYuMH0oC1aP0iLuVX/ZB3
 PaCAAy7WocwqM92udaRS7WVyXb734JxUsQB/4XnXW49tIglR
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 6BUPCL35CGAAOTYPAMZJJFGZ4VTGBL2T
X-Message-ID-Hash: 6BUPCL35CGAAOTYPAMZJJFGZ4VTGBL2T
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-xtensa@linux-xtensa.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6BUPCL35CGAAOTYPAMZJJFGZ4VTGBL2T/>
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
 sound/soc/xtensa/xtfpga-i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index a8f156540b50..287407714af4 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -605,7 +605,7 @@ static int xtfpga_i2s_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int xtfpga_i2s_remove(struct platform_device *pdev)
+static void xtfpga_i2s_remove(struct platform_device *pdev)
 {
 	struct xtfpga_i2s *i2s = dev_get_drvdata(&pdev->dev);
 
@@ -618,7 +618,6 @@ static int xtfpga_i2s_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		xtfpga_i2s_runtime_suspend(&pdev->dev);
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -636,7 +635,7 @@ static const struct dev_pm_ops xtfpga_i2s_pm_ops = {
 
 static struct platform_driver xtfpga_i2s_driver = {
 	.probe   = xtfpga_i2s_probe,
-	.remove  = xtfpga_i2s_remove,
+	.remove_new = xtfpga_i2s_remove,
 	.driver  = {
 		.name = "xtfpga-i2s",
 		.of_match_table = of_match_ptr(xtfpga_i2s_of_match),
-- 
2.39.2

