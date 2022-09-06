Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2405AF185
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3A7685D;
	Tue,  6 Sep 2022 19:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3A7685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483884;
	bh=9QWsEdNksZdqul+zSlgQh0NmUJtgLftnIe5edk+DpRs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QyfGgVi9GVUrtgk8K7C0QRb4qXcN83lvvpvkMt47Pb629/I2bcPUDxfRlTHXpVqVp
	 lkOtHFnqouEQDiwMEq9nr655bJdqKVTr/MncogWSY8x/K09VFvKmZT/gJyvujzTn6T
	 Hk6ktYuFurhqmPopt1XM1HaRRB/NelFcdmzHkKKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE84AF80557;
	Tue,  6 Sep 2022 19:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51299F80548; Tue,  6 Sep 2022 19:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 933B2F80249
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 933B2F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VYRTVGMQ"
Received: by mail-wm1-x335.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso7822839wmr.3
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pE/wXMKDu2HTLm4nxMQCANKnWbd/WYM89vdJpLu9FcU=;
 b=VYRTVGMQRqOwTouxak7LtLp7dc4GIzykhdstFKXt6s0ERXTosZBvcR3uTC1sqqhf0E
 NFszOBssMXrW+Wep5qU7dUPPKFvNL1uH2PkxcysQJhirqUqwgdMX41fcPjoVYXsabG7Y
 MVEXLXPJXf09fIuMFe9D8eOPRLhYVX/dl+lTcC+b5NxGfc68V6oxRb7Iuh5w51DGYbWd
 R0nmymCFTe2/E9h/DOyih4NRRc69ra1lHsRmDquGawJTHRidNCMQGcU1meoV84RF7IFj
 GUM4t7C/DI7y99Uo7bd/aFxm6OwjE00yUks5BHEAdRZt0hoVO3utIqs9wnWu1zhzpTmG
 99Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pE/wXMKDu2HTLm4nxMQCANKnWbd/WYM89vdJpLu9FcU=;
 b=2hxG7JLpnllSK4UV7VIvQHZ7dqJ2kJMyF8Qj7GVEZY/NYSwZm/pIM8gR59C6iFcffB
 xg1bZjXNPc9EyD9BCbnfEBGBaDaByLAUK+GUf8y2lu4ufov6ILOc0L98YqZ2EkiDVNOS
 4hj3KwByVRAe5XVqLZt2oeLGdYoROp8StORRLekOsbYfVktoGPrpi/TlviTfGE81BBgq
 uBTLEW7q9JM/6wn6cUEbJSO1VAamNNuADLJFgYN/qYPleylwkopUj7nPOYQbN8/okuNP
 ojBn0w//3v0RBlDsb4LsBeAiIB0F6+bAjCHZyZVCpmvcGnP0t5WS8Ki4feMgMVYBjEeu
 ZUtw==
X-Gm-Message-State: ACgBeo2oZ77xyvR+xhpZX9jVYZoIGtZmJtTJx3HXAKbr/BkbszEJEWkc
 RPSLuqvx55ziZ52V3CczAy9t5g==
X-Google-Smtp-Source: AA6agR4eZQRkCNEjfnHqGohLVi6VKLUeCDmUGuENJPgIzLDol1RAz0fp/6VjlL3ZnyNVNcetluePuw==
X-Received: by 2002:a05:600c:2483:b0:3a5:e70c:d5f6 with SMTP id
 3-20020a05600c248300b003a5e70cd5f6mr14557588wms.51.1662483734275; 
 Tue, 06 Sep 2022 10:02:14 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 07/12] ASoC: qcom: dt-bindings: add sm8450 and sc8280xp
 compatibles
Date: Tue,  6 Sep 2022 18:01:07 +0100
Message-Id: <20220906170112.1984-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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

This patch adds SM8450 and SC8280XP compatible entry for LPASS TX, RX, WSA
and VA codec macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml          | 2 ++
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml          | 2 ++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml          | 2 ++
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml         | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index a6905bcf89d2..1de11e7f33bb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-rx-macro
       - qcom,sm8250-lpass-rx-macro
+      - qcom,sm8450-lpass-rx-macro
+      - qcom,sc8280xp-lpass-rx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 324595a62ae8..de8297b358e8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-tx-macro
       - qcom,sm8250-lpass-tx-macro
+      - qcom,sm8450-lpass-tx-macro
+      - qcom,sc8280xp-lpass-tx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 7b4cc84eda8c..9f473c08cb2e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-va-macro
       - qcom,sm8250-lpass-va-macro
+      - qcom,sm8450-lpass-va-macro
+      - qcom,sc8280xp-lpass-va-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 13cdb8a10687..4959ad658eac 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - qcom,sc7280-lpass-wsa-macro
       - qcom,sm8250-lpass-wsa-macro
+      - qcom,sm8450-lpass-wsa-macro
+      - qcom,sc8280xp-lpass-wsa-macro
 
   reg:
     maxItems: 1
-- 
2.21.0

