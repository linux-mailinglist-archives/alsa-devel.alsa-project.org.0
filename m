Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC169691C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 17:18:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E12184C;
	Tue, 14 Feb 2023 17:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E12184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676391482;
	bh=Ed9OZgaBIh0K4cnf+bMJJOjsYI0DgmyhIgZsOzpMPvw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=McuHrP0JrNpoID3OFTWLXCenjq7yk1EHPS9g2cMdkiljIoacVHI1gzZMUA54IDln0
	 Ap9yIEIDYKwKIz7qowUBVvp/0e/eiGfXPo6v8lV4JmekoMEtwHwMfxMYCuVLC+VQSp
	 ar1EYJ2HQ5S0OAr4KRjRW3nzJjq5QjPS4Pjj3kYQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C62A8F8047C;
	Tue, 14 Feb 2023 17:17:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B69F801C0; Tue, 14 Feb 2023 17:17:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44FFDF800B6
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 17:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44FFDF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=GCBz07Xl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676391421; x=1707927421;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ed9OZgaBIh0K4cnf+bMJJOjsYI0DgmyhIgZsOzpMPvw=;
  b=GCBz07XlwvQOaC30624zWeyEpCANQmrbpWUow3f0BDDj1cXnaJl/HhdL
   so7H8Gpz3S+533ml7X8D4MxbbGPhO/VAVnSjVrJkxJ1B2TSCAwgMdquX+
   V5ybo2fkYh7DNVZHu35oweDan3JBfKBz17cgEeB/dox/pPzopu/WPxyq6
   Xwg2oCJ5Nz+Za2i8ABUoPCvQQU2e/jBxrRXbZVlF8cQjBPiore9pqQoaM
   yiDiz7uu5zvg3waHTwTcecvaG5UYGIau/jZ3IMySzut/P+/2GZbmMhILk
   AmURp1QWmcGnViDSr52XL01HEoqbi5ruO1bp3n0DNHyqEvvTjRGOOOT5b
   A==;
X-IronPort-AV: E=Sophos;i="5.97,297,1669100400";
   d="scan'208";a="200644035"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Feb 2023 09:16:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 09:16:53 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 09:16:43 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <lars@metafoo.de>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 0/3] ASoC: mchp-pdmc: fix poc noises when starting capture
Date: Tue, 14 Feb 2023 18:14:32 +0200
Message-ID: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: SDNZZI2KI6N3WKAWC5X45WP3LASAZDWJ
X-Message-ID-Hash: SDNZZI2KI6N3WKAWC5X45WP3LASAZDWJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDNZZI2KI6N3WKAWC5X45WP3LASAZDWJ/>
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
For step 6 was added patch 1/3 from this series. With this, driver sets
its struct snd_dmaengine_pcm_config::start_dma_last = 1 and proper
action is taken based on this flag when starting DAI trigger vs DMA.

The other solution that was identified for this was to extend the already
existing mechanism around struct snd_soc_dai_link::stop_dma_first. The downside
of this was that a potential struct snd_soc_dai_link::start_dma_last
would have to be populated on sound card driver thus, had to be taken
into account in all sound card drivers. At the moment, the mchp-pdmc is used
only with simple-audio-card. In case of simple-audio-card a new DT
binding would had to be introduced to specify this action on dai-link
descriptions (as of my investigation).

Please advice what might be the best approach.

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  ASoC: soc-generic-dmaengine-pcm: add option to start DMA after DAI
  ASoC: dt-bindings: sama7g5-pdmc: add microchip,startup-delay-us
    binding
  ASoC: mchp-pdmc: fix poc noise at capture startup

 .../sound/microchip,sama7g5-pdmc.yaml         |  6 ++
 include/sound/dmaengine_pcm.h                 |  1 +
 include/sound/soc-component.h                 |  2 +
 sound/soc/atmel/mchp-pdmc.c                   | 55 +++++++++++++++++--
 sound/soc/soc-generic-dmaengine-pcm.c         |  8 ++-
 sound/soc/soc-pcm.c                           | 27 +++++++--
 6 files changed, 86 insertions(+), 13 deletions(-)

-- 
2.34.1

