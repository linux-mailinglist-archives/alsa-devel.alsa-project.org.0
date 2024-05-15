Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C88C67EF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 15:57:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C45F52;
	Wed, 15 May 2024 15:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C45F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715781443;
	bh=eabz4GgYDn942CfDZ8D26pfk1npa546nY9iinZnWrdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LekFrHDOScTHIM0Rxd/hPpAJN8EXKyfjco2ogcj9wtFHbI795DgrYKSA8OdbNR6xi
	 4ecus7mCRjkk+ZIYwTjapjoXdWigFkqkuyoTitr/7QwwleERE5Bb+jPgoqqGOnuUch
	 niPH8uAxolqzwcOG9F9Qafnz+qsjnBKrgoRPWuY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BE3FF806CE; Wed, 15 May 2024 15:55:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3333F806AE;
	Wed, 15 May 2024 15:55:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89762F8061E; Wed, 15 May 2024 15:54:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7E98F805BF
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 15:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7E98F805BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=pdQ4Mq0i
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D2B9A9C5919;
	Wed, 15 May 2024 09:54:39 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id B-UyXQ4qtgDB; Wed, 15 May 2024 09:54:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9A8799C5914;
	Wed, 15 May 2024 09:54:38 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 9A8799C5914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715781278; bh=TiWe8m0yVFVcnZsPsZe5x6KEea1KRMwl0I5JQakBY2M=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pdQ4Mq0iZjl2TkzmOf4FJxLg2Sl4UBb6l54c+UBcIUPliB/6rYLFRWBja3GGT8ToT
	 nHAMTYqrLAKrpgSLdwgRFxC2XG0IgnMYLBpx/lZzOS+Ot0PG3ANDJrOIXRHSkyQFBa
	 YXkldlHJ26PucTH7Mv5L+z/N1GnL4pcQic+c1o2s7pMrh+F41Vh0JSMRR9owghL3ce
	 ePu/SVrj7emJBXkoQkmMzCPEhuykRHdN7OW+DBe3FtoM5d3BgZBB3k2nsikuvOAyEs
	 GWraoEnfNcToIgyl20UqGd5BbPdeo3lQrKHXUtvPtcGeAyjZC9cawAd2yA2+kSeCJd
	 iSU/p3NCOyp4w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id urI44xdnneys; Wed, 15 May 2024 09:54:38 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A3E069C5915;
	Wed, 15 May 2024 09:54:36 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible for
 generic codec
Date: Wed, 15 May 2024 15:54:11 +0200
Message-Id: <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: S7GZYYAPWPYOCMWICTRQIOGZM25LJULJ
X-Message-ID-Hash: S7GZYYAPWPYOCMWICTRQIOGZM25LJULJ
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7GZYYAPWPYOCMWICTRQIOGZM25LJULJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add documentation about new dts bindings following new support
for compatible "fsl,imx-audio-generic".

Some CPU DAI don't require a real audio codec. The new compatible
"fsl,imx-audio-generic" allows using the driver with codec drivers
SPDIF DIT and SPDIF DIR as dummy codecs.
It also allows using not pre-configured audio codecs which
don't require specific control through a codec driver.

The new dts properties give the possibility to set some parameters
about the CPU DAI usually set through the codec configuration.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 .../bindings/sound/fsl-asoc-card.yaml         | 96 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml b/D=
ocumentation/devicetree/bindings/sound/fsl-asoc-card.yaml
index 9922664d5ccc..332d8bf96e06 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
@@ -23,6 +23,16 @@ description:
   and PCM DAI formats. However, it'll be also possible to support those non
   AC'97/I2S/PCM type sound cards, such as S/PDIF audio and HDMI audio, as
   long as the driver has been properly upgraded.
+  To use CPU DAIs that do not require a codec such as an S/PDIF controller,
+  or to use a DAI to output or capture raw I2S/TDM data, you can
+  use the compatible "fsl,imx-audio-generic".
+
+definitions:
+  imx-audio-generic-dependency:
+    properties:
+      compatible:
+        contains:
+          const: fsl,imx-audio-generic
=20
 maintainers:
   - Shengjiu Wang <shengjiu.wang@nxp.com>
@@ -81,6 +91,7 @@ properties:
               - fsl,imx-audio-wm8960
               - fsl,imx-audio-wm8962
               - fsl,imx-audio-wm8958
+              - fsl,imx-audio-generic
=20
   model:
     $ref: /schemas/types.yaml#/definitions/string
@@ -93,8 +104,14 @@ properties:
       need to add ASRC support via DPCM.
=20
   audio-codec:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: The phandle of an audio codec
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The phandle of an audio codec.
+      If using the "fsl,imx-audio-generic" compatible, give instead a pair=
 of
+      phandles with the spdif_transmitter first (driver SPDIF DIT) and the
+      spdif_receiver second (driver SPDIF DIR).
+    items:
+      maxItems: 1
=20
   audio-cpu:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -150,8 +167,8 @@ properties:
     description: dai-link uses bit clock inversion.
=20
   mclk-id:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description: main clock id, specific for each card configuration.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Main clock id for each codec, specific for each card conf=
iguration.
=20
   mux-int-port:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -167,10 +184,68 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of an CPU DAI controller
=20
+  # Properties relevant only with "fsl,imx-audio-generic" compatible
+  dai-tdm-slot-width:
+    description: See tdm-slot.txt.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  dai-tdm-slot-num:
+    description: See tdm-slot.txt.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  clocks:
+    description: |
+      The CPU DAI system clock, used to retrieve
+      the CPU DAI system clock frequency with the generic codec.
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: cpu_sysclk
+
+  cpu-system-clock-direction-out:
+    description: |
+      Specifies cpu system clock direction as 'out' on initialization.
+      If not set, direction is 'in'.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+dependencies:
+  dai-tdm-slot-width:
+    $ref: "#/definitions/imx-audio-generic-dependency"
+  dai-tdm-slot-num:
+    $ref: "#/definitions/imx-audio-generic-dependency"
+  clocks:
+    $ref: "#/definitions/imx-audio-generic-dependency"
+  cpu-system-clock-direction-out:
+    $ref: "#/definitions/imx-audio-generic-dependency"
+
 required:
   - compatible
   - model
=20
+allOf:
+  - if:
+      $ref: "#/definitions/imx-audio-generic-dependency"
+    then:
+      properties:
+        audio-codec:
+          items:
+            - description: SPDIF DIT phandle
+            - description: SPDIF DIR phandle
+        mclk-id:
+          maxItems: 1
+          items:
+            minItems: 1
+            maxItems: 2
+    else:
+      properties:
+        audio-codec:
+          maxItems: 1
+        mclk-id:
+          maxItems: 1
+          items:
+            maxItems: 1
+
 unevaluatedProperties: false
=20
 examples:
@@ -195,3 +270,16 @@ examples:
              "AIN2L", "Line In Jack",
              "AIN2R", "Line In Jack";
     };
+
+  - |
+    #include <dt-bindings/clock/imx8mn-clock.h>
+    sound-spdif-asrc {
+      compatible =3D "fsl,imx-audio-generic";
+      model =3D "spdif-asrc-audio";
+      audio-cpu =3D <&spdif>;
+      audio-asrc =3D <&easrc>;
+      audio-codec =3D <&spdifdit>, <&spdifdir>;
+      clocks =3D <&clk IMX8MN_CLK_SAI5_ROOT>;
+      clock-names =3D "cpu_sysclk";
+      cpu-system-clock-direction-out;
+    };
--=20
2.34.1

