Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C013A17FFA5
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:58:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB831679;
	Tue, 10 Mar 2020 14:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB831679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583848688;
	bh=4ZGbZNifzNh9/ncRHM7Q4tOidCpYcrreWvqvQ4T7wMI=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BzNMkgDsuS0mUb+DlsMBKkxh+iTuLIZdr19AHYRzpqYSQB13mt2HJ4ngtkPmn26YE
	 ROyY6bXTMl24U5J3rWNrW7ruzQ56tGRW6gTI6GJV9iu/YlFPXB2e4cGq5/q0RlFw68
	 h6RpTD45dJA+ysuODV5pkLUEsPpBPPrzrmEIRE+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5743F802DD;
	Tue, 10 Mar 2020 14:51:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16086F802E9; Tue, 10 Mar 2020 14:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CDEA8F802DD
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDEA8F802DD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F0AD30E;
 Tue, 10 Mar 2020 06:51:52 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A79D23F6CF;
 Tue, 10 Mar 2020 06:51:51 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:51:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc.h: add for_each_rtd_codecs/cpus_dai() macro" to
 the asoc tree
In-Reply-To: <8736aii326.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-8736aii326.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

   ASoC: soc.h: add for_each_rtd_codecs/cpus_dai() macro

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

From 995cbc3ca1ab39fb5cf254181dcfba883c5d6d69 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Mar 2020 13:07:29 +0900
Subject: [PATCH] ASoC: soc.h: add for_each_rtd_codecs/cpus_dai() macro

We are using plural form for for_each_xxx() macro.
But, for_each_rtd_codec/cpu_dai() are out of this rule.
This patch adds plural form macro.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/8736aii326.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 9543d9246ca4..09bc45b8bf00 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1177,6 +1177,20 @@ struct snd_soc_pcm_runtime {
 #define for_each_rtd_cpu_dai_rollback(rtd, i, dai)		\
 	for (; (--(i) >= 0) && ((dai) = rtd->cpu_dais[i]);)
 
+#define for_each_rtd_cpu_dais(rtd, i, dai)				\
+	for ((i) = 0;							\
+	     ((i) < rtd->num_cpus) && ((dai) = rtd->cpu_dais[i]);	\
+	     (i)++)
+#define for_each_rtd_cpu_dais_rollback(rtd, i, dai)		\
+	for (; (--(i) >= 0) && ((dai) = rtd->cpu_dais[i]);)
+#define for_each_rtd_codec_dais(rtd, i, dai)				\
+	for ((i) = 0;							\
+	     ((i) < rtd->num_codecs) && ((dai) = rtd->codec_dais[i]);	\
+	     (i)++)
+#define for_each_rtd_codec_dais_rollback(rtd, i, dai)		\
+	for (; (--(i) >= 0) && ((dai) = rtd->codec_dais[i]);)
+
+
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
 /* mixer control */
-- 
2.20.1

