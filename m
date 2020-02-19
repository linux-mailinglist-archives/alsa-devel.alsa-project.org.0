Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4AB1645CF
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 14:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D21C616A0;
	Wed, 19 Feb 2020 14:38:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D21C616A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582119567;
	bh=GLA8XQhKkwhXaQmXQlyLvv/TIokS4AMSUAxBeZsIcXQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ivzMZzGVv54+P+whNiNr021tvPvYyaf8362bqXLghAQ4COITLrvxITMTncm1frTY6
	 1ElMvcCItmgeAENE60Tq+QfIAj5EnKcwktIATCgp6Bx6krpPHWjLrZSW4kHGwmokiU
	 y3ESg1HM5DnRIzFdbUOdP8eGwIyl/MBgQYP7bio4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47781F8025F;
	Wed, 19 Feb 2020 14:37:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6409F80276; Wed, 19 Feb 2020 14:37:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF2EDF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 14:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF2EDF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="pgi+TBIf"
Received: by mail-wr1-x443.google.com with SMTP id c9so550079wrw.8
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 05:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idNFPyAtkmq04AJWh7a0/gnkZseJQQBbr31aSDqpxTo=;
 b=pgi+TBIfgcN3kTkndoro2wO8PcZFOTmypoXoT9oPvzBxZMrgOYmFREyP3GAWSdSFA9
 W/vH5mTeEJe6txM2vOAQ6qcI5zMlhWbBDJBd2DseAl76AwuZqBKKQCYRDewdfbQw+GNe
 jmsusBY99uLMfYUT0ZBXI87iPS9HRDmepSofoFVnzq+oTg3I9o+n3eHIv7Bf0DJi1GS6
 vPhREp4T+t+eKJkx9tcRWI3GlCMwIaMz0UT0dco4O68gnMIfvLVfpoSoW8iZIvblHvJp
 Wi6RwXWNKVFscVbHLjzE9FpD2OBeVcieFINJ3GJD1KQlakxunb2k4k1KzbE2esIPCnde
 LE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idNFPyAtkmq04AJWh7a0/gnkZseJQQBbr31aSDqpxTo=;
 b=YbZTZ6YhO7h1OpOTEa74piWxD0ifqG4XQ/xZ3l8cNnKgrF5nV4IWkkjhGMniT7xLhv
 1dfzqtGWkuj65NDiwqmJZiVrfA9prVLSK/tGq9E10WJcCtXrSselnBE78pxP3FFqMKjE
 BM7r76GO2d18T6pE8qclZ/jGiDv1SOhLKaCa22LP2zNCTVFtWCIF1XuDXPHS3zE9YI+r
 DFX5z29PrTZHnleoWLRP1KrawHdT3imnSAkpUtli8lzc6nKT1c9ZdcLDzz0kVq7ORC7Z
 wyYeSUqi0pt1zQp/AL5Wl+jiV6fIkUvHpEwEAy6ba9ftsINIw2Z5P3qhwA18ukTY+EdU
 ID0Q==
X-Gm-Message-State: APjAAAVL5a7wRvros5C1rh7W8YIeeyTNWiEXHdPcarn5Zx6rGYQmxBO0
 kT6FYWyrMj3Vv3s2++X1aLuRFVo9Rg4=
X-Google-Smtp-Source: APXvYqwCdG6arwwkXKRGXknOCJ7az3kOoi5ADFVldBeUfvCD9Xrxom8biCGNQ4YGwzDvnmboPbXyrw==
X-Received: by 2002:adf:dd0b:: with SMTP id a11mr37802096wrm.150.1582119416706; 
 Wed, 19 Feb 2020 05:36:56 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id q124sm8856480wme.2.2020.02.19.05.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 05:36:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: meson: add t9015 internal codec binding
 documentation
Date: Wed, 19 Feb 2020 14:36:45 +0100
Message-Id: <20200219133646.1035506-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219133646.1035506-1-jbrunet@baylibre.com>
References: <20200219133646.1035506-1-jbrunet@baylibre.com>
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

Add the DT binding documention of the internal DAC found in the Amlogic
gxl, g12a and sm1 SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,t9015.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml

diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
new file mode 100644
index 000000000000..b7c38c2b5b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,t9015.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T9015 Internal Audio DAC
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    items:
+      - const: amlogic,t9015
+
+  clocks:
+    items:
+      - description: Peripheral clock
+
+  clock-names:
+    items:
+      - const: pclk
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
+  - clocks
+  - clock-names
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/g12a-clkc.h>
+    #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
+
+    acodec: audio-controller@32000 {
+        compatible = "amlogic,t9015";
+        reg = <0x0 0x32000 0x0 0x14>;
+        #sound-dai-cells = <0>;
+        clocks = <&clkc CLKID_AUDIO_CODEC>;
+        clock-names = "pclk";
+        resets = <&reset RESET_AUDIO_CODEC>;
+    };
+
-- 
2.24.1

