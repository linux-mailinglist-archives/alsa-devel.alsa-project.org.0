Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C12CA6BB744
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:14:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED3D1288;
	Wed, 15 Mar 2023 16:13:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED3D1288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893250;
	bh=f8/waBLlObcwhIB/WjlKDiNLRFOIW2D5j7sJuW1o3NA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PPDeieSi3zj0FROpgPgBBjgKdhtoGEfjKO1WauZ6+bn5M80g096fU/LK5zMLvh/cX
	 UTjm02uI4Oe4EDJwdedKnIvcNuwQ6ZpOji0OMuewi6yC2Akz2FzZ61KozvOISR5+Iv
	 Tki8/qh+MeRg7it5lxKMy4JYJzi+DmZvMce/1smQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B0EF805BA;
	Wed, 15 Mar 2023 16:09:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36022F80425; Wed, 15 Mar 2023 16:08:34 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F6F2F8032D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F6F2F8032D
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-0007CP-Nd; Wed, 15 Mar 2023 16:08:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-004KUx-Ax; Wed, 15 Mar 2023 16:08:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-0057d7-MV; Wed, 15 Mar 2023 16:08:00 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 020/173] ASoC: amd: raven: acp3x-pdm-dma: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:12 +0100
Message-Id: <20230315150745.67084-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=f8/waBLlObcwhIB/WjlKDiNLRFOIW2D5j7sJuW1o3NA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1lgSzdNhy4qvF+z2+Rxk9l2p2BYZmjvAXHd
 MkmYAtsCfGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdZQAKCRDB/BR4rcrs
 CZV3CACfr1tddRCTFm3L57INzYFqwPPONVuNMevna4xyYdhwsNtF7SPk0ZRe8Nf+TXDt69jeHAn
 JldHyY1MpQRC457hWvG2s6iksuY0fhMM1q0Yc1T2vldui8IsmbRLOwnDfmY1pbFdkRFgenl9NjV
 bdXUun3k5wyX0C1pTCY/lG56b9A6kO08W7nXsLXjksir2Mq/HU/LsMO9YKIQw+GXlZTbmvY0k4V
 xOmiuMVFFPEszwhD5pNde5QljuwG4cTuRKL9f756hIecvdnsDfhMfTY3D+KD6/u0Hiy1MW9mmiF
 KW7SNz3skEpE5zdhN1NJPGj/FRc5h8Z+sUNQ8djANJ/CTSLi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: XHAJUV5TXNH2CRCFU3ETDNJPQMXVOU6B
X-Message-ID-Hash: XHAJUV5TXNH2CRCFU3ETDNJPQMXVOU6B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHAJUV5TXNH2CRCFU3ETDNJPQMXVOU6B/>
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
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 0d8b693aecc9..4e299f96521f 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -435,10 +435,9 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int acp_pdm_audio_remove(struct platform_device *pdev)
+static void acp_pdm_audio_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int acp_pdm_resume(struct device *dev)
@@ -489,7 +488,7 @@ static const struct dev_pm_ops acp_pdm_pm_ops = {
 
 static struct platform_driver acp_pdm_dma_driver = {
 	.probe = acp_pdm_audio_probe,
-	.remove = acp_pdm_audio_remove,
+	.remove_new = acp_pdm_audio_remove,
 	.driver = {
 		.name = "acp_rn_pdm_dma",
 		.pm = &acp_pdm_pm_ops,
-- 
2.39.2

