Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EFB63F1CB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 14:37:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9875E16E5;
	Thu,  1 Dec 2022 14:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9875E16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669901866;
	bh=jkKH0zKxtvPkOiFyx6rlRNavemjJohBqKlY8Y93Elgw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mjMtF0xr1Bn7+FO0Uxe6Mz0h42dLJemT86dIJWBTMscA1FTnkx8fBY+hPnmZ2MloV
	 2UuG2w6IzevHiBKElXxCD43B1aj5a51tvKVo3IEm0/2IV+VhrHXmKIOK4XLPxocwJN
	 SQAhQpYNb5fm06srIrRPM4yiSNw4Vy2lYpsmrBrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FF21F80116;
	Thu,  1 Dec 2022 14:36:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC96FF8028D; Thu,  1 Dec 2022 14:36:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90D15F80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 14:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90D15F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SHrlDQdE"
Received: by mail-lj1-x233.google.com with SMTP id b9so1897136ljr.5
 for <alsa-devel@alsa-project.org>; Thu, 01 Dec 2022 05:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EPqBNbI09YU2LloFC0dcS/pG8X7Q2MR4/7GlUmzvCcQ=;
 b=SHrlDQdE0KI2hz/+YPtMuVfc61pA79BaYszXXuNDdiNYHbd9jCYtty9SlGOP7E8MmM
 4jT55q8S5zsmQPNenf4iML9wCTTx8/itvlLyVkIg+lIrD4JBx2ohQNyJ3b0G4WiKwNvs
 Kzf7fzYT9RWmR345o9X/LbxWFFkPwkfiSV87Wod55JrXzSv0u+mkOPmyjYeKgZqnrPNw
 UQp/9ozmCjaSUHVIx3/sFwudkuXQLZY8o2Zbcso2x/nW3kyAYS4FViowfh34Y+AXKvOz
 bzmsPLvIpr4c4x+qekLldEfXspx5pduU+lw+pNwqWwZ1Dw1UrXyn/5xVt3ta164iiNns
 JdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EPqBNbI09YU2LloFC0dcS/pG8X7Q2MR4/7GlUmzvCcQ=;
 b=E+WwHQD4fpVHJrgy0l4LvumovSp4FkGCN6adZzk2U9KCLG6TAmB8qsuysUEWBHO4+5
 QonswGeyjYYmGuxRE0t6kZDHcdpmJdcBum6IzK+j7ZNaMsVfjSbURwttBmbIZnAKLEci
 Yts0XrcsWQ3to0cF1veq7y4v8kpKlD+q5x2+2uQmKogVLNmsDxSgQqT5fTPCmlSuv+Ku
 UOeCCpwFX60renFrxBfv3tREwsDO4Tx1l2tEyF784pQft3dAgzaf0eDbulmfezKs6PiI
 CHg+9Ql7INKqJ/7xLCa3lYAWgRu4h4y2kqpvRAqk3kwMHP3e9h6N6Vm6XuGaNcmwFFxw
 JF6w==
X-Gm-Message-State: ANoB5pl/JIQuowfom/FBmuTDz3HOlaYWGRpqh8jcWBDmZ2lDpx7+WIMK
 MNX+A04wNwHYEvY7MDdTNuJdBg==
X-Google-Smtp-Source: AA0mqf6iiQ5r3ydsCnjqQwKGheq2WsT2A75+y8RjMsycMyFRdssEX8qqHJP95PJ58rHz2mPDfV3sTA==
X-Received: by 2002:a2e:b4b7:0:b0:277:f86:ddc6 with SMTP id
 q23-20020a2eb4b7000000b002770f86ddc6mr21717691ljm.131.1669901801150; 
 Thu, 01 Dec 2022 05:36:41 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a2e914f000000b0027706d22878sm387209ljg.94.2022.12.01.05.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 05:36:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: qcom: apr: document generic qcom,
 apr compatible
Date: Thu,  1 Dec 2022 14:36:37 +0100
Message-Id: <20221201133637.46146-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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

Document the qcom,apr compatible, used by Qualcomm Asynchronous Packet
Router driver.  There are no upstream DTSes using this compatible -
instead we have ones with APRv2 (qcom,apr-v2).  The driver does not make
distinction between both compatibles, which raises the question whether
the compatible is really needed.  Document it (as compatible with v2)
for completeness.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 4209c6314996..a6bc3197d5dd 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,apr
       - qcom,apr-v2
       - qcom,gpr
 
-- 
2.34.1

