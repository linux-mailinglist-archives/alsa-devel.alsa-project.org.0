Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E5B64A8FB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:58:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 744282320;
	Mon, 12 Dec 2022 21:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 744282320
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878737;
	bh=Lag8ABddGgo8Y+6xYVrV2ZWO5fJEd1lgDe+EeGNdmec=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s9d6I6zF6wWTqY/t8znCNQFOkjzKenAcItgbuD8aVQblQAQPC4YKvjO9+XbTBi2oV
	 BIt7lceug6tAKSzmop9eknSyhVfX0WzEpEHjt/Y4MjMqjCbLsBbb2qZg2Zct/6kJHS
	 dJknv7W4h0ww57iF18kljmQu7Et3ZvdY+Mp1roaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC2B9F805AA;
	Mon, 12 Dec 2022 21:54:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33133F80580; Mon, 12 Dec 2022 21:54:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C648BF80580
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C648BF80580
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poX-0001HK-Tx; Mon, 12 Dec 2022 21:54:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poW-00464y-9C; Mon, 12 Dec 2022 21:54:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poV-004aiM-TK; Mon, 12 Dec 2022 21:54:15 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 15/15] ASoC: SOF: nocodec: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:54:06 +0100
Message-Id: <20221212205406.3771071-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=854;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Lag8ABddGgo8Y+6xYVrV2ZWO5fJEd1lgDe+EeGNdmec=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5To8oKR6rIGc08Iu8IDd+MNXehb0Bz1bIzJvSe2
 Kk1Rs9CJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eU6AAKCRDB/BR4rcrsCY5IB/
 9R5d4jZLHvw0d7hHrazEhuiYAjekQTB8wscCD/1uoFS9WLUVboIwAgq8+NVH5LMK9FhLgeaBGSD7pg
 HDpQi6obq5AKGleaFUV2novDO1qrwqzW0UbqUvHXeopAggx2EM9bWvbGDea/WgF9v1qFN+EeCSy6or
 MpyAgzRInAry0xV5ll1tgf9WvUAVZrTeTBXs1aiDTsYZi7GeNeC2jKL5DEikZ2UB2KzNbn+0uX2F8d
 39dx6JUDQEhZ/N7dvgGwQfWMtbYenat4jJB0VDogArYac0Xt+TpF4ihyTL3Cd1ygf2icOHwPrlm1eU
 sH7g4skFC3ffpR1u5effdrYdlaE9f/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, kernel@pengutronix.de,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/sof/nocodec.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 3537805070ad..b13bfdeb2b70 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -103,14 +103,8 @@ static int sof_nocodec_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
-static int sof_nocodec_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver sof_nocodec_audio = {
 	.probe = sof_nocodec_probe,
-	.remove = sof_nocodec_remove,
 	.driver = {
 		.name = "sof-nocodec",
 		.pm = &snd_soc_pm_ops,
-- 
2.38.1

