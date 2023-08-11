Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A8077986D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 22:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E7391CE;
	Fri, 11 Aug 2023 22:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E7391CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691785059;
	bh=rmvq/HQFDjVU+f2U0kTPfsArn0F4LVVQzHyN+2OF4Qg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tfQABfAFm66F+JfI/ejr2rlwTTRGgEEmGITRWuwSEqfh4GWRatfnyJXigUie742bp
	 BfxMHMjybYffKinj5zQ0Iy82yLKMWxXN4G2lU7E4HI3v+cdaguAsd28AI9GmwpAx48
	 cQG9BcHk68q3qcX6sSlPEm/seYz8ujRKiDbR3kRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96E93F805C5; Fri, 11 Aug 2023 22:15:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BD86F805C7;
	Fri, 11 Aug 2023 22:15:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5645DF805C8; Fri, 11 Aug 2023 22:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-112.mta1.migadu.com (out-112.mta1.migadu.com
 [95.215.58.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28E02F805C0
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 22:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28E02F805C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=B7i/2R3i
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iYu4Dz4hSNyn9kJzzK4p3lb9piHB7a9wwJ9aGUktfD0=;
	b=B7i/2R3iHC2ro6I9YUbHM1FvoB39fIf9DPTD/SmZey33EEFmx1QnK5KHPYfPpGFyrVjy6b
	j1F4S4QKVceyrPo4Rt7R42KM8h/+TKatWo9+iY0nazcL7pPZEniFrdFx+6CNXbZ/AdhHf1
	aRDDIdWVuexKugvOjAH2RfxfuJ2ScwKgnOPsxfNcWV01LvTPJzC6zhsT8ahXRey2kbzFog
	XARZ1uI/K6YTATMTxZ4Pu/UsKVkoiC0oWJXwIcyBPoIMAmJvHj5xCx5Ep6EoNezVeeUs/h
	FlmeZ8gYKpenjqwDlrWOZV7PwrOv/uXUQBHKCbg5jRabvsDkoOvwzk+kscj/Vw==
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
Subject: [RFC PATCH 7/7] dt-bindings: sound: sun4i-i2s: Add channel-slots
 property
Date: Sat, 12 Aug 2023 06:14:06 +1000
Message-ID: <20230811201406.4096210-8-contact@jookia.org>
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
References: <20230811201406.4096210-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: NNPG3DDD67FQR2FDKU36GWFP7PI7PNWF
X-Message-ID-Hash: NNPG3DDD67FQR2FDKU36GWFP7PI7PNWF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNPG3DDD67FQR2FDKU36GWFP7PI7PNWF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sun4i I2S controller supports mapping arbitrary TDM slots to
each channel. Allow this to be expressed in the device tree.

This is currently only implemented in the R329 I2S variant.

Allow this to be configured using a new channel-dins property.

Signed-off-by: John Watts <contact@jookia.org>
---
 .../bindings/sound/allwinner,sun4i-a10-i2s.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 402549f9941c..a74b02387d8a 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -59,6 +59,13 @@ properties:
       channel. Pins are mapped to channels based on array index.
       Channel 0 is the first number, then channel 1, and so on.
 
+  channel-slots:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      This is a list of channel I2S TDM slot numbers. Slots are mapped
+      to channels based on array index.
+      Channel 0 is the first number, then channel 1, and so on.
+
   # Even though it only applies to subschemas under the conditionals,
   # not listing them here will trigger a warning because of the
   # additionalsProperties set to false.
@@ -164,6 +171,7 @@ examples:
             dmas = <&dma 3>, <&dma 3>;
             dma-names = "rx", "tx";
             channel-dins = /bits/ 8 <0 0 1 1 2 2>;
+            channel-slots = /bits/ 8 <0 1 0 1 0 1>;
     };
 
 ...
-- 
2.41.0

