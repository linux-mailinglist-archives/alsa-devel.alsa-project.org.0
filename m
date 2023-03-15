Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4556BB7DD
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:32:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C99813B7;
	Wed, 15 Mar 2023 16:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C99813B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894353;
	bh=CcBYQ5pQ+b1R38q6a0nA+xt8V3GqdSrNzwGaMGzN1GQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ASZNda7DT0FVIXRydvkSCkcBH6QE0HTm9eH/rRO67WL2F8GJeQViksrN11fRV4XE3
	 9NNR3tgq98lluULMtsN0tovY1qxaRR+LxNMDqkklARPWOsTkM+1kzSWMmkzRZFo2xM
	 cnxcKDC6rFb6G+EPf84ZwMM29E/uggxzx/iwNEBQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D856DF80743;
	Wed, 15 Mar 2023 16:13:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 257CEF805D4; Wed, 15 Mar 2023 16:09:47 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C331F805E8
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C331F805E8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-0008OO-PE; Wed, 15 Mar 2023 16:08:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-004Kbs-8F; Wed, 15 Mar 2023 16:08:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-0057im-Iq; Wed, 15 Mar 2023 16:08:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 108/173] ASoC: mediatek: mt6797-afe-pcm: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:40 +0100
Message-Id: <20230315150745.67084-109-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=CcBYQ5pQ+b1R38q6a0nA+xt8V3GqdSrNzwGaMGzN1GQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5yAeixOHswBtO0H+V7OyHXBqnKrU/grjWsv
 qkVDwGnJQuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHecgAKCRDB/BR4rcrs
 CcBVCAChU0f86GTKfll67nh1XsJDDBemWChBAlE0j+6eUqdTFDFKJwHznlAYmaD0vc7ERrmfhej
 o+86jOK2Cj5lmaAgxprFRLYZfrkm/LLlZ6xbuKL0+ssgtVJbKpFSMV4vq5fM1JJiYWdmhoCA9Th
 GejMxo+Lfm0lPHhwG4PdgwUUUJHW1Bb0/pfRq0vTO+hTZyj0IYUPlNRHSCi+jaM5kDzPdxQAuZx
 MbVW3IBP6jmcMdZkZHDZzbKyxNgJ8J4uFZWNNI3kA1nXQCKYSFWFqiDuLfLgDff3p851LKWduyL
 xly2Hz0+oAYj14BkhbM3uSG1b5U3RoyhyJmFVKM8nrvMv3a9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 66FFZUP6UFQHTTBUSINCI6B3V5FRRLWF
X-Message-ID-Hash: 66FFZUP6UFQHTTBUSINCI6B3V5FRRLWF
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 alsa-devel@alsa-project.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66FFZUP6UFQHTTBUSINCI6B3V5FRRLWF/>
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
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index fb4abec9aa5f..43038444c43d 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -876,14 +876,12 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt6797_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt6797_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt6797_afe_runtime_suspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id mt6797_afe_pcm_dt_match[] = {
@@ -904,7 +902,7 @@ static struct platform_driver mt6797_afe_pcm_driver = {
 		   .pm = &mt6797_afe_pm_ops,
 	},
 	.probe = mt6797_afe_pcm_dev_probe,
-	.remove = mt6797_afe_pcm_dev_remove,
+	.remove_new = mt6797_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt6797_afe_pcm_driver);
-- 
2.39.2

