Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF012A68E7
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 16:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD2E01683;
	Wed,  4 Nov 2020 16:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD2E01683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604505569;
	bh=1IXMDBOSCtaUZtiq9izDv17V26Pq9aWYb9Tw2O2fSxs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Blgncj6ULyvR+CFs+v5JvGpS+/b0eBg499pShoENR1IMAkh8918GNu4nrVi8qbvL8
	 nPxi2O8dDljUig8ELsOjzl7HfGfrFBuhFGglyR+y37sv2/ZYAhFMzMRIs5eBckbjDp
	 6nvF7fiUaArNlGNlxh8Q2aUu3Uv++OThlaq35XDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 401A5F8023E;
	Wed,  4 Nov 2020 16:57:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72747F80234; Wed,  4 Nov 2020 16:57:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa6.microchip.iphmx.com (esa6.microchip.iphmx.com
 [216.71.154.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE9F0F80229
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 16:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE9F0F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="vsez/aQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1604505468; x=1636041468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1IXMDBOSCtaUZtiq9izDv17V26Pq9aWYb9Tw2O2fSxs=;
 b=vsez/aQZ3w6JdVtZF3lYsutrcP9lgbeciYlBnPl2I2s5vBO2CFJV2OkY
 zbktNSxoCEdRKv8t0sTofKUoMpw+Cce8OQavK07mxAay4jB1WQVPT1PY3
 QHuHdeEtAJMD4Lp/akBsRUh6qtZNZ1Ke416P7tQ+A+SyBNOJfHiKXePqW
 kVlM49kZPopPvxg6gOu+keQR6vuawz2CNHumb+5nLjnYoEXYMmfAeSD4v
 krYTJniogMS10i/FxHZ6lgM4U0hsHSqgitamjcdcyLYVG3bfd9fXG1vD7
 cKcCjtZdaxOm8J+JPUe58ofnGd3/ZfzPruwG6tazRWdtenxN0L2SzqeAX Q==;
IronPort-SDR: xmQk0RwZowrJeY6M1qYOR3nH7hBq/SFUF+bH3yXO4jsDjxPIRtmeRLh7IyMcx7f6vJBgDyTWtZ
 RL+ojKFAhSPa9MMv9a5RpWmut69xdcwpz2KEwJKNIZPIJ7Xg2uHhsB+bkwtBjZmvS7GGN/MyZI
 jcBtIJdLz50OLYiZ8D9JLvgHJzmXrsrnGhGoIVNhhbiNe5TdtWZgP+HMRPIaE0P4hkjyawhySB
 Cms0meRnCremStsCaNiNIIoqHTRHw477jNBZQG58GwARmfW2C3d/N3/5py9k74aHAtlsQzF7LY
 F40=
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="32405234"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Nov 2020 08:57:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 4 Nov 2020 08:57:43 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 4 Nov 2020 08:57:40 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: mchp-spdiftx: Do not set Validity bit(s)
Date: Wed, 4 Nov 2020 17:57:38 +0200
Message-ID: <20201104155738.68403-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
 broonie@kernel.org, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

The Validity bits (bit 28) must not be set in order to have the samples
valid. Some controllers look for this bit and ignore the samples if it
is set.

Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 82c1eecd2528..3bd350afb743 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -487,7 +487,6 @@ static int mchp_spdiftx_hw_params(struct snd_pcm_substream *substream,
 	}
 	mchp_spdiftx_channel_status_write(dev);
 	spin_unlock_irqrestore(&ctrl->lock, flags);
-	mr |= SPDIFTX_MR_VALID1 | SPDIFTX_MR_VALID2;
 
 	if (dev->gclk_enabled) {
 		clk_disable_unprepare(dev->gclk);
-- 
2.27.0

