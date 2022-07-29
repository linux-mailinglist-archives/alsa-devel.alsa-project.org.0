Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EE9584DE0
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 11:10:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 309551675;
	Fri, 29 Jul 2022 11:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 309551675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659085847;
	bh=1kiaumpZYSpUvwnJefPlp+ypOuilzkCh5+6qePnfjyo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rEV7pNBnb0HBiQQ/LMB2HknLOiQjhZ1VI10GlsH8H8c+aASMU24m5DeVT218JiC9N
	 va5OgF7NIp9vZU3ZplVJ0aERYlKCRpsSCjqWBHX6nGR1oavDA4G+gtY9FacSVm8v5m
	 SZiW8vzhnDO4IBVtC+YfWzrAJBd4yHM2j4G36Yho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03871F80548;
	Fri, 29 Jul 2022 11:09:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71C39F8015B; Fri, 29 Jul 2022 11:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NO_DNS_FOR_FROM,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0A39F80224
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 11:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A39F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KSvU33lv"
Received: by mail-pl1-x62c.google.com with SMTP id y15so4041500plp.10
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 02:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hCbUDfewVNfxco0jKTNS446yrXoa8F7t2H5Ga7NL5pw=;
 b=KSvU33lvVjaXWP9ysUOK/wPTjk/mtsTWRhVl425C/RkAOhkyKgWN9h2hqBuLvJAAbW
 iofrSIb+EGHDrx883BnQFKM0yKLsvTwkw5L9+UhE5sm1qrESrhl/rzXK7hFlY3pycKKH
 S7NOu4AXE2812CtB1kz3rsRgmI+5XmG+RUCdH7fxb+/D7WjkiKCpVnL8BWbN35yjLQUF
 o5gFRX8o96hc/tp+uL6eNKwFcRcw0mkw16S4aNh0pl7NGYtbYWt5clJW5bPmTUpmxnD/
 9xPqcI5UEQaOqHftXBKeqNxkfNZ77bs5TvrNG3OiyZT3tlsmEkDwuhRscpRhkKXP0DLC
 b4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hCbUDfewVNfxco0jKTNS446yrXoa8F7t2H5Ga7NL5pw=;
 b=5BsJOaonKPrdbpa9Qe2i3bdJZ9dyjoHO3PlflvzGNk8qrtoVFALXm1AhoU6H3NjgtL
 grIRkqJH9su5unJdlQcBWOZe5fmjxIVss86EEnIGJ29hk7fk2tEB3WbDH0JW6opGo6mH
 NeW5OBhSpJk1wT7GF/2iY39Czxqbj+9GrY15VUsPNx5ftdmjSYmpYk3X+Z0rTBZFcwqK
 8u9vVCNEU5UPLg3QFyMzBkXQjfoImAP2BchSI5vLUrsleH/xLEcJCF2CSW4/mgsjX+AR
 Cr15DY5j8UBQn5RbX7zPnxR1YQGio9I47hlAblVazjfylbsXRwSMfLaR9rE/oxywkGic
 bZHA==
X-Gm-Message-State: ACgBeo0AWNnnOZAr6IA4acU6oj4DxcWQ/o2TTTiiXkEj8qJNnEsezAsL
 TE7wXgIg8g07hZwU8vBG54qGFvnz8oQXRFVN
X-Google-Smtp-Source: AA6agR7mSPMQjbv34yhsmlYgC5w2oGSgf9nxlR/7bSoxSsjeEQYz1ShM0oyPzjva5iMt43bk5qKOpA==
X-Received: by 2002:a17:902:b10a:b0:16c:51cd:a6f with SMTP id
 q10-20020a170902b10a00b0016c51cd0a6fmr2846747plr.42.1659085749274; 
 Fri, 29 Jul 2022 02:09:09 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.140])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170902ea0300b0016d763967f8sm2954832plg.107.2022.07.29.02.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:09:09 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 2/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
