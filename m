Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5B556DB8
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 23:08:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18C9F1B02;
	Wed, 22 Jun 2022 23:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18C9F1B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655932098;
	bh=QO1ivWbKw//EcNg3JphM1E6BgemMEDjxj5RW4VDBcqE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ci6U+whWGgRr648YlQb6a5Aj8u+/uP1o0fiJ+0vBZ8Y3csnGrKi4PEmBPtDXpbPNe
	 I6CWH4GKdEc12jE38Gu/qXpyJ98zfq34/OZDHlBThtrFip9mmL7JL79axxOT7NDED5
	 MFD9tj0o/FWFaYABfkziipsKyMJQsI8mtdJXYYn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73418F8032D;
	Wed, 22 Jun 2022 23:07:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADEEEF802D2; Wed, 22 Jun 2022 23:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E4F3F80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 23:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E4F3F80118
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o47Z7-000717-Kj; Wed, 22 Jun 2022 23:07:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o47Z3-0026kU-Uc; Wed, 22 Jun 2022 23:07:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o47Z4-000VAv-Mc; Wed, 22 Jun 2022 23:07:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: topology: KUnit: Followup prototype change of
 snd_soc_unregister_card()
Date: Wed, 22 Jun 2022 23:06:29 +0200
Message-Id: <20220622210629.286487-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4448; h=from:subject;
 bh=QO1ivWbKw//EcNg3JphM1E6BgemMEDjxj5RW4VDBcqE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBis4RSxCToJIoWvydJhTh2jP0JyPOJHnaBBGBDH4A5
 UjBg9dqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYrOEUgAKCRDB/BR4rcrsCTd+B/
 0SzL5e0tWP+CTl0P/ggFkXjjp3LWtCqti+97k0WauR3Z3Y+yq4ox9AwLPxhn0pp/2+od7pIwDpLDfa
 2Way4A6Piaa+20D8oGTMkvZAtZyCWWlzisuddruSrIi8xKQezOqK2WOi4wPhuCXGVbBFTdh6lKRWwP
 L/docE7QDxCG98a6X60lihQD7/82i7UKwuy+rPqga0ps8l/2JFQuTsvP8Y1u6gBTMwNCmivMTelYHU
 IoG2nGktrtAQi9jhlyTYMpnSdZEqLzg7JxnG1PKhScj7sKvBL4TosUCNLiJpqqq8noDy0rlvv5vc/+
 cApQaSKVg7X9Gqr1tvpQg3oWsQ3yfz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 kernel test robot <lkp@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Miaoqian Lin <linmq006@gmail.com>,
 kernel@pengutronix.de, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
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

snd_soc_unregister_card() was recently converted to return void. Only
the first instance was adapted, so convert the remaining ones now to fix
building the topology test.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 1892a991886a ("ASoC: core: Make snd_soc_unregister_card() return void")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello Mark,

this fixes the issue the kernel test robot has reported in reply to the
patch that became 1892a991886a.

Up to you to apply on top of 1892a991886a or squash them together.

I'm a bit surprised that sound/soc/soc-topology-test.c isn't built for
ARCH=arm allmodconfig (that was my build test and that's the reason I
didn't notice the issue before submission of my change). I didn't look
into that though.

Best regards
Uwe

 sound/soc/soc-topology-test.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 225d74355974..51d650bb05b7 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -313,8 +313,7 @@ static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	snd_soc_unregister_card(&kunit_comp->card);
 
 	snd_soc_unregister_component(test_dev);
 }
@@ -377,8 +376,7 @@ static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	snd_soc_unregister_card(&kunit_comp->card);
 
 	snd_soc_unregister_component(test_dev);
 }
@@ -426,8 +424,7 @@ static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	snd_soc_unregister_card(&kunit_comp->card);
 
 	snd_soc_unregister_component(test_dev);
 }
@@ -482,8 +479,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	snd_soc_unregister_card(&kunit_comp->card);
 
 	snd_soc_unregister_component(test_dev);
 }
@@ -538,8 +534,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	snd_soc_unregister_card(&kunit_comp->card);
 
 	snd_soc_unregister_component(test_dev);
 }
@@ -594,8 +589,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	snd_soc_unregister_card(&kunit_comp->card);
 
 	snd_soc_unregister_component(test_dev);
 }
@@ -653,8 +647,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *tes
 	/* cleanup */
 	snd_soc_unregister_component(test_dev);
 
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	snd_soc_unregister_card(&kunit_comp->card);
 }
 
 // TEST CASE
@@ -702,8 +695,7 @@ static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 	snd_soc_unregister_component(test_dev);
 
 	/* cleanup */
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	snd_soc_unregister_card(&kunit_comp->card);
 }
 
 // TEST CASE
@@ -755,8 +747,7 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 	}
 
 	/* cleanup */
-	ret = snd_soc_unregister_card(&kunit_comp->card);
-	KUNIT_EXPECT_EQ(test, 0, ret);
+	snd_soc_unregister_card(&kunit_comp->card);
 }
 
 // TEST CASE
@@ -804,8 +795,7 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_card(struct kunit *test)
 		if (ret != 0 && ret != -EPROBE_DEFER)
 			KUNIT_FAIL(test, "Failed to register card");
 
-		ret = snd_soc_unregister_card(&kunit_comp->card);
-		KUNIT_EXPECT_EQ(test, 0, ret);
+		snd_soc_unregister_card(&kunit_comp->card);
 	}
 
 	/* cleanup */

base-commit: 1892a991886ace2c3450bec801df2cf4028a803a
-- 
2.36.1
