Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5469C81B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 10:57:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1DC1EB3;
	Mon, 20 Feb 2023 10:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1DC1EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676887072;
	bh=wK2tKLkJZPckErb+V6rPr5ao0QeGE1Nu+rcmin3ZwSo=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q0030p6HRhVK4zpiQ3EH3tOoAl0jLAmjaWc1jOvdZJ1LJ1IxmH52d0tjJr28eBzYo
	 YgxXqv21CLtL2TCmh7JhtEI/9ZHdUNqwJlT7GR92t43/e/iSCsuPCZFWOt3BaAzCaC
	 hYO+Vm7wNeeeNLwVoBdSrgDMG7It/uWwB32sYDe4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E3B9F80266;
	Mon, 20 Feb 2023 10:57:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38E73F802DB; Mon, 20 Feb 2023 10:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92641F800B6
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 10:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92641F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Rny6XPuA
Received: by mail-ed1-x530.google.com with SMTP id o12so2740040edb.9
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Feb 2023 01:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3LaiP62Ub+1bPHpSVnzKmjmu1lGjGamLIIbRLJsLSY=;
        b=Rny6XPuAx7Sk3MB7fFIttlhJ7THp/8IMlgv4K9ksXCTPjiPCLLePzv+W5Hr2stIN4M
         1dChMPJhfXVRF3JX4oepBWRdhbDR7yrwGmYioetPjDR+cAQ65ym68SKmfnJ2+7YEF4U1
         Yrs0nNT6tCVGReIPS9Ex1ssEZKUFPVOGKBlgJQ4P5YswIlXZyOAt3oBDk4zgHVDdaRbl
         na1vyqXbmK+iU5WiRsYaOV33juVMCSmlfAweL2IjQYzQG31IfGSZB0QAMQXIf5DFOt7A
         TA22y+o0Wl0n3eKKLqY+IDbxO0r4VfIwi1nyVEDtTkjVj0Bg9iKWvVD4XO78rmX8S0WU
         L/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3LaiP62Ub+1bPHpSVnzKmjmu1lGjGamLIIbRLJsLSY=;
        b=isDJ3CTfDyA/ExtFytjeS+gveGVpVIAu/L6jIL7TmJD+CmmhPtXY/H7so5ElIS1X9e
         UYKilJRirEFPcp1DIqhj1KEwmDxNhOxRSF9rywSQd5FumF79iR2Rw9r5ZjXhnrcPHbFJ
         qvrXNjm7V3PQH3+N1UcSNMDlRVMlH9EKuzysofLMDuHfu17SdlHqoUz+/fnbFW2fbbqR
         V22T1cUwqt1UC09xk/DpeEh1NzM5VmgCnTKCI10RR3fb//mwLO8EzUdt0MealMVlKTdI
         GXd8BgyWJ6yc/tnEDk89FkNCFwoLj8pfdDoeqSZZs8NVfopqkhsbQRdiErKRvT2ukddt
         U+OQ==
X-Gm-Message-State: AO0yUKUOXRr9S+4u8H1EVhY2wMXA1zzFlizABO9v8uykorYWs6kiEQ3j
	dvUczqzXAAZTOQznkYaaweeBBQ==
X-Google-Smtp-Source: 
 AK7set8fToKzilOyL2I4p6Bi7iekOkQRKH9anegkGP7crjC/5wFvruat7FXl54OI/yFlD83V4hEbRw==
X-Received: by 2002:a17:906:f0d1:b0:8b1:3009:536b with SMTP id
 dk17-20020a170906f0d100b008b13009536bmr7775763ejb.29.1676887007310;
        Mon, 20 Feb 2023 01:56:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 b25-20020a17090636d900b008b129b7f4e4sm5513120ejc.167.2023.02.20.01.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 01:56:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,wcd934x: Reference dai-common
Date: Mon, 20 Feb 2023 10:56:42 +0100
Message-Id: <20230220095643.64898-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LGAW26ADH6M2HMAHLNQBYEKC4GKNTF7S
X-Message-ID-Hash: LGAW26ADH6M2HMAHLNQBYEKC4GKNTF7S
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGAW26ADH6M2HMAHLNQBYEKC4GKNTF7S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reference common DAI properties to get sound-dai-cells description and
allow name-prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index ea09590bfa30..ae8346b9d332 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -151,6 +151,7 @@ required:
   - reg
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       required:
         - slim-ifc-dev
-- 
2.34.1

