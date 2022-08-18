Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F405F5984A2
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 15:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2E2B1655;
	Thu, 18 Aug 2022 15:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2E2B1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660830497;
	bh=YDghUc7DbKpkoznlhLZvfD7apOYsiX3beghwP7xwY8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QHuLsyMqNWYXA4Jq8x+DeU6PSh5ujq/X6QI/SimJFgMvTQbsIccjH9G6wE9SfOu3n
	 az+1kLIEGTNZLbiRkHyYCm/6pJAtbeDIprUCjiayDLg4sUzW4/amVpxleWJ8j4Uew1
	 AwGF/FH93UArZjoBnimabd5n1JPuXBZESApSviv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72FF2F800EE;
	Thu, 18 Aug 2022 15:46:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC4CBF804C2; Thu, 18 Aug 2022 15:46:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C30BF800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 15:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C30BF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="R3MeH3MP"
Received: by mail-wm1-x336.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso959338wmb.2
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7UEaK75XddAzmeSUUviQ6zd7mwl28xNsOo/h1M2gdWg=;
 b=R3MeH3MPjWTZ8yZNP5rkWd1EAOC+J3UnYKnmXkE7zJo6j8BFvIyR/8vHQBIKVnICc6
 WAfMtDxnpim7p2UvFjPaQBK6R4Dye1jZelXxJYlSJvD8XhD5eLlssZTDNaVfoYKxIT4k
 8EjYXJLiSqOchMQH5hRyGXSS4HrHuuET01qrJ7U6y9Ok9QgM/G8GCxb7A6xjgrerlqZf
 aQpPjE+HcQ39RmfR84OJqGrdVZJWYR6iP2vC1pGy5A7IpD939s1E13eyLeaRKEPX8a1x
 H8lCgAnrVo1lvhAJDfmjHUVciin2kHyDBhYn+QW1DjDOpJ4lpNmmjpflqljieREN9SAa
 Ktow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7UEaK75XddAzmeSUUviQ6zd7mwl28xNsOo/h1M2gdWg=;
 b=Ilf3x+yhTbZTVxBBPICtuOcsuOKNicuBFRhMQxyJRiB62IJ4wb7sfhKiMSbwTJheaj
 7hfSCK772rlxojVAy78H6GMqxpARPsQtq88ZZ08Wv8DojfrH9MRK92pL4tq/rwQyzPl5
 NeJF/pNJxQvxwPO/eCWjouRG9/njDcUedsZGGHWG6T5+YimBGosLYDXPZf2i/foTexse
 3mokKX+D6r/xoF1iDgpwNXW2tfB5Saetcs2oljLl8uy6Cc9Ub210gGYNFCQ3/mXw3fpc
 w4//P0nJnVzx4fGP04dZ7yueO6yJqmb/AB+cOtH6dvXVDluB8hEH/nhAzQlpwPHl3MnZ
 5f4Q==
X-Gm-Message-State: ACgBeo03vO2jPrWeyEVMFiivttoNKWrl4UBrAUXNF08lzUo/x4AUjM7q
 qH9aLUAyrW3SkUDnABa8ieDv+Q==
X-Google-Smtp-Source: AA6agR7RPL+SW4zi+OqxoNudlkRplCeu1snCGdqEB6q/D+y5IlgI2cclSEcKFDMCWUpd8FX0VziOEA==
X-Received: by 2002:a05:600c:1552:b0:3a5:b933:b629 with SMTP id
 f18-20020a05600c155200b003a5b933b629mr5122024wmg.200.1660830404663; 
 Thu, 18 Aug 2022 06:46:44 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a5d6785000000b0021e47fb24a2sm1454549wru.19.2022.08.18.06.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:46:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/6] ASoC: qcom: dt-bindings: add sm8450 and sc8280xp
 compatibles
Date: Thu, 18 Aug 2022 14:46:14 +0100
Message-Id: <20220818134619.3432-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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

This patch adds SM8450 and SC8280XP compatible entry for LPASS TX, RX, WSA
and VA codec macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml          | 2 ++
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml          | 2 ++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml          | 2 ++
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml         | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index a6905bcf89d2..1de11e7f33bb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-rx-macro
       - qcom,sm8250-lpass-rx-macro
+      - qcom,sm8450-lpass-rx-macro
+      - qcom,sc8280xp-lpass-rx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 324595a62ae8..de8297b358e8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-tx-macro
       - qcom,sm8250-lpass-tx-macro
+      - qcom,sm8450-lpass-tx-macro
+      - qcom,sc8280xp-lpass-tx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 7b4cc84eda8c..9f473c08cb2e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-va-macro
       - qcom,sm8250-lpass-va-macro
+      - qcom,sm8450-lpass-va-macro
+      - qcom,sc8280xp-lpass-va-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 13cdb8a10687..4959ad658eac 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-wsa-macro
       - qcom,sm8250-lpass-wsa-macro
+      - qcom,sm8450-lpass-wsa-macro
+      - qcom,sc8280xp-lpass-wsa-macro
 
   reg:
     maxItems: 1
-- 
2.21.0

