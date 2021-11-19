Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED949458998
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 08:05:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A0E1696;
	Mon, 22 Nov 2021 08:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A0E1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637564730;
	bh=glGcBOhnKZ0BIbBHiohniXke1QKqjnYDGYevH0VUGh4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acgqqaKJ7yuH2h7bX1huqeLzm8RxdPwZrhvEsfAj+4Txf+3El/DihvWRVtsPvkQq2
	 EkCqoiKkI/aQUm5lBIlXGZiiN2anC7hx6NfgqF3sizRhmLd0k5/+vmgguXDVbeCKjD
	 xBm+FaJFtJlE6UR1+SUo5xAu7AePH27HlPUw8ccU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C253F80511;
	Mon, 22 Nov 2021 08:02:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC5B7F80217; Fri, 19 Nov 2021 16:34:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85C47F800FA
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 16:34:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85C47F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="ILfz1eXr"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 3E7A51F47564
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637336069; bh=glGcBOhnKZ0BIbBHiohniXke1QKqjnYDGYevH0VUGh4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ILfz1eXr7vdpZP5d6eO3X/8p9GEPLZnO3SBSSolZJtd57CUrJFzUtCgLG7slX63ha
 6/d5Q48UzRABGeolToWZ5ZiHfqCKZISXoO3pGIr2yb52B0S0q+8b2FlRBd/Njrl2Cd
 FyqEaAx/ZvNeHr9n7JJorLCNaqUh1rl+oBV9dHNl9gXAz+OHLV93KBmnCzciereC9T
 bCsm3NLdC8erMAEPdxoQX+gKc1r8NJQR7AXHQcqy8kAlue8xFRnKyz3L2TwGwM+EFT
 hm1Zd8IiwiBNB+GjvTEUklfeIUfZ1i7oC0mLxz/STTM/FsIJRbhOokqMN3W17FgtNC
 yAOSdCCz6S8ow==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [RFC patch 5/5] ASoC: fsl-asoc-card: Support fsl,
 imx-audio-tlv320aic31xx codec
Date: Fri, 19 Nov 2021 12:32:48 -0300
Message-Id: <20211119153248.419802-6-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Nov 2021 08:01:48 +0100
Cc: bkylerussell@gmail.com, ariel.dalessandro@collabora.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, michael@amarulasolutions.com, festevam@gmail.com
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

Add entry for fsl,imx-audio-tlv320aic31xx audio codec. This codec is
configured to use BCLK as clock input.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 6e6494f9f399..90cbed496f98 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -26,6 +26,7 @@
 #include "../codecs/wm8962.h"
 #include "../codecs/wm8960.h"
 #include "../codecs/wm8994.h"
+#include "../codecs/tlv320aic31xx.h"
 
 #define CS427x_SYSCLK_MCLK 0
 
@@ -629,6 +630,16 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic32x4")) {
 		codec_dai_name = "tlv320aic32x4-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
+		codec_dai_name = "tlv320dac31xx-hifi";
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+		priv->dai_link[1].dpcm_capture = 0;
+		priv->dai_link[2].dpcm_capture = 0;
+		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
+		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
+		priv->codec_priv.mclk_id = AIC31XX_PLL_CLKIN_BCLK;
+		priv->card.dapm_routes = audio_map_tx;
+		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8962")) {
 		codec_dai_name = "wm8962";
 		priv->codec_priv.mclk_id = WM8962_SYSCLK_MCLK;
@@ -888,6 +899,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-cs42888", },
 	{ .compatible = "fsl,imx-audio-cs427x", },
 	{ .compatible = "fsl,imx-audio-tlv320aic32x4", },
+	{ .compatible = "fsl,imx-audio-tlv320aic31xx", },
 	{ .compatible = "fsl,imx-audio-sgtl5000", },
 	{ .compatible = "fsl,imx-audio-wm8962", },
 	{ .compatible = "fsl,imx-audio-wm8960", },
-- 
2.30.2

