Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3874011C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FEBE83A;
	Tue, 27 Jun 2023 18:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FEBE83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687883267;
	bh=vuI+abY7emKvxqxwg2J7Vf5U+QSl3xD3cylxKBp47QM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nu7dbofNOTu9ttQFk+KUPt7Fj43BZrQNMFpK3eIGwL8HFzexFjR2yXdIjwU2mHGKb
	 yeMSDC9uL1f3LRTmbimrW1lrzqulfEkRscwKHED3EQhKrSViRjpFJPS9EbNi/wWLtU
	 7p9u966UDojQXNw2E9chJ5s/E4Bj4muaLKLh6L+s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B8CAF805C8; Tue, 27 Jun 2023 18:25:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9653DF805BB;
	Tue, 27 Jun 2023 18:25:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AAE2F805BD; Tue, 27 Jun 2023 18:25:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9530EF8057B
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9530EF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IoddTkfO
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f957a45b10so6392012e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883097; x=1690475097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSIrkDXpbBJJF79TNwbHEzUtRhMGVG0zQuOGkk3fmhI=;
        b=IoddTkfO5tyJTW4sBdG96yKju/2zkdaz8Ih6r1OgbZyFYIGnFb9FgdojUCQbNDpsC2
         CSDG1Y9IvFn0LGAkBT/zzvqbcU6oi0jFv3gJWgTtUrZ9OtczoQWBftZWtafS0go4jEhe
         uTdrSVkI5P2pU8jdHjBaNe7LbovRankNV5OBrCNbN8bts3hxbXbCCted9KSZ4btQFE4Z
         QxmC96DVoK0JJ2+wcl0s76bxFn6GyhL5tFD4rQsq+Nj+zPK4kMs/6lDlUINp9JGbJNqo
         cBhatXQ00E1GUSGawoBVzZCeOV0Ubb0Aa5ewYLXSP4z+8f7pPOhaKvSXo5RYGAjInEmp
         d2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883097; x=1690475097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSIrkDXpbBJJF79TNwbHEzUtRhMGVG0zQuOGkk3fmhI=;
        b=Y36JZbzcyozktI0qX1VZ8V3dEeQpSYydEZOf7AUl4imT2Hvu1k1aMJDn+bCIpXcwKM
         pwoWIcZ4ezAIHHxIt9oemDXANIBLA6b7CLFYagEYKwX7tYd6+rqpjHUv38kA2f6CQWrP
         66qeaf1LqCTEt/a/imR/DAyc/Qfz0UqtXlhgjVPFT73xbREq2PPKItKP5G52vsEI26hr
         5LM3vtnw5onYiVAIH+gI4hDtfOhjqOsPOzechqzpWKik2WbMGnjU5l/obFXe0ivN7dyV
         9At3RoJg0YUEkIJRy+0ybggUPBZWxz77JAx26SJyJlFUbBJj9rQlAx4Jf89eo7MYuX36
         B4kw==
X-Gm-Message-State: AC+VfDzalCtNPpoG5xuSfYlfUlVnA3VTpVIKKKVoIJhYoibTFH01QMeh
	ivRYnsfkQ5Oun9jj4YyEdevqrg==
X-Google-Smtp-Source: 
 ACHHUZ4r9irVoENkd8byj3320r8JiIAdEQ/lABEZXknA2fxdO6BKPyPCZg1djvkW496qNULbkbBgNA==
X-Received: by 2002:a19:915d:0:b0:4fb:8aeb:d9be with SMTP id
 y29-20020a19915d000000b004fb8aebd9bemr731320lfj.30.1687883097444;
        Tue, 27 Jun 2023 09:24:57 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a19ac07000000b004fb259a5589sm1190508lfc.104.2023.06.27.09.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:24:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 27 Jun 2023 18:24:24 +0200
Subject: [PATCH 08/11] dt-bindings: usb: ci-hdrc-usb2: Fix handling pinctrl
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-topic-more_bindings-v1-8-6b4b6cd081e5@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
To: cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Benjamin Li <benl@squareup.com>, James Willcox <jwillcox@squareup.com>,
 Joseph Gates <jgates@squareup.com>, Stephan Gerhold <stephan@gerhold.net>,
 Zac Crosby <zac@squareup.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Jun Nie <jun.nie@linaro.org>,
 Max Chen <mchen@squareup.com>, Shawn Guo <shawn.guo@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, alsa-devel@alsa-project.org,
 iommu@lists.linux.dev, linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
 Andy Gross <andy.gross@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687883074; l=1843;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=vuI+abY7emKvxqxwg2J7Vf5U+QSl3xD3cylxKBp47QM=;
 b=cA//QEaEi/GzH/ZTEpwNhEiym+hD656nG3IixPCS0Yi7t2cIiwxXA4DNzeydmsOVFuKJMXujb
 YnsymIapOVCBidELFNlYPj1ztQ+aNTLBST/+567mWks3T4NqajGgjOd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: FTRBZMLLXE5TUXLQ55U6G5UAXKPLUYF2
X-Message-ID-Hash: FTRBZMLLXE5TUXLQ55U6G5UAXKPLUYF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTRBZMLLXE5TUXLQ55U6G5UAXKPLUYF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Untangle the bit messy oneOf trees and add the missing pinctrl-2 mention
to handle the different pinctrl combinations.

Fixes: 4c8375d35f72 ("dt-bindings: usb: ci-hdrc-usb2: convert to DT schema format")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 27 ++++++----------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 782402800d4a..24431a7adf3e 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -199,17 +199,6 @@ properties:
       In case of HSIC-mode, "idle" and "active" pin modes are mandatory.
       In this case, the "idle" state needs to pull down the data and
       strobe pin and the "active" state needs to pull up the strobe pin.
-    oneOf:
-      - items:
-          - const: idle
-          - const: active
-      - items:
-          - const: default
-          - enum:
-              - host
-              - device
-      - items:
-          - const: default
 
   pinctrl-0:
     maxItems: 1
@@ -357,17 +346,15 @@ allOf:
             - const: active
     else:
       properties:
+        pinctrl-2:
+          maxItems: 1
+
         pinctrl-names:
           minItems: 1
-          maxItems: 2
-          oneOf:
-            - items:
-                - const: default
-                - enum:
-                    - host
-                    - device
-            - items:
-                - const: default
+          items:
+            - const: default
+            - const: host
+            - const: device
   - if:
       properties:
         compatible:

-- 
2.41.0

