Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B096BB769
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:18:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0BFA1268;
	Wed, 15 Mar 2023 16:17:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0BFA1268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893503;
	bh=Z9x5okcuH+MfxJPQ10nX9udPMHHTxaZwjUYHSvRFEUY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aHTRyZZThyjwJfzJEwcE6BfSiBTyxcshzrg+VTxxZ86HLAp528OllJXqKMRdi+kus
	 NtMuOwpQq3K1GcwpcQQ7ExXR5QSsxlW4vjpeDG9VtLPB1mabjiUPSXp+1nYwWtzJFO
	 rRaUZDO4fb5NptBPWqbbz7xDTSYv4BePpGV41sFU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 730C3F80563;
	Wed, 15 Mar 2023 16:10:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3481F8064F; Wed, 15 Mar 2023 16:08:51 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F1850F80579
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1850F80579
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjY-0007U8-2k; Wed, 15 Mar 2023 16:08:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-004KX8-BW; Wed, 15 Mar 2023 16:08:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjW-0057em-Ga; Wed, 15 Mar 2023 16:08:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 046/173] ASoC: codecs: cs47l90: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:38 +0100
Message-Id: <20230315150745.67084-47-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Z9x5okcuH+MfxJPQ10nX9udPMHHTxaZwjUYHSvRFEUY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2xT0HTLIZQkh2xXT3s9k2sZtGfgPrjkxYFL
 jX8tj99qPSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdsQAKCRDB/BR4rcrs
 CcUqCACOdMI7KMWa8Pz2xDJoSa8KioODGQ2xGWOiNjUoSRLtiJ0gQtQXl+oi3mgPsZrfrLznJV3
 aitdERuiPp3/gGegh+lgGcidvyRi0oCUCCZxACwnm5rZJZcNjcMFZPGsXjGTPF795HXVdI8FXIk
 LJDzWfAWRwqMc3RsAoIPcHPtN1kOiH+XuHsGc97vACF7e1fEy1DEEX+/Jdj7wvLBO9GUCfhh+kV
 7jOaGxOrbaLlJ8GiCIPxS2q5sYHFPm9nYcxAEvXLRBVbycaxunOJBoZHL2HIgtMw5sg1MBhiRQb
 0m0wTtQ+tMgrUPdSR98dWV4xC3ShBeT/WSLPHE3eZWx9IKQu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: QIIMQJZI53QN2BF4DDFYRAYWGJM6QZEG
X-Message-ID-Hash: QIIMQJZI53QN2BF4DDFYRAYWGJM6QZEG
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QIIMQJZI53QN2BF4DDFYRAYWGJM6QZEG/>
List-Archive: <>
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
 sound/soc/codecs/cs47l90.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 1ad6526c7871..cdd5e7e20b5d 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2618,7 +2618,7 @@ static int cs47l90_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cs47l90_remove(struct platform_device *pdev)
+static void cs47l90_remove(struct platform_device *pdev)
 {
 	struct cs47l90 *cs47l90 = platform_get_drvdata(pdev);
 	int i;
@@ -2633,8 +2633,6 @@ static int cs47l90_remove(struct platform_device *pdev)
 	madera_set_irq_wake(cs47l90->core.madera, MADERA_IRQ_DSP_IRQ1, 0);
 	madera_free_irq(cs47l90->core.madera, MADERA_IRQ_DSP_IRQ1, cs47l90);
 	madera_core_free(&cs47l90->core);
-
-	return 0;
 }
 
 static struct platform_driver cs47l90_codec_driver = {
@@ -2642,7 +2640,7 @@ static struct platform_driver cs47l90_codec_driver = {
 		.name = "cs47l90-codec",
 	},
 	.probe = &cs47l90_probe,
-	.remove = &cs47l90_remove,
+	.remove_new = cs47l90_remove,
 };
 
 module_platform_driver(cs47l90_codec_driver);
-- 
2.39.2

