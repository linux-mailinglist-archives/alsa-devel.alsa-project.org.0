Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E032A7C9036
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 00:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF79AEA;
	Sat, 14 Oct 2023 00:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF79AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697235788;
	bh=NRJs7bNLMD4lY8a8Vf+RrZRTY5Ve2yfdxKsArY8jPyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uiPUdHAJMyeCgFPwANuXDOqvBRg7BOv2SmjE/LQbfy3yLgrwLKJ43MThBzJ68qrYc
	 I2W1U2nQnq+mT0Y5++iJ/lW2tTy1jvoMn2XiOaeawAZW+jYmJhFoBr+iS+WqpM6QYg
	 opmDE1LIDIGaChORtHYzwYv31vSHlQeYh3VqAUbE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 177BEF80580; Sat, 14 Oct 2023 00:21:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98775F80587;
	Sat, 14 Oct 2023 00:21:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 579AFF802BE; Sat, 14 Oct 2023 00:20:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E629F80310
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 00:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E629F80310
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVw-0003ud-PV; Sat, 14 Oct 2023 00:20:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVw-001URK-1M; Sat, 14 Oct 2023 00:20:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-00FrHC-Ny; Sat, 14 Oct 2023 00:20:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 7/7] ASoC: uniphier: Make uniphier_aio_remove() return void
Date: Sat, 14 Oct 2023 00:19:53 +0200
Message-ID: <20231013221945.1489203-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3221;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=NRJs7bNLMD4lY8a8Vf+RrZRTY5Ve2yfdxKsArY8jPyI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKcKJxAOOwZo8A0nM1ztzYVQbZKOe148hr3/BD
 51JsdLSYBKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSnCiQAKCRCPgPtYfRL+
 TtNqCACRFDRxXpbfwRQ8G3682hQ1+Tl8TLhAMUnG9xT0DVK/7q2E5gA9h/SYFQbdeTa/lw3Ct8r
 F8dFPi3VuzqfGJcoN10MUimydDNs6+oFNQZ/A8Jai3/TbSbbczwMdXsREbXHkaL9J35TLw8CrFS
 6y59q7PK70HdLX+KIN0OWw5xfkn25igPF72lemRZsPKaaopwD2TlpEOxYqK1rZHC8m5W6jssr1i
 1qVmLkEx+PFIDRG2ekpdO3Oq/ZhS/ZGKykOHqfwkk6kCEBnCsZNg4JM+MnxFbu8qKmA0xn1D2fm
 3Re8KlVghC03CbRoUbf3B7kkBRR5l4DV0WUEGSQ+NgNiDZZY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: BU2USWXZALYBKUCHCEMGS2RAJHFCH4PO
X-Message-ID-Hash: BU2USWXZALYBKUCHCEMGS2RAJHFCH4PO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BU2USWXZALYBKUCHCEMGS2RAJHFCH4PO/>
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

uniphier_aio_remove() returned zero unconditionally.  Make it return
void instead and convert all users to struct
platform_device::remove_new().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/uniphier/aio-cpu.c  | 4 +---
 sound/soc/uniphier/aio-ld11.c | 2 +-
 sound/soc/uniphier/aio-pxs2.c | 2 +-
 sound/soc/uniphier/aio.h      | 2 +-
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index 7c5188477b7c..470f129166a4 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -822,14 +822,12 @@ int uniphier_aio_probe(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(uniphier_aio_probe);
 
-int uniphier_aio_remove(struct platform_device *pdev)
+void uniphier_aio_remove(struct platform_device *pdev)
 {
 	struct uniphier_aio_chip *chip = platform_get_drvdata(pdev);
 
 	reset_control_assert(chip->rst);
 	clk_disable_unprepare(chip->clk);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(uniphier_aio_remove);
 
diff --git a/sound/soc/uniphier/aio-ld11.c b/sound/soc/uniphier/aio-ld11.c
index 15dbded63804..01cc3b961999 100644
--- a/sound/soc/uniphier/aio-ld11.c
+++ b/sound/soc/uniphier/aio-ld11.c
@@ -347,7 +347,7 @@ static struct platform_driver uniphier_aio_driver = {
 		.of_match_table = of_match_ptr(uniphier_aio_of_match),
 	},
 	.probe    = uniphier_aio_probe,
-	.remove   = uniphier_aio_remove,
+	.remove_new = uniphier_aio_remove,
 };
 module_platform_driver(uniphier_aio_driver);
 
diff --git a/sound/soc/uniphier/aio-pxs2.c b/sound/soc/uniphier/aio-pxs2.c
index 305cb2a1253d..fba13a212bdb 100644
--- a/sound/soc/uniphier/aio-pxs2.c
+++ b/sound/soc/uniphier/aio-pxs2.c
@@ -256,7 +256,7 @@ static struct platform_driver uniphier_aio_driver = {
 		.of_match_table = of_match_ptr(uniphier_aio_of_match),
 	},
 	.probe    = uniphier_aio_probe,
-	.remove   = uniphier_aio_remove,
+	.remove_new = uniphier_aio_remove,
 };
 module_platform_driver(uniphier_aio_driver);
 
diff --git a/sound/soc/uniphier/aio.h b/sound/soc/uniphier/aio.h
index 09ccb47337fd..d9fd61dd976f 100644
--- a/sound/soc/uniphier/aio.h
+++ b/sound/soc/uniphier/aio.h
@@ -307,7 +307,7 @@ int uniphier_aiodma_soc_register_platform(struct platform_device *pdev);
 extern const struct snd_compress_ops uniphier_aio_compress_ops;
 
 int uniphier_aio_probe(struct platform_device *pdev);
-int uniphier_aio_remove(struct platform_device *pdev);
+void uniphier_aio_remove(struct platform_device *pdev);
 extern const struct snd_soc_dai_ops uniphier_aio_i2s_ld11_ops;
 extern const struct snd_soc_dai_ops uniphier_aio_i2s_pxs2_ops;
 extern const struct snd_soc_dai_ops uniphier_aio_spdif_ld11_ops;
-- 
2.42.0

