Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FABD6A576D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 12:03:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6F8B827;
	Tue, 28 Feb 2023 12:02:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6F8B827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677582186;
	bh=uqW3J0nWK2v55D9GYjZBWcYdTtQfZj4KNiRlbuF0uC8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o7fliNbqrDkgHrYP34doLcI4L/A0/jaMD0/2XIwVChvTXLSS3KeucK5Qj0b9MjrCa
	 80dOyyhehZTg24vFwiA3Qhl/tVrKeFeDeHksE1QJqzq2KK6AtdlU3QjJKsV5iyyX0+
	 xy+8NVx0Dnr4dNb/NrAAeyUIVHHwxQgEySvrtNnI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0B50F800BA;
	Tue, 28 Feb 2023 12:02:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64D0AF804FE; Tue, 28 Feb 2023 12:02:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 398E0F800DF
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 12:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 398E0F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=MAwuakTH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677582122; x=1709118122;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uqW3J0nWK2v55D9GYjZBWcYdTtQfZj4KNiRlbuF0uC8=;
  b=MAwuakTH1qPcUdno+f2qjXx2Xvt9enrjPn9sVUXTvYlN+EhEtxDuhX7N
   rwGnnHvy9I39ifAI2J//DkixB/WhNebV+xCSeyDsJT06fGrIVYWdjcNrg
   RAig65iKlzONp1FAuWL/T752n4nx/z55jGd6ukyUV9vGuVCP073DBRCgj
   E6Ze0b0Ad2lOlXu3wp01Go+wDwnOBIVCgsHQd6AwxwSa2G9/7z5dIDIKr
   VJZ9TQRwyrYh1I8+WXMEUoFSVoZTcFM6tlPjWQpteLeKvSh1eNH9EraEw
   wyZ5CzIgcIhu9JdkTRkfYF986N+OKLAbgCHe281h8QpoT+ORbPLVAwu1x
   A==;
X-IronPort-AV: E=Sophos;i="5.98,221,1673938800";
   d="scan'208";a="213967684"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2023 04:01:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 04:01:54 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 28 Feb 2023 04:01:50 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 0/3] ASoC: mchp-pdmc: fix poc noises when starting capture
Date: Tue, 28 Feb 2023 13:01:42 +0200
Message-ID: <20230228110145.3770525-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: YGQYHLNSGAAHFKXA6FFJFJN4W2HHGA77
X-Message-ID-Hash: YGQYHLNSGAAHFKXA6FFJFJN4W2HHGA77
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGQYHLNSGAAHFKXA6FFJFJN4W2HHGA77/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To start capture on Microchip PDMC the enable bits for each supported
microphone need to be set. After this bit is set the PDMC starts to
receive data from microphones and it considers this data as valid data.
Thus if microphones are not ready the PDMC captures anyway data from its
lines. This data is interpreted by the human ear as poc noises.

To avoid this the following software workaround need to be applied when
starting capture:
1/ enable PDMC channel
2/ wait 150ms
3/ execute 16 dummy reads from RHR
4/ clear interrupts
5/ enable interrupts
6/ enable DMA channel

For this workaround to work step 6 need to be executed at the end.
For step 6 was added patch 1/3 from this series. With this, component
DAI driver sets its struct snd_soc_component_driver::start_dma_last = 1
and proper action is taken based on this flag when starting DAI trigger
vs DMA.

Thank you,
Claudiu Beznea

Changes in v3:
- update the commit message of patch 2/3 to be more descriptive
- in patch 3/3 initialize dd->startup_delay_us before calling
  of_property_read_u32() and don't check its return value; property is optional
  and the the default value is 150ms 

Changes in v2:
- patch 1/3 from v1 is now "ASoC: soc-pcm: add option to start DMA after DAI"
- pass start_dma_last from component DAI driver object
  (struct snd_soc_component_driver::start_dma_last); adapt patch 3/3 after this;
- in patch 1/3 s/Do we need to start dma first/Do we need to start dma last
  in comment from soc_pcm_trigger()
- collect review tag from Krzysztof

Claudiu Beznea (3):
  ASoC: soc-pcm: add option to start DMA after DAI
  ASoC: dt-bindings: sama7g5-pdmc: add microchip,startup-delay-us
    binding
  ASoC: mchp-pdmc: fix poc noise at capture startup


Claudiu Beznea (3):
  ASoC: soc-pcm: add option to start DMA after DAI
  ASoC: dt-bindings: sama7g5-pdmc: add microchip,startup-delay-us
    binding
  ASoC: mchp-pdmc: fix poc noise at capture startup

 .../sound/microchip,sama7g5-pdmc.yaml         |  6 +++
 include/sound/soc-component.h                 |  2 +
 sound/soc/atmel/mchp-pdmc.c                   | 53 +++++++++++++++++--
 sound/soc/soc-pcm.c                           | 27 ++++++++--
 4 files changed, 78 insertions(+), 10 deletions(-)

-- 
2.34.1

