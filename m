Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E054CF99B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 11:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0BB116BB;
	Mon,  7 Mar 2022 11:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0BB116BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646647645;
	bh=g+E2cqWn9Vq/Ut2H92s1dRBvdhhumC0Wle7tlrJx1G8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rkNyq5XLwz3/gP7uunRzeP4/45ZiAkTBGaFcLP3C8PxTSAF76XRLhUQNGbQYayMLG
	 De7YrDSqZhE5WvIOT0WwaQ//ePsVXREQ9s25tsGlXsDggvrwzK9S/O+crv1fUWtncG
	 Aha2eVKsde9s3yGV9tqFcAzgWImLy9QknhCz6+Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69D34F80271;
	Mon,  7 Mar 2022 11:06:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46C4FF800E9; Mon,  7 Mar 2022 11:06:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3153F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:06:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3153F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="14jBiRsL"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646647573; x=1678183573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g+E2cqWn9Vq/Ut2H92s1dRBvdhhumC0Wle7tlrJx1G8=;
 b=14jBiRsLoqHmykQeFbV6tfohfopfVqankARiFYX9gQqBDNLFuRQo51ud
 Vcv2qHisCyolAJvFJCzz71C5aFci6w2G1nF/cPz4KnEdatcDkf2HQ7TEm
 BK8pcnIlDQFfFCL6GaDU/0KPKzOkVUUJ2fBZ7XKNElDuq0O6h+q4VxBn4
 SZy8tAgWUnua8plGICjU5YwXuJ+aEORcQ1FkrQrTQz0wablb2ilpKiBte
 2yVCkx2KRo0lp3106ZH0UWDSuasgi5xOgwpYQFphMNTOOHKc2qM91szZ1
 S9oQBSERcyYgSYZcDZStt6TVKsOHovZEPps9QU9dPibgEku8fsX4gJBMX A==;
X-IronPort-AV: E=Sophos;i="5.90,161,1643698800"; d="scan'208";a="88045514"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 03:06:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 03:05:56 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 03:05:53 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/6] Add driver for SAMA7G5's PDMC
Date: Mon, 7 Mar 2022 12:04:22 +0200
Message-ID: <20220307100428.2227511-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, nicolas.ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

This patch series adds support for Pulse Density Microphone Controller
(PDMC), present on Microchip's SAMA7G5.
The PDMC interfaces up to 4 digital microphones having Pulse Density
Modulated (PDM) outputs. It generates a single clock line and samples 1 or
2 data lines. The signal path includes an audio grade programmable
decimation filter and outputs 24-bit audio words.
The source of each channel can be independently defined as PDMC_DS0 or
PDMC_DS1, sampled at the rising or falling edge of PDMC_CLK.

The patch series starts with a fix on the ASoC DMA engine support. Then
continues with the bindings and the driver of PDMC. It is followed by the
DT nodes for SAMA7G5 and SAMA7G5-EK. In the end, the drivers for PDMC
and PDM microphones are enabled in sama7_defconfig.

Changes in v2:
 - addressed comments from Krzysztof Kozlowski

Codrin Ciubotariu (6):
  ASoC: dmaengine: do not use a NULL prepare_slave_config() callback
  ASoC: dt-bindings: Document Microchip's PDMC
  ASoC: atmel: mchp-pdmc: add PDMC driver
  ARM: dts: at91: sama7g5: add nodes for PDMC
  ARM: dts: at91: sama7g5ek: add node for PDMC0
  ARM: configs: at91: sama7_defconfig: add MCHP PDMC and DMIC drivers

 .../bindings/sound/microchip,pdmc.yaml        |   99 ++
 arch/arm/boot/dts/at91-sama7g5ek.dts          |   21 +-
 arch/arm/boot/dts/sama7g5.dtsi                |   24 +
 arch/arm/configs/sama7_defconfig              |    2 +
 include/dt-bindings/sound/microchip,pdmc.h    |   13 +
 sound/soc/atmel/Kconfig                       |   16 +
 sound/soc/atmel/Makefile                      |    2 +
 sound/soc/atmel/mchp-pdmc.c                   | 1084 +++++++++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c         |    6 +-
 9 files changed, 1263 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
 create mode 100644 include/dt-bindings/sound/microchip,pdmc.h
 create mode 100644 sound/soc/atmel/mchp-pdmc.c

-- 
2.32.0

