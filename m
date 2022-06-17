Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C779D54F26A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 10:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF6B01B46;
	Fri, 17 Jun 2022 10:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF6B01B46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655452863;
	bh=QB9n9mNnhQQWszwYca0ptb6IIp0I7IZuGi4WyLz0bsE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDECHOX0WmdOhmfG82AHiZl7WdUZI4BHk3MA3fl+0cYcwGi7WfBkM9yIozHQ+eW6/
	 bb2BDYy98drnwBT1pr6C0GCIdHnn7VGvhSlqPxF8sf7vJFEOxvC6A1Mf2gfNVr/BHu
	 TtxMfe1MH1e97OaOT4D4ri2Lw1SxC/ZpE/ZRFdDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44959F80528;
	Fri, 17 Jun 2022 09:59:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3ADBF8052D; Fri, 17 Jun 2022 09:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69257F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 09:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69257F800B0
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D230E201FAC;
 Fri, 17 Jun 2022 09:59:18 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 87E63201FA1;
 Fri, 17 Jun 2022 09:59:18 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 293381820F45;
 Fri, 17 Jun 2022 15:59:17 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/7] ASoC: fsl_sai: Add support for more sample rates
Date: Fri, 17 Jun 2022 15:44:33 +0800
Message-Id: <1655451877-16382-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
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

Add support for more sample rates, because PDM format
bitstream has higher sample rates. for example DSD512
format, the bit clock is 22.5792MHz, if the word width
is U8_LE, then the max sample rate is 2822400.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d11ee3b6f163..9d2828b55c07 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -30,7 +30,8 @@
 static const unsigned int fsl_sai_rates[] = {
 	8000, 11025, 12000, 16000, 22050,
 	24000, 32000, 44100, 48000, 64000,
-	88200, 96000, 176400, 192000
+	88200, 96000, 176400, 192000, 352800,
+	384000, 705600, 768000, 1411200, 2822400,
 };
 
 static const struct snd_pcm_hw_constraint_list fsl_sai_rate_constraints = {
@@ -763,7 +764,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_template = {
 		.channels_min = 1,
 		.channels_max = 32,
 		.rate_min = 8000,
-		.rate_max = 192000,
+		.rate_max = 2822400,
 		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_SAI_FORMATS,
 	},
@@ -772,7 +773,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_template = {
 		.channels_min = 1,
 		.channels_max = 32,
 		.rate_min = 8000,
-		.rate_max = 192000,
+		.rate_max = 2822400,
 		.rates = SNDRV_PCM_RATE_KNOT,
 		.formats = FSL_SAI_FORMATS,
 	},
-- 
2.17.1

