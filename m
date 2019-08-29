Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B1A2114
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 18:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9881677;
	Thu, 29 Aug 2019 18:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9881677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567096754;
	bh=z4VTUUKBd36J/i0kVHvAmGiUDVwdOSEriuOaeI/Ex6w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mfpf/GvS9ZxHIWhE0es66JCJzphVb+hLD5xoZNWWsilYsObCRRjMru3zxaLkOoyrM
	 FNiDkDe/7PUDfYHOP7O3cq4kPwVbhtq1cVMcOI+rwUy9dFD+ncnqFegkHTp68coeoj
	 +Da6aQYYzAJP3L40B/iWEpPTvaFtErr+iFo6ScGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88EF6F802A1;
	Thu, 29 Aug 2019 18:36:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C622BF801ED; Thu, 29 Aug 2019 18:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1083CF80096
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 18:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1083CF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xHp80Gcn"
Received: by mail-wr1-x442.google.com with SMTP id y19so4125027wrd.3
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ut1fjj8eBNR1pFtqlRw5Uf5pteRExaUZGDi9IpjspkU=;
 b=xHp80GcndzmNY8JJ7lMxSaKD+/5XoNzTgtOH5k1hm+r5JTxyG1X/vI8KHTJsQtI1Cv
 1P3IC9kBfniaetDTJpmUVPdlwJewmUnvMNdH6qVj452oTqiE97E9MokPeFaUiAEDQNHY
 dL0L92xr8e6ymkb0HYv7xPdBhikI0vBXNBVdeIzyIKlDlNbgcEnWQOa63KgskLBBh+ZW
 zHySJdwOi9lvV+/CFsdnRTwLpZnBcLNSF5aaY2L68JQ9Ak1nDMvGy/bPE1QEP6BItGhl
 /kC0tuIGqnxXILzpq2sq6keWnzFzgrxFV9AMY+zTgvKAH2s2kjN1+q8TvOeh8zN0szvb
 IFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ut1fjj8eBNR1pFtqlRw5Uf5pteRExaUZGDi9IpjspkU=;
 b=ihWmic8hTNAL64ko1+402/jji14+Kkej/lR46xmmAN0T9gP4J7YavgPLrJUylBFVDb
 ZPHhthy0Ul2lPzVWCif0HEIrOKvLwqCsRFATa9+zH19U+9BATzeYXAmSIneTY92aBNax
 cqKuPz31D3ENB67wpiAMiV/PbaDR9TEo/qwpoB7r+R7G73oLZ4tyX2Qe3xP/Hw70z4uL
 bm7YoX2uk5DFgD0En/vBfyzX7ItG4niyvehYsRVGE0nOHn0t3wdEwq7od6OJ5hhCVIxg
 44erySATIWRcWRUgbn9dbELPY/1+QYucEwC4VJefrFgMCoKgbs7Eh2TS6obzDEQazcXc
 FUBw==
X-Gm-Message-State: APjAAAVL466qV81yzYLmjhe9fJt2ttmorTzysqfllaHZU+RocpUtEMxs
 YJo7uLF09RyvrTCFOWPzKArWPg==
X-Google-Smtp-Source: APXvYqyg/29G3TEDvhJuP3sZOsleGXRe9357VR2GoR5BLQzNlObtZnEIk8orjsWHqLCNbzzds2BbAA==
X-Received: by 2002:a5d:4b8c:: with SMTP id b12mr13543767wrt.26.1567096597086; 
 Thu, 29 Aug 2019 09:36:37 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id k9sm4398243wrq.15.2019.08.29.09.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:36:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 29 Aug 2019 17:35:11 +0100
Message-Id: <20190829163514.11221-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
References: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v6 1/4] dt-bindings: soundwire: add slave
	bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds bindings for Soundwire Slave devices that includes how
SoundWire enumeration address and Link ID are used to represented in
SoundWire slave device tree nodes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../soundwire/soundwire-controller.yaml       | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml

diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
new file mode 100644
index 000000000000..1b43993bccdb
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SoundWire Controller Generic Binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+  - Vinod Koul <vkoul@kernel.org>
+
+description: |
+  SoundWire busses can be described with a node for the SoundWire controller
+  device and a set of child nodes for each SoundWire slave on the bus.
+
+properties:
+  $nodename:
+    pattern: "^soundwire(@.*)?$"
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^.*@[0-9a-f],[0-9a-f]$":
+    type: object
+
+    properties:
+      compatible:
+        pattern: "^sdw[0-9a-f]{1}[0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"
+        description: Is the textual representation of SoundWire Enumeration
+          address. compatible string should contain SoundWire Version ID,
+          Manufacturer ID, Part ID and Class ID in order and shall be in
+          lower-case hexadecimal with leading zeroes.
+          Valid sizes of these fields are
+          Version ID is 1 nibble, number '0x1' represents SoundWire 1.0
+          and '0x2' represents SoundWire 1.1 and so on.
+          MFD is 4 nibbles
+          PID is 4 nibbles
+          CID is 2 nibbles
+          More Information on detail of encoding of these fields can be
+          found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
+
+      reg:
+        maxItems: 1
+        description:
+          Link ID followed by Instance ID of SoundWire Device Address.
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    soundwire@c2d0000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x0c2d0000 0x2000>;
+
+        speaker@0,1 {
+            compatible = "sdw10217201000";
+            reg = <0 1>;
+            powerdown-gpios = <&wcdpinctrl 2 0>;
+            #thermal-sensor-cells = <0>;
+        };
+
+        speaker@0,2 {
+            compatible = "sdw10217201000";
+            reg = <0 2>;
+            powerdown-gpios = <&wcdpinctrl 2 0>;
+            #thermal-sensor-cells = <0>;
+        };
+    };
+
+...
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
