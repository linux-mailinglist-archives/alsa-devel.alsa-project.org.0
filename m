Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485435822BB
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 11:07:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4AF584A;
	Wed, 27 Jul 2022 11:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4AF584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658912827;
	bh=YkUS4VT+nAqLrUuOLwypQQDGOIVF2886Ab8ulGKy5xk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vFZIcxVwHqePUxnjWWsEPzIQ9hDV8aWhcyTNx5+rxvl4U6MoawFU+4gKl2ciWUA2y
	 tlFgARmrvqhCG7QhxvKtJvq/U4ugUrZsYs4SjtwTCTQaCRyT4SVXFQJjmNMjQrck1p
	 gjLOg6meLyF0lJUFA51gDBjxG+xzGuuBIYRsRMlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68310F80310;
	Wed, 27 Jul 2022 11:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0AB8F8014E; Wed, 27 Jul 2022 11:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19784F8014E
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 11:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19784F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="HjeuY16+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1658912760; x=1690448760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YkUS4VT+nAqLrUuOLwypQQDGOIVF2886Ab8ulGKy5xk=;
 b=HjeuY16+SEiOIdja4V+mN1GlRVPdXH3B4Y0beCS2pwH7vbK+1akauY2f
 IqKRVgI0+KDWuk5szrcTp/nb6GVFhRBGSkjWsgNfnWv8wTKBkymmi6rKK
 MbR2aWhjm1Jh2V+aHUAbaMsV56UprIfDxr6hm3SkyM3J6Udl0FUJ9Z+BK
 UZTzW6svO/q1g64+HJCzVmB9HcZ9mqCIgqOmdWiCMmFyMQWJxZ5hlFOEB
 W2OWDz2X6NUGghRLLswVtpxp1NxDawdt/pVTM5bI1T+iUuMbYfEfTsIDi
 PGNkN1+wJk5Pn1ODRxGjGGdbApr5kVrCoLdpdIRFafn+a7tSmlepHLcY+ Q==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="169710941"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jul 2022 02:05:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Jul 2022 02:05:50 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 27 Jul 2022 02:05:48 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 0/2] ASoC: atmel: one fix and one cleanup
Date: Wed, 27 Jul 2022 12:08:12 +0300
Message-ID: <20220727090814.2446111-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

The series adds one fix for mchp-spdifrx and one cleanups for
mchp-spdifrx and mchp-spdifrx drivers.

Thank you,
Claudiu Beznea

Changes in v3:
- changed cover letter title s/few/one, s/cleanups/cleanup
- fix compilation error and warnings
- keep only patch 1/5 and patch 3/5 from previous version as the rest
  of them were integrated

Changes in v2:
- s/tag/tab in the title of patch 2/5

Claudiu Beznea (2):
  ASoC: mchp-spdifrx: disable end of block interrupt on failures
  ASoC: mchp-spdiftx: remove references to mchp_i2s_caps

 sound/soc/atmel/mchp-spdifrx.c | 9 ++++++---
 sound/soc/atmel/mchp-spdiftx.c | 8 --------
 2 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.34.1

