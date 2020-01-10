Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC87136E63
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 14:43:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23CA716C7;
	Fri, 10 Jan 2020 14:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23CA716C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578663821;
	bh=zrECUXXugoK/OC/1/7CGDLqWZWo9AhaaN5rk0oSjSJg=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nuS9j2gWZS1R1A4Vj3auT29F3D8i1FhmBZ2jtMlt5kaghdMimsD3thnVfiXNL4nsk
	 9NaN1JHctEpBgwmcrOPNPbykSS2s2vUy66zbaiUtvddWknM6YDL/M3Zy8YDE8QJds4
	 ouxXPtqC5xvR78bX3fDJTFRDGE6NrouvxWq6qjoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64728F802C2;
	Fri, 10 Jan 2020 14:38:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEBB4F80290; Fri, 10 Jan 2020 14:37:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F40E6F80273
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 14:37:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F40E6F80273
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10952DA7;
 Fri, 10 Jan 2020 05:37:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FEE53F534;
 Fri, 10 Jan 2020 05:37:53 -0800 (PST)
Date: Fri, 10 Jan 2020 13:37:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878smgt4vp.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-878smgt4vp.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Sridharan Ranjani <ranjani.sridharan@intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: rename snd_soc_rtdcom_add()
	to snd_soc_rtd_add_component()" to the asoc tree
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

   ASoC: soc-core: rename snd_soc_rtdcom_add() to snd_soc_rtd_add_component()

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

From 12b052327dc2d9d4ca5146608aad1c42741df4fb Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 10 Jan 2020 11:35:54 +0900
Subject: [PATCH] ASoC: soc-core: rename snd_soc_rtdcom_add() to
 snd_soc_rtd_add_component()

We don't have snd_soc_rtdcom_list anymore.
Let's rename snd_soc_rtdcom_add() to more understandable
snd_soc_rtd_add_component()

Reported-by: Sridharan, Ranjani <ranjani.sridharan@intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/878smgt4vp.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c9daa63a339b..9a6d905cda43 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -258,8 +258,8 @@ static inline void snd_soc_debugfs_exit(void)
 
 #endif
 
-static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
-			      struct snd_soc_component *component)
+static int snd_soc_rtd_add_component(struct snd_soc_pcm_runtime *rtd,
+				     struct snd_soc_component *component)
 {
 	struct snd_soc_component *comp;
 	int i;
@@ -1035,7 +1035,7 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 			 dai_link->cpus->dai_name);
 		goto _err_defer;
 	}
-	snd_soc_rtdcom_add(rtd, rtd->cpu_dai->component);
+	snd_soc_rtd_add_component(rtd, rtd->cpu_dai->component);
 
 	/* Find CODEC from registered CODECs */
 	rtd->num_codecs = dai_link->num_codecs;
@@ -1047,7 +1047,7 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 			goto _err_defer;
 		}
 
-		snd_soc_rtdcom_add(rtd, rtd->codec_dais[i]->component);
+		snd_soc_rtd_add_component(rtd, rtd->codec_dais[i]->component);
 	}
 
 	/* Single codec links expect codec and codec_dai in runtime data */
@@ -1059,7 +1059,7 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 			if (!snd_soc_is_matching_component(platform, component))
 				continue;
 
-			snd_soc_rtdcom_add(rtd, component);
+			snd_soc_rtd_add_component(rtd, component);
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
