Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3BD79F042
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 19:18:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CCA0DF1;
	Wed, 13 Sep 2023 19:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CCA0DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694625480;
	bh=VdPnDR7EvN8kuof2TFWTZ5dCSF/ImyErGYTlppRy29A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Au+NkZ+yVrHsu1qATikoq4F9dHl6o002//DRKwQZOMkr2+Zw/B9jrcGNbbJsfvedc
	 AYwHr4AoKxqELkVSJ7ueU4TUGhkbJV5axvQptADLZ2syT32wmYV0PAhlaZSwbAZmvF
	 5/ptw4ynuGvoCdPjjD4BowsHeLfuC1bSn46CxVwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A469F80580; Wed, 13 Sep 2023 19:16:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8939F80571;
	Wed, 13 Sep 2023 19:16:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3892F80578; Wed, 13 Sep 2023 19:16:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-216.mta0.migadu.com (out-216.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::d8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37318F80570
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 19:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37318F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=ZFkMudF4
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694625381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3FeZkXz+JQqXeiU3HazldI8mgv0sJ787/pyCTmTegd4=;
	b=ZFkMudF4vLRf2wwyLkRMjGNESmuzTssdLkRAglApAJ8yPv6gK4CSmiVmSozhR/msO9T1X0
	cwe809Oob+FAKFsjPNz50zFhGBQ6/MCMc1ZqLlbRyDxgja44nq1wiNyMteDtGAob8nGyaR
	5ImsryHJjxA4FjkZpt6MY9Hi3jc7QgOLDHRYjP0oZj9ntRl9OdCRjCGGJTBvNDI7CnYOZx
	FOb9TDIIXM03aX7F+vEO2AP+PNTKhYSIlmGy1TYSmYKNeUMbI0/XCxvfLNV13unO0eurm3
	X5O334si6FTqxRHh0IBJoZ9i+yGS3mhJ6pvlWEJo5n/we4vWKmDit3H4xCe/Rg==
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
Subject: [PATCH v2 2/3] ASoC: wm8782: Use wlf,fsampen device tree property
Date: Thu, 14 Sep 2023 03:15:51 +1000
Message-ID: <20230913171552.92252-3-contact@jookia.org>
In-Reply-To: <20230913171552.92252-1-contact@jookia.org>
References: <20230913171552.92252-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: KM6LEUN3RJ3L5PBZA5S7AVOX7ZS7QPQ4
X-Message-ID-Hash: KM6LEUN3RJ3L5PBZA5S7AVOX7ZS7QPQ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KM6LEUN3RJ3L5PBZA5S7AVOX7ZS7QPQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wm8782 supports rates 96kHz and 192kHz as long as the hardware
is configured properly. Allow this to be specified in the device tree.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/codecs/wm8782.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 63ab63f3189a..249b58b093d6 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -122,8 +122,9 @@ static const struct snd_soc_component_driver soc_component_dev_wm8782 = {
 static int wm8782_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct wm8782_priv *priv;
-	int ret, i;
+	int ret, i, fsampen;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -139,8 +140,26 @@ static int wm8782_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* For configurations with FSAMPEN=0 */
-	priv->max_rate = 48000;
+	// Assume lowest value by default to avoid inadvertent overclocking
+	fsampen = 0;
+
+	if (np)
+		of_property_read_u32(np, "wlf,fsampen", &fsampen);
+
+	switch (fsampen) {
+	case 0:
+		priv->max_rate = 48000;
+		break;
+	case 1:
+		priv->max_rate = 96000;
+		break;
+	case 2:
+		priv->max_rate = 192000;
+		break;
+	default:
+		dev_err(dev, "Invalid wlf,fsampen value");
+		return -EINVAL;
+	}
 
 	return devm_snd_soc_register_component(&pdev->dev,
 			&soc_component_dev_wm8782, &wm8782_dai, 1);
-- 
2.42.0

