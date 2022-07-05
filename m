Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8FD567675
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 20:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF72916DB;
	Tue,  5 Jul 2022 20:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF72916DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657045773;
	bh=E7cnOoqN+R8Ce5kk70VDsz3smvPsoRgoT7MX0tuj3us=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B3JnFmUOwtdzPFu333Adt5G/iJzzUI5M4h49ChC7lcnEfClmr74PF/GPyjTmvW4qx
	 SCEsGrjDJQPypU4GdAaMNzLbSLbDZTzdbOTkRXDg4Oh04gMrWZ1q/dp5Bda/sRs9ex
	 sFpve6mSXbtQIf/MIYPcKJnFBNgdaiL36rPT/8nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 311F9F80212;
	Tue,  5 Jul 2022 20:28:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73DCDF8015B; Tue,  5 Jul 2022 20:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC8BF8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 20:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC8BF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wQLnp3gg"
Received: by mail-lj1-x231.google.com with SMTP id a39so15566990ljq.11
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 11:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=prRY92hm0hYRbQWVcxgM7sRmBRs1AmHNfvSvCM66/jk=;
 b=wQLnp3ggtVAH9blbKWhUPNKoP8PRrneIiT9WsGQTa8b9UDs8ZBB4GRwBhg+OOdqUXg
 aUL4ziW6aaHqN+o8e3RZlEUQqBmtbHjnjvnWLNGtPP3Sf4yqIB0jHDQofKw+ZrWj6S6g
 APw5Ebf7ZXasIS7MCmBgS6v59mbSfl8cFlh6YFasj0Mc5b5we/JpzeEfF9hC5wv1wAoj
 GSQaOathVQ50KKuEcpWrEAuwCa9/p17KphigTRWuVEcg8TymWOwGq6FqYmp+6gOQn/6a
 lTLojDg1EgetdQ+sp9cl013CDXGBWFtx8gjI78s+/I8B7RNaod1rQhA/AgY0ppk1lS9m
 Hi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=prRY92hm0hYRbQWVcxgM7sRmBRs1AmHNfvSvCM66/jk=;
 b=1MteBMYt6i9LfQ5oTXx+933aYhse8ZTIVE5e9h/Se3Xt/m5W5Xnsr65lyvaIbdU2bJ
 LvwCwHK07WPEGWQdk4oBopXyRrgI7a40+az4YUmV7n5aKWTtDdIKZfZWRnYH6U5b7Hv0
 q4pLvU4uOjYmmSWLVq1YxTtRFi09J0P6wZQ53iHyO0civT2+WjKDkMnMKmDnBHTIwyHu
 MTHN1Hdg/6cFqvF5iSIGnlqAJHCL/VeKkXJ0e1Zi220gUDe5KTkCy3IPGRwcpqCgeWHX
 dhC6N2dWecas+qFRZXhzHBCIiONnlXBK7u8pobGClUYd0hc+EEZPIAGhKUFzwpRjfbY6
 1FsA==
X-Gm-Message-State: AJIora8DFPA5T1QPuvooxdgJJrJ6pnm5MEElIi3E0OIqGeunl8jKSiJk
 tRDPpy4aF3J/OK/hOaeSy6dMiA==
X-Google-Smtp-Source: AGRyM1u/Er3XYhVY+myb3wkrtLYh8GsyMsww+Ez/qmFUdSNQIyw4grD/5GIhumYWMJyFX7ksDb4Zew==
X-Received: by 2002:a05:651c:a11:b0:25b:ae96:337a with SMTP id
 k17-20020a05651c0a1100b0025bae96337amr20570810ljq.35.1657045697275; 
 Tue, 05 Jul 2022 11:28:17 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 e12-20020ac24e0c000000b00478a311d399sm5823306lfr.0.2022.07.05.11.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 11:28:16 -0700 (PDT)
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
Subject: [PATCH v3] ASoC: dt-bindings: qcom,sm8250: add SDM845 sound
Date: Tue,  5 Jul 2022 20:28:02 +0200
Message-Id: <20220705182802.775803-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

---

Changes since v2:
1. Add missing Lenovo and db845c compatibles (Stephan).

Changes since v1:
1. Integrate into SM8250 instead of creating new file (Stephan).

Cc: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/sound/qcom,sdm845.txt | 91 -------------------
 .../bindings/sound/qcom,sm8250.yaml           |  3 +
 2 files changed, 3 insertions(+), 91 deletions(-)
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
index 4ecd4080bb96..e6e27d09783e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -16,8 +16,11 @@ description:
 properties:
   compatible:
     enum:
+      - lenovo,yoga-c630-sndcard
       - qcom,apq8016-sbc-sndcard
+      - qcom,db845c-sndcard
       - qcom,msm8916-qdsp6-sndcard
+      - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
 
-- 
2.34.1

