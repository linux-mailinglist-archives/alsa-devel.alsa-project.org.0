Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3185413486
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 15:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7037D847;
	Tue, 21 Sep 2021 15:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7037D847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632231642;
	bh=RrS/YC9yrka5UPSznR9amblm2X0hN9a4tClp4dX1oN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HZm74POiXPc22T9wjQnxZO6OkWlwFtbA6qXMvxPB1cE97CtKJetLDXg9lrAPsVj0j
	 jvpdlhBzZsTwLs1mTpImODH/Q4r58/y8TdpHBji1Nw/Hk9bK1YD1sYjhiDwLFZy20A
	 IETZamBeBCir/z3a6g6rjicqOzskNwh0niNiMLuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A846F804F2;
	Tue, 21 Sep 2021 15:38:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D567F804ED; Tue, 21 Sep 2021 15:38:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02952F80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 15:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02952F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SDEr3Bi9"
Received: by mail-ed1-x52d.google.com with SMTP id bx4so30040355edb.4
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 06:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=SDEr3Bi9dVZx9skbxdTqk0uD2XtPonJtAcv4IiO8crFBs26M4k9/T+cr87ziHrIpv/
 uDAqCXuQBSvqMOxTJ0Fv5CeB5Ywzg804K9omERfJjMVVU+MZYLYOjYMA6UyGkm6BUWaB
 cZAk+IqKkv4aTODD33lz2dp9hshuU8zWQWDJLyFuddS15ql+EZPtH2pouSLvwHJByDvC
 saD1L77XRBMWrVP1lDJXrDmbHZlp6uerqh+X9kk8ZBnrrxL6YrphmhROFA69ud4NHQRl
 6P0IWdlmfhBL5x25cl+eeW/Hlw05sCBdnAFRciNaLEIE50Jb+ptPBgF0Fyay54W2HHB6
 WjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=JWZTVtQQTVG2mPChejkor+VcN/JTxaXRH6LNTHL0ZZiyu9DTaBi6/6UBO09IzDauvu
 7zw79RKUPqu7jOETFgtg9+Cdrbg5UZKXEsF3M+v/KEkpZFb4GmTWYMfV42/mw185lXDn
 1m1HcfV6OByHwCLI07VXAr80ksQTCk/MhbrUFLwJ0qWdnSmYIifhqmM7kjJA+mMJq9zf
 5WfUgV52aGpX/c+xAsF1NZ1lSo7v9uMIY9v/0riBeReYIO08GmpRl1Jwx4/rDXIXLEBs
 18HGSMl6vYI/UsnpkqJJ5wjOQ8wjHwigrVMNGA7MrzRJuTMG12PleqhN390ypXBEzkx6
 VWdA==
X-Gm-Message-State: AOAM5326/IVikH0Yp8SFw36ot3hCp9oFZS4XShz1tdBgXDAgJJC92uZx
 Lj4k6oPofZMeKLM0jc076ninXg==
X-Google-Smtp-Source: ABdhPJy8QERP2z05nE5jCT86ONGDjLl8u++2AlMH+ZVUj5DZAZp03r9yrJt5OUlGt74opVkc/mJZcg==
X-Received: by 2002:a50:d80f:: with SMTP id o15mr35291392edj.52.1632231462075; 
 Tue, 21 Sep 2021 06:37:42 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b3sm7915799edx.55.2021.09.21.06.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 06:37:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v7 12/22] ASoC: dt-bindings: lpass-clocks: add q6prm clocks
 compatible
Date: Tue, 21 Sep 2021 14:36:59 +0100
Message-Id: <20210921133709.4973-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
References: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
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

