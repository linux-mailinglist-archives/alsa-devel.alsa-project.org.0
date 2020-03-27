Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F68195A88
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 17:01:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94DD416AD;
	Fri, 27 Mar 2020 17:00:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94DD416AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324878;
	bh=xg8lSqPfVVEhD4ADvfgI3bWuXQP0wu8iWAvKJ7yi7nU=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OuEZowCn6O7ll88gRPV/OwiTwG65nW8QXemG3e/u5Z6hR8XSRY6QZwy+Mm1m6Q8Wz
	 TS0h0ityjVzaW5DDcjD78r0rAq3AqL2uypt6iHVMxyvK6bxUvIHDK1olzo2ZGCzfkL
	 5uo3pG/f/46xJSLqyt2NtTRByL0XJRd5SR90LiKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 564E6F8049D;
	Fri, 27 Mar 2020 16:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FC5FF80491; Fri, 27 Mar 2020 16:36:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6146EF80490
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6146EF80490
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC9611FB;
 Fri, 27 Mar 2020 08:36:45 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 302F13F71F;
 Fri, 27 Mar 2020 08:36:45 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:36:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-core: add asoc_rtd_to_cpu/codec() macro" to the
 asoc tree
In-Reply-To: <875zevk5va.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-875zevk5va.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: soc-core: add asoc_rtd_to_cpu/codec() macro

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

From 2af69581e1b11152bc42f1122d3c16e177bd77cf Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:16:57 +0900
Subject: [PATCH] ASoC: soc-core: add asoc_rtd_to_cpu/codec() macro

Now, snd_soc_pcm_runtime supports multi cpu_dai/codec_dai.
It still has cpu_dai/codec_dai for single DAI,
and has cpu_dais/codec_dais for multi DAIs.

	dais  = [][][][][][][][][][][][][][][][][][]
		^cpu_dais         ^codec_dais
		|--- num_cpus ---|--- num_codecs --|

	/* for multi DAIs */
	rtd->cpu_dais   = &rtd->dais[0];
	rtd->codec_dais = &rtd->dais[dai_link->num_cpus];

	/* for single DAI */
	rtd->cpu_dai    = rtd->cpu_dais[0];
	rtd->codec_dai	= rtd->codec_dais[0];

But, these can be replaced by dais.
This patch adds asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/875zevk5va.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 539211bd0f94..13458e4fbb13 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1169,6 +1169,10 @@ struct snd_soc_pcm_runtime {
 	int num_components;
 	struct snd_soc_component *components[0]; /* CPU/Codec/Platform */
 };
+/* see soc_new_pcm_runtime()  */
+#define asoc_rtd_to_cpu(rtd, n)   (rtd)->dais[n]
+#define asoc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->num_cpus]
+
 #define for_each_rtd_components(rtd, i, component)			\
 	for ((i) = 0;							\
 	     ((i) < rtd->num_components) && ((component) = rtd->components[i]);\
-- 
2.20.1

