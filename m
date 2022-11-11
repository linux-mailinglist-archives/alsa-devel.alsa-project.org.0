Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 333C9625675
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 10:18:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF3D1657;
	Fri, 11 Nov 2022 10:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF3D1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668158323;
	bh=RKLgBS9h1nbfK5UGZYc7ew5+8z3uMf8okkKzkUaA6LM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z/6sD747cTTvG6Kf09dvp70PenKBPhNMKzZxy+9i+DYEjfU58E4I6cGr2w092yPIF
	 gYthyxCofbmmdnqxzTG30YVczHS1OUOWwShrcxHz0YPd2wVMmpDeYtp2Hizdz48+hv
	 1WkQggNelFt1rlgfseJpWrNTABOD5f8LKPFogrGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4247EF800F8;
	Fri, 11 Nov 2022 10:17:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BECDF8028D; Fri, 11 Nov 2022 10:17:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC7D9F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 10:17:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7D9F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FHcbu6fD"
Received: by mail-lf1-x12c.google.com with SMTP id l12so7464439lfp.6
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 01:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nPlbKpBD0wKljEf7tisLD35jOw8oky/FUJbaNHDXDIU=;
 b=FHcbu6fDH/RFtvqwucotS+pvyGY/Xx9aapd69IoMT+MqjxmKgCMXbER26Dwea+sPzL
 +n4ysAVthsBSBw7+errjtRHSiCe+ay4wpku9H5qyWz2ZcES0nMt4niN4x0POIRG04Eut
 LY+Nm0fZOOE2t5zOXodf3JutS9I3c4MMUg3DH1ezQDynvzsCR5bLgGVlxLfGpnI4++ln
 ASZ0Ga1ixawq0SpZX17qWyRxTTleKPyGFRpniqE9B2QRJYtcUnDTa1wrnQiPHjpAryfN
 QDfzz5ht7w7vnD5tsnhxN53K1/8qMdBD1cahrmxXjpEfirDXEnYPqrI0HYTnv9ySPqJL
 4cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nPlbKpBD0wKljEf7tisLD35jOw8oky/FUJbaNHDXDIU=;
 b=dGSzEwH6OYiEM77/6uxkVDON3C3Y7EUvTxTFDY5Myt4fh0Gm6RsByilx7DPdGHriWo
 YCvnphbgCJIqSgZ2Hvb48aSuphInVWdorQdIuOeqtNG6bPeZlYksNq43cjJ7SdtJNQOi
 VbuEiqJjOqAsBKNz1ICydiYb3ngb9O9rRU6GZRBZofYDKuiqf0FYeNjwmX7UCrXa1t8W
 EqfOTFqeCjIZOQ/CHTGIm3I0NXFon2XCPFapXzPD5PsDtF+8giPJ5szTqJDePwJvFKCD
 b/M17H3gttyW7+Pyvduwlbwmx5fHc7NCkj1bFGLrjRXHSx/bnwJk1vbZlAM3MiEgKjKk
 Z4TA==
X-Gm-Message-State: ANoB5plPJRgoKBI8u05TN/fKetlk92XHmnirrs0LNK7yocA3taYZiIQV
 yIZtWIoxv69f/8ITOOKLvbSopQ==
X-Google-Smtp-Source: AA0mqf6IvaGdXlTe2+QL7qgXki4ORVbtUiaQ0mEhBXJKSWWq7k50zwCSMCisOJGWTfKz8eLqFXzZ1Q==
X-Received: by 2002:a19:f704:0:b0:4a7:7d62:2807 with SMTP id
 z4-20020a19f704000000b004a77d622807mr537837lfe.77.1668158261582; 
 Fri, 11 Nov 2022 01:17:41 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 o17-20020ac25e31000000b00498f23c249dsm231756lfg.74.2022.11.11.01.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:17:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: qcom,wsa883x: Add sound-name-prefix
Date: Fri, 11 Nov 2022 10:17:38 +0100
Message-Id: <20221111091738.34290-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

For multiple speakers attached, it's useful to give them some name.
Sound core already supports this, so reference name-prefix.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 99f9c10bbc83..f3fb1de93ba2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -15,6 +15,9 @@ description: |
   Their primary operating mode uses a SoundWire digital audio
   interface. This binding is for SoundWire interface.
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   compatible:
     const: sdw10217020200
@@ -35,6 +38,8 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix: true
+
 required:
   - compatible
   - reg
@@ -61,6 +66,7 @@ examples:
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            sound-name-prefix = "SpkrLeft";
         };
 
         speaker@0,2 {
@@ -70,6 +76,7 @@ examples:
             vdd-supply = <&vreg_s10b_1p8>;
             #thermal-sensor-cells = <0>;
             #sound-dai-cells = <0>;
+            sound-name-prefix = "SpkrRight";
         };
     };
 
-- 
2.34.1

