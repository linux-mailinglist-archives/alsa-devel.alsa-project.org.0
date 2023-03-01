Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BB6A6BD5
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:39:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82F8A1D9;
	Wed,  1 Mar 2023 12:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82F8A1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677670772;
	bh=AUr2Emb+cEOVy4hejcovcA9VOZoGsG9uyJUZz74KyAA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XUy0KlTSJKAb4y+W6f9Gexs9S8DQ8IK4TwKTNSgL0vSQW2Rnk5ho/enepILlMIwed
	 kVzNLn8gGVv0CVm5Z39bLimrXZf1kL4AWS91SKvviAN71vOqgYR+bgyUJLdHouqgsY
	 1iw71HeYDKSCWNgzin9B2Zht670B8LISDtStYKOM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7CD1F80236;
	Wed,  1 Mar 2023 12:38:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB50F8049C; Wed,  1 Mar 2023 12:38:37 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3454EF80236
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:38:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3454EF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=FhPDpLag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677670711; x=1709206711;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AUr2Emb+cEOVy4hejcovcA9VOZoGsG9uyJUZz74KyAA=;
  b=FhPDpLags5vrnfmdKai6d5npVXkyHKsM6thEX3fckoYkGsCejiBByagz
   DbWtDglJPV35V1pc60FEcOGhB4NOQaqrm2d2EiGHV9ZNPGLLmUjIU/eYH
   ARL1SJLl5ynQazVG7O8h6bHGVeds3dxAU1c7HSc1z3mzDg5M86Avv5dVP
   qbQDhzMwp0rP8XJ9DSumZolcng+FHbWyddjOHNiLsiH91xN26zAb+VxQN
   YsyBjkJeux2Nc4v+sWn/w0wkn6mirO2RyIleYAfpj1LwvpM/u51cTkKeB
   hPWuRyOhfzrt9yMlyX9UTwKo3jnKJe5NkvqqVEso8hy0S0o797iGB/AOh
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673938800";
   d="scan'208";a="202746402"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2023 04:38:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Mar 2023 04:38:26 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 1 Mar 2023 04:38:23 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 0/8] ASoC: microchip: some cleanups for AT91 sound drivers
Date: Wed, 1 Mar 2023 13:37:59 +0200
Message-ID: <20230301113807.24036-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: IOV5BNQPDBL5JJGL6IUQTCTOB27HYE3L
X-Message-ID-Hash: IOV5BNQPDBL5JJGL6IUQTCTOB27HYE3L
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOV5BNQPDBL5JJGL6IUQTCTOB27HYE3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The following patches do some cleanups for Microchip AT91 sound drivers.
Along with it I took the chance and updated MAINTAINERS file.

Thank you,
Claudiu Beznea

Claudiu Beznea (8):
  ASoC: mchp-spdiftx: use FIELD_PREP() where possible
  ASoC: mchp-spdiftx: use regmap_update_bits()
  ASoC: mchp-spdiftx: update debug message
  ASoC: mchp-pdmc: use FIELD_PREP() where possible
  ASoC: mchp-pdmc: return directly ret
  ASoC: mchp-pdmc: avoid casting to/from void pointer
  MAINTAINERS: add myself as maintainer for Microchip AT91 sound drivers
  MAINTAINERS: update Microchip AT91 sound entries with documentation
    files

 MAINTAINERS                    |  9 +++++--
 sound/soc/atmel/mchp-pdmc.c    | 19 ++++++--------
 sound/soc/atmel/mchp-spdiftx.c | 45 ++++++++++++----------------------
 3 files changed, 29 insertions(+), 44 deletions(-)

-- 
2.34.1

