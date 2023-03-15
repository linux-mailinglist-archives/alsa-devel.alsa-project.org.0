Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A14066BB720
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:10:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0404C1257;
	Wed, 15 Mar 2023 16:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0404C1257
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893036;
	bh=0bdC0HPEDaphbT9vhOwP+aVxHoOUfBvyiV+L3DS/sgs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dT9BFsgadBaWPpV79f5zFu9vNh5BHJYAOqXKcB+ZgWLwaoT3Km3Oc44Lrik5DnLmS
	 Am8xp8/ihYJ1aYaiP8QjULlrz/aCxwRA5dto68aVQnJ3NEL4xzui700FJyvWmJnKkh
	 HeMPpfrHkXlLNp8h6Do1qKRKKLn8g/OCFE80nBus=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E97BCF805DF;
	Wed, 15 Mar 2023 16:08:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 927E4F80557; Wed, 15 Mar 2023 16:08:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 68105F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68105F800C9
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-0007Be-MH; Wed, 15 Mar 2023 16:08:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-004KUt-7b; Wed, 15 Mar 2023 16:08:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-0057d3-Fl; Wed, 15 Mar 2023 16:08:00 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 019/173] ASoC: amd: raven: acp3x-pcm-dma: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:11 +0100
Message-Id: <20230315150745.67084-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=0bdC0HPEDaphbT9vhOwP+aVxHoOUfBvyiV+L3DS/sgs=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1iV3SineXZRz9A8Ywe7uXh1YO66LlR+iRNq
 PO6Al3hydWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdYgAKCRDB/BR4rcrs
 Cd2DB/9d+kb1ktGpFX2ahWgqnvGkUqeLpTRPNNujN9cB8E8aJcGY+cE3BYNjVahwd7DIk+Rvc26
 2/dNbEAUs+lN6O1ByTI3MJ+NGpI3YecklRHucpVSiY9kgk2yMXPqBqROCgceOVFpeff5RbRGKvs
 su8VHfryKkyyUIPCCcxiqkpBpXKvtYoKZgl4ZGNWUOxAbq84nI1VZTvgV74LyB/OE1z6Dt6M1un
 Y9oHnmMXlSkPqx6CnFeYNyxwZaBM8vXuHr4X+9oYNlSfdLvQk+XqC7Vk2SzOWQ5lHTULQ5gx2j1
 /k6XJcbqMzhF2y+AM/DDFpdDe4NaGXb8dx8W3UnTF3eYsRfS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: SKAMB4YT3SKEVBFSZB67E67I744WYNQA
X-Message-ID-Hash: SKAMB4YT3SKEVBFSZB67E67I744WYNQA
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
Archived-At: <>
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
 sound/soc/amd/raven/acp3x-pcm-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 6aec11cf0a6a..7362dd15ad30 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -421,10 +421,9 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int acp3x_audio_remove(struct platform_device *pdev)
+static void acp3x_audio_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int acp3x_resume(struct device *dev)
@@ -509,7 +508,7 @@ static const struct dev_pm_ops acp3x_pm_ops = {
 
 static struct platform_driver acp3x_dma_driver = {
 	.probe = acp3x_audio_probe,
-	.remove = acp3x_audio_remove,
+	.remove_new = acp3x_audio_remove,
 	.driver = {
 		.name = "acp3x_rv_i2s_dma",
 		.pm = &acp3x_pm_ops,
-- 
2.39.2

