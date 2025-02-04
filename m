Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A9A37F6B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:09:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 716A8602AE;
	Mon, 17 Feb 2025 11:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 716A8602AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739786962;
	bh=PQC6lO+NQ+lEKD+JRu90LE3Nqd7VmbhE6PsaGMSNg4M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fBY434UI+l7k6hC/iI/goGgLTD0mM7gRBVYAPUBVmyDbs/NMvzkaeCIvEFzEw0xRC
	 T3YzM5P7uC1F5QIm4sh4khvd6klAjlSrRlLhXXwcYbVvhTSkdait5i4tW1/WOItFpz
	 w/Stb1YR2zvzFTzXAKTyy9/isBPrVGLIyF8BrYKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ED40F8069A; Mon, 17 Feb 2025 11:07:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 145B2F8068D;
	Mon, 17 Feb 2025 11:07:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C14F0F80525; Wed,  5 Feb 2025 00:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08A99F801F5
	for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2025 00:20:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08A99F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=b7MRZ2nj
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 514FmiGl029318;
	Tue, 4 Feb 2025 17:20:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BCT2AIKVtExqG27DTd5hLqvs/DalIumwuqwNjQzI47U=; b=
	b7MRZ2njGYPT5t4l1Rd7YXY+LjewjwU9/fQ8Q3lhQqprVHPKAh5fpIgf0Ve7tUrO
	rSEiTl2VA4doV/iEdR0Vad4DbNtnNc5CxPjr1LiIU07A/FWmWNbeJYhWfOVtLeHx
	TFVF8nkU66KWxN3PY5PD675w3canXdpuSkIHnpXfK0ClPldVIUAZuZD9diwjotO2
	kFrVp7KQdh0K+jJzy1TTEEhw9ItvtBWU3rxoUSAOaxYpD7M1SRqeolYpvWvPoIO2
	vXj58XT11AD62xz4YlIK8Na3CD9m6o5rlLU14HTrJZ8SUp0fAPL+xyvg3FnILaCs
	kark0GrbJ8qnTDGeZAF+Ag==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw53pkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:20:10 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 23:20:08 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 23:20:03 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B0AFF820248;
	Tue,  4 Feb 2025 23:19:58 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Ben Bright
	<ben.bright@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Jeff LaBundy
	<jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
        Karel Balej
	<balejk@matfyz.cz>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Binbin Zhou
	<zhoubinbin@loongson.cn>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        "Paul
 Handrigan" <paulha@opensource.cirrus.com>,
        Masahiro Yamada
	<masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
        Fred Treven
	<ftreven@opensource.cirrus.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH RESEND 4/7] dt-bindings: mfd: cirrus,cs40l26: Support for
 CS40L26
Date: Tue, 4 Feb 2025 17:18:33 -0600
Message-ID: <20250204231835.2000457-5-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Wil3jMa_PyzzZx9lUo4ysaKtu89G_laj
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a2a0aa cx=c_pps
 a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17
 a=T2h4t0Lz3GQA:10 a=gEfo2CItAAAA:8 a=w1d2syhTAAAA:8 a=wuh2pNzbNvaVoUcC6a8A:9
 a=sptkURWiP4Gy88Gu7hUp:22
 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: Wil3jMa_PyzzZx9lUo4ysaKtu89G_laj
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=113024ff55=ftreven@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BFGDHS3A4D2GVRB4IJAPXMLEKOUZDLIC
X-Message-ID-Hash: BFGDHS3A4D2GVRB4IJAPXMLEKOUZDLIC
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:07:40 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFGDHS3A4D2GVRB4IJAPXMLEKOUZDLIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce required basic devicetree parameters for the
initial commit of CS40L26.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 .../bindings/mfd/cirrus,cs40l26.yaml          | 81 +++++++++++++++++++
 MAINTAINERS                                   |  4 +-
 2 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml

diff --git a/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml b/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
new file mode 100644
index 000000000000..a3cccb1a2d92
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/cirrus,cs40l26.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/cirrus,cs40l26.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS40L26 Boosted Haptic Amplifier
+
+maintainers:
+  - Fred Treven <ftreven@opensource.cirrus.com>
+  - patches@opensource.cirrus.com
+
+description:
+  CS40L26 is a Boosted Haptic Driver with Integrated DSP, Waveform Memory,
+  Advanced Closed Loop Algorithms, and LRA protection
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs40l26a
+      - cirrus,cs40l27b
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  va-supply:
+    description: Regulator for VA analog voltage
+
+  vp-supply:
+    description: Regulator for VP voltage
+
+  cirrus,bst-ipk-microamp:
+    description:
+      Maximum current that can be drawn by the device's boost converter.
+    multipleOf: 50000
+    minimum: 1600000
+    maximum: 4800000
+    default: 4500000
+
+  cirrus,bst-ctl-microvolt:
+    description: Maximum target voltage to which DSP may increase the VBST supply.
+    multipleOf: 50000
+    minimum: 2550000
+    maximum: 11000000
+    default: 11000000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      haptic-driver@58 {
+        compatible = "cirrus,cs40l26a";
+        reg = <0x58>;
+        interrupt-parent = <&gpio>;
+        interrupts = <57 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio 54 GPIO_ACTIVE_LOW>;
+        va-supply = <&vreg>;
+        vp-supply = <&vreg>;
+        cirrus,bst-ctl-microvolt = <2600000>;
+        cirrus,bst-ipk-microamp = <1650000>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bc8ce7af3303..9c4105bf0a32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5546,11 +5546,11 @@ F:	sound/soc/codecs/cs*
 
 CIRRUS LOGIC HAPTIC DRIVERS
 M:	James Ogletree <jogletre@opensource.cirrus.com>
-M:	Fred Treven <fred.treven@cirrus.com>
+M:	Fred Treven <ftreven@opensource.cirrus.com>
 M:	Ben Bright <ben.bright@cirrus.com>
 L:	patches@opensource.cirrus.com
 S:	Supported
-F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
+F:	Documentation/devicetree/bindings/input/cirrus,cs40l*
 F:	drivers/input/misc/cs40l*
 F:	drivers/mfd/cs40l*
 F:	include/linux/mfd/cs40l*
-- 
2.34.1

