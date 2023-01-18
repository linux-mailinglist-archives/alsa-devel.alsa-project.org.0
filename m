Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A37C26718C1
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 11:16:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 018573C79;
	Wed, 18 Jan 2023 11:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 018573C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674037011;
	bh=nuGcPEIM70cM6vjiXCWVeTIufd8ZY9F9vhTqi7Gr6WA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=d1ggyVWsThFNBvdBG+4KbgDeAdIBsiLIstKoRShNlHpKf0hPG6+NMlt0QTPHtTMpC
	 0/T/nMJL1DYTpyiTJ3FvQ39K2AlEBCgA7u7/cRstsZxZ9Cps5CGsjqRkTzTC0WkOQ+
	 Cl80hp9Y5dZgbsoUb8QrY98xV1U5VcwJvB9PDobw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8680F804A9;
	Wed, 18 Jan 2023 11:15:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D33FCF8024D; Wed, 18 Jan 2023 11:15:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBF93F8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 11:15:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF93F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CkGxztPe
Received: by mail-wm1-x32d.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so1142803wmq.0
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 02:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uRyEhmF53trv7Kk3HZnJmBth9b2MnpqhZNNSw33IxZw=;
 b=CkGxztPeZ7+mrbeo75roxxrAxtbRiGO8zsjGejstIdNbfXXCpaBjyxTkK5DK9E8H5/
 BUEVRHfzeCL/5tO7UxBFB/KGhctINV/Xh6/XhjtAlwxtOYGrn3dl34d9xRCXnlO0NlS6
 8iAFY8ZOSuPH76eYZvHs7l1bMEvruVSGnnDifZTtxdqiIKsYxJW6ZS+jLk2sIXkK2xFM
 rHtPYM9xyapRgWGE1yJAcv1pUGzN+XA8aIa8RbeQYbZmF3C/EyAM2K0sHHKzDPqj/JLf
 vcPPGSXJ1yGCyw+lURMfGO86QP11JohiF67mED9Hnf9fFFXFyQt4g/P+tQ1Q4XrzADZc
 Smbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uRyEhmF53trv7Kk3HZnJmBth9b2MnpqhZNNSw33IxZw=;
 b=V60/+bAV+bXVVOp2dk6JIky1uXzEsD04TEAWJsIb3uOJQ5FVZQ/8geyLo6R9A+RtCL
 Y1WtUO7ZVfPg8i2MTaVwfZQUMLQzgc5OcM4A921nmNkFkHhVQ1t9ESu5JaahGOumJa91
 Y0nkaejEGFdGSwy231OafykYfxWEImVYNBCo06mw8Ho/PvtvTJiiQYEF/NkD61V+H3aJ
 /IUEp+IhURkrQfUEsyUrXt0G5niB6GIn6AMSBqPz7dh7jf33ygXNWTiUQNbMHtsylb5M
 2qBkfKumWQRTSAXbMFmFTTYlOdNGfkpiHZ5bhhWbz+cGx6vgxvHKvOczb6ScTbyfQk8A
 oNKg==
X-Gm-Message-State: AFqh2kosI6fk/3gKAYdu//mDt55nkKCLaBrmZ//7UVDXn63iLt/C06iV
 RhvihpUbw6Yz9YxLXLdV1mrX+w==
X-Google-Smtp-Source: AMrXdXvXVA0eU58uzXSl/J827hOxqwwfBk3z8B/SPSmD0BQLzQD6uFwmFm3SePbidZ1gnz4zDG7pPw==
X-Received: by 2002:a1c:7417:0:b0:3da:fcd:7dfe with SMTP id
 p23-20020a1c7417000000b003da0fcd7dfemr14856239wmc.10.1674036947004; 
 Wed, 18 Jan 2023 02:15:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b003db00747fdesm1529838wmo.15.2023.01.18.02.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 02:15:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,
 sm8250: use fallback for SDM845 sound cards
Date: Wed, 18 Jan 2023 11:15:41 +0100
Message-Id: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

All SDM845 sound cards are compatible with each other, so use one
generic fallback compatible for them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,sm8250.yaml           | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 70080d04ddc9..262de7a60a73 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -15,16 +15,20 @@ description:
 
 properties:
   compatible:
-    enum:
-      - lenovo,yoga-c630-sndcard
-      - qcom,apq8016-sbc-sndcard
-      - qcom,db845c-sndcard
-      - qcom,msm8916-qdsp6-sndcard
-      - qcom,qrb5165-rb5-sndcard
-      - qcom,sc8280xp-sndcard
-      - qcom,sdm845-sndcard
-      - qcom,sm8250-sndcard
-      - qcom,sm8450-sndcard
+    oneOf:
+      - items:
+          - enum:
+              - lenovo,yoga-c630-sndcard
+              - qcom,db845c-sndcard
+          - const: qcom,sdm845-sndcard
+      - enum:
+          - qcom,apq8016-sbc-sndcard
+          - qcom,msm8916-qdsp6-sndcard
+          - qcom,qrb5165-rb5-sndcard
+          - qcom,sc8280xp-sndcard
+          - qcom,sdm845-sndcard
+          - qcom,sm8250-sndcard
+          - qcom,sm8450-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.34.1