Date: Fri, 29 Jul 2022 17:08:57 +0800
Message-Id: <20220729090857.579785-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729090857.579785-1-zhuning0077@gmail.com>
References: <20220729090857.579785-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: robh@kernel.org, Zhu Ning <zhuning0077@gmail.com>,
 devicetree@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, Zhu Ning <zhuning@everest-semi.com>,
 David Yang <yangxiaohua@everest-semi.com>
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
----
v4 add properity for reg58 and reg59
---
 .../bindings/sound/everest,es8326.yaml        | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/sound/everest,es8326.=
yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8326.yaml b/=
Documentation/devicetree/bindings/sound/everest,es8326.yaml
new file mode 100755
index 000000000000..d957211516f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
@@ -0,0 +1,116 @@
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
+      Bit(2) decides whether the button on the headset is inverted.=0D
+      Bit(1)/(0) decides the mic properity to be OMTP/CTIA or auto.=0D
+    $ref: /schemas/types.yaml#/definitions/uint8=0D
+    minimum: 0x00=0D
+    maximum: 0x0f=0D
+    default: 0x0f=0D
+  =0D
+  everest,mic1-src:=0D
+    description:=0D
+      the value of reg 2A when headset plugged.=0D
+    $ref: /schemas/types.yaml#/definitions/uint8=0D
+    minimum: 0x00=0D
+    maximum: 0x77=0D
+    default: 0x22=0D
+=0D
+  everest,mic2-src:=0D
+    description:=0D
+      the value of reg 2A when headset unplugged.=0D
+    $ref: /schemas/types.yaml#/definitions/uint8=0D
+    minimum: 0x00=0D
+    maximum: 0x77=0D
+    default: 0x44=0D
+=0D
+  everest,jack-detect-inverted:=0D
+    description:=0D
+      Defined to invert the jack detection.=0D
+    $ref: /schemas/types.yaml#/definitions/flag=0D
+=0D
+  everest,interrupt-src:=0D
+    description:=0D
+      value of reg 0x58, Defines the interrupt source.=0D
+      Bit(2) 1 means button press triggers irq, 0 means not.=0D
+      Bit(3) 1 means PIN9 is the irq source for jack detection. When set t=
o 0,=0D
+      bias change on PIN9 do not triggers irq.=0D
+      Bit(4) 1 means PIN27 is the irq source for jack detection.=0D
+      Bit(5) 1 means PIN9 is the irq source after MIC detect.=0D
+      Bit(6) 1 means PIN27 is the irq source after MIC detect.=0D
+    $ref: /schemas/types.yaml#/definitions/uint8=0D
+    minimum: 0=0D
+    maximum: 0x3c=0D
+    default: 0x08=0D
+=0D
+  everest,interrupt-clk:=0D
+   description:=0D
+     value of reg 0x59, Defines the interrupt output behavior.=0D
+     Bit(0-3) 0 means irq pulse equals 512*internal clock=0D
+       1 means irq pulse equals 1024*internal clock=0D
+       2 means ...=0D
+       7 means irq pulse equals 65536*internal clock=0D
+       8 means irq mutes PA=0D
+       9 means irq mutes PA and DAC output=0D
+     Bit(4) 1 means we invert the interrupt output.=0D
+     Bit(6) 1 means the chip do not detect jack type after button released=
.=0D
+       0 means the chip detect jack type again after button released.=0D
+  $ref: /schemas/types.yaml#/definitions/uint8=0D
+  minimum: 0=0D
+  maximum: 0x7f=0D
+  default: 0x45=0D
+=0D
+required:=0D
+  - compatible=0D
+  - reg=0D
+  - "#sound-dai-cells"=0D
+=0D
+additionalProperties: false=0D
+=0D
+examples:=0D
+  - |=0D
+    i2c {=0D
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
+        everest,interrupt-src =3D [08];=0D
+        everest,interrupt-clk =3D [45];=0D
+      };=0D
+    };=0D
--=20
2.36.1

