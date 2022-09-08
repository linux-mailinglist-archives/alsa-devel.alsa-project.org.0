Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E385B1899
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:25:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256B216F9;
	Thu,  8 Sep 2022 11:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256B216F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629130;
	bh=DRIoh5hCfNENfG/JcUlLQQDz0pWYklCK4FZSRxn/dxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKKC2QQCAOwzkHG6zn94DPtBnMoDe53V03RtqQ6eQ0obuPbg71oVcQ552pUWEwtOO
	 WMeTg00k9fBly/4KO1zcFEiGAnrLU4MxviNeBtixyTMNBkdsK3SVgxuRYvicxG/efW
	 yDmKSIUAgU7CxRjUkcL2vsyxSEZK7/ICYKQ2u7mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97071F805C4;
	Thu,  8 Sep 2022 11:20:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22F53F80566; Thu,  8 Sep 2022 11:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10672F80566
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10672F80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zhPVsuG2"
Received: by mail-lf1-x136.google.com with SMTP id bq23so26702044lfb.7
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IE9iYaf4ljXjTzH90yeiguLHiQ95amY6yCG9ecN7egM=;
 b=zhPVsuG2l3xnWS3yDCpDzylO8CO7FHZKJ3Zd07Uynvqf/7lz8HLM0vuxl7BINDfmXL
 /5FiRSJ/BgW1WlAfEuMZlzpscb+me2WIsTmlCRgFytsqhtKhdj9sOWnDme1XfKJLsZ9G
 8oW36CmqJdg47VWJGwAszWQIrVkSMHUmLAdn3AFw/kZgRWpoOS7mstMGT+xBOwdtfGON
 +wSZz+qIhMDD8HAO2ImE5FfUbkrX5hpvU6h8bHYWcxe6Lz7vSKo8ZUUf21XZvHYE+s0z
 0BgwxYt47ZbhpLA/ui8gQd+QyTKtc/3PFbnN7o0pgQnQN6s9EErQjIt3jtzQxeMiyF8X
 A8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IE9iYaf4ljXjTzH90yeiguLHiQ95amY6yCG9ecN7egM=;
 b=yGuVYL8p8DrtCidrGnfY0BG9kH74+t1uwlAIOTLS9K4R8gOu6TqBrCsVczTv17xtQi
 12/mLjjp8FOdgWLsYtynKqyNHdwBPDZq/ZtKyxTms5j7AkFCflfs8r7ROerAvUX7+nBn
 /Pp9M48wlMuClv51K//aFIhlvBpnowvYsU8yJoPHcKoqarmeZE0JPzFzWbRJNBhgDb7+
 3cvEpVnJ5ARkDqFa/KUemKkGuelNlPXqeTJgyMFXmGfcrc5TaNKpvPa+KBIDEn0dd/5Z
 34spBUyvbUdrE8KKBzR7K3P4m7/U4UdnNULTM+fU7gvdHSI6TgfQKvRmoOWDosuZFzXP
 1A/w==
X-Gm-Message-State: ACgBeo1lmEp4P8sUWBezchJLHUDOkEU1ymAJOw4Lpo3AuBoR/TaigcZC
 9PW0um9XXCLZKcbaBhzxssipMQ==
X-Google-Smtp-Source: AA6agR5lOjJt6vP+XfpUeEi0d0i62RnR1ZVSDdEFDVUHchyMZxKh3epAz79gCniN/mJbV1a1VKqujw==
X-Received: by 2002:a05:6512:3a95:b0:498:f272:6587 with SMTP id
 q21-20020a0565123a9500b00498f2726587mr188386lfu.148.1662628807024; 
 Thu, 08 Sep 2022 02:20:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:20:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/14] ASoC: dt-bindings: qcom,
 q6apm-dai: adjust indentation in example
Date: Thu,  8 Sep 2022 11:19:45 +0200
Message-Id: <20220908091946.44800-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
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

Cleanup the example DTS by fixing indentation to 4-spaces and adding
blank lines for readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 844d72b30969..24f7bf2bfd95 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -33,13 +33,14 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+
         service@1 {
-          compatible = "qcom,q6apm";
-          reg = <1>;
+            compatible = "qcom,q6apm";
+            reg = <1>;
 
-          dais {
-            compatible = "qcom,q6apm-dais";
-            iommus = <&apps_smmu 0x1801 0x0>;
-          };
+            dais {
+                compatible = "qcom,q6apm-dais";
+                iommus = <&apps_smmu 0x1801 0x0>;
+            };
         };
     };
-- 
2.34.1

