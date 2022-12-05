Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B5642D56
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 17:44:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16BEC1836;
	Mon,  5 Dec 2022 17:43:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16BEC1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670258648;
	bh=XONnrE5BnMeTLZKnJ20DngrwPzwaLgeH3F4UU0fS44A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CnUhSk12zR95i6ktS3GGszw/WINQBUUc9MbKqvQ3hTuxBYTrjPyp346OFsnH7nKC9
	 i4JV7dkMoeObL85yY2dMLHpPfgrqJ/aDZH/5u2Ufy1101PuFT/nCn5FWK2WxlXORgn
	 dbJ7U8fZvAWzpuNGHkNlVdwtrGy1rmNkByNhlNMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3EF2F8047C;
	Mon,  5 Dec 2022 17:43:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B6C2F80236; Mon,  5 Dec 2022 17:43:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40F41F800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 17:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40F41F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PfPAJmwx"
Received: by mail-lj1-x229.google.com with SMTP id bn5so14209509ljb.2
 for <alsa-devel@alsa-project.org>; Mon, 05 Dec 2022 08:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dG7yGVyYRsmBVSh74cgqDY3U7gtNUa3Uc2Su87aJNdM=;
 b=PfPAJmwxzI3vsBPIQ4EArHnL8s9XLh3ES8XQsb/9CSv7PNlIvHBRa8UtGxDnI+2WJB
 DTos2u39yRdAXBLCRfIJTXPLNWiG0uNzfABKsPADwpBmN5pxviUlt+9avQK9FWy07T+q
 xiWdcxrvmimZiN0wo6wrzqYbgFxzQahhs1auJpC6jFqlFu8GNvG2SsqboC8lbHIg5KC9
 Hzn7p67YLffS6TlUh9zjF5hXK7WuotoWqAmPbGL9rfPIWlNEvjkMz+P+nxfnpIpn+C71
 sJGtJxTZTQDb+OBS3GIQ1bFs5QbzghPtv/kQStxylRbvfDztYqJHDoWkH99+F6pmMQuo
 ND4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dG7yGVyYRsmBVSh74cgqDY3U7gtNUa3Uc2Su87aJNdM=;
 b=V4TpzvxLGWoPlmaDNeg8nB9GShOG2zIO1vIUMfYiBe2O+Gel+lJbEpNS1B8ZSPvzt3
 ly7FhHOnJubyb+lbFlIUE8o08DNHiBMS7Ct2GCFByXeRHS16KTbTlhqWTad8BRv/7Bqd
 SbOjDJV6JqffKix+qs6xB3f6q2TP88aQGte8z6HDuDGNmcERedGF0xZgaYKL7jHSzpV1
 4U2d2ixEt1BwkbAs5tzRfhXhl1vFRByRXaBrz5Jr8OvWf9Ex+F65ES1GDer6zip2sHa0
 TDNOyIHnFTmGiIqTcNO3bS5+5b5/174GVG0pdaCC7EquRAz1mGhVemWrTPYnYQ0woO+0
 aG7g==
X-Gm-Message-State: ANoB5pmM6zhTCgmUaeZxIlbwO73IBgo0mfxFdyS0Y7nakIALrGfCPOqJ
 uV4AdGR075sFasViM9OznTmvEQ==
X-Google-Smtp-Source: AA0mqf7hc58DyjVflxiSb1V/1fJSNkwZ19NDZJw8GfHZSbOljH7OaSRr15ONo4QvN6myXLlSPxLR1g==
X-Received: by 2002:a2e:321a:0:b0:279:7974:4471 with SMTP id
 y26-20020a2e321a000000b0027979744471mr17612614ljy.495.1670258581262; 
 Mon, 05 Dec 2022 08:43:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a056512070b00b00494935ddb88sm2165575lfs.240.2022.12.05.08.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:43:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] dt-bindings: Drop Jee Heng Sia
Date: Mon,  5 Dec 2022 17:42:54 +0100
Message-Id: <20221205164254.36418-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Emails to Jee Heng Sia bounce ("550 #5.1.0 Address rejected.").  Add
Keembay platform maintainers as Keembay I2S maintainers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Mark Brown <broonie@kernel.org>

---

Changes since v1:
1. Correct email format in keembay-i2s.
2. Add Ack tag.
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml    | 1 -
 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 67aa7bb6d36a..ad107a4d3b33 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -8,7 +8,6 @@ title: Synopsys DesignWare AXI DMA Controller
 
 maintainers:
   - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
-  - Jee Heng Sia <jee.heng.sia@intel.com>
 
 description:
   Synopsys DesignWare AXI DMA Controller DT Binding
diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
index 2ac0a4b3cd18..76b6f2cf25df 100644
--- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -8,7 +8,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel KeemBay I2S
 
 maintainers:
-  - Sia, Jee Heng <jee.heng.sia@intel.com>
+  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+  - Paul J. Murphy <paul.j.murphy@intel.com>
 
 description: |
  Intel KeemBay I2S
-- 
2.34.1

