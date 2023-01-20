Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706CF675896
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 16:31:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DABE3301;
	Fri, 20 Jan 2023 16:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DABE3301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674228691;
	bh=OPWCSzL0kgX3MhQNHssu5JAZAbXOa5rX7yTE8Hagm8Q=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s/Dg0ZONkVDFPCEFCITXNJm7nNEJOvtMKCSnTSdDgvTR86ynt1WPvbW+JfNiyV8VP
	 mis/GC6wgWeZ/lO2BAS/zzX5ZqfrlenbHN/obuZw6itoYahnffbxoAqWRbOaFaedVW
	 Zg39B7ZbpBm4QEmo+2Hxay1FH9cvJ+y0mCTLd3r4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 675D2F80495;
	Fri, 20 Jan 2023 16:30:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F4DDF8026D; Fri, 20 Jan 2023 16:30:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3DE6F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 16:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3DE6F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vEo7y196
Received: by mail-wr1-x433.google.com with SMTP id r2so5171353wrv.7
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=xuVxCSRKQLNd9GgHEZgvIYxMnKDSeW8InDAdMgr5zKo=;
 b=vEo7y196UmHH2AcUarKpqDKid/Y8IQovAOBy70QKBeuru3MA4/Lrq4W1ZIlPjMWBbx
 JzVNe4vLkufAmIAjnyjlQm0480nLGW74Rrowz9XFXsRblQ9qCf1I7ajzzT4tZqekoUiX
 najS9Zl1WiXcAcd5CX7q4BqxqdSIENheyiSm8mfn+W4n+JEfOAZiyUJsr9PTtaTFdUpj
 +QcU0ooNWCeS1F2aZRf2v9s++sj1SniItwkRCO7vPfRaLg8X0N5320l4UQAIvYdkvd9J
 W0x3GKtRdBJ6krbIKaUmuJXebzcLT38LU1/0jYUMzbz6hd3WFYZM6n8PRchDJrxzZjAk
 VAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xuVxCSRKQLNd9GgHEZgvIYxMnKDSeW8InDAdMgr5zKo=;
 b=bXhGOfDBFJc5o43KkPf3Ri411vqPW8gpLoEjXQc08aDyid1DKX6Egh0HevN99fPTA5
 bJy5TOOzbjCPsNdOOLd8tUpi0xKhTpjwcV2gBmRdCtDm60hfd5517wxrxW0wbynIRN7Q
 60NTnCpCfldWdR8HO7XaSRcTGYWEdH6k0MALw6v9bliG4f+b/uEcKRaHY2PoyAnwdexM
 KqPZjM1xqTLzuRogTUlJv371ZJMBMi+RB6o5PA0pYJZrN9IHlX3EvGqTR3Y1IL2X3Evk
 WNKv3/tWOoIqYqkXPzfPkU5FEn2+2XzGorNHn/48bcnb5dp1kNRyMGMefO9Qmr9j2YhO
 SVJA==
X-Gm-Message-State: AFqh2ko+5Y1xM6Jioi+FD2KELeP9km4mDO63ykwWuN0GzAzjOnr4VO0v
 d1rWbn/pCdt0E5Z9yexDbeHrCw==
X-Google-Smtp-Source: AMrXdXuDedGGPCSe3AnMnFgzhlNaMnZo41l2cd67+nrDKJOM0Ns+kQBgKLcaTxjfW8Fmj1xQCQz/Uw==
X-Received: by 2002:a5d:6a4f:0:b0:2be:596a:2029 with SMTP id
 t15-20020a5d6a4f000000b002be596a2029mr2694330wrw.29.1674228624063; 
 Fri, 20 Jan 2023 07:30:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 w5-20020adfcd05000000b002bdc914a139sm27656470wrm.108.2023.01.20.07.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:30:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: samsung,
 odroid: correct codec DAI phandles
Date: Fri, 20 Jan 2023 16:30:19 +0100
Message-Id: <20230120153020.320270-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The order of codec DAI phandles is reversed - first comes HDMI (always
present) and then codec (physically not present on Odroid XU4).

Fixes: 97709d365bbd ("ASoC: dt-bindings: Centralize the 'sound-dai' definition")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/samsung,odroid.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
index 7b4e08ddef6a..7774543b8819 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -43,9 +43,10 @@ properties:
     type: object
     properties:
       sound-dai:
+        minItems: 1
         items:
-          - description: phandle of the MAX98090 CODEC
           - description: phandle of the HDMI IP block node
+          - description: phandle of the MAX98090 CODEC
 
   samsung,audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.34.1

