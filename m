Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA55FFDF1
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:33:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4595BED;
	Sun, 16 Oct 2022 09:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4595BED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905606;
	bh=MME8vNkDo/dREmnTlPV8JDkc6ULErcQtm3OejtSQHeY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QtpSCXIY5taZeORVElHF4pf5f3Ri+Oc2nVt73wtNVEdY4toRUqs3jWbMGup9o9VAJ
	 nfuKWziBra+fO0fWwM4v9gBBaVM2rscBehkxwlrhr2MN8rN1FpDnwWGVXtCE7lPwu1
	 mCNMZy9JXZc5SnJJm2Bp+9nH6zBdN5QuwDOGbdHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67D44F805B2;
	Sun, 16 Oct 2022 09:28:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3A71F80240; Fri, 14 Oct 2022 13:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A44B1F80224
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 13:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A44B1F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="kQNaCz5A"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20221014111018epoutp02bee9dca03a51f8ba5ad896db7606fc18~d6v8CtsY42100821008epoutp02a
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 11:10:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20221014111018epoutp02bee9dca03a51f8ba5ad896db7606fc18~d6v8CtsY42100821008epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1665745818;
 bh=Qw7Z1dzmSAO8dt+O9QgqCihC0iOroNtHcGevkHYv7ZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kQNaCz5AOs3o3ws4DoYzK5M4fRERj6/gYMpEY88aMmel3G4Tki4FjbUDfRL6GaLkk
 JGJuJ2f9YN+/+d93DuyVIP7TSQaBOl49EAbJHJoEuNwSZ4OuhM2juZAuLqn02FlZPc
 sa6Sek0JraP9oiFmqhYyaPZfKfhNUAxK3QafzIx0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20221014111017epcas5p40a8b5d6e9aa30313768a4a5e10b307b1~d6v7uqakf2372423724epcas5p43;
 Fri, 14 Oct 2022 11:10:17 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4MpkFM3tSvz4x9Pp; Fri, 14 Oct
 2022 11:10:15 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A1.21.26992.79349436; Fri, 14 Oct 2022 20:10:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20221014104901epcas5p1a61ea81c3b1640bd8a064633c0b1e40d~d6dWoFx_12011520115epcas5p1J;
 Fri, 14 Oct 2022 10:49:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221014104901epsmtrp1293f8715ec9b7a2c41faa8b76d9d6249~d6dWnCrET3160431604epsmtrp14;
 Fri, 14 Oct 2022 10:49:01 +0000 (GMT)
X-AuditID: b6c32a49-319fb70000016970-0d-634943977369
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 39.56.14392.C9E39436; Fri, 14 Oct 2022 19:49:00 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221014104858epsmtip1508af7d320f124b1161a7aaa84ead629~d6dUcbDeT0142901429epsmtip1U;
 Fri, 14 Oct 2022 10:48:58 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH 3/6] dt-bindings: sound: Add sound card bindings for Tesla FSD
