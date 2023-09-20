Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10E7A7910
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 12:21:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B5CDF6;
	Wed, 20 Sep 2023 12:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B5CDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695205273;
	bh=BG5x0JMyi+iHXBHUdSdY0n+le68k55jrLtsWFj9cFUg=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z9frWYSYXCL1q89jbymQ/lpR2r8as++7RJQBG9QYsMB6tL8CPmPHt22K2KLsDHBm5
	 FQORzys5APRlKAtszCWnfcq9M2A2X+CoRdICq+o80/XwkXPtdUFacaZ5MV+KLz++dt
	 rbevPDb9Uz1IYVS+/ZSvJWUDlO6tOl5sjTQfUF2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64431F80558; Wed, 20 Sep 2023 12:20:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE963F80558;
	Wed, 20 Sep 2023 12:20:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 997A1F8055B; Wed, 20 Sep 2023 12:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50EA9F80558
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 12:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50EA9F80558
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A38AD200B1D;
	Wed, 20 Sep 2023 12:19:58 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6AF6E200B27;
	Wed, 20 Sep 2023 12:19:58 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E88891802200;
	Wed, 20 Sep 2023 18:19:56 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl-asoc-card: use integer type for fll_id and pll_id
Date: Wed, 20 Sep 2023 17:43:12 +0800
Message-Id: <1695202992-24864-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: IADH3D5LJBY5UONXQUXRHFACYJ77L2U7
X-Message-ID-Hash: IADH3D5LJBY5UONXQUXRHFACYJ77L2U7
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IADH3D5LJBY5UONXQUXRHFACYJ77L2U7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As the pll_id and pll_id can be zero (WM8960_SYSCLK_AUTO)
with the commit 2bbc2df46e67 ("ASoC: wm8960: Make automatic the
default clocking mode")

Then the machine driver will skip to call set_sysclk() and set_pll()
for codec, when the sysclk rate is different with what wm8960 read
at probe, the output sound frequency is wrong.

So change the fll_id and pll_id initial value, still keep machine
driver's behavior same as before.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 76b5bfc288fd..bab7d34cf585 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -52,8 +52,8 @@ struct codec_priv {
 	unsigned long mclk_freq;
 	unsigned long free_freq;
 	u32 mclk_id;
-	u32 fll_id;
-	u32 pll_id;
+	int fll_id;
+	int pll_id;
 };
 
 /**
@@ -206,7 +206,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Specific configuration for PLL */
-	if (codec_priv->pll_id && codec_priv->fll_id) {
+	if (codec_priv->pll_id >= 0 && codec_priv->fll_id >= 0) {
 		if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
 			pll_out = priv->sample_rate * 384;
 		else
@@ -248,7 +248,7 @@ static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 
 	priv->streams &= ~BIT(substream->stream);
 
-	if (!priv->streams && codec_priv->pll_id && codec_priv->fll_id) {
+	if (!priv->streams && codec_priv->pll_id >= 0 && codec_priv->fll_id >= 0) {
 		/* Force freq to be free_freq to avoid error message in codec */
 		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
 					     codec_priv->mclk_id,
@@ -621,6 +621,10 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	priv->card.dapm_routes = audio_map;
 	priv->card.num_dapm_routes = ARRAY_SIZE(audio_map);
 	priv->card.driver_name = DRIVER_NAME;
+
+	priv->codec_priv.fll_id = -1;
+	priv->codec_priv.pll_id = -1;
+
 	/* Diversify the card configurations */
 	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
 		codec_dai_name = "cs42888";
-- 
2.34.1

