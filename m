Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E97C9038
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 00:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9F46DF6;
	Sat, 14 Oct 2023 00:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9F46DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697235828;
	bh=g2V2vrlnHeJrYX5VINthEX/RpkofxwJieO4iq+veUzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FxqluVRGyBuDEkRjTAqTG3Zbwx3GXv5uVQE+2pjYLhoDQjCf2yql/FIjUGJ9dBBFI
	 eglyoMwxoRBTVBE2fAH0YWNbcYAyv7qwLK2RtPD8iv7JwBgpfSQwwqqeGAxZRpcVZa
	 2Si07vPrrgI5C6g8rsipJsWjqmf7rXvNU9L39a84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4A87F805B1; Sat, 14 Oct 2023 00:21:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D515F805AF;
	Sat, 14 Oct 2023 00:21:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58F1CF802BE; Sat, 14 Oct 2023 00:20:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B53C6F80552
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 00:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B53C6F80552
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVw-0003u4-No; Sat, 14 Oct 2023 00:20:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-001UR7-4u; Sat, 14 Oct 2023 00:20:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVu-00FrGw-Rl; Sat, 14 Oct 2023 00:20:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH 3/7] ASoC: starfive/jh7110-pwmdac: Convert to platform remove
 callback returning void
Date: Sat, 14 Oct 2023 00:19:49 +0200
Message-ID: <20231013221945.1489203-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=g2V2vrlnHeJrYX5VINthEX/RpkofxwJieO4iq+veUzs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKcKEYcb7ImaTZYMmTnCG4dWZiMht64O1nfUBY
 8a94Q99vHyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSnChAAKCRCPgPtYfRL+
 TgqQB/9PJw/zSp0d4t4pbM6wlGXVGRk/LzCTRMnrg+ApWHwVED8mWA/rK3nTkhLfQQoL+5LcZY/
 RhJLXbC6PC80SRFYPuc27jokr9qytxn0/MNPwlZKo/1URdOwKtyCrWUnc8GsCiGVfuEA5ttO+9b
 X8GrAJk7w6LbMHxVtN8e2p2gq3o4CIw2u7/n95Bgar15/ytaJHrb37Xwyeh6lHyj4brEKgmckZA
 HF03KPL33kuJfkG2lr6uU4MtoF5tKBoxWOy//xrlQWPwOOSQAnj3CqGJGHnOvHG4JvIws4wA1gf
 6NKgeQVJIa+hRh0YfTWmd3/9YuTKlvgJRM9/GujO/wLYF3Rd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: PZTEIW4TN6HM4BRQSBXUVOUSOMM2PQOB
X-Message-ID-Hash: PZTEIW4TN6HM4BRQSBXUVOUSOMM2PQOB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZTEIW4TN6HM4BRQSBXUVOUSOMM2PQOB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/starfive/jh7110_pwmdac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/starfive/jh7110_pwmdac.c b/sound/soc/starfive/jh7110_pwmdac.c
index 65ee3e339494..4a4dd431b82b 100644
--- a/sound/soc/starfive/jh7110_pwmdac.c
+++ b/sound/soc/starfive/jh7110_pwmdac.c
@@ -498,10 +498,9 @@ static int jh7110_pwmdac_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int jh7110_pwmdac_remove(struct platform_device *pdev)
+static void jh7110_pwmdac_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static const struct of_device_id jh7110_pwmdac_of_match[] = {
@@ -517,7 +516,7 @@ static struct platform_driver jh7110_pwmdac_driver = {
 		.pm = pm_ptr(&jh7110_pwmdac_pm_ops),
 	},
 	.probe		= jh7110_pwmdac_probe,
-	.remove		= jh7110_pwmdac_remove,
+	.remove_new	= jh7110_pwmdac_remove,
 };
 module_platform_driver(jh7110_pwmdac_driver);
 
-- 
2.42.0

