Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FB6BB713
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:09:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DC81260;
	Wed, 15 Mar 2023 16:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DC81260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678892990;
	bh=NleyZkadgk6QDJ9AqpB9dnDZQQnygS3aIOAaaGjbqlE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F34Xp0T3EGLeUBNBs19fkgI1RlhN37xAQ5LvdwlWrAyv13i+XhbHojFz0gF8Mj7E/
	 mr70RxfzWPKuooOae6ZBwoIFhHEBTCFkAkD85dTMamEcyKONVIlExCsJp2UTGYsYPf
	 UQC2wG5Xph+afoLNRIh64ZhS+MCR21aZuRutspFg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17D13F8055A;
	Wed, 15 Mar 2023 16:08:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F7ECF8052E; Wed, 15 Mar 2023 16:08:08 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6927EF80423
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6927EF80423
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-00075V-C5; Wed, 15 Mar 2023 16:07:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-004KTj-Ja; Wed, 15 Mar 2023 16:07:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjM-0057bv-Ml; Wed, 15 Mar 2023 16:07:56 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 001/173] ALSA: sh: aica: Drop if blocks with always false
 condition
Date: Wed, 15 Mar 2023 16:04:53 +0100
Message-Id: <20230315150745.67084-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=NleyZkadgk6QDJ9AqpB9dnDZQQnygS3aIOAaaGjbqlE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd0qs7Vjm/klISlUsENliYlRQVLOL0A39QHid
 5PingNhNn6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdKgAKCRDB/BR4rcrs
 CfJnB/9IQjPAAdkuu0yHGMPD+CRdj0sddTmcFmUue7wbUH+eLiN+EQ5uuMMrWndABVT6fozG2nL
 dvpmCrKNAcDYxOTyBbwFSUR6JsqEpRIlvoxYxSe/nIsZiONh2Ov2iTLqRuzjsvXqLuunFShr/kc
 kWltb8AkX3ouAtCTJFqWVVx4GRMMVJZt14NDlCACjwpZokV4WMa9jYQgYvvf1W3lIxMsDb+Wyv4
 rEqqBEWDc6LNa/0PJRifEu4vLjwaAIMm3PazpCPeJ7zqnSm6l4sR+RHfBlA3eLxdpg7ZY0fqh3C
 Rl0H8RCcC6p6RK2/fetolX8ylsGxPQbj/RH0Vf9RAm3Uf9MD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: JVP2U2SELQS6WFISLTIRC5YDT7X7MMIK
X-Message-ID-Hash: JVP2U2SELQS6WFISLTIRC5YDT7X7MMIK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JVP2U2SELQS6WFISLTIRC5YDT7X7MMIK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_aica_remove() is only called after a successful call to
snd_aica_probe(). With the latter it's sure that platform_set_drvdata()
was called with a non-NULL argument. So platform_get_drvdata() won't return
NULL and the check can be dropped.

This prepares converting platform driver remove callbacks to return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/sh/aica.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 6e9d6bd67369..459c907655d9 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -543,8 +543,6 @@ static int snd_aica_remove(struct platform_device *devptr)
 {
 	struct snd_card_aica *dreamcastcard;
 	dreamcastcard = platform_get_drvdata(devptr);
-	if (unlikely(!dreamcastcard))
-		return -ENODEV;
 	snd_card_free(dreamcastcard->card);
 	kfree(dreamcastcard);
 	return 0;
-- 
2.39.2

