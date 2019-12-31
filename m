Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395B12D54F
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Dec 2019 01:33:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CE4516C0;
	Tue, 31 Dec 2019 01:33:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CE4516C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577752435;
	bh=FsKRiiR4wmwHQMsGKgwTRbmkslP53T2xhygKMOdwfAY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TM9rCGrlqnAUUM4ZZA9b5z018fCHVBIbhTK9HuO9++7SjWyj9iPqg05s39A+ugXNc
	 njgxjVETWxuthnGazMxs+GwJpAlh59eZD9uS3TWa6E+bqbeN3jdV6gzUY5ITYwm5eJ
	 QTEEYJ7yMeevmxjleqg4eNh8X7KoWceBOCXFqPAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F2D9F80271;
	Tue, 31 Dec 2019 01:30:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1583EF8026F; Tue, 31 Dec 2019 01:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2FE4F8015D
 for <alsa-devel@alsa-project.org>; Tue, 31 Dec 2019 01:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2FE4F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CoYuxl0d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=x+tq/P7MFfoTpVq1wYknSSh2xy/H5XU8JlazuogWVHk=; b=CoYuxl0dN7iT
 P40XlnMV5r4YAQ9ds2ivLwaOQY47y5JejlvuhA8Ow4Cjbb1UWUZAS5P8xBezQkcT31EKXVEtBZSrs
 3IKLbnNXxZCorckVPXXOgXKZzK6xd5GXF1HPOqJestGlrAClerK5oszgce+LXrj6nyGRdJvIMIcEY
 a/N+M=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1im5Qf-0002nS-Mm; Tue, 31 Dec 2019 00:30:33 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 41A01D01A22; Tue, 31 Dec 2019 00:30:33 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <1577540460-21438-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Message-Id: <applied-1577540460-21438-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Patchwork-Hint: ignore
Date: Tue, 31 Dec 2019 00:30:33 +0000 (GMT)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi@sirena.org.uk,
 -@sirena.org.uk, YueHaibing <yuehaibing@huawei.com>, moderated@sirena.org.uk,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, DYNAMIC@sirena.org.uk,
 AUDIO@sirena.org.uk, Mark Brown <broonie@kernel.org>,
 "list:SOUND"@sirena.org.uk, LAYER@sirena.org.uk, Liam@sirena.org.uk,
 /@sirena.org.uk, Gustavo@sirena.org.uk,
 open list <linux-kernel@vger.kernel.org>, "Cc:"@sirena.org.uk,
 SOC@sirena.org.uk, djkurtz@google.com, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] Applied "ASoC: amd MMAP_INTERLEAVED Support" to the
	asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: amd MMAP_INTERLEAVED Support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 3d8cbeda38f1cc51733715f0a02b338b4f75fad0 Mon Sep 17 00:00:00 2001
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Date: Sat, 28 Dec 2019 19:11:00 +0530
Subject: [PATCH] ASoC: amd MMAP_INTERLEAVED Support

ACP-I2S device support MMAP_INTERLEAVED.
Added support for the same.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Link: https://lore.kernel.org/r/1577540460-21438-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 151daa996343..5c3ec3c58e3b 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -21,6 +21,7 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
 		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
@@ -41,7 +42,8 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_capture = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |
-	    SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
 		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
 		   SNDRV_PCM_FMTBIT_S32_LE,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
