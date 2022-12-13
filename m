Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F183364B41D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 12:24:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8849218FE;
	Tue, 13 Dec 2022 12:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8849218FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670930681;
	bh=O6Yhf97L/pahv9g9FCa7RxbB9udp6xC8MQ4GIoD13oM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YWls4Dfxhrbq19/3WTo4LnO6WuEtlfNllxUWyDwwn5mxBGWYQfhrhhRiAiHXvsq+S
	 UP/sl/GCYgS1vBjV4eS/xEbBKWGZABjxZxg/Xwh5y1OgXYK9XkcllKQm7n3G3p4dpF
	 hjmzfVZqVXDd20N4cQA62euyBeIHqzaTZEXkN1Ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 235FAF804D6;
	Tue, 13 Dec 2022 12:23:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2020FF804E2; Tue, 13 Dec 2022 12:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49D06F80272
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 12:23:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49D06F80272
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=FwxIP6/f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670930620; x=1702466620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O6Yhf97L/pahv9g9FCa7RxbB9udp6xC8MQ4GIoD13oM=;
 b=FwxIP6/fn2cTvvCAWDE7l7da9P/dj5VX8Qh5Tf3rZI4sN5JEbXqhtOJM
 B8ZMUxPr6a5m/HYKaxTPs66StLYj2g1ul/nKUeXY2Llr/ufVK9PYUzgt1
 HLjiwKvTc1SgRFE9mEXpQH5JbbaIBNKdJ82yZEisgbX1LJdp/LBUMhUmD
 01fgInO69m4FbpVOSikwCyugqkGOWlg3Ml7QM7tuC85Fezt7edKY00gAc
 P6ZNdNp7oR/0aGnsFKd9zB9pMxchby6ISoe9zegxHgg6btJEIIkQholPz
 9yDdmJy/lrhSbH5guHS7j+cRt2kk3G6YLDtoj3EG9Y6thTKHMknmzTXuY g==;
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="192862226"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Dec 2022 04:23:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 04:23:35 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 04:23:32 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 1/4] ASoC: dt-bindings: microchip: use proper naming syntax
Date: Tue, 13 Dec 2022 13:28:48 +0200
Message-ID: <20221213112851.89212-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221213112851.89212-1-claudiu.beznea@microchip.com>
References: <20221213112851.89212-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use the following syntax for Microchip ASoC YAML files:
vendor,device.yaml

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 .../sound/{mchp,i2s-mcc.yaml => microchip,sama7g5-i2smcc.yaml}  | 2 +-
 .../sound/{microchip,pdmc.yaml => microchip,sama7g5-pdmc.yaml}  | 2 +-
 .../sound/{mchp,spdifrx.yaml => microchip,sama7g5-spdifrx.yaml} | 2 +-
 .../sound/{mchp,spdiftx.yaml => microchip,sama7g5-spdiftx.yaml} | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/sound/{mchp,i2s-mcc.yaml => microchip,sama7g5-i2smcc.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{microchip,pdmc.yaml => microchip,sama7g5-pdmc.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdifrx.yaml => microchip,sama7g5-spdifrx.yaml} (95%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdiftx.yaml => microchip,sama7g5-spdiftx.yaml} (95%)

diff --git a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
rename to Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
index 0481315cb5f2..68423f43ac3a 100644
--- a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/mchp,i2s-mcc.yaml#
+$id: http://devicetree.org/schemas/sound/microchip,sama7g5-i2smcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microchip I2S Multi-Channel Controller
diff --git a/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
rename to Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
index 04414eb4ada9..7cc80dac980c 100644
--- a/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/microchip,pdmc.yaml#
+$id: http://devicetree.org/schemas/sound/microchip,sama7g5-pdmc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microchip Pulse Density Microphone Controller
diff --git a/Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml
rename to Documentation/devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml
index 970311143253..5121ea1600ae 100644
--- a/Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/mchp,spdifrx.yaml#
+$id: http://devicetree.org/schemas/sound/microchip,sama7g5-spdifrx.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microchip S/PDIF Rx Controller Device Tree Bindings
diff --git a/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdiftx.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
rename to Documentation/devicetree/bindings/sound/microchip,sama7g5-spdiftx.yaml
index d5c022e49526..d13e76269250 100644
--- a/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdiftx.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sound/mchp,spdiftx.yaml#
+$id: http://devicetree.org/schemas/sound/microchip,sama7g5-spdiftx.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microchip S/PDIF Tx Controller Device Tree Bindings
-- 
2.34.1

