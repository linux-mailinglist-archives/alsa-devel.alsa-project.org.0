Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9782E544DDF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:39:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE3A1B13;
	Thu,  9 Jun 2022 15:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE3A1B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781985;
	bh=6aOI0YRpqazTRVptkQQ78+ACWgBkgm9pnoxIuuWsUDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jpY61B+ZZuQN43fMFtTTHdsZE2vrPn7L3zZiIMm7mlQJ+AeRC35AgJtovTznFyghZ
	 YYRbG8R4ANk9e5iAr1/S+rYtafPK8V/5kF5AFU/2uMkr6HT0BOyrrnzPGl5+MX5NJy
	 AWQKkzTFCxzl6V0rOpayk8bukmyPfIP3Hn512rTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ED67F8057A;
	Thu,  9 Jun 2022 15:36:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16082F80579; Thu,  9 Jun 2022 15:36:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0B6BF80548
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B6BF80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BgQNDKap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781761; x=1686317761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6aOI0YRpqazTRVptkQQ78+ACWgBkgm9pnoxIuuWsUDw=;
 b=BgQNDKapLId2mSN2Fhh9CyeGBtbLg48yMGa/lrGIh+wXzHytIj3r8ANV
 WbtlNR4o6FqoU7Qicr3NtHuyAEw4dbJUr6vO9yZktsd5YpxoYuD11/sw8
 cCqgb0UGHnIS6mhDD07rF1+aj77qoRUj3BMVbJrBYLgX3i2STYipsWRrC
 rd2xzEeEmeWOf151hl2CMBaEpvTQ3c6OlQiqC/7Qeaw9t0JSaLhnQojyp
 oJdf9YMmX66ThQhCfgOpt+IYKGL3+mqKXE8V3P8ASxrttCLt08KpgE+ig
 VqjakvU1AWsfDu2O0itdaZ6pMGXU47s9Ya5ouPXp2yaPkdUBYruURC2Xw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061422"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061422"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966197"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:58 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 10/11] ASoC: codecs: rt298: Fix NULL jack in interrupt
Date: Thu,  9 Jun 2022 15:35:40 +0200
Message-Id: <20220609133541.3984886-11-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Set rt298->jack to passed value in mic_detect, otherwise when jack is
set to NULL on next interrupt call, we may use freed pointer.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt298.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 3c13b6dc3be9..2af037536bc9 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -336,6 +336,8 @@ static int rt298_mic_detect(struct snd_soc_component *component,
 	bool mic = false;
 	int status = 0;
 
+	rt298->jack = jack;
+
 	/* If jack in NULL, disable HS jack */
 	if (!jack) {
 		disable_irq(rt298->i2c->irq);
@@ -346,7 +348,6 @@ static int rt298_mic_detect(struct snd_soc_component *component,
 		return 0;
 	}
 
-	rt298->jack = jack;
 	regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x2);
 	enable_irq(rt298->i2c->irq);
 
-- 
2.25.1

