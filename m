Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E0029FF45
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 08:59:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78F1C1661;
	Fri, 30 Oct 2020 08:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78F1C1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604044771;
	bh=8jFFfd5FZlXfJQQ/XS4ynI7hHnjF99N8OxZP9RrXIoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVTT35Thphf+EoSrLHDSe0Z0O4gBL1entwf6KpMwXdvMF7aByB5gMYCaFOgAUuGRG
	 eSyPpGEfHdRohnPlwT9vCM/Yt5OSkmnzEB08FDb7xcxO4/+WntNEwue5Jvag8UvHuy
	 wCZtuFQKJOzkUnD9DEojk/WArmtqUcEGWUWrvJIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8200BF800FF;
	Fri, 30 Oct 2020 08:57:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E847DF80212; Fri, 30 Oct 2020 08:57:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 745CAF801D5
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 08:57:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 745CAF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TIAZA7N8"
Received: by mail-pf1-x433.google.com with SMTP id o129so4577217pfb.1
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
 b=TIAZA7N8mLmP6GAoy04oBaSwZCDUDemagaep0eIu6AVKSnUnnYtVhNIHCbEpMG83/6
 vFXKk85L3GDQnUQja8BMduB43h6WCwm8GO4sbAEsIrOZpCMsw25Rlj5buLnDSbAY8TC2
 q+NMGg0/JaGHONi3izuRNMWV2o1sWYA657QDl4nEksP5Ok8DkeycBPgkZHTGM78FKv3x
 K2PLL+kUkHWEwPwA8LYwqbm4s0h+r71tMTD+99n/xZLMae79b0SvC9FTGmqnvsmOiNVX
 WwmsrRnCJGM2VyOSe+SLDQ5H4X8FDJDIGW2af4SZPRevmXkuIfOPj4X2svN3nKlzQ0AP
 LbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
 b=RU1IlS3gHEG3Ab6i1aQtpcB1usW/MxkmsX73ooXKMgkTOxyhyTQ83EQ+PitL6HefEu
 xsslDYJCH8TzVy2TTsMzLHV4FTov87kpbz8CSecfNj9rDbCwxjcozdP/WS2TjtQQEEKV
 w6Wuff/MWyuOnzCeSVTKN2yTdg29be1JyefQjP662ehnqpDsA0sWvsRL4AJ4dwR3BoBi
 T3TnNZ3A6ISfDPXwUH5zZTSQ2PFIMxC98V6vop76RNZI/3Qz9tmyZwlXWcGGxYWcwNO6
 yR5kAjYXgNdsZp8bnq6uzczlZVKFTmy7hT5Rpkzffo/Cd/0CIWmXaQahMNDKOoTl/2ey
 Eokg==
X-Gm-Message-State: AOAM530nHJwJNzUSDXgC+puDILnxQ/kt7DwmpL5lGgzqaektKaMl7cqe
 4XHZHpOr61NzBasrI4aNbUw=
X-Google-Smtp-Source: ABdhPJw/cGM0YEr1SGpC70+EE0aduMjiy3DUOtzXdXm1f2UI48ICWPnnjkNAv7zmg2/7VnoLQWJSkw==
X-Received: by 2002:a17:90a:5106:: with SMTP id
 t6mr1303122pjh.235.1604044661233; 
 Fri, 30 Oct 2020 00:57:41 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id a143sm5423045pfd.138.2020.10.30.00.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 00:57:40 -0700 (PDT)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: google: dt-bindings: modify machine bindings for
 two MICs case
Date: Fri, 30 Oct 2020 15:57:23 +0800
Message-Id: <20201030075724.1616766-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
References: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
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

