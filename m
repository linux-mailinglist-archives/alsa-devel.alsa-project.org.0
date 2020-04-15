Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC91A95EA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 10:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B6361666;
	Wed, 15 Apr 2020 10:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B6361666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586938502;
	bh=RATGt4gBNU8AVlvWDKbkSxAX72jp3SzOvIStmOeK+LU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NgivIva2+9K6sHiOXdSKarDbhfbgN0J1E6YaVhmOwE1FVyvM2AjVvCJW+Q+yti2TL
	 W3ETo4+tjGp24oiyi/l/CQrWaMI81yB0yxq5ap9rq9iGW2h1axOcppt4MnJ9ddxGUV
	 FMIMHN4lxvSsL9grkoxgleLXFfGHmFcLdRLCcXwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCDD1F8025F;
	Wed, 15 Apr 2020 10:13:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15A74F8025F; Wed, 15 Apr 2020 10:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 615E1F80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 10:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 615E1F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="pptK1fNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586938382;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=MEGcVkcXAjSuizW8Ns4m/GZAOVbeWi0P2cUdPTTRoN8=;
 b=pptK1fNe15JdoNvzeFWwDJ2uuDQUxS10TACaxph4ccA+I4u6V1m4jvWiEHLnpOkdUh
 cRbNjvkIzLAPR0BlC4TeuF+OzpFX07UGuWi61Xh53Jy7/K+F1fRX49tjY9vrUQ4Kwe0/
 3Td9VpixnGSrtvJ7nilFLVtsfbNkB1EeiS3lSRwfEI1rueK2TW3Bhgp9xy2+o9jADO9t
 8acoagNoylyaFWHegdkVsClYYnek1zwerlK66LJ9/1VG2eu8a7E8wrQgty1notNHc2mJ
 gTWRZyOOL39iLFU28kwh9EKFebc3S3JRWNQuF/gzxe1E8yLdYeC4aLDugdtvUm6VKzly
 fUpw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NccuO"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id k074e0w3F8D10Do
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 10:13:01 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: ASoC: qdsp6: Suggest more generic node names
Date: Wed, 15 Apr 2020 10:11:58 +0200
Message-Id: <20200415081159.1098-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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

Change the listed examples to use more generic node names, representing
the class of the device nodes:

  - apr-service@<id>
  - dai@<id>

Both names are already in use in arch/arm64/boot/dts/qcom/sdm845.dtsi.

Also add #address-cells + #size-cells to the q6asm example,
without them the example produces dtc warnings.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/sound/qcom,q6adm.txt  |  2 +-
 .../devicetree/bindings/sound/qcom,q6afe.txt  | 46 +++++++++----------
 .../devicetree/bindings/sound/qcom,q6asm.txt  |  7 ++-
 .../devicetree/bindings/sound/qcom,q6core.txt |  2 +-
 4 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm.txt b/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
index bbae426cdfb1..15c353a20de8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
@@ -29,7 +29,7 @@ used by the apr service device.
 	Definition: Must be 0
 
 = EXAMPLE
-q6adm@8 {
+apr-service@8 {
 	compatible = "qcom,q6adm";
 	reg = <APR_SVC_ADM>;
 	q6routing: routing {
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
index d74888b9f1bb..4916dd6a0896 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
@@ -100,7 +100,7 @@ configuration of each dai. Must contain the following properties.
 
 = EXAMPLE
 
-q6afe@4 {
+apr-service@4 {
 	compatible = "qcom,q6afe";
 	reg = <APR_SVC_AFE>;
 
@@ -110,12 +110,12 @@ q6afe@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		hdmi@1 {
-			reg = <1>;
+		dai@1 {
+			reg = <HDMI_RX>;
 		};
 
-		tdm@24 {
-			reg = <24>;
+		dai@24 {
+			reg = <PRIMARY_TDM_RX_0>;
 			qcom,tdm-sync-mode = <1>:
 			qcom,tdm-sync-src = <1>;
 			qcom,tdm-data-out = <0>;
@@ -125,8 +125,8 @@ q6afe@4 {
 
 		};
 
-		tdm@25 {
-			reg = <25>;
+		dai@25 {
+			reg = <PRIMARY_TDM_TX_0>;
 			qcom,tdm-sync-mode = <1>:
 			qcom,tdm-sync-src = <1>;
 			qcom,tdm-data-out = <0>;
@@ -135,43 +135,43 @@ q6afe@4 {
 			qcom,tdm-data-align = <0>;
 		};
 
-		prim-mi2s-rx@16 {
-			reg = <16>;
+		dai@16 {
+			reg = <PRIMARY_MI2S_RX>;
 			qcom,sd-lines = <0 2>;
 		};
 
-		prim-mi2s-tx@17 {
-			reg = <17>;
+		dai@17 {
+			reg = <PRIMARY_MI2S_TX>;
 			qcom,sd-lines = <1>;
 		};
 
-		sec-mi2s-rx@18 {
-			reg = <18>;
+		dai@18 {
+			reg = <SECONDARY_MI2S_RX>;
 			qcom,sd-lines = <0 3>;
 		};
 
-		sec-mi2s-tx@19 {
-			reg = <19>;
+		dai@19 {
+			reg = <SECONDARY_MI2S_TX>;
 			qcom,sd-lines = <1>;
 		};
 
-		tert-mi2s-rx@20 {
-			reg = <20>;
+		dai@20 {
+			reg = <TERTIARY_MI2S_RX>;
 			qcom,sd-lines = <1 3>;
 		};
 
-		tert-mi2s-tx@21 {
-			reg = <21>;
+		dai@21 {
+			reg = <TERTIARY_MI2S_TX>;
 			qcom,sd-lines = <0>;
 		};
 
-		quat-mi2s-rx@22 {
-			reg = <22>;
+		dai@22 {
+			reg = <QUATERNARY_MI2S_RX>;
 			qcom,sd-lines = <0>;
 		};
 
-		quat-mi2s-tx@23 {
-			reg = <23>;
+		dai@23 {
+			reg = <QUATERNARY_MI2S_TX>;
 			qcom,sd-lines = <1>;
 		};
 	};
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
index 9f5378c51686..6b9a88d0ea3f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
@@ -51,13 +51,16 @@ configuration of each dai. Must contain the following properties.
 
 = EXAMPLE
 
-q6asm@7 {
+apr-service@7 {
 	compatible = "qcom,q6asm";
 	reg = <APR_SVC_ASM>;
 	q6asmdai: dais {
 		compatible = "qcom,q6asm-dais";
+		#address-cells = <1>;
+		#size-cells = <0>;
 		#sound-dai-cells = <1>;
-		mm@0 {
+
+		dai@0 {
 			reg = <0>;
 			direction = <2>;
 			is-compress-dai;
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6core.txt b/Documentation/devicetree/bindings/sound/qcom,q6core.txt
index 7f36ff8bec18..5cd4cc9b1fde 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6core.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6core.txt
@@ -15,7 +15,7 @@ used by the apr service device.
 		   example "qcom,q6core-v2.0"
 
 = EXAMPLE
-q6core@3 {
+apr-service@3 {
 	compatible = "qcom,q6core";
 	reg = <APR_SVC_ADSP_CORE>;
 };
-- 
2.26.1

