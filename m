Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 731167A36E4
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Sep 2023 19:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8694C1F2;
	Sun, 17 Sep 2023 19:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8694C1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694972373;
	bh=IG5qAjfPvHL3XAz4b1s4xtgJz0i0qpShD4OH3hO8YiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kHl4Vsgp1V2prJKe3AsGTPEKv/eMDkgMuqXNThpuSJWkIYkan7ITP5IZmFUQ3792C
	 0Gru7Lbhb7EpPoy28fEHpi3r6oEq9VBEmiyfcfwgVGYbNu/pbghb3/lOHlfWPDuLh8
	 E+g4IAjl20GqDfjuLMMr3XWYsqrP9KM/JM+BUGFw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E66E8F80564; Sun, 17 Sep 2023 19:37:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B17F80552;
	Sun, 17 Sep 2023 19:37:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09DABF801F5; Sun, 17 Sep 2023 19:37:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-214.mta0.migadu.com (out-214.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::d6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECE02F80125
	for <alsa-devel@alsa-project.org>; Sun, 17 Sep 2023 19:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECE02F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=qMxNLiGg
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694972264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzvX1zNT0X0Pb7ZYawRW0ysAeQBR279Tmloz2NWjDB8=;
	b=qMxNLiGgGTdCdti8zhfkaqKth8mGdP7i+e3GuWFeV0khatQpRSdJg74+gSffSHPQXRSIBt
	QYyKRwvMOZ4AiHpf50+fDrMwXJUhxndEf6XPS1iqNImvgxAIdRGJGzTfUPH6iz1KGdP9Q5
	Cnvmt9X8NT/aqdwyFFLlFb7AuzmJZWOfHkh9FoHZuQsLXgHmf3bMZgEsOXb9kidZQQNkHv
	+brOrbdY+ajdjtGtRlx49FEBPQ317PT7UuhPkWfnMLpZR2l2lbk66l52KR2GYJ9VyzFEGJ
	Fp3vaDWMpb5vcj3mM0y1cb6Am4hK/bSOEEEicTvqxKI1z9B//7FAvZucxSr1Zg==
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Watts <contact@jookia.org>,
	patches@opensource.cirrus.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] ASoC: wm8782: Constrain maximum audio rate at runtime
Date: Mon, 18 Sep 2023 03:37:24 +1000
Message-ID: <20230917173726.1916439-2-contact@jookia.org>
In-Reply-To: <20230917173726.1916439-1-contact@jookia.org>
References: <20230917173726.1916439-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: NWFMKLMM5JEJUQ4VGBZBDIHHKYCPWQ57
X-Message-ID-Hash: NWFMKLMM5JEJUQ4VGBZBDIHHKYCPWQ57
X-MailFrom: contact@jookia.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWFMKLMM5JEJUQ4VGBZBDIHHKYCPWQ57/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wm8782 supports up to 192kHz audio when pins are set correctly.
Instead of hardcoding which rates are supported constrain them at
runtime based on a max_rate variable.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/codecs/wm8782.c | 42 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 95ff4339d103..f3dc87b92b1e 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -23,6 +23,27 @@
 #include <sound/initval.h>
 #include <sound/soc.h>
 
+/* regulator power supply names */
+static const char *supply_names[] = {
+	"Vdda", /* analog supply, 2.7V - 3.6V */
+	"Vdd",  /* digital supply, 2.7V - 5.5V */
+};
+
+struct wm8782_priv {
+	struct regulator_bulk_data supplies[ARRAY_SIZE(supply_names)];
+	int max_rate;
+};
+
+static int wm8782_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime *runtime = sub->runtime;
+	struct wm8782_priv *priv =
+		snd_soc_component_get_drvdata(dai->component);
+
+	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+					   8000, priv->max_rate);
+}
+
 static const struct snd_soc_dapm_widget wm8782_dapm_widgets[] = {
 SND_SOC_DAPM_INPUT("AINL"),
 SND_SOC_DAPM_INPUT("AINR"),
@@ -33,28 +54,22 @@ static const struct snd_soc_dapm_route wm8782_dapm_routes[] = {
 	{ "Capture", NULL, "AINR" },
 };
 
+static const struct snd_soc_dai_ops wm8782_dai_ops = {
+	.startup = &wm8782_dai_startup,
+};
+
 static struct snd_soc_dai_driver wm8782_dai = {
 	.name = "wm8782",
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 2,
 		.channels_max = 2,
-		/* For configurations with FSAMPEN=0 */
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_8000_192000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE |
 			   SNDRV_PCM_FMTBIT_S20_3LE |
 			   SNDRV_PCM_FMTBIT_S24_LE,
 	},
-};
-
-/* regulator power supply names */
-static const char *supply_names[] = {
-	"Vdda", /* analog supply, 2.7V - 3.6V */
-	"Vdd",  /* digital supply, 2.7V - 5.5V */
-};
-
-struct wm8782_priv {
-	struct regulator_bulk_data supplies[ARRAY_SIZE(supply_names)];
+	.ops = &wm8782_dai_ops,
 };
 
 static int wm8782_soc_probe(struct snd_soc_component *component)
@@ -121,6 +136,9 @@ static int wm8782_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	/* For configurations with FSAMPEN=0 */
+	priv->max_rate = 48000;
+
 	return devm_snd_soc_register_component(&pdev->dev,
 			&soc_component_dev_wm8782, &wm8782_dai, 1);
 }
-- 
2.42.0

