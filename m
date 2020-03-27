Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6CE195A56
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:53:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C41168C;
	Fri, 27 Mar 2020 16:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C41168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324422;
	bh=qL2BkfkzdBzsCnk42XL/BPj+k+A1Fb8rsMd0ZoPt0WE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cV6nVxpV5logvmgRf5J8sljwSnZSFFfR6yL3ARqOFqbjZBpBhNTkUr7n+lD0h6mEx
	 1Ah1qsyuUF2VoSld6Pp0tmC7pcNvizfqhkKar88RNO9hucHDHJBvj7Sn6iNqKfKfmX
	 9gTyEOD08j+QxJxSrK1Y78UJgm6hMQ1oj/VLfTOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 640D8F803EA;
	Fri, 27 Mar 2020 16:35:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6F5DF803DF; Fri, 27 Mar 2020 16:35:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CDB26F803CE
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB26F803CE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42872101E;
 Fri, 27 Mar 2020 08:35:46 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCBC83F71F;
 Fri, 27 Mar 2020 08:35:45 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: meson: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <87mu87ir6j.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87mu87ir6j.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
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

   ASoC: meson: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 385a5c60ad7ac778a24c2715a2085241b2d6a7f4 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:19:32 +0900
Subject: [PATCH] ASoC: meson: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87mu87ir6j.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/aiu-fifo.c         | 2 +-
 sound/soc/meson/axg-card.c         | 8 ++++----
 sound/soc/meson/axg-fifo.c         | 2 +-
 sound/soc/meson/meson-card-utils.c | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index da8c098e8750..d9cede4c33ff 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -26,7 +26,7 @@ static struct snd_soc_dai *aiu_fifo_dai(struct snd_pcm_substream *ss)
 {
 	struct snd_soc_pcm_runtime *rtd = ss->private_data;
 
-	return rtd->cpu_dai;
+	return asoc_rtd_to_cpu(rtd, 0);
 }
 
 snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 77a7d5f36ebf..af46845f4ef2 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -72,10 +72,10 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
-	ret = axg_tdm_set_tdm_slots(rtd->cpu_dai, be->tx_mask, be->rx_mask,
+	ret = axg_tdm_set_tdm_slots(asoc_rtd_to_cpu(rtd, 0), be->tx_mask, be->rx_mask,
 				    be->slots, be->slot_width);
 	if (ret) {
-		dev_err(rtd->cpu_dai->dev, "setting tdm link slots failed\n");
+		dev_err(asoc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
 		return ret;
 	}
 
@@ -90,10 +90,10 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	/* The loopback rx_mask is the pad tx_mask */
-	ret = axg_tdm_set_tdm_slots(rtd->cpu_dai, NULL, be->tx_mask,
+	ret = axg_tdm_set_tdm_slots(asoc_rtd_to_cpu(rtd, 0), NULL, be->tx_mask,
 				    be->slots, be->slot_width);
 	if (ret) {
-		dev_err(rtd->cpu_dai->dev, "setting tdm link slots failed\n");
+		dev_err(asoc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index c12b0d5e8ebf..2e9b56b29d31 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -47,7 +47,7 @@ static struct snd_soc_dai *axg_fifo_dai(struct snd_pcm_substream *ss)
 {
 	struct snd_soc_pcm_runtime *rtd = ss->private_data;
 
-	return rtd->cpu_dai;
+	return asoc_rtd_to_cpu(rtd, 0);
 }
 
 static struct axg_fifo *axg_fifo_data(struct snd_pcm_substream *ss)
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index b5d3c9f56bac..2ca8c98e204f 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -30,7 +30,7 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, 0, mclk,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk,
 				     SND_SOC_CLOCK_OUT);
 	if (ret && ret != -ENOTSUPP)
 		return ret;
-- 
2.20.1

