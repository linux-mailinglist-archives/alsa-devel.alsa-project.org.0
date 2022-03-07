Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B053C4CFE38
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 13:23:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 369861684;
	Mon,  7 Mar 2022 13:23:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 369861684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646655839;
	bh=spsawEYSjp/d7MCTT2764LMfhdtbBorYSiNJakeTrHw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BefD8QpYgDmLAIVfGkJDfYSmB59uIUg58/yOwtDOgTPHNLKFaFSLBE0GT60pEhP6e
	 0b9gnuLQSUc8wY7R6o6O25azXpqWRANLOr1OjtQ/pIXIG+OTLnisEMAtBEAHXT1/CU
	 oAIVmR+QA++rhkI5eLhGQW5H6lAuQWY/BP5sS10A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71AFEF8020D;
	Mon,  7 Mar 2022 13:22:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C1A4F80124; Mon,  7 Mar 2022 13:22:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54C94F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 13:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54C94F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="GEejmrBF"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646655768; x=1678191768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=spsawEYSjp/d7MCTT2764LMfhdtbBorYSiNJakeTrHw=;
 b=GEejmrBFjtt6cFU+21DPSTk63h4fmfl7saW9J2rNCT14Wzvz29nmI2Q7
 r3uPNKgC2RRC0HvFxRlhq7pSK3oni2YihKwjrNAxOXJ59usauPediO08X
 savVHWDcqDN9YoJB4RUlkNd5nd0lXX/8gT66Zwi8IYKwda243MkFghUcr
 pDxAC3CiJBznjxW4O+OHnVIgR/FxCZa17GuvVk6pKPC/0g2Uc0p+Qwft+
 tvYxNdsWgQ1LAaXBv8iBy97kBX59Da/bClWklx/jy9uDyxvBpYTnO6RPE
 Pk4yoyWD6G6czfGyRuo1J2NU2iqruJH1dK1GzCg9t2IvbUjj8GYGjfQKW w==;
X-IronPort-AV: E=Sophos;i="5.90,162,1643698800"; d="scan'208";a="164766682"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 05:22:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 05:22:41 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 05:22:38 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/6] Add driver for SAMA7G5's PDMC
Date: Mon, 7 Mar 2022 14:21:56 +0200
Message-ID: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
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

Changes in v3:
 - addressed new DT bindings comments from Krzysztof Kozlowski

Changes in v2:
 - addressed DT bindings comments from Krzysztof Kozlowski

Codrin Ciubotariu (6):
  ASoC: dmaengine: do not use a NULL prepare_slave_config() callback
  ASoC: dt-bindings: Document Microchip's PDMC
  ASoC: atmel: mchp-pdmc: add PDMC driver
  ARM: dts: at91: sama7g5: add nodes for PDMC
  ARM: dts: at91: sama7g5ek: add node for PDMC0
  ARM: configs: at91: sama7_defconfig: add MCHP PDMC and DMIC drivers

 .../bindings/sound/microchip,pdmc.yaml        |  100 ++
 arch/arm/boot/dts/at91-sama7g5ek.dts          |   21 +-
 arch/arm/boot/dts/sama7g5.dtsi                |   24 +
 arch/arm/configs/sama7_defconfig              |    2 +
 include/dt-bindings/sound/microchip,pdmc.h    |   13 +
 sound/soc/atmel/Kconfig                       |   16 +
 sound/soc/atmel/Makefile                      |    2 +
 sound/soc/atmel/mchp-pdmc.c                   | 1084 +++++++++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c         |    6 +-
 9 files changed, 1264 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
 create mode 100644 include/dt-bindings/sound/microchip,pdmc.h
 create mode 100644 sound/soc/atmel/mchp-pdmc.c

-- 
2.32.0

