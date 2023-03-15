Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC216BB7B7
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:27:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DD751341;
	Wed, 15 Mar 2023 16:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DD751341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894038;
	bh=LR7Ysbb8DoWg4s+eEMNYQXIg9WXhYRoMwKCtdwhfAHo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c/OqOH64B9yHY29V8n1cIEJw5frFMAtnj2pY1SVKuKHUqpnAV7TiwHK3x5JrA9MNu
	 1dgra6Ky7I5PU6a6RJ1gIcUB9jrkMhHzZ88ne6OAN6fcGI7WH1SkhFWVal35X+RTRj
	 jcqJJGNLpEa/Quk8k6+1vOlhAf3nvTz3/9cvtuW4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8EC9F80652;
	Wed, 15 Mar 2023 16:12:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E05C9F805B6; Wed, 15 Mar 2023 16:09:29 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B2E6F805BD
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B2E6F805BD
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-0007fy-PF; Wed, 15 Mar 2023 16:08:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-004KYg-2r; Wed, 15 Mar 2023 16:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-0057fz-12; Wed, 15 Mar 2023 16:08:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 065/173] ASoC: fsl: fsl_aud2htx: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:57 +0100
Message-Id: <20230315150745.67084-66-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=LR7Ysbb8DoWg4s+eEMNYQXIg9WXhYRoMwKCtdwhfAHo=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3yokMVlIRyWHb8wddjrJTvStBIqNge+Sqcv
 3AF1QjaFfqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd8gAKCRDB/BR4rcrs
 CeUrCACamU38HAdOs3NZycdXa1YcHbNwTNJqcnZ17pBw9GozzGZGa/+tRDHg+tFB49YM0NxxwAj
 /O9brvOQ4Lt0PixRQLWQPMOoClf+XIyQT/l2RUIBm3A99LSsrvCJzXaG6JB8K+E1Q24vso54ylq
 AZWI8Z5CLjU8BOP7vkbgdZ5tSKb9H9C0dAhTDJGTZnXLE0A7xvTqAJw7a5ruiALP0udlk5fQTnP
 KaRz63mTmIOiYrfzmqhcp9i5MbmJFKWuMSjA/91pcItv9qXdAtDCjX7v/CxAAsFN7yvHpwFZFhW
 d+FBE/srbcicKo7sgluC6hwFJTMvAbSiunG/wes18wHbNyz0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: MT6JUWT54MZPNO6TYZFGUQBCA65YLUYK
X-Message-ID-Hash: MT6JUWT54MZPNO6TYZFGUQBCA65YLUYK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MT6JUWT54MZPNO6TYZFGUQBCA65YLUYK/>
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
 sound/soc/fsl/fsl_aud2htx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index 1e421d9a03fb..46b0c5dcc4a5 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -257,11 +257,9 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_aud2htx_remove(struct platform_device *pdev)
+static void fsl_aud2htx_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused fsl_aud2htx_runtime_suspend(struct device *dev)
@@ -300,7 +298,7 @@ static const struct dev_pm_ops fsl_aud2htx_pm_ops = {
 
 static struct platform_driver fsl_aud2htx_driver = {
 	.probe = fsl_aud2htx_probe,
-	.remove = fsl_aud2htx_remove,
+	.remove_new = fsl_aud2htx_remove,
 	.driver = {
 		.name = "fsl-aud2htx",
 		.pm = &fsl_aud2htx_pm_ops,
-- 
2.39.2

