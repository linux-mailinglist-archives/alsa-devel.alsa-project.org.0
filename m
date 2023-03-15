Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 030CC6BB85B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:47:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 979CC14E9;
	Wed, 15 Mar 2023 16:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 979CC14E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895238;
	bh=G3+Zub3on/oNv5MlUhL//kM8stML3hIwmYkNv5rWxLo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PkibyP/mhcrFZy/iNYWcS055lIgZGZUm9moNZzfY/rKLsq7GTLsTE30bMLnQffYyp
	 NYgBQY+NsXZ+i5Qvxkdvh1kyHvtSHRhNC1m/g1AxdE8o5+RuKrglZTiNBmsAOyJpT9
	 uSBAbTItgC8ckxFKxqLJ50Y15Q8HVdnuYZVV59mQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29DEBF8962D;
	Wed, 15 Mar 2023 16:16:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8393EF8060E; Wed, 15 Mar 2023 16:10:37 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 26DACF8061F
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26DACF8061F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjw-0000KT-KM; Wed, 15 Mar 2023 16:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-004KeO-Cy; Wed, 15 Mar 2023 16:08:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjr-0057kb-4B; Wed, 15 Mar 2023 16:08:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 137/173] ASoC: stm: stm32_i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:09 +0100
Message-Id: <20230315150745.67084-138-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=G3+Zub3on/oNv5MlUhL//kM8stML3hIwmYkNv5rWxLo=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMaQI3ju71CVIvOSn+Q9LRruINMUs606RY0H/z3YsbroQu
 79m0uoPnYzGLAyMXAyyYoosdUVaYhMk1vy3K1nCDTOIlQlkCgMXpwBMxNKQ/X+C+rJK+yA/0RMq
 pvGGpoLciUZvOG6s9GM0XvbJZU2qLGPJ9vT6L00d3MVmKsZ6ixcv53r4pH/RxNeM+x7vNCrXFmw
 J1NxeGjiDd96rZfXre/e9XLpdMuPpkdDMWzK1b7ruzrh4aNsip6vrZkZeMJq1eEbP6tjouiv9LQ
 cqd0n1zJzbLy51jsl72h/TMs2mX9zfbyT52vxz8+l8m/D38NbD3RMvi+b2uvZL3n4vInRAfHZU0
 vYtvTb1u8TfaPHXH3QsYjl3/fcH1qkr5qYpyrk/e/u+uWmVYlWwnpebjEWcE+NX9sKDW7e57TVn
 0mKySQB6+PHj1Rn2r8Rss4vmx81l/eh8M6Qo5Cj7leVnAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: AHBSA5H3TFDI4Q3WUTCXZDDXCIRAOD6V
X-Message-ID-Hash: AHBSA5H3TFDI4Q3WUTCXZDDXCIRAOD6V
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHBSA5H3TFDI4Q3WUTCXZDDXCIRAOD6V/>
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
 sound/soc/stm/stm32_i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index f3dd9f8e621c..f7e381187216 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1097,13 +1097,11 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
-static int stm32_i2s_remove(struct platform_device *pdev)
+static void stm32_i2s_remove(struct platform_device *pdev)
 {
 	snd_dmaengine_pcm_unregister(&pdev->dev);
 	snd_soc_unregister_component(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int stm32_i2s_probe(struct platform_device *pdev)
@@ -1221,7 +1219,7 @@ static struct platform_driver stm32_i2s_driver = {
 		.pm = &stm32_i2s_pm_ops,
 	},
 	.probe = stm32_i2s_probe,
-	.remove = stm32_i2s_remove,
+	.remove_new = stm32_i2s_remove,
 };
 
 module_platform_driver(stm32_i2s_driver);
-- 
2.39.2

