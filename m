Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F205675FA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 19:48:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FDFA162F;
	Tue,  5 Jul 2022 19:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FDFA162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657043313;
	bh=G7jSn3dCyR6sDY6JGuVkoygnfvevNVVzrUEL1Hwl+6I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QBJt3r/cB+t/8R7sSYvG7vdwHWFWFRXKcQyV/c2dxn+SyCyEmzRm4NA0yN9qPhsrY
	 nq+CgNe/OWLcLgzqaU7CnkFHnRCu5+QM6mn9Jr7pPk1KstOlnkdfOb0yiKSFVM8TL/
	 sKW3+4ls6pa95J/M08A8ZBWTTpop+nPSFEDWVli0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7DAEF80212;
	Tue,  5 Jul 2022 19:47:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49BEFF8015B; Tue,  5 Jul 2022 19:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 212B6F8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 19:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 212B6F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kA0owFX4"
Received: by mail-lf1-x129.google.com with SMTP id bu42so1975777lfb.0
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dyLUPLJN1u9FNXgGeiKc1oirfk0kExq8JKvDebi7B0o=;
 b=kA0owFX4H1CXq5w2ZmCHtgZkGCj6mxiaALH75Ugwnd+9XYYDgw45wefTL6cfQ9T1Uj
 mKkMjmzHT5aqjmBpaazGBFimYWNkLJDNqq9MwVU0QBOmY3Z7LCLpDLo1jCMnrALhhXwu
 p4xNYCR6vhUXBoQCFn1DO40XXSsRLZz7uGD7odR7X99PFUbZKr+9UBCWIa/7MLFTfGr/
 Ltbd9bGvA1jb60DUolfxQ1na5GKS/gkMz/whn+9KMwTD+HBksWnc8yZaYb11aiSNj02R
 4HzTqxUSxy64sEj1FXLv6eUWPL6PLj4UlGO6k1pERWwNF0pjxxDIe7tAcD9GMqh7bvZG
 DWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dyLUPLJN1u9FNXgGeiKc1oirfk0kExq8JKvDebi7B0o=;
 b=v6tgyJg7y/2O0usm5sjc6k4gfZN+TfdORt16jzINo0HtZWYZi2G8JJgPPGT89yuLPp
 flXVyo9CRx4x8K5CKWXuIy7y5DZX9uoczJLKgmIqNyqNVnYdppZDEi/njPLjZB6hjzct
 4QAKJrg4PTK+ZG+dUjIyHZM+2+zatytcWKQtwYQyNViyPrDy880Mdty+C3pcRdAVfwNQ
 bjNGsP5Y6rBM/uAvJrMpVa7JLcSlYe/JfrrIGoWqpzu+/inDz4ybrdzboqOKH3ewkaj8
 792deYZamxNqRtL3J+p+1uoEJYuOHah0s1H6sOsRfmfWpigPSa5ysuZhEcUDJTIVgZ2T
 orMA==
X-Gm-Message-State: AJIora+Cp0ZWzdYD634DSTYLy0ashL5/LFQ4DkG+C8OUhtBfo+drqGr9
 wzScYY1SIiIeQllbxkLtUkPddQ==
X-Google-Smtp-Source: AGRyM1tOs0j44NmjYZgJ6nDoHfOI+ayF9n+MMgK5oRPKWVyJUKLDx1/FaPDxkVeknuOnWQMgzv8RCg==
X-Received: by 2002:ac2:5d66:0:b0:481:55cb:9b8b with SMTP id
 h6-20020ac25d66000000b0048155cb9b8bmr17860281lft.546.1657043240687; 
 Tue, 05 Jul 2022 10:47:20 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a05651c107600b0025d38eb7390sm315371ljm.43.2022.07.05.10.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 10:47:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: qcom,sm8250: add SDM845 sound
Date: Tue,  5 Jul 2022 19:47:02 +0200
Message-Id: <20220705174702.763247-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
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

The Qualcomm SDM845 sound card bindings are almost the same as SM8250,
except "pin-switches" and "widgets" properties.  These were not
documented in SDM845 text bindings but are actually valid for SDM845.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Integrate into SM8250 instead of creating new file (Stephan).

Cc: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/sound/qcom,sdm845.txt | 91 -------------------
 .../bindings/sound/qcom,sm8250.yaml           |  1 +
 2 files changed, 1 insertion(+), 91 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,sdm845.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
deleted file mode 100644
index de4c604641da..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ /dev/null
@@ -1,91 +0,0 @@
-* Qualcomm Technologies Inc. SDM845 ASoC sound card driver
-
-This binding describes the SDM845 sound card, which uses qdsp for audio.
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be one of this
-			"qcom,sdm845-sndcard"
-			"qcom,db845c-sndcard"
-			"lenovo,yoga-c630-sndcard"
-
-- audio-routing:
-	Usage: Optional
-	Value type: <stringlist>
-	Definition:  A list of the connections between audio components.
-		  Each entry is a pair of strings, the first being the
-		  connection's sink, the second being the connection's
-		  source. Valid names could be power supplies, MicBias
-		  of codec and the jacks on the board.
-
-- model:
-	Usage: required
-	Value type: <stringlist>
-	Definition: The user-visible name of this sound card.
-
-- aux-devs
-	Usage: optional
-	Value type: <array of phandles>
-	Definition: A list of phandles for auxiliary devices (e.g. analog
-		    amplifiers) that do not appear directly within the DAI
-		    links. Should be connected to another audio component
-		    using "audio-routing".
-
-= dailinks
-Each subnode of sndcard represents either a dailink, and subnodes of each
-dailinks would be cpu/codec/platform dais.
-
-- link-name:
-	Usage: required
-	Value type: <string>
-	Definition: User friendly name for dai link
-
-= CPU, PLATFORM, CODEC dais subnodes
-- cpu:
-	Usage: required
-	Value type: <subnode>
-	Definition: cpu dai sub-node
-
-- codec:
-	Usage: required
-	Value type: <subnode>
-	Definition: codec dai sub-node
-
-- platform:
-	Usage: Optional
-	Value type: <subnode>
-	Definition: platform dai sub-node
-
-- sound-dai:
-	Usage: required
-	Value type: <phandle>
-	Definition: dai phandle/s and port of CPU/CODEC/PLATFORM node.
-
-Example:
-
-audio {
-	compatible = "qcom,sdm845-sndcard";
-	model = "sdm845-snd-card";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pri_mi2s_active &pri_mi2s_ws_active>;
-	pinctrl-1 = <&pri_mi2s_sleep &pri_mi2s_ws_sleep>;
-
-	mm1-dai-link {
-		link-name = "MultiMedia1";
-		cpu {
-			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
-		};
-	};
-
-	pri-mi2s-dai-link {
-		link-name = "PRI MI2S Playback";
-		cpu {
-			sound-dai = <&q6afedai PRIMARY_MI2S_RX>;
-		};
-
-		platform {
-			sound-dai = <&q6routing>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4ecd4080bb96..7cdf9e9f4dd3 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,apq8016-sbc-sndcard
       - qcom,msm8916-qdsp6-sndcard
+      - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
 
-- 
2.34.1

