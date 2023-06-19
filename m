Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9485A73513A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 11:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03A984C;
	Mon, 19 Jun 2023 11:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03A984C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687168701;
	bh=1QABusYxr1nTlV9ri3HwAfQjZVjcWfDUUzFgT9o8430=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZXzgi9/CyG3yMLXtsVeVx0qUz86r4wt8+0+UUpnwt2x9zTWF5tEwllBBrh7tgkroq
	 RjWohjnHRj/Th5GehYxq77wrLWODmwPujr+a/OnlxVop09QMfLmVDN5L9dfeM4oeXK
	 TzMUF+vAZfDE9xKd9MqUvOd/Tv5uNG/dZiYJne+k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22CE2F80217; Mon, 19 Jun 2023 11:56:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7247F80557;
	Mon, 19 Jun 2023 11:56:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F88BF8052E; Mon, 19 Jun 2023 11:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BA57F80217
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 11:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BA57F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fPahJfu1
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35J5L9Dq009890;
	Mon, 19 Jun 2023 04:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=TfGrH3Uleie1Co1qiJ5GXAl8Q/ErU0G0tmVgE1EhgVI=;
 b=fPahJfu1hiHC0O+7Ef5ILbXEx81HpcTUo+uDRypi6ALV7e9sV9AcHvnndrqgZbnAva0J
 PD0jp0oq92RqYroI3/jc1K5oIN6Q1d8i5aP2ttrEWRoeTp3gv8p28SEC3S7GZB/gBwoA
 EsMasIH/Cytq1ouI8WBW0NHoaNvcJSQyZ0ItzDnHKDhOfZrS7ni7743t4P1prh/3Czfd
 QymCk75DkZJkMAcfcf5hO0c1580kAz5XlYniBh95ZdGoh+pEUFJJQU/2+QqsDe+/PaFt
 KTIPplZM/4g/sYf8fobXPAIq2yr3o05Ajhas1g88EuAVBvKQZCYE/ZfxQ9RQdjibUQas iw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3r9a809n3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 04:56:25 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 19 Jun
 2023 10:56:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 19 Jun 2023 10:56:23 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 386D246B;
	Mon, 19 Jun 2023 09:56:23 +0000 (UTC)
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
Subject: [PATCH v5 0/6] Add cs42l43 PC focused SoundWire CODEC
Date: Mon, 19 Jun 2023 10:56:17 +0100
Message-ID: <20230619095623.1987742-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TwJIzOos5_RoQCCaIygw3wlU1xV9vY00
X-Proofpoint-GUID: TwJIzOos5_RoQCCaIygw3wlU1xV9vY00
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: C5CZ4YM6OJGGPIUJLK4AQR6M5FIBDISN
X-Message-ID-Hash: C5CZ4YM6OJGGPIUJLK4AQR6M5FIBDISN
X-MailFrom: prvs=153447c1f4=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5CZ4YM6OJGGPIUJLK4AQR6M5FIBDISN/>
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

 .../bindings/sound/cirrus,cs42l43.yaml        |  313 +++
 MAINTAINERS                                   |    4 +
 drivers/mfd/Kconfig                           |   23 +
 drivers/mfd/Makefile                          |    3 +
 drivers/mfd/cs42l43-i2c.c                     |   98 +
 drivers/mfd/cs42l43-sdw.c                     |  239 ++
 drivers/mfd/cs42l43.c                         | 1189 +++++++++
 drivers/mfd/cs42l43.h                         |   28 +
 drivers/pinctrl/cirrus/Kconfig                |   11 +
 drivers/pinctrl/cirrus/Makefile               |    2 +
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c      |  609 +++++
 drivers/soundwire/bus.c                       |   32 +
 drivers/soundwire/bus_type.c                  |   12 +
 drivers/spi/Kconfig                           |    7 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-cs42l43.c                     |  281 ++
 include/linux/mfd/cs42l43-regs.h              | 1184 +++++++++
 include/linux/mfd/cs42l43.h                   |  102 +
 include/linux/soundwire/sdw.h                 |    9 +
 include/sound/cs42l43.h                       |   17 +
 sound/soc/codecs/Kconfig                      |   16 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/cs42l43-jack.c               |  969 +++++++
 sound/soc/codecs/cs42l43-sdw.c                |   74 +
 sound/soc/codecs/cs42l43.c                    | 2278 +++++++++++++++++
 sound/soc/codecs/cs42l43.h                    |  131 +
 26 files changed, 7636 insertions(+)
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

