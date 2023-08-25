Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB1788DCC
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 19:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07DEF1E3;
	Fri, 25 Aug 2023 19:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07DEF1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692984290;
	bh=jgTjHUj7TFqcyTxVQWudplP084wTba8RuCtAcYnZkrQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CiaDn3gz3w9AiMDIg2hmpTcNoIKXzOByeqzClVBMtsqD39bJjWdLl14E+7Jp+R7rO
	 VgKkzxv8WfGxhUjSXu8fsmrML+byV5xEC6pyB7+CYAeIYvZWbhPY1I4x3mBn7kgUm0
	 DtGKjIMCd/jNF3Jb6wfCerAPm7eMh/zCTZ+ObzYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 194F8F8025F; Fri, 25 Aug 2023 19:23:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F3BF800D1;
	Fri, 25 Aug 2023 19:23:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFCDAF8022B; Fri, 25 Aug 2023 19:23:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90239F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 19:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90239F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ojBZNwS1
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso17261761fa.3
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692984201; x=1693589001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnl0nfGWFMmePo5XhhTAL9r/K3CVNL4Sy0w8+CLGMTs=;
        b=ojBZNwS1tIBPfR9KCT7+DuZfHjQSi9gx057HfyL1bxEv/FVgb/xHtYFrUPPnG1m5/o
         nQrCin0K2krR+onwHEF1xgPyttEFGjDjVQHfl31FNsaloNjL+Wj049jv7JjquX6WAWVe
         xYwo7hpE+PviwbdHTkdnfdYl6dyIL0cieGDpGbxPbCAhreibBV7Crlf2wqvyqTB5wSF8
         lcsUXG8GJ1Mc0mLaWCgEnVxdqX8BqkqCydhBK/WuG1M2L382YPV+53107TVVIpRrrAw8
         S82/RFb6SczYfJA7MEDArYY43nWVvq4h1LIMnBjrAznIXJLcgHiyzdmzlWFpxtZrupLU
         mJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692984201; x=1693589001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnl0nfGWFMmePo5XhhTAL9r/K3CVNL4Sy0w8+CLGMTs=;
        b=XzTPlxJAoj13cY4YKTkOHOllj0Cy7Vxv9u/2xl7sROfgCxWjhEhBYbZEXF+GZEbyMw
         9XihMmZ2qx5y69grv/VPh2fT8Py2G6lfwN4m9Y6hXgr13tha2tnxfgVBQM2o2xyhC210
         yjw5dQ9xa13yasSgqiHW/N87qwoK07kGGVa0IRHyvZ+MmhaKLCHqzc9C6KDTeBaWFMcj
         OaRMBrm9xsVP2NMwoJa5WbuJmcr5/Zz6Ryq515UPmG0RMseEB8nKCQrZEUUsPICoLWcO
         ibPYus3aeMLjlBSXo7taYxh9+2y3OxESbSjN80vL3FMtpOMqgDKBDJJ/rycp8fjx0wlh
         rTsw==
X-Gm-Message-State: AOJu0YwGwffRA4KF54Fup9Bk/Dahy/fhPT0wzMMlArnSYCjl2xUTAWAa
	mpy4qm4GwftkJaZfuWjQp0r9UtP/P+Zhqr2pJoiBww==
X-Google-Smtp-Source: 
 AGHT+IHGRJTTur6Oz9VmbkB/HpCjN3NrWbDfAwaZ4WLBV/xsf6YFnzAq58tMlYQQ98UExDKmW3zL4w==
X-Received: by 2002:a2e:8091:0:b0:2b9:55c9:c228 with SMTP id
 i17-20020a2e8091000000b002b955c9c228mr14001217ljg.27.1692984201324;
        Fri, 25 Aug 2023 10:23:21 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
        by smtp.gmail.com with ESMTPSA id
 n11-20020a2e904b000000b002bcb1e1322asm407647ljg.63.2023.08.25.10.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 10:23:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 25 Aug 2023 19:23:12 +0200
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM6115
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-topic-6115tx-v1-1-ebed201ad54b@linaro.org>
References: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
In-Reply-To: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692984198; l=1361;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jgTjHUj7TFqcyTxVQWudplP084wTba8RuCtAcYnZkrQ=;
 b=8UXxWoH+EUI9yNwtTdYkE66s1GCSUJ75tB7slZwxx0H+ZdSdJzBgStNWBOn9OWZKoCIUSmzHj
 rWmKIH3X6UdDZPNm3LJNPzEr4K1EnBWlgjjKFbx0wKNDr3/e2s4DBNw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: I7I5IG4VFL63R7ZY3ABLP4E3KAWY44NL
X-Message-ID-Hash: I7I5IG4VFL63R7ZY3ABLP4E3KAWY44NL
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7I5IG4VFL63R7ZY3ABLP4E3KAWY44NL/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SM6115 has a TX Macro, requiring an NPL clock, but not DCODEC.
Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 4156981fe02b..962701e9eb42 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7280-lpass-tx-macro
+      - qcom,sm6115-lpass-tx-macro
       - qcom,sm8250-lpass-tx-macro
       - qcom,sm8450-lpass-tx-macro
       - qcom,sm8550-lpass-tx-macro
@@ -97,6 +98,23 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm6115-lpass-tx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:

-- 
2.42.0

