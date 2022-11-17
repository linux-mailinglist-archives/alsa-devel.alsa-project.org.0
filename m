Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09D62DAFA
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 13:34:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A62216BC;
	Thu, 17 Nov 2022 13:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A62216BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668688460;
	bh=g9OD6C532BG8057DaZIOwkCkEZBhs+LSbf4kM6dueg4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CPOd6NpOjAuX/UTeCjO6ExbOob8BBhhQTsZb4M1kRtpcfFrgyRKEuTaIOUqZBXmPr
	 CyNlJTg1LzF1bkG8fpqXdrRASG+IWQmTfr0qjupKjGmOPWFCuevq07lA0+CEHJQDfy
	 sa3l4CMWMp34kYKgJCM1uRphPqJb5OzKv9LhveOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A584FF804DF;
	Thu, 17 Nov 2022 13:33:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B3E1F804C1; Thu, 17 Nov 2022 13:33:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89834F800B8
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 13:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89834F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="ZxH2VTLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1668688395; x=1700224395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g9OD6C532BG8057DaZIOwkCkEZBhs+LSbf4kM6dueg4=;
 b=ZxH2VTLlLEc4ll6W7s9bDi71ldjUqefhywPbetEyYz8SuzYgLRkaoj+P
 8UdGzLk/F65QKGDDwvLtIHm6C1UQXD5uG99dmhfn6xF9PfZsa9LyFl5AS
 cHcPfUzMNSb35GYZfZ0mBgS55JHoSb8adfXprR5Qdyy+IFzm+l7XUOlRX
 4EW6Yx4cfqb/S0FiVLQEGs0iqILU51TiNj6pDCqbAjZSErhYDoi3uF8BV
 1cS1L+vA8plj81nel2mgMxxXMOklHPzd1R8hTBchCIHp38y+asHqXigeT
 az5xDuXanTHpwZlSXXkckQWvLB1bw46qCkNspobm2/LwMw8U/5Uoj3yOt g==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="123885419"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Nov 2022 05:33:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 05:33:02 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 05:32:59 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/3] ASoC: mchp-spdiftx: add power saving features
Date: Thu, 17 Nov 2022 14:37:47 +0200
Message-ID: <20221117123750.291911-1-claudiu.beznea@microchip.com>
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

This series adds support for runtime PM and system suspend/resume
for Microchip SPDIFTX (patches 2/3, 3/3). Along with it I took the
chance and added a minor cleanup (patch 1/3).

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  ASoC: mchp-spdiftx: simplify locking around ctrl->ch_stat
  ASoC: mchp-spdiftx: add runtime pm support
  ASoC: mchp-spdiftx: add support for system suspend/resume

 sound/soc/atmel/mchp-spdiftx.c | 165 ++++++++++++++++++++++-----------
 1 file changed, 113 insertions(+), 52 deletions(-)

-- 
2.34.1

