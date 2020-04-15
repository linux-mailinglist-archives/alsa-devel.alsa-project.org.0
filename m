Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4991A9EEB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 14:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF65C166D;
	Wed, 15 Apr 2020 14:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF65C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586952392;
	bh=XXcV+4XErxBRJ2lvcaCeiC4djWYf6Iv6N2+KQFtFRLQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VSIk+RgBGo7a6b6MbN2ck/lG1eo0k4QLtkj+lI41VGrJB4ELLsRJHu8XdIuzMDu+v
	 ikTOCIy6U/UL8iwgU9qV1MCwQeJeZ2kFFNR5W/vcLdD6UGD5ySWyFvXR3getfiZCrc
	 ViJ46XdJpsVE2iVbGnxhbod0znfVWZHzh3dvc6hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9123CF8025F;
	Wed, 15 Apr 2020 14:04:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC942F80264; Wed, 15 Apr 2020 14:01:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6659F80229
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 14:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6659F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1p8qlL03"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9906F20575;
 Wed, 15 Apr 2020 12:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586952044;
 bh=XXcV+4XErxBRJ2lvcaCeiC4djWYf6Iv6N2+KQFtFRLQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=1p8qlL03YhFtgdjp85otYcO/4XvK7W0JFWKgqC7WTdmAR27ZVH9Y0tEIkzp449+4F
 wC+0pKWzx3vd9yBhWfIYI3nttp1DJuzNfki6PFR5Ybfd1K/6LD/dipeUzMVop5gnY3
 KWShg20GVahWITf6ky1mAptI8DJFftptiTKBxgvY=
Date: Wed, 15 Apr 2020 13:00:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Applied "ASoC: soc-pcm: dpcm: Only allow playback/capture if
 supported" to the asoc tree
In-Reply-To: <20200415104928.86091-1-stephan@gerhold.net>
Message-Id: <applied-20200415104928.86091-1-stephan@gerhold.net>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
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

The patch

   ASoC: soc-pcm: dpcm: Only allow playback/capture if supported

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 9b5db059366ae2087e07892b5fc108f81f4ec189 Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan@gerhold.net>
Date: Wed, 15 Apr 2020 12:49:28 +0200
Subject: [PATCH] ASoC: soc-pcm: dpcm: Only allow playback/capture if supported

At the moment, PCM devices for DPCM are only created based on the
dpcm_playback/capture parameters of the DAI link, without considering
if the CPU/FE DAI is actually capable of playback/capture.

Normally the dpcm_playback/capture parameter should match the
capabilities of the CPU DAI. However, there is no way to set that
parameter from the device tree (e.g. with simple-audio-card or
qcom sound cards). dpcm_playback/capture are always both set to 1.

This causes problems when the CPU DAI does only support playback
or capture. Attemting to open that PCM device with an unsupported
stream type then results in a null pointer dereference:

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000128
    Internal error: Oops: 96000044 [#1] PREEMPT SMP
    CPU: 3 PID: 1582 Comm: arecord Not tainted 5.7.0-rc1
    pc : invalidate_paths_ep+0x30/0xe0
    lr : snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
    Call trace:
     invalidate_paths_ep+0x30/0xe0
     snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
     dpcm_path_get+0x38/0xd0
     dpcm_fe_dai_open+0x70/0x920
     snd_pcm_open_substream+0x564/0x840
     snd_pcm_open+0xfc/0x228
     snd_pcm_capture_open+0x4c/0x78
     snd_open+0xac/0x1a8
     ...

... because the DAI playback/capture_widget is not set in that case.

We could add checks there to fix the problem (maybe we should
anyway), but much easier is to not expose the device as
playback/capture in the first place. Attemting to use that
device would always fail later anyway.

Add checks for snd_soc_dai_stream_valid() to the DPCM case
to avoid exposing playback/capture if it is not supported.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Link: https://lore.kernel.org/r/20200415104928.86091-1-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 289aebc15529..1f302de44052 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2911,8 +2911,17 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	int i;
 
 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
-		playback = rtd->dai_link->dpcm_playback;
-		capture = rtd->dai_link->dpcm_capture;
+		cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+		if (rtd->num_cpus > 1) {
+			dev_err(rtd->dev,
+				"DPCM doesn't support Multi CPU yet\n");
+			return -EINVAL;
+		}
+
+		playback = rtd->dai_link->dpcm_playback &&
+			   snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK);
+		capture = rtd->dai_link->dpcm_capture &&
+			  snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE);
 	} else {
 		/* Adapt stream for codec2codec links */
 		int cpu_capture = rtd->dai_link->params ?
-- 
2.20.1

