Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD290571D29
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 16:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8364F16C5;
	Tue, 12 Jul 2022 16:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8364F16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657637064;
	bh=72KPcTc9qgkUq28qh2yNrajpqFWWTqZPmZvHKFDySok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtACVttpCMn63IzJQWJQ1DrvW5baVUeCdpZc/1bGh9Xpksx34/whFwar0kTQsncdk
	 +LJQJ7J5y3DnupSn0dp5SnbkH8W3wK+JMA+N6NFUZFaPeG9H03eOUTYh0WOemAMYyj
	 wiG2wD9TPSVnlmHhfyn7wShtizNMuTJSE9pALCZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B720F8054A;
	Tue, 12 Jul 2022 16:43:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC35F80543; Tue, 12 Jul 2022 16:43:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 043D4F80543
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 16:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 043D4F80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hxdO99r9"
Received: by mail-pj1-x102b.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso8224450pjj.5
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=hxdO99r9yfyFCMgEwYQm1d/CV6Xfyd3Zj4Os/HzbADD63tkQUVmVVf/BUKU8wQAx0D
 5RMsF3wFikKT26yMdzmb2PmJ9/biP3ewiC0bTw8Yw/PHONJjAgA19yIhck53DPjd6MLZ
 gRX/Bu1XCmhxzWQuKyJ6xl2J1q3iQhs1daBFKbl9aiZ3Ts1DamW5tAfpmaFnPZkw7/iB
 XwBIbZAj9sniPllbVgBYtvVzwwgIaGFdjcJPo2VFNlYzfJ99Vl87Qxu+xHmUe+PbNS2q
 0agEP9WmXNZ1wqARJayEDYEhtmsixt74ZpRvy1WUev2S5oBOxPeUal50PDa1RaJIBhgL
 qyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y1MIWnHCM+GAst9qr5uT5FWNOFAzzBmNsrQ4ccKB8sg=;
 b=xZxaMTEVphBHxHJmk83Bcbk6A7X/KiBv8toX7kg8kSTJV94IF2xkmyQvAgQ67l5WfO
 4DtutUtTrHs3y4tBXE3/+noa1Ub0Ft/IYft5YpKQkm6FK6gYFtVV9JmkQjo12ckGWY1b
 ChqUvhhld+9RYZTphMMkV1uasDu9K8X2js1mKeBsz4CCJIcO3ZgFlh5tYQ71/6DARzJg
 C1Cs60TNzRg64ggoBOSu26lgMXxvX49O07jMmjvH5qvieFi89p8traq7gOwhYGWSGOim
 47jJD7TC1/T9Wxl6jgBjCwD/ZNFpYGfPUowssudObd/I7p7E0OuaApxQoDvuB7sdWX4K
 Q/9g==
X-Gm-Message-State: AJIora8bRqLKyfhhCCeLmvthb+fQt/+s/KXUgBGrz2NvWt/bK6/ICm4Q
 nuGCBUe73I3vxktoQtTyCRd8iTy/H9A5y/mc
X-Google-Smtp-Source: AGRyM1uRMDszTYaHsYgtxaU+XxR+k5FcjJVbUUCzasYU6YdZfCL4lfVhqr2hetg5pdK5XfhXuRUfAQ==
X-Received: by 2002:a17:90b:4c86:b0:1f0:3255:542e with SMTP id
 my6-20020a17090b4c8600b001f03255542emr4816026pjb.119.1657636988815; 
 Tue, 12 Jul 2022 07:43:08 -0700 (PDT)
Received: from a-VirtualBox.. ([101.224.225.209])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a170902780e00b001620960f1dfsm6952748pll.198.2022.07.12.07.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 07:43:08 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] dt-bindings: sound: es8326: Add dtbindings documentation
Date: Tue, 12 Jul 2022 22:41:53 +0800
Message-Id: <20220712144153.6631-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712144153.6631-1-zhuning0077@gmail.com>
References: <20220712144153.6631-1-zhuning0077@gmail.com>
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

