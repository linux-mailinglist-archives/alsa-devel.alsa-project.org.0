Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEC368C1B8
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 16:36:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 265041EC;
	Mon,  6 Feb 2023 16:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 265041EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675697794;
	bh=/8KFoeTjoIambCDK+bWfIHu2TRyPnAUTfDXyCfjWUu8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gdvicEZQoaDk+CIS18JbTZ09PuBHz4MTKHNzz/fmzuAPoH+KWyoGOZD+mGCBnjk9t
	 W5ay0S3oD8kQ2TVZuOAtR1JuH6OPTx936AelYviUdYo3kq9M9yHpM81AhFG3w2RUQx
	 pqJGU4P3fINXfkXttVLrPWUKUAWeE0tWbBKg958s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57B89F800E3;
	Mon,  6 Feb 2023 16:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52C03F80534; Mon,  6 Feb 2023 16:35:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01B35F804E7
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 16:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01B35F804E7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1ymZ4wa9
Received: by mail-wr1-x42b.google.com with SMTP id ba1so6701143wrb.5
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 07:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSZ+ZWDmXDYcYtmIhvFtKPtRA07CwGN6CEZ0BnS9Htc=;
 b=1ymZ4wa9X9VmsnI7dKrwIS7KOHJdftr5rwTlNYrUztYky9zyZPKXb4Q874IsFemt8j
 J30/3nK1SZU0AoHog8FMSurppxgjLSdfkDupT8lTCW6661B5X5lXhRUwfjsKduM64PnD
 NXNTlFyDvsgpaTRqZX126jetYhntw5pEwi25tqexCd4oAyDa3u7dACkn+K1z8zVGZffr
 k0raxVkCqzwmmjZQrnz6ELj8YpQ7A1BtMCKqruw6NL9CsTs4yAcH987G3T7lOk9jndLm
 2vJWg5M1GB1f0U3a08ljzOMaPeWqXaqOEtfrmIu1ItrbgbTpO4OIIx93Oyzg9eOaeJzO
 PTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DSZ+ZWDmXDYcYtmIhvFtKPtRA07CwGN6CEZ0BnS9Htc=;
 b=RL2Z6Y/mBF7WdgGYOt7h5Z+kSQak15EenBC6dPik3f7iFh0M1lu2VdzbsZMeFQFGol
 MJgv5dl/E9WNHFioSD9H4l7jF2W42rQtM6aHeMBowg83qeXpsuXrYedgaOTlkyzCdnlz
 uCPc4hR8Y1p+INFcqVquu55aEpRa37l29EWvvaL4317a5VUZcb+ix5NJ0iUV7F3hicOE
 h13IjgX7ZTiZRAA8veP27ooR9HwrlUCJsCciWm/OtXhrl+iMCMBMBi4n9QFsqWd90ycI
 3I8PPEQpPYILZzR9iuE4jdhXBF1J+gDNLldc7bwT7XW5XCM1iPCSASHRUBUSP8yySOnt
 Fu8w==
X-Gm-Message-State: AO0yUKXDAEsy9nFNilq1EqmjDn7h65pB8xcDdjuPE34a7BbIQYmFv4Nk
 AHO1uyQ/DlMYbOjy2yv8Cvcxug==
X-Google-Smtp-Source: AK7set8l0Vem0AHgJtK8mN9RFYv4+5qphxkNS6/M3ZOmuwRAk/w0Zfj9ZrM9d7lz3uie93iC15wpVw==
X-Received: by 2002:adf:f992:0:b0:242:5563:c3b with SMTP id
 f18-20020adff992000000b0024255630c3bmr16518118wrr.59.1675697698201; 
 Mon, 06 Feb 2023 07:34:58 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 07:34:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] ASoC: dt-bindings: meson: convert axg tdm interface to
 schema
Date: Mon,  6 Feb 2023 16:34:43 +0100
Message-Id: <20230206153449.596326-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert the DT binding documentation for the Amlogic tdm interface to
schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-tdm-iface.txt  | 22 --------
 .../bindings/sound/amlogic,axg-tdm-iface.yaml | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
deleted file mode 100644
index cabfb26a5f22..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* Amlogic Audio TDM Interfaces
-
-Required properties:
-- compatible: 'amlogic,axg-tdm-iface'
-- clocks: list of clock phandle, one for each entry clock-names.
-- clock-names: should contain the following:
-  * "sclk" : bit clock.
-  * "lrclk": sample clock
-  * "mclk" : master clock
-	     -> optional if the interface is in clock slave mode.
-- #sound-dai-cells: must be 0.
-
-Example of TDM_A on the A113 SoC:
-
-tdmif_a: audio-controller@0 {
-	compatible = "amlogic,axg-tdm-iface";
-	#sound-dai-cells = <0>;
-	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
-		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
-	clock-names = "mclk", "sclk", "lrclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
new file mode 100644
index 000000000000..320f0002649d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Audio TDM Interfaces
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: amlogic,axg-tdm-iface
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    minItems: 2
+    items:
+      - description: Bit clock
+      - description: Sample clock
+      - description: Master clock #optional
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: sclk
+      - const: lrclk
+      - const: mclk
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/axg-audio-clkc.h>
+
+    audio-controller {
+        compatible = "amlogic,axg-tdm-iface";
+        #sound-dai-cells = <0>;
+        clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+                 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+        clock-names = "sclk", "lrclk", "mclk";
+    };
-- 
2.39.0

