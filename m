Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA92574AC4E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 09:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C312A83B;
	Fri,  7 Jul 2023 09:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C312A83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688716378;
	bh=LnSXgPSeIkokryeKCpDdolw9EPlIWja2MRNzkzbjgT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kVUDq2T4aWzpBPROg0E6XWXWT5ffe3IaiTOJypCfFVs/vUYzdgQ4K61jddNRT0Vwy
	 tUs0GDLl5ZNDuY3snTTPTOcasIzDKfP6oQ41pW61gxpu5a2MbPr8CIY1cV2oljTFOo
	 sVkcmBX8iL3CGACfwvzwEogYw1FpEwiWf6dcN3ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02046F8055A; Fri,  7 Jul 2023 09:51:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 091CCF80548;
	Fri,  7 Jul 2023 09:51:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50D5DF80100; Fri,  7 Jul 2023 09:51:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80E11F80100
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 09:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E11F80100
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHgF7-0005T3-8e; Fri, 07 Jul 2023 09:51:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHgF6-00CgJu-J6; Fri, 07 Jul 2023 09:51:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHgF5-002wts-S4; Fri, 07 Jul 2023 09:51:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH 2/2] ALSA: pcmtest: Don't use static storage to track per
 device data
Date: Fri,  7 Jul 2023 09:50:58 +0200
Message-Id: <20230707075058.3402832-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707075058.3402832-1-u.kleine-koenig@pengutronix.de>
References: <20230707075058.3402832-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=LnSXgPSeIkokryeKCpDdolw9EPlIWja2MRNzkzbjgT8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkp8PhCqFe63vXBh2Jh+TcxbUkJxpIMZ9RzI13P
 IDibDh0hcGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKfD4QAKCRCPgPtYfRL+
 Tn+JB/sHmuanN8IJF6ZoQ1GyFg1ahUtc32w03u211/rjGLHuKMD6+u1yP6MHamUdixmQ1nvNm62
 ES8I+Y+NgBU85i8V6qiwaBVD9dCPe+GWWGXzxyn3D5Awn8WJNoOoeeacG51dgrwmA/AhLA0WHWy
 5Z80dyT1tX5iUNBUbogWnFe/S00e0gLrfsdOfvxBl/Vzs1D/Z+0N34LxgaqaPrj6f6cOoF0ZX4N
 YSZf3FDPr7jktxMFyZum3Niw+awJFC2LZxxt5XGtETHIH67i6TvqbVQI5GBqGhQOA3j+S0knsjA
 sTKYXVAam10jV0Voed6+zDhBv3uTlEJuGxbG+Gumi1V6MPVh
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: EAIWCERMZEPYAVY34SNHAGXOGHWY7VIO
X-Message-ID-Hash: EAIWCERMZEPYAVY34SNHAGXOGHWY7VIO
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAIWCERMZEPYAVY34SNHAGXOGHWY7VIO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While there is probably only ever a single instance of such a pcmtst
device, it's still bad style to use a static variable to store per
device data. Make use of platform_get_drvdata() and
platform_set_drvdata() which fixes a data corruption if there should be
two or more such devices (or this driver is used as a template for
another driver).

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/drivers/pcmtest.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 1fff85feaf82..291e7fe47893 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -110,8 +110,6 @@ struct pcmtst_buf_iter {
 	struct timer_list timer_instance;
 };
 
-static struct pcmtst *pcmtst;
-
 static struct snd_pcm_hardware snd_pcmtst_hw = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
@@ -552,6 +550,7 @@ static int snd_pcmtst_create(struct snd_card *card, struct platform_device *pdev
 static int pcmtst_probe(struct platform_device *pdev)
 {
 	struct snd_card *card;
+	struct pcmtst *pcmtst;
 	int err;
 
 	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
@@ -573,11 +572,15 @@ static int pcmtst_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
+	platform_set_drvdata(pdev, pcmtst);
+
 	return 0;
 }
 
-static void pdev_remove(struct platform_device *dev)
+static void pdev_remove(struct platform_device *pdev)
 {
+	struct pcmtst *pcmtst = platform_get_drvdata(pdev);
+
 	snd_pcmtst_free(pcmtst);
 }
 
-- 
2.39.2

