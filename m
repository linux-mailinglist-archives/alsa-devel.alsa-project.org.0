Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 515C63FFF26
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1D951866;
	Fri,  3 Sep 2021 13:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1D951866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630668399;
	bh=M75VjAePp5xxN6vkI3+ydrgQkMRpP9j42m6a3+3YrME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a5rizegdQKfqyLXeE5OyejSmP8eRaum8jzdDWZJY+hLLHKSP/jK0D0KFNwbxllxpe
	 9LXdpFj3yoG6/+KCsetx6uPdg0A6i/AsHG8qLUZpDhTOMeCB59hXFY7l6qj/85AkvE
	 3Us2zAssvoByHLIu7r5DFdjN/O8n5oKNsIEdmfO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B53F8053E;
	Fri,  3 Sep 2021 13:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D90CF8051A; Fri,  3 Sep 2021 13:21:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86C8DF804EB
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86C8DF804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="m3dU1nsk"
Received: by mail-wr1-x42e.google.com with SMTP id v10so7727722wrd.4
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 04:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XrcdWigOrJBOqNH3/v+b+R+GIipVI1XmPMk0yejMbMo=;
 b=m3dU1nskU148xorso3M3e8tJyMoaA5cHdIzy7AL+czkLGPv7oLPA5e7oVDBKgfySp6
 NzaK41cabEW4S3hpjdQHiOyuVtyfaP4+2EM+JFWxbRAn8VFJEiKI4bDMgFkH6Q3i9rCX
 0de9CDTHSVkVTXIVZnpdIibdLfUKSjFPnCPCc4LoWaQvs0hDXnBTUF0xA5tSprctigvW
 Sj1iRKkQRrutNlSRfRgic/lZR379VY9Eka8nmn2z1EQzlDKQZFErCpHOgOw5+4txL4yR
 aUw1vzmFa8QB0WAjRrKFD2fAqPO5jqIrMLUsl0tPuf0GxybFXu4exEErL0OXa8QKEM3b
 T7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XrcdWigOrJBOqNH3/v+b+R+GIipVI1XmPMk0yejMbMo=;
 b=qHosRyVE9yGDcI4bsC632Q39FWeoLhrXLQX3BU+LJnSrXKB+ZHLNZ3SOnFOoEwVUx4
 GWtZrhZWugX6/zpQ1rgKvwyxvvRMyTcHXXxM8uSeYzpkVZ3j5hV1MMf14NgCdBYshfnk
 b7jS/SkilbAMQpaN1MQwGxuYzWaCTRqUC8KI9pKGeBNsVhhlJrk68zkpXHh8ldKZ//GC
 GaneiePw0eiqcI8/dGNXAQ++D83rJEbRSmWfTzOQrQ1B62Iu1Ki3WfGL8MJ1ARGn0ipx
 rorVbfgA/LyOjoMMGBPnP1O8e2+sHeyWJnHpTma/F7GNYgIku4DuI2M86cXE/JlsMF7b
 bc4g==
X-Gm-Message-State: AOAM532fNMsVmnVxeOtkpFony+nX8raeRUf41+JZdthjGUKFKYIykA86
 uAN2jq3o3e+FU47/jue8l4rWQw==
X-Google-Smtp-Source: ABdhPJx/laJ0dPo3VhAp35pton8lIaiXEa8k4R19JM9JV80XiAkhPelcOx2o0e0ANCWxX77k4D+xsA==
X-Received: by 2002:a5d:56c9:: with SMTP id m9mr2888686wrw.134.1630668107423; 
 Fri, 03 Sep 2021 04:21:47 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f20sm3881877wmb.32.2021.09.03.04.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:21:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v5 12/21] ASoC: dt-bindings: lpass-clocks: add q6prm clocks
 compatible
Date: Fri,  3 Sep 2021 12:20:23 +0100
Message-Id: <20210903112032.25834-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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

On AudioReach audio Framework access to LPASS ports is via Q6PRM
(Proxy Resource Manager) service, so add a dedicated lpass-clock compatible
string for this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../sound/qcom,q6dsp-lpass-clocks.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
index 589c3f1e2008..9f3de2307d1c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-clocks
+      - qcom,q6prm-lpass-clocks
 
   reg:
     maxItems: 1
@@ -54,3 +55,20 @@ examples:
             };
         };
       };
+
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpr-service@2 {
+            reg = <GPR_PRM_MODULE_IID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            q6prmcc@2 {
+              compatible = "qcom,q6prm-lpass-clocks";
+              reg = <2>;
+              #clock-cells = <2>;
+            };
+        };
+      };
-- 
2.21.0

