Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE768ECA7
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:18:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4AC8E85;
	Wed,  8 Feb 2023 11:17:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4AC8E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675851511;
	bh=MWXccWTzbOmpFsf9xppUHaHKx15SfVhSJ1GmnPvEIE4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SBH/IcZkSVPK4s77VyFcsENolSF+gSGFqMn7E+5YVti++lpkJmb9LF1ldv1Ooa/Xz
	 ce33Yw4IKAgr4QBmQHcKcTcdqsNWLUwEfSLEuDadUjtAVB0myX3j3IjIT/kC5jBLMb
	 C5JU/bAelO+qyOt7/tu85JperSFwT/166OmlwaM0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17ED3F80544;
	Wed,  8 Feb 2023 11:16:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16FD3F8051E; Wed,  8 Feb 2023 11:16:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D94AAF8012B
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:15:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D94AAF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gA3+N5HC
Received: by mail-wm1-x32b.google.com with SMTP id n13so12949132wmr.4
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 02:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49xfQXijB76l60qaT7Z6y5pL81SUu0qI+8WlIubqbjg=;
        b=gA3+N5HCQCDSfTWCK2lAx7KSNX5Hgzhutg1Rt0iIsmzBXjmyOwn5ijz0CFXd6Dbhsk
         skuHIVhtJGMwbMbJUdnOXu2NxvJd/+yvOsCXIaKvRGyxVnn6Xs2NtiwKrVvuEwJM0kCS
         5Txpn44mlT2mdIgjoeVS2iD21KzP8Pqb+/9dEgyg9NCsvkd+LdUZgblIPZ/GeF0X9mXt
         7Fqf/Fswa21N+/CSvMtXNleg3DXzEkYVHzI0ecwz0Kx20UAHQZzjU136DQMu52SwLv6q
         LQbF9BN7SVS1E0m47zABYoNrlbHlRWRVZirrXA5ewXHXYzMtLlSZPh9ZIeq8ADMsGQLi
         o8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49xfQXijB76l60qaT7Z6y5pL81SUu0qI+8WlIubqbjg=;
        b=iAlo862p2Dea6cIZ9URGWPOnZpL18u5xIu/8CqozZwr0E6nKNB5VfYwnPDRN2rzyLY
         kHUk9MG77pMwLFStem3MoKbUsI4eSSj+ReErnc3BTvjWPfcIJBYoWuYjrZMEKcNh0GHp
         CwUystoHS0wnsGW82rNNGlkiQ+EH+EYOmAYeLBHqWqw3SsLYpRR40paL0yUWu2/hRrRg
         Bbp6/eagL7lp0l3x2pLzBNPoTzkQTajJpy9XTUx3gO0NP4G20zTzbVz6wg/XppMDv9Ry
         dm9Zl1/Ao8U5iSOgDeynRnC2ulqOvg6TA5T9P7YBBAdCRtCWyRFued03OrXm1tHEMx2J
         Ga7Q==
X-Gm-Message-State: AO0yUKXObkiq8CGH2ToYo6w8RfHjVxST4h6RgdmbA8EmUbVtjBoFf7E1
	5N2ZCYuYkgPSWgDXv629wfRQoQ==
X-Google-Smtp-Source: 
 AK7set8+a67vFQhEsNOGq72ebMc7Hy74DAStJ4dxQG5w7ZrdDobR6OOZ8N1+Q5kFi4stZWp5ErdDkQ==
X-Received: by 2002:a05:600c:1604:b0:3d2:3be4:2d9a with SMTP id
 m4-20020a05600c160400b003d23be42d9amr6073107wmn.20.1675851357957;
        Wed, 08 Feb 2023 02:15:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 5/7] dt-bindings: soc: qcom,apr: correct qcom,intents type
Date: Wed,  8 Feb 2023 11:15:43 +0100
Message-Id: <20230208101545.45711-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 36PUS7TA5PWUQUIAERU4RBQYO5NCK3QF
X-Message-ID-Hash: 36PUS7TA5PWUQUIAERU4RBQYO5NCK3QF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36PUS7TA5PWUQUIAERU4RBQYO5NCK3QF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The qcom,intents property is a list of pairs, thus it should be defined
as uint32-matrix.

Fixes: b2d7616e13c4 ("dt-bindings: soc: qcom: apr: add missing properties")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 6026c21736d8..4502458b0669 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -62,7 +62,14 @@ properties:
     maxItems: 1
 
   qcom,intents:
-    $ref: /schemas/types.yaml#/definitions/uint32-array
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 32
+    items:
+      items:
+        - description: size of each intent to preallocate
+        - description: amount of intents to preallocate
+          minimum: 1
     description:
       List of (size, amount) pairs describing what intents should be
       preallocated for this virtual channel. This can be used to tweak the
-- 
2.34.1

