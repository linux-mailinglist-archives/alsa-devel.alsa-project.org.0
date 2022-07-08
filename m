Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5256C15B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:40:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA0F84A;
	Fri,  8 Jul 2022 22:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA0F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657312848;
	bh=QamZJp2oOCa/m9uiT2no2P2ljON/pobQ67BVFi1PRZc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=duMudjjTEBcirQzZb36MQsziIHkc//r4sf6j6hTrl5tui3Yl5Q1dTxDGnfoIUHlxO
	 F2DiwppvNKGmlXs6ScF11hhoeUflWLClbQ6Q7LNVf1h1LBPSWYTPDuE4uzrsMWSRFL
	 NBRR5z53tQtHsU4/gS92Q6UcFe7llFvXJk+v1AUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24D39F80166;
	Fri,  8 Jul 2022 22:39:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04F63F80544; Fri,  8 Jul 2022 22:39:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58D25F80537
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58D25F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PgtR9d0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657312758; x=1688848758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QamZJp2oOCa/m9uiT2no2P2ljON/pobQ67BVFi1PRZc=;
 b=PgtR9d0NSQdlrJrqvTgjjj61s6CYCLal0bu7CgH2p8HEo4mUvN1s8Q5k
 ql//4n7g6yFNHfywgLwDX0+WRD715NqrhLGp9nfoWvsgCQtgsj6uMKlzm
 qZ4ph3O77uZlBKgvJUhmv69HoQLOHlqLRhkBiqqXn697lN1Svuokl11uf
 DlX9UnxxuhLImmRQk3rrnvoGIxS6sNMJJruowon5hbfXytccYZKKPUxbc
 kMY9wIfLV5MauFFEUmUVXkmsU5jIXG7dX3vXDM+DI3uJ9VOT70RoiNmTB
 FvW72OhhpxaD5bFNkdf3tB6JUb8KzuIsfjuJNzl5hj8Hz0ZzfntL0qFVp A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="346047673"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="346047673"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:39:11 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="621354532"
Received: from gcisnero-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.87.49])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:39:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: mediatek: Revise mt8195 boot flow
Date: Fri,  8 Jul 2022 15:39:03 -0500
Message-Id: <20220708203904.29214-2-pierre-louis.bossart@linux.intel.com>
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

1. Revise hifixdsp shutdown flow to pull runstall high then reset high.
2. Add 1 us delay between D/BRESET high and low for 10 DSP cycles(26M)
   based on IP vendor's suggestion.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Li-Yu Yu <afg984@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: KuanHsun Cheng <Allen-KH.Cheng@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195-loader.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-loader.c b/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
index ed18d6379e92..5bdbb1460fe7 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
@@ -29,6 +29,9 @@ void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
 				ADSP_BRESET_SW | ADSP_DRESET_SW,
 				ADSP_BRESET_SW | ADSP_DRESET_SW);
 
+	/* delay 10 DSP cycles at 26M about 1us by IP vendor's suggestion */
+	udelay(1);
+
 	/* pull low DReset & BReset */
 	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
 				ADSP_BRESET_SW | ADSP_DRESET_SW,
@@ -46,11 +49,13 @@ void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
 
 void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
 {
-	/* Clear to 0 firstly */
-	snd_sof_dsp_write(sdev, DSP_REG_BAR, DSP_RESET_SW, 0x0);
-
 	/* RUN_STALL pull high again to reset */
 	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
 				ADSP_RUNSTALL, ADSP_RUNSTALL);
+
+	/* pull high DReset & BReset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_BRESET_SW | ADSP_DRESET_SW,
+				ADSP_BRESET_SW | ADSP_DRESET_SW);
 }
 
-- 
2.34.1

