Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546AA574183
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 04:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E64601775;
	Thu, 14 Jul 2022 04:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E64601775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657766659;
	bh=72KPcTc9qgkUq28qh2yNrajpqFWWTqZPmZvHKFDySok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xeqb7dBQ9PfA9g/Ae3L9/XEx/1WdZgA2oj1MhbJRc9tYEMG5CYQMX1HXCD1d3l96f
	 uEocla+id6SeZ2qVwogwbQp4HwkPeK3t3PVAFFMLXlOE8ogjg0+KMVGNUUyyT5IX7V
	 x1tgiXdrUbEmBXE9lEwU1SqkxBMIHxn0aqhG/FOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1689EF80544;
	Thu, 14 Jul 2022 04:42:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BA8AF80165; Thu, 14 Jul 2022 04:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1360F80152
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 04:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1360F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VGAykDuH"
Received: by mail-pf1-x431.google.com with SMTP id j3so647347pfb.6
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 19:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=VGAykDuHuHB7XHdTzqhGGPh3suNG9ojL3cNOlUVl3wihdFm+242Z2LKa2DhH3BTS7q
 xfxmIbGLCEKKaLEtmagBdiycH1pwsb0/OztOauwure4k2ty3gD1+0l4ZOkFcP7cLy0io
 Sr4R0k4/PV/1FoKbPPsXSiAmfGbSsKF7p0dsmnbY8qZcMEwO2GSThfK4z+g54QgrE1Xg
 W8+zntaX1v264P7G8mQ2UfR1q6fi/AMHXHdpyRCloZnn40oykxaF5KVSn9crK8aKsmDc
 eDbyC4D/j8PYebJHMojPkemKzr2CfLKcNDKjmu9XLqoxBdStrLyPYA5VbXgxVChsWnAj
 NUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=x0GK7SmXB5xjrsWa+Q30yqu6cQkBXIlsYvaIPln+etgu/fpczzyyjA4rn1Hdwbdwl4
 m+x3sdCE94ZBG31jBwa4ThezHNRmCbvJjxv00NUUNor4ZIV06MLQ//iDwkFB+MNkDHgy
 0pe8TySKa/KLAs26xGauLfNtqEvWh1u/gLOE8DbjQoWvvZRixE2vR/uPCY82vYNGJUQt
 OkBUu9qFIb9XJwfGo0Zrd48iB6ljXzSivKLEstiq1HZRcowttqxONuhydFZeG0yuGbzF
 XqCEwKXtKN1dOm4fsUVspfJXwiSHPJOIYa47SAh3c4aDkjVjHMjOgqzQNICMEpol57hb
 lpKg==
X-Gm-Message-State: AJIora+QTJPi/xJjWy86han4zYiC19hy5Tu77HN54JUazyluidA7cuYx
 egFenvoIVsHldnSBzW3syIwFaQXPQddPeQ==
X-Google-Smtp-Source: AGRyM1vHihOayjX1obFQSa35qz0Ym+me7Usz98CaW31Uf+TQO3FBQl35qgY5mbj3IcccLE0CnoUjxw==
X-Received: by 2002:a05:6a00:18a7:b0:51b:c63f:1989 with SMTP id
 x39-20020a056a0018a700b0051bc63f1989mr5961824pfh.49.1657766563617; 
 Wed, 13 Jul 2022 19:42:43 -0700 (PDT)
Received: from a-VirtualBox.. ([116.232.54.164])
 by smtp.gmail.com with ESMTPSA id
 w188-20020a6282c5000000b0052aee60e058sm261125pfd.102.2022.07.13.19.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 19:42:43 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] dt-bindings: sound: es8326: Add dtbindings documentation
Date: Thu, 14 Jul 2022 10:42:03 +0800
Message-Id: <20220714024203.7332-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714024203.7332-1-zhuning0077@gmail.com>
References: <20220714024203.7332-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, Zhu Ning <zhuning0077@gmail.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, broonie@kernel.org,
 Zhu Ning <zhuning@everest-semi.com>, David Yang <yangxiaohua@everest-semi.com>
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

Add device tree binding documentation for Everest ES8326

Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
---
 .../bindings/sound/everest,es8326.yaml        | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/sound/everest,es8326.=
yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8326.yaml b/=
Documentation/devicetree/bindings/sound/everest,es8326.yaml
new file mode 100755
index 000000000000..f6aa3c03d456
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0D
+%YAML 1.2=0D
+---=0D
+$id: http://devicetree.org/schemas/sound/everest,es8326.yaml#=0D
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0D
+=0D
+title: Everest ES8326 audio CODEC=0D
+=0D
+maintainers:=0D
+  - David Yang <yangxiaohua@everest-semi.com>=0D
+=0D
+properties:=0D
+  compatible:=0D
+    const: everest,es8326=0D
+=0D
+  reg:=0D
+    maxItems: 1=0D
+=0D
+  clocks:=0D
+    items:=0D
+      - description: clock for master clock (MCLK)=0D
+=0D
+  clock-names:=0D
+    items:=0D
+      - const: mclk=0D
+=0D
+  "#sound-dai-cells":=0D
+    const: 0=0D
+=0D
+  everest,jack-pol:=0D
+    description:=0D
+      just the value of reg 57. Bit(3) decides whether the jack polarity i=
s inverted.=0D
+      Bit(2) decides whether the bottom on the headset is inverted.=0D
+      Bit(1)/(0) decides the mic properity to be OMTP/CTIA or auto.=0D
+    $ref: /schemas/types.yaml#/definitions/uint8-array=0D
+    minimum: 0=0D
+    maximum: 0x0f=0D
+    default: 0x0f=0D
+  =0D
+  everest,mic1-src:=0D
+    description:=0D
+      the value of reg 2A when headset plugged.=0D
+    $ref: /schemas/types.yaml#/definitions/uint8-array=0D
+    minimum: 0x00=0D
+    maximum: 0x77=0D
+    default: 0x22=0D
+=0D
+  everest,mic2-src:=0D
+    description:=0D
+      the value of reg 2A when headset unplugged.=0D
+    $ref: /schemas/types.yaml#/definitions/uint8-array=0D
+    minimum: 0x00=0D
+    maximum: 0x77=0D
+    default: 0x44=0D
+=0D
+  everest,jack-detect-inverted:=0D
+    description:=0D
+      Defined to invert the jack detection.=0D
+    $ref: /schemas/types.yaml#/definitions/flag=0D
+=0D
+required:=0D
+  - compatible=0D
+  - reg=0D
+  - "#sound-dai-cells"=0D
+=0D
+=0D
+additionalProperties: false=0D
+=0D
+examples:=0D
+  - |=0D
+    i2c0 {=0D
+      #address-cells =3D <1>;=0D
+      #size-cells =3D <0>;=0D
+      es8326: codec@19 {=0D
+        compatible =3D "everest,es8326";=0D
+        reg =3D <0x19>;=0D
+        clocks =3D <&clks 10>;=0D
+        clock-names =3D "mclk";=0D
+        #sound-dai-cells =3D <0>;=0D
+        everest,mic1-src =3D [22];=0D
+        everest,mic2-src =3D [44];=0D
+        everest,jack-pol =3D [0e];=0D
+      };=0D
+    };=0D
--=20
2.36.1

