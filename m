Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E17506BB74C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:14:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51038127D;
	Wed, 15 Mar 2023 16:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51038127D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893296;
	bh=wPm821FwPtGv/GvaeLedY8OG2bMRZ46ll1a3f2mXz8k=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Np40ID+flzQ16JVua8AWPPFyPfljaA8leKIWVyFiFVFSron1MmLl8xocDVfn2tEOB
	 f0+/ERP/kN4cxztSqh7VqwkLsV0gGF5XhYSCOCNPx+8uWh3DCIy2oakdxL+CFlavoH
	 Ap9P+5mN/XNO9RqVha+ShpUzNX19PK0Heoo+o320=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E00F805C2;
	Wed, 15 Mar 2023 16:09:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D20F805F6; Wed, 15 Mar 2023 16:08:37 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 14F66F8051B
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F66F8051B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-0007Fw-E7; Wed, 15 Mar 2023 16:08:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-004KVL-E5; Wed, 15 Mar 2023 16:08:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-0057dJ-BZ; Wed, 15 Mar 2023 16:08:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 023/173] ASoC: apple: mca: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:05:15 +0100
Message-Id: <20230315150745.67084-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=wPm821FwPtGv/GvaeLedY8OG2bMRZ46ll1a3f2mXz8k=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1uKF4twdFxN2YW+TcoInEACi06FNKaFgXYb
 nNtxaWpoumJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdbgAKCRDB/BR4rcrs
 CZ5RCACBfLIX6M/sQrkbnnY1xNfV+0VXAsSS/QFNC2qM8RBpvEUU/1EAXDsrY3MSQTVUlPfXP98
 dw1s/egsrz0uO7OLO4FEOyH6ZFN88FBZ8lvkWifswC9VRd4+OCFADGd/TAB7yh7gBOhoxSQyeoQ
 LK3FfE5xdK39QWQmY3Vhtg9Je1i5PZ1zzzF+m1asJd2uMyy1lZ+r7OZ9Dvhsh1TE9ecCDLpGvW9
 MvLrMrBbJFG2M3TWDhSDd/CuXw+u6WaZUvdWLy5AY2uQUDhNzFpcv50gGRgsBb1Jyd5FwhUmECy
 nLh1eQ9Xl/y5bFE+z4dIoYYVwuEC5l/2br+EGKYSw9NetpEa
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 2MIKMCWOA42HVAIG4N3ARK4FJQAQ6EIP
X-Message-ID-Hash: 2MIKMCWOA42HVAIG4N3ARK4FJQAQ6EIP
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: asahi@lists.linux.dev, alsa-devel@alsa-project.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MIKMCWOA42HVAIG4N3ARK4FJQAQ6EIP/>
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
 sound/soc/apple/mca.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 64750db9b963..ce77934f3eef 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -1159,13 +1159,12 @@ static int apple_mca_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int apple_mca_remove(struct platform_device *pdev)
+static void apple_mca_remove(struct platform_device *pdev)
 {
 	struct mca_data *mca = platform_get_drvdata(pdev);
 
 	snd_soc_unregister_component(&pdev->dev);
 	apple_mca_release(mca);
-	return 0;
 }
 
 static const struct of_device_id apple_mca_of_match[] = {
@@ -1180,7 +1179,7 @@ static struct platform_driver apple_mca_driver = {
 		.of_match_table = apple_mca_of_match,
 	},
 	.probe = apple_mca_probe,
-	.remove = apple_mca_remove,
+	.remove_new = apple_mca_remove,
 };
 module_platform_driver(apple_mca_driver);
 
-- 
2.39.2

