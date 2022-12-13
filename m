Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B564B41F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 12:25:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B0E21B1;
	Tue, 13 Dec 2022 12:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B0E21B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670930706;
	bh=9xO7lRNTpGk6Xw7msQY+tumPYTeSzK6G728DFAXM2UI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gflFsQE2ZNpwZNq1HSfdCeSSPefA4hx+lNZNPbm0jC9CI7m78mZQIlxPrdHsMknFw
	 IvS80+J20fbhlLQT70Njq0AaZ0rVk73l7HqcX2DEPhRHfi0toCCU1T4UDI3UT+iun2
	 cXbAlqTRLxDPMoA6SEx7qBwWOfPfYlpoWIeg74mI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB2C9F80510;
	Tue, 13 Dec 2022 12:23:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42C3DF804E2; Tue, 13 Dec 2022 12:23:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63928F80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 12:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63928F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=JRfCQLn/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670930619; x=1702466619;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9xO7lRNTpGk6Xw7msQY+tumPYTeSzK6G728DFAXM2UI=;
 b=JRfCQLn/sQvp/w4oeu4y4QsOZ6mdLGqtOrzvjEx8u8msrzoKXizOP9/U
 n5oWaeTdKgltJZd877drYcE2sS2/gT7L3oq7sqX1V9hpaqfJ6UHruI4jO
 4Y1tPRPcHo2uQYFLOcu6wQiQeD4z0N/f1ukRQuL5JDq/S7RqI5qmtkvhG
 csf6t/GPcyXoJKwwYeydTYlV0DoWxFZTSxLDZpEEaW5KgTWWHYp0J9U1I
 +YEDu0ZkZa7pNvPOGHVsa5BTWFDH/TaOg2TyYf2zQ19RvRecWcjnbR5ii
 7ITCJ4rkcXMedFRxKXeJZfwjwTpplbhb7Da5t37nvHiLC1vkdvq1I9EvS Q==;
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="187911739"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Dec 2022 04:23:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 04:23:32 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 04:23:29 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 0/4] ASoC: microchip: power saving features and cleanups
Date: Tue, 13 Dec 2022 13:28:47 +0200
Message-ID: <20221213112851.89212-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
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

Hi,

The following series adds runtime PM and suspend to RAM features for
mchp-pdmc driver.

Along with it 2 cleanup patches were added:
- patch 1/4: use vendor,device.yaml file format for Microchip AT91 ASoC
  bindings
- patch 4/4: use FIELD_PREP() in mchp-spdiftx.c

Thank you,
Claudiu Beznea

Changes in v3:
- in patch 1/4 add back microchip,sama7g5-i2smcc.yaml as it was removed
  by mistake in v2
- in patch 1/4 fixed the schema id to match the new naming

Changes in v2:
- s/microchip,sama7g5-i2s-mcc/microchip,sama7g5-i2smcc as
  this is the 1st available compatible

Claudiu Beznea (4):
  ASoC: dt-bindings: microchip: use proper naming syntax
  ASoC: mchp-pdmc: use runtime pm for clock power saving
  ASoC: mchp-pdmc: add support for suspend to RAM
  ASoC: mchp-spdiftx: use FIELD_PREP() where possible

 ...mcc.yaml => microchip,sama7g5-i2smcc.yaml} |   2 +-
 ...,pdmc.yaml => microchip,sama7g5-pdmc.yaml} |   2 +-
 ...rx.yaml => microchip,sama7g5-spdifrx.yaml} |   2 +-
 ...tx.yaml => microchip,sama7g5-spdiftx.yaml} |   2 +-
 sound/soc/atmel/mchp-pdmc.c                   | 145 ++++++++++++------
 sound/soc/atmel/mchp-spdiftx.c                |   8 +-
 6 files changed, 105 insertions(+), 56 deletions(-)
 rename Documentation/devicetree/bindings/sound/{mchp,i2s-mcc.yaml => microchip,sama7g5-i2smcc.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{microchip,pdmc.yaml => microchip,sama7g5-pdmc.yaml} (97%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdifrx.yaml => microchip,sama7g5-spdifrx.yaml} (95%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdiftx.yaml => microchip,sama7g5-spdiftx.yaml} (95%)

-- 
2.34.1

