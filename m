Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9145E7897
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 12:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0117B210;
	Fri, 23 Sep 2022 12:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0117B210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663929928;
	bh=LnZuktrLLp0Im7cYCbymcLM8yGVx5DAsxuYq2175zvk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lQr+fnMz1Ma7ZOuasiHyTbikiwFylF2Fvvx0hw4/+BzAn+RjsefeU3oXlyFrBFBoU
	 Z3xG+lfpUiHaMUxGJS3c+LYPMMNVYeX7ORAz7riMSIZIrOw9SLufhE6ZTYcqnvtyq6
	 tIUnLMwTbXIMyU+J6wMtLC9m54PFTbby6fh6Cmog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C42F80431;
	Fri, 23 Sep 2022 12:44:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BE22F80269; Fri, 23 Sep 2022 12:44:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D3AF80107
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 12:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D3AF80107
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 513641A0F2A;
 Fri, 23 Sep 2022 12:44:23 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0657B1A0F0A;
 Fri, 23 Sep 2022 12:44:23 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 48DBB181D0CB;
 Fri, 23 Sep 2022 18:44:21 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [RESEND PATCH] Revert "ASoC: fsl_audmix: make clock and output src
 write only"
Date: Fri, 23 Sep 2022 18:25:26 +0800
Message-Id: <1663928726-10213-1-git-send-email-shengjiu.wang@nxp.com>
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

This reverts commit 944c517b8c838832a166f1c89afbf8724f4a6b49.

There is error after making clock and output src write only

$amixer -c imxaudmix cset numid=1 1
amixer: Cannot read the given element from control sysdefault:3

Which is worse than before, so let's revert the change.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_audmix.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 43857b7a81c9..672148dd4b23 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -199,18 +199,10 @@ static int fsl_audmix_put_out_src(struct snd_kcontrol *kcontrol,
 
 static const struct snd_kcontrol_new fsl_audmix_snd_controls[] = {
 	/* FSL_AUDMIX_CTR controls */
-	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-		.name = "Mixing Clock Source",
-		.info = snd_soc_info_enum_double,
-		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
-		.put = fsl_audmix_put_mix_clk_src,
-		.private_value = (unsigned long)&fsl_audmix_enum[0] },
-	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-		.name = "Output Source",
-		.info = snd_soc_info_enum_double,
-		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
-		.put = fsl_audmix_put_out_src,
-		.private_value = (unsigned long)&fsl_audmix_enum[1] },
+	SOC_ENUM_EXT("Mixing Clock Source", fsl_audmix_enum[0],
+		     snd_soc_get_enum_double, fsl_audmix_put_mix_clk_src),
+	SOC_ENUM_EXT("Output Source", fsl_audmix_enum[1],
+		     snd_soc_get_enum_double, fsl_audmix_put_out_src),
 	SOC_ENUM("Output Width", fsl_audmix_enum[2]),
 	SOC_ENUM("Frame Rate Diff Error", fsl_audmix_enum[3]),
 	SOC_ENUM("Clock Freq Diff Error", fsl_audmix_enum[4]),
-- 
2.34.1

