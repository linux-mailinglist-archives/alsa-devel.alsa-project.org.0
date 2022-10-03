Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 772B85F27D6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 05:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F54C286C;
	Mon,  3 Oct 2022 05:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F54C286C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664767567;
	bh=DT8g9eRQnvl+uXqJJ0LofG0kEwNiHb+ZP7Ybcsx2GEU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rb99wbLe4RkLWIWuazouNZQLuBFqHiBJWpv6Wx1DOC8uE23pJ9HUJTXagBr8sD8BB
	 eRoUu67W+rDFyFE3qnekSWl8vsT/uq+q/5gQAq2p9ZpqdslGJudCe1Bh5z0rTi6fSp
	 jvllaqeBhDhQmYs7udxohOsnRoaooMFC5w6cabD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99071F80535;
	Mon,  3 Oct 2022 05:24:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F14CF804E4; Mon,  3 Oct 2022 05:24:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D693F80224
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 05:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D693F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com
 header.b="CUUbIbXr"
Received: by mail-pf1-x42e.google.com with SMTP id c3so4237911pfb.12
 for <alsa-devel@alsa-project.org>; Sun, 02 Oct 2022 20:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1y4CMatLLOuro4rYb7OubdSD1veGSab01mNr081J92M=;
 b=CUUbIbXr4y7X+8xAYu6pggMYvjZ6bjnSOdyJkD56wqb+1K2VYP+WsqOpqUH9IhO/LZ
 ZL0hZyQmXIPZg6gLQOO54EVKepyBPWfU0xRQBuHLWtBnOobVagpC/w2SczQRiM0+iexI
 sCIdT48Suwxfxwuf4qdf/+uqPmwYx+RCOdvkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1y4CMatLLOuro4rYb7OubdSD1veGSab01mNr081J92M=;
 b=LerXAB3Q70CKDCrBddFXUWodQQJnhSOh2JsRkrLETV7YxIYxazxbHoW40irQLQpTTE
 /kkERiihj5OVT74tJ3E4uCkmy9GqibQ7bVp9KnE9QSo8cvigdx8d+fkUwTiDWK21k8WF
 M4Ab3LlEqy6dIi10SkUXyzKweuWxInr8g2MDdjy+jyUUfMclIIkq0wwjdQj5Wmrca3cd
 hSwETaI2W8K5XosCvzh/kos9FJYcw5rNOVp02c9m68bv7/1cmmkaCV0wgRHRv3OVAoWY
 pJmBfzTqcLrJ7W3u6YSdTLl3GUT5ZJiNrt+mpsAbSNS8IYtdV8wztXP58DHPBKiTCo0B
 +BrA==
X-Gm-Message-State: ACrzQf1s1qtqcDHXYK68wPo1CNGdmJP0A+BcGXqWHKOnjoc+1mypIhfz
 WRc40BOHgBHZV7A4lYTxvCSY3w==
X-Google-Smtp-Source: AMsMyM7cXSgnJr2XZBmkVT3lYym1Q9Qfw368cYr1s/XzYa9ZAOtBkV1xO4LefN4cJbEDs6czYM7u1w==
X-Received: by 2002:a05:6a00:2316:b0:548:58b6:b17c with SMTP id
 h22-20020a056a00231600b0054858b6b17cmr20406125pfh.53.1664767479241; 
 Sun, 02 Oct 2022 20:24:39 -0700 (PDT)
Received: from doug-ryzen-5700G.. ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 y25-20020aa78f39000000b0053e7d3b8d6dsm6157977pfr.1.2022.10.02.20.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 20:24:38 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: add schema for WM8961
Date: Sun,  2 Oct 2022 20:24:12 -0700
Message-Id: <20221003032414.248326-2-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003032414.248326-1-doug@schmorgal.com>
References: <20221003032414.248326-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Doug Brown <doug@schmorgal.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

Create a simple DT schema for the existing Wolfson WM8961 driver so that
DT support can be added to the driver.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 .../devicetree/bindings/sound/wlf,wm8961.yaml | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8961.yaml

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
new file mode 100644
index 000000000000..795d34e1e97a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8961.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wolfson WM8961 Ultra-Low Power Stereo CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  compatible:
+    const: wlf,wm8961
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          wm8961: codec@4a {
+                  compatible = "wlf,wm8961";
+                  reg = <0x4a>;
+                  #sound-dai-cells = <0>;
+          };
+    };
-- 
2.34.1

