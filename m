Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC33780FA
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 12:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05BB516AE;
	Mon, 10 May 2021 12:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05BB516AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620641643;
	bh=uW/Ybj4mw5Zqcl3RSv0HjqNW15m+mfwsK3nJeYCQPiA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+Ih4TciEvRVlH9SPWwTvksDOB/9mXBj/MCpEPTN5yHJqcDOkDDnAy52szrlopTZs
	 Xei21/7/XujOW043w/rjjow9CWXZOAVv06raGNn17oGIdBqgxUR6fUunl/OPxFrZpA
	 2j5WfHvibL8zh92c7aSrbO0/q6kmm/SE5vBCn/is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27B45F800B4;
	Mon, 10 May 2021 12:12:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13BF6F80424; Mon, 10 May 2021 12:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C11ADF800B4
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 12:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C11ADF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MFuPgAt9"
Received: by mail-wr1-x42a.google.com with SMTP id a4so15992554wrr.2
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 03:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rij2/M/HKkSLFPHAJhhVJA6+zwbwek0D/b3cbL9vGJE=;
 b=MFuPgAt9Xb2qMiVljGJyA+uXnFVr3R2u4usj2DTx1SeqSvaF35dF3HGyWKb9gigUkw
 a1v6M35FgV96ayryWUJHvvX7NSFgxFgsdeBjtWuTawmAV8aDFaULq05l8n/3jbPopx3H
 iYnfThykEyMYPXiJJV/ml/JikXVPv5paHsZUaU7c3SuP4xOcVE6qCFjIJpjbfWkhS6sn
 EYsWSXZtVPQivsWDEaRs9IrYJHgKT1B9pEcgMHYdYJZliwUGC6hFAvVgetsztj9ng5bn
 wZ2etz0Hd7rxmXaRkhJ21tgZa0MJaolHqhI+gZp5rQbYXukQZipbhxz0fPRaGXyVdPMi
 IovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rij2/M/HKkSLFPHAJhhVJA6+zwbwek0D/b3cbL9vGJE=;
 b=UJzosBNdpbrwVoKFsoHfoggqqbwWu2ZE66wlm+OGHvxh7rOP/ieOZSUNWw14KFwYax
 04zbW3j6j6RvaJcwUIrMiwKlDPGxEFUspbDGwMoggd1933bG4NhKajD2tr7Gu5NAFkxt
 29WZjBlotcH1TvRLp3PZejCpkZfFT6Ll48ROSKKsLB0uP26IvKtUn5cxCpJca+2cN9c4
 slbOunip0VztStf4FCmy2Dd05Z5u7KZst0E06rCixDJ/RhIAsq4p111h2U9NiD6zY60z
 klLUFy4+ho5T5b+poTnj77G4dXeYmh/PVf4o8MjS7QTIHn65PoP5o7txLjx0Qv4NnDcJ
 mTWA==
X-Gm-Message-State: AOAM5313dm7snAzq59hz4rJSkTXU+M4ooXAByersafYJYmgL+ZhtuyO6
 Y5oSiL6b8RpdZEuxnLxpZ0v2Wg==
X-Google-Smtp-Source: ABdhPJyR4qTOnILOTITMg3PbEL5bMtKXighTKxNJaEbAZmb5m3EwgEl6fTAu/xAjlo/IhBefwyqYvw==
X-Received: by 2002:adf:e44e:: with SMTP id t14mr30166177wrm.310.1620641534038; 
 Mon, 10 May 2021 03:12:14 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b7sm22072109wri.83.2021.05.10.03.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 03:12:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/4] ASoC: dt-bindings: wcd934x: add bindings for Headset
 Button detection
Date: Mon, 10 May 2021 11:11:58 +0100
Message-Id: <20210510101201.7281-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210510101201.7281-1-srinivas.kandagatla@linaro.org>
References: <20210510101201.7281-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, lee.jones@linaro.org
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

Add bindings required for Multi Button Headset detection.
WCD934x support Headsets with upto 8 buttons including, impedance measurement
on both L/R Headset speakers and cross connection detection.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wcd934x.yaml          | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index e8f716b5f875..b25c6ca4e97c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -77,6 +77,64 @@ properties:
     minimum: 1800000
     maximum: 2850000
 
+  qcom,hphl-jack-type-normally-closed:
+    description: Indicates that HPHL jack switch type is normally closed
+    type: boolean
+
+  qcom,ground-jack-type-normally-closed:
+    description: Indicates that Headset Ground switch type is normally closed
+    type: boolean
+
+  qcom,mbhc-headset-vthreshold-microvolt:
+    description: Voltage threshold value for headset detection
+    minimum: 0
+    maximum: 2850000
+
+  qcom,mbhc-headphone-vthreshold-microvolt:
+    description: Voltage threshold value for headphone detection
+    minimum: 0
+    maximum: 2850000
+
+  qcom,mbhc-button0-vthreshold-microvolt:
+    description: Voltage threshold value for headset button0
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button1-vthreshold-microvolt:
+    description: Voltage threshold value for headset button1
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button2-vthreshold-microvolt:
+    description: Voltage threshold value for headset button2
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button3-vthreshold-microvolt:
+    description: Voltage threshold value for headset button3
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button4-vthreshold-microvolt:
+    description: Voltage threshold value for headset button4
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button5-vthreshold-microvolt:
+    description: Voltage threshold value for headset button5
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button6-vthreshold-microvolt:
+    description: Voltage threshold value for headset button6
+    minimum: 0
+    maximum: 500000
+
+  qcom,mbhc-button7-vthreshold-microvolt:
+    description: Voltage threshold value headset button7
+    minimum: 0
+    maximum: 500000
+
   clock-output-names:
     const: mclk
 
@@ -159,6 +217,13 @@ examples:
         qcom,micbias2-microvolt = <1800000>;
         qcom,micbias3-microvolt = <1800000>;
         qcom,micbias4-microvolt = <1800000>;
+        qcom,hphl-jack-type-normally-closed;
+        qcom,ground-jack-type-normally-closed;
+        qcom,mbhc-button0-vthreshold-microvolt = <75000>;
+        qcom,mbhc-button1-vthreshold-microvolt = <150000>;
+        qcom,mbhc-button2-vthreshold-microvolt = <237000>;
+        qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+        qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
         clock-names = "extclk";
         clocks = <&rpmhcc 2>;
 
-- 
2.21.0

