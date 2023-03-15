Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E826BB705
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:09:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFA70125F;
	Wed, 15 Mar 2023 16:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFA70125F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678892940;
	bh=BkYNWOii/aSgu1cgSXnsKX3v2rEwZqQ8wOTwIf7xwoU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ph6BpNz6QLu2kzqSlAKekF0bkaVL+Tfk844BrPcX1reTzl2zy/PfXmmST2ppaEPJ3
	 v7vMWZrZHrquSEOzmbHc0uotNcM5LBqfw6BRlCLGFIRgC9h5w/T5C/1aFa2ia4xm3+
	 fxvPB1+ctOP7SoIO2/Bnwhb0Qc8OcoxLegkC7dbA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8599F80533;
	Wed, 15 Mar 2023 16:08:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BE0FF8016C; Wed, 15 Mar 2023 16:08:06 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DDAAEF8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDAAEF8016C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-00075X-Df; Wed, 15 Mar 2023 16:07:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-004KTo-N4; Wed, 15 Mar 2023 16:07:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjN-0057cA-Qn; Wed, 15 Mar 2023 16:07:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 006/173] ALSA: portman2x4: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:04:58 +0100
Message-Id: <20230315150745.67084-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=BkYNWOii/aSgu1cgSXnsKX3v2rEwZqQ8wOTwIf7xwoU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd06tvs2NB1EuKqgYoRJLZvrhg3w9QUZ4qGSo
 YEoKMKzADaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdOgAKCRDB/BR4rcrs
 CTRzB/9WQtnzMVowaVMqs9/JoqZz5nB/oVmCn0P+SmY0qTYf4sAyze2uQKtVRmC3ZC68Ib+myLd
 nsijtaWfcn/R+G1PQJoqRkNinLDpDinDwzLRZL4NipQzrlv5rCD9RQ7x7xqvUM2I7wzlQTASwwp
 5x59u2f3QjUd0NZrjbfvkAfEYFjCxI5z0Mxuf3XtbjGoaFRtQxu2hrV7oka3Qo8BU3+fwgiWQlo
 ee8DYvM7w49nZ8XstI4N9/wDQNV7mKZQlKgKX7iO16Ct7lkvJyWhrhLHPfalgkolmIOjck5odBT
 LTQN6Y314SbK7rwn8KRlAqIiNyC6aBxDYO34tTAmjiT49Uee
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: I27IESJDVMOD7C2AXNJRM6BQNFU4WUI7
X-Message-ID-Hash: I27IESJDVMOD7C2AXNJRM6BQNFU4WUI7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I27IESJDVMOD7C2AXNJRM6BQNFU4WUI7/>
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
 sound/drivers/portman2x4.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index 52a656735365..a515c13a489f 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -795,20 +795,18 @@ static int snd_portman_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int snd_portman_remove(struct platform_device *pdev)
+static void snd_portman_remove(struct platform_device *pdev)
 {
 	struct snd_card *card = platform_get_drvdata(pdev);
 
 	if (card)
 		snd_card_free(card);
-
-	return 0;
 }
 
 
 static struct platform_driver snd_portman_driver = {
 	.probe  = snd_portman_probe,
-	.remove = snd_portman_remove,
+	.remove_new = snd_portman_remove,
 	.driver = {
 		.name = PLATFORM_DRIVER,
 	}
-- 
2.39.2

