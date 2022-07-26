Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6B58140D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 15:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F71E15E5;
	Tue, 26 Jul 2022 15:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F71E15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658841585;
	bh=72KPcTc9qgkUq28qh2yNrajpqFWWTqZPmZvHKFDySok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tiVKNERQYWzHivuUBQFugdjC2fK/u5VXWddqYozFi7vB2fGqgfJSlsY/Xx8G8J7xS
	 rqWylzbchF3OGraGmXi9OGS65kZ5tkYk47XH46K/3M0BMCYyuYC4Db544LRTYVzyVj
	 EiEv3n/8sNAa0TrzKkg2Ax7dnr37ZQeDvrG68UT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23CB6F80544;
	Tue, 26 Jul 2022 15:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B90CEF80544; Tue, 26 Jul 2022 15:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A919F80238
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 15:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A919F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o1HzOE9l"
Received: by mail-pg1-x52e.google.com with SMTP id f11so13115089pgj.7
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=o1HzOE9lUNVPGwqVE2FDPK2rOjOpLpgApfnD7kpTCXkG8EI30Vq5i13MZ5OMR8Zdt7
 AE/awwN36Dj98SubOLFQHyBF3uRf+JNhy3NHAhJeYbzg4g8BmHAlkWxZt9nLkCs3DvaR
 KnwK32oVM5srGEDtPXYIeqb4rkvKzy5XVYTN0yyb1oSIuv71yXS7NtvVHBlGKzZcC10C
 Ku2MMd0GNgyyFDIqKwz+LcDZLW0Sy/3KZ1Ra8emHI2m0YK+18myNaJUbEn6R2/ZIH1TZ
 peZJ5H1mXP6eDGyhRSG1rKEUCOcKy9rc6gO/7WJUusQGqNYF/oMsZT4RHLldnVA89kJr
 qwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=C4+BmXoDjFrWdGru0jpz5AFHj9JGXeygqhIjrkXQ1cjamK6eUw8GO1t9AWzemNYGN5
 wsus3P5pIt5OxFOmKdvz1LMn0z/UJ/65jCPh0Jc1NcZ8CoTPgwgEcuOFpueMJOkCLLK6
 Mz8qhrWnyJYNw/wHFKH+2thrMLZb+eXQ7De/3MKfI4gHTe0lpOTdZiEg+TaaQnU+EZ84
 oefoUQhSSPVSsCdkwRgsKg1Tz0Kc2YrxWMejjg25bqUp2L4punxj4Rz/Ky2aaoqui3n1
 gukUTvTldP3l1gJwLPhieoatWZwtq15qg82dooVhWnvXWhJt0UxJ1WzO9J7YlgCDq8IE
 jhTg==
X-Gm-Message-State: AJIora80wr5xdBVUOL2du1uJkQqyCf3CXUwB5bD4AnVFXtOg5MF3HwaN
 kLfBHylgP8+/xh7r+BIxgWR4cVVDBvZC6JelVvs=
X-Google-Smtp-Source: AGRyM1vYo1jZTJrNdxAIRCKJQ9eRaZlRJ156Fc326My3lXKm/sEHa+Rib2ZfX54N27PMqc2QQOOsuQ==
X-Received: by 2002:a05:6a00:21c5:b0:52b:fc9c:295b with SMTP id
 t5-20020a056a0021c500b0052bfc9c295bmr8184968pfj.56.1658841489433; 
 Tue, 26 Jul 2022 06:18:09 -0700 (PDT)
Received: from a-VirtualBox.tendawifi.com ([101.224.225.209])
 by smtp.gmail.com with ESMTPSA id
 ru6-20020a17090b2bc600b001f229f8d7bdsm11227459pjb.16.2022.07.26.06.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 06:18:09 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 2/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
Date: Tue, 26 Jul 2022 21:17:47 +0800
Message-Id: <20220726131747.127992-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726131747.127992-1-zhuning0077@gmail.com>
References: <20220726131747.127992-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: robh@kernel.org, ckeepax@opensource.cirrus.com,
 Zhu Ning <zhuning0077@gmail.com>, devicetree@vger.kernel.org,
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

