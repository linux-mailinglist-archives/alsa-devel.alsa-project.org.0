Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAC66BB7EA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:34:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 357F1132D;
	Wed, 15 Mar 2023 16:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 357F1132D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894465;
	bh=Vbc4xUnTL1Y0I7B/wT0bsowfdarYOTW4ugcUlyhtNZ0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=expU3RpVTDQ/3i+BcXnnJVSM2BP3oFnjVFG2kd0EDU0h/Q41TmKN//1/js637qG3b
	 SOO6yeokSNF+GzqjGEuA+wilhxEwKYNNVGd4cd8zYPhA5jRF91GjV5lLigJUta4x26
	 ntgehWcaQOB1RtjfH5bhKKISYw23MF7WY2ac0sUw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34DF5F80772;
	Wed, 15 Mar 2023 16:13:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7865F805D9; Wed, 15 Mar 2023 16:09:53 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 95C78F805EF
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95C78F805EF
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008RT-3B; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004Kc6-75; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-0057iv-37; Wed, 15 Mar 2023 16:08:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 110/173] ASoC: mediatek: mt8183-afe-pcm: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:42 +0100
Message-Id: <20230315150745.67084-111-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Vbc4xUnTL1Y0I7B/wT0bsowfdarYOTW4ugcUlyhtNZ0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd56cbEdE639c06BbjtIwKcsxlSF18v0KMOjU
 KcNVzNENRCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeegAKCRDB/BR4rcrs
 CdMfCACXO8H0LPcx1idndfScu9x9KvAjfBRlRKsCPhrXYUUjpgScQjOLz+GCNqQFuU3+fmLA2r7
 /7u4opuAY4ecvMR7uPn+YV6Qywy3UZeYJuVJJsB/uoz+gCHtPX7gbF+AyGKy+WggPtb4LiBN4v4
 LZ2F4zzyu6+Vq5hKNd/XFDE8T2LPHS04ot1qNFx7tmCpSzjeLfNfnqrMWISI2RAByyt4grAtt45
 TpXXEFTmuudCbuFVrTGk231hw9Kip6LcapIFmfKlX0j5jwRA56sah0vySs57zcwc0M037mgRp9T
 92lp6rk/SwLPOXM5g/7JZDOMNSMIribUc7HhDBLSlPj1k+wQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: R5H7EU45VJ4ZIFIH7NN3II7PVQZM544G
X-Message-ID-Hash: R5H7EU45VJ4ZIFIH7NN3II7PVQZM544G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R5H7EU45VJ4ZIFIH7NN3II7PVQZM544G/>
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
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 86c8a523fe9e..90422ed2bbcc 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1255,13 +1255,11 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt8183_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt8183_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8183_afe_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id mt8183_afe_pcm_dt_match[] = {
@@ -1282,7 +1280,7 @@ static struct platform_driver mt8183_afe_pcm_driver = {
 		   .pm = &mt8183_afe_pm_ops,
 	},
 	.probe = mt8183_afe_pcm_dev_probe,
-	.remove = mt8183_afe_pcm_dev_remove,
+	.remove_new = mt8183_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8183_afe_pcm_driver);
-- 
2.39.2

