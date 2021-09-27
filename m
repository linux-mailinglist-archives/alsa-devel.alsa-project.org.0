Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5B4195D1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 16:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 406A816DD;
	Mon, 27 Sep 2021 16:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 406A816DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632751323;
	bh=RrS/YC9yrka5UPSznR9amblm2X0hN9a4tClp4dX1oN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ax1lCDELDTwZPI688hfktqarTd3xoQKvdr17ukwQhF4Fnmw41lBvNJVqzob6pM5zQ
	 WLjuVX3g24rLcH1CQ9J3trBDM73cuW8/a4LeWqHy1/iKS6UGIO/hI8v1Lia4RJ9Np3
	 v6RVA7zdfNoPDfSHldqtnUu17mzqO5CgUbMUADQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64665F80558;
	Mon, 27 Sep 2021 15:57:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D97F80508; Mon, 27 Sep 2021 15:56:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC63FF80508
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 15:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC63FF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BLNGDEJL"
Received: by mail-wr1-x432.google.com with SMTP id v17so8714939wrv.9
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=BLNGDEJLWcAjEHkV7/sAuO/x0d7vEWhqt8PROhoQqAzxzhJAG0C6BdWlEHIqlq2BOQ
 7554peKuUtZrxPXdQAa6SYJq50HAKlT1MERxfUyJC2VqVwa+gRr42shhRGyOmY+5oUe9
 0pbDOrb3zr7IY8l7WqNEOK1b+2RiN2L8a0CKWf+9YYqJzbRcOY9eyQ/U5UpSdTActgST
 CssRobbVNVFTYXQHWyALSs590lqgklDd1E9VhVBvKWdU7PjcE6YYMdrfzHe4EKnlbXTC
 kTkRz0iOUIrgjI5qoayh6MmWKBHyUD0Cxe2zLx9ZpxZdXWvQpCB34DxWopUflfSM874q
 WyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=w+M9/swZhOV8h/df54pruQ4unbVG8BWjAIpUJrAjbIL/8QXVGP6XicX144in0pDin/
 pVC4eb0vYW3ZGvsjrlNFsEfj+iXwJwi5Lyvq2p9O1sGL5dTxOgR3KnBGF0STDgZ5xYPJ
 BeXJij09xRIuSWEbZRc8Omn5Qdp/Jn0sadV0CvJ0oT8SEpmE3RfTVLAVmzCeg28/0q3+
 cTP+0SudipGk4XQGXq7jbZftXnAFVdTYp+I2wBDkqx5PIhi4I/wJ7yzYHBWPTmfzCoFZ
 Stgxon5BzwHKiiRHErxZrf5/pzjHAEIk3txz/leoUSaMPoM4xTU21zYXTsALRb17x2ck
 9yRQ==
X-Gm-Message-State: AOAM531+m+RMHE3aZIm1QND05hoB0hmTCrncbzsdeZKoeOvT98QJcw/9
 8nKrMq9etgs1DFnOBtXo2KXA4Q==
X-Google-Smtp-Source: ABdhPJwQ0H+cqKR5s9tf/HAJNGH77+atJLJ9MyQMe97sxAQTA13RWtnbGeZbomyyp8MnMBOiZHLwrA==
X-Received: by 2002:a5d:5281:: with SMTP id c1mr28730682wrv.92.1632750998047; 
 Mon, 27 Sep 2021 06:56:38 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b7sm20485606wrm.9.2021.09.27.06.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 06:56:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v8 12/22] ASoC: dt-bindings: lpass-clocks: add q6prm clocks
 compatible
Date: Mon, 27 Sep 2021 14:55:49 +0100
Message-Id: <20210927135559.738-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
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

