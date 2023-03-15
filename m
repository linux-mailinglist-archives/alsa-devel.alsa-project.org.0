Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9716BB762
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:17:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E57612AD;
	Wed, 15 Mar 2023 16:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E57612AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893443;
	bh=kxwhbVr15TCCWvNgo1txJMBZlxM0f7rppvQywDUmUFo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kDfUVpvpz1MVp5/7Qsv/qfOzQicT+J11e4QirETX1QbQYXfC/8oQNFIgrlEyXlY/q
	 34pkKMi4ooD3nudMZBumEbvGe87UL/41Rzcb0U4778/bdzwRWgaAVJEQD3b3uUzoZs
	 u4ScRnXkqlT7/I2LGiJXKs5FY5phJd6Xii8fFCUU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F125F805AF;
	Wed, 15 Mar 2023 16:10:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7617F80630; Wed, 15 Mar 2023 16:08:48 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A2490F8056F
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2490F8056F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjW-0007P4-1Z; Wed, 15 Mar 2023 16:08:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjV-004KWH-As; Wed, 15 Mar 2023 16:08:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-0057eC-H8; Wed, 15 Mar 2023 16:08:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 037/173] ASoC: au1x: psc-i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:29 +0100
Message-Id: <20230315150745.67084-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=kxwhbVr15TCCWvNgo1txJMBZlxM0f7rppvQywDUmUFo=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2XikfCNafpVk6CxU+6+g4VanWJ9YyfoOjgL
 NSVu9RwgXSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdlwAKCRDB/BR4rcrs
 Cb6YCACFmVXRFjLHF+UoTd24qDPVI/moxpy2c4dwyX+C7jqnV+S//DqGLRrOF0Sl2eBqTmHmaLi
 fGVr67JRsYUlg33KkbN/arc7AgqiahZrAolEd2ymp4S1AQa1eAuLhNnyjqj95eT5KtJu28YtLIh
 43keSY10C7pULQiICyqSHo6E4n6sp1E43ztNsD+aBdGeevEoBEWF6hmT0QN9M7l8MADCVmWOtdc
 MtJqZZZ4rV1ClL09zefN2qWP42ABkCONBoPvG0DiXw6qeu5VK1yhBvvEWuyFWoF1aIFi/wi8wyZ
 IojswtDP+1A43WbM8bDF26REcj/k47Zd0xtXPd8h3wU5CxXY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: DL2VYF3XREIJRYJDTXY4EVWYC3ZJZJVJ
X-Message-ID-Hash: DL2VYF3XREIJRYJDTXY4EVWYC3ZJZJVJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DL2VYF3XREIJRYJDTXY4EVWYC3ZJZJVJ/>
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
 sound/soc/au1x/psc-i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index 79b5ae4e494c..52734dec8247 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -344,7 +344,7 @@ static int au1xpsc_i2s_drvprobe(struct platform_device *pdev)
 				&au1xpsc_i2s_component, &wd->dai_drv, 1);
 }
 
-static int au1xpsc_i2s_drvremove(struct platform_device *pdev)
+static void au1xpsc_i2s_drvremove(struct platform_device *pdev)
 {
 	struct au1xpsc_audio_data *wd = platform_get_drvdata(pdev);
 
@@ -352,8 +352,6 @@ static int au1xpsc_i2s_drvremove(struct platform_device *pdev)
 	wmb(); /* drain writebuffer */
 	__raw_writel(PSC_CTRL_DISABLE, PSC_CTRL(wd));
 	wmb(); /* drain writebuffer */
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -406,7 +404,7 @@ static struct platform_driver au1xpsc_i2s_driver = {
 		.pm	= AU1XPSCI2S_PMOPS,
 	},
 	.probe		= au1xpsc_i2s_drvprobe,
-	.remove		= au1xpsc_i2s_drvremove,
+	.remove_new	= au1xpsc_i2s_drvremove,
 };
 
 module_platform_driver(au1xpsc_i2s_driver);
-- 
2.39.2

