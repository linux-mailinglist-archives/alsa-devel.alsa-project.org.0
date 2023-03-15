Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF26BB89E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:53:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0AD154A;
	Wed, 15 Mar 2023 16:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0AD154A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895623;
	bh=dcUEPZbouxDhw5jZ6zxfPGfcIHaKSoZUnFxJMzyPH6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YoLLmQVofXMeMkv5z4PZBV9qdN1RIq3i0m42L2wne0MR9BWnIp2xmJOS3/fKOTiSL
	 I52MQRy/Zh5My7Ab/5O/Vaia8Ss2lWYxIQNG0LIt7rE8B4WWL0705BDjXrvOw/9L96
	 SlGGhhELj/vioycNAnNIYVuzcwCDCwrREUs0ScWQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C774F805FE;
	Wed, 15 Mar 2023 16:17:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E10F80623; Wed, 15 Mar 2023 16:10:59 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7490EF80571
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7490EF80571
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjx-0000NV-P0; Wed, 15 Mar 2023 16:08:33 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-004KeY-3x; Wed, 15 Mar 2023 16:08:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjr-0057ko-SU; Wed, 15 Mar 2023 16:08:27 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Li Chen <lchen@ambarella.com>
Subject: [PATCH 140/173] ASoC: sunxi: sun4i-codec: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:12 +0100
Message-Id: <20230315150745.67084-141-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=dcUEPZbouxDhw5jZ6zxfPGfcIHaKSoZUnFxJMzyPH6Y=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7XV6zQ4+UotaB6YV/1EzfFac8SlwxS4kQp8
 k/q2nF3AeqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe1wAKCRDB/BR4rcrs
 CcV8B/4oIH6x6tk/YRQDLKV6v15HwXFmVnUNTa0W7fbDK5dgM1GgbcInERGzQplFDwgpj2HBmr1
 8GWOMnsc6/D9XcydMoqhS2HFrU7qh22bi9cI5zzVfYhCMsjgC4AW0BKIVgsEyS1Zp5WjkLBqkHl
 K9oKofM17um9ldm/vxhdW19kSv+sr1hnxmCdrouDOS4NeQ1mKN/wY7852yucpb0i1ccJLDHQfYL
 kYPKZjikG0u/EGs0OwnHIT4V0dC/JSQWdMhFCD+YVr5FF7AFCz+riTaN1k15PZu/lYRXxjoJcgq
 TBasxx6CMo/4X7O/H5myD/3rd4S0n24ixUkBOK2a9yJcDvd8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: Y2W5VHRVAZMK7XXOZGRLUYNJLV3OE56B
X-Message-ID-Hash: Y2W5VHRVAZMK7XXOZGRLUYNJLV3OE56B
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
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
 sound/soc/sunxi/sun4i-codec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 835dc3404367..55328850aef5 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1821,7 +1821,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun4i_codec_remove(struct platform_device *pdev)
+static void sun4i_codec_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
@@ -1830,8 +1830,6 @@ static int sun4i_codec_remove(struct platform_device *pdev)
 	if (scodec->rst)
 		reset_control_assert(scodec->rst);
 	clk_disable_unprepare(scodec->clk_apb);
-
-	return 0;
 }
 
 static struct platform_driver sun4i_codec_driver = {
@@ -1840,7 +1838,7 @@ static struct platform_driver sun4i_codec_driver = {
 		.of_match_table = sun4i_codec_of_match,
 	},
 	.probe = sun4i_codec_probe,
-	.remove = sun4i_codec_remove,
+	.remove_new = sun4i_codec_remove,
 };
 module_platform_driver(sun4i_codec_driver);
 
-- 
2.39.2

