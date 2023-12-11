Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8280C9EB
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 13:33:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B1DDFA;
	Mon, 11 Dec 2023 13:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B1DDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702298014;
	bh=cEc/cgXCUI4jOpC/9ra+aM6JfVp5LWaqbjKdfSGSh5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o14CATA1HOlHqR8VSJkNauilk2Oj8qqXKQIFcKFnAValhty9t1sMyVn+3+dD8hiGx
	 LLI+SiRmKVEh0sciS7a/5jbS/seboHSBL3ri+bTzjt0jOPaChsckdw4s0nMMLfjIzg
	 BZ7ThEQtN1//Nr02YfhL7l+9h4LFFRDug4JPAqKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8231CF8020D; Mon, 11 Dec 2023 13:32:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C93F80608;
	Mon, 11 Dec 2023 13:32:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9853F80124; Mon, 11 Dec 2023 13:31:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CCA2F80166
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 13:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CCA2F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=j7juCA/q
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c2a444311so42789525e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 04:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702297874; x=1702902674;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcGVygFqpR8Db5zL41FG9Nnjti+dXKsBMHzFUY86aEI=;
        b=j7juCA/qsiByzWwhbVee/XPQJH2QKSc/fEZOSj/ecgs93daPAK34uCxgTtsUQ1cNtm
         qcY2f7m59CViQPFefTGNx/WS3TrjcL1ky1LjoB0cKWqs+0OrdrZOyX8XVYU1G37a04rp
         NxY6UBBfuZ6nSkgH6PnubB4xJL6Q+6qB5tr082sBiAtPyXOBtnGA3+ehJzs6Rs5l/aAg
         BxpdesdIIRdfYyQJ24KH+glTvOjR5V8gau4OnUW1821kaEfysCj+qyMNhhpqsSx8Q6of
         vPa1wT3UYvaEINNJrc6CgCwxeNK5Y5N/wBLBLdp6aNv16GzWyqdXbfJbimHZFuZLk0EQ
         aXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702297874; x=1702902674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcGVygFqpR8Db5zL41FG9Nnjti+dXKsBMHzFUY86aEI=;
        b=MTsp45DGe7sqCq25f2v+jGYKc77RgJSwaUGf1ZUHKdJLzlM6fha3dwe7kSYL2+eMWT
         Ojdmk+iZrNvcpfy2XBshfV2sWqkRcSgNkBV2iu2vw4pAn2mNKm4ZhsqpSK6NwzWil5xA
         KY0m7fSlNbAVdL5TzuwCQZFgNLi0eNSP3sh05jVbg7WAWq9JKmnjkeM2cQ5nbPdxtSpO
         SSb2O0imGvcY7huOL+O0lBvdonTlcMxolynRP58uHc2OkdtHFqQ56RiPqEFG3ch4ptIp
         zPFdMxFy1LuYN6jnSjxpxDzu27vrtkDnn5dYxQTD0KgtBUBXL9RB7W1odNyXtqBqapiP
         pTlA==
X-Gm-Message-State: AOJu0YzXv1r6osgy/Rllej153u9G7TqKAINkWVFLyV+qlr2Ouiyu2vnA
	Gjaw5KQvuEBsnxVBWf6PPruE4Q==
X-Google-Smtp-Source: 
 AGHT+IEgRmUvqRfWL2mgGWOrAr42GAbQoTNF3qLYb8HpdTObG+vmkW4PZV39SZlVRZ5xK8rpQ42IqQ==
X-Received: by 2002:a7b:c456:0:b0:40c:2c0e:3196 with SMTP id
 l22-20020a7bc456000000b0040c2c0e3196mr1221840wmi.19.1702297874408;
        Mon, 11 Dec 2023 04:31:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id
 s5-20020a05600c384500b0040b632f31d2sm12932313wmr.5.2023.12.11.04.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:31:14 -0800 (PST)
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
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS WSA
Date: Mon, 11 Dec 2023 13:31:04 +0100
Message-Id: <20231211123104.72963-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WZ7TF47Y6BWUXCDEDO6V25SVRJQN6YSQ
X-Message-ID-Hash: WZ7TF47Y6BWUXCDEDO6V25SVRJQN6YSQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZ7TF47Y6BWUXCDEDO6V25SVRJQN6YSQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
WSA macro codec, which looks like compatible with earlier SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 5fb39d35c8ec..06b5f7be3608 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -19,7 +19,9 @@ properties:
           - qcom,sm8550-lpass-wsa-macro
           - qcom,sc8280xp-lpass-wsa-macro
       - items:
-          - const: qcom,sm8650-lpass-wsa-macro
+          - enum:
+              - qcom,sm8650-lpass-wsa-macro
+              - qcom,x1e80100-lpass-wsa-macro
           - const: qcom,sm8550-lpass-wsa-macro
 
   reg:
-- 
2.34.1

