Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48115BF6E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 14:33:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24BBE1676;
	Thu, 13 Feb 2020 14:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24BBE1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581600829;
	bh=01K5oIkCJPIt8BLgLXKRaAidpTrfjwwW1tjiOiiFIMk=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sn7d+WmMFxyGX8rdQnlfdydWBWpeL8D8Utr+TJiRaNDtTVkYprZ4PTM05kmUep1dW
	 XP9tS9GOpwVRFhi3UMzg+TW1h0kSb4hrnv8kqEaKmsmScyuY8KKiVPoY7/ijjUYKAr
	 g28LmjHB9oKUfMMPq+kcMCGBSwib6PhX2Z4uxgNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA0E1F8013E;
	Thu, 13 Feb 2020 14:32:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E4FF80145; Thu, 13 Feb 2020 14:32:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B170EF80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 14:31:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B170EF80138
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77F861FB;
 Thu, 13 Feb 2020 05:31:58 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E74B73F6CF;
 Thu, 13 Feb 2020 05:31:57 -0800 (PST)
Date: Thu, 13 Feb 2020 13:31:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20200213061147.29386-2-samuel@sholland.org>
Message-Id: <applied-20200213061147.29386-2-samuel@sholland.org>
X-Patchwork-Hint: ignore
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] Applied "ASoC: codec2codec: avoid invalid/double-free
	of pcm runtime" to the asoc tree
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

   ASoC: codec2codec: avoid invalid/double-free of pcm runtime

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

From b6570fdb96edf45bcf71884bd2644bd73d348d1a Mon Sep 17 00:00:00 2001
From: Samuel Holland <samuel@sholland.org>
Date: Thu, 13 Feb 2020 00:11:44 -0600
Subject: [PATCH] ASoC: codec2codec: avoid invalid/double-free of pcm runtime

The PCM runtime was freed during PMU in the case that the event hook
encountered an error. However, it is also unconditionally freed during
PMD. Avoid a double-free by dropping the call to kfree in the PMU hook.

Fixes: a72706ed8208 ("ASoC: codec2codec: remove ephemeral variables")
Cc: stable@vger.kernel.org
Signed-off-by: Samuel Holland <samuel@sholland.org>
Link: https://lore.kernel.org/r/20200213061147.29386-2-samuel@sholland.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index bc20ad9abf8b..8b24396675ec 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3916,9 +3916,6 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	runtime->rate = params_rate(params);
 
 out:
-	if (ret < 0)
-		kfree(runtime);
-
 	kfree(params);
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
