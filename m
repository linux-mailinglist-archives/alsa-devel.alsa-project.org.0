Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5BA1EE5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80260170A;
	Thu, 29 Aug 2019 17:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80260170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567092246;
	bh=qC04ERgtnwHdQTrxTHG2b8wQQHqQ8aKCxbjasp+jghc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BuSrCPi5eJkGxEnccr5J6h+rc72sYBAF5xj9m8Mxrzil1/76IC8vJ0HVA5PaepdC+
	 gItPqcHkXxZRdhFgM8EKRIb4jrpuwRxEESYH8QPkWuvWUT87dgPXFQjbGiNX8FmI0D
	 CCpiXL/49zQqyuNuOM36dY5WDT6B5fNg7JLVQT+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33851F8070E;
	Thu, 29 Aug 2019 16:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D49E0F80612; Thu, 29 Aug 2019 16:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9077BF805FC
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 16:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9077BF805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AucqA/aP"
Received: by mail-wm1-x343.google.com with SMTP id g207so47596wmg.5
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=suAbTDwiMceHqqJKAwUWw4QMtCa0U1oIrQMTW83oM3o=;
 b=AucqA/aPIGOQ+lWPkLe5EFM+3cZHoMFXxYg0z309/YTknvsCoTldO3TIfbIgldb07d
 js5zs6wpyJC6G2idGzXGF4Q1b2aRdWyZQysVy1L0vG6D8K6vrZUkDBM8cvg4mducf1Yz
 32EN93cjJGFg/NNT+gt+PQRpG1+ZyqEAq30soLx10k1aaIKUXNicV++ddlHAm1/X/e/w
 JvTAP+nI3JVLrVqxo9qYHEY/50HBaKPj+VWzGP4DHxgctwPy06QJlQDOk2P3oxrYNIKK
 szboHGHoRAM+nUzxFABrO7HRHVO1zLqf8tTUAYKvq3dbuTQnG0i80Xy43RUvoIiJqmBU
 +9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=suAbTDwiMceHqqJKAwUWw4QMtCa0U1oIrQMTW83oM3o=;
 b=nVjD+BrlUe81f72exj8KcDgl50i9lUqeQSHX1c2WbeiL5ciDjYSb6pEgeUJ6363OGp
 P7FRjoEBE8lcIicKIFLWuRO+fXjYuKwjiI7yIgi1bQj7VNV3FBhSZHNhO+w9OHQ67lYh
 f7yLgPyY2aNLEanuZWn96wk6BbKNGNEcGuPZb804vvaNodo3AA/jbFteIQBaee+XgjaR
 cxnz044ZMHKcg1SSrvKBOhYnr2kcNaJYrgAlKmGeUd5tbaj2B9h0+QH//YVQ8sc0SEP2
 EqaoNuq0jirO5gxiyAEKv4CGSdspc/hj+gh0zctkeDwt1pL7ddBBaNSEU8k1E3QH4TQg
 FVlQ==
X-Gm-Message-State: APjAAAXj58e3+usyNVmUTQwyc1hLnw9T5adWKirN8jO40ov5OvkO/2PQ
 n18lbjFxaGM1LDe66bfhLd/Hog==
X-Google-Smtp-Source: APXvYqzKx1ctg6+akphkGML905XR2L019Y5kxwFh2IX9IE5qLeWpKRFtIBLfvAcJNReE8hyVEQ+4eQ==
X-Received: by 2002:a1c:a6cd:: with SMTP id
 p196mr11902849wme.111.1567089900559; 
 Thu, 29 Aug 2019 07:45:00 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p7sm3923492wmh.38.2019.08.29.07.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 07:45:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 29 Aug 2019 15:44:39 +0100
Message-Id: <20190829144442.6210-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
References: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v5 1/4] dt-bindings: soundwire: add slave
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
 .../soundwire/soundwire-controller.yaml       | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml

diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
new file mode 100644
index 000000000000..449b6130ce63
--- /dev/null
+++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0
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
+    additionalProperties: false
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
+        };
+
+        speaker@0,2 {
+            compatible = "sdw10217201000";
+            reg = <0 2>;
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
