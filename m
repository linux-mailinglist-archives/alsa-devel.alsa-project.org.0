Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D303DEE6C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 14:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00F917A5;
	Tue,  3 Aug 2021 14:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00F917A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995525;
	bh=HHM8Uf8kXP/ddqNY0+HWiYQfCwwAd0Nrl+BTE+SHJ+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZW6zVimavMN/Vofrd51PUFFVhqykDEj5dm7nfnkNL6UD4xLPfToqDGz8pY41o9awS
	 zKGzKnHxnO9NYyfo2QiZS95KE82j+YgBl9jNjXzNBGKJNAwAhpSVuyksVsDmWRzflz
	 NWi3wbbZ10QxDSKFPt6aQpwNn7DK1Z3A8hBirn0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 870FFF80529;
	Tue,  3 Aug 2021 14:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E1BEF8032D; Tue,  3 Aug 2021 14:54:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 833A9F8032D
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 833A9F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nY6LC9WW"
Received: by mail-wm1-x335.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso1662122wmg.4
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0vcBsLXSl9GUubMz0AxOjIgAjQjLiU9UgPPaq+ZKA9A=;
 b=nY6LC9WWHb4QmP4lnvRYWOrIohoAzRi3LfX247PgNT6C/xu0rQJZ1w2W+BWyNCEEV0
 IdVBx+E+mTdT9z9fVvprki1PPqSjEQikS+Of8EhEycyQZBTgToxlgqS1qd15zdNjVtWA
 rGcLKOJOgkG/1FY04rAwiaYhem8kCoiQiv0ZDMfOFwHcok8s/UXlGrAzIuJUKquPjCl+
 d5f0JXaCmxcc20Y9el1Bi6L/ZL0EX06y5BT7JEy/JrAVrPGTkx5i5mtr3IelL5nhxt3Q
 480X7NLpyc6ykYmcIthMPsjFYmXgwR2+FMtDjdrwCe7sagGVa8I7/3RA8e+B7T96Bq8D
 7PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0vcBsLXSl9GUubMz0AxOjIgAjQjLiU9UgPPaq+ZKA9A=;
 b=AuIPshnGXwmR7VEmhQiReSWDwTRCTjQWxQ92ZFmdhQIn+e3mq1ffETo2yz83Y5oHEQ
 b6VbJRVerIJkZ2+aIdWshqqKL0unRP8wihVL42pSV2LuzIc8C5Kd69tdZvLd/ARXHKUW
 GZtm1HdgpBWcKratuWmKuOGw5LaOxGqIah6XxWNfeWj7ovNOXV2crZGJCWs03uumdGqx
 wC9GjKP06hZK8TUPADCwZWbL5P1kZrn9HkVEoknf09Uu3zTOQjX9BXxpzka1C9j2Uaor
 IBJI/bGvV39mUSmmzh6Fl1L0GxTVOGgvopr01qNpFRlj6mHIvsZI4KRPdtJKqzVaJTXF
 g1mg==
X-Gm-Message-State: AOAM530vg5bL0ge6opfdX+/U2gSRBdY8cxh4nWAw0yXMS3ucitWXl2BG
 h7JD+6BgZpE49ox2t/6KddHspA==
X-Google-Smtp-Source: ABdhPJzPsp6SrcIkfGNC94k7h8QerfdsLKRrN5rERNO9QIY6+88BVqDV5+qDrJtnAJ4mV4EkVkh9MA==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr21884871wmq.101.1627995274273; 
 Tue, 03 Aug 2021 05:54:34 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 10/20] ASoC: dt-bindings: q6dsp: add q6apm-dai compatible
Date: Tue,  3 Aug 2021 13:54:01 +0100
Message-Id: <20210803125411.28066-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../sound/qcom,q6dsp-audio-stream.yaml        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-stream.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-stream.yaml
index 0e70b486b51a..8cba289bb068 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-stream.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-stream.yaml
@@ -14,7 +14,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,q6asm-dais
+    enum:
+      - qcom,q6asm-dais
+      - qcom,q6apm-dais
 
   reg:
     maxItems: 1
@@ -92,3 +94,25 @@ examples:
             };
         };
       };
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpr-service@1 {
+            reg = <GPR_APM_MODULE_IID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            q6apmdai@1 {
+              compatible = "qcom,q6apm-dais";
+              reg = <1>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+              #sound-dai-cells = <1>;
+
+              dai@1 {
+                reg = <1>;
+              };
+            };
+        };
+      };
-- 
2.21.0

