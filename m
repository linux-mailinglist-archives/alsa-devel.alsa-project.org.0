Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AEC80C9E8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 13:33:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D261AE8;
	Mon, 11 Dec 2023 13:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D261AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702297989;
	bh=1Sk3Q2kWGMhw9SM2lWIJmBr+syVMAT/8uO5KWscrPTw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fj4+F7vy/8lcn444bQdrZH99inHMgW4nXL0K3COpg82qwxnRuiFLK0RXtO7sHk0sK
	 2wtA6MNpgZbZI7BcIQxd7hTM3JyC4RPyKxE0j+RaO3ws4MEqAiJ8cTTfiJMAAWAiIx
	 JOWq1a4r1diYpD8lrbmk7iWgXrLgTKIQcVvYfZKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54967F805DA; Mon, 11 Dec 2023 13:32:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 116F2F8057D;
	Mon, 11 Dec 2023 13:32:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44089F8016E; Mon, 11 Dec 2023 13:31:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D32BF8001F
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 13:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D32BF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=M1DT+SZe
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c2d50bfbfso19862075e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 04:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702297869; x=1702902669;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VOobDHbYbVICzHx4WCyFbYqB5rRjPFGXbV0nxhsk/8I=;
        b=M1DT+SZe7Yix0kGrwrmgl3OkgNIt8v+3N+QDS9i8Jv07lrjcTgKZbHS6hsgZy8DBf6
         2aXkGbz9uWPkw2TEB87+DJjgAFxFQ77P48ZoNLEoNYwC6iBnEpS4zlRleQv4/kdJdeKR
         WsivyTsdaKeDbvDwSeHO7ehA91ig1JhTxsD92X+k4EAaxjA5OOXWMHfwLekw9yr1Uxrl
         v9xhqJRP8eOe189eQAGj4f8whHK5ci3Trps0yYROiXLJTp5D1F4FsM69nKM4DRVZACSW
         4hgXvejlzpuOgwJeUYPCP8Dxgs4Z1mTFOWryZqiV6BmS8ztgFVYBa/RUvZp2cnpOWOmW
         RIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702297869; x=1702902669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOobDHbYbVICzHx4WCyFbYqB5rRjPFGXbV0nxhsk/8I=;
        b=iqDtkHEbxse6d2C/7GnrW6DjWuEi13U9XkEF88nj7KXonU99CwvYZybNkAAm+cg4Gw
         0IyhdC1iTTJuybF7Se/2d6HiLQ4SWlUqjBKjyaSGfFuxzgFYOO1nt/StxoPR4l2vq1dg
         /lp790MoYcRUV2l2s7yIJqY7CrF6WBxLH9ijK4fgfO7/ZRwRvEdrkkncvvZ6b5CcTdhr
         r/dpLjOABbW1+SgvN4E3j6niaQ766HbU9tiUP0V6Z6ycfpvgMhTDTwvvwtPLZfsadTPh
         ydIQ4KQYESm43e2eiSGf3Yji7YbaBt+AZE0XfslRmbA3nDRRjdk3yVJphzyitLXiHu5G
         A2Xg==
X-Gm-Message-State: AOJu0YxIPhFc2Rk21k7+sZ0cKgkNdupaezGF4WSS1qVfUixgmuCUIUH2
	Vya37O8hPWB9RJ9mkjHp93kAlw==
X-Google-Smtp-Source: 
 AGHT+IGRxkN6z/jb6t8VFhbLYKIQhgJmBNUTIAsiGZuBWuWXZWBx6PeaFMH3wkcyTYMkokuRlfngOw==
X-Received: by 2002:a05:600c:1503:b0:40c:2c5f:5887 with SMTP id
 b3-20020a05600c150300b0040c2c5f5887mr1997537wmg.22.1702297868774;
        Mon, 11 Dec 2023 04:31:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id
 s5-20020a05600c384500b0040b632f31d2sm12932313wmr.5.2023.12.11.04.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:31:08 -0800 (PST)
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
Subject: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS RX
Date: Mon, 11 Dec 2023 13:31:01 +0100
Message-Id: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X4Q4Y7GYE3MVPC6QUXOEJ6MFS6LBFQWE
X-Message-ID-Hash: X4Q4Y7GYE3MVPC6QUXOEJ6MFS6LBFQWE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4Q4Y7GYE3MVPC6QUXOEJ6MFS6LBFQWE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
RX macro codec, which looks like compatible with earlier SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index cbc36646100f..b8540b30741e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -19,7 +19,9 @@ properties:
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
       - items:
-          - const: qcom,sm8650-lpass-rx-macro
+          - enum:
+              - qcom,sm8650-lpass-rx-macro
+              - qcom,x1e80100-lpass-rx-macro
           - const: qcom,sm8550-lpass-rx-macro
 
   reg:
-- 
2.34.1

