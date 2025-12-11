Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8BCB596B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Dec 2025 12:02:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186AF60218;
	Thu, 11 Dec 2025 12:01:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186AF60218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765450907;
	bh=dxEpoxf8ROC5rbeCPkM+WaKqXNKSrdFX8M7+dsyC+oQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iK+u6WzYt4e86r6U6S5/I0rlYQuwzsdLsV5lxscaFbwDLQD7Mj4rAfHyFCg/dcSTf
	 DOa5mnW7gs4aB2lL8CpRmWzvVr1Wji1KLOEMEtWOOaIIQjSX9qd8QnKwlK8fmZmC+U
	 jqEz8TA5k1TgKxA4mI6yxIrZFbnq2M3JMt5TjiIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A467CF805D9; Thu, 11 Dec 2025 12:01:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3ECF805D4;
	Thu, 11 Dec 2025 12:01:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BF69F804FF; Thu, 11 Dec 2025 12:00:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3C0FF804CC
	for <alsa-devel@alsa-project.org>; Thu, 11 Dec 2025 12:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C0FF804CC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=G9L4X+WI
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BBB09rQ42044077,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765450809; bh=H1PguWTRXIamnL2BsbHyUzpqHoLAZq5lQOwYrLg2TxY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=G9L4X+WIHyA2kd8urN/ikOF/FcC+nD++FouNTeu82W1/PcKl+4pv1Ea/zj0p821wk
	 WKjWQH/lYSrZEQ54HkIQwe2qB8AQrfaQy3uF38xlCUjJo1bV3Se6a8bOib0CbuzgTz
	 bk/0+MjZLQx6VFwG4Fd7o1uKEcUnTFSc+x9UGttxY/B8PSYeBvzefB3JNACpNdl7lK
	 6EscH47iQTdI49esVT24MEYqqDHSxCz4XRcQ4kLQvACULoZqvAF+764pbxtYUV9e7A
	 wn8Clm2YuJGqNz/BqdCShZfOG3QdhcfeLJAyfyXDVqQllgiwb+BVpu06f3G4CYCsAC
	 t+plyOnY41d6w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BBB09rQ42044077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Dec 2025 19:00:09 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 11 Dec 2025 19:00:08 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 11 Dec 2025 19:00:08 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 11 Dec 2025 19:00:08 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <cezary.rojewski@intel.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v9 0/2] ASoC: rt5575: Add the codec driver for the ALC5575
Date: Thu, 11 Dec 2025 19:01:28 +0800
Message-ID: <20251211110130.2925541-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: OZJRXUDCW6PV4DHOIY2WR7SXMZSLA44W
X-Message-ID-Hash: OZJRXUDCW6PV4DHOIY2WR7SXMZSLA44W
X-MailFrom: oder_chiou@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZJRXUDCW6PV4DHOIY2WR7SXMZSLA44W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

This patch series adds support for the Realtek ALC5575 audio codec.

Changes in v9:
- Patch 1/2:
  - modify the comment
  - change the compatible name to "realtek,rt5575-use-spi"
- Patch 2/2:
  - remove the standalone rt5575_spi_driver module and integrate its
    functionality into the I2C driver
  - move the SPI firmware-loading function to rt5575-spi.c
  - use the match data to distinguish between w/wo flash
  - minor fixes

Changes in v8:
- Patch 1/2:
  - remove the variable rt5575_spi_ready
  - use the multiple compatible names to distinguish between w/wo flash
- Patch 2/2:
  - add compatible enum "realtek,rt5575-with-spi"
- Link to v8: https://lore.kernel.org/all/20251201105926.1714341-1-oder_chiou@realtek.com/

Changes in v7:
- Patch 1/2:
  - add a caption for the tristates
  - remove the redundant enum of the SPI command
  - add the error log in the request firmware failure
  - change the function name rt5575_spi_fw_loaded to rt5575_fw_load_by_spi
  - minor fixes
- Patch 2/2:
  - modify commit message
- Link to v7: https://lore.kernel.org/all/20251121084112.743518-1-oder_chiou@realtek.com/

Changes in v6:
- Patch 1/2:
  - modify commit message
  - add select SND_SOC_RT5575 to config SND_SOC_RT5575_SPI in the Kconfig
  - revise the boiler plate in the head of the file
  - sort the include files
  - use a structure to transfer the spi data
  - use the poll() related function instead the for-loop
  - revise the UUID to the private ID
  - minor fixes
- Patch 2/2:
  - modify description
- Link to v6: https://lore.kernel.org/all/20251031073245.3629060-1-oder_chiou@realtek.com/

Changes in v2 to v5:
- Patch 1/2:
  - move the firmware to the subdirectory
  - remove the empty functions
  - remove the cache_type in the regmap_config
  - add the error log in the run firmware failure
- Patch 2/2:
  - nothing
- Link to v5: https://lore.kernel.org/all/20251015103404.3075684-1-oder_chiou@realtek.com/

Oder Chiou (2):
  ASoC: dt-bindings: realtek,rt5575: add support for ALC5575
  ASoC: rt5575: Add the codec driver for the ALC5575

 .../bindings/sound/realtek,rt5575.yaml        |  44 +++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   3 +
 sound/soc/codecs/rt5575-spi.c                 | 102 +++++
 sound/soc/codecs/rt5575-spi.h                 |  26 ++
 sound/soc/codecs/rt5575.c                     | 363 ++++++++++++++++++
 sound/soc/codecs/rt5575.h                     |  59 +++
 7 files changed, 607 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
 create mode 100644 sound/soc/codecs/rt5575-spi.c
 create mode 100644 sound/soc/codecs/rt5575-spi.h
 create mode 100644 sound/soc/codecs/rt5575.c
 create mode 100644 sound/soc/codecs/rt5575.h

-- 
2.52.0

