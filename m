Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE66BB760
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:17:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20CE8129A;
	Wed, 15 Mar 2023 16:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20CE8129A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893424;
	bh=neTkn49x53sgf094UGptZRoSBFcVnyyQ5wca+wZPWrI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dB9v/jFi/nN3GyWBa0skfNHZXR9p9P9s727gLOw4vIK6tS7rl45MInh+u0UoDPDg3
	 nh8/yTmBskX5NOACx4e95OznAW0Mvj6KqIS33+Zb4tV+Z+7d6MFSUQXoEgTqXIEfY0
	 XIYAoRWJecSAj0pzmx27Qu6pjvaL7B2UatarSI2c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC758F805E7;
	Wed, 15 Mar 2023 16:10:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5568F80620; Wed, 15 Mar 2023 16:08:47 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FE2CF8055B
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE2CF8055B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjV-0007Ld-FV; Wed, 15 Mar 2023 16:08:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-004KW3-If; Wed, 15 Mar 2023 16:08:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-0057e0-Sh; Wed, 15 Mar 2023 16:08:03 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 034/173] ASoC: au1x: ac97c: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:26 +0100
Message-Id: <20230315150745.67084-35-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=neTkn49x53sgf094UGptZRoSBFcVnyyQ5wca+wZPWrI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2PDwUX6dQjG6ySbuvvQ+AB13xHkWAFOU0/M
 GAUlMaEuZWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdjwAKCRDB/BR4rcrs
 CZlRCACaeDKTn3klALko3rgHRuRBds5cruGNsO7q/aS+pt4dZsStO9QOkzViJ5i87eTFFC2n4+P
 Pwd2+xwWZSv3ItVWjqQ58RIpGSmbkq8gm9kwqftH6kmqvcvxCmgck5x6NRZ8SunIXkUuKV4EDs6
 BI7Zez6N/07G6QVC2nQVuGWpRUNBeu/B/7j3OIYdNh0BZ86Op/prUnANuh8RNQK6H9F3WuQswKt
 WtvxGBVewc3pcSfkR3Ka6u6nIlwCbATxwhtas4qh3Z1uSDvTQkLuunTpnC2SLSfg5BvKjObZ4cx
 TfklJ9rP3udD6zKHL+xEhkYEVOGUEU2KwLVjlXnhANny9+gN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: A2V3UEDTO32ZQEPXPIAOODBSU37PMVEE
X-Message-ID-Hash: A2V3UEDTO32ZQEPXPIAOODBSU37PMVEE
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2V3UEDTO32ZQEPXPIAOODBSU37PMVEE/>
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
 sound/soc/au1x/ac97c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/au1x/ac97c.c b/sound/soc/au1x/ac97c.c
index b18512ca2578..a11d6841afc2 100644
--- a/sound/soc/au1x/ac97c.c
+++ b/sound/soc/au1x/ac97c.c
@@ -285,7 +285,7 @@ static int au1xac97c_drvprobe(struct platform_device *pdev)
 	return 0;
 }
 
-static int au1xac97c_drvremove(struct platform_device *pdev)
+static void au1xac97c_drvremove(struct platform_device *pdev)
 {
 	struct au1xpsc_audio_data *ctx = platform_get_drvdata(pdev);
 
@@ -294,8 +294,6 @@ static int au1xac97c_drvremove(struct platform_device *pdev)
 	WR(ctx, AC97_ENABLE, EN_D);	/* clock off, disable */
 
 	ac97c_workdata = NULL;	/* MDEV */
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -338,7 +336,7 @@ static struct platform_driver au1xac97c_driver = {
 		.pm	= AU1XPSCAC97_PMOPS,
 	},
 	.probe		= au1xac97c_drvprobe,
-	.remove		= au1xac97c_drvremove,
+	.remove_new	= au1xac97c_drvremove,
 };
 
 module_platform_driver(au1xac97c_driver);
-- 
2.39.2

