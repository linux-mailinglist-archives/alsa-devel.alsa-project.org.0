Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C949230B30
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 15:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE1E16B0;
	Tue, 28 Jul 2020 15:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE1E16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595942006;
	bh=XUk5Rs2/v9YoPU2zbQOLk+GG/ENE+EAohbsfSaezrNA=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=knQ8WQ0fO3r6dtz5uAFDpVPx/Jtrn4ZKdi+c9Q3kCv5AvSGorGUmYvjB/klYibDOx
	 /uZ5SIIqCphmf19CgH53kQTlZoMHlObT0EnX2C5ZavxZp7VN4hbEv0W88ckjvQ9HOH
	 5E7FUbDXijF7+py76BqvxvcrqNA8MuvIQbqyIetc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBEC6F8012F;
	Tue, 28 Jul 2020 15:11:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B6C9F8021E; Tue, 28 Jul 2020 15:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E191F800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 15:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E191F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="XNrIdy39"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200728131127euoutp019b95f3b9630329992b68f605a5247944~l7LDSect-1972419724euoutp01u
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 13:11:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200728131127euoutp019b95f3b9630329992b68f605a5247944~l7LDSect-1972419724euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1595941887;
 bh=LxXAXNiNU2/+HZuMBh9dY62HizQSIWMo4cmZejA+I1Q=;
 h=From:To:Cc:Subject:Date:References:From;
 b=XNrIdy395zjmhcghyppKw3D4af+mKZb7IvQOolDzvqfDIcXzz3rr3DOOjsRriqTgF
 KDBH3/jTOK+zCJ1lzNcysWyk6ZdhwG/sHZRHXYXouERaMPeGSD8E38Y4kpXmdGBGsQ
 N2oAXew4/oKjGnNtskfJMHAN37fNWEATRaYKUADM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200728131126eucas1p1c5d36b6ae691176384dee4f62fa200ff~l7LDFoDnl3202632026eucas1p1V;
 Tue, 28 Jul 2020 13:11:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 19.2B.06456.EF3202F5; Tue, 28
 Jul 2020 14:11:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200728131126eucas1p16365622c52f91104373a2cd3e0ebb619~l7LCztZ251537115371eucas1p1l;
 Tue, 28 Jul 2020 13:11:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200728131126eusmtrp2f5371e3065140d16723cde541d90084c~l7LCzC6790544805448eusmtrp2I;
 Tue, 28 Jul 2020 13:11:26 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-85-5f2023fea0e2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 92.85.06017.EF3202F5; Tue, 28
 Jul 2020 14:11:26 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200728131126eusmtip261a0343f852ecdbdfc93314fb68e9cdd~l7LCVXo5e0123701237eusmtip2r;
 Tue, 28 Jul 2020 13:11:26 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Subject: [PATCH v3 1/3] ASoC: samsung: Document DT bindings for Midas sound
 subsystem
Date: Tue, 28 Jul 2020 15:11:09 +0200
Message-Id: <20200728131111.14334-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRmVeSWpSXmKPExsWy7djP87r/lBXiDV6vt7C4cvEQk8XGGetZ
 LaY+fMJmMf/IOVaL8+c3sFvMOL+PyWLtkbvsFq17j7BbHH7Tzmqx5cxtNgcujw2fm9g8Nq3q
 ZPNoWb+JzaNvyypGj8+b5AJYo7hsUlJzMstSi/TtErgyLl3+xFjwX7biUtt11gbGDrEuRk4O
 CQETiV1ne5m7GLk4hARWMEr8WLeBCcL5wigxcWkzG0iVkMBnRondxy1hOl49/sACUbScUeLi
 2Z3McB3Hb95iBKliEzCU6D3aB2aLCKhL3J/RxApSxCxwk1Fi5qY+oLEcHMIC4RJd/cIgJouA
 qkRTdxlIOa+AtcTFyXsYIZbJS6zecABsvoTAezaJ/wsb2SESLhLf1vdB2cISr45vgbJlJP7v
 nM8E0dDMKNGz+zY7hDOBUeL+8QVQY60l7pz7BXYEs4CmxPpd+iCmhICjROtTYQiTT+LGW0GQ
 YmYgc9K26cwQYV6JjjYhiBkqEr9XTWeCsKUkup/8Z4GwPSQ2XHsAVi4kECtxZY3TBEa5WQib
 FjAyrmIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMEqf/Hf+0g/HrpaRDjAIcjEo8vDNE
 FeKFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHLWCGB9MSS
 1OzU1ILUIpgsEwenVAOj0IUpQWJ1bxQTDn169XS26tze7l+Lt6Y+NHzENmflUu3O6lsm8Vbi
 xQs3tHVtKPVJu2nxt3f23Yhah8ogr4MnZz37J8OonvFlwsdJVgInHe4HbZvV46iQdWSuwpNz
 xS95Vuc2VV48yKT75v5ng4X60xKeHtzx5k8B//br3zf+fb7shtE6xYX3ryixFGckGmoxFxUn
 AgBn5i3ADgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsVy+t/xe7r/lBXiDabuVbG4cvEQk8XGGetZ
 LaY+fMJmMf/IOVaL8+c3sFvMOL+PyWLtkbvsFq17j7BbHH7Tzmqx5cxtNgcujw2fm9g8Nq3q
 ZPNoWb+JzaNvyypGj8+b5AJYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV
 9O1sUlJzMstSi/TtEvQyLl3+xFjwX7biUtt11gbGDrEuRk4OCQETiVePP7B0MXJxCAksZZTY
 desZkMMBlJCSmN+iBFEjLPHnWhcbRM0nRomeO29YQBJsAoYSvUf7GEFsEQFNiY55t1lBipgF
 HjJK7D9+HywhLBAqcWH7LWaQoSwCqhJN3WUgYV4Ba4mLk/cwQiyQl1i94QDzBEaeBYwMqxhF
 UkuLc9Nzi430ihNzi0vz0vWS83M3MQIDdNuxn1t2MHa9Cz7EKMDBqMTDO0NUIV6INbGsuDL3
 EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxhNgXZPZJYSTc4HRk9eSbyhqaG5haWhubG5
 sZmFkjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQbGCLun90L8vu9WXqyYLHNG82eBduMe3ll8
 GTVTxZvsLF+y9H4Tcdl4fweHbJLcbeXQolJFx+0Cd+dq8i51imvTZl2f6bKuL1hC/HA6z+vS
 a45zngVNcV/MJbbDYuYGNm1HdotQgXVeTMx7+Fc2fWuUV2zgyrtl7N9/SdX4koJJ16F3ryI+
 eyuxFGckGmoxFxUnAgCaSdh+ZgIAAA==
