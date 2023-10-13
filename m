Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B27C9039
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 00:24:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB61DDEB;
	Sat, 14 Oct 2023 00:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB61DDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697235840;
	bh=a4kF45rrvlrC2pNbdDyNnShL5GVx8qgLtcKs8E5z5Qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQz4I5PHrzId2XkZAldUlDmjKoxzK1X4aiZhn7EOQKoQ0zW5Unxqm1zCdnn62PJyX
	 1a5PYe87YM0ClLw1ZoDaJQMuojcpzRycY7QVfGc4VMmpOl+4iRztrZO/NIZrY7MzAl
	 +PvT4oukBdPCuGDQHnR9Xy55U9Hdd08Zf+qZBePg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04B93F805B5; Sat, 14 Oct 2023 00:21:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53F9BF805B5;
	Sat, 14 Oct 2023 00:21:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86A0AF802BE; Sat, 14 Oct 2023 00:20:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 302ABF80536
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 00:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 302ABF80536
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-0003u3-Vj; Sat, 14 Oct 2023 00:20:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVu-001UR4-Tq; Sat, 14 Oct 2023 00:20:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVu-00FrGr-Kb; Sat, 14 Oct 2023 00:20:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	kernel@pengutronix.de
Subject: [PATCH 2/7] ASoC: cs42l43: Convert to platform remove callback
 returning void
Date: Sat, 14 Oct 2023 00:19:48 +0200
Message-ID: <20231013221945.1489203-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=a4kF45rrvlrC2pNbdDyNnShL5GVx8qgLtcKs8E5z5Qw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKcKD3YpCG/9D3u+ByUWFdjShg45cyhLTHdzvQ
 Btobwn6wWyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSnCgwAKCRCPgPtYfRL+
 TrfGCACZBeXj7+ClQGVGgiOPkXB9M6c+VxkC/ADzb97xaJKGjc6Dg+VEmHaWV2H+0Z5hFVR3hVD
 ZgwZttu4H/L+uuI5seg2WfGhxRCWAt22ObFP9YHlUS4veCZ4Uhpwj3NLERYPypqmu7rLaEJ8tsG
 QEulSBlUyFmd8G0IO+vtSc+8aobe9i/YrSlhDyJpL78wI1x6MuSzO0C7k12xlsolvoVQwokI0de
 RP3mKFKiHPZ1OEi6Dl+ENvg0SpOuG0mkqhd5Uk+vVZZpMw7FxUW4bgaw3GLd668Alwfb7dGyTif
 Ar+bLYHft/4sA7NnlfleTircpcimH9NaVuxzv8QpL6d0hOA1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 6CSASBXK7GRTFGWLY6D5WYKHGEHMYJFL
X-Message-ID-Hash: 6CSASBXK7GRTFGWLY6D5WYKHGEHMYJFL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CSASBXK7GRTFGWLY6D5WYKHGEHMYJFL/>
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
 sound/soc/codecs/cs42l43.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 532183095818..d62c9f26c632 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2232,13 +2232,11 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cs42l43_codec_remove(struct platform_device *pdev)
+static void cs42l43_codec_remove(struct platform_device *pdev)
 {
 	struct cs42l43_codec *priv = platform_get_drvdata(pdev);
 
 	clk_put(priv->mclk);
-
-	return 0;
 }
 
 static int cs42l43_codec_runtime_resume(struct device *dev)
@@ -2269,7 +2267,7 @@ static struct platform_driver cs42l43_codec_driver = {
 	},
 
 	.probe		= cs42l43_codec_probe,
-	.remove		= cs42l43_codec_remove,
+	.remove_new	= cs42l43_codec_remove,
 	.id_table	= cs42l43_codec_id_table,
 };
 module_platform_driver(cs42l43_codec_driver);
-- 
2.42.0

