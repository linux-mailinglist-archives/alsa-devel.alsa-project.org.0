Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 070837F10B7
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 11:46:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C207A4D;
	Mon, 20 Nov 2023 11:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C207A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700477189;
	bh=4YacgHpWoFm1TTR4Bfb8AIVrWUbD+9qbt8YY841WMLo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=g+cCEisps49zyEsTq/9anFupN2AUpQ0Bcd1mmZLVvK3nsSZOseIaSVf5hv19kolDh
	 s7JJj/6tA54T8d+uG8gKOpxVzn3N9WioA6IZI0Aax0B6rYfmqZjAzLRMcnSrzeR08/
	 2DOvRiSaj2GIiOx3eXolywjciHltViyFxkMQc0WM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC231F80310; Mon, 20 Nov 2023 11:45:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65CABF80114;
	Mon, 20 Nov 2023 11:45:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05145F802E8; Mon, 20 Nov 2023 11:45:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80C94F80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 11:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80C94F80114
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C70501A0CB9;
	Mon, 20 Nov 2023 11:45:28 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 907641A0C96;
	Mon, 20 Nov 2023 11:45:28 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 11B72180222F;
	Mon, 20 Nov 2023 18:45:27 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: Fix no frame sync clock issue on i.MX8MP
Date: Mon, 20 Nov 2023 18:05:35 +0800
Message-Id: <1700474735-3863-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 72U5OWDKGEW6K72VOXJFVKXJUXOXX6JF
X-Message-ID-Hash: 72U5OWDKGEW6K72VOXJFVKXJUXOXX6JF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72U5OWDKGEW6K72VOXJFVKXJUXOXX6JF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On i.MX8MP, when the TERE and FSD_MSTR enabled before configuring
the word width, there will be no frame sync clock issue, because
old word width impact the generation of frame sync.

TERE enabled earlier only for i.MX8MP case for the hardware limitation,
So need to disable FSD_MSTR before configuring word width, then enable
FSD_MSTR bit for this specific case.

Fixes: 3e4a82612998 ("ASoC: fsl_sai: MCLK bind with TX/RX enable bit")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 79e7c6b98a75..32bbe5056a63 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -673,6 +673,20 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 			   FSL_SAI_CR3_TRCE_MASK,
 			   FSL_SAI_CR3_TRCE((dl_cfg[dl_cfg_idx].mask[tx] & trce_mask)));
 
+	/*
+	 * When the TERE and FSD_MSTR enabled before configuring the word width
+	 * There will be no frame sync clock issue, because word width impact
+	 * the generation of frame sync clock.
+	 *
+	 * TERE enabled earlier only for i.MX8MP case for the hardware limitation,
+	 * We need to disable FSD_MSTR before configuring word width, then enable
+	 * FSD_MSTR bit for this specific case.
+	 */
+	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output &&
+	    !sai->is_consumer_mode)
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
+				   FSL_SAI_CR4_FSD_MSTR, 0);
+
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
 			   FSL_SAI_CR4_CHMOD_MASK,
@@ -680,6 +694,13 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 			   FSL_SAI_CR5_FBT_MASK, val_cr5);
+
+	/* Enable FSD_MSTR after configuring word width */
+	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output &&
+	    !sai->is_consumer_mode)
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
+				   FSL_SAI_CR4_FSD_MSTR, FSL_SAI_CR4_FSD_MSTR);
+
 	regmap_write(sai->regmap, FSL_SAI_xMR(tx),
 		     ~0UL - ((1 << min(channels, slots)) - 1));
 
-- 
2.34.1

