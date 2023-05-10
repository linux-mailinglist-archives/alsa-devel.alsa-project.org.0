Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11D6FDCCA
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 13:35:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EC49109F;
	Wed, 10 May 2023 13:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EC49109F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683718516;
	bh=zkZ2VB9DK4HRbZA+39FDg/oERE5lvBFjF0JsrSf6JdE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k97k7lnAhW7ZbnZ0tJicwuTFEuSoHZ/vr8jwiaRbzzR9A1u70YloaF5udXpIvrNiW
	 1KpjAOVSMr7V/S9lS0NCythh9mIDOCYmUeBDQIc//pcIb8D3mhMiWwK9l68PbHWeGe
	 /leBE+74swiax5uT5WamgKuBrCrlFJxhBwHUQQ2U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 754D4F8052E;
	Wed, 10 May 2023 13:33:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46F19F804B1; Wed, 10 May 2023 13:24:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48D0DF8032D
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 13:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48D0DF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=etafzyyj
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso4610343f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683717856; x=1686309856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwHcYvXNSiIkEgmiMzAyT5dYPdOiZ1yq5rnwE3WjECM=;
        b=etafzyyjY5HoH5GNhxsAhWLc0AdunTvsDBpsmyDkFUZvf6r3tWlUl5xcwDrBn136ST
         NmaCFav62CmE0wTRWyksiz8LLJ0BnpfHnQBwycyp6ajzWtGjYIVACefvt29HskqDG+iL
         7sOqKfcMcQ01IuaLHRdk2NLtRuMRZhs5JLsZR0/4FokbA5fuYlqW6q9PD7VVE2WJfPpy
         AnS5LWJc4jGzvZ6pnuBGnSsZqi2Ao60Z3F0P/pwbgLCDTup+m8OmqmI218yfKFYmOKRv
         FY2G3ECD8ky8S8KvA7xGWyMOXnlrI+18CD/MEYEB6aqqkEEHuEwfi9BBOSAToMYAFbWl
         2w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683717856; x=1686309856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwHcYvXNSiIkEgmiMzAyT5dYPdOiZ1yq5rnwE3WjECM=;
        b=GSRYSgB5RqFX3SPVVBCsBcop1+yDrTLigZn7trP31YY3AlchS/MKhXt9EIwglY+wKF
         xZVVej/fH4IQSm8sUovpDN8ot2TC8Wk0Isfy/1hY6yuiqIcX+xF6vKXp1KDn13OTzr/3
         BFbfvrYn/2tNgiT1tLU23aCim8k+5lSwT4Ntq+hxiQtguJmvWQCVvUpp88DCyWpVzbd2
         8cDQXwPNNHUghdew24pWSauL5LZy7p3rxu5OwI2boXZVWKlY6wgtKvFXZe3lSmSHvUeE
         RVoKA/OrcXjY53ENLgIqZkz9lvz6BHB8eyVUJ43s2d2VCd+fITRAP97vTJfX+B390Yj5
         vXGQ==
X-Gm-Message-State: AC+VfDxoEztDhhezQnB2p8Kf6uaCGtOB0LXCtxsqHbl+HbYO4g/UUjQK
	uFPTlWWJnIMX4ZzPTIIzj2g=
X-Google-Smtp-Source: 
 ACHHUZ7jWCjfitHwoaHYCEOoGIp8uZ0yL6uixHMPjQxq8Q1/duU9u6W1fKi51AosmaX/0EHIq/XTUg==
X-Received: by 2002:a05:6000:12d0:b0:304:b1da:77d with SMTP id
 l16-20020a05600012d000b00304b1da077dmr11326854wrx.52.1683717856204;
        Wed, 10 May 2023 04:24:16 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b003f4069417absm19668802wmz.24.2023.05.10.04.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 04:24:15 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: [PATCH v1 3/3] dt-bindings: ASoC: Add ESS ES9218P codec bindings
Date: Wed, 10 May 2023 12:23:49 +0100
Message-Id: <20230510112349.939991-3-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
References: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6BQF7DPJUW7Q3MIHBHFSLFWGJRURYWNQ
X-Message-ID-Hash: 6BQF7DPJUW7Q3MIHBHFSLFWGJRURYWNQ
X-MailFrom: aidanmacdonald.0x0@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6BQF7DPJUW7Q3MIHBHFSLFWGJRURYWNQ/>
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
 .../bindings/sound/ess,es9218p.yaml           | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ess,es9218p.yaml

diff --git a/Documentation/devicetree/bindings/sound/ess,es9218p.yaml b/Documentation/devicetree/bindings/sound/ess,es9218p.yaml
new file mode 100644
index 000000000000..d205b6a8bbb2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ess,es9218p.yaml
@@ -0,0 +1,104 @@
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
+      Definition of the regulator used for digital core power supply.
+
+  vcca-supply:
+    description:
+      Definition of the regulator used for oscillator and DAC power supply.
+
+  avcc3v3-supply:
+    description:
+      Definition of the 3.3V regulator for amplifier, switch, and charge pumps.
+
+  avcc1v8-supply:
+    description:
+      Definition of the 1.8V regulator for amplifier, switch, and charge pumps.
+
+  clocks:
+    items:
+      - description: clock for master clock (MCLK)
+
+  clock-names:
+    items:
+      - const: mclk
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
+  - clock-names
+  - reset-gpios
+
+additionalProperties: false
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
+            clock-names = "mclk";
+            reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.39.2

