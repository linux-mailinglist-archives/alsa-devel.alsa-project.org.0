Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029AE7C903A
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 00:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CB4EDF1;
	Sat, 14 Oct 2023 00:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CB4EDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697235860;
	bh=rg4UGscGMxesn/Ng7C8DgLhgb75kOFpu1RFwbvoHWiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HmZhf3iKz5asK3dcHNfwXIO2mR34mBqLW/LC9RQ2jLY1akI4kuePE5vQ8FOOUx4oC
	 7sE7CzCYW8ehs1txZlWKnDUyms/QWaXvkQg/3QA7YdTU9o6Tm3KIBZ568F4lsrz0UG
	 5Fhw8qd4fgLwoIkYPgiTf+qr93+m2KyHt13olqyY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ACA2F802E8; Sat, 14 Oct 2023 00:23:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A25DF8027B;
	Sat, 14 Oct 2023 00:23:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC7DF802E8; Sat, 14 Oct 2023 00:23:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C035F8019B
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 00:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C035F8019B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVy-0003u5-Qp; Sat, 14 Oct 2023 00:20:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-001URA-CZ; Sat, 14 Oct 2023 00:20:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-00FrH0-2F; Sat, 14 Oct 2023 00:20:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wang Yufen <wangyufen@huawei.com>,
	Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Astrid Rost <astrid.rost@axis.com>,
	Robert Hancock <robert.hancock@calian.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Sameer Pujar <spujar@nvidia.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de,
	linux-tegra@vger.kernel.org
Subject: [PATCH 4/7] ASoC: simple-card-utils: Make simple_util_remove() return
 void
Date: Sat, 14 Oct 2023 00:19:50 +0200
Message-ID: <20231013221945.1489203-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4890;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=rg4UGscGMxesn/Ng7C8DgLhgb75kOFpu1RFwbvoHWiQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKcKGL/n3H0zBmYbBzfwwn0/S3LeJpoZbTMsSH
 HTIS/gbK3eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSnChgAKCRCPgPtYfRL+
 TvXzB/9OK2CuojbMg5wW/zm2mMiLcGkVhvxLYL1K6cFryasc2dPnJbFSnIY6yfLP0u6LmlzxOKX
 8StxWYXnpVTuM89nzV7jz1lO/wM3Lymb0pg16hOyo4XFGXc2prKtCEhmPz2ZJdUxi08GyxJTXdC
 pPwnQcAmqpwk2O7v58LpC4AyBFFRxbCGdMba2CZDz3wQ8o3MxcflT7zEJzBJiiYnW90jQqUAbX4
 xprDn/3PGncmua3RkVvA6VJpp3J5Upano0KXw1p+LPk4S+LpxP9qzqI15jAUWU3fZ0YdF7/9Sbv
 R+HovEKevmUBv33CbkfJv90pZIinxbr5vq/oSadeBE1UShgQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 6AW7XOHAF3SABM3FVQLFILYTKBHA3CFR
X-Message-ID-Hash: 6AW7XOHAF3SABM3FVQLFILYTKBHA3CFR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AW7XOHAF3SABM3FVQLFILYTKBHA3CFR/>
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

simple_util_remove() returned zero unconditionally. Make it return void
instead and convert all users to struct platform_device::remove_new().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/sound/simple_card_utils.h                   | 2 +-
 sound/soc/generic/audio-graph-card.c                | 2 +-
 sound/soc/generic/audio-graph-card2-custom-sample.c | 2 +-
 sound/soc/generic/audio-graph-card2.c               | 2 +-
 sound/soc/generic/simple-card-utils.c               | 4 +---
 sound/soc/generic/simple-card.c                     | 2 +-
 sound/soc/tegra/tegra_audio_graph_card.c            | 2 +-
 7 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 18e7a0b89395..e5da10b4c43b 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -188,7 +188,7 @@ int simple_util_init_aux_jacks(struct simple_util_priv *priv,
 				char *prefix);
 int simple_util_init_priv(struct simple_util_priv *priv,
 			       struct link_info *li);
-int simple_util_remove(struct platform_device *pdev);
+void simple_util_remove(struct platform_device *pdev);
 
 int graph_util_card_probe(struct snd_soc_card *card);
 int graph_util_is_ports0(struct device_node *port);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 704f32bda24d..76a9f1e8cdd5 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -644,7 +644,7 @@ static struct platform_driver graph_card = {
 		.of_match_table = graph_of_match,
 	},
 	.probe = graph_probe,
-	.remove = simple_util_remove,
+	.remove_new = simple_util_remove,
 };
 module_platform_driver(graph_card);
 
diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.c b/sound/soc/generic/audio-graph-card2-custom-sample.c
index 4dc65e249ecb..1b6ccd2de964 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.c
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.c
@@ -176,7 +176,7 @@ static struct platform_driver custom_card = {
 		.of_match_table = custom_of_match,
 	},
 	.probe	= custom_probe,
-	.remove	= simple_util_remove,
+	.remove_new = simple_util_remove,
 };
 module_platform_driver(custom_card);
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 1344e1adfc67..7146611df730 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1224,7 +1224,7 @@ static struct platform_driver graph_card = {
 		.of_match_table = graph_of_match,
 	},
 	.probe	= graph_probe,
-	.remove	= simple_util_remove,
+	.remove_new = simple_util_remove,
 };
 module_platform_driver(graph_card);
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 11f186ea662a..cfa70a56ff0f 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -958,13 +958,11 @@ int simple_util_init_priv(struct simple_util_priv *priv,
 }
 EXPORT_SYMBOL_GPL(simple_util_init_priv);
 
-int simple_util_remove(struct platform_device *pdev)
+void simple_util_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
 	simple_util_clean_reference(card);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(simple_util_remove);
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 048357ae7ae6..9c79ff6a568f 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -827,7 +827,7 @@ static struct platform_driver simple_card = {
 		.of_match_table = simple_of_match,
 	},
 	.probe = simple_probe,
-	.remove = simple_util_remove,
+	.remove_new = simple_util_remove,
 };
 
 module_platform_driver(simple_card);
diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 8b48813c2c59..feba9d42bbc5 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -248,7 +248,7 @@ static struct platform_driver tegra_audio_graph_card = {
 		.of_match_table = graph_of_tegra_match,
 	},
 	.probe = tegra_audio_graph_probe,
-	.remove = simple_util_remove,
+	.remove_new = simple_util_remove,
 };
 module_platform_driver(tegra_audio_graph_card);
 
-- 
2.42.0

