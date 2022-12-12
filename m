Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A91264A4F8
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 17:37:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F36BA2143;
	Mon, 12 Dec 2022 17:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F36BA2143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670863059;
	bh=iy5q+w5KsVwT75Q4h3iNbvjdzEM5LASpylZyLWvqsmU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EePdW7OORL9I7GYfdJ7FWgtlP3kB0PfWQi4CDDAXpNNJXKSuhBNX+nyGdHeVB4/tt
	 bGpxF751/W4jfftKqeSHbiu5JAd92Uq84/zfyAsP9B61huUMzKQgJrtXKbJplnVjx3
	 HcIyuY6NiMGAoYXnOBhPopb3XZyadFhd7othYO+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF96CF80115;
	Mon, 12 Dec 2022 17:36:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4687F804D0; Mon, 12 Dec 2022 17:36:46 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id CC206F802E0
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 17:36:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC206F802E0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=AP2Fe9VR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670863005; x=1702399005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iy5q+w5KsVwT75Q4h3iNbvjdzEM5LASpylZyLWvqsmU=;
 b=AP2Fe9VRdER6aqB10bGrlWQIFp7lg2FbLWgM8HF7ZM/V4UzSTxU7Kkin
 jc5ALt+FsIZjVNVoIN7bP/pDNIwgtjot08okKv4XjsE4tdUBahkUeyOPs
 AHAnmplcgsMEVOpgc9nusVxi7QhvdMYsHXjrNcG3FOjJRfkKwKuQY+Ags
 DUZEcoWmmRUEpv21cl0GJfy36pnYJfue71tE//H9IoJg7xhMPjjkOtRwF
 F9JJMcCMF8OcsITEA+6gCtHJLMJkVrYgk0KyDsAwJ3Dn7aqLr43la+I/2
 5hQlSURCziQTCKCaA+LyqhEuuPRhV5opnmNqs3dBJ6X0mE9aOvDcQoKjY A==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="127727088"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Dec 2022 09:36:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 09:36:33 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 09:36:30 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 0/4] ASoC: microchip: power saving features and cleanups
Date: Mon, 12 Dec 2022 18:41:49 +0200
Message-ID: <20221212164153.78677-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

The following series adds runtime PM and suspend to RAM features for
mchp-pdmc driver.

Along with it 2 cleanup patches were added:
- patch 1/4: use vendor,device.yaml file format for Microchip AT91 ASoC
  bindings
- patch 4/4: use FIELD_PREP() in mchp-spdiftx.c

Thank you,
Claudiu Beznea

Changes in v2:
- s/microchip,sama7g5-i2s-mcc/microchip,sama7g5-i2smcc as
  this is the 1st available compatible

Claudiu Beznea (4):
  ASoC: dt-bindings: microchip: use proper naming syntax
  ASoC: mchp-pdmc: use runtime pm for clock power saving
  ASoC: mchp-pdmc: add support for suspend to RAM
  ASoC: mchp-spdiftx: use FIELD_PREP() where possible

 .../bindings/sound/mchp,i2s-mcc.yaml          | 108 -------------
 ...,pdmc.yaml => microchip,sama7g5-pdmc.yaml} |   0
 ...rx.yaml => microchip,sama7g5-spdifrx.yaml} |   0
 ...tx.yaml => microchip,sama7g5-spdiftx.yaml} |   0
 sound/soc/atmel/mchp-pdmc.c                   | 145 ++++++++++++------
 sound/soc/atmel/mchp-spdiftx.c                |   8 +-
 6 files changed, 101 insertions(+), 160 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
 rename Documentation/devicetree/bindings/sound/{microchip,pdmc.yaml => microchip,sama7g5-pdmc.yaml} (100%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdifrx.yaml => microchip,sama7g5-spdifrx.yaml} (100%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdiftx.yaml => microchip,sama7g5-spdiftx.yaml} (100%)

-- 
2.34.1

