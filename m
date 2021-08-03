Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EE43DEE88
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 14:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3187017B0;
	Tue,  3 Aug 2021 14:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3187017B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995583;
	bh=/MEgtQBQ0ZOeLjeS+yziXFYJcP2p7/PeZzyDmyS7W/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qs/cN6g0WkENpfAxA9l/J20qO3fx+dNp1qVoivWKEODcTZKgMR91jJlMUtLMLzswL
	 xi/xNueqneS1MxQgV2Ta5g/+A/aYJaMa52Ly7l5B/tIQTYgpfYl93qqou58FUjQcH0
	 DDNlmAKWI37wvZ/X1koFLElMWKXD+43rB9/2NbfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15017F80539;
	Tue,  3 Aug 2021 14:54:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE1D4F8051D; Tue,  3 Aug 2021 14:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF8DF804F1
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF8DF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oMdPQTqY"
Received: by mail-wr1-x42b.google.com with SMTP id k4so14390198wrc.0
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=28lNrxGL6jA0sHRoGitHZoiKhTcNCqvnm+1QFtFW9QA=;
 b=oMdPQTqYbS0n7nNTAc6RUgeTUJfRUAgxS9yeER6PWv/htrRkc7boe3tOVDL9OKK06U
 tnRGmueii8x8eIUASxX+dEl1D4UrHAhAZdWYoIVsubKdVaF/aPnvQnIKZksawDN3DA8h
 uf00k/yDQ/n4nifh1m7f/bgpok65g69jvw9pLHhsegNRXCXy74nSwVSoqyXuN02tLR+J
 paJycM+Qawia8H1X6ZSrWFyaQUZ9FhvXesa6kSWy+TofW4sZqANszjmH3dDfMqf8kwiy
 d9x0zGBAMWI/R4mcSlcNoah4+eLbxRaOL7g/yV+LAsyOB+03ctnQrrBvHqmm+nsNrNgc
 2sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=28lNrxGL6jA0sHRoGitHZoiKhTcNCqvnm+1QFtFW9QA=;
 b=MOo2/C2TV7qyanQV1eKrEpwyRa3LFKa9M9KiYVqZSQp2KjiAU89/3dggW+fGKhiqb0
 2sy4q27JzItrWmZjpguamJrzncXVKUnDuKUznsT62gi1AUoQGU66DazePSa7XOSRaf9W
 hpC1y3nE8rZD3RtKYDXWOK7qzivaisPaaGrkxIJ5R00ssyW/relIO3I7nS5qwgk51Ud2
 c4qsHfU7pPUvxuUKLnF+kIdrKqz2wfgMUAfd969ZEPfRr6/Iy6xb07eVxfv3B/aDgwMX
 5DAzOYwMTaFs91x8amsJfkVmbcmkGp20lLRI564hOHrm7yrXbfWht8cktKSbOpPvRWW1
 xLuw==
X-Gm-Message-State: AOAM530XkZY2X7Xvkj64orDYB7cjcnCK+RIDXvU6pSQn0aGJx5Qkj7XL
 CABO0uwciXvTCO0WCcMa5QqkfA==
X-Google-Smtp-Source: ABdhPJwSV90qUIMwimZIMbPTkUyxXqCNgtBEJRQx9Izi4W3JJxga8ow9xr+OhU3p76VGtvY0fb4QpQ==
X-Received: by 2002:a5d:61c8:: with SMTP id q8mr22850871wrv.151.1627995275295; 
 Tue, 03 Aug 2021 05:54:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 11/20] ASoC: dt-bindings: q6dsp: add q6apm-bedai compatible
Date: Tue,  3 Aug 2021 13:54:02 +0100
Message-Id: <20210803125411.28066-12-srinivas.kandagatla@linaro.org>
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
 .../sound/qcom,q6dsp-audio-ports.yaml         | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-ports.yaml
index 6990295803a8..521256339909 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-ports.yaml
@@ -14,7 +14,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,q6afe-dais
+    enum:
+      - qcom,q6afe-dais
+      - qcom,q6apm-bedais
 
   reg:
     maxItems: 1
@@ -168,6 +170,29 @@ examples:
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpr-service@1 {
+            reg = <GPR_APM_MODULE_IID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            q6apmdai@1 {
+              compatible = "qcom,q6apm-bedais";
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

