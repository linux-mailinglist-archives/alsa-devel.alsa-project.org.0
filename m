Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9226C76FEEA
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 12:49:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C41B96C0;
	Fri,  4 Aug 2023 12:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C41B96C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691146162;
	bh=/34w4KoMtU/SRCKwq2wOhBeZC45fWKwmEBKI/PYi7pA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CKECMJ2np5JvsZZQlONkT0WIJ0a533bPuBikqz3aIuNehZFITxq6YxZ5YgdCY628n
	 aHOD1toFPM8ckd2obPbR3ZLsAC0B9pe2ZIxhZ5h0bSXYUIHZBLnOkUa2VktlC09vIu
	 dtANFPlPgIDYRQrltHFPtWVuVNpTngptWZBq0t0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACFA3F8016D; Fri,  4 Aug 2023 12:47:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E9C9F80520;
	Fri,  4 Aug 2023 12:47:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A27BFF80548; Fri,  4 Aug 2023 12:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDAD1F801D5
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 12:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDAD1F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Gma9KELQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3747k7Iu019147;
	Fri, 4 Aug 2023 05:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=r
	8Yx7WO8+0xNOiJQ5ikK7v/i2XOpzmGEHSJwnmdsOwM=; b=Gma9KELQjkrb2KFEp
	c8xGb5P6+Prk0ou8EcwgBvZSg6ZoWHL2E/D2WKfnjlEISjahLHwjoTdBUkMh0rPb
	Xsy5YCNLp3IGV+Ax5JDWottcBoYKNIKxxMwbYil12AdIsOixtpEXItEz0pCrqaRI
	xWAtiGYE4Th4px6FGOJ7bM1AYpO0ogQXIn70KBVah8qPH3agsJP5CBYfs1vNl6BG
	nqmv9YLNfaB2+DsYpwHTLBxxxk9rBz3hRBrL5YwLOAo77hIWvBEi/fTOw1DHC8NW
	NcwDdA/ZJ/KBMZZpg/b9hBkVE1icZD8xnG+n8J3oUP7ozKynuzxV0TvyyzLkv8bw
	KpGTg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1y4bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:46:04 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 4 Aug
 2023 11:46:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 4 Aug 2023 11:46:02 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7BCFF3563;
	Fri,  4 Aug 2023 10:46:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <lee@kernel.org>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <linus.walleij@linaro.org>, <vkoul@kernel.org>,
        <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/6] Add cs42l43 PC focused SoundWire CODEC
Date: Fri, 4 Aug 2023 11:45:56 +0100
Message-ID: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: D7s0STfFiagBEJQnAhTSZvzqojJc6WIj
X-Proofpoint-ORIG-GUID: D7s0STfFiagBEJQnAhTSZvzqojJc6WIj
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GEZJO7K5F3NNMWWXPKKP3NUOX6WQP6CD
X-Message-ID-Hash: GEZJO7K5F3NNMWWXPKKP3NUOX6WQP6CD
X-MailFrom: prvs=3580138b0b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEZJO7K5F3NNMWWXPKKP3NUOX6WQP6CD/>
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

This series is mostly just a resend keeping pace with the kernel under
it, except for a minor fixup in the ASoC stuff.

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
 drivers/mfd/cs42l43.c                         | 1188 +++++++++
 drivers/mfd/cs42l43.h                         |   28 +
 drivers/pinctrl/cirrus/Kconfig                |   11 +
 drivers/pinctrl/cirrus/Makefile               |    2 +
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c      |  609 +++++
 drivers/soundwire/bus.c                       |   32 +
 drivers/soundwire/bus_type.c                  |   12 +
 drivers/spi/Kconfig                           |    7 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-cs42l43.c                     |  284 ++
 include/linux/mfd/cs42l43-regs.h              | 1184 +++++++++
 include/linux/mfd/cs42l43.h                   |  102 +
 include/linux/soundwire/sdw.h                 |    9 +
 include/sound/cs42l43.h                       |   17 +
 sound/soc/codecs/Kconfig                      |   16 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/cs42l43-jack.c               |  946 +++++++
 sound/soc/codecs/cs42l43-sdw.c                |   74 +
 sound/soc/codecs/cs42l43.c                    | 2278 +++++++++++++++++
 sound/soc/codecs/cs42l43.h                    |  131 +
 26 files changed, 7615 insertions(+)
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

