Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005E7E38AA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 11:17:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8235B741;
	Tue,  7 Nov 2023 11:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8235B741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699352241;
	bh=tJ5vMcLDVN9QwJdLUzmHBlJqBLZcVIFiB3l3EUv1eek=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A8QmKn/3TRA6V2C2KyXpwaPo+0Qppkj6XMmTFbaOv4r9vNcgf8T4EfVijGeJEEgdC
	 RGMSOUhgwpq4CxNk/lIwTY+ubcxQaT56GU6BnU8D9qs3GsUi27pKVpXTFuvTNcHVNG
	 r8jXfiI/Vam704XEgMGxoD804ARdvf6Kozh/Ozrw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B34E7F80557; Tue,  7 Nov 2023 11:16:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA539F80169;
	Tue,  7 Nov 2023 11:16:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4217EF8016D; Tue,  7 Nov 2023 11:16:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD967F800ED
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 11:16:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD967F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BuM8XuEy
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507b9408c61so7204259e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Nov 2023 02:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699352175; x=1699956975;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95vD72c+bC2P8X8C/IdsTMXs0cKxT+IRop924lJhGj8=;
        b=BuM8XuEyZG2GUcWCKcbNWbbyf8wqkr6z2t5o09LBdtCyz4umRD0LQaWpQCqyiKJJth
         iYyExykUL8mBi0OlsBoZL8cCOXDT2rCfmo67gCYA9ZPjxAmmxcoHoOsgY4v9rXpCFiN9
         BUbjCBrCGxTmdMg6KagFseoNnOIcuKi2ZMQGqr4H6iKEiim331vQERFuEjpv2Lsf7Zvx
         Tn3swmfLFqO/xeNkyzJsFG7UwtQ/8PKHKaQ48EFZVT5hUg793BEN70UNaKGGzEdqK9/T
         Cn9n7+akdoWL6KcVQHBgvuAaOntmoSpmDuik0k5F4qj2Vyvee6E9pLmBSNz5WUdN0Jz2
         p9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699352175; x=1699956975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95vD72c+bC2P8X8C/IdsTMXs0cKxT+IRop924lJhGj8=;
        b=BWDryWlInHL8DFbdMEF+zeo0wdIbjT6jS51nDcAS3O61579PymVxcemVGtoj6h+aZu
         zLvxoKu6wY3tkGbBSPgSwAt8pa2i8Z/fdIcHKQ/FL5Ify8I3WghlvXlerjybrlDRggsj
         2PIrPRFrtHhKEbvxYuvOv2Jrr6pifxxDHHRV1iLpM55FPoNnaXxYNv1jfqdvpt9Z4gZ1
         X3FOprUW9eRhS5XeSFfBEn75zlJFAE5FH5SdyRXceZGeQxivxYG2RR8Gr1IOmyp1qWBo
         zNyMbQPMWTyJkc50lgRx3m1ZKerhRZBb3zlKquwVUbqQojSdzofohs9TLYyLSI9PfRAm
         Jpqw==
X-Gm-Message-State: AOJu0YwaOmD/RCyZkqKwH2DEydOr9xCTV/cYvLkonV4CJauFGtScstAn
	nBNgtpHNgJdemxgKMnUlw5Py3Q==
X-Google-Smtp-Source: 
 AGHT+IGJuO6mk0T3Wt1edO/lmNN8eTn2eGwaG7+JJc/a3UervFShShCwhOClqq8GfMz5fuLE3zkgEA==
X-Received: by 2002:ac2:546e:0:b0:507:9855:bc68 with SMTP id
 e14-20020ac2546e000000b005079855bc68mr23509396lfn.37.1699352175531;
        Tue, 07 Nov 2023 02:16:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b003fc0505be19sm15249922wmq.37.2023.11.07.02.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:16:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ryan Lee <ryans.lee@analog.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: use "soundwire" as controller's node name
 in examples
Date: Tue,  7 Nov 2023 11:16:10 +0100
Message-Id: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KZD5OTONORYINMV3MWKK664UZXKENTAT
X-Message-ID-Hash: KZD5OTONORYINMV3MWKK664UZXKENTAT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZD5OTONORYINMV3MWKK664UZXKENTAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Soundwire Devicetree bindings expect the Soundwire controller device
node to be named just "soundwire".  Correct examples, so the incorrect
code will not be re-used.

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/adi,max98363.yaml | 2 +-
 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 2 +-
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
index a844b63f3930..c388cda56011 100644
--- a/Documentation/devicetree/bindings/sound/adi,max98363.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
@@ -39,7 +39,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    soundwire-controller@3250000 {
+    soundwire@3250000 {
         #address-cells = <2>;
         #size-cells = <0>;
         reg = <0x3250000 0x2000>;
diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index ba572a7f4f3c..8e462cdf0018 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -52,7 +52,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    soundwire-controller@3250000 {
+    soundwire@3250000 {
         #address-cells = <2>;
         #size-cells = <0>;
         reg = <0x3250000 0x2000>;
diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index e6723c9e312a..d717017b0fdb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -48,7 +48,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    soundwire-controller {
+    soundwire {
         #address-cells = <2>;
         #size-cells = <0>;
 
-- 
2.34.1

