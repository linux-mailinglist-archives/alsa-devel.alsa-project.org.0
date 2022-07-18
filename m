Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D13577A67
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 07:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80AC21775;
	Mon, 18 Jul 2022 07:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80AC21775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658122471;
	bh=72KPcTc9qgkUq28qh2yNrajpqFWWTqZPmZvHKFDySok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XdQFeEVwhpFNCllztHtdRPC0eZPr5I9GaonpvuQOfy7FhVEBlDJS3pAzqfbYpLsdS
	 /O/MwAdzEVTnUCygEhWwvzhwzXs6Eg4sUYwQ2yYYqUAvgifqSn6zigikGExj8fMyFT
	 +7s2raX8JDYe28biSNRU2n46TcOC2XEJTSBcke/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E04E6F80544;
	Mon, 18 Jul 2022 07:33:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90360F80508; Mon, 18 Jul 2022 07:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43E52F80430
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 07:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43E52F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ub3V4kc6"
Received: by mail-pg1-x531.google.com with SMTP id s206so9648886pgs.3
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 22:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=Ub3V4kc6uYBT+k7hO9YNU7BjpbU6FMDrE+unXj904tiry9yZTcUqRTK3YPKFhFUG/L
 4zEDC+SOhBeqj24B8X0IrG+Tz4NSX8hq7HkYnNVMZZYOqKvcVGn4j7p8DdKGlmRQEu+T
 HTxiA0RAslNanpH9isa3mAheR0dQXzDNBBQXEoMAta2iPhjV4c9faklZFCoObTMpqAyC
 Hnivu/7HrHz5mEgx8weqAfVV5GOUEjHNtGRMtI1Ij3fCBeTpFZZZSESbhdHPB3B7+nRO
 reIV2BYXIV4XMltG1kNXqOwFFMzMKoPg5fibDqta+p+5LPdKW6x4F9QV+5pgOsSHi8KG
 vk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=rR7zs3afU5EZjy5gr5oiWGkIrVU2CnX/sU5EDgy2xvMjDRwJcC8ITPjnGvpwtchBgC
 VxYgLQGdJnirH1Eb8+7MgbiywNd5uNHxCywwNDWlyQ6FJCrG+RlnLxllmPrrjsSMkKiz
 aMcueyeR+HrBiBhDbJLTTAW9TNIELSslZg4EX3vOQGlGD7a1R9nlyVYhURwclBQX204K
 ztbNKt7KXwkmN73aCpd73B+niR43zR8RqFjT3QHBGoiMI550F6I25RTS7C8LVGAfyJU3
 loAW5yNg9o73pmT3acoT288g5pxcuVSVI95A1AxrAGyidxcXpYNIkzaEMOgVVBUaC/dM
 wROg==
X-Gm-Message-State: AJIora8OSDED/dnwZl073FOraTbnhILy6ir0zyjrwxYEuJK1BOVKROLk
 o7wat7aQjo44DBR8ZdHmjwUGrpVlS2fGXdqh
X-Google-Smtp-Source: AGRyM1uTyVXJX80zULwBp6WzGBGgEFUaO37MFo99BymiR31Ks0Pfy+FNWzMSHEebm2uIzC6Nx2PPRQ==
X-Received: by 2002:a05:6a00:198f:b0:52a:dc25:cc78 with SMTP id
 d15-20020a056a00198f00b0052adc25cc78mr26553547pfl.20.1658122373186; 
 Sun, 17 Jul 2022 22:32:53 -0700 (PDT)
Received: from a-VirtualBox.tendawifi.com ([101.224.225.209])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1709027e8600b0016c1fdaa38fsm8227608pla.231.2022.07.17.22.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 22:32:51 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v1 2/2] dt-bindings: sound: es8326: Add dtbindings
 documentation
Date: Mon, 18 Jul 2022 13:32:37 +0800
Message-Id: <20220718053237.20146-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718053237.20146-1-zhuning0077@gmail.com>
References: <20220718053237.20146-1-zhuning0077@gmail.com>
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

