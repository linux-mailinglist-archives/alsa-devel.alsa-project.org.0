Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B48CB54A81D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 06:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1FA618D6;
	Tue, 14 Jun 2022 06:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1FA618D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655180836;
	bh=QB9n9mNnhQQWszwYca0ptb6IIp0I7IZuGi4WyLz0bsE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PgZ20BP2JeMfCLqUUx2/ls3r9yv3kc5eSzmFVuhHvUOKSj1Sipu+0ZM1mcr6WXq98
	 IjjHAyqSyP0CuzHEygqo6jCT8Zq0G/j589XE7rwVMBnKOB3v5n01C58ws1lLJ2AO1S
	 CYvGp2HGxZTD5BMzW3Odze6zWgwfF7p4MhXrjSdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 978C1F80533;
	Tue, 14 Jun 2022 06:25:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B67DF8052F; Tue, 14 Jun 2022 06:25:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE27F8016E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 06:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE27F8016E
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A215C2026FE;
 Tue, 14 Jun 2022 06:25:32 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 57D96202717;
 Tue, 14 Jun 2022 06:25:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 720D8180219B;
 Tue, 14 Jun 2022 12:25:30 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/7] ASoC: fsl_sai: Add support for more sample rates
Date: Tue, 14 Jun 2022 12:11:20 +0800
Message-Id: <1655179884-12278-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
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

