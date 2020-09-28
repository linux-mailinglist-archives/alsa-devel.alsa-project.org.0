Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFE2280056
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:42:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3851618B8;
	Thu,  1 Oct 2020 15:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3851618B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601559732;
	bh=z3Agooe5hq9705XR6JLt5a3vjqAkS6tMG7nHRoIsrpg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a/NavsO43xGBxIU0pMaBFLb7rs5g9+SelNlkSy2vPU475bWnKd9AHfwGs4VJKNhF/
	 I36A5jLGPaxIPYKYrT96GCcVjNEPxnecmrwmZI9GNS4ZyrFgheqfHiEXKtidO1rhnk
	 GgZbk09u1faNemGsxhSmnGScIhsz1xwXTfIdiv0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0E11F8027D;
	Thu,  1 Oct 2020 15:40:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31B99F801F9; Mon, 28 Sep 2020 08:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1246CF800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 08:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1246CF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EvW1auze"
Received: by mail-pf1-x443.google.com with SMTP id b124so8425065pfg.13
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 23:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9fPNn2hkvUvRS1FoBqTdwdl0ikK+0K/8i5MIze2SS4=;
 b=EvW1auzeaeX+5P91nfpAeNz3iU3z6CXl1gD1XAWygHj/x0evv/YLyspd75P/ksoy33
 3nVjlPmZjT6ZnNetqaqDPlAPzuuy6rlHXgFEa0nOSDqhBn7HfjEcCRSj5cEYx6Ny2yRo
 +Ki+TDRfUpNA4phWyuxqaKjCnEL8Mh4HyT3elj7VQONpzdS+h/UiwvMfUKMu9hGlZqqB
 lOQtoGiDYfWb4OEfRjemFbIstZy/a5gWi+rASC9MguiWr/Z2kWRVSWmZVN2XsSZsGjNO
 gPoyDRbBnwcvIwk8TAUAxBN9hBkDqXEq+xBy2Kaqk8zyzFsObQTMfGmorhlDJEd4vVYn
 se2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9fPNn2hkvUvRS1FoBqTdwdl0ikK+0K/8i5MIze2SS4=;
 b=dwuOnpVNy/ekbU52UrpoB3mRorYxjv0w/I3+sRYB5z4LCX30letlIZ5bVrocL0d1NV
 9JCPIG258qO1fywnwvVSdvLe2ot4oPb9hCAc/DcdmQMJBsKPlNqnKEtnCtOxMOCzbtDZ
 5OcUEwQdkGdVuhFuaHg1o6tZzUeeAelVaaOPkfBBlIbxKICcspeOAe/qg54spxk01/A3
 AcdBkBypY2r3aDI2zmb1dspWYe4NbCp9qHtJ3N5/DiLctKBYFQyC8yt0ACchyIVOUIX0
 MZh12QUZqmIEfaIFUuzA5vrG5VljIPhUrUli6UYwIagvEF2G6EIqBF6M+NYaOUD8EgVM
 DMtw==
X-Gm-Message-State: AOAM531xOuHmp5gX/bwChE8t8c5Nyi7R/aF/Z+TUF2kSy6WTtEYduBr/
 bKoZj6I5ntxbEiI8bNKglG8=
X-Google-Smtp-Source: ABdhPJxG7BOD2ezBdXdfZEH8XstwCs/b4Bb6Xk3lDpQvpYBcSTLCgVvLyhndkIczw2+7IlEErCpQpQ==
X-Received: by 2002:a17:902:9007:b029:d2:8cdd:d8cd with SMTP id
 a7-20020a1709029007b02900d28cddd8cdmr206114plp.85.1601275086370; 
 Sun, 27 Sep 2020 23:38:06 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id c7sm189527pfj.100.2020.09.27.23.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 23:38:05 -0700 (PDT)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine bindings
Date: Mon, 28 Sep 2020 14:37:43 +0800
Message-Id: <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Oct 2020 15:40:07 +0200
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
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

Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
for 2mic case.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
This patch depends on this patch series
https://patchwork.kernel.org/patch/11773221/ .

 .../bindings/sound/qcom,sc7180.yaml           | 64 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
index b77311bb5190..ec84dbfc1bc9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sc7180-sndcard-rt5682-m98357-1mic
+    enum:
+      - qcom,sc7180-sndcard-rt5682-m98357-1mic
+      - qcom,sc7180-sndcard-rt5682-m98357-2mic
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -34,6 +36,11 @@ properties:
   "#size-cells":
     const: 0
 
+  dmic-gpios:
+    description:
+      GPIO for switching between DMICs, it is required when
+      compatible is "qcom,sc7180-sndcard-rt5682-m98357-2mic".
+
 patternProperties:
   "^dai-link(@[0-9])?$":
     description:
@@ -81,6 +88,7 @@ additionalProperties: false
 examples:
 
   - |
+    //Example 1
     sound {
         compatible = "qcom,sc7180-sndcard-rt5682-m98357-1mic";
         model = "sc7180-snd-card";
@@ -128,3 +136,57 @@ examples:
             };
         };
     };
+
+  - |
+    //Example 2 (2mic case)
+    sound {
+        compatible = "qcom,sc7180-sndcard-rt5682-m98357-2mic";
+        model = "sc7180-snd-card";
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

