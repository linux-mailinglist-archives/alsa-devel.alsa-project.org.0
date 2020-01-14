Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805DC13AEF8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:15:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1863F1839;
	Tue, 14 Jan 2020 17:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1863F1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579018558;
	bh=gsDKOjtJdhPsdXBys30o4yxaF2/S+RpiB1iEZSnikJ0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ctfyldhq+aJRP+bHUcvaSUHlBwTJ/bJWjnn4dYwwklV5Fnvp5tZROEDktHen0jDUq
	 I0maewZD2S8PwVsep7t5WNO7gMu2HjzXY8so9qMXGre0Ewkc48jDP/r2eJ8VPvjF0P
	 7KXG6BRS2N676sf1zbOgOAuLv189icH72KREARCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64E48F80304;
	Tue, 14 Jan 2020 17:09:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 644B6F802EB; Tue, 14 Jan 2020 17:09:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD666F8026A
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD666F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sZ2SwT8M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=22Xadmgqqn/g/JJeImgI/aav10hDXqvtbEIriZcpIEc=; b=sZ2SwT8MQFA4
 lzw2JwNlfmPyx7BebnODjHjJdKWUpVLE5D1J5vy48hnmRUs41CiLfJLiXa7QOBlh4u1E40O0Sb/Kr
 vDMqpKZii8TIWemxzuim7MK69c68ofiaZtfsgHVY9tZc/yS5uaH4iY3LQvvo70DyhQgdWSos7pZuT
 SIBrA=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOke-0001VK-Fq; Tue, 14 Jan 2020 16:09:08 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 251DAD02C77; Tue, 14 Jan 2020 16:09:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200113210428.27457-17-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200113210428.27457-17-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:08 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: bytcht_es8316: removed unused
	variable" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============3094099747092985998=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============3094099747092985998==
Content-Type: text/plain

The patch

   ASoC: Intel: bytcht_es8316: removed unused variable

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

From 1b2c868083195f9ae374707bab83739f09a5b261 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 13 Jan 2020 15:04:26 -0600
Subject: [PATCH] ASoC: Intel: bytcht_es8316: removed unused variable
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix GCC warning with W=1

sound/soc/intel//boards/bytcht_es8316.c:237:40: warning:
‘byt_cht_es8316_dai_params’ defined but not used
[-Wunused-const-variable=]

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200113210428.27457-17-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bytcht_es8316.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index ce760c361eb2..0adc5a5e134a 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -234,14 +234,6 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 	return 0;
 }
 
-static const struct snd_soc_pcm_stream byt_cht_es8316_dai_params = {
-	.formats = SNDRV_PCM_FMTBIT_S24_LE,
-	.rate_min = 48000,
-	.rate_max = 48000,
-	.channels_min = 2,
-	.channels_max = 2,
-};
-
 static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_pcm_hw_params *params)
 {
-- 
2.20.1


--===============3094099747092985998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3094099747092985998==--
