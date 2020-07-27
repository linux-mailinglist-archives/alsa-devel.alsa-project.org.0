Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B551122F56D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 18:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5637E16A0;
	Mon, 27 Jul 2020 18:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5637E16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595867618;
	bh=9RGr3XfB3A/PzoQvueg3BQCOuzJEKRSLV/anMYNUfkk=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Qnng9QN6IZKQ1IFhQykV/4Ccp7ykuayLqbSElcBcevYfqXOgwu04Evk7ynAsCPa03
	 crSfieBkpaWZhIyOrVj6Pdr93+KQABeYAZAq9EEEHZB9rWEefxH/LyFkoKupP6ldfI
	 HV8Te4QG9CCOiLS0uEpRrTOzK6G/5n5e0uZvm3rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EBA5F800AD;
	Mon, 27 Jul 2020 18:31:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79B29F801EB; Mon, 27 Jul 2020 18:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A50CEF800AD
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 18:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A50CEF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="cd7jWrWQ"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200727163139euoutp01f8bb3cb5ec74617b49d08c800f1bce6c~lqQksnxZg3185831858euoutp019
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 16:31:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200727163139euoutp01f8bb3cb5ec74617b49d08c800f1bce6c~lqQksnxZg3185831858euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1595867499;
 bh=jTQiKidsi9U4IkUX06k/tIsaZ8WnIaGvnDKjEbdxO2I=;
 h=From:To:Cc:Subject:Date:References:From;
 b=cd7jWrWQEevXK+6nbBFCeWY6Dl8k4xptxPCcn5C5T4z7lHfTWTtGzE8dNUOyKnX/9
 dgY5gLqT8JPqulEr53TiRAACRBoYU3Q+HJdi+qsYBkdNq6v2WR5cehNXnB2gas2GPY
 iqrC9yu+1GrNWkcmI4l/ksOFHv/ZmukFL9PSVZNc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200727163139eucas1p29c6efa3b4429c005309bf12e472e2bf7~lqQkZq_HG1104211042eucas1p2u;
 Mon, 27 Jul 2020 16:31:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 6B.8D.05997.B610F1F5; Mon, 27
 Jul 2020 17:31:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e~lqQj9i1qK1544715447eucas1p1p;
 Mon, 27 Jul 2020 16:31:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200727163139eusmtrp17545c4c10fac8e9549cf04ad6299c8a9~lqQj881oX1289612896eusmtrp1T;
 Mon, 27 Jul 2020 16:31:39 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-64-5f1f016b37cb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5B.92.06314.A610F1F5; Mon, 27
 Jul 2020 17:31:38 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200727163138eusmtip21bfd16d666f2a9697697affe193aeb23~lqQjeQhwO0553705537eusmtip2M;
 Mon, 27 Jul 2020 16:31:38 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Subject: [PATCH v2 1/3] ASoC: samsung: Document DT bindings for Midas sound
 subsystem
Date: Mon, 27 Jul 2020 18:30:25 +0200
Message-Id: <20200727163027.9242-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42LZduznOd1sRvl4gy1bZCyuXDzEZLFxxnpW
 i6kPn7BZzD9yjtXi/PkN7BYzzu9jslh75C67ReveI+wWh9+0s1psOXObzYHLY8PnJjaPTas6
 2Txa1m9i8+jbsorR4/MmuQDWKC6blNSczLLUIn27BK6M+xcuMhUslK2Y2TaNpYHxsGgXIyeH
 hICJxMmVvaxdjFwcQgIrGCXevX/FBuF8YZSY+G0zVOYzo8SR1g4mmJZVE65CVS1nlJix4z1C
 y9lb65lBqtgEDCV6j/YxgtgiAuoS92c0gY1iFrjJKDFzUx8bSEJYIFzi8a1XYA0sAqoSRx/u
 AVvBK2AlseR1NwvEOnmJ1RsOMIM0Swi8Z5OYMe0XM0TCRWLGmneMELawxKvjW9ghbBmJ05N7
 WCAamhklenbfZodwJjBK3D++AKrDWuLOuV9AZ3AA3aQpsX6XPkTYUeLLjHOsIGEJAT6JG28F
 QcLMQOakbdOZIcK8Eh1tQhDVKhK/V02HBouURPeT/1A3e0gs3XaaFcQWEoiVeHn0PtsERrlZ
 CLsWMDKuYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECEwXp/8d/7KDcdefpEOMAhyMSjy8
 Gfvl4oVYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0
 xJLU7NTUgtQimCwTB6dUA2P7AqnpXB5TeBZ//cn7bOf3qOx0j+1vwxKj4iuYLzHsXDDz9MUI
 R29H4e7QluKyuuAWLr+u2S45l1005hevCtk5/Yoe3+8nImv0bs1imn7wZecVOYUs/tlHyqeo
 5U+fbTSDRfPOk7VFqswXwxoFGWNUjG8qiB+Sy1qssDK1+th/SV9rBQe2fCWW4oxEQy3mouJE
 AHwzGWITAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsVy+t/xe7pZjPLxBot32lhcuXiIyWLjjPWs
 FlMfPmGzmH/kHKvF+fMb2C1mnN/HZLH2yF12i9a9R9gtDr9pZ7XYcuY2mwOXx4bPTWwem1Z1
 snm0rN/E5tG3ZRWjx+dNcgGsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK
 +nY2Kak5mWWpRfp2CXoZ9y9cZCpYKFsxs20aSwPjYdEuRk4OCQETiVUTrrKB2EICSxklZv2v
 6GLkAIpLScxvUYIoEZb4c60LqIQLqOQTo0TP6kNg9WwChhK9R/sYQWwRAU2Jjnm3WUGKmAUe
 MkrsP34fLCEsECpxeWsvK4jNIqAqcfThHiYQm1fASmLJ624WiA3yEqs3HGCewMizgJFhFaNI
 amlxbnpusaFecWJucWleul5yfu4mRmCAbjv2c/MOxksbgw8xCnAwKvHwZuyXixdiTSwrrsw9
 xCjBwawkwut09nScEG9KYmVValF+fFFpTmrxIUZToOUTmaVEk/OB0ZNXEm9oamhuYWlobmxu
 bGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGxr3h9o8/zE4svXTnEK58f8c92ipdpQMky
 Vi5N5g2WoYf9BJSqjFe0VFw7wFmzvt3i+qfY30GKp+M2rL3/nUk5P0SPt9mg++/Os0ybZ8yq
 u/1+3+Zwphf7XQslWfz3zpZUzWna0HTUrfvXKcbbuRmlkq8cVO51LOnTrzdYOP1150WWfQdv
 5ScpsRRnJBpqMRcVJwIACsSU32YCAAA=
X-CMS-MailID: 20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e
References: <CGME20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e@eucas1p1.samsung.com>
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
Changes for v2:
 - fix wrong *-gpios entries in the example,
 - mark sound-dai properties as required.
---
 .../bindings/sound/samsung,midas-audio.yaml        | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
new file mode 100644
index 0000000..fb685e51
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
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: phandle to the I2S controller
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+    properties:
+      sound-dai:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: phandle to the WM1811 CODEC node
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

