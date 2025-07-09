Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEFAAFDC52
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jul 2025 02:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D48ED601F1;
	Wed,  9 Jul 2025 02:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D48ED601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752020726;
	bh=ZZ3U75N40+eu5QTYJMTkDeky4qDCBP6lGMFOT5Gu8Dw=;
	h=From:To:Cc:Subject:Date:References:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uFuUjJrT1QYnK17qUpgei80CmYmCeMewBan8RKAsuMlLme9GwaZ6qJ9snVd+YlhXd
	 SyjfhBq/c42acMaip3HepNabFenFXsQo6DiWKtu4G7kYiiIrlucOo47vuWYEt3mVOy
	 PyVvW3SCPzGz6ruYbUgASA0XHaBWqYr037a9a3zA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 243F1F805C0; Wed,  9 Jul 2025 02:24:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFDB0F805C5;
	Wed,  9 Jul 2025 02:24:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55C3AF804F2; Wed,  9 Jul 2025 02:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B31DCF800E4
	for <alsa-devel@alsa-project.org>; Wed,  9 Jul 2025 02:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B31DCF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=eRgb/vZ2
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20250709002436epoutp02ab0bd827bfac72fe687076862e86b62d~QbYW7F7CH2315123151epoutp02v
	for <alsa-devel@alsa-project.org>; Wed,  9 Jul 2025 00:24:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20250709002436epoutp02ab0bd827bfac72fe687076862e86b62d~QbYW7F7CH2315123151epoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752020676;
	bh=Csr8P80vKglsKS0cZBaoIuhqtrwVNy6zr9k2ICghBF4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=eRgb/vZ2aqCoMZbLv3QvLHgiMu1iu+woD405nufCHFYZheDrzDy6bWFDwzs2ZXB0Z
	 gNfqrm7A5zsUGuiixTq3CumdrkVaKE5qC2Xv2z/PitbPw/IWdg7I+pyr0geycQZSx8
	 DoIxKJgcs9ZdljlaJQ4ilzz+IFuNt2Fe2pDVKLpE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250709002435epcas2p4bedfe99160977b09d8dc4f19f86e2167~QbYWqHqiL2856628566epcas2p4q;
	Wed,  9 Jul 2025 00:24:35 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bcJdH02HKz2SSKX; Wed,  9 Jul
	2025 00:24:35 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19~QbYVIzYC_0544805448epcas2p2N;
	Wed,  9 Jul 2025 00:24:34 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250709002434epsmtip2553a0baf142607e684f8aaa6a98301f2~QbYVFbsmw0388303883epsmtip2S;
	Wed,  9 Jul 2025 00:24:34 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, lgirdwood@gmail.com, s.nawrocki@samsung.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ew kim <ew.kim@samsung.com>
Subject: [PATCH] ASoC: dt-bindings: Add samsung,abox-generic document
Date: Wed,  9 Jul 2025 09:12:39 +0900
Message-Id: <20250709001239.379695-1-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19
References: 
 <CGME20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19@epcas2p2.samsung.com>
Message-ID-Hash: ORWHQVDQL4PPAOH6RWQUKTDT7IQJBG7T
X-Message-ID-Hash: ORWHQVDQL4PPAOH6RWQUKTDT7IQJBG7T
X-MailFrom: ew.kim@samsung.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ORWHQVDQL4PPAOH6RWQUKTDT7IQJBG7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add soundcard bindings for the abox generic of exynus automotive.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 .../bindings/sound/samsung,abox-generic.yaml  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml b/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
new file mode 100644
index 000000000000..bf641a197903
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/samsung/abox-generic.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Samsung Exynos Automotive Abox Generic
+
+maintainers:
+  - name: Eunwoo Kim
+    email: ew.kim@samsung.com
+
+description: |
+  Samsung Exynos Automotive Abox Generic core node.
+
+  This node represents the generic Abox controller which manages
+  various Abox sub-drivers and acts as a hub connecting them to
+  SoC-level audio drivers. It provides PCM playback and capture
+  configuration, as well as dummy I2S backend handling, enabling
+  integration between Abox IP blocks and the SoC audio subsystem.
+
+  Typically, this node is used to initialize and configure playback,
+  capture, and routing between the Abox and other SoC audio components.
+
+properties:
+  compatible:
+    const: samsung,abox_generic
+
+  samsung,num-of-pcm_playback:
+    description: Number of PCM playback instances.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  samsung,num-of-pcm_capture:
+    description: Number of PCM capture instances.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  samsung,num-of-i2s-dummy-backend:
+    description: Number of dummy I2S backend instances.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  status:
+    description: Availability status.
+    enum: [ "okay", "disabled" ]
+
+  '#address-cells':
+    description: Number of address cells in the node.
+    const: 2
+
+  '#size-cells':
+    description: Number of size cells in the node.
+    const: 1
+
+  ranges:
+    description: Standard `ranges` property for bus address mapping.
+    type: object
+
+required:
+  - compatible
+  - samsung,num-of-pcm_playback
+  - samsung,num-of-pcm_capture
+  - samsung,num-of-i2s-dummy-backend
+
+additionalProperties: false
+
+examples:
+  - |
+    abox_generic: abox_generic@generic {
+      compatible = "samsung,abox_generic";
+      samsung,num-of-pcm_playback = <32>;
+      samsung,num-of-pcm_capture = <32>;
+      samsung,num-of-i2s-dummy-backend = <5>;
+      status = "disabled";
+      #address-cells = <2>;
+      #size-cells = <1>;
+      ranges;
+    };
+
-- 
2.25.1

