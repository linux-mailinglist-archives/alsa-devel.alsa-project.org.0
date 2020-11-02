Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C52A24C7
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 07:26:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629B816E9;
	Mon,  2 Nov 2020 07:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629B816E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604298375;
	bh=8jFFfd5FZlXfJQQ/XS4ynI7hHnjF99N8OxZP9RrXIoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IcrSr6Yx4GnifS8pQ0MUDtzjKh0YCjJOAj+4dYjaX1PKyo+7Dflee86OU/zNn7tyU
	 P8A5reaOofEoDeZ6v9frQMeOS2fO5E6MvXUAkY97afj3oYfEUGsCDOH8DL4cLBUfRA
	 riZnoJL13L376Lh1m4NIeST+CuqIzMWMeUH4AZaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9CDBF80234;
	Mon,  2 Nov 2020 07:24:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF91DF80259; Mon,  2 Nov 2020 07:24:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 720A9F80229
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 07:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 720A9F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TN1kXme8"
Received: by mail-pl1-x634.google.com with SMTP id r3so6340929plo.1
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 22:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
 b=TN1kXme8So3nia93jft19a+yG8QKdaRwbSY/mPtmcT8biUf+vQfmqNY8p2Z8ZBVB73
 Ho33MAvyzujMMFhlK/tvFLWDcfxrBcX8a5Ap08W0FN5u/MrV6p5YW2aVgM2c5LsC5CK0
 SMUxEgP/YxigD1Px2YACVZehKZN5KDXMbB1Hg0VYfykdTFa0D6a3KEssxs+17whM3kWa
 o/IC+3a1WKN4K6qGkQX5hlXEUaVnVwqr3GE1LVKhy8vzaGqHRKspujuEFT5Hx4erJU7e
 3/6oBBBafMp5xbSUJ72IEibN9vMag3rUQT249DqbLTXpdcOIFAeJFIPmyFI0UGNRkwEI
 sbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
 b=EHnQZJe1TKHFFWpWJcsZwu0N2GwYO0BOErgSMTj+DjsbV4HDhCF947MXgs1aiJWiPo
 CdoBC+iXgm7sdq+rzonN+X1Vmi5++qOhYHVZY4OJILNqYIKuGljh0dcO9wDgVA0S7NR4
 KCvSzWX8YgaVdtUVcIad1rj6wQQc3wQ4AhmXtNdAM7GcSVMeAIFBSMWt9YMmivpBk67V
 eg6j/92jFb8oRTaKnToo4PxNsZDZj/gjBqVAqY5ockEkZ0YPyy2ORlZkXs1dBWfpbd/G
 QdjB/PGOfISGGbfIx3fClgbS9oAjmN9xIXBQMZe5+fdnUTpwFAFdiYnhAyLlItHxzxGn
 24xw==
X-Gm-Message-State: AOAM531NIrgdRadW62VT2nnDVe3GKa7+JKx06qhM7N3gDBFx/nUBKYvJ
 iXiq/UM+FqOgeH9tnOIIa+Y=
X-Google-Smtp-Source: ABdhPJyD3zMZ2MYz2bL49+U1aM89ASMcZIWw5ML7y7UgnGaUcnEzAwxcO9RxEmhcWdzaQu0qkIu8rA==
X-Received: by 2002:a17:902:bd4c:b029:d6:8c38:7221 with SMTP id
 b12-20020a170902bd4cb02900d68c387221mr18332551plx.82.1604298264823; 
 Sun, 01 Nov 2020 22:24:24 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id q123sm12902114pfq.56.2020.11.01.22.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 22:24:24 -0800 (PST)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: google: dt-bindings: modify machine bindings for
 two MICs case
Date: Mon,  2 Nov 2020 14:24:07 +0800
Message-Id: <20201102062408.331572-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
References: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
 srinivas.kandagatla@linaro.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
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

Add a property "dmic-gpios" for switching between two MICs.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../bindings/sound/google,sc7180-trogdor.yaml | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index efc34689d6b5..9e0505467e57 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -34,6 +34,9 @@ properties:
   "#size-cells":
     const: 0
 
+  dmic-gpios:
+    description: GPIO for switching between DMICs
+
 patternProperties:
   "^dai-link(@[0-9])?$":
     description:
@@ -81,6 +84,7 @@ additionalProperties: false
 examples:
 
   - |
+    //Example 1
     sound {
         compatible = "google,sc7180-trogdor";
         model = "sc7180-rt5682-max98357a-1mic";
@@ -128,3 +132,57 @@ examples:
             };
         };
     };
+
+  - |
+    //Example 2 (2mic case)
+    sound {
+        compatible = "google,sc7180-trogdor";
+        model = "sc7180-rt5682-max98357a-2mic";
+
+        audio-routing =
+                    "Headphone Jack", "HPOL",
+                    "Headphone Jack", "HPOR";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dmic-gpios = <&tlmm 86 0>;
+
+        dai-link@0 {
+            link-name = "MultiMedia0";
+            reg = <0>;
+            cpu {
+                sound-dai = <&lpass_cpu 0>;
+            };
+
+            codec {
+                sound-dai = <&alc5682 0>;
+            };
+        };
+
+        dai-link@1 {
+            link-name = "MultiMedia1";
+            reg = <1>;
+            cpu {
+                sound-dai = <&lpass_cpu 1>;
+            };
+
+            codec {
+                sound-dai = <&max98357a>;
+            };
+        };
+
+        dai-link@2 {
+            link-name = "MultiMedia2";
+            reg = <2>;
+            cpu {
+                sound-dai = <&lpass_hdmi 0>;
+            };
+
+            codec {
+                sound-dai = <&msm_dp>;
+            };
+        };
+    };
+
+...
-- 
2.25.1

