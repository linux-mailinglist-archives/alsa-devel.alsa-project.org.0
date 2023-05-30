Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D3715F1A
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 14:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD69E6C1;
	Tue, 30 May 2023 14:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD69E6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685449495;
	bh=uG6y9GxC/xdE8+nhLeSQsxvSYVWp0O2yGaYt0QIFX6w=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TbVKQ47m2L6/4/7ckCer2XYfW7xNMeBXO8s1UXe2rrix3/XIaXbput7wMmNSyAMZR
	 lx4Kcl28VZY57u07B/CBxC0j6T3pARM6haqLR1QWHG/qLFP4lhZMhFYSxzVblIBJzp
	 5h3v/CL/nxoS4gS3NZkbsZqTa45PmZqLCO7VwUgg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6E94F804FC; Tue, 30 May 2023 14:24:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A69F804FC;
	Tue, 30 May 2023 14:24:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F819F80553; Tue, 30 May 2023 14:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C5E6F80510
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 14:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5E6F80510
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UA3y3BVM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UBAOkI020617;
	Tue, 30 May 2023 07:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=2GgFwvas2rFXV4McY7VMK9G2VCTdQUXyqwVMLSgXHI8=;
 b=UA3y3BVM/HgEl3CvdA4HZc2gbM8jFUqQi/CiHcc0ZFNZhofB6Z4XmmYumWJtz5foHWTt
 BKrnlyvQbPQwV5iz49jSEfT+Q9i1f2500/Suca2P+00WIbeZjJ0Dzpa8hPZSWja6uaSP
 vv897JhneMBD31sFIKQ6pEQESlXwvsyW0HPzsJw6dO+VKSrVTxMi5mvOedE7Z2DvSEhB
 ZeGNwSx6Hz1zgd3SWFhxnvog33uNSUBqSlXOCaudeplmUzw2v+7JIs98VR5oUkt6AOCu
 nCi8gwPIvN09qcOjof8KSdWRBYp2Z/y93qrDEo8qe6Nk3Z8ej3UupkGWAp4dvPEb9IKm IA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90u2t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 07:21:14 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 30 May
 2023 13:21:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 30 May 2023 13:21:12 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 840C745;
	Tue, 30 May 2023 12:21:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <lee@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>
CC: <robh+dt@kernel.org>, <conor+dt@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/6] Add cs42l43 PC focused SoundWire CODEC
Date: Tue, 30 May 2023 13:21:06 +0100
Message-ID: <20230530122112.1314458-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mDDcEAkFiQSYVCUwRek4aYj5J8slS2_p
X-Proofpoint-ORIG-GUID: mDDcEAkFiQSYVCUwRek4aYj5J8slS2_p
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BCKMKCOFSBEGFSCOWS6PU5VMLBOCOYJM
X-Message-ID-Hash: BCKMKCOFSBEGFSCOWS6PU5VMLBOCOYJM
X-MailFrom: prvs=1514aa1fe0=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BCKMKCOFSBEGFSCOWS6PU5VMLBOCOYJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch chain adds support for the Cirrus Logic cs42l43 PC focused
SoundWire CODEC. The chain is currently based of Lee's for-mfd-next
branch.

Change notes are included with each patch, most of the changes are
trivial, the notable ones are moving the IRQs out of irqchip and into
the MFD, and moving the DT binding to sound.

Thanks,
Charles

Charles Keepax (4):
  dt-bindings: mfd: cirrus,cs42l43: Add initial DT binding
  mfd: cs42l43: Add support for cs42l43 core driver
  pinctrl: cs42l43: Add support for the cs42l43
  ASoC: cs42l43: Add support for the cs42l43

Lucas Tanure (2):
  soundwire: bus: Allow SoundWire peripherals to register IRQ handlers
  spi: cs42l43: Add SPI controller support

 .../bindings/sound/cirrus,cs42l43.yaml        |  320 +++
 MAINTAINERS                                   |    5 +
 drivers/mfd/Kconfig                           |   23 +
 drivers/mfd/Makefile                          |    3 +
 drivers/mfd/cs42l43-i2c.c                     |   86 +
 drivers/mfd/cs42l43-sdw.c                     |  213 ++
 drivers/mfd/cs42l43.c                         | 1141 +++++++++
 drivers/mfd/cs42l43.h                         |   23 +
 drivers/pinctrl/cirrus/Kconfig                |   11 +
 drivers/pinctrl/cirrus/Makefile               |    2 +
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c      |  609 +++++
 drivers/soundwire/bus.c                       |   31 +
 drivers/soundwire/bus_type.c                  |   12 +
 drivers/spi/Kconfig                           |    7 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-cs42l43.c                     |  279 ++
 include/linux/mfd/cs42l43-regs.h              | 1172 +++++++++
 include/linux/mfd/cs42l43.h                   |  102 +
 include/linux/soundwire/sdw.h                 |    9 +
 include/sound/cs42l43.h                       |   17 +
 sound/soc/codecs/Kconfig                      |   16 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/cs42l43-jack.c               |  951 +++++++
 sound/soc/codecs/cs42l43-sdw.c                |   75 +
 sound/soc/codecs/cs42l43.c                    | 2275 +++++++++++++++++
 sound/soc/codecs/cs42l43.h                    |  126 +
 26 files changed, 7513 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
 create mode 100644 drivers/mfd/cs42l43-i2c.c
 create mode 100644 drivers/mfd/cs42l43-sdw.c
 create mode 100644 drivers/mfd/cs42l43.c
 create mode 100644 drivers/mfd/cs42l43.h
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-cs42l43.c
 create mode 100644 drivers/spi/spi-cs42l43.c
 create mode 100644 include/linux/mfd/cs42l43-regs.h
 create mode 100644 include/linux/mfd/cs42l43.h
 create mode 100644 include/sound/cs42l43.h
 create mode 100644 sound/soc/codecs/cs42l43-jack.c
 create mode 100644 sound/soc/codecs/cs42l43-sdw.c
 create mode 100644 sound/soc/codecs/cs42l43.c
 create mode 100644 sound/soc/codecs/cs42l43.h

-- 
2.30.2

