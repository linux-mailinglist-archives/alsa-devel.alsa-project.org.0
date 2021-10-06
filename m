Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D4D423D14
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:43:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186F983B;
	Wed,  6 Oct 2021 13:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186F983B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633520620;
	bh=RrS/YC9yrka5UPSznR9amblm2X0hN9a4tClp4dX1oN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKP7BOzWZoJCXIIj0ndseh9VLxqfRsD4YCeRzKGisb9r1sfTyxWW5leRgwG2ZzEnV
	 0VkYvWg8rrYyOsFR5TGp1udSGLhBdc+8mXlEj2k9bfBcXgl1SL9roBrSKyZ8Ipkftm
	 8CEkESeatSmR8I+3wNbNfKrKjb61TI5LAOACnnqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88962F8051F;
	Wed,  6 Oct 2021 13:40:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58C25F80511; Wed,  6 Oct 2021 13:40:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA9C8F8032D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA9C8F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vZllb92a"
Received: by mail-wr1-x42c.google.com with SMTP id e12so7919100wra.4
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=vZllb92aAEJ9NkqVM6iD8VcorgLavsotFVkNp+ayqoD6tN9+WjaYecXiZsX/jW805y
 HId9AnM1JgLDICk/McTdH/1ufLferbwIzD33OZjwBRKuS3oH/S9x0nMCoOKwQIpABPuu
 rQyR90Wgug0AWWLbjlEdAW5xhd0UUc2CCM69Gw/fS1uWXWU3trG4RRydIAweNhLbDHh3
 Idhm0/GC+ypkLhRMyMingeTdgdlwKDyndIbVcGYpf4ILrg7WHmGKThbd/j72UJyKkWiQ
 7hRgO79avt5jzk7s4IJ6yQM7zyHjBzxrZbBNfyInHi09vKzRfry0mDS8UFkEWKBBc25S
 Gajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=rIW6W+AHbugdajkUaC9c2HjmqvuN7zF006LJqqPM8FvF62RvFLS/B1v1S69rTkunSC
 c991bQ1hNs2YuHjMgXYZgvewkN+RLHJJmeSGYXKrM0UrrInmLuHgqohMsrsLhgU/bPBj
 Mk0tIow1HGvaSjoXD/piLwXa4HxJMx6Djeqn1MpmdEG3c9gapMRT0HfhyuAXC28bimUJ
 LNe5LUn/fzVGhyzMzP2X+z54nHBwbkQqrwalAK4dFiQxNVKL0WV8OnlVecyKStmUo0ZO
 AOwIFBOA5EzlQS5+G1+4WMrYSLd2DSVWLsQHzD2D6FYkkyNIB4DjEtXPcVwunylD8lF9
 XBKQ==
X-Gm-Message-State: AOAM533WUT+Q9Mz6obfdLCPdPTfyGTQO1F5i1EBMTbBL9o9E5GTSzEkD
 wvxhBQE0PpH0DLDbLpwuAwtl+Q==
X-Google-Smtp-Source: ABdhPJwsuaQqexyIl/OQiqF5eWg24f86zd3l2zhHQGq6kuJvsO0XU4oEci4QN4tjASvD0JTEEED7Fg==
X-Received: by 2002:a5d:648d:: with SMTP id o13mr16508413wri.421.1633520414467; 
 Wed, 06 Oct 2021 04:40:14 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n11sm5540110wmq.19.2021.10.06.04.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 04:40:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v9 07/17] ASoC: dt-bindings: lpass-clocks: add q6prm clocks
 compatible
Date: Wed,  6 Oct 2021 12:39:40 +0100
Message-Id: <20211006113950.10782-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
index c686164732aa..f83f00737a2f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-clocks
+      - qcom,q6prm-lpass-clocks
 
   reg:
     maxItems: 1
@@ -54,3 +55,23 @@ examples:
             };
         };
       };
+
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        service@2 {
+            reg = <GPR_PRM_MODULE_IID>;
+            compatible = "qcom,q6prm";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            clock-controller@2 {
+              compatible = "qcom,q6prm-lpass-clocks";
+              reg = <2>;
+              #clock-cells = <2>;
+            };
+        };
+      };
-- 
2.21.0

