Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7886270263F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 09:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A40963E;
	Mon, 15 May 2023 09:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A40963E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684136556;
	bh=ykhH92TYHN6/SWDXfJaTI4wGF2leSNRbcLxTCINZE9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q2yKzizgM81PspotU3tuXLIfcYbMV4wB9VRbSWOaLN3S0myBcGLbsAlz5PgEBEgP+
	 g0PLuRRGwZWlBftTGkgANKpurol770iFi3Cjpre7sJX4Ib+GJ3zfp8X7kkB2EUc7B5
	 6Aj7AWiiawTZPKvR1x+ZfoumdE+f/UrA+znytO7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 869ECF8055C; Mon, 15 May 2023 09:40:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6C9FF8055C;
	Mon, 15 May 2023 09:40:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5DDFF80272; Mon, 15 May 2023 09:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D56CF8025A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 09:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D56CF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=WEU+jtPt
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f475366514so38946375e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 15 May 2023 00:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684136427; x=1686728427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uakoPy8ncdNAG3jrhtldU6DM7FPTdBqXspADcsRU/4=;
        b=WEU+jtPtGzQ65MZKQCMd+wV3T0FSyEUtCT2/trbX7mboW8hUnd6AMRewxkvBLoGzHR
         9yzwLQcc7qwAKaAQfcuS5egBbT86gcu3UM2fxHvXmvkbeE2YNBzpE6Gfk7v1oA6ZeyvJ
         KjAB1qwXdWnHLto8Dqk9lrH0qBnfjiEw1z/5Yu9H/UGH3VcOWDNF4lVYyAIV8cZibPOj
         tyOknNKI6EgxpSE6mqopdDuiteCiI1AWdf9An8VEWEhZrMt5upUz+eJVwt+ChfG9XKrX
         wfHkWxWoBAXcgOCOrzAQGkkCJts3EoxbsHdA6JFFBvVpOF7NFHnzRaP+A2ek6JKvVVRH
         QPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684136427; x=1686728427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uakoPy8ncdNAG3jrhtldU6DM7FPTdBqXspADcsRU/4=;
        b=dP1Ztvufveb7D5lw96Gx2WhUNjHRYzQsgezj/wF4gXuNGOxN2riOXHhrShSAjBJvXs
         wcQXLPelmv0FwHdmbWG4tYaoJUs1i/S7WJZgeq8bdzAcUDHnL59XlvPigYK0E/FADW9d
         RasrxswyHy4Swev+tdHoZMxGDNDrjyeOHKS562f+3miFbbASESJID1T2uFuLmIZsVPWn
         gLS3f47ua2yN3ePuon+5Apvj2Mml+fCItBIo3MXaRNLuX9vZKaX+xKWqt/e6MKI+k4eW
         ahgQWlvN0ChopiJKnTG8lpDBpcwV9S3EyscKXr01m4vIffLwulOBVAC9AgE2WCSbjqq/
         jo4g==
X-Gm-Message-State: AC+VfDyGOK1HwY0nXk1rKmyQht0ZYKv5RnDmxxSWmcGWwLpIrDOOQu0B
	0DWpRSYKYOZhAc315nB1AW0=
X-Google-Smtp-Source: 
 ACHHUZ4IbMm393RoNlW4AS6UCYxFM2hMwl4BHXeLdoidtmp2qqej8FlJr2P+s/0cajaWsRLTu9VmtQ==
X-Received: by 2002:a05:6000:1c4:b0:2f5:ace2:8737 with SMTP id
 t4-20020a05600001c400b002f5ace28737mr20920372wrx.32.1684136427404;
        Mon, 15 May 2023 00:40:27 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b003063772a55bsm31588277wrv.61.2023.05.15.00.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 00:40:26 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ASoC: dt-bindings: Add ESS ES9218P codec
Date: Mon, 15 May 2023 08:40:21 +0100
Message-Id: <20230515074021.31257-3-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20230515074021.31257-1-aidanmacdonald.0x0@gmail.com>
References: <20230515074021.31257-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5QSDTIJTRJILZX7IQUPPDK2BDMI5KKSZ
X-Message-ID-Hash: 5QSDTIJTRJILZX7IQUPPDK2BDMI5KKSZ
X-MailFrom: aidanmacdonald.0x0@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QSDTIJTRJILZX7IQUPPDK2BDMI5KKSZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device tree bindings for the ESS ES9218P codec, which uses an
I2C control interface.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---

Notes:
    v1->v2
    
    Address Krzysztof's review comments:
    
    - Add missing ref to dai-common.yaml
    - Simplify descriptions of supply properties
    - Remove unneeded clock names, the device has only one clock input
    - Use unevaluatedProperties instead of additionalProperties

 .../bindings/sound/ess,es9218p.yaml           | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ess,es9218p.yaml

diff --git a/Documentation/devicetree/bindings/sound/ess,es9218p.yaml b/Documentation/devicetree/bindings/sound/ess,es9218p.yaml
new file mode 100644
index 000000000000..53ca06539e0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ess,es9218p.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ess,es9218p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESS ES9218P audio codec
+
+maintainers:
+  - Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: ess,es9218p
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  avdd-supply:
+    description:
+      Digital core power supply.
+
+  vcca-supply:
+    description:
+      Oscillator and DAC power supply.
+
+  avcc3v3-supply:
+    description:
+      3.3V regulator for amplifier, switch, and charge pumps.
+
+  avcc1v8-supply:
+    description:
+      1.8V regulator for amplifier, switch, and charge pumps.
+
+  clocks:
+    items:
+      - description: clock for master clock (MCLK)
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Pin used for codec hardware reset, corresponds to the RESETB pin.
+
+  ess,max-clock-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Sets the maximum MCLK divider for generating the internal CLK.
+      CLK must be at least 20x the I2C bus speed or I2C transactions
+      will fail. The maximum divider should be chosen to ensure that
+      CLK will not fall below the limit.
+    enum:
+      - 1
+      - 2
+      - 4
+      - 8
+    default: 1
+
+  ess,oscillator-pad-bias:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Sets the oscillator pad drive bias. 0 - full bias, 15 - disabled.
+    minimum: 0
+    maximum: 15
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - avdd-supply
+  - vcca-supply
+  - avcc3v3-supply
+  - avcc1v8-supply
+  - clocks
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@48 {
+            compatible = "ess,es9218p";
+            reg = <0x48>;
+            #sound-dai-cells = <0>;
+            avdd-supply = <&avdd>;
+            vcca-supply = <&vcca>;
+            avcc3v3-supply = <&avcc3v3>;
+            avcc1v8-supply = <&avcc1v8>;
+            clocks = <&xtal_clock>;
+            reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.39.2

