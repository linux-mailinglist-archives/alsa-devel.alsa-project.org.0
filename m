Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F428176A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 18:05:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 252E01F24;
	Fri,  2 Oct 2020 18:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 252E01F24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601654712;
	bh=0xm80mI835j7RsnCf27YVapcCw5rmNqJqXj1F/aXJDg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HO6RD/4hEzq+Uv70uBmx99iBqxDyazfKPXBZO5oKedz8NAtlgPmBogtx57CDBu5JZ
	 Azezt8R1LV22f30LYmtRfP1MaqjxicGclCDq5keh3v1vY843XMwTtzeuJ7qvqIfmct
	 Ax7NSAFFhBcUASQTGw5ZaAPcM7l0xleLVrGjd2fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B337F80247;
	Fri,  2 Oct 2020 18:03:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CE37F80228; Fri,  2 Oct 2020 18:03:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48BE8F801ED
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 18:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48BE8F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="mj9pv+7e"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601654604; x=1633190604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0xm80mI835j7RsnCf27YVapcCw5rmNqJqXj1F/aXJDg=;
 b=mj9pv+7e8eobfIDFrDUFZt8AORgi6LLkvXW6WVaUC+XYpmW+HDI8WS6b
 cWESlIDfdQfN98ENNkLZYZYDPbCsoDRGpDUBbsU/Amep80ioacC0Rys0l
 jhvvKiJHCnLsv4ISJV2HX1oW/bfYZF+bEvy7hmQYhCC4nNbBN04dhsJJe
 7IQgZdU1RMbsNqSUPDjZfP6t6EZiWhw0tCUNUebstq9RzAEV/5yvVe2ju
 DAhxpAh5g+WtS/2s6jdkUP5xF1xlp0fxAm8/DqOCnV4uOelcNSTL3/UBk
 zUHhyY4RaiTmrNM8sVYyyFywNIAfDM0rg2dxWHQcqagr4SIsVw1U47NIb A==;
IronPort-SDR: ERktlbb9SHgHSVs1WBh0+wVf8cBcyCqMHlQ0klUWs2eYzPAhkilLDtnZI034NRrW9SYYQ4y/SF
 TBt+4s0vOUCoF5b4iAub8CAdJeF3LMSgCGhCflj+y1KckMaVv/gZBLSs2WmVc58cyh3/TqQkXH
 Btow4/O+EkpNSg0nOIOalDBdDP4fM/TsYK+FIfb/683JBP/fxGXObqLI650Ts7AjwLadhu+s60
 iWqR7T1NuXSHaJz0MBE7xdmY2NnPhp7ejDVlFqG3q+dq4fomyPqB35UrgOLkvtpTTyRNxT4CC9
 +EA=
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="91238271"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Oct 2020 09:03:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 2 Oct 2020 09:03:14 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 2 Oct 2020 09:02:32 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/2] Add driver for Microchip S/PDIF RX
Date: Fri, 2 Oct 2020 19:03:03 +0300
Message-ID: <20201002160305.815523-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>
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

The Sony/Philips Digital Interface Receiver (SPDIFRX) is a serial port
compliant with the IEC-60958 standard. Among its caracteristics, we
mention the following:
 - SPDIF/AES-EBU Compatible Serial Port
 - 32 Samples FIFO
 - Data Width Configurable to 24 bits, 20 bits or 16 bits
 - Packed and Unpacked Data Support for System Memory Optimization
 - Line State Events Report and Source of Interrupt
 - Line Error Rate Report
 - Full Memory Map of 192 bits for Channel 1 and Channel 2 Status and
   User Data
 - First 32-bit Status A, Status B Change Report and Source of Interrupt
 - Line Digital Filter
 - Register Write Protection
 - Abnormal Software Access and Internal Sequencer Integrity Check Reports

This interface is available in Microchip's SAMA7G5 SoC.

Codrin Ciubotariu (2):
  dt-bindings: sound: add DT bindings for Microchip S/PDIF RX Controller
  ASoC: mchp-spdifrx: add driver for SPDIF RX

 .../bindings/sound/mchp,spdifrx.yaml          |  73 ++
 sound/soc/atmel/Kconfig                       |  13 +
 sound/soc/atmel/Makefile                      |   2 +
 sound/soc/atmel/mchp-spdifrx.c                | 954 ++++++++++++++++++
 4 files changed, 1042 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml
 create mode 100644 sound/soc/atmel/mchp-spdifrx.c

-- 
2.25.1

