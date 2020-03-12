Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E31830FC
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 14:14:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4FC16EC;
	Thu, 12 Mar 2020 14:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4FC16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584018877;
	bh=Q19RzE4raSm0pL7HXduR5Cd0zhjjliYs/iLQ5vH/Vhk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=grHw2d9/C3WvF1m/RMssmgPWkwMVmbIVs6BVClZY99VvYPkCA2wUQJ38NNddi+h5W
	 +sUwQ53+yIeHuisL0UWcSKEJXPF4hZnBH4nfc3XUGvNX6Y/CrxqY8GK6YwpEQTYm/r
	 z7kPXPX6wBgVtAVzccp6UTNF7MCjbDZ+f+aPThC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B19EF801D9;
	Thu, 12 Mar 2020 14:12:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06386F8020C; Thu, 12 Mar 2020 14:12:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 77BF6F80086
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 14:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77BF6F80086
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7F7330E;
 Thu, 12 Mar 2020 06:12:49 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AE283F534;
 Thu, 12 Mar 2020 06:12:49 -0700 (PDT)
Date: Thu, 12 Mar 2020 13:12:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: SOF: Intel: Fix stream cleanup on hw free" to the asoc
 tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: SOF: Intel: Fix stream cleanup on hw free

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

From 16dcefc23eefda57ee705dcffba67f1bd42c01bc Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 12 Mar 2020 13:00:58 +0100
Subject: [PATCH] ASoC: SOF: Intel: Fix stream cleanup on hw free

Field "substream" gets assigned during stream setup in
hda_dsp_pcm_hw_params() but it is never cleared afterwards during
cleanup procedure. Now, any non-pcm operation e.g.: compress can
mistakenly make use of that pointer as it's bypassing all
"if (s->substream)" checks.

Nulling the pointer during hw_free operation ensures no wild pointers
are left behind.

Fixes: cdae3b9a47aa ("ASoC: SOF: Intel: Add Intel specific HDA PCM operations")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200312120058.15057-1-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-stream.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c0ab9bb2a797..d2234f802788 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -547,6 +547,8 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 					SOF_HDA_REG_PP_PPCTL, mask, 0);
 	spin_unlock_irq(&bus->reg_lock);
 
+	stream->substream = NULL;
+
 	return 0;
 }
 
-- 
2.20.1

