Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0BA6BB835
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:43:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8DA149E;
	Wed, 15 Mar 2023 16:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8DA149E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895004;
	bh=080/Jp99onUt6Qr4yc0EkF3M/pkODAXQogbkIc0PYWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rGXcxmb+jFmb63Eq5CrCW8JQ04DcwxjcVX1lDIaIOtbaGO/AbyMhZjNsSqZvXMvLU
	 46jTckl8+1Fd5MXEQgq1usC1QIfJyQYIeKBnlaxi2j87ffHoq7cR/CYtYatTYgJVN7
	 LhqEKnawUQIkvnvQGgpS0iJaa6kaLUgZQCyAZ59s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF8C4F80C81;
	Wed, 15 Mar 2023 16:15:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C13A5F805C8; Wed, 15 Mar 2023 16:10:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 16ED9F80614
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16ED9F80614
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSk4-0000kH-19; Wed, 15 Mar 2023 16:08:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjz-004Kh2-C7; Wed, 15 Mar 2023 16:08:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0057mv-OQ; Wed, 15 Mar 2023 16:08:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 172/173] ALSA: sparc/cs4231: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:44 +0100
Message-Id: <20230315150745.67084-173-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=080/Jp99onUt6Qr4yc0EkF3M/pkODAXQogbkIc0PYWQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd82YExnbuSixDsNF0HHLCqy9SemtNGJY35nb
 HuB6Me8mKGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfNgAKCRDB/BR4rcrs
 CdqzB/9lmVrGayNjRErUfxzxQUZDWYURKdGf47rJ8jgDLKl/5Imc+tgLx/tymmkRFgGjAckfJyZ
 CE8qtuo9qA7oTqCmDVWRvec9NKGirBPqzFJW4HQ8RyhpqEkTEqsQF4Llw23aywTprXBy31bhn+O
 VvAEmkpomjfEfRJrwZY7EWF9IgJAWbUQT2TRpnTOgsGQShV7R5QiycqjZycYG/E4dWzsPx18zgs
 nKRL60Rv/uUKtcnTxQ3Zxl2AxXInvLfb41OK3UiExntLY3OLvYyTT5K8LJkr8Id1n9wFcJnn2HK
 5VC9/xKtzrx9yyGZj8FuK9brL2bTSTIV6kOH1WQsVAJ4aTV0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 5766A3EHKWTXRUPQHCYG4FHGKGWLH4YG
X-Message-ID-Hash: 5766A3EHKWTXRUPQHCYG4FHGKGWLH4YG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5766A3EHKWTXRUPQHCYG4FHGKGWLH4YG/>
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
 sound/sparc/cs4231.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 2942c8c7a236..31bac355ec4d 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -2069,13 +2069,11 @@ static int cs4231_probe(struct platform_device *op)
 	return -ENODEV;
 }
 
-static int cs4231_remove(struct platform_device *op)
+static void cs4231_remove(struct platform_device *op)
 {
 	struct snd_cs4231 *chip = dev_get_drvdata(&op->dev);
 
 	snd_card_free(chip->card);
-
-	return 0;
 }
 
 static const struct of_device_id cs4231_match[] = {
@@ -2097,7 +2095,7 @@ static struct platform_driver cs4231_driver = {
 		.of_match_table = cs4231_match,
 	},
 	.probe		= cs4231_probe,
-	.remove		= cs4231_remove,
+	.remove_new	= cs4231_remove,
 };
 
 module_platform_driver(cs4231_driver);
-- 
2.39.2

