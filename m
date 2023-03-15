Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E126BB807
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:37:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C74C01435;
	Wed, 15 Mar 2023 16:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C74C01435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894626;
	bh=q5ZoqELeT9ugGnG/PcrKCdPub+WjB5Fj5qh1kwUtOiY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iEUs5avAVfqD5uWhZDGAOWCnbX9GIb70NuTk3b559KJStaGkouaeJXpIl0roE1zFn
	 Gb7Tq55nEEP8jzYXiVzg0lb/U0DKavvJV8ex10z/kn0huV6zAn4aNejp/H08uS1GiX
	 idCaAaBGYt71LxYOIfW5HL++7JXoBfd8SNFN8z08=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFE8DF80818;
	Wed, 15 Mar 2023 16:14:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7A9CF805E3; Wed, 15 Mar 2023 16:10:01 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7732FF805F3
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7732FF805F3
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-0008M0-2R; Wed, 15 Mar 2023 16:08:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-004Kbg-KI; Wed, 15 Mar 2023 16:08:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-0057iZ-S0; Wed, 15 Mar 2023 16:08:19 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lior Amsalem <alior@marvell.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Hezi Shahmoon <hezi@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>
Subject: [PATCH 105/173] ASoC: kirkwood: kirkwood-i2s: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:37 +0100
Message-Id: <20230315150745.67084-106-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=q5ZoqELeT9ugGnG/PcrKCdPub+WjB5Fj5qh1kwUtOiY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5oCXV5HCi3JvU9ud2Vcd09gk47TPlfqEMId
 wYK7c7MWVuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeaAAKCRDB/BR4rcrs
 CURSB/9Gd2Bhb+mdNsIG3pHZYe9XF2ZuWogHU0rVbr9h9tPhw4cEoHdpfMqUYfbZZDnFMC8cSLM
 5rK6tgNuH3o0QEpUpTH467V+J47pK6xj/HaigFafOhGd8aZjilCVT53H+mh5RtDsXybQmYLjwVN
 PBwS8UnPLMywbrTDY10n3QliIkXlJOiXthfaJoO+uKF1ZjPheuFcjtvXElWUStH9xS8BLZclpRx
 Q4wOlgJTV0sG1n6TfziQsnM1kSB0gd1QofM3gp2LDrK9IynyqrCUyfJpzBmniIlrrTUufJWUNS9
 s7OM/bFj4Yt+ihP7o9+e73CTDW199LD/Fggu0HLw5ova8Fgv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: KXV4GSEMSULI5UFRTAZ6PKNU5VHNWFYD
X-Message-ID-Hash: KXV4GSEMSULI5UFRTAZ6PKNU5VHNWFYD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXV4GSEMSULI5UFRTAZ6PKNU5VHNWFYD/>
List-Archive: <>
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
 sound/soc/kirkwood/kirkwood-i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index afdf7d61e4c5..d1eb90310afa 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -736,7 +736,7 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int kirkwood_i2s_dev_remove(struct platform_device *pdev)
+static void kirkwood_i2s_dev_remove(struct platform_device *pdev)
 {
 	struct kirkwood_dma_data *priv = dev_get_drvdata(&pdev->dev);
 
@@ -744,8 +744,6 @@ static int kirkwood_i2s_dev_remove(struct platform_device *pdev)
 	if (!IS_ERR(priv->extclk))
 		clk_disable_unprepare(priv->extclk);
 	clk_disable_unprepare(priv->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -761,7 +759,7 @@ MODULE_DEVICE_TABLE(of, mvebu_audio_of_match);
 
 static struct platform_driver kirkwood_i2s_driver = {
 	.probe  = kirkwood_i2s_dev_probe,
-	.remove = kirkwood_i2s_dev_remove,
+	.remove_new = kirkwood_i2s_dev_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(mvebu_audio_of_match),
-- 
2.39.2

