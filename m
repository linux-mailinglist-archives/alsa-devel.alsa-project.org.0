Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E56BB850
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:45:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D175114C2;
	Wed, 15 Mar 2023 16:44:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D175114C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895112;
	bh=V0X26gJA4wFzkbA0wVMc+KOS97dbQ5KaT5HYnQz7Yes=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rCDSpVouOmxQVcW10YWrG/s96TJuP7KKTnxYneEG/vw76JKbOJMIv3msOjGvj+ZXU
	 wotcSYm45E7M+3VkJ29+cwEotOkSu7hTgM8tTm1MaY7BriCs+u4wHojXvgfrEgjx/M
	 XaStKHJOIs4CT36TCiwjPrGZM3Zd4c09TUCjQ9Zw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD77F80CB8;
	Wed, 15 Mar 2023 16:15:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8902F80605; Wed, 15 Mar 2023 16:10:28 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E6E8F8061D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E6E8F8061D
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSk2-0000ff-PP; Wed, 15 Mar 2023 16:08:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-004KgQ-3r; Wed, 15 Mar 2023 16:08:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjx-0057mP-14; Wed, 15 Mar 2023 16:08:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 164/173] ASoC: ti: omap-hdmi: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:36 +0100
Message-Id: <20230315150745.67084-165-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=V0X26gJA4wFzkbA0wVMc+KOS97dbQ5KaT5HYnQz7Yes=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8ffnN4csMffKpvTJmawfvjum6ywVroUtKwY
 nYHlYnYQNyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfHwAKCRDB/BR4rcrs
 CZsBB/40yGC+w/7LyF5TMCuOJCVAy5ZnJe74VRiuUFKZBhNocxZRlwTgleVmNh0x/Oun7q/FlmO
 PzQjHdNit00S4w8bqUt/MzQYvj8HcgviY9qlfCJTzpgDUuWBIaaIn1mipAwEVvkCUPqyZKCIr7z
 2pqh5IERRoF2dcNhUYeOc2nEaOKmGyPbt4IbJskPbra8Gr85U/4eUyEi4uz0xKAClVI4k8HxYkK
 G6DZS/WaY/J7SfeY6PLQXqehSp74u2a/2HTX8uhyZp/3afYOFbvkREt49VEasWCE1WBg7tkq7Od
 FJKbHeljSBMLvzFCUgGPwgp5JvdfD9/8iSe5WVcuFtzy3QM7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 2XRVVYX7267HQN6GNLTZPFTV4IVJAQMD
X-Message-ID-Hash: 2XRVVYX7267HQN6GNLTZPFTV4IVJAQMD
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XRVVYX7267HQN6GNLTZPFTV4IVJAQMD/>
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
 sound/soc/ti/omap-hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 0dc0475670ff..ad37785e05d8 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -398,12 +398,11 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int omap_hdmi_audio_remove(struct platform_device *pdev)
+static void omap_hdmi_audio_remove(struct platform_device *pdev)
 {
 	struct hdmi_audio_data *ad = platform_get_drvdata(pdev);
 
 	snd_soc_unregister_card(ad->card);
-	return 0;
 }
 
 static struct platform_driver hdmi_audio_driver = {
@@ -411,7 +410,7 @@ static struct platform_driver hdmi_audio_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = omap_hdmi_audio_probe,
-	.remove = omap_hdmi_audio_remove,
+	.remove_new = omap_hdmi_audio_remove,
 };
 
 module_platform_driver(hdmi_audio_driver);
-- 
2.39.2

