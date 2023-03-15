Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5B46BB726
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:11:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ED64127E;
	Wed, 15 Mar 2023 16:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ED64127E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893078;
	bh=IvteXbtnscuLrmgSVcYGsRdoHcND0HPu4daEpu6UlBs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LcfLQELE5+RKZhm5jzqX/Q9T/URRcETvSRj0+0D2/1J1XxPE+qFl3XoXROXOpXqv+
	 g0f8fUiLO+ZRfJyttsTYEovmrqUbvS44WkB29lLXt3+2Va/Rd2/NLE7I+9pT7xysPa
	 vfKTrWjAci/dOnKw9JwNiYOzEFyDjlM17K7CLpzI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 027B9F80552;
	Wed, 15 Mar 2023 16:08:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 846EFF805B0; Wed, 15 Mar 2023 16:08:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A86DBF80527
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A86DBF80527
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-00075U-CU; Wed, 15 Mar 2023 16:07:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-004KTe-7z; Wed, 15 Mar 2023 16:07:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjN-0057c1-61; Wed, 15 Mar 2023 16:07:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 003/173] ALSA: pxa2xx: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:04:55 +0100
Message-Id: <20230315150745.67084-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=IvteXbtnscuLrmgSVcYGsRdoHcND0HPu4daEpu6UlBs=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd0wB9ZClaloOs0feuokeJrmOBcQXNF0ASuIZ
 wksw6bZwteJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdMAAKCRDB/BR4rcrs
 Cax2B/wLzBRcVBUHljhTL8MHYSU1QKHl/JlvAKUI56P+WPY5r7VItpNUnIrwwfWI59vspUnsA9M
 zOxqxCgAFh0jLM1CB2UuL88An7VicrsJapmUMStLh9Ap5h3a+IbevCZeszBEdATjFLNNxNpT9jq
 VopSBEJyJgBGCD9uNxJM3kOkOHcg/c3Cui0Kum9lQRz7aXe5W+WzkzHoQqsBc+xzlRHUcCBAKF5
 /GO329amA6fx8/Vc/7Dg06GBusyGVNvBaUmFUSPaPzEu/n/qmnGm+0yhNpIhz8wS8Nq0sNmFGhQ
 +fgxJPR1GadAHyAYJLsIPoutDD+t8DRJI77dl6FF6vaf+i9D
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: OABXJNTT23CIEDZXKCSJ43YBMTUWAKAA
X-Message-ID-Hash: OABXJNTT23CIEDZXKCSJ43YBMTUWAKAA
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OABXJNTT23CIEDZXKCSJ43YBMTUWAKAA/>
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
 sound/arm/pxa2xx-ac97.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index c162086455ad..2d83ad91f968 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -262,7 +262,7 @@ static int pxa2xx_ac97_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int pxa2xx_ac97_remove(struct platform_device *dev)
+static void pxa2xx_ac97_remove(struct platform_device *dev)
 {
 	struct snd_card *card = platform_get_drvdata(dev);
 
@@ -270,13 +270,11 @@ static int pxa2xx_ac97_remove(struct platform_device *dev)
 		snd_card_free(card);
 		pxa2xx_ac97_hw_remove(dev);
 	}
-
-	return 0;
 }
 
 static struct platform_driver pxa2xx_ac97_driver = {
 	.probe		= pxa2xx_ac97_probe,
-	.remove		= pxa2xx_ac97_remove,
+	.remove_new	= pxa2xx_ac97_remove,
 	.driver		= {
 		.name	= "pxa2xx-ac97",
 #ifdef CONFIG_PM_SLEEP
-- 
2.39.2

