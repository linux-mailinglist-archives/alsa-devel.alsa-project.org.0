Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6C46BB818
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:39:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E7D21435;
	Wed, 15 Mar 2023 16:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E7D21435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894768;
	bh=CX53kDhH+rgYcvpQwWo4admZmaf2ZIfuHupUwI3i/sE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dEHZZ0hqIlGJ+i46xLgGt2EIiUiERlDZqgpQFSvccQnhTbrKZop9VhW247PNnx8oP
	 nzxK6EA9qszgPobNJ352uu0CaCOUdp4Q6y2+jILkpyL4hNXXoE009w79UGS2XoZeOV
	 NPLFqJniWmNtiv5+7Xwpi7u6GMG9QundIehrwhdk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B235DF804B1;
	Wed, 15 Mar 2023 16:14:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E83EF805F3; Wed, 15 Mar 2023 16:10:10 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 52BA4F80600
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52BA4F80600
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjr-0008VN-7o; Wed, 15 Mar 2023 16:08:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjn-004Kcb-AW; Wed, 15 Mar 2023 16:08:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-0057jH-D8; Wed, 15 Mar 2023 16:08:22 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 116/173] ASoC: pxa: mmp-sspa: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:48 +0100
Message-Id: <20230315150745.67084-117-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=CX53kDhH+rgYcvpQwWo4admZmaf2ZIfuHupUwI3i/sE=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMaQI3usziW9t6CyqslnGm7hc0qhSxEWkzYHr7eKyOm89L
 yevA7qdjMYsDIxcDLJiiix1RVpiEyTW/LcrWcINM4iVCWQKAxenAEzEQIH9v9P3vbVsF9w/P/SQ
 3dZ7Q3ZV4nUF99Tq1sSdLx/Ffrpzk9socfpXL3P+aKneq91CThK/l+X6W7qzXfNJXHj8yP2n19a
 /Wbtv2m21XWZXXsR531rLks5so7bdRT9+qUd9b0S+5sZN/PMumLv0Pus9duJaYRLD6Sjp1X1FTJ
 cWiV3jmqklI7RIbueLh1N8OratUvdhPaiRdTjpEd+NXbkJoh3L7XN+WQoyMeYd4NguWNgvuElho
 cEK5lfF1UmKf4veOMvr1pwRDmkrmb3slzh394ev/8/4H+teqvjt00LDZ1khSe9ie2fMFirPmmZW
 4neN2dO3VMPz2cxtBbY6SaEfDh27xG0ssOeCz2tmbWZHAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 2JCSUV63VGO7SDCCW3IDB2ZEGC37IU4K
X-Message-ID-Hash: 2JCSUV63VGO7SDCCW3IDB2ZEGC37IU4K
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2JCSUV63VGO7SDCCW3IDB2ZEGC37IU4K/>
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
 sound/soc/pxa/mmp-sspa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index b3c1744eff91..a1ed141b8795 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -545,7 +545,7 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int asoc_mmp_sspa_remove(struct platform_device *pdev)
+static void asoc_mmp_sspa_remove(struct platform_device *pdev)
 {
 	struct sspa_priv *sspa = platform_get_drvdata(pdev);
 
@@ -553,11 +553,10 @@ static int asoc_mmp_sspa_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	if (pdev->dev.of_node)
-		return 0;
+		return;
 
 	clk_put(sspa->audio_clk);
 	clk_put(sspa->sysclk);
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -575,7 +574,7 @@ static struct platform_driver asoc_mmp_sspa_driver = {
 		.of_match_table = of_match_ptr(mmp_sspa_of_match),
 	},
 	.probe = asoc_mmp_sspa_probe,
-	.remove = asoc_mmp_sspa_remove,
+	.remove_new = asoc_mmp_sspa_remove,
 };
 
 module_platform_driver(asoc_mmp_sspa_driver);
-- 
2.39.2

