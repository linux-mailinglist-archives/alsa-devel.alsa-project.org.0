Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 333CC6BB714
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:09:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FC611269;
	Wed, 15 Mar 2023 16:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FC611269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678892994;
	bh=Wy+atFV8omMfaAMjInhKahC3a7wojWFSJ3UR3QPaQeM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J1fOnZrkGLDkdXOtHKqf7LGrxooycrYd8+oWos0H2WpAgeZCNYKgip9whSuHrXnnE
	 MnyT8ZDIiI+vo0PQdZNf29vGJWeB7nXJ1GYvejm121/DAUeCs3PaoD9mt2B9vhlM0Z
	 iY7ucGMavcyKn6XemrIHGIKzaH/aG30+1fq4Axac=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B1EF805A1;
	Wed, 15 Mar 2023 16:08:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FBF7F8053B; Wed, 15 Mar 2023 16:08:09 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 373F5F8032D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 373F5F8032D
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-00075r-QJ; Wed, 15 Mar 2023 16:07:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-004KU0-5O; Wed, 15 Mar 2023 16:07:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-0057cI-8K; Wed, 15 Mar 2023 16:07:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 008/173] ALSA: mips/sgio2audio: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:00 +0100
Message-Id: <20230315150745.67084-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Wy+atFV8omMfaAMjInhKahC3a7wojWFSJ3UR3QPaQeM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1AzLG6h6NXB8BIAsAsVlz2RJKr304GbWIf8
 5UCa7vDiNmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdQAAKCRDB/BR4rcrs
 Cfc9B/9iU4DNgs0D/ZWhUn6FroP6DuA8noL4+xxQltmf6NT9cOnh3ZGR/y4E6MGe6VPis0d0xVq
 pd9tvlxE5LV0xCNoMvu0V0dP1bGJFQ+IvoFNnhBBJZLTBMO/D9bnkAiaD8oUAKnTs4PMSj0QADt
 AUp35tApZHO/YOmB1w/yUmZ/I2uMYsZLvVSkC3kewKJfgWYKRWyPExdT1vpI97C+zIjTDEKRseL
 SMKXq6aTsj77ee5a+DDHXFkeE6DPoeDEXjsHZC6VkzLI5YVXmxAnfK/JlBSlPc9JU2lzDAWTz8v
 LHibjGYATrFwb7fHB5ryAp8GVM31cRaOEr3dlpZlIQ90AlaV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: GYZCXPK6GX6NM2FLZTTSCGWX2564M32C
X-Message-ID-Hash: GYZCXPK6GX6NM2FLZTTSCGWX2564M32C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GYZCXPK6GX6NM2FLZTTSCGWX2564M32C/>
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
 sound/mips/sgio2audio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index 989f656e2de7..a8551ccdd1bf 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -908,17 +908,16 @@ static int snd_sgio2audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int snd_sgio2audio_remove(struct platform_device *pdev)
+static void snd_sgio2audio_remove(struct platform_device *pdev)
 {
 	struct snd_card *card = platform_get_drvdata(pdev);
 
 	snd_card_free(card);
-	return 0;
 }
 
 static struct platform_driver sgio2audio_driver = {
 	.probe	= snd_sgio2audio_probe,
-	.remove	= snd_sgio2audio_remove,
+	.remove_new = snd_sgio2audio_remove,
 	.driver = {
 		.name	= "sgio2audio",
 	}
-- 
2.39.2

