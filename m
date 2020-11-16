Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7E2B3D10
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 07:26:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC26E17EE;
	Mon, 16 Nov 2020 07:25:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC26E17EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605507985;
	bh=3tSDbfVBt6kmwJIhc6jP5G91e1Zak81ckSNzcDVpuOs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnCbKKCxIaRk375uFL0rzAYOpNezjpMOfMKiFAgeeYiSvGwjphWc6w/FgsZd/uive
	 4+CG3iPLqOrRbfVOMEUWIX+vzXrZKz3ZFKcJr4dCGmqjQ0D4uZbnbcUNa2YnyDBHaD
	 n10HlNG4AE8AsTcviwlpgXQew6R3mEaiEYnOePks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39039F804BD;
	Mon, 16 Nov 2020 07:25:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66959F804B1; Mon, 16 Nov 2020 07:25:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9587CF80167
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 07:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9587CF80167
IronPort-SDR: mCjK4cYL0Xswf/3iMLnUy/3rtzSQyXDZYtqO2sOAdxB5tPcJZRRh37G8jlufoeXcl8Kx6GMwCi
 TJK9+vowm17g==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="150555414"
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="150555414"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2020 22:25:16 -0800
IronPort-SDR: QD0wobZKpSWEcx7pRXCXjxUfIZT4t4wfxOlLDBW4NR7GQfkaCnAJpoG6a78sg++aVawgKBDs9x
 1DrOpxftAFFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="310297910"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2020 22:25:13 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] dt-bindings: sound: intel,
 keembay-i2s: Add info for device to use DMA
Date: Mon, 16 Nov 2020 14:19:02 +0800
Message-Id: <20201116061905.32431-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116061905.32431-1-michael.wei.hong.sit@intel.com>
References: <20201116061905.32431-1-michael.wei.hong.sit@intel.com>
Cc: cezary.rojewski@intel.com, vinod.koul@linux.intel.com,
 andriy.shevchenko@intel.com, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, lars@metafoo.de
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

