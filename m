Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF832797328
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 16:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15519DEB;
	Thu,  7 Sep 2023 16:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15519DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694098095;
	bh=f81IjHFhtrUyWCKu7/WGOe+LBkT3Yst1qx3qL/lQSpM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VaP2v+U0WfkYOyQG96XmLnD2cFtejQPMvM94Xl8plDXW9BHgflYNFLlbOiq9Er45t
	 1EyU3buocIn3Y63+TEm4hbdgg+NhNx7LRiLqWCgUKTS/AHjjtCOx0t3dn8kY5bhluA
	 CxKDj1IqZm1sQlx0WAiiiF6DmDkF7B1AlSgCTEkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 201B3F8057C; Thu,  7 Sep 2023 16:47:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4644CF8057A;
	Thu,  7 Sep 2023 16:47:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A1A9F80494; Thu,  7 Sep 2023 16:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92218F800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 16:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92218F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=gzZCA+gR
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso17829571fa.3
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Sep 2023 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694097820; x=1694702620;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=927dFowXauJqC2YOXBDk/4qoxBXJD8XdbGuXvoshWHY=;
        b=gzZCA+gRGF1tvNhxMoyQWBIwh1BCfFEq+8Yoy52LUiRwWhtZBAqkFQXnM9V+aaNOAq
         UkFG2KXNPUeVoFPCnBwinphqWszRCEkRL2VDhUjsurWAbVPsDFmOp5l56PZDl+zXAmtO
         zTBm12pbhTnlAmyXPNd3/eylNy5ndKRJrFxrFV8FyeVbPuFJvhxoQYRKjHzsN4FN2q/7
         WdJ8b76tHJr9WlTjVGSLopSlUunv33bdsPGHsl5HcLUn8yJXXA8Y3PeDZB17vX5YUZyI
         KOG16KiuYD9d6LHH/gLldPzmisHWYOqaamTvWnXHBVVNh5zq+nt81SR1CcN/BgIhQyte
         af+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694097820; x=1694702620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=927dFowXauJqC2YOXBDk/4qoxBXJD8XdbGuXvoshWHY=;
        b=Ar8C1T9ybBB3ceUWs7TZgf/GIn+5AfNc57WOtfCFr5K0aSCLZzHmDP6XiSRiqvtYrJ
         1a9vNIiqL2Uj/WBA85bMt9Y0f2bx6eeBwHenfmuanoZ/IkrGNpqIKWqBqlmFsSkVy/c6
         kO65mt7wvu302KypXpmKE302a8p8pUKwWuLkXXYO+oNiDT1hHc2Q5tsIqSq9bmFHEFEd
         0oAbeiVMQribAOwhnjdSMlq8sNlv531Hj5eIH7b5pxS3QYVXCf/JybsGJewSbYY1foYW
         U4UwqL1TGTZO9/Ay3mVH1iHKZUzeGHmGZ9gRDy4FnAQEWVB8hhY4Kqf5Ph6PHQ8lbGuA
         y1WA==
X-Gm-Message-State: AOJu0YwU8s2pKdoNT6M5+QwrQufdz+U9am8MQMv3T7xsphBKwT/8rokX
	97SbjoFLY/yDdAwnj8r+y6E6MDC64ok=
X-Google-Smtp-Source: 
 AGHT+IH9O6jeW0XIr3SNBsUTJS7++/h8X1hnBWZyxkOvHJj1QJ0k19xawmaY+Y2sK27mo7gAVRC44Q==
X-Received: by 2002:a5d:6d4c:0:b0:317:5182:7b55 with SMTP id
 k12-20020a5d6d4c000000b0031751827b55mr4719128wri.42.1694095818965;
        Thu, 07 Sep 2023 07:10:18 -0700 (PDT)
Received: from localhost ([2a02:810d:1640:10d8:bdda:474a:9786:1e73])
        by smtp.gmail.com with ESMTPSA id
 n17-20020a1c7211000000b003fe1630a8f0sm2588711wmc.24.2023.09.07.07.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 07:10:18 -0700 (PDT)
From: Joerg Schambacher <joerg.hifiberry@gmail.com>
To: 
Cc: a-krasser@ti.com,
	joerg@hifiberry.com,
	Joerg Schambacher <joerg.hifiberry@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: pcm512x: Adds bindings for TAS575x devices
Date: Thu,  7 Sep 2023 18:08:51 +0200
Message-Id: <20230907160851.14241-1-joerg.hifiberry@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: joerg.hifiberry@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MXTZJ5CAAGEFF6E3UARKIG4TOOUFUJE4
X-Message-ID-Hash: MXTZJ5CAAGEFF6E3UARKIG4TOOUFUJE4
X-Mailman-Approved-At: Thu, 07 Sep 2023 14:46:57 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXTZJ5CAAGEFF6E3UARKIG4TOOUFUJE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TAS5754/6 power amplifiers use the same pcm512x driver with
only minor restictions described in the bindings document.

Signed-off-by: Joerg Schambacher <joerg.hifiberry@gmail.com>
---
 .../devicetree/bindings/sound/pcm512x.txt     | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/pcm512x.txt b/Documentation/devicetree/bindings/sound/pcm512x.txt
index 3aae3b41bd8e..b16cd0463695 100644
--- a/Documentation/devicetree/bindings/sound/pcm512x.txt
+++ b/Documentation/devicetree/bindings/sound/pcm512x.txt
@@ -1,12 +1,12 @@
-PCM512x audio CODECs
+PCM512x and TAS575x audio CODECs/amplifiers
 
 These devices support both I2C and SPI (configured with pin strapping
-on the board).
+on the board). The TAS575x devices only support I2C.
 
 Required properties:
 
-  - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141" or
-                 "ti,pcm5142"
+  - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141",
+                 "ti,pcm5142", "ti,tas5754" or "ti,tas5756"
 
   - reg : the I2C address of the device for I2C, the chip select
           number for SPI.
@@ -25,6 +25,7 @@ Optional properties:
     through <6>.  The device will be configured for clock input on the
     given pll-in pin and PLL output on the given pll-out pin.  An
     external connection from the pll-out pin to the SCLK pin is assumed.
+    Caution: the TAS-desvices only support gpios 1,2 and 3
 
 Examples:
 
@@ -50,3 +51,16 @@ Examples:
 		pll-in = <3>;
 		pll-out = <6>;
 	};
+
+	tas5756: tas5756@4f {
+		compatible = "ti,tas5756";
+		reg = <0x4f>;
+
+		AVDD-supply = <&reg_3v3_analog>;
+		DVDD-supply = <&reg_1v8>;
+		CPVDD-supply = <&reg_3v3>;
+
+		clocks = <&sck>;
+		pll-in = <1>;
+		pll-out = <2>;
+	};
-- 
2.34.1

