Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A56095389C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 18:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D4252BB1;
	Thu, 15 Aug 2024 18:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D4252BB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723740847;
	bh=8gp1z00XUPBPK/2A5YWOe/yOJ5ggrhQmUd1FrjV9OlE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T/WhrGLOnal3TxNJk6/edjMYDpstDYZWHkxdfArnQgdA2qLuRteYis8rajBUT50ut
	 VTsjguM1rY4uOkqQq24N+1zzDlAWn0UX3L7VTf0Nu4rMySc+i5Ywo7ONTi4chARsKM
	 KHQ6oAC832K19PhtEZih8PDC1FbYjy7ZgU0wzH7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 540EEF800BF; Thu, 15 Aug 2024 18:53:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB077F805AE;
	Thu, 15 Aug 2024 18:53:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98CC8F80423; Thu, 15 Aug 2024 18:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3496F800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 18:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3496F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eycIRhGZ
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7d89bb07e7so138833766b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 15 Aug 2024 09:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723740807; x=1724345607;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iY0vaXx2PRLW4vzBLW/cAdjdL4sP5M2yeIYGKZKArlc=;
        b=eycIRhGZeI2C3zZyvcKfvsg0utZiwltE0il12VzOYXyy6LRgFIaA1WkwTrQ/fAOzmZ
         I0peffS6zcrY1vFbF95DhHxUktpE5k6mz8KEoE3zp9tQlRut7USPNdxBNXLf0QXjjUBN
         pAUEKytykVHb/6Gpdsco6X9ZyV+OmIQZoeURIE4JEpRPoFVhtoV4yqkLEQOafZ2+fdDT
         wwsWnKCCmdmcDzH1tGwohEh8RIUTU7kpNpaluaalJzpoWYNtcVZxKLAIG8aUwpy4bYcw
         InLJRIWIPCrYlVAugeyHQpxe9rc0UDmkssec7jOHBZPt9n8WM6N5XSjYUFxwdDhIQUxa
         vJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723740807; x=1724345607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iY0vaXx2PRLW4vzBLW/cAdjdL4sP5M2yeIYGKZKArlc=;
        b=LQ8Fh6HGfZYPwa1V1x/maTzUDPi5pOMg4UaCg3634Oxdb0kGQaZvfR9ztj/dEnGYUs
         m62XkhxdL3AStNhIqOb7mOO4uNDtd22xdBDlslDWpcY+eRfLMyjCyrL2yFUtI8YcVHpe
         D10PLgJyyN0o/ZSvDOPcfQ6YKMYp4E4R15N4K4cOWzyMNJR2Gcu5OAsNmob/t02R8VGu
         x4nWsjuUL1kdalO6tRKTEVtLBHfv8W+S3Cke58fZ1TU0ZsPXiZ61zqoRHDbw3j3YmfLh
         pJMwM5FgdEit8B6Uo3somVLyvpHJyakf54l1z48C5DhGfD7ayv1D5tf/6Q0qO4cm5UPl
         jeqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSI6xE82tYmSS+NU+Su7ZcgsSckLPKju0EPORhYwyL1UNekFVbjKPxtQglmbx05HDL7mEgwCL6bOO4ugZd1ZDuPrRiNPyJINxii4Q=
X-Gm-Message-State: AOJu0YytUdtAmNTJa47GsZT/lgm9RWmMAH1D5qynCK7y66JAURpL8zvc
	7yGpAQKEWTLgky50CIaG3jg/ekpRZNJqAPdHo9Gy/+DU7aqK0O0K+5av4WVeGfs=
X-Google-Smtp-Source: 
 AGHT+IEbjcVOtpHdIaM4cUOULDHg+UWaORWQ5CopRakSABxr3jeAy3+Ctzkl4nqMncrj5XJRSdxb/Q==
X-Received: by 2002:a17:907:3fa4:b0:a83:62c2:6d5e with SMTP id
 a640c23a62f3a-a8392a15b40mr11146166b.45.1723740806958;
        Thu, 15 Aug 2024 09:53:26 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947b86sm126736266b.187.2024.08.15.09.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 09:53:26 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amit.pundir@linaro.org,
	dmitry.baryshkov@linaro.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: qcom,lpass-wsa-macro: correct clocks on
 SM8250
Date: Thu, 15 Aug 2024 17:53:20 +0100
Message-Id: <20240815165320.18836-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BWBTJHLNBQIMPUQNR274CPYXRBIBAYP5
X-Message-ID-Hash: BWBTJHLNBQIMPUQNR274CPYXRBIBAYP5
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWBTJHLNBQIMPUQNR274CPYXRBIBAYP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

we seems to have ended up with duplicate clocks for frame-sync on sm8250,
it has both va and fsgen which are exactly same things. Remove the redundant
va clock and make it align with other SoCs.

Codec driver does not even handle va clock, so remove this from the
bindings and examples to avoid any confusion.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 22 ++-----------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 06b5f7be3608..6f5644a89feb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -64,6 +64,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc7280-lpass-wsa-macro
+            - qcom,sm8250-lpass-wsa-macro
             - qcom,sm8450-lpass-wsa-macro
             - qcom,sc8280xp-lpass-wsa-macro
     then:
@@ -79,24 +80,6 @@ allOf:
             - const: dcodec
             - const: fsgen
 
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sm8250-lpass-wsa-macro
-    then:
-      properties:
-        clocks:
-          minItems: 6
-        clock-names:
-          items:
-            - const: mclk
-            - const: npl
-            - const: macro
-            - const: dcodec
-            - const: va
-            - const: fsgen
-
   - if:
       properties:
         compatible:
@@ -130,8 +113,7 @@ examples:
                <&audiocc 0>,
                <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
                <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-               <&aoncc LPASS_CDC_VA_MCLK>,
                <&vamacro>;
-      clock-names = "mclk", "npl", "macro", "dcodec", "va", "fsgen";
+      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
       clock-output-names = "mclk";
     };
-- 
2.25.1