X-CMS-MailID: 20200728131126eucas1p16365622c52f91104373a2cd3e0ebb619
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200728131126eucas1p16365622c52f91104373a2cd3e0ebb619
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200728131126eucas1p16365622c52f91104373a2cd3e0ebb619
References: <CGME20200728131126eucas1p16365622c52f91104373a2cd3e0ebb619@eucas1p1.samsung.com>
Cc: simon@lineageos.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, robh+dt@kernel.org, m.szyprowski@samsung.com
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

This patch adds documentation of DT biding for the Midas sound complex.
Partially based on the *txt version by Simon Shields <simon@lineageos.org>.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes for v3:
 - change the sound-dai property type in cpu, codec nodes from
   phandle-array to phandle

Changes for v2:
 - fix wrong *-gpios entries in the example,
 - mark sound-dai properties as required.
---
 .../bindings/sound/samsung,midas-audio.yaml        | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
new file mode 100644
index 0000000..1c755de
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung,midas-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Midas audio complex with WM1811 codec
+
+maintainers:
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: samsung,midas-audio
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  cpu:
+    type: object
+    properties:
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle to the I2S controller
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+    properties:
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: phandle to the WM1811 CODEC
+    required:
+      - sound-dai
+
+  samsung,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      List of the connections between audio components; each entry is
+      a pair of strings, the first being the connection's sink, the second
+      being the connection's source; valid names for sources and sinks are
+      the WM1811's pins (as documented in its binding), and the jacks
+      on the board: HP, SPK, Main Mic, Sub Mic, Headset Mic.
+
+  mic-bias-supply:
+    description: Supply for the micbias on the Main microphone
+
+  submic-bias-supply:
+    description: Supply for the micbias on the Sub microphone
+
+  fm-sel-gpios:
+    description: GPIO pin for FM selection
+
+  lineout-sel-gpios:
+    description: GPIO pin for line out selection
+
+required:
+  - compatible
+  - model
+  - cpu
+  - codec
+  - samsung,audio-routing
+  - mic-bias-supply
+  - submic-bias-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    sound {
+        compatible = "samsung,midas-audio";
+        model = "Midas";
+
+        fm-sel-gpios = <&gpaa0 3 GPIO_ACTIVE_HIGH>;
+
+        mic-bias-supply = <&mic_bias_reg>;
+        submic-bias-supply = <&submic_bias_reg>;
+
+        samsung,audio-routing =
+                "HP", "HPOUT1L",
+                "HP", "HPOUT1R",
+
+                "SPK", "SPKOUTLN",
+                "SPK", "SPKOUTLP",
+                "SPK", "SPKOUTRN",
+                "SPK", "SPKOUTRP",
+
+                "RCV", "HPOUT2N",
+                "RCV", "HPOUT2P",
+
+                "IN1LP", "Main Mic",
+                "IN1LN", "Main Mic",
+                "IN1RP", "Sub Mic",
+                "IN1LP", "Sub Mic";
+
+        cpu {
+            sound-dai = <&i2s0>;
+        };
+
+        codec {
+            sound-dai = <&wm1811>;
+        };
+
+    };
-- 
2.7.4

