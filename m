Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE8977E39
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:11:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3311A4A;
	Fri, 13 Sep 2024 13:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3311A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225905;
	bh=i9rGsPZXkd0oGN+TIi2etQvDC7JctZmfbf6HeGrXcZQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cYApEPPnvej2WggaCrnfXLHCdC5fd00leeB7Ho9zFaRbCjowjGWq/NjWMsXS98gwf
	 aKiHiWGmU1pYt07UjMt0w/ibxhQRd/Z8O0GRuHdpjepOYyH53u9lc+QwkmR05IWmSe
	 HBnQXrliJq/GWtbs/eVllrPMx5LxlEOD4pvkDgYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AD89F805C9; Fri, 13 Sep 2024 13:11:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEA49F805C6;
	Fri, 13 Sep 2024 13:11:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8469F801F5; Mon,  9 Sep 2024 10:36:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C75CF80107
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 10:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C75CF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=CJFrQ1tf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725870969; x=1757406969;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i9rGsPZXkd0oGN+TIi2etQvDC7JctZmfbf6HeGrXcZQ=;
  b=CJFrQ1tfiahB6reocDENdAU2wCXErjVsH4uGTB3cB+DxXHAVQlu5ucMM
   bauiizdGev25gqHekH9ic/UfOh8QmJ/1/uv1bfu7ypTMUv5baEtLyngg8
   w910WtE7K0dGs0nj+RVrIRQ4GwOewInqnTR3RLFTHiebyqUfh9c4BUwYw
   wPWPemqGpj/5XoPirfENSPXc85TQ7589kIGl2klAuneykbwIB9C5kQM74
   X2VMIBRD8alxpKLRCdYHgr3okQTgqJpQOSNUsMyjTNznOA7AAEpbil6JL
   8gxxQTT+L2GzKOUTFdX+cmrmjWk78sjoq/740MPtO9fE3GAMwofh7qrnY
   g==;
X-CSE-ConnectionGUID: 3+qBZ8ypT7qJuXQunlVkIA==
X-CSE-MsgGUID: 8HHOJHwdRPe90Y2SLoTbTg==
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600";
   d="scan'208";a="198940343"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Sep 2024 01:36:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 01:35:41 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 9 Sep 2024 01:35:38 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH 0/2] Adjust Stream Name and DT Bindings Updates
Date: Mon, 9 Sep 2024 11:35:28 +0300
Message-ID: <20240909083530.14695-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=97557f232=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KFC4BMJOAY2Z7WMEK6CKMUZZGRRFVBFM
X-Message-ID-Hash: KFC4BMJOAY2Z7WMEK6CKMUZZGRRFVBFM
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:11:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KFC4BMJOAY2Z7WMEK6CKMUZZGRRFVBFM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch set proposes the following changes to improve the flexibility
and configurability of the mchp-i2s-mcc driver by allowing the interface
name to be set through the device tree and by introducing a new property to
better manage multiple interfaces.

Codrin Ciubotariu (2):
  ASoC: atmel: mchp-i2s-mcc: Remove interface name from stream_name
  ASoC: dt-bindings: microchip,sama7g5-i2smcc: Add 'sound-name-prefix'
    property

 .../bindings/sound/microchip,sama7g5-i2smcc.yaml           | 7 +++++++
 sound/soc/atmel/mchp-i2s-mcc.c                             | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)


base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
-- 
2.34.1

