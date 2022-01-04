Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A49484086
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 12:11:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F006B169E;
	Tue,  4 Jan 2022 12:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F006B169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641294699;
	bh=Iblaf2FX1GBm4ZPwarVk/foVQcK9ANMV4KgSGY/3TMw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=er7oJoMBqCPjzQZQUtNlwUFzwDckpeO+ij17111z9FmBGURfPySqXFVbNTGU2ruxt
	 D3EhhaKccmxJdGmtafhZZMWfEzduf2JouO+lKdqiWwz5O14OdU3kUqqOSKrgJysDEN
	 NHs56sgf4QQgnh9pmWBMvI5Yvqp4zmG+zItm13yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FEE2F80424;
	Tue,  4 Jan 2022 12:10:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D28F8F8049C; Tue,  4 Jan 2022 12:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D65D6F80089
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 12:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D65D6F80089
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 047551A2251;
 Tue,  4 Jan 2022 12:10:22 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C1E4C1A223A;
 Tue,  4 Jan 2022 12:10:21 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2A0D4183AC4C;
 Tue,  4 Jan 2022 19:10:20 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: imx-card: Fix mclk calculation issue for akcodec
Date: Tue,  4 Jan 2022 18:40:34 +0800
Message-Id: <1641292835-19085-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
References: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
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

Transfer the refined slots and slot_width to akcodec_get_mclk_rate()
for mclk calculation, otherwise the mclk frequency does not match
with the slots and slot_width for S16_LE format, because the default
slot_width is 32.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index e0f3aa6d9501..f9196fb7e833 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -247,13 +247,14 @@ static bool codec_is_akcodec(unsigned int type)
 }
 
 static unsigned long akcodec_get_mclk_rate(struct snd_pcm_substream *substream,
-					   struct snd_pcm_hw_params *params)
+					   struct snd_pcm_hw_params *params,
+					   int slots, int slot_width)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(rtd->card);
 	const struct imx_card_plat_data *plat_data = data->plat_data;
 	struct dai_link_data *link_data = &data->link_data[rtd->num];
-	unsigned int width = link_data->slots * link_data->slot_width;
+	unsigned int width = slots * slot_width;
 	unsigned int rate = params_rate(params);
 	int i;
 
@@ -349,7 +350,7 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 
 	/* Set MCLK freq */
 	if (codec_is_akcodec(plat_data->type))
-		mclk_freq = akcodec_get_mclk_rate(substream, params);
+		mclk_freq = akcodec_get_mclk_rate(substream, params, slots, slot_width);
 	else
 		mclk_freq = params_rate(params) * slots * slot_width;
 	/* Use the maximum freq from DSD512 (512*44100 = 22579200) */
-- 
2.17.1

