Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5D755FED0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 13:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 343DD1652;
	Wed, 29 Jun 2022 13:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 343DD1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656502883;
	bh=r0/Y7+HyTnnAZ1S4OgqGwy2L2tSceQXhOF12TDETIXo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=osN0jkvVL5b27B6/HAQZ7dX7PVsQ2+HYRGR1vd53vE3Wfs9tmvCdMyMJXSjPuafn0
	 GaMFcH7wswbf+nLPnEWj1e9iLleI5By0nX9zcEuYVD75zylEKlmYgxsYchAO7eWObs
	 mm3TYDRD8SPGnZtHaPFkRNRZ1l6fN9iniq+OCVMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9850AF80245;
	Wed, 29 Jun 2022 13:40:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16B40F8020D; Wed, 29 Jun 2022 13:40:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD0BAF800F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 13:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD0BAF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NnBWNG44"
Received: by mail-wr1-x42c.google.com with SMTP id e28so16867634wra.0
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e12zOkbSl/TTgIy5byX+f+5dgcezW3bwpD9ZmWTyAuQ=;
 b=NnBWNG44+SIlVbLxBipqsu96uM69+jGagVwRuG1a5sKywjFPz4bc6Sz9Yp2FwsCKTG
 SS+3V6f47hyyDX1jUlIfUXWShQFnp0mz7BT7CHsM9c8lZ2fqaAx98iET7de6v/jviRfk
 TakgO4GO1TBHaBMxEhvaBZ+YAoaZqXMP1AxwUoQzRKUsY/YAEHwnQomyqAA15JAB+pRh
 aI87L2R3eU3Csu+vgIiEPs+QSiUJZsEoYdO29yNQVOywP4dkv8cJERWMy0v1YztOFz6C
 s5S/Ufjt9mGeAMfwuDoxehqIq//vtzx2MqDpQpMi2YKPCaEF4U+TnXf8Pw4cF2ipS2do
 SKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e12zOkbSl/TTgIy5byX+f+5dgcezW3bwpD9ZmWTyAuQ=;
 b=6Vbojjb4PEny9cFszc3nF6vKOp78Wr/En/jzVreNPo7/RCOOK3Q2cgutMFOArjDRde
 XFSZfJxSkMe75vBBlStosoPeLjjUOYdt3J/jbPdhge1gbf98rPeke85zaaOWMZjI8Jyt
 jNrJEDTskoOQKFYGQBqKuFH308dfHOVwORc/lPyTkpJs5ylrStsftEXtiDw6j+ONTebG
 +1tig12nUIx5zZVQR8WPvSx8UyJq7nGb4Sulb5XDGsviWJGeAnwxaKmExOIm0bELFxh4
 ljAYb1F/YH07sgv5EsUyFDXuVCLsZdZ0IB9E9NuwwGKpTeqPApfiGhzIMsFoiT9CTsiw
 go+g==
X-Gm-Message-State: AJIora8Uc9U008+pnmYEtJCgIwY8pHrqXbJCXcz2pPU0rKMYxSh47sDO
 xRXfW4Grr90YyIW8yywBmZVrvw==
X-Google-Smtp-Source: AGRyM1tJRec+suh/Fq+QJOybEcmANFgSQzjUGT4MbvFTQVpTbNTlOPIkzLoxXGoQPjcf121UTlpgFQ==
X-Received: by 2002:a05:6000:a12:b0:21b:93b9:134f with SMTP id
 co18-20020a0560000a1200b0021b93b9134fmr2644810wrb.310.1656502814986; 
 Wed, 29 Jun 2022 04:40:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 q11-20020adfea0b000000b0020fff0ea0a3sm16136500wrm.116.2022.06.29.04.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 04:40:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH] ASoC: dt-bindings: Fix description for msm8916
Date: Wed, 29 Jun 2022 12:40:12 +0100
Message-Id: <20220629114012.3282945-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, quic_potturu@quicinc.com,
 rohitkr@codeaurora.org, bryan.odonoghue@linaro.org, quic_srivasam@quicinc.com
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

For the existing msm8916 bindings the minimum reg/reg-names is 1 not 2.
Similarly the minimum interrupt/interrupt-names is 1 not 2.

Fixes: f3fc4fbfa2d2 ("ASoC: dt-bindings: Add SC7280 lpass cpu bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index e9a533080b32d..ef18a572a1ff3 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -25,12 +25,12 @@ properties:
       - qcom,sc7280-lpass-cpu
 
   reg:
-    minItems: 2
+    minItems: 1
     maxItems: 6
     description: LPAIF core registers
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 6
 
   clocks:
@@ -42,12 +42,12 @@ properties:
     maxItems: 10
 
   interrupts:
-    minItems: 2
+    minItems: 1
     maxItems: 4
     description: LPAIF DMA buffer interrupt
 
   interrupt-names:
-    minItems: 2
+    minItems: 1
     maxItems: 4
 
   qcom,adsp:
-- 
2.36.1

