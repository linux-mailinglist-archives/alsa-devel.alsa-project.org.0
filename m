Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B3A56C15C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54AD984D;
	Fri,  8 Jul 2022 22:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54AD984D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657312862;
	bh=bdSvlrdpZ6PBrpHuKn1SliCf2sDnqJhyzLiQLt7HlyE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ErNVreqge9B0JkJmVyaV7Duz9azNcxj+Ikvbmm8HjIRHaCTkMNA6AJwoHXZVhC4bS
	 NyqixRpWJMPm2DofNEEhkTeoT/QG15c9g/WuKA3eGRWfUMFcAdYpnXMLN7c0ANXC9S
	 9dy0nGF2VBe2cfkPaoFlV75nPWgfAMQ9Tba6Elx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACA65F80551;
	Fri,  8 Jul 2022 22:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5433BF8028B; Fri,  8 Jul 2022 22:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2BC9F8028B
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2BC9F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U8M8UWa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657312760; x=1688848760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bdSvlrdpZ6PBrpHuKn1SliCf2sDnqJhyzLiQLt7HlyE=;
 b=U8M8UWa6oc44DX3zYHoadWDIHgC77SxniAx2YbpQRkHCX/Qb0vhykW4q
 xLrRsqRi75buTRikMHIR0uIUeoxQkNNhJ91WsQZjp1ziYLyEa6BrJNkor
 roYeEmaX8zw+OlsLvWcUIKgEn4nmYlZ05ItFUI4KS3V8OelDd41tbj6eo
 dPdfLksTtLhuNJGApT4vNHYvt3kKVmksVb3kSe5gsi78x3G3Hx/s7UnPr
 l/gOw4AoBq/YTgmTc98Zz2kp5PAlHjZtTiaDQ9k1DIjjkqec+ToT6tLv3
 0SHSIW1Icva7O8J5iuRY11hG2eZwBywDQeym/CN6HS86vJZv0cezQxpwW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="346047675"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="346047675"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:39:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="621354538"
Received: from gcisnero-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.87.49])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:39:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: mediatek: fix mt8195 StatvectorSel wrong
 setting
Date: Fri,  8 Jul 2022 15:39:04 -0500
Message-Id: <20220708203904.29214-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708203904.29214-1-pierre-louis.bossart@linux.intel.com>
References: <20220708203904.29214-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: KuanHsun Cheng <Allen-KH.Cheng@mediatek.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Li-Yu Yu <afg984@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, YC Hung <yc.hung@mediatek.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: YC Hung <yc.hung@mediatek.com>

Fix StatVectorSel wrong setting.

Fixes: b7f6503830 ("ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to load firmware")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Li-Yu Yu <afg984@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: KuanHsun Cheng <Allen-KH.Cheng@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-loader.c b/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
index 5bdbb1460fe7..4be99ff4ebd3 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
@@ -21,7 +21,7 @@ void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
 
 	/* pull high StatVectorSel to use AltResetVec (set bit4 to 1) */
 	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
-				DSP_RESET_SW, DSP_RESET_SW);
+				STATVECTOR_SEL, STATVECTOR_SEL);
 
 	/* toggle  DReset & BReset */
 	/* pull high DReset & BReset */
-- 
2.34.1

