Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFC316A952
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 16:05:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213811690;
	Mon, 24 Feb 2020 16:04:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213811690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582556703;
	bh=CRYCQIVCaJu+aOHOHqky8z/qMNqf6/Ufrfa/e4LecwQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YzghM6NGsgWi+I441hMEOvnVqyPiAQ+gbt7KxqWUAZ9xmVDWL/VaMxAnik+k1FLLi
	 O4o+jS4wlY7dGxn+X1ufiYezxf6RG6Q0PYUaHac/+shppLZWxEV6ORAQ1BoFhmRZvm
	 JRvbn51jFA362H/WoE2O/wXBxbLYXz7RTaQZl2N0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85086F802EA;
	Mon, 24 Feb 2020 15:58:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9E7DF801F2; Mon, 24 Feb 2020 15:58:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E074F8025E
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 15:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E074F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="LpM7mpj7"
Received: by mail-wr1-x442.google.com with SMTP id g3so10703238wrs.12
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdwXQ7pH6rI6ueZApn+K43TDTHvz3mfvfA2n6YIMVTA=;
 b=LpM7mpj7LiZYFY1F/LHsfKrbgKu9KMEEPBIR7iDONOQtj5dzo4PULT5jUyW8VBENL7
 ErVZShkH6j+APMl0j47EspIm4CwGk9WYyH+f6FoSIYTjN4yTAoJh+CJiUTrJ5Gdtwqwq
 b6w2PcF2xLt7hUCknO6OepJMPbtuZhua9fSEKjbXvhGoX/pERSl3Y9o7tppCYNjp8ESs
 O1c993L2XPYgrMdjGFiGfQJAn6Tn75s3iH6AqFliUtHIChwfNQvJrCBf0tIFCjXOqOgl
 S8Ons34q9AFhe8dmhrVCQ6kXq9TCLFxm1YFMA2n0G3vawr70esVlFNS5i9GgW4pgD8X2
 3vRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdwXQ7pH6rI6ueZApn+K43TDTHvz3mfvfA2n6YIMVTA=;
 b=NlRKAmRG09elpys4yfcj9puKAKUq7REU99O+xZCSUWFRxmPx5+K/KvAeKXMxxmpZdd
 VyInT8CUxE7viTApDZAJOeZuJ6cKIm0U2O9sg/Ixs4ms4PWG05f0W3lCjXr4FvcDaXp8
 xsiHAQb1m094Wsz7vnsehdn72WImVHF3kxVGsOO3OQcIlaQ4XKkPgOjQ5jbqTMhL9W5v
 Qemyhc2NZFFl8wiY1Wv68VpeiqE5ULMXWk0SHN2rx0VPWoowEeGcR1CMquWHda2wTSOz
 HBa4JY65uv7eMoqP2VQ/wVNehchD1pYj7ddmPOXPkhtjdluSEm0I5SEhAT6xqCYdd/u8
 ZV1A==
X-Gm-Message-State: APjAAAVd10G9Vz+sH2pjXgEO7xGXOTy7F6tVewLljcSv413joHBps9lx
 BYlGQqUTeCiKyBoPl1fCpbQAkg==
X-Google-Smtp-Source: APXvYqx6BBo21R5PTgXLbRReQuUMfO7alOUBEJcwx+E701SSNNZySFjVl7yKssosp1Wkvm7UURQw2Q==
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr69304362wrx.288.1582556313782; 
 Mon, 24 Feb 2020 06:58:33 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 8/9] ASoC: meson: convert g12a tohdmitx control to schema
Date: Mon, 24 Feb 2020 15:58:20 +0100
Message-Id: <20200224145821.262873-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224145821.262873-1-jbrunet@baylibre.com>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert the DT binding documentation for the Amlogic g12a tohdmitx codec
glue to schema.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,g12a-tohdmitx.txt  | 58 -------------------
 .../bindings/sound/amlogic,g12a-tohdmitx.yaml | 53 +++++++++++++++++
 2 files changed, 53 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
deleted file mode 100644
index 4e8cd7eb7cec..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* Amlogic HDMI Tx control glue
-
-Required properties:
-- compatible: "amlogic,g12a-tohdmitx" or
-	      "amlogic,sm1-tohdmitx"
-- reg: physical base address of the controller and length of memory
-       mapped region.
-- #sound-dai-cells: should be 1.
-- resets: phandle to the dedicated reset line of the hdmitx glue.
-
-Example on the S905X2 SoC:
-
-tohdmitx: audio-controller@744 {
-	compatible = "amlogic,g12a-tohdmitx";
-	reg = <0x0 0x744 0x0 0x4>;
-	#sound-dai-cells = <1>;
-	resets = <&clkc_audio AUD_RESET_TOHDMITX>;
-};
-
-Example of an 'amlogic,axg-sound-card':
-
-sound {
-	compatible = "amlogic,axg-sound-card";
-
-[...]
-
-	dai-link-x {
-		sound-dai = <&tdmif_a>;
-		dai-format = "i2s";
-		dai-tdm-slot-tx-mask-0 = <1 1>;
-
-		codec-0 {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
-		};
-
-		codec-1 {
-			sound-dai = <&external_dac>;
-		};
-	};
-
-	dai-link-y {
-		sound-dai = <&tdmif_c>;
-		dai-format = "i2s";
-		dai-tdm-slot-tx-mask-0 = <1 1>;
-
-		codec {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
-		};
-	};
-
-	dai-link-z {
-		sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
-
-		codec {
-			sound-dai = <&hdmi_tx>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
new file mode 100644
index 000000000000..fdd64d103f33
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,g12a-tohdmitx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic G12a HDMI Tx Control Glue
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 1
+
+  compatible:
+    oneOf:
+      - items:
+        - const:
+            amlogic,g12a-tohdmitx
+      - items:
+        - enum:
+          - amlogic,sm1-tohdmitx
+        - const:
+            amlogic,g12a-tohdmitx
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    tohdmitx: audio-controller@744 {
+    	compatible = "amlogic,g12a-tohdmitx";
+        reg = <0x0 0x744 0x0 0x4>;
+        #sound-dai-cells = <1>;
+        resets = <&clkc_audio AUD_RESET_TOHDMITX>;
+    };
+
+
-- 
2.24.1

