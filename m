Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C8580EE2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 10:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A693D85D;
	Tue, 26 Jul 2022 10:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A693D85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658824036;
	bh=72KPcTc9qgkUq28qh2yNrajpqFWWTqZPmZvHKFDySok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EzT5repOb4llUrTAWRiaPhOzyvZCMqvApeX+blxcZZw7sGk75hpRrtr+eDp1/WosK
	 NkNZkdpnSCd9Re9mWGIXuRMf6uza8/BY75jRot+zQAcr6Sn7MIMqXAFq9SCCkZsL/+
	 gOFriqRT1vfzu/XIIAs0B81pLa1ra1BR+4dH9RwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E55A6F80548;
	Tue, 26 Jul 2022 10:25:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F9FDF80544; Tue, 26 Jul 2022 10:25:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3740CF80153
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 10:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3740CF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hCAMyRX5"
Received: by mail-pf1-x436.google.com with SMTP id d10so12609534pfd.9
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=hCAMyRX5bwda3HXY2lwU+EyjnGLlHgZuasVDr5bzLtOmT92o+1ZiT80LTsgMOvs+vs
 mN6ge2XpEOKH632dXkeQ0tk1tUB8/31iZAnEblxpLRuEZSy71aD/HU1CxuMIfvylCzXv
 FCDkObDuVWq5PeBij4QUGg+Z0gASZST6Xsvrh4T409gkuDMSXlWEvvnc/G8a4ofNR7LJ
 FRGmFtYRQt0eL2qVh9hslZcfL+r/VSsQMBf2RB19g5unRdFViVyZAuNbr1lm8nmyZ1zM
 aZZFRma1hhxZCOW8JXa1J/CgAeXXkIWp/y83NiTLK87R468kiPd0O+npRtWwMrfCxbFA
 wfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=uJsU/wzLCf5/i9eP1OAtD8BLQV9vZttuqjS235JYY1HQDNOnye7i7tmm+1hoN9CzQ5
 pOwMyjxzKInx8q17rN9cu0uQbZ55qnVHCgV5efG/uUrRRDzrWny7fdR6jqeTtCpv5iEh
 1aylYT7XmhxdOeSqWN63W/bB9PlwMwOG/fzbyYKjruD4m1yBqmmtU2WDQCYtLZsuFL08
 e8hz8JuoiNwWP+QMdgeHhUJcKLf+zHjLgF3yQnuLHsZQRazuDewZC6dgiHXHqgFBpTel
 Sxd13+JWSMzk2OB7GyDJAdn+1F04UY/doxXoUagfi+qdik4ledtvsfhrcWXdzBeVQyxm
 MXcA==
X-Gm-Message-State: AJIora+VNQLTI3litEc/pNri7s02rUOBVcqrxodp9RAw3Gohar0gcUYp
 S2OUNS1hD5yzIl7v8G+WrVDmW9fGBuQiJi9c73I=
X-Google-Smtp-Source: AGRyM1ssGcNsC1CNCZvW1Q+AUnTwTpJEiPoGQ8vm7stODtUF5C2WfXk/WXWB3akQBRNsSkhTPvIKoA==
X-Received: by 2002:a63:1a09:0:b0:415:fa9a:ae57 with SMTP id
 a9-20020a631a09000000b00415fa9aae57mr13725105pga.181.1658823938419; 
 Tue, 26 Jul 2022 01:25:38 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.140])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a170902a3c300b0016c6a6d8967sm10783991plb.83.2022.07.26.01.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 01:25:37 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
Date: Tue, 26 Jul 2022 16:25:06 +0800
Message-Id: <20220726082505.125267-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726082505.125267-1-zhuning0077@gmail.com>
References: <20220726082505.125267-1-zhuning0077@gmail.com>
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

