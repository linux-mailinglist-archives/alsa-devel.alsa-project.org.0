Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E136634F
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 03:14:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E20E81688;
	Wed, 21 Apr 2021 03:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E20E81688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618967667;
	bh=W5W8KOeU5cF+c783a0EUSmBWDW2m+RDUwh02kYFd7Kc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aGaa1Z7dhyI3P7RFrQS0L74jnInWY71PHU8XbVlmGqSFqQpG97bFaRY9ZRXqfHVON
	 +Pr3Ie59jR4eQ0X+hckHi8QUT+lET7QmD2ABBHQb+trDA9tCwQUDgiADhezogCV6xU
	 YHKQl3u6SOVlthfBSSVTglse59BqkR+wmHI7f09k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A6DFF80168;
	Wed, 21 Apr 2021 03:12:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A59F80253; Wed, 21 Apr 2021 03:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19598F80164
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 03:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19598F80164
IronPort-SDR: RWdQTJfn1e6lvZpUVALzDdJHrzvQDCLwmDiPi37St+uhcHTksB/BaBVP/j7Y0NhoaneOSrgYNA
 MQEsApGT+djA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="183112723"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="183112723"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 18:12:38 -0700
IronPort-SDR: 6897KNHO0MOhdT1akAu31trtrof72UCZaH+P7XSiisMTWeQsJExKsZ54VkVjW2zkhitVkCTpU/
 ZvdXfI2Q7Lxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="391333202"
Received: from jsia-hp-z620-workstation.png.intel.com ([10.221.118.135])
 by fmsmga007.fm.intel.com with ESMTP; 20 Apr 2021 18:12:36 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: KMB: Fix random noise at the HDMI output
Date: Wed, 21 Apr 2021 08:55:46 +0800
Message-Id: <20210421005546.7534-1-jee.heng.sia@intel.com>
X-Mailer: git-send-email 2.18.0
Cc: broonie@kernel.org, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com
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

Random noise could be heard when playing audio to the HDMI output.
This is due to the IEC conversion is invoked in the external loop.
As a result, this additional loop takes up a lot of the processing
cycle.

hdmi_reformat_iec958() process the conversion using an internal loop,
it is safe to move it out from the external loop to avoid unnecessary
processing cycle been spent. Furthermore, ALSA IEC958 plugin works in
32bit format only.

Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/keembay/kmb_platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 0fd1e8f62c89..96741c7c0fba 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -105,14 +105,15 @@ static unsigned int kmb_pcm_tx_fn(struct kmb_i2s_info *kmb_i2s,
 	void *buf = runtime->dma_area;
 	int i;
 
+	if (kmb_i2s->iec958_fmt)
+		hdmi_reformat_iec958(runtime, kmb_i2s, tx_ptr);
+
 	/* KMB i2s uses two separate L/R FIFO */
 	for (i = 0; i < kmb_i2s->fifo_th; i++) {
 		if (kmb_i2s->config.data_width == 16) {
 			writel(((u16(*)[2])buf)[tx_ptr][0], i2s_base + LRBR_LTHR(0));
 			writel(((u16(*)[2])buf)[tx_ptr][1], i2s_base + RRBR_RTHR(0));
 		} else {
-			if (kmb_i2s->iec958_fmt)
-				hdmi_reformat_iec958(runtime, kmb_i2s, tx_ptr);
 			writel(((u32(*)[2])buf)[tx_ptr][0], i2s_base + LRBR_LTHR(0));
 			writel(((u32(*)[2])buf)[tx_ptr][1], i2s_base + RRBR_RTHR(0));
 		}

base-commit: bf05bf16c76bb44ab5156223e1e58e26dfe30a88
-- 
2.18.0

