Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312E6BB7C4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:28:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 178831374;
	Wed, 15 Mar 2023 16:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 178831374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894134;
	bh=FUwigMeYuDJCDw0LdCq5DHTlpTJLYmcpmw8mh5EDCpQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E9WyWomRxHm9j3JbL5q3en5nzhnURVb5pL+AxTUyvJH1oIMqo4x/WzOPUK22D29Jj
	 JgctDo+7j6p2TYWgKt9hQXVAj7LS4fpvr59nWFVK83mUXxfLynmtxI0O5v9wl5bFr5
	 zA2yjtJOsGPAia1QrjBFf7qcs6ho0hXQ+Q3CA2jw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D28F8057C;
	Wed, 15 Mar 2023 16:12:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD1B3F805C2; Wed, 15 Mar 2023 16:09:34 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E6D1F805C6
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E6D1F805C6
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-0007xH-K0; Wed, 15 Mar 2023 16:08:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-004KZo-4I; Wed, 15 Mar 2023 16:08:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0057gy-D9; Wed, 15 Mar 2023 16:08:14 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 080/173] ASoC: fsl: mpc5200_psc_i2s: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:12 +0100
Message-Id: <20230315150745.67084-81-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=FUwigMeYuDJCDw0LdCq5DHTlpTJLYmcpmw8mh5EDCpQ=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMaQI3pMzWNlzv5H325mlAgqh81pf3jvQOisolutdVr3cx
 nyRi70cnYzGLAyMXAyyYoosdUVaYhMk1vy3K1nCDTOIlQlkCgMXpwBMxJGR/X9q5c6AvkyudSc7
 XOou7msRK3UMPFcj6mC2J/L1nKkWW5WOXYpZ9MX4+0K3unlKQUtUnsebb7qyU329j36m1fZzRdw
 e5gfKVwjtmSP160kdg5W04CyvI7yVUfflzj7WWTWRwzvohu+jnXczn/89lXJ5go8uo5tSUsCKJb
 aykk3K2wsTZ3bYilfvEg3WY6hZMq31Kbc1B4/w/60TObsvBG5NPbGrbG4w/+r4qu9SCs/rp9Zoa
 5XZJ9587qEkpZubyGZ2Y5XJuxvpuq/qOjkOTja9avPXIif1nabyL7/cWx7aT3NjLKZ0uzOmtYgw
 NhpKHvK53aUp6sl4LnBOl4mQ7tFLJurdO5c+/sz746IBAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: E6PKO2LLQGEDXXGEGQNRUPRFNRGVAUK4
X-Message-ID-Hash: E6PKO2LLQGEDXXGEGQNRUPRFNRGVAUK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6PKO2LLQGEDXXGEGQNRUPRFNRGVAUK4/>
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
 sound/soc/fsl/mpc5200_psc_i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index 73f3e61f208a..413df413b5eb 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -210,11 +210,10 @@ static int psc_i2s_of_probe(struct platform_device *op)
 
 }
 
-static int psc_i2s_of_remove(struct platform_device *op)
+static void psc_i2s_of_remove(struct platform_device *op)
 {
 	mpc5200_audio_dma_destroy(op);
 	snd_soc_unregister_component(&op->dev);
-	return 0;
 }
 
 /* Match table for of_platform binding */
@@ -227,7 +226,7 @@ MODULE_DEVICE_TABLE(of, psc_i2s_match);
 
 static struct platform_driver psc_i2s_driver = {
 	.probe = psc_i2s_of_probe,
-	.remove = psc_i2s_of_remove,
+	.remove_new = psc_i2s_of_remove,
 	.driver = {
 		.name = "mpc5200-psc-i2s",
 		.of_match_table = psc_i2s_match,
-- 
2.39.2

