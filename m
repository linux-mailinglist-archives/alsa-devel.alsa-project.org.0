Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B477986C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 22:17:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A9E4846;
	Fri, 11 Aug 2023 22:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A9E4846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691785045;
	bh=5T6m5zTJR/icPSiP1uXX3ubyrA/veVn0IqzsYdtg638=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ct5C9F1FnfRxe+zgLW/VBuYZAjNFG0tgp8X0vrumZ+FyRFogsGaZkhepyMxjgeYaA
	 QS8pwjr69nclYqqZe+YYag1B1iXKg69tn7oPpUnJezwGtrx8RbUXG0imiPytb01X2i
	 P6qXVCdSsyFTBSy/oLno62jSXph6CKRcNv5uNVxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27C06F805C1; Fri, 11 Aug 2023 22:15:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF04BF805BE;
	Fri, 11 Aug 2023 22:15:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58DA3F805BF; Fri, 11 Aug 2023 22:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-77.mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B717F800EE
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 22:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B717F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=CD4lRSoh
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/hW1ak8KgoejCSW9QrrxKnaZZBYUUgvs8EvZwonWW7Q=;
	b=CD4lRSohS0DnXE6VQTtKXerkV30clc05gHhy1KjszANLvk8PDxlFSV7Qua/nro9kKonJHc
	e8eoHeaLZp5s7KZlNwDK34rkKsUWBfUCmWTCwRWVwy5QVgHHMZM8sSork3+go0HP+WS2zL
	+wBm7nWZHqrkbT8zDGGfazKRPg1VK2rWYNYP0YW6raQ/isdg1uta45WuZX3DZboZBPOXsr
	DA0c5ijB5Kpf3Kj+R7DF+Ni0j9/bqE9IkI7pP9wCtKYgDEMMQjTSXd1APKUViWkkroB+Sh
	CrJoPs2fjzC35iszArbzoMgCTxYKK2L00BJPuquI4sL0bH08DFY/JDbOupdFfg==
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Watts <contact@jookia.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/7] dt-bindings: sound: sun4i-i2s: Add channel-dins
 property
Date: Sat, 12 Aug 2023 06:14:05 +1000
Message-ID: <20230811201406.4096210-7-contact@jookia.org>
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
References: <20230811201406.4096210-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: HE4JWVPG3TDBJNFE6S3J4F5MYUVJMUML
X-Message-ID-Hash: HE4JWVPG3TDBJNFE6S3J4F5MYUVJMUML
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HE4JWVPG3TDBJNFE6S3J4F5MYUVJMUML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The R329 variant of the sun4i I2S controller supports multiple
data input pins (din pins) for receiving data. Each channel can have
its data input pin configured.

Allow this to be configured using a new channel-dins property.

Signed-off-by: John Watts <contact@jookia.org>
---
 .../sound/allwinner,sun4i-a10-i2s.yaml        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 739114fb6549..402549f9941c 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -52,6 +52,13 @@ properties:
       - const: apb
       - const: mod
 
+  channel-dins:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      This is a list of DIN pin numbers, each used for a receiving I2S
+      channel. Pins are mapped to channels based on array index.
+      Channel 0 is the first number, then channel 1, and so on.
+
   # Even though it only applies to subschemas under the conditionals,
   # not listing them here will trigger a warning because of the
   # additionalsProperties set to false.
@@ -144,4 +151,19 @@ examples:
         dma-names = "rx", "tx";
     };
 
+  - |
+    i2s0_d1: i2s@2032000 {
+            #sound-dai-cells = <0>;
+            compatible = "allwinner,sun20i-d1-i2s",
+                         "allwinner,sun50i-r329-i2s";
+            reg = <0x2032000 0x1000>;
+            interrupts = <0 26 0>;
+            clocks = <&ccu 86>, <&ccu 82>;
+            clock-names = "apb", "mod";
+            resets = <&ccu 34>;
+            dmas = <&dma 3>, <&dma 3>;
+            dma-names = "rx", "tx";
+            channel-dins = /bits/ 8 <0 0 1 1 2 2>;
+    };
+
 ...
-- 
2.41.0

