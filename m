Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D29165164
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:09:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C68716A4;
	Wed, 19 Feb 2020 22:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C68716A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582146543;
	bh=48VxLmzKuqcF+XCTyIQveyvvrBmlOJV5gDAjPg2DFE0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vgMLWpH67sVYXfX/aT24r7dsM4S6kMwwqeqoX8NbOxGRLDihTtP04LMVxY6vOPZA5
	 /Nv7/iNd9tUvToGMHHrbf83IIvf3NZJEKHvVu7QiBtALfcW6qiAlwlV+LXsSq33QFU
	 cR7o3nzgBlSQFkQf1MWZLY40pFsvh/HSCgJEW9g0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29290F80346;
	Wed, 19 Feb 2020 21:58:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86625F80345; Wed, 19 Feb 2020 21:58:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 46D49F80342
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 21:58:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46D49F80342
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D888101E;
 Wed, 19 Feb 2020 12:58:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EA633F68F;
 Wed, 19 Feb 2020 12:58:06 -0800 (PST)
Date: Wed, 19 Feb 2020 20:58:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Applied "ASoC: pcm: Fix possible buffer overflow in dpcm state sysfs
 output" to the asoc tree
In-Reply-To: <20200218111737.14193-4-tiwai@suse.de>
Message-Id: <applied-20200218111737.14193-4-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
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

   ASoC: pcm: Fix possible buffer overflow in dpcm state sysfs output

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

From 6c89ffea60aa3b2a33ae7987de1e84bfb89e4c9e Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 18 Feb 2020 12:17:37 +0100
Subject: [PATCH] ASoC: pcm: Fix possible buffer overflow in dpcm state sysfs
 output

dpcm_show_state() invokes multiple snprintf() calls to concatenate
formatted strings on the fixed size buffer.  The usage of snprintf()
is supposed for avoiding the buffer overflow, but it doesn't work as
expected because snprintf() doesn't return the actual output size but
the size to be written.

Fix this bug by replacing all snprintf() calls with scnprintf()
calls.

Fixes: f86dcef87b77 ("ASoC: dpcm: Add debugFS support for DPCM")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20200218111737.14193-4-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e66ac9ce321b..42fb03a99cb1 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -3171,16 +3171,16 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 	unsigned long flags;
 
 	/* FE state */
-	offset += snprintf(buf + offset, size - offset,
+	offset += scnprintf(buf + offset, size - offset,
 			"[%s - %s]\n", fe->dai_link->name,
 			stream ? "Capture" : "Playback");
 
-	offset += snprintf(buf + offset, size - offset, "State: %s\n",
+	offset += scnprintf(buf + offset, size - offset, "State: %s\n",
 	                dpcm_state_string(fe->dpcm[stream].state));
 
 	if ((fe->dpcm[stream].state >= SND_SOC_DPCM_STATE_HW_PARAMS) &&
 	    (fe->dpcm[stream].state <= SND_SOC_DPCM_STATE_STOP))
-		offset += snprintf(buf + offset, size - offset,
+		offset += scnprintf(buf + offset, size - offset,
 				"Hardware Params: "
 				"Format = %s, Channels = %d, Rate = %d\n",
 				snd_pcm_format_name(params_format(params)),
@@ -3188,10 +3188,10 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 				params_rate(params));
 
 	/* BEs state */
-	offset += snprintf(buf + offset, size - offset, "Backends:\n");
+	offset += scnprintf(buf + offset, size - offset, "Backends:\n");
 
 	if (list_empty(&fe->dpcm[stream].be_clients)) {
-		offset += snprintf(buf + offset, size - offset,
+		offset += scnprintf(buf + offset, size - offset,
 				" No active DSP links\n");
 		goto out;
 	}
@@ -3201,16 +3201,16 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		params = &dpcm->hw_params;
 
-		offset += snprintf(buf + offset, size - offset,
+		offset += scnprintf(buf + offset, size - offset,
 				"- %s\n", be->dai_link->name);
 
-		offset += snprintf(buf + offset, size - offset,
+		offset += scnprintf(buf + offset, size - offset,
 				"   State: %s\n",
 				dpcm_state_string(be->dpcm[stream].state));
 
 		if ((be->dpcm[stream].state >= SND_SOC_DPCM_STATE_HW_PARAMS) &&
 		    (be->dpcm[stream].state <= SND_SOC_DPCM_STATE_STOP))
-			offset += snprintf(buf + offset, size - offset,
+			offset += scnprintf(buf + offset, size - offset,
 				"   Hardware Params: "
 				"Format = %s, Channels = %d, Rate = %d\n",
 				snd_pcm_format_name(params_format(params)),
-- 
2.20.1

