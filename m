Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E34EE466608
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 15:59:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 802FA273A;
	Thu,  2 Dec 2021 15:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 802FA273A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638457181;
	bh=0hb6ZzrrmVEP18Xxi9dG0tak7PsoEhNiA54x/NAlPpc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BbzfRlVrmzaaD7oK0iM6/uKQ8UJkVAWy3i+bohX5OuOnsDe3ixa8H4+lR/A3fT/tm
	 5D1tFGCf9Qn6TqEiGBDZg97NUUzjXd5DfIuc4fyNBbTnJ5e4YcWiBgyqUJSwTpyFNR
	 xGv8vV2HvQbJ6n59Wm7dYQi72tMdX5UaWvTzgG7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B41E2F804FB;
	Thu,  2 Dec 2021 15:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89E30F804F1; Thu,  2 Dec 2021 15:57:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CB44F802A0
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 15:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB44F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="Ek1XZ+DM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457028;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=pMYDkCs49E4DXnqeiChk16zB4xqwukbwqREXbae/qPk=;
 b=Ek1XZ+DMrDXNnQU+vMlgGss074qwZ3M8fjkKq7OHcn90PaUyGvh7UpGdwd0hcYH5eL
 WsrerqdfcwYbCbk9oc3LKHuruW5RHcX/oCxI/m77btAW614ZMxbB0C21/dI5FOSbu1H9
 gRT+yZCfsqMVeGMGEwkZQTmtKFRYEbHD+/beKDgWcPvVgt4HDglKWfVU5/WKZjKBBKwZ
 kXJ8G9V0TG8dEtme1cIgjP4Cn4W87SI+fSs/TWwkqxAnBjVzd/u6lg619/+QP64Fh65b
 /oFGZCFT1d1IUISWXdfdJvyFjxBcXq8gYDxQjfhbAaelE75Nu82znGH7TZHdcUcQvk3E
 EOsg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.34.10 AUTH)
 with ESMTPSA id j03bcbxB2Ev7pxz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 2 Dec 2021 15:57:07 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: dt-bindings: qcom: Document qcom,
 msm8916-qdsp6-sndcard compatible
Date: Thu,  2 Dec 2021 15:55:04 +0100
Message-Id: <20211202145505.58852-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

There are two possible audio setups on MSM8916/APQ8016: Normally the audio
is routed through the audio/modem DSP (covered by the qdsp6 driver). During
upstreaming for the DragonBoard 410c it was decided to bypass it and
instead talk directly to the audio controller using the "lpass" driver.

Bypassing the DSP gives more control about the audio configuration but limits
the functionality: For example, routing audio through the audio/modem DSP is
strictly required for voice call audio. Also, without the special changes in
the DB410c firmware other MSM8916 devices can only use the bypass as long as
the modem DSP is not started. Otherwise, the firmware will assume control of
the LPASS hardware block and audio is no longer functional.

Add support for using the DSP audio setup instead using a new
"qcom,msm8916-qdsp6-sndcard" compatible. It is basically a mixture of
the apq8016-sbc-sndcard and the newer sm8250-sndcard, which uses
indirect QDSP6 DAI links instead of the direct LPASS DAI links.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/sound/qcom,sm8250.yaml           | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 97f13a0a71a9..e50964c54bb9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,apq8016-sbc-sndcard
+      - qcom,msm8916-qdsp6-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
 
@@ -91,6 +92,7 @@ allOf:
           contains:
             enum:
               - qcom,apq8016-sbc-sndcard
+              - qcom,msm8916-qdsp6-sndcard
     then:
       properties:
         reg:
@@ -239,3 +241,43 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    #include <dt-bindings/sound/qcom,q6asm.h>
+    sound@7702000 {
+        compatible = "qcom,msm8916-qdsp6-sndcard";
+        reg = <0x07702000 0x4>, <0x07702004 0x4>;
+        reg-names = "mic-iomux", "spkr-iomux";
+
+        model = "msm8916";
+        audio-routing =
+            "AMIC1", "MIC BIAS Internal1",
+            "AMIC2", "MIC BIAS Internal2",
+            "AMIC3", "MIC BIAS Internal3";
+        aux-devs = <&speaker_amp>;
+
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&cdc_pdm_lines_act>;
+        pinctrl-1 = <&cdc_pdm_lines_sus>;
+
+        mm1-dai-link {
+            link-name = "MultiMedia1";
+            cpu {
+                sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+            };
+        };
+
+        primary-dai-link {
+            link-name = "Primary MI2S";
+            cpu {
+                sound-dai = <&q6afedai PRIMARY_MI2S_RX>;
+            };
+            platform {
+                sound-dai = <&q6routing>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+            };
+        };
+    };
-- 
2.34.1

