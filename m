Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C16417C4
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Dec 2022 17:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14FD01758;
	Sat,  3 Dec 2022 17:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14FD01758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670084576;
	bh=01MpzqvJm/lra3VZVb8HLYSy3lRNeQjtBPNw8NJ5MA8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ILX6ZzANG2/5AzCS/jyrINtQKc2tEAGeyrxI0owqyEUkFTYrN4fdo49s96UZVgeEK
	 AyfCLWnNAREqfLDcSVfIOWgHTLuMzh9iH5w08auObjmzL8Mg5fPU7Xq8k2g3ffvFcV
	 j0HeuJfhit16cusiWpO6wMygSmZDBbR4MXBnkRwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE84F800BD;
	Sat,  3 Dec 2022 17:22:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA9DCF8030F; Sat,  3 Dec 2022 17:21:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D47DF80249
 for <alsa-devel@alsa-project.org>; Sat,  3 Dec 2022 17:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D47DF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LQw7z2kj"
Received: by mail-lj1-x233.google.com with SMTP id z24so8699791ljn.4
 for <alsa-devel@alsa-project.org>; Sat, 03 Dec 2022 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WmsziUEVNyrB815nizPNa/ZJ8qOnilpxFHdElLoBzSA=;
 b=LQw7z2kjsssWSsBkfx3bILAe/YLOZgyD4Y16sUlwmkJvefhwXkM7WWNyj+p6fomstF
 Jm9rxTMlweprI+gzh0Znx/J4CbO3jm9aPGU3zMlQd2QXpFvZowYUp2QN0ECtRe5/3aqY
 +mBoN2lDn9AIWGJUAypg9WvcLh8JHlqKn4cANSZX4OvRGnhQxz8Vg2zYob3XQ9yCU/a+
 48VJfvdMhEGNYGgLliIJH+2IpYwUFIGAkK0AFUNjAGPrl5kUcG1bjLByaZYeKIlWp10G
 SAXnbuv1sShmlUsKDK6AB+8dA7eHnO76ZAGstUzKzivOSjgUtiXZaKgUuM7aYSp0Bi9k
 crgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WmsziUEVNyrB815nizPNa/ZJ8qOnilpxFHdElLoBzSA=;
 b=8HGR/eO7YttV/sWGahrEb+JjEhsUyynbmDWwM1ECAqf77s1t8fovgdaUQWvsNRNXWZ
 9W5b6GjOmdloh03oHcvEXDaQGr7Sf+tFpuFkj5xQ1yWJstd+bQ15N1IsMC33h1bkCYei
 Nc6Qp0QGD+4lNDJt2On+QWbMFm+KnrakHcv1ch168R8bxSVdcMvuomEni08Xbxn/qupw
 hHN6m7DR7OTqmfmLp1xv+z4/Wllc1tCxFd2Vkp07WSvJBkU+2JRzE7gDrqzcNcpT12nW
 wk994UaEhvpd+NKbS2eutIwYaPh5nkK7TzD3gZNMDyWtnOMX/pOpYJyHzbTKHePReBoX
 PHTg==
X-Gm-Message-State: ANoB5pm/WWp8X4DozFscoNEfwWBkCt/0MjqwIUjpsBLggq4KYSEN8AI5
 NJHisyh+7tQQXJbARlVy3jSCdg==
X-Google-Smtp-Source: AA0mqf7z5dEVm1KfVLYRrxQdVeTEh+cIsEEzj4vzDM1C/l5Tlgc/KhNAEzuPMpsLbJoK8Z5qAGkiiw==
X-Received: by 2002:a2e:9b17:0:b0:279:cd10:a511 with SMTP id
 u23-20020a2e9b17000000b00279cd10a511mr4327347lji.502.1670084509318; 
 Sat, 03 Dec 2022 08:21:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bi35-20020a0565120ea300b004ac6a444b26sm1443935lfb.141.2022.12.03.08.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 08:21:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 1/2] dt-bindings: Drop Jee Heng Sia
Date: Sat,  3 Dec 2022 17:21:43 +0100
Message-Id: <20221203162144.99225-1-krzysztof.kozlowski@linaro.org>
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
index 2ac0a4b3cd18..33ab0be036a1 100644
--- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -8,7 +8,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel KeemBay I2S
 
 maintainers:
-  - Sia, Jee Heng <jee.heng.sia@intel.com>
+  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+  - Paul J. Murphy <paul.j.murphy@intel.com
 
 description: |
  Intel KeemBay I2S
-- 
2.34.1

