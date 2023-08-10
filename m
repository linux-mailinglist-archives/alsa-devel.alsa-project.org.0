Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5A778869
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 09:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F6EF846;
	Fri, 11 Aug 2023 09:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F6EF846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691739663;
	bh=3jAdc6zqgHguZYmqLbCBKnJUNfatNFVyOrDYZanp+ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LCa8BQMd4qCEE5zKsBROjU0B8dzY3QQHTVTDr3C/KhgEIkv8aGVuD00le525a1lnR
	 JiocDeUUPdkHhxUzTHjN+WgI3vfagbr/ggVrNbO7cogRMCneulSm/Tlme+urGliExp
	 D9M9k51n4mTVPhaZ2drP4PWtrFWBnOP0pqtscxFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CC2EF80578; Fri, 11 Aug 2023 09:39:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE26F80552;
	Fri, 11 Aug 2023 09:39:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 120EDF8016E; Fri, 11 Aug 2023 00:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-87.mta0.migadu.com (out-87.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCC99F80134
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 00:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCC99F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=m0z6cPN5
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691707790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWH/gVI2uwLGog9wayY3+Gon/swcoOVqlujmFzUv5MY=;
	b=m0z6cPN5yIKtAfUFKRi5hoLxNWAqVdrpSlpIF3O8XoWF+UM/oyPodVa9TB3ff5yFHjDXdJ
	Fw5bR8UmYBmhG0IJ6KIR13Zde1b27f13T/TGtU+sVDj49kbD0Ti8QxLHcRQrIXbCfMXGF7
	Egca2cmOGhvFeFV+TisTCfYI43vTwpJlAbshHAmka9w5fdzSH+N+svhnUOFTolmrCAdc6f
	77b2s3f98qk7spjBnaM+5DjwmwZEdvOtuIO2UlrkpiKkmLniy/JyXG+xElQVmSlOFxRiE3
	TLoSDZ+mh8QigcmkMbF2gJC1AEEEA0jJx4y3BWaso0TPJKScp6y++vfswy3TPg==
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
Subject: [PATCH 2/3] ASoC: wm8782: Use max-rate device tree property
Date: Fri, 11 Aug 2023 08:49:29 +1000
Message-ID: <20230810224930.3216717-3-contact@jookia.org>
In-Reply-To: <20230810224930.3216717-1-contact@jookia.org>
References: <20230810224930.3216717-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MHRK5HL63JY6GCNSG6Z65Z5CZQ6ROUUO
X-Message-ID-Hash: MHRK5HL63JY6GCNSG6Z65Z5CZQ6ROUUO
X-Mailman-Approved-At: Fri, 11 Aug 2023 07:39:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHRK5HL63JY6GCNSG6Z65Z5CZQ6ROUUO/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wm8782 supports rates 96kHz and 192kHz as long as the hardware
is configured properly. Allow this to be specified in the device tree.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/codecs/wm8782.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 63ab63f3189a..6a2f29ee897c 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -122,6 +122,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm8782 = {
 static int wm8782_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct wm8782_priv *priv;
 	int ret, i;
 
@@ -139,9 +140,12 @@ static int wm8782_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* For configurations with FSAMPEN=0 */
+	/* Assume lowest value by default to avoid inadvertent overclocking */
 	priv->max_rate = 48000;
 
+	if (np)
+		of_property_read_u32(np, "max-rate", &priv->max_rate);
+
 	return devm_snd_soc_register_component(&pdev->dev,
 			&soc_component_dev_wm8782, &wm8782_dai, 1);
 }
-- 
2.41.0

