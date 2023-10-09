Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E557BD6D2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 11:23:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C52AE8;
	Mon,  9 Oct 2023 11:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C52AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696843422;
	bh=26z5dwfBVv8uNLLkaBoXVqJ2/KKNhn+09EFI0ePmRQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i9yCizoi1S7ieumYFd9D+QBm/LPvr4cVg7fD7UZOVDvlwFM0QEygejtQM5tbQHWse
	 eSafQQ5t69sqYzJWfMtClxJkv69biNemJPAcQUXBIF49m4G9dR0o3va9WkYPTSnveW
	 K9Lk2x7GKXtAFtqZ93wcAVbNeeIZhIO11WLFxYKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6151F8055A; Mon,  9 Oct 2023 11:22:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56ADCF802BE;
	Mon,  9 Oct 2023 11:22:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98985F80310; Mon,  9 Oct 2023 11:22:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CD3BF80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 11:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CD3BF80166
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpmTD-0006se-M8; Mon, 09 Oct 2023 11:22:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpmTC-000NWW-QH; Mon, 09 Oct 2023 11:22:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpmTC-00C4p1-HB; Mon, 09 Oct 2023 11:22:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/20] pinctrl: cirrus: madera-core: Convert to platform
 remove callback returning void
Date: Mon,  9 Oct 2023 10:38:40 +0200
Message-Id: <20231009083856.222030-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=26z5dwfBVv8uNLLkaBoXVqJ2/KKNhn+09EFI0ePmRQg=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhlTlPcyLrj76ufie/uJEWe5rEaxxUsbXZzfNSbtxO+Gg6
 uwSm+M2nYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMRFKe/X+hyM/6vsxPDw62
 hMcmBvn6BOm82a06IVqFne2v4o0vCR+qM6dmZ/mvC00K3xc6QWnKrvbXRVaW9dK9j17p23wsuDP
 HbvGzpVmrIjIXSTYeyjvs+WZv1L3q3bpVjVlrTCPdbtq8eKkXf+Rp1LQvGnM6uJPPdTNfrLT1M0
 sSm6D3iPF6rrmLwMtvdRNuWihMm+NYmPzUybBvVQAb3+LMk2ItuRWHb9zwMAqSNjcQf6he43MpM
 FLKRaDXLH22XIGMwOIovzdSfRZWzhNnq72sMOsK333QX6vpQUKZ4ZOJKpcMJs8pufn2yjrhHHE3
 J5GMfoHbX8OiZj/RutK/Xa3o5hynl3ziendCZNtCNNcCAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: IW736K6KCM5T24BQLOLTWFDERZ4WR6YA
X-Message-ID-Hash: IW736K6KCM5T24BQLOLTWFDERZ4WR6YA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IW736K6KCM5T24BQLOLTWFDERZ4WR6YA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index bb589922d8c5..898b197c3738 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1084,19 +1084,17 @@ static int madera_pin_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int madera_pin_remove(struct platform_device *pdev)
+static void madera_pin_remove(struct platform_device *pdev)
 {
 	struct madera_pin_private *priv = platform_get_drvdata(pdev);
 
 	if (priv->madera->pdata.gpio_configs)
 		pinctrl_unregister_mappings(priv->madera->pdata.gpio_configs);
-
-	return 0;
 }
 
 static struct platform_driver madera_pin_driver = {
 	.probe = madera_pin_probe,
-	.remove = madera_pin_remove,
+	.remove_new = madera_pin_remove,
 	.driver = {
 		.name = "madera-pinctrl",
 	},
-- 
2.40.1

