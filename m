Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8826BB737
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:13:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC4E1267;
	Wed, 15 Mar 2023 16:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC4E1267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893190;
	bh=w4dLN8vnz0yCwrrxTh+pYlgW8ahlVuhDBIx/FCLxdP8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t7oYW1b5Bl4m2KlzX7kFZb02JA1zp1Clom63/Vm++0UFxosorKv8uABlIQTPFTBvr
	 5hCqMIU48pRQr85O8+klsefLLvWe2U+V8gV720O4FboOl2mVIrd15aIsS4fWWGLdUr
	 TF4pg+COG/pZgb0Iq2IUt7Rxvq72LKCCQvsDIG4I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B26DEF80654;
	Wed, 15 Mar 2023 16:09:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3C14F805E5; Wed, 15 Mar 2023 16:08:28 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D4BCF80482
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D4BCF80482
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-00075c-PP; Wed, 15 Mar 2023 16:07:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-004KTy-3i; Wed, 15 Mar 2023 16:07:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-0057cF-18; Wed, 15 Mar 2023 16:07:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 007/173] ALSA: mips/hal2: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:04:59 +0100
Message-Id: <20230315150745.67084-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=w4dLN8vnz0yCwrrxTh+pYlgW8ahlVuhDBIx/FCLxdP8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd09SBHfUjCSVLdffqXVvpqqUTipN8SdjwKpR
 x3BwH0I2MSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdPQAKCRDB/BR4rcrs
 CTtaCACWs4vsGeD5p/wYsFYpwLVXLpnS57bjDFNvj0briuTOfEpDp+wU8fN3DIFpXwH1i5+xvyk
 pd2gOu+ANwE5ysJdgKhaV0JlPAyd2Wnh0IFdLFodNqeDP2dk0OnJIHBtT/y30002OrHwzPhb/ru
 LJR0jYKvMHi2H97idHI4povsOV84E4M/sRWuUcAX8steApa88Yy7mR9ZRWhzxvIEJ3EWA1xPiyA
 S1gwYQm+EY6xtEGLhmLNXPW2dEwc13FzPiV2byfVbUuVZZDdfOixWqM7pPYRnEZEGyEmZi3c7CJ
 5psRY2nTmXcvls4oFVukzWv2lKXM9mlzYMt/KWeYXRiAla/8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: YBXUDU4FPSTWCOTDMEA2JIYNFCMTPLID
X-Message-ID-Hash: YBXUDU4FPSTWCOTDMEA2JIYNFCMTPLID
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBXUDU4FPSTWCOTDMEA2JIYNFCMTPLID/>
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
 sound/mips/hal2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index 9ac9b58d7c8c..3c26334227bb 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -877,17 +877,16 @@ static int hal2_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int hal2_remove(struct platform_device *pdev)
+static void hal2_remove(struct platform_device *pdev)
 {
 	struct snd_card *card = platform_get_drvdata(pdev);
 
 	snd_card_free(card);
-	return 0;
 }
 
 static struct platform_driver hal2_driver = {
 	.probe	= hal2_probe,
-	.remove	= hal2_remove,
+	.remove_new = hal2_remove,
 	.driver = {
 		.name	= "sgihal2",
 	}
-- 
2.39.2

