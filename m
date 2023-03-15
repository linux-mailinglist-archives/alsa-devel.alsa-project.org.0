Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D780E6BB73C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:13:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37E4C1260;
	Wed, 15 Mar 2023 16:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37E4C1260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893219;
	bh=se4ZyQSsnSJa//rrcRfTP0Fogj0JtsTdy6bm/wMabH8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cyu6f7fktM48kRWqn7cLL8x0Bl67LADIUgPcx++HKhk2t9DxApK2Fl6rjSd4aNxca
	 hNzRJ8hrLW9vkXWhPl7Lc7CL3AXIK4ZJBh+0hyiaxHFyAxYO8NLYJCk8Tv/TEpPkqI
	 Bx3X+Exhh+f5e8BMvmHe5i4UitflfzGIvw2hagrg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4E52F805AE;
	Wed, 15 Mar 2023 16:09:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 276E6F805E9; Wed, 15 Mar 2023 16:08:31 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 58E87F80425
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58E87F80425
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-00076n-LS; Wed, 15 Mar 2023 16:08:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-004KUM-1A; Wed, 15 Mar 2023 16:08:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-0057cW-RC; Wed, 15 Mar 2023 16:07:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 011/173] ALSA: sh: aica: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:05:03 +0100
Message-Id: <20230315150745.67084-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=se4ZyQSsnSJa//rrcRfTP0Fogj0JtsTdy6bm/wMabH8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1IZhWz34qQDZwvS4w5pILsJnT+SLAPjmTJX
 O3Np68MQm6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdSAAKCRDB/BR4rcrs
 CXbaB/0UPzRj4nUvCYQV9/HTAe0VH/dC0qlT2snbmOAe89dSlueCZcDySQJznZGkvgQw8YqUxpc
 ykaHEljbW/q1QoIEylWSzNdXwtIch7bco+zBMBy6BH16h4E6J/z40y77DSz+pS5/DYPROC0cBIH
 1ltkZUyldu2qynDJUlg6b+4XfkvMGeacnrbXwyzKzU/ZIFGGotldRaZsD4/qNpgs3HDCyFQ5OE7
 23djTMQIuQmXSer5A9KrO+3x/m1awwKmPoamAFCBLWCOrOSisy2OUg2kcUHcP7hMHeJd11Aa/FJ
 umEEMl7tkrxiTBHzmRFmrGBSX2UONgMDiTT9UGQqNa+adGs8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 3VLPHJFYX6ZG6NQODHYZQRDXMF6LO74Z
X-Message-ID-Hash: 3VLPHJFYX6ZG6NQODHYZQRDXMF6LO74Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VLPHJFYX6ZG6NQODHYZQRDXMF6LO74Z/>
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
 sound/sh/aica.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 459c907655d9..320ac792c7fe 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -539,13 +539,12 @@ static int add_aicamixer_controls(struct snd_card_aica *dreamcastcard)
 	return 0;
 }
 
-static int snd_aica_remove(struct platform_device *devptr)
+static void snd_aica_remove(struct platform_device *devptr)
 {
 	struct snd_card_aica *dreamcastcard;
 	dreamcastcard = platform_get_drvdata(devptr);
 	snd_card_free(dreamcastcard->card);
 	kfree(dreamcastcard);
-	return 0;
 }
 
 static int snd_aica_probe(struct platform_device *devptr)
@@ -592,7 +591,7 @@ static int snd_aica_probe(struct platform_device *devptr)
 
 static struct platform_driver snd_aica_driver = {
 	.probe = snd_aica_probe,
-	.remove = snd_aica_remove,
+	.remove_new = snd_aica_remove,
 	.driver = {
 		.name = SND_AICA_DRIVER,
 	},
-- 
2.39.2

