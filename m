Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B38553518
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 17:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F051F1FA6;
	Tue, 21 Jun 2022 16:59:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F051F1FA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655823616;
	bh=0Zyec8pIO1tWER8R011cwP1E3e2hIt1DcQPh/dECWyM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VnqyPUg25w3unSW0mBO3YWkscMhnmLfFkpROqJ8hM4/6emO5M75UEw7bod52uogzl
	 Kf+0NCqN63gDL41B36jsq7dWhnVwpAL8MHJYbXBPbpClECEpt6//6lOm2N6U7ShgR2
	 24r5tsv4Ws6hIFoeP/Z807CURIWvTNETE1zA4T24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CF6AF80253;
	Tue, 21 Jun 2022 16:59:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F89AF800E3; Tue, 21 Jun 2022 16:59:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00130F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 16:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00130F800E3
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o3fL3-0003Jp-NT; Tue, 21 Jun 2022 16:58:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o3fL1-001qyy-0h; Tue, 21 Jun 2022 16:58:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o3fL1-000DmH-MK; Tue, 21 Jun 2022 16:58:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: core: Make snd_soc_unregister_card() return void
Date: Tue, 21 Jun 2022 16:58:34 +0200
Message-Id: <20220621145834.198519-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3578; h=from:subject;
 bh=0Zyec8pIO1tWER8R011cwP1E3e2hIt1DcQPh/dECWyM=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMSRtvDNdOXyyYU2O7Na6l4+P7NuzV9RgI1eOfEuyxbO6HQ3t
 l5tsOhmNWRgYuRhkxRRZ6oq0xCZIrPlvV7KEG2YQKxPIFAYuTgGYiHQx+z8dhl2x21UXbGLunu/F47
 iQ+8dBNaWPb+KlhMuCupUiTB+xv9H4b33ZgeXWod7YTQs8dX9Nq+ey93wdpHDKdI9Tf2yR2+WuvMiz
 Ad7+zRknDopLvLgWaSnPE76SpTUneIJr1lab+zdnL113my2K5fxsNwvpuqob0Re6HlzzeROjvL11+6
 U4m/CN2vP1a1qSlC9+e2mZnpdWv13bsNG4rDhILWlb7QmuiRYbVBmfBSlNWtEZvOujxbPMgyFC85fa
 n9eKDb3Lu6KRbyOrHd+OZ9anY6dfZNW4FnKWd+rKawkJfx93O7vvVP9uMkfedQZXLscK1tcWTcEs+h
 FntBMEakP0lvQ/Yr6s9TH+hpQFAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel@pengutronix.de,
 alsa-devel@alsa-project.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>, Miaoqian Lin <linmq006@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The function snd_soc_unregister_card() returned 0 unconditionally and most
callers don't care to check the return value. Make it return void and
adapt the callers that didn't ignore the return value before.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/sound/soc.h                 | 2 +-
 sound/soc/atmel/mikroe-proto.c      | 4 +++-
 sound/soc/fsl/pcm030-audio-fabric.c | 5 ++---
 sound/soc/soc-core.c                | 4 +---
 sound/soc/soc-topology-test.c       | 4 +---
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f20f5f890794..adcc756fe0c2 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -416,7 +416,7 @@ enum snd_soc_pcm_subclass {
 };
 
 int snd_soc_register_card(struct snd_soc_card *card);
-int snd_soc_unregister_card(struct snd_soc_card *card);
+void snd_soc_unregister_card(struct snd_soc_card *card);
 int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card);
 #ifdef CONFIG_PM_SLEEP
 int snd_soc_suspend(struct device *dev);
diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index ce46d8a0b7e4..954460719aa3 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -157,7 +157,9 @@ static int snd_proto_probe(struct platform_device *pdev)
 
 static int snd_proto_remove(struct platform_device *pdev)
 {
-	return snd_soc_unregister_card(&snd_proto);
+	snd_soc_unregister_card(&snd_proto);
+
+	return 0;
 }
 
 static const struct of_device_id snd_proto_of_match[] = {
diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index 83b4a22bf15a..e4c805acc349 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -113,12 +113,11 @@ static int pcm030_fabric_probe(struct platform_device *op)
 static int pcm030_fabric_remove(struct platform_device *op)
 {
 	struct pcm030_audio_data *pdata = platform_get_drvdata(op);
-	int ret;
 
-	ret = snd_soc_unregister_card(pdata->card);
+	snd_soc_unregister_card(pdata->card);
 	platform_device_unregister(pdata->codec_device);
 
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id pcm030_audio_match[] = {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9574f86dd4de..c5836066ead3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2326,14 +2326,12 @@ EXPORT_SYMBOL_GPL(snd_soc_register_card);
  * @card: Card to unregister
  *
  */
-int snd_soc_unregister_card(struct snd_soc_card *card)
+void snd_soc_unregister_card(struct snd_soc_card *card)
 {
 	mutex_lock(&client_mutex);
 	snd_soc_unbind_card(card, true);
 	mutex_unlock(&client_mutex);
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_card);
 
diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index ae3968161509..225d74355974 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -271,9 +271,7 @@ static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
+	snd_soc_unregister_card(&kunit_comp->card);
 	snd_soc_unregister_component(test_dev);
 }
 

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

