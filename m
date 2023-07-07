Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4E274ABF5
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 09:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80896847;
	Fri,  7 Jul 2023 09:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80896847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688715146;
	bh=SlwWyGQEB/5m0ClT/yqm66jH3AyMvUiN68hHHgzHwwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kJ7FsiaYgAeW6yd/M12KwJEHWRW/ZAMgIhLJDHcPc3QymcRvrY/gr7IdcX6a12YUJ
	 HQRpomSH2cCp61u3rkAkGVHjJyTe+aBihAd1bhEHWqbSJsn5aEAVLFxbL06P6lmizf
	 pXQjIQntxPsk7zYIGwofoCO9elWtomCydECCEW9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4707FF80567; Fri,  7 Jul 2023 09:30:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06C2CF80558;
	Fri,  7 Jul 2023 09:30:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F054DF80124; Fri,  7 Jul 2023 09:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E9DFF80125
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 09:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E9DFF80125
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHftX-0002hX-K0; Fri, 07 Jul 2023 09:28:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHftV-00CgFb-AW; Fri, 07 Jul 2023 09:28:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHftU-002wny-FW; Fri, 07 Jul 2023 09:28:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH 2/2] ASoC: starfive: jh7110_tdm: Convert to platform remove
 callback returning void
Date: Fri,  7 Jul 2023 09:28:30 +0200
Message-Id: <20230707072830.3395789-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707072830.3395789-1-u.kleine-koenig@pengutronix.de>
References: <20230707072830.3395789-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=SlwWyGQEB/5m0ClT/yqm66jH3AyMvUiN68hHHgzHwwk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkp76ak74n5INXqOlRqRhdVToU9BVrBEUeqpW3X
 F7T+a95S1mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKe+mgAKCRCPgPtYfRL+
 TmsACACMotSzVL0h4oW8CBuMsv2hA9cENh+8xX7NDtsx0x998IyaJ1r6ZAFpyYvi9nk5z6NZclc
 4WqJvvY+3GLizbwLIq3KAVTR/6yTzhtMkXaeEUG1ODGkdaFe67nVWGDm9hET0bLei2Pm0WUc4fg
 ve3CUy9QUwqcpN6LlLUHK1PddPNeW5Md3p55KxLsR0eH1lETp3LbmSCR9Z80ADYGNOZB2BxFTz9
 enooCOGF/avaZ7FRGH4QoAINyZ9PLwpwlGSvyl5jS+WvaGTjgY2W//hIWZjALH8KwxuZ2fPNyM1
 b3kYoCOcVeacJaVoKM86JRk0zAA3re4w7BGi9zHQUrjfZLyf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: DNXMHPPDPCOQFDTX6MRZJIF375DH6NO6
X-Message-ID-Hash: DNXMHPPDPCOQFDTX6MRZJIF375DH6NO6
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/starfive/jh7110_tdm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 5f5a6ca7dbda..705f1420097b 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -634,10 +634,9 @@ static int jh7110_tdm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int jh7110_tdm_dev_remove(struct platform_device *pdev)
+static void jh7110_tdm_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static const struct of_device_id jh7110_tdm_of_match[] = {
@@ -661,7 +660,7 @@ static struct platform_driver jh7110_tdm_driver = {
 		.pm = pm_ptr(&jh7110_tdm_pm_ops),
 	},
 	.probe = jh7110_tdm_probe,
-	.remove = jh7110_tdm_dev_remove,
+	.remove_new = jh7110_tdm_dev_remove,
 };
 module_platform_driver(jh7110_tdm_driver);
 
-- 
2.39.2

