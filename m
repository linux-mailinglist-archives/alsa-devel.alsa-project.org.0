Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCEC6BB74F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:15:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE05C1280;
	Wed, 15 Mar 2023 16:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE05C1280
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893330;
	bh=gRAMOvpcEpLFiOxyVvZWkyo1A3og8HX/Bo7lZDVV4Dw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CSvCPs7B/rHVhWbXSYQUuZb3rWSPrjm9W55Qqb36XVuiXelxV8Tb56GcMltBaRXGi
	 KOJ8QHhohDgzR12Y+5EZD0LmcOXLVTLkGFOD7Z3H/Y9sbjSu2dQ2ts1DbQzAYE72ZF
	 qFWoA0J4z6DJ6bM5WiZgPxa3+6GJg7glA04X0K+s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0907F80482;
	Wed, 15 Mar 2023 16:09:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B325F805FE; Wed, 15 Mar 2023 16:08:40 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EC20BF80557
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC20BF80557
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-0007FZ-Mk; Wed, 15 Mar 2023 16:08:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-004KVE-80; Wed, 15 Mar 2023 16:08:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-0057dB-Vj; Wed, 15 Mar 2023 16:08:00 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Meng Tang <tangmeng@uniontech.com>
Subject: [PATCH 021/173] ASoC: amd: vangogh: acp5x-pcm-dma: Convert to
 platform remove callback returning void
Date: Wed, 15 Mar 2023 16:05:13 +0100
Message-Id: <20230315150745.67084-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=gRAMOvpcEpLFiOxyVvZWkyo1A3og8HX/Bo7lZDVV4Dw=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMaQI3s14uGPzP9E/Lkn3TEQ0zqV9Md0lr9Rh+/zHjVvFC
 Sknv0nbdjIaszAwcjHIiimy1BVpiU2QWPPfrmQJN8wgViaQKQxcnAIwEbPr7P/zdIJ1FogKW6ZV
 NOiGcvWseVHS1FiwycmwduqC2FhR2e/5d+NfTmX+evyIYtj7N8sT5XNvhlruyrAMehVdl2QaKnu
 HJ+7QgqmvLqfvEucyLf3pb/uRU0j/xEqlWV/Dc6efWcuWLDpJM/Fp0pflZcFX5sZYSm2uLV7/bU
 VQ5IomhWnLm+SuBAqLiVncVS92sSuO+cfLsaota+prX2lXH3mzG2aZtdarJdS2/rmW/qCtWfBjZ
 WGHeNqNKxElrgfFr3wqZk/SZ/O5eoLl6Q7tykAhWdc0kdWx+rfZH3nOaU1V/iB1hdG7w8hZec19
 tXjnlrWpbHWTr241f/r1ivHhk7/XmV8OyAwWU2Ho7LAEAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: MXBUOBJOPRZMGI7Y3AJUNW4F3QMVYS42
X-Message-ID-Hash: MXBUOBJOPRZMGI7Y3AJUNW4F3QMVYS42
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXBUOBJOPRZMGI7Y3AJUNW4F3QMVYS42/>
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
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index d36bb718370f..29901ee4bfe3 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -415,10 +415,9 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int acp5x_audio_remove(struct platform_device *pdev)
+static void acp5x_audio_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int __maybe_unused acp5x_pcm_resume(struct device *dev)
@@ -500,7 +499,7 @@ static const struct dev_pm_ops acp5x_pm_ops = {
 
 static struct platform_driver acp5x_dma_driver = {
 	.probe = acp5x_audio_probe,
-	.remove = acp5x_audio_remove,
+	.remove_new = acp5x_audio_remove,
 	.driver = {
 		.name = "acp5x_i2s_dma",
 		.pm = &acp5x_pm_ops,
-- 
2.39.2

