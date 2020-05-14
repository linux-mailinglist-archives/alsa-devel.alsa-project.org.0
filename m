Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0416A1D3030
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 14:45:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1FB11669;
	Thu, 14 May 2020 14:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1FB11669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589460354;
	bh=aRxiYKhNBQ7dO1HHgIfjNulWLkDs/17cWHcRHzIyuFs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NBiWO8XNfrIJYbY3M2pqngzxX4MgOirG4XOIJ2f9FfDJmTCtkfi/+RO7BBXOwfAE+
	 U6hp3qEGMtAgey1WLqq/K/NidE3Wb0sS6sntR6hYu+hBvy8wrkvrKGRHMAGUqKqVnx
	 2PwB2qrKl/amXDn45SLXnMOHA7HHMlAyWLMqBtB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12EACF801DB;
	Thu, 14 May 2020 14:43:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4170F801DB; Thu, 14 May 2020 14:43:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F0B1F800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 14:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F0B1F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FfZY3MR8"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04EChGG5097203;
 Thu, 14 May 2020 07:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589460196;
 bh=HlDA7roPZoOfauhzxUkVsNVj1Ph1YT27Vtoau0p6J5I=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=FfZY3MR8phk6TIfCDXaZbxGQra58C6/erV4EN29DgQN2xq0H95dWxb9aD5o+aHONl
 hQAfCM0uq2OLqkefPDUNlOFDNpibFqC3wWtvtE4vRQZpEDEsakMIWlrkOiRmpOlj/A
 bNV+EnM2xjvkhFJ4ETuuErVipoqrIjKL8XCJ15aA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04EChGlk121909
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 14 May 2020 07:43:16 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 May 2020 07:43:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 May 2020 07:43:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04EChFmK030774;
 Thu, 14 May 2020 07:43:15 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 2/3] ASoC: tlv320adcx140: Add device tree property for PDM
 edges
Date: Thu, 14 May 2020 07:33:37 -0500
Message-ID: <20200514123338.20392-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514123338.20392-1-dmurphy@ti.com>
References: <20200514123338.20392-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

Add a device tree property to configure the PDM sampling edge for each
digital microphone.

CC: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - Updated description to be more descriptive and fixed example.

 .../bindings/sound/tlv320adcx140.yaml         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
index ab2268c0ee67..daa6cc0e031b 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -63,6 +63,29 @@ properties:
       - $ref: /schemas/types.yaml#/definitions/uint32
       - enum: [0, 1, 2]
 
+  ti,pdm-edge-select:
+    description: |
+       Defines the PDMCLK sampling edge configuration for the PDM inputs.  This
+       array is defined as <PDMIN1 PDMIN2 PDMIN3 PDMIN4>.
+
+       0 - (default) Odd channel is latched on the negative edge and even
+       channel is latched on the the positive edge.
+       1 - Odd channel is latched on the positive edge and even channel is
+       latched on the the negative edge.
+
+       PDMIN1 - PDMCLK latching edge used for channel 1 and 2 data
+       PDMIN2 - PDMCLK latching edge used for channel 3 and 4 data
+       PDMIN3 - PDMCLK latching edge used for channel 5 and 6 data
+       PDMIN4 - PDMCLK latching edge used for channel 7 and 8 data
+
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - minItems: 1
+        maxItems: 4
+        items:
+          maximum: 1
+        default: [0, 0, 0, 0]
+
 required:
   - compatible
   - reg
@@ -77,6 +100,7 @@ examples:
         compatible = "ti,tlv320adc5140";
         reg = <0x4c>;
         ti,mic-bias-source = <6>;
+        ti,pdm-edge-select = <0 1 0 1>;
         reset-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
       };
     };
-- 
2.26.2

