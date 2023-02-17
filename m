Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245569ABBB
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 13:43:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA1EF10;
	Fri, 17 Feb 2023 13:42:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA1EF10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676637795;
	bh=U2iLnm4KuI3Sgwn+ds9QR6hu9ocdgvXPg7MffzvqL48=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=utdVdS6jZ53RoWkNQO6qRbFTJJzGZUWOzUWAPBdGBPwqt7blN4BYTThg1dujVYSRo
	 VpIJDAwiocAnvU7A/T874JN4AT98sMJJjSgVlJb/UdqX0xpP53SMSstukUcxy5vtYq
	 HhuNCV/Hi6u24+dldGGh4LQQ2P54pUa36C1MPn+c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FC3DF800AA;
	Fri, 17 Feb 2023 13:42:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 242EFF801C0; Fri, 17 Feb 2023 13:42:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D56BF800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 13:42:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D56BF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=wrz/iJO0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676637731; x=1708173731;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U2iLnm4KuI3Sgwn+ds9QR6hu9ocdgvXPg7MffzvqL48=;
  b=wrz/iJO0r9nWyY6o/RptJCLgZ0s8cgWCm/Jk/ZPs9MUToyPFVWm1ca7D
   mI0p0SXuW7j5ep31wCDBYvFRjBSKdGaA1xgAh0hdbhS3jOsAeSLSceMjM
   iCnBYg2HCeY6p4s+MbGpPotWIbjzGtJK/ME7UpZR3GkLbeuL/Mtpk9OQ2
   IxbQmtAtguaznKa5OsYaGzSzIY702AsX9DM7BObGUqwUQmtxh7w7YH5w6
   jS9/kWqX6SWcuF4sqBgw01LHHSpRnNW1x1IGyf4xuAwtWXqdtFP5lPDFH
   6NKCRWoNB9oRV5zyB6f+dKuAZCZpVqYpHn+qg+tFTVV36C2G1dh6vLFmU
   g==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669100400";
   d="scan'208";a="137771389"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Feb 2023 05:42:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 05:42:03 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 05:42:00 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 0/3] ASoC: mchp-pdmc: fix poc noises when starting capture
Date: Fri, 17 Feb 2023 14:41:48 +0200
Message-ID: <20230217124151.236216-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: MRQ6C7HDF4VBU6ZV7HT457SMH2OIKGGD
X-Message-ID-Hash: MRQ6C7HDF4VBU6ZV7HT457SMH2OIKGGD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MRQ6C7HDF4VBU6ZV7HT457SMH2OIKGGD/>
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

 .../sound/microchip,sama7g5-pdmc.yaml         |  6 ++
 include/sound/soc-component.h                 |  2 +
 sound/soc/atmel/mchp-pdmc.c                   | 55 +++++++++++++++++--
 sound/soc/soc-pcm.c                           | 27 +++++++--
 4 files changed, 80 insertions(+), 10 deletions(-)

-- 
2.34.1