Date: Fri, 14 Oct 2022 15:51:48 +0530
Message-Id: <20221014102151.108539-4-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221014102151.108539-1-p.rajanbabu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmlu50Z89kgz1PZCwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKL
 T4CuW2YO0AdKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAKTAr3ixNzi0rx0vbzU
 EitDAwMjU6DChOyMV8f3MhVc1qyYMWcRewPjLtkuRk4OCQETie41u5i7GLk4hAR2M0ocPnuI
 DSQhJPCJUeJrEwdE4hujxNbd/1hhOn6/nMwEkdjLKHHuwWeo9lYmib0Ln7OAVLEJmEqsmtPI
 CpIQEWhikmh7M5EFxGEW2MgocfrYQyaQKmGBAIln076CLWQRUJWY8m4DI4jNK2Ar8fbKaah9
 8hKrNxxgBrE5Bewknrc0gU2VEFjIIfFuz2k2iCIXiT1tl6FsYYlXx7ewQ9hSEi/726DsfIlp
 H5uhaiok2j5uYIKw7SUOXJkDdB0H0HWaEut36UOEZSWmnloHVsIswCfR+/sJVDmvxI55MLaq
 xPrlmxghbGmJfdf3QtkeEls3/ICG0URGiX87TzBOYJSbhbBiASPjKkbJ1ILi3PTUYtMCw7zU
 cni8JefnbmIEp1Mtzx2Mdx980DvEyMTBeIhRgoNZSYT3tZJnshBvSmJlVWpRfnxRaU5q8SFG
 U2AATmSWEk3OByb0vJJ4QxNLAxMzMzMTS2MzQyVx3sUztJKFBNITS1KzU1MLUotg+pg4OKUa
 mFgOfBbPVHl+THj2Eb5Wl5hzn67Gi7xoNJq4893zN3JR2ncUrrU92Xvgqqn8TtYVUe6JuUsm
 xHbGpthfseH3EcsyvC53v9ficW6ooSSz2lNtNpfZf6T+qrNNac/rDRKO+zL157MFZbEq5ySX
 f1OUWBO5fParv2bvMt4t3en7leNofHXYzcn/zlaG9oVtOHe8b9Gkfl1N0an3lk1kipnzS5eb
 J3nC9jkvwgR2tou0TdFaESIwU8r4/QJl85LNWisv7N9woG+pi+65ohgx04N/fJ/e5js/QXVV
 pd3m87syqrIEZSw2u/rNbjz7/FJD7ebdwV5Op5Xn30rwvNtRX1vpUVKb5Ps85d22SfueMd2b
 WqvEUpyRaKjFXFScCABLkZoWMAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSnO4cO89kg9UPzSwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEcUl01Kak5mWWqRvl0CV8ar43uZCi5rVsyYs4i9gXGXbBcjJ4eEgInE75eT
 mboYuTiEBHYzSjzcv4wRIiEtMb1/DxuELSyx8t9zdoiiZiaJI6teghWxCZhKrJrTyAqSEBGY
 wCRx8t0xFpAEs8BWRompn41AbGEBP4nl916AxVkEVCWmvNsA1swrYCvx9sppVogN8hKrNxxg
 BrE5Bewknrc0gcWFgGqen3/HOIGRbwEjwypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxN
 jOBw19Lcwbh91Qe9Q4xMHIyHGCU4mJVEeF8reSYL8aYkVlalFuXHF5XmpBYfYpTmYFES573Q
 dTJeSCA9sSQ1OzW1ILUIJsvEwSnVwFR7xDJLMHbp5/jKU111Fg26yknKdYxz/jC/ur3kqOGj
 oGWrQyvZ0ne4NsUtnbtt8fLN8eomYbeK/HYde7by/NX+ib323xdWTw5dvdnzgnJsc4weS9Dh
 OSuX2z0X3uqzVHdBT+Ff/VvOC5nX74va9viIktHS3Xd54zWLueV3XIlVlsyxFjdZYjdzo2b+
 94Y57qYehXH1U2ZzavKEHJm/tZ19q+eS4Jjr367HpMTfv3ri8pR//KbfWW5Yh33ZXT+tZ2bB
 uvvZu87/lFXm38Ce6v/vRlYfWzp3YYyARufqg3yCj9pfvHmgqj3rbBBDyqO9It/vHqxtj1oo
 43UnQE4xZz9/mtP/O7euVzhuXFRaZKzEUpyRaKjFXFScCADaUQpl5gIAAA==
X-CMS-MailID: 20221014104901epcas5p1a61ea81c3b1640bd8a064633c0b1e40d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221014104901epcas5p1a61ea81c3b1640bd8a064633c0b1e40d
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104901epcas5p1a61ea81c3b1640bd8a064633c0b1e40d@epcas5p1.samsung.com>
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:43 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
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

Add dt-binding reference document to configure the DAI link for Tesla
FSD sound card driver.

Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
---
 .../bindings/sound/tesla,fsd-card.yaml        | 158 ++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml b/Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml
