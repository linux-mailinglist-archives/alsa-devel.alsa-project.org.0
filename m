Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49D71147E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD49DF6;
	Thu, 25 May 2023 20:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD49DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685040043;
	bh=VAAY/+MJFj1XrcKHKiMSRG7NQwjKRBVFLOzOLTJ3UcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bk07CxHe3IdSNzXumTvIeHu835eEGmW+pfZskKpFfjEf1rj8qFcKKFOEpQPBWibbw
	 NkNbU1j1XH6WtMkqZh0iLjr5EPTp+PRm5+nqHNjtJwzUwLfV37qM1DgHZDvGLsF/HG
	 alzx79xGRORtNnrSE9QkzKUjb41+fI325pF9EqOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1E66F8055C; Thu, 25 May 2023 20:39:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C35F80558;
	Thu, 25 May 2023 20:39:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BF80F8055C; Thu, 25 May 2023 20:39:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84298F80551
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 20:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84298F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E+fU0wTM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D55864929;
	Thu, 25 May 2023 18:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8084BC433EF;
	Thu, 25 May 2023 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039966;
	bh=VAAY/+MJFj1XrcKHKiMSRG7NQwjKRBVFLOzOLTJ3UcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E+fU0wTMoscUDKAq4SWV63IInUt9Bm+giVRp0CgjleA+8qKMcJGHsKt7V8q+UO7bo
	 keWx+OMIbXj6kI+Xw94CXjiEs9gV3/j/av0nDeAduKNGDLH22TehrBocJYj389nWJZ
	 6PUE6+bQabAJ/MCQ0M/TrDZ/7WGcC8Kc7TbJtf/OpBPDmdtJNtjTh3sjVn46Kt8IsE
	 4HtXbMekPOnaGxcDE0x24zE9GPrlS8izHLyLaz8zxvUcYIyB7y2/jWnbc6xOq8fpaZ
	 KJlmlST/sFZGzv2iiZNH4kGgCfwrl2l53pd8jGCuPAFPInA5zqPdv0k2V1hxX+Iamn
	 zm94ZLPZg4HUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	afd@ti.com,
	shifu0704@thundersoft.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 07/43] ASoC: dt-bindings: Adjust #sound-dai-cells
 on TI's single-DAI codecs
Date: Thu, 25 May 2023 14:38:18 -0400
Message-Id: <20230525183854.1855431-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183854.1855431-1-sashal@kernel.org>
References: <20230525183854.1855431-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ATVDY7QGQRUTDADQO6XZC436KIYMW2FP
X-Message-ID-Hash: ATVDY7QGQRUTDADQO6XZC436KIYMW2FP
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATVDY7QGQRUTDADQO6XZC436KIYMW2FP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Martin Povišer <povik+lin@cutebit.org>

[ Upstream commit efb2bfd7b3d210c479b9361c176d7426e5eb8663 ]

A bunch of TI's codecs have binding schemas which force #sound-dai-cells
to one despite those codecs only having a single DAI. Allow for bindings
with zero DAI cells and deprecate the former non-zero value.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org
Link: https://lore.kernel.org/r/20230509153412.62847-1-povik+lin@cutebit.org
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/devicetree/bindings/sound/tas2562.yaml | 6 ++++--
 Documentation/devicetree/bindings/sound/tas2764.yaml | 6 ++++--
 Documentation/devicetree/bindings/sound/tas2770.yaml | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
index acd4bbe697315..4adaf92233c8e 100644
--- a/Documentation/devicetree/bindings/sound/tas2562.yaml
+++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
@@ -52,7 +52,9 @@ properties:
     description: TDM TX current sense time slot.
 
   '#sound-dai-cells':
-    const: 1
+    # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
+    # compatibility but is deprecated.
+    enum: [0, 1]
 
 required:
   - compatible
@@ -69,7 +71,7 @@ examples:
      codec: codec@4c {
        compatible = "ti,tas2562";
        reg = <0x4c>;
-       #sound-dai-cells = <1>;
+       #sound-dai-cells = <0>;
        interrupt-parent = <&gpio1>;
        interrupts = <14>;
        shutdown-gpios = <&gpio1 15 0>;
diff --git a/Documentation/devicetree/bindings/sound/tas2764.yaml b/Documentation/devicetree/bindings/sound/tas2764.yaml
index 5bf8c76ecda11..1ffe1a01668fe 100644
--- a/Documentation/devicetree/bindings/sound/tas2764.yaml
+++ b/Documentation/devicetree/bindings/sound/tas2764.yaml
@@ -46,7 +46,9 @@ properties:
     description: TDM TX voltage sense time slot.
 
   '#sound-dai-cells':
-    const: 1
+    # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
+    # compatibility but is deprecated.
+    enum: [0, 1]
 
 required:
   - compatible
@@ -63,7 +65,7 @@ examples:
      codec: codec@38 {
        compatible = "ti,tas2764";
        reg = <0x38>;
-       #sound-dai-cells = <1>;
+       #sound-dai-cells = <0>;
        interrupt-parent = <&gpio1>;
        interrupts = <14>;
        reset-gpios = <&gpio1 15 0>;
diff --git a/Documentation/devicetree/bindings/sound/tas2770.yaml b/Documentation/devicetree/bindings/sound/tas2770.yaml
index 027bebf4e8cf5..aceba9ed813ef 100644
--- a/Documentation/devicetree/bindings/sound/tas2770.yaml
+++ b/Documentation/devicetree/bindings/sound/tas2770.yaml
@@ -54,7 +54,9 @@ properties:
       - 1 # Falling edge
 
   '#sound-dai-cells':
-    const: 1
+    # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
+    # compatibility but is deprecated.
+    enum: [0, 1]
 
 required:
   - compatible
@@ -71,7 +73,7 @@ examples:
      codec: codec@41 {
        compatible = "ti,tas2770";
        reg = <0x41>;
-       #sound-dai-cells = <1>;
+       #sound-dai-cells = <0>;
        interrupt-parent = <&gpio1>;
        interrupts = <14>;
        reset-gpio = <&gpio1 15 0>;
-- 
2.39.2

