Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9E6656CE5
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 17:32:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 764CC76CB;
	Tue, 27 Dec 2022 17:31:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 764CC76CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672158767;
	bh=f4F+9NXJCNOIJBjpzag9GNzrE1dAeOY15HTPb+Cz28w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=O/SxleZkvmXnjeHsKr+qclvZfHoav3UgpY4WVmhdYj4w+N/UTAu9ASZpY0b3Lx1sj
	 0VNuADmzck5d8RwaNbUe4OYRJx5Re5/eX8VO6/Q0FsKvPHrOhFoF30BVAui83ZXN4i
	 sbG+e+ddZankPRcgqKWJMS3TOP9sq3in7myTf/0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA45F8023B;
	Tue, 27 Dec 2022 17:31:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3406BF804E7; Tue, 27 Dec 2022 17:31:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C49FFF800F0
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 17:31:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C49FFF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lYv3qXlJ
Received: by mail-lf1-x133.google.com with SMTP id bq39so12467961lfb.0
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 08:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lyoX12mwMevw/GvkSfOGH+b2RZglwpZdjU1H0BRrPvA=;
 b=lYv3qXlJQd5TErBapx2gr0arJ30auBkHwnrHBURc6jJJIAQfMKbJgpUxgD4xW4BDeD
 fEiX4AYxUcrt8Za5ln7eSERt1vuERBBGSqGik6HErKD2YF4jqdy1kZIHKt/qnrW0lWEi
 j1qdbpRdTppHfuefBO1jh4y/3OO6Z78d+UCoWf3loFcPPDZYePKlRB4lXnZBPd2ww6va
 vpbNSqH6EARnKq4bzQn/2tEHwkvRU9FAf3JcxSZS1IjdqFrIltBypydS7/YDJEuF5+RK
 bI2/yJXCU+Pa3VRoOZuftDuC3yTw989ISotswVm5aEMlOlPD+GiZ8pztYYNcpJLNZ2KN
 XGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lyoX12mwMevw/GvkSfOGH+b2RZglwpZdjU1H0BRrPvA=;
 b=JjnjXcaFRZf7Bzojez7OGUIXr5xjsk98ZjJ8U2lOdAwlFLAF5LOS27ALp/y6qx/3vq
 U2sFFzceNc4hbupg8Q5hho8Icmu7rg34K1ZY9urtNmBagXCGTs/34XaRgtRZ/SBDmsWW
 p2McSFpXS3r6f0bDfGCJrAjpRMsudQuueDnJFxRUdukhhotANNTWXOGVw6ylkLEVA/1g
 rr7TCllfHTSWxeoh8vMBcmp9lQ5kf2FyEZc6K/bN6hgififWKuB2Ep1EzvLxXP/w/nUJ
 roj9HQwCCh4ww54OV7qE7QRdrHOBWQPQhqnR4lIwGkSUlXYT9u2egTtTVUPThej7L52S
 SHpA==
X-Gm-Message-State: AFqh2kqD7hloLb9na2GDTNvQzR8pxto5O0M8s6uVzGG/QZJUD74HPl+3
 eO8b0qZkMAV/G0oZ4/QZhJDdPw==
X-Google-Smtp-Source: AMrXdXsoXisr+b5apbAKUCZViYp6vaNIxWI+lRrZbA7Gh0SVf4k14JHySm36TYX+GLwajUW2DSNaPw==
X-Received: by 2002:a05:6512:2821:b0:4b0:1305:6e02 with SMTP id
 cf33-20020a056512282100b004b013056e02mr7010836lfb.8.1672158698492; 
 Tue, 27 Dec 2022 08:31:38 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a056512348900b004a46a9cebe2sm2318019lfr.289.2022.12.27.08.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 08:31:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: dt-bindings: qcom, lpass-cpu: Document required-opps
Date: Tue, 27 Dec 2022 17:31:33 +0100
Message-Id: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SC7280 LPASS CPU device node comes with required-opps:

  sc7280-herobrine-crd.dtb: audio@3987000: Unevaluated properties are not allowed ('required-opps' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index bb42220916b3..f00fc1051d4d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -65,6 +65,9 @@ properties:
   power-domain-names:
     maxItems: 1
 
+  required-opps:
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 1
 
-- 
2.34.1