new file mode 100644
index 000000000000..4bd590f4ee27
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2022 Samsung Electronics Co. Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tesla,fsd-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tesla FSD ASoC sound card driver
+
+maintainers:
+  - Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
+
+description: |
+  This binding describes the node properties and essential DT entries of FSD
+  SoC sound card node
+
+select: false
+
+properties:
+  compatible:
+    enum:
+      - tesla,fsd-sndcard
+
+  model:
+    description: Describes the Name of the sound card
+    $ref: /schemas/types.yaml#/definitions/string
+
+  widgets:
+    description: A list of DAPM widgets in the sound card. Each entry is a pair
+      of strings, the first being the widget name and the second being the
+      widget alias
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+  audio-routing:
+    description: A list of the connections between audio components. Each entry
+      is a pair of strings, the first being the connection's sink, the second
+      being the connection's source
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+  dai-tdm-slot-num:
+    description: Enables TDM mode and specifies the number of TDM slots to be
+      enabled
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5, 6, 7, 8]
+    default: 2
+
+  dai-tdm-slot-width:
+    description: Specifies the slot width of each TDm slot enabled
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16, 24]
+    default: 16
+
+  dai-link:
+    description: Holds the DAI link data between CPU, Codec and Platform
+    type: object
+    properties:
+      link-name:
+        description: Specifies the name of the DAI link
+        $ref: /schemas/types.yaml#/definitions/string
+
+      dai-format:
+        description: Specifies the serial data format of CPU DAI
+        $ref: /schemas/types.yaml#/definitions/string
+
+      tesla,bitclock-master:
+        description: Specifies the phandle of bitclock master DAI
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+      tesla,frame-master:
+        description: Specifies the phandle of frameclock master DAI
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+      cpu:
+        description: Holds the CPU DAI node and instance
+        type: object
+        properties:
+          sound-dai:
+            description: Specifies the phandle of CPU DAI node
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+
+        required:
+          - sound-dai
+
+      codec:
+        description: Holds the Codec DAI node and instance
+        type: object
+        properties:
+          sound-dai:
+            description: Specifies the phandle of Codec DAI node
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+
+        required:
+          - sound-dai
+
+    required:
+      - link-name
+      - dai-format
+      - tesla,bitclock-master
+      - tesla,frame-master
+      - cpu
+
+dependencies:
+  dai-tdm-slot-width: [ 'dai-tdm-slot-num' ]
+
+required:
+  - compatible
+  - model
+  - dai-link
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "tesla,fsd-sndcard";
+        status = "disabled";
+        model = "fsd-i2s";
+
+        primary-dai-link-0 {
+            link-name = "fsd-primary-0";
+            dai-format = "i2s";
+            tesla,bitclock-master = <&tdm_0>;
+            tesla,frame-master = <&tdm_0>;
+            cpu {
+                sound-dai = <&tdm_0 0>;
+            };
+        };
+
+        secondary-dai-link-0 {
+            link-name = "fsd-secondary-0";
+            dai-format = "i2s";
+            tesla,bitclock-master = <&tdm_0>;
+            tesla,frame-master = <&tdm_0>;
+            cpu {
+                sound-dai = <&tdm_0 1>;
+            };
+        };
+
+        primary-dai-link-1 {
+            link-name = "fsd-primary-1";
+            dai-format = "i2s";
+            tesla,bitclock-master = <&tdm_1>;
+            tesla,frame-master = <&tdm_1>;
+            cpu {
+                sound-dai = <&tdm_1 0>;
+            };
+        };
+
+        secondary-dai-link-1 {
+            link-name = "fsd-secondary-1";
+            dai-format = "i2s";
+            tesla,bitclock-master = <&tdm_1>;
+            tesla,frame-master = <&tdm_1>;
+            cpu {
+                sound-dai = <&tdm_1 1>;
+            };
+        };
+    };
-- 
2.17.1

