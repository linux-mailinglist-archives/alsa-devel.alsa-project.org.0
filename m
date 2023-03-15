Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E038E6BB7BD
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:28:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2700D136C;
	Wed, 15 Mar 2023 16:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2700D136C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894087;
	bh=Xc0FoRlmMy5q9BpGXbbYv2eorEOfMw4JqM5O+cza9d0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cwxsi23XQTN7697zE4ozlhn9Me0985C2nIXzr+GkCymS9+7f3CR2NToiWrm2ehC7x
	 ZPnkaTzGaB1iNVBkIOsBzsYTt3wOLSleVocGR5D41x6eqZUk9C9jtRyCSYSwWirun0
	 s2055hmF4PrIZGGuQeR1aOsumTlKuywAszT1XQUk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 000FEF806D1;
	Wed, 15 Mar 2023 16:12:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45F94F805C3; Wed, 15 Mar 2023 16:09:32 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EFE73F805C4
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFE73F805C4
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-0007cK-Dq; Wed, 15 Mar 2023 16:08:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-004KYK-CR; Wed, 15 Mar 2023 16:08:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjZ-0057fe-OU; Wed, 15 Mar 2023 16:08:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Qilong <zhangqilong3@huawei.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 060/173] ASoC: codecs: wm8997: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:52 +0100
Message-Id: <20230315150745.67084-61-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Xc0FoRlmMy5q9BpGXbbYv2eorEOfMw4JqM5O+cza9d0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3itwiokqKOJvjpavBwhFqL1eOyOB7NsLBNn
 9IT7qX1Y9GJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd4gAKCRDB/BR4rcrs
 CeWKCACAdRYjWiutOSsgHDBQINCrFSVS5KP0NJE3eoAPSsWMdsQdV4WFdyUl4j7b6yn3LI4bwjg
 Lv1Sf/4tDbQu4NK0z/Ga3WQuz1UHLzql3rwYSrIjxswok6N/L2+vHU+XG1UhYu6ObS92dbzVc8z
 UQvbrQyfNWXZAfs6Mwavp2WqF3WXqso1BMeOYcwdfIbfNqjoOJ+fT2qYgPySiuRcg2EeTNttSEz
 UH5im80VJVr5JYn4x1Tsb3EdUJEuVYsXVyex0FoIRZudAcdR8roH2xNx1Ky1CF7FARP9Fx1PcSS
 9Pfr4bImwBzwQ4Y1CBYqzwNAuuyvIne2KN6JBu06t6rxyuZg
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: XC62JXPFHKWLRKHAGNWCLD3CZ3ES2ZM4
X-Message-ID-Hash: XC62JXPFHKWLRKHAGNWCLD3CZ3ES2ZM4
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XC62JXPFHKWLRKHAGNWCLD3CZ3ES2ZM4/>
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
 sound/soc/codecs/wm8997.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index c0207e9a7d53..87442840f0af 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1193,7 +1193,7 @@ static int wm8997_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wm8997_remove(struct platform_device *pdev)
+static void wm8997_remove(struct platform_device *pdev)
 {
 	struct wm8997_priv *wm8997 = platform_get_drvdata(pdev);
 	struct arizona *arizona = wm8997->core.arizona;
@@ -1203,8 +1203,6 @@ static int wm8997_remove(struct platform_device *pdev)
 	arizona_free_spk_irqs(arizona);
 
 	arizona_jack_codec_dev_remove(&wm8997->core);
-
-	return 0;
 }
 
 static struct platform_driver wm8997_codec_driver = {
@@ -1212,7 +1210,7 @@ static struct platform_driver wm8997_codec_driver = {
 		.name = "wm8997-codec",
 	},
 	.probe = wm8997_probe,
-	.remove = wm8997_remove,
+	.remove_new = wm8997_remove,
 };
 
 module_platform_driver(wm8997_codec_driver);
-- 
2.39.2

