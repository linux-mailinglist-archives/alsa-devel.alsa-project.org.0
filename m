Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D56230BA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 17:55:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F103A163A;
	Wed,  9 Nov 2022 17:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F103A163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668012953;
	bh=ydqhri5kvtDQYrqv3KbRYtDEfekt/JRdeQFr5wXg7ak=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NFlyYWH+nk6N2kU3HlHuoccXgQjPAPbc8ef21gB10z4agcWJ3WccuJ2gc94LwHdHr
	 oofL1uTuxd6eYWrm53bzf3/iiThDN1beCSXTJgIQ/dkR3Rv1UFXwCxMkvExTfUb4Uu
	 pj78GE/8PqDrhu7ZHa1CpRqUsErOI4rNErxYhDyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E951BF80587;
	Wed,  9 Nov 2022 17:53:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31C24F8057A; Wed,  9 Nov 2022 17:53:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 873A6F802A0
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 873A6F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZKr156ho"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9EEsmo027592; Wed, 9 Nov 2022 10:53:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=cqQO47P2lcMdmDdGNz1/UmZ7HXFI+NKT10pg7/xczD0=;
 b=ZKr156hoeW/l7m+9K8hKpgGihOsnR6cjsNB8OtRje2skR46opdIR1HyBgVXnBClVFKpu
 wRggrD8afx8LYlNVWJQ8t7gYmpGl76Oimrdd5KxW5Lkpcn8P+LbQp1elQYVgLJJAv21W
 O1SFDMgzm8GudtmN1Oz3vVdyLvOX4wNhLvazhy10VwD4v/WVXyB7Nk7f50geOqNBkLcY
 lEm7Jv381AzIq5DkVl8FZ0Lw7pwurOuxNAYHOn/pC++zdnY/x6L423lAfCkQP9+njyG+
 N603M5wRayIzZtVo0hqtrSOll1FqOR6PZqsxsijBAmR8KzG7ka+lGUuNvchIYumoD/HG Lg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3knn81nk99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 10:53:36 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Wed, 9 Nov
 2022 10:53:34 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Wed, 9 Nov 2022 10:53:34 -0600
Received: from debianA11184.ad.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.92])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D7F29468;
 Wed,  9 Nov 2022 16:53:33 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
 <broonie@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
Subject: [PATCH 04/12] dt-bindings: pinctrl: Add Cirrus Logic CS48L31/32/33
Date: Wed, 9 Nov 2022 16:53:23 +0000
Message-ID: <20221109165331.29332-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109165331.29332-1-rf@opensource.cirrus.com>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VTjH1W65hT9eMedc0D1BYTzdkwt1QPAO
X-Proofpoint-GUID: VTjH1W65hT9eMedc0D1BYTzdkwt1QPAO
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
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

Codecs in this family have multiple digital I/O functions for audio,
DSP subsystem, GPIO and various special functions. All muxable pins
are selectable as either a GPIO or one of the available alternate
functions.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../bindings/pinctrl/cirrus,cs48l32.yaml      | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml
new file mode 100644
index 000000000000..b24fbae6a8f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cirrus,cs48l32.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS48L32 audio codec pinctrl driver
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+description: |
+The Cirrus Logic CS48L32 codec has a number of GPIO functions for
+interfacing to external hardware. Certain groups of GPIO pins also
+have an alternate function.
+
+The properties for this driver exist within the parent MFD driver node.
+See the core bindings for the parent MFD driver for an example:
+
+    Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml
+
+And the generic pinctrl bindings:
+
+    Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+properties:
+  pin-settings:
+    description:
+      One subnode is required to contain the default settings. It
+      contains an arbitrary number of configuration subnodes, one for
+      each group or pin configuration you want to apply as a default.
+    type: object
+    patternProperties:
+      '-pins$':
+        type: object
+        allOf:
+          - $ref: "pincfg-node.yaml#"
+          - $ref: "pinmux-node.yaml#"
+        properties:
+          groups:
+            description:
+              Name of one pin group to configure.
+            enum: [ asp1, asp2, in1-pdm, in2-pdm,
+                    gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                    gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                    gpio14, gpio15, gpio16 ]
+
+          function:
+            description:
+              Name of function to assign to this group.
+            enum: [ asp1, asp2, in1-pdm, in2-pdm, spi2, io, dsp-gpio,
+                    irq1, fll1-clk, fll1-lock, opclk, opclk-dsp, uart,
+                    input-path-signal-detect,
+                    ultrasonic-in1-activity-detect, ultrasonic-in2-activity-detect,
+                    dma-ch0-programmable-transfer-complete,
+                    dma-ch1-programmable-transfer-complete,
+                    dma-ch2-programmable-transfer-complete,
+                    dma-ch3-programmable-transfer-complete,
+                    dma-ch4-programmable-transfer-complete,
+                    dma-ch5-programmable-transfer-complete,
+                    dma-ch6-programmable-transfer-complete,
+                    dma-ch7-programmable-transfer-complete,
+                    sample-rate-change-trigger-a, sample-rate-change-trigger-b,
+                    sample-rate-change-trigger-c, sample-rate-change-trigger-d,
+                    timer1-irq-ch1, timer1-irq-ch2, timer1-irq-ch3, timer1-irq-ch4,
+                    timer2-irq-ch1, timer2-irq-ch2, timer2-irq-ch3, timer2-irq-ch4,
+                    timer3-irq-ch1, timer3-irq-ch2, timer3-irq-ch3, timer3-irq-ch4,
+                    timer4-irq-ch1, timer4-irq-ch2, timer4-irq-ch3, timer4-irq-ch4,
+                    timer5-irq-ch1, timer5-irq-ch2, timer5-irq-ch3, timer5-irq-ch4,
+                    timer-1, timer-2, timer-3, timer-4, timer-5 ]
+
+          bias-disable: true
+
+          bias-bus-hold: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-push-pull: true
+
+          drive-open-drain: true
+
+          drive-strength:
+            description:
+              Drive strength in mA.
+            enum: [ 4, 8 ]
+
+          output-low: true
+
+          output-high: true
+
+        additionalProperties: false
+
+        required:
+          - groups
+
+    additionalProperties: false
-- 
2.30.2

