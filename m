Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C4896820
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 10:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F37902C51;
	Wed,  3 Apr 2024 10:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F37902C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712132108;
	bh=cHRmsqunH9hP/qtXbd35N4JkMuQoGtu0x3hJ4tAgdrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jIVUULajoFbMRoTspd8sJA+8/4ZernwTzHZf+FOQQwSvuSiSnXhsg/GLDRCRNBg4t
	 My9sSi+MxQK1ZHqSIWdYpNDlm4MTlwsV9Rumtpaxy7L9YFwltF7bLynjkyd3+yKkqe
	 lAOdf9VJJ3V0bsETCJut/XK6MicZzsUwEG4Xgv+A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA10DF80587; Wed,  3 Apr 2024 10:14:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC84F80570;
	Wed,  3 Apr 2024 10:14:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44E9EF8020D; Wed,  3 Apr 2024 10:13:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB3D4F8015B
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 10:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB3D4F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mL4FfJyz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0D4260C0B;
	Wed,  3 Apr 2024 08:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95395C433C7;
	Wed,  3 Apr 2024 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712132000;
	bh=cHRmsqunH9hP/qtXbd35N4JkMuQoGtu0x3hJ4tAgdrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mL4FfJyzLl9gsq+QwjOIrerxmGhTo6GDqw+UdiO+FN1TNPbQ1HU4hUHSq50YrgXyO
	 hXHcEM4a1AfR/UMk2OlDEdOtkZ7hLM16HAr75p42zC3E/fZmTMFFvDziVxgFQIRCfO
	 0qPx53oM278y1D0ZnnomrHkf/8qt46zlW41rrmspumuSLR/CwOXBD8PAekA0tR4SV5
	 n6RyEQgcFzrrp4y18VqL/jxAFRC0t2QR05D1FAIqEsfiAca752UIyw7Aktq+IPx3TC
	 n1oRUic3ZgN8V1orOq8yfxAiWatGMFmTrfPdsjirFu3CT0SmC51Inan5tHzb3m4Wdy
	 OZORH7MZL3gMw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yinchuan Guo <guoych37@mail2.sysu.edu.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 32/34] ASoC: remove incorrect of_match_ptr/ACPI_PTR
 annotations
Date: Wed,  3 Apr 2024 10:06:50 +0200
Message-Id: <20240403080702.3509288-33-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MEHZRAJQQIAGWFVUZJLMGW3RBFHLTBBU
X-Message-ID-Hash: MEHZRAJQQIAGWFVUZJLMGW3RBFHLTBBU
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEHZRAJQQIAGWFVUZJLMGW3RBFHLTBBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

When building with CONFIG_OF and/or CONFIG_ACPI disabled but W=1 extra
warnings enabled, a lot of driver cause a warning about an unused
ID table:

sound/soc/atmel/sam9x5_wm8731.c:187:34: error: unused variable 'sam9x5_wm8731_of_match' [-Werror,-Wunused-const-variable]
sound/soc/codecs/rt5514-spi.c:496:34: error: unused variable 'rt5514_of_match' [-Werror,-Wunused-const-variable]
sound/soc/samsung/aries_wm8994.c:524:34: error: unused variable 'samsung_wm8994_of_match' [-Werror,-Wunused-const-variable]

The fix is always to just remove the of_match_ptr() and ACPI_PTR() wrappers
that remove the reference, rather than adding another #ifdef just for build
testing for a configuration that doesn't matter in practice.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
 sound/soc/atmel/sam9x5_wm8731.c      | 2 +-
 sound/soc/codecs/rt5514-spi.c        | 2 +-
 sound/soc/qcom/lpass-sc7280.c        | 2 +-
 sound/soc/samsung/aries_wm8994.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index d6cdb6d9fdd6..ffc105759994 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -543,7 +543,7 @@ MODULE_DEVICE_TABLE(acpi, acp3x_audio_acpi_match);
 static struct platform_driver acp3x_audio = {
 	.driver = {
 		.name = "acp3x-alc5682-max98357",
-		.acpi_match_table = ACPI_PTR(acp3x_audio_acpi_match),
+		.acpi_match_table = acp3x_audio_acpi_match,
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = acp3x_probe,
diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index d1c1f370a9cd..95c8c37478a3 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -193,7 +193,7 @@ MODULE_DEVICE_TABLE(of, sam9x5_wm8731_of_match);
 static struct platform_driver sam9x5_wm8731_driver = {
 	.driver = {
 		.name = DRV_NAME,
-		.of_match_table = of_match_ptr(sam9x5_wm8731_of_match),
+		.of_match_table = sam9x5_wm8731_of_match,
 	},
 	.probe = sam9x5_wm8731_driver_probe,
 	.remove_new = sam9x5_wm8731_driver_remove,
diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index f475c8cfadae..da397db8d7d5 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -503,7 +503,7 @@ static struct spi_driver rt5514_spi_driver = {
 	.driver = {
 		.name = "rt5514",
 		.pm = &rt5514_pm_ops,
-		.of_match_table = of_match_ptr(rt5514_of_match),
+		.of_match_table = rt5514_of_match,
 	},
 	.probe = rt5514_spi_probe,
 };
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 47c622327a8d..c91620128fd4 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -441,7 +441,7 @@ MODULE_DEVICE_TABLE(of, sc7280_lpass_cpu_device_id);
 static struct platform_driver sc7280_lpass_cpu_platform_driver = {
 	.driver = {
 		.name = "sc7280-lpass-cpu",
-		.of_match_table = of_match_ptr(sc7280_lpass_cpu_device_id),
+		.of_match_table = sc7280_lpass_cpu_device_id,
 		.pm = &sc7280_lpass_pm_ops,
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index a548ac33dd94..9f7318c4ee33 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -689,7 +689,7 @@ static int aries_audio_probe(struct platform_device *pdev)
 static struct platform_driver aries_audio_driver = {
 	.driver		= {
 		.name	= "aries-audio-wm8994",
-		.of_match_table = of_match_ptr(samsung_wm8994_of_match),
+		.of_match_table = samsung_wm8994_of_match,
 		.pm	= &snd_soc_pm_ops,
 	},
 	.probe		= aries_audio_probe,
-- 
2.39.2

