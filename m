Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D91A6BB7E6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:33:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8BD13BE;
	Wed, 15 Mar 2023 16:32:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8BD13BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894421;
	bh=Vrevh/9+Tt9NBTkdA3ayadMtrznBbxNATV0c6JUQjk8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UXqP6mrsd4Z05lOB0fsu5PfqGsbEL1pxqp0FqScP56BLr2NDJ5TIDtN6HA04D4WoL
	 8cJabYlnhvldxZJTppRIgdizZDHbP6EdHPZsHBats848RpQLreRBkcJEHRpKVaQjFI
	 AgvgkbGMvU2J1UnOxB48/KkxZww6mLuaxsTqSqYo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 335F7F80764;
	Wed, 15 Mar 2023 16:13:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE76FF805D5; Wed, 15 Mar 2023 16:09:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 64364F805EC
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64364F805EC
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008SQ-Hd; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004KcH-Fr; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-0057j5-O5; Wed, 15 Mar 2023 16:08:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 113/173] ASoC: mediatek: mt8195-afe-pcm: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:45 +0100
Message-Id: <20230315150745.67084-114-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Vrevh/9+Tt9NBTkdA3ayadMtrznBbxNATV0c6JUQjk8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6FPMOFGppFQCVABceDv/v8niyN69Vxw1dPW
 t1vVl8VttKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHehQAKCRDB/BR4rcrs
 CROfB/9cn1lQZJZwq/BhnTEC7pmpcbvVu6MtU9rYrHSQOGFOlTJgeHY+o3jrkDezY2n6GGRxv77
 A5y6LSFfENIfLl63FiSEcffYanjqtLo4RT19eJdXfaRbPfgE6yHOqKAeEsjY8Ub0kSS0MgG0ZRY
 u0evzAnY0guqz33nlb9dNaf5uThRrCVCpOZG/xOD6jbP88DDOgdIX8eYCkLJfqk0D/JIU98PvdL
 Kyk0SXvSAUL9PkW96Fn40F7SNm8o3KLuDVOKWNBZju57X1zCVv9spZtcN17bGGVywKxOgGCUOSY
 tJrlX8VFULBs8lKcYpY4feO33SfXKPRapCo69sle/NXefRGC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: EOTJNOKI2HJIJYMA2HWRZASB46JQZPU3
X-Message-ID-Hash: EOTJNOKI2HJIJYMA2HWRZASB46JQZPU3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EOTJNOKI2HJIJYMA2HWRZASB46JQZPU3/>
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
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 72b2c6d629b9..9e45efeada55 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3253,7 +3253,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
 
@@ -3264,7 +3264,6 @@ static int mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 		mt8195_afe_runtime_suspend(&pdev->dev);
 
 	mt8195_afe_deinit_clock(afe);
-	return 0;
 }
 
 static const struct of_device_id mt8195_afe_pcm_dt_match[] = {
@@ -3285,7 +3284,7 @@ static struct platform_driver mt8195_afe_pcm_driver = {
 		   .pm = &mt8195_afe_pm_ops,
 	},
 	.probe = mt8195_afe_pcm_dev_probe,
-	.remove = mt8195_afe_pcm_dev_remove,
+	.remove_new = mt8195_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8195_afe_pcm_driver);
-- 
2.39.2

