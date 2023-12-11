Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFD680C9E7
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 13:33:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0F5A4B;
	Mon, 11 Dec 2023 13:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0F5A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702297988;
	bh=kR9GEwdi/SPM7s4AAo0p9bC5loFAYUN4wod2qakPgFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TJYdVuzWF0cZ7KZfHaQr3+uErShB/RrtiPEN8II0exsL6iNQa8h2BarDriqAennIi
	 U84D1BXXPlrslxnBBzsuSfR3J6KyY6oF7D2dTAeP2MaBQJAnWkUQWdzaiACizdRnEk
	 e/sOexbqsyY1SzAg78k8K4vTNo1geM7O5MHSfmEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1893FF805BE; Mon, 11 Dec 2023 13:32:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72960F80570;
	Mon, 11 Dec 2023 13:32:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00A98F8020D; Mon, 11 Dec 2023 13:31:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6464F80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 13:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6464F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eMgA9dCH
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c0fc1cf3dso46376775e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 04:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702297871; x=1702902671;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN91HNt5gkaIzgOq9vwezVCDXB7gy5tWKyJ+X5HCihA=;
        b=eMgA9dCH2HF7cnJm6fjytK8wWCY0JPnpVeShFmayQtxxojicQn8iochbCTItIDQrrB
         rxqO3CQNZxgYNu/wVKYIewFozRpqTemAOc3ZDzuM6jHb2vxAcJJ78uFKVxmZKnZCK+wi
         cJdzxLl5qttuAUBTqgRpz8MvnEjr08Tgi4s4nUVHMFjRgwb32BRc5sn6nc8jBGN8o+j6
         idya2Q/asBL0kBdZUuRgeSTH+HSjvNmqu/LJ5nnPvsAR2wFqpb9i3jihoStP2Q5PbKva
         aUTBcCjw4ZzRxh8d2Qfk+wWlQ/k9ewawJSebHnCnDvcqEEx0SCTiGhBl9lrr0fDrXfy6
         m7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702297871; x=1702902671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RN91HNt5gkaIzgOq9vwezVCDXB7gy5tWKyJ+X5HCihA=;
        b=ZK364sviPfjpRI+txf9TeIJk06ei+ejabGTuES30xVQlTLM/UjaUkIVaoP23DaIm3X
         675s33+6lM+TPGPPy4w4sG1fTVjAC9lMcjJ8DLVDQcUrnpJvUp/tzp/YhwkMvBmJDDl4
         EErR2pnyRkMHusz+slRqw+YD2wo/4rJZvmhmUaTaUfWL0ZqtxZiDzkufLBh5CdDybkmD
         hpgMsKMwLZ/LhASaeYCQeablUXzBbEnp+iU8THHqsBUpdyolLXl3Jvs6uajRWfA4h4pa
         //OhU0bybXK8c+3CkbZDbYOiNuXP0HGZlfENoj8vjJJaQN7LhAY7fBDbXf6ej9NcU7gu
         qvYw==
X-Gm-Message-State: AOJu0YxAAv1/TlJHDBwJSm275fKxDcQ6EGDPxk5TZmnuEDBbMExGYa9k
	xY5qOOe30dhwKTmLAVaOtzz2+w==
X-Google-Smtp-Source: 
 AGHT+IGe0TsF6kU3cIp8ndlWh7qt+klx3I1j7J1zNAl229HSG1N5Cw5CH8QU9alImW7ATLvT821E1g==
X-Received: by 2002:a7b:c389:0:b0:40c:3820:f004 with SMTP id
 s9-20020a7bc389000000b0040c3820f004mr2353363wmj.132.1702297870759;
        Mon, 11 Dec 2023 04:31:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id
 s5-20020a05600c384500b0040b632f31d2sm12932313wmr.5.2023.12.11.04.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:31:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS TX
Date: Mon, 11 Dec 2023 13:31:02 +0100
Message-Id: <20231211123104.72963-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HIM3S2HHOS4XPGB7J4ANVUDB7WQPIMNM
X-Message-ID-Hash: HIM3S2HHOS4XPGB7J4ANVUDB7WQPIMNM
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HIM3S2HHOS4XPGB7J4ANVUDB7WQPIMNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
TX macro codec, which looks like compatible with earlier SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index cee79ac42a33..3e2ae16c6aba 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -20,7 +20,9 @@ properties:
           - qcom,sm8550-lpass-tx-macro
           - qcom,sc8280xp-lpass-tx-macro
       - items:
-          - const: qcom,sm8650-lpass-tx-macro
+          - enum:
+              - qcom,sm8650-lpass-tx-macro
+              - qcom,x1e80100-lpass-tx-macro
           - const: qcom,sm8550-lpass-tx-macro
 
   reg:
-- 
2.34.1

