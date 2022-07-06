Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF6B568465
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 11:58:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D1116AE;
	Wed,  6 Jul 2022 11:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D1116AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657101532;
	bh=jyaqlqzpSXCp1inuYTXzag1s4h8e7NzOspQ/2MAyAdw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NKOm88gjanvjgC5cZkRlaiuTrdkEwoqMKLBRKaMKbCM9JKeBTVIIR14K+rH7FHoX8
	 n2Bywsx8HxAkqhqPz6BB8QN/EVULs4K3NcAPOQCe5scwRAZzwL1bgs0P1xFg43oIjL
	 YbveIIas/+ZQg+587LSk7ksXgrgUcSAYmB1fxzKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E388F8023A;
	Wed,  6 Jul 2022 11:58:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC9C0F804B4; Wed,  6 Jul 2022 11:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F01DDF8016B
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 11:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F01DDF8016B
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C48A20079B;
 Wed,  6 Jul 2022 11:57:53 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 04D402007DE;
 Wed,  6 Jul 2022 11:57:53 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 50153180327D;
 Wed,  6 Jul 2022 17:57:51 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: imx-card: Fix DSD/PDM mclk frequency
Date: Wed,  6 Jul 2022 17:42:55 +0800
Message-Id: <1657100575-8261-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

The DSD/PDM rate not only DSD64/128/256/512, which are the
multiple rate of 44.1kHz,  but also support the multiple
rate of 8kHz, so can't force all mclk frequency to be
22579200Hz, need to assign the frequency according to
rate.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 1797d777b1b8..ccc4194dc5e7 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -17,6 +17,9 @@
 
 #include "fsl_sai.h"
 
+#define IMX_CARD_MCLK_22P5792MHZ  22579200
+#define IMX_CARD_MCLK_24P576MHZ   24576000
+
 enum codec_type {
 	CODEC_DUMMY = 0,
 	CODEC_AK5558 = 1,
@@ -353,9 +356,14 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 		mclk_freq = akcodec_get_mclk_rate(substream, params, slots, slot_width);
 	else
 		mclk_freq = params_rate(params) * slots * slot_width;
-	/* Use the maximum freq from DSD512 (512*44100 = 22579200) */
-	if (format_is_dsd(params))
-		mclk_freq = 22579200;
+
+	if (format_is_dsd(params)) {
+		/* Use the maximum freq from DSD512 (512*44100 = 22579200) */
+		if (!(params_rate(params) % 11025))
+			mclk_freq = IMX_CARD_MCLK_22P5792MHZ;
+		else
+			mclk_freq = IMX_CARD_MCLK_24P576MHZ;
+	}
 
 	ret = snd_soc_dai_set_sysclk(cpu_dai, link_data->cpu_sysclk_id, mclk_freq,
 				     SND_SOC_CLOCK_OUT);
-- 
2.17.1

