Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A57C9037
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 00:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB7883B;
	Sat, 14 Oct 2023 00:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB7883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697235820;
	bh=yF2Q7ng4BO/0bNqNzg+OGX3edKvUXFE8sRAPvpn8ZJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GvZ/1miQCxWjLsiGhLpapqKQ84Rh5RcT8CPZAslmIktCZW+9wxKxbyv/VzPMGsi5I
	 TLDGjuiy5SP+eDWWEC63xNY07vJ+twy3zFAwk7+N7d+KBx+W039yq7FZeD1TcKXaN7
	 7+/Mb03guZ0YW4rDYYrnkDGr14/PyLif1H12AUJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96529F805A0; Sat, 14 Oct 2023 00:21:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7875F805A9;
	Sat, 14 Oct 2023 00:21:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53BDCF802E8; Sat, 14 Oct 2023 00:20:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7486FF8027B
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 00:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7486FF8027B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVw-0003uC-6H; Sat, 14 Oct 2023 00:20:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-001URD-JE; Sat, 14 Oct 2023 00:20:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-00FrH4-9h; Sat, 14 Oct 2023 00:20:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 5/7] ASoC: meson: Make meson_card_remove() return void
Date: Sat, 14 Oct 2023 00:19:51 +0200
Message-ID: <20231013221945.1489203-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2962;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=yF2Q7ng4BO/0bNqNzg+OGX3edKvUXFE8sRAPvpn8ZJo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKcKHnrjMUvX5oysin1crHzg1x1xYF02Horo6o
 vPoRHC1nheJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSnChwAKCRCPgPtYfRL+
 Tmm+CACpOts6HE9b9hyqqncrhckXQLavS2qdjGfrlZ74Retu3o4BrjF0Ho9Eep0YyRBFa/GO9zk
 bLHgnB6Trr/uXT7wqct/v/1G0godBI9CqlvGQ3EMJnLo04jKjURN8Bv48BJe+cFxU3FWcTvPhzS
 zw+S1/+m3a+x4lD7EvUKIGvzyOvqNLFLyw3HWeqwchXjCbF/M7iiYMY17ikaPfdqEMQl//Xrqg7
 JFOGTHgPhFSYKICrH+y3m3+JikstRYb1amhs4lRHu62wqDOBsE7ZESaCQ/CGGLtHQAgbEtgSGCd
 OoEtVbD0rmSuRY7G9/04hQZgq+Xz84tFoF04Zo4ZSV8pv2ey
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 6DTCDUWNA4UTG42EQAE4DWJF7XUPUTMB
X-Message-ID-Hash: 6DTCDUWNA4UTG42EQAE4DWJF7XUPUTMB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DTCDUWNA4UTG42EQAE4DWJF7XUPUTMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code.  However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

meson_card_remove() returned zero unconditionally. Make it return void
instead and convert all users to struct platform_device::remove_new().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/meson/axg-card.c         | 2 +-
 sound/soc/meson/gx-card.c          | 2 +-
 sound/soc/meson/meson-card-utils.c | 4 +---
 sound/soc/meson/meson-card.h       | 2 +-
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 18b16274449e..3180aa4d3a15 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -360,7 +360,7 @@ MODULE_DEVICE_TABLE(of, axg_card_of_match);
 
 static struct platform_driver axg_card_pdrv = {
 	.probe = meson_card_probe,
-	.remove = meson_card_remove,
+	.remove_new = meson_card_remove,
 	.driver = {
 		.name = "axg-sound-card",
 		.of_match_table = axg_card_of_match,
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 01beac1d927f..f1539e542638 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -130,7 +130,7 @@ MODULE_DEVICE_TABLE(of, gx_card_of_match);
 
 static struct platform_driver gx_card_pdrv = {
 	.probe = meson_card_probe,
-	.remove = meson_card_remove,
+	.remove_new = meson_card_remove,
 	.driver = {
 		.name = "gx-sound-card",
 		.of_match_table = gx_card_of_match,
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index c81099218597..ed6c7e2f609c 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -327,13 +327,11 @@ int meson_card_probe(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(meson_card_probe);
 
-int meson_card_remove(struct platform_device *pdev)
+void meson_card_remove(struct platform_device *pdev)
 {
 	struct meson_card *priv = platform_get_drvdata(pdev);
 
 	meson_card_clean_references(priv);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(meson_card_remove);
 
diff --git a/sound/soc/meson/meson-card.h b/sound/soc/meson/meson-card.h
index a5374324a189..a0d693e4f460 100644
--- a/sound/soc/meson/meson-card.h
+++ b/sound/soc/meson/meson-card.h
@@ -49,6 +49,6 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 			   bool is_playback);
 
 int meson_card_probe(struct platform_device *pdev);
-int meson_card_remove(struct platform_device *pdev);
+void meson_card_remove(struct platform_device *pdev);
 
 #endif /* _MESON_SND_CARD_H */
-- 
2.42.0

