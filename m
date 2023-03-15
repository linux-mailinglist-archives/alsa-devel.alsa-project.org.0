Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCB36BB830
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:43:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6DA6127E;
	Wed, 15 Mar 2023 16:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6DA6127E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894986;
	bh=IWEC0yBSir1p8qLKOBT9FidNS5hMJamm+O1rxQxC9OA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q22h9Ae2JMG95MK2ZZWWXB6E2wzx15o3wv1t7Kk+5QNVnaB9Ogy7x2IvL40zQuhxn
	 OZ/ryXQXJjji9hAYHvdflSffjsTQiPuGbWF6d4xQbinnr2IEjLdtQas9A4/iEFmg+2
	 XjJbl4E0I+G6m8eSHOoQ5Zj5mTv+XSHp/uOOLHO8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24469F805C4;
	Wed, 15 Mar 2023 16:15:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 294A3F805C8; Wed, 15 Mar 2023 16:10:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CDB20F8060F
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB20F8060F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSk1-0000bj-KK; Wed, 15 Mar 2023 16:08:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjx-004KgA-3w; Wed, 15 Mar 2023 16:08:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjw-0057mB-AV; Wed, 15 Mar 2023 16:08:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 161/173] ASoC: ti: ams-delta: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:33 +0100
Message-Id: <20230315150745.67084-162-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=IWEC0yBSir1p8qLKOBT9FidNS5hMJamm+O1rxQxC9OA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8XZP699FFbBIAId68Sk+l4Yao4RLvfeFXqE
 y2rNfu6T+2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfFwAKCRDB/BR4rcrs
 CTxNB/9hJ4vWL80nqJCPeBG4rsxn+2TIHM/DZiDvaakY7D5b8oUsmEKnX2/d0BkXMyKXSizMov/
 KLtw9DJMmL5qNWCL3Rz+WQn4rXH2plJVosaJ2sNsYVVaEDC4RXNEw0FpEODtj+jQfZQDj6ScEs/
 cDbrv2Gfowoz0RBGtXm9aBFby8rTnWwxPp73DPGNTpUl/kKC3TUFQH3uJ0rbT32/GX8NyuHPQPc
 YF2BXn5B034MbI9mMEP7i6Y/YgasehuwHIhppsvOTXYPoaycMlxCFhUReG7HEKlVA8aerdCrZ0o
 m/Lcf0DMfP9E7a/MS8Ss7B+Z9vBtwdI6+MhqX9OCik+x8dzs
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: XX2HHN2ZRALMFTN6CUMHSFV6QWGE7QOR
X-Message-ID-Hash: XX2HHN2ZRALMFTN6CUMHSFV6QWGE7QOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XX2HHN2ZRALMFTN6CUMHSFV6QWGE7QOR/>
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
 sound/soc/ti/ams-delta.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 438e2fa843a0..1028b5efcfff 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -578,7 +578,7 @@ static int ams_delta_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ams_delta_remove(struct platform_device *pdev)
+static void ams_delta_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
@@ -586,7 +586,6 @@ static int ams_delta_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_card(card);
 	card->dev = NULL;
-	return 0;
 }
 
 #define DRV_NAME "ams-delta-audio"
@@ -596,7 +595,7 @@ static struct platform_driver ams_delta_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = ams_delta_probe,
-	.remove = ams_delta_remove,
+	.remove_new = ams_delta_remove,
 };
 
 module_platform_driver(ams_delta_driver);
-- 
2.39.2

