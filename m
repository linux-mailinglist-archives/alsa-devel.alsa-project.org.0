Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5075E7E2B99
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 19:05:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6B0210;
	Mon,  6 Nov 2023 19:04:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6B0210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699293947;
	bh=53PN654TFATQmp+r09Pwtlyv6u3z7Sn7QusmkOtyZBg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K6GrH56J6MoWvwRlzK6mNjrAYJYP/PGCPewVVbbR7UCiVufQtZuIEwNOQtD9RU4Qj
	 XJMb3UlyO8rXDTOgJYjcF5+Aa+v30Ul5WAwe/BRStjqUPPHy4lJ7t0/CI4mvxfaGf0
	 PlXexpt7OIvG5t9W40qr++lAb38eTLtEB7ZAHA3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AE72F80169; Mon,  6 Nov 2023 19:04:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB009F80169;
	Mon,  6 Nov 2023 19:04:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F3E0F8016D; Mon,  6 Nov 2023 19:04:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED259F80125
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 19:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED259F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YgRV+O5t
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso741654866b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 06 Nov 2023 10:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699293866; x=1699898666;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFwbWDLUdsWWY4JdKUSpXKXnctZdyDOvhR+9uQhZNK4=;
        b=YgRV+O5tX0aIEeanIvVpBFXAEeDK1jKv/jO07aWpMg+f4Othx92p1zcXweISijSuXC
         agzjtYQ8nEWTcND1NvPe277pVwxf97IJMatrwqWYZHPHfgj1Sq+J8q9u9ffzEnry0BQD
         8P4iP89css5bzfmGPF4idnyNTwQuSz8Pk6XiOSRYbUR/QN0RWLiNRRAeCxQumDUrPJ2D
         qD7AwCZ2ELR/xly5fuh4sSybCGUIFR/4pI+u54lcPJeofP4M13O7/m4iO/CUmp4Erl9s
         ZTGfnTvDEGwrjQ21RzvplV76wrkAd0Eqc6LhkCYjdWTI//08VPuGTqH+Ppbc20OICbmz
         ZlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699293866; x=1699898666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFwbWDLUdsWWY4JdKUSpXKXnctZdyDOvhR+9uQhZNK4=;
        b=WZJOPZ34cueWsJyoRxrTi7/TbtvmvrQ7kBq0AjM6NFeVrJtitFt12J2NwTwhb1gGjA
         4TiZTbCye59jQdIOyFCPjkcVnspC0AHOLgwPegSx5RhMwl+G5RxIgSLGmoaElzI7s20M
         JjFXAbO4n/TjdqapYnRMxGy19zbbYIka43wI1syXgSXh/fRcO8EwKWJdRbhO+nZ/eVqX
         APtUivYkPlnGQCKw0XE7QyohOpCrgVOpt5Vs7JUxhntYxsNuvAsh61rdPayf5iQWx0vf
         dp3PPYdKbMl3xykOR6eEowC4Hv73MECZ3H/fK2hJjRxYA3nBGKGsXJ7GVjzxxvjPVQqS
         0c+w==
X-Gm-Message-State: AOJu0Yx57iSljmiTA+3I6/NDNKkJZrucmVUQpd2d9LlOY/LbyT1kXUnF
	XuXUWfLvDq/hnCzlo840tt3vgQ==
X-Google-Smtp-Source: 
 AGHT+IHr8bnuWZj/iOFtunRgfK7Wwa+dsby/zXewBm5diZrFmq94VJef1rIQkqwg9lkIuEsT0/wTeg==
X-Received: by 2002:a17:907:7e84:b0:9dd:cc3d:7ba7 with SMTP id
 qb4-20020a1709077e8400b009ddcc3d7ba7mr6962413ejc.29.1699293866528;
        Mon, 06 Nov 2023 10:04:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a17090617cb00b009920e9a3a73sm92962eje.115.2023.11.06.10.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:04:25 -0800 (PST)
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
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: qcom,sm8250: add SM8550 sound card
Date: Mon,  6 Nov 2023 19:04:22 +0100
Message-Id: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UPBMRK6C532ZAR7YPZI6ORYDUPDIQ6NV
X-Message-ID-Hash: UPBMRK6C532ZAR7YPZI6ORYDUPDIQ6NV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPBMRK6C532ZAR7YPZI6ORYDUPDIQ6NV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sound card for SM8550, which as of now looks fully compatible with
SM8450.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 262de7a60a73..88904ac4aa77 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -21,6 +21,10 @@ properties:
               - lenovo,yoga-c630-sndcard
               - qcom,db845c-sndcard
           - const: qcom,sdm845-sndcard
+      - items:
+          - enum:
+              - qcom,sm8550-sndcard
+          - const: qcom,sm8450-sndcard
       - enum:
           - qcom,apq8016-sbc-sndcard
           - qcom,msm8916-qdsp6-sndcard
-- 
2.34.1

