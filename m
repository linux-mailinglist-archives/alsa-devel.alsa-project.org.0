Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A6F2B5ACC
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 09:13:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85DAE1747;
	Tue, 17 Nov 2020 09:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85DAE1747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605600808;
	bh=3tSDbfVBt6kmwJIhc6jP5G91e1Zak81ckSNzcDVpuOs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fBJkyL2K1J2n+N24Ez+qV0HK2G0uyQGGlnXGI57SwlTtJ1u899K4O1VtlVLddhosQ
	 TGE6YB/y18NUWthFT6SAPW1s9HueyDj8S+nO6ngo4arZcO1I6RTnjARPJTXRBSmsmA
	 YdXi4m+oJFAjaqW2Zc3IoRijoxlrXXgu0zaqDpPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0861FF804C2;
	Tue, 17 Nov 2020 09:11:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12513F802A9; Tue, 17 Nov 2020 09:11:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A77FF801F5
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 09:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A77FF801F5
IronPort-SDR: CCxlAXMD+zhSZMLTOZpqs4LizLsJkkjNInESFkqLbm4vD54VQNbG9HwoANKx6TZjO99+ae/Qmx
 xFPUvvmx7bzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="232498815"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="232498815"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 00:10:43 -0800
IronPort-SDR: pP6wW8CrZWjR4SiFA84yhAiJz900TzgzZxJkECaaHofc4WGf20hH3godlG91piCsCS+9nXwEJB
 exo56O6KgMSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="358799133"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga004.fm.intel.com with ESMTP; 17 Nov 2020 00:10:41 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 1/4] dt-bindings: sound: intel,
 keembay-i2s: Add info for device to use DMA
Date: Tue, 17 Nov 2020 16:03:47 +0800
Message-Id: <20201117080354.4309-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
Cc: cezary.rojewski@intel.com, lars@metafoo.de, andriy.shevchenko@intel.com,
 tiwai@suse.com, jee.heng.sia@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org
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

Add descriptions for entries needed for audio device to use DMA
channels for audio playback and capture.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../bindings/sound/intel,keembay-i2s.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
index d346e61ab708..e0658f122cbb 100644
--- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -45,6 +45,18 @@ properties:
       - const: osc
       - const: apb_clk
 
+  dmas:
+    items:
+      - description: DMA controller phandle and DMA channel
+                     for TX and RX
+
+  dma-names:
+    items:
+      - description: "tx" for the transmit channel
+                     "rx" for the receive channel
+      - const: tx
+      - const: rx
+
 required:
   - compatible
   - "#sound-dai-cells"
@@ -70,4 +82,6 @@ examples:
          interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
          clock-names = "osc", "apb_clk";
          clocks = <&scmi_clk KEEM_BAY_PSS_AUX_I2S3>, <&scmi_clk KEEM_BAY_PSS_I2S3>;
+         dmas = <&axi_dma0 29 &axi_dma0 33>;
+         dma-names = "tx", "rx";
      };
-- 
2.17.1

