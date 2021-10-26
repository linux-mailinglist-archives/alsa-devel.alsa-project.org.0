Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0B43B123
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 13:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E02D16F8;
	Tue, 26 Oct 2021 13:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E02D16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635247292;
	bh=FTNshx8mgD/4dsjBE7iHgoCsCH/9Xhlk/9MW2GTlrRw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INPaqWopv/vsWn7+GFaJgdEs3m45RKnWlLXFQg2hREC7xif1R6DdG+5y9s57GouAH
	 U01s0I00DB1+FCaowTu/hVY+x8cT76J7vuI3It/4L1xBPnIwIUPyO4LmJcyk6Ghlf+
	 bTUqKx+YDFtmGXwysEcbp90g8mf+Y/mpbLcL6aUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F08ACF80537;
	Tue, 26 Oct 2021 13:17:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48591F8052D; Tue, 26 Oct 2021 13:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8B6EF804E3
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 13:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B6EF804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oh49rrCV"
Received: by mail-wr1-x433.google.com with SMTP id p14so12562462wrd.10
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TebeQ0TXJpETl5yyZtrFs6HbXMx9cchKOW5rtUhE/g=;
 b=oh49rrCVN7EdZTDIKN11rUnmYn+IRrLy1GtZUUHVLNUCo0cTkcaCmdwOd8NWxxJqTq
 SKTu4x+8UQLFBeZfae4D3wmjXf7VbEh6eHe+Ej23tFPN+RfsR1PwicySueaLKi5O66vO
 zn2UeJYVjmlVDruF/bwlvYgsjNFiCpWnNF18lwGnvI7dmDRN5CFCG6ja8osJJ3T7Wv1n
 uDTQlaOxGJycK4v/0KeqWiMU3nHxK5JJkUk1x8d9oN6VWB4v6K3w2FYW4PNVxqghPmSB
 FTTXLLNcOi3SvbSm3kxw4ppgnDUvOl4V1ZkStlVYkezuFlf4p8tre7S+mHGt17l4BMjq
 +Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TebeQ0TXJpETl5yyZtrFs6HbXMx9cchKOW5rtUhE/g=;
 b=r5cfbRu78EVsHTuch8Etw43M1KAOwNiSXVOM9K91vgM4Thbt2pNoqi/RXYuGrWFFMv
 J4/17JTqky6xYenCtWTei9No2HUaij6RAClkmEIFUCYSXk3JtoZbFmcieGPynXOX3ZXz
 2EGAkJpTy1+OKSJQGrLhf/Cl1gMrb6L68f4OntmqcwQB6y7ZcgE8sklJc4LnxaZei5kT
 z1J99fQ6tI3zD2lq4hdKfGGQAJFKn9CwccMv8KhsKqRENxLa4ogytDXjDLLxNhbKWQMf
 3El9cV3o6jJGhDQOF/MdiDzz+gcCBoENu3vhmUJ/y2sY09C2EIT8cUo9d6Snw1E98fnf
 ZXng==
X-Gm-Message-State: AOAM532qghtcdeNK/wMXbEusTRjysWilDdAVyXErCHE066Sm2Q5KVwTb
 g/NInEai7w1XU05XC1hYVHrtpw==
X-Google-Smtp-Source: ABdhPJxr4jI+h9lIpRckifGWWyAGuh6/esfMUPDe/Fg2XZiS0gyU0/4DWHUcSWB+hv1zuXtH7v3X7A==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr19443952wrx.334.1635247038020; 
 Tue, 26 Oct 2021 04:17:18 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l124sm355483wml.8.2021.10.26.04.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:17:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v11 06/17] ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai
 compatible
Date: Tue, 26 Oct 2021 12:16:44 +0100
Message-Id: <20211026111655.1702-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211026111655.1702-1-srinivas.kandagatla@linaro.org>
References: <20211026111655.1702-1-srinivas.kandagatla@linaro.org>
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

on AudioReach audio Framework access to LPASS ports is via
Q6APM(Audio Process Manager) service, so add a dedicated compatible
string for this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index e6148c17419b..dc7fba7b92d5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-dais
+      - qcom,q6apm-lpass-dais
 
   reg:
     maxItems: 1
@@ -169,6 +170,32 @@ examples:
               #size-cells = <0>;
               #sound-dai-cells = <1>;
 
+              dai@22 {
+                reg = <QUATERNARY_MI2S_RX>;
+                qcom,sd-lines = <0 1 2 3>;
+              };
+            };
+        };
+      };
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+        service@1 {
+            compatible = "qcom,q6apm";
+            reg = <GPR_APM_MODULE_IID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            q6apmdai@1 {
+              compatible = "qcom,q6apm-lpass-dais";
+              reg = <1>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+              #sound-dai-cells = <1>;
+
               dai@22 {
                 reg = <QUATERNARY_MI2S_RX>;
                 qcom,sd-lines = <0 1 2 3>;
-- 
2.21.0

