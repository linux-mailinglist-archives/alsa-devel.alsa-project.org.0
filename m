Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA670236
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:23:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4D5D1809;
	Mon, 22 Jul 2019 16:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4D5D1809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805404;
	bh=3CvXzeapdVEhySITLyK9al3ptnmTTOuFVWnMtM+2izI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jyMZL+c5hOOPglhY8Lv0w2VntuR2oKcP/PbMKlH8oLCwjMtiRCQX8YW+HyH8ENtQY
	 MBhD05lzEhc82wSjBr9sdyRCs8XTTvhHxkPCpow6RKEDrapQoHjIG6IhtqU9eMQVqi
	 gty2CQT6oo//7IKrhiYwdzOQVwgEXhJKvXiulnPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE1F3F8060E;
	Mon, 22 Jul 2019 16:14:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44502F80527; Mon, 22 Jul 2019 16:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72104F8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72104F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733292"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:54 -0500
Message-Id: <20190722141402.7194-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 13/21] ASoC: SOF: Intel: hda: set position
	buffer in init chip
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>

Set the HDA stream position buffer during init chip. The position buffer
needs to be set in both HDA codec and nocodec cases. Using SOF defined
function and move it to common code.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index ea63f83a509b..015760284969 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -245,14 +245,13 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
 				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* program the position buffer */
 	if (bus->use_posbuf && bus->posbuf.addr) {
-		snd_hdac_chip_writel(bus, DPLBASE, (u32)bus->posbuf.addr);
-		snd_hdac_chip_writel(bus, DPUBASE,
-				     upper_32_bits(bus->posbuf.addr));
+		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_ADSP_DPLBASE,
+				  (u32)bus->posbuf.addr);
+		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_ADSP_DPUBASE,
+				  upper_32_bits(bus->posbuf.addr));
 	}
-#endif
 
 	bus->chip_init = true;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
