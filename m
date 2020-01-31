Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8214E9FC
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 10:20:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2FA1678;
	Fri, 31 Jan 2020 10:20:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2FA1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580462457;
	bh=PEH6DHRdeSdnkQwFHfK4SCoV8Xb/zlX6ZgQqEoUrF/A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lPFA3hXSNgjfTyIHKvrWmiGTctYrbA9Q6oqGUY3uhMZzjvhZSATCx4ckZvhZ8/SMq
	 XiC3HQxb1IO708LSL2TPYys9du3iCVntMeDcMrnnWIpzrt1oOhinhu2/92FWCWoekb
	 5LVWQXo6qO1tkKcLeo7L0ay8PzlXuhdOsgpGrctQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80198F80229;
	Fri, 31 Jan 2020 10:19:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1697AF8021E; Fri, 31 Jan 2020 10:19:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10CCAF80116
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 10:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10CCAF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="LlE3h6by"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e33f0fc0000>; Fri, 31 Jan 2020 01:18:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 31 Jan 2020 01:19:06 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 31 Jan 2020 01:19:06 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jan
 2020 09:19:05 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 31 Jan 2020 09:19:06 +0000
Received: from localhost.localdomain (Not Verified[10.21.133.51]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e33f1070000>; Fri, 31 Jan 2020 01:19:06 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Thierry
 Reding <thierry.reding@gmail.com>
Date: Fri, 31 Jan 2020 09:19:01 +0000
Message-ID: <20200131091901.13014-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580462332; bh=tiU1SfpaStOkJ6bQ2E30mw6f5GTzwb+oM/IkptsdS5k=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=LlE3h6byVFYfwkT5fY0SHwQMoZLsEXCO9SfRIsLT/dS4D1vvvSozqeBst/zTE/6Og
 Z2oacZ6c9tyJg1bCfyoBih1xyX8x1tjRExAPhi47HzTbhtZLA0wgm5+I3rNI6oYcL0
 d9d2c2ds1R2fBHbtF02i8ro2/7aNYWTn9K+Z6swwnybwMbIFNrZ17/WbKsCGIbAi43
 wzGLTj1sUvaYGDb07oR5GnoDg7b+1Gm+M7UQjmG7jhlu871jQ9eIsEFevnmq0eZgZM
 gxzl/c2VQtql1d7bFipw7TqPAcrItpz9Kvy57LwvMqp0IexMU4hoXbltHu5ZU60Qtm
 isWSyMpaK20NQ==
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
Subject: [alsa-devel] [PATCH] Revert "ASoC: tegra: Allow 24bit and 32bit
	samples"
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

Commit f3ee99087c8ca0ecfdd549ef5a94f557c42d5428 ("ASoC: tegra: Allow
24bit and 32bit samples") added 24-bit and 32-bit support for to the
Tegra30 I2S driver. However, there are two additional commits that are
also needed to get 24-bit and 32-bit support to work correctly. These
commits are not yet applied because there are still some review comments
that need to be addressed. With only this change applied, 24-bit and
32-bit support is advertised by the I2S driver, but it does not work and
the audio is distorted. Therefore, revert this patch for now until the
other changes are also ready.

Furthermore, a clock issue with 24-bit support has been identified with
this change and so if we revert this now, we can also fix that in the
updated version.

Cc: stable@vger.kernel.org

Reported-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/soc/tegra/tegra30_i2s.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index dbed3c5408e7..d59882ec48f1 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = dai->dev;
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask, val, reg;
-	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
+	int ret, sample_size, srate, i2sclock, bitcnt;
 	struct tegra30_ahub_cif_conf cif_conf;
 
 	if (params_channels(params) != 2)
@@ -137,19 +137,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
-		audio_bits = TEGRA30_AUDIOCIF_BITS_16;
 		sample_size = 16;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
-		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
-		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
-		sample_size = 24;
-		break;
-	case SNDRV_PCM_FORMAT_S32_LE:
-		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
-		audio_bits = TEGRA30_AUDIOCIF_BITS_32;
-		sample_size = 32;
-		break;
 	default:
 		return -EINVAL;
 	}
@@ -181,8 +170,8 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	cif_conf.threshold = 0;
 	cif_conf.audio_channels = 2;
 	cif_conf.client_channels = 2;
-	cif_conf.audio_bits = audio_bits;
-	cif_conf.client_bits = audio_bits;
+	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
+	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
 	cif_conf.expand = 0;
 	cif_conf.stereo_conv = 0;
 	cif_conf.replicate = 0;
@@ -317,18 +306,14 @@ static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S32_LE |
-			   SNDRV_PCM_FMTBIT_S24_LE |
-			   SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S32_LE |
-			   SNDRV_PCM_FMTBIT_S24_LE |
-			   SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.ops = &tegra30_i2s_dai_ops,
 	.symmetric_rates = 1,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
