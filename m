Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6682649F84
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 14:11:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 431E417A7;
	Mon, 12 Dec 2022 14:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 431E417A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670850685;
	bh=e//N1Ul0zdozGL+xk16ZGECF6oEtAqvvXdxDSJ4w5mg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ose2y08n0jYYCPUsSMu7tdDBDaO6rltBxsHpB9m4fHkeff2sFYQCaZfvXucR9S6vK
	 vMAJ1C1i1lsSa6dopwOtBuHozpeZRsaprpFsVqs2DVD1JOgZVDNinHSy7TnxlTXUqx
	 q5XiznfbnzQIx4iFWCSDG9w77Ck8XC/bl9vJ55gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0ACDF804D0;
	Mon, 12 Dec 2022 14:10:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 409F9F804B4; Mon, 12 Dec 2022 14:10:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C056F80115
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 14:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C056F80115
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=cBL9I4Nf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670850624; x=1702386624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e//N1Ul0zdozGL+xk16ZGECF6oEtAqvvXdxDSJ4w5mg=;
 b=cBL9I4NfEHlzTiggRin9/DY4qJVBm5c7nmjgLOa1yQid2s2COL3VkWUw
 1QDiOjpQXq3yekHW58pBSzevEgxPCWbJooWbcMWvXeqWejwlOyqTV2XF9
 ZmBP0YpAZEf9tiyUOHTPCwgJ4ONagrzmOUbiNY+WgKdeSgcKtkWqjJswe
 K3QkKcQRHGA6FW+/TWziMF5h+lpojM3qvZiK1px4bmAGzdTiE6aUj8p4U
 5pVBqU/Yv2XeB7NgK11lgBJ8vpOCrZBbvNnqutyD03Ba7YO/ZUuddtH+4
 P+iuvPBK3fet8Mea4anphK3FpKrQIaj4W1HPPUrVeoVqOU1lzWOsWAUh9 Q==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="187716827"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Dec 2022 06:10:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 06:10:15 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 06:10:12 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/4] ASoC: microchip: power saving features and cleanups
Date: Mon, 12 Dec 2022 15:15:31 +0200
Message-ID: <20221212131535.76111-1-claudiu.beznea@microchip.com>
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

Claudiu Beznea (4):
  ASoC: dt-bindings: microchip: use proper naming syntax
  ASoC: mchp-pdmc: use runtime pm for clock power saving
  ASoC: mchp-pdmc: add support for suspend to RAM
  ASoC: mchp-spdiftx: use FIELD_PREP() where possible

 ...cc.yaml => microchip,sama7g5-i2s-mcc.yaml} |   0
 ...,pdmc.yaml => microchip,sama7g5-pdmc.yaml} |   0
 ...rx.yaml => microchip,sama7g5-spdifrx.yaml} |   0
 ...tx.yaml => microchip,sama7g5-spdiftx.yaml} |   0
 sound/soc/atmel/mchp-pdmc.c                   | 145 ++++++++++++------
 sound/soc/atmel/mchp-spdiftx.c                |   8 +-
 6 files changed, 101 insertions(+), 52 deletions(-)
 rename Documentation/devicetree/bindings/sound/{mchp,i2s-mcc.yaml => microchip,sama7g5-i2s-mcc.yaml} (100%)
 rename Documentation/devicetree/bindings/sound/{microchip,pdmc.yaml => microchip,sama7g5-pdmc.yaml} (100%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdifrx.yaml => microchip,sama7g5-spdifrx.yaml} (100%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdiftx.yaml => microchip,sama7g5-spdiftx.yaml} (100%)

-- 
2.34.1

