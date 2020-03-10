Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B617FF90
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:54:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1754D167B;
	Tue, 10 Mar 2020 14:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1754D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583848482;
	bh=3d/PSFBmWHjlKpFjbzaBfVSq43Q+KnFmxmGgn5a70+M=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=odKyNSYszbSRrPC+Zz/0fuHBeNXKCXNv3N2d9Dyvah5RFTKu5bk17b18GnQtuFMgk
	 l70zXBBxNyUYJWAYJ1IlL3KdsA/5XQegE2SPdkMwNGYGNA7YzxFpSc6xHhdTfEK+un
	 QEhPOo9k8ShFLc5D/ypusVn2vC2uaZR03bdJsTpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD2A5F80290;
	Tue, 10 Mar 2020 14:51:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3816F8028F; Tue, 10 Mar 2020 14:51:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DBEE8F80268
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:51:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBEE8F80268
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CB9230E;
 Tue, 10 Mar 2020 06:51:25 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D406C3F6CF;
 Tue, 10 Mar 2020 06:51:24 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:51:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc.h: remove non plural form for_each_xxx macro" to
 the asoc tree
In-Reply-To: <87tv2ygogl.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87tv2ygogl.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: soc.h: remove non plural form for_each_xxx macro

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

From 17e6dab5013ddb36997011cf6daea7297dfc215e Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Mar 2020 13:08:10 +0900
Subject: [PATCH] ASoC: soc.h: remove non plural form for_each_xxx macro

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87tv2ygogl.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 09bc45b8bf00..5e1b4ef1543c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1163,20 +1163,6 @@ struct snd_soc_pcm_runtime {
 	for ((i) = 0;							\
 	     ((i) < rtd->num_components) && ((component) = rtd->components[i]);\
 	     (i)++)
-#define for_each_rtd_codec_dai(rtd, i, dai)\
-	for ((i) = 0;						       \
-	     ((i) < rtd->num_codecs) && ((dai) = rtd->codec_dais[i]); \
-	     (i)++)
-#define for_each_rtd_codec_dai_rollback(rtd, i, dai)		\
-	for (; (--(i) >= 0) && ((dai) = rtd->codec_dais[i]);)
-
-#define for_each_rtd_cpu_dai(rtd, i, dai)\
-	for ((i) = 0;						       \
-	     ((i) < rtd->num_cpus) && ((dai) = rtd->cpu_dais[i]); \
-	     (i)++)
-#define for_each_rtd_cpu_dai_rollback(rtd, i, dai)		\
-	for (; (--(i) >= 0) && ((dai) = rtd->cpu_dais[i]);)
-
 #define for_each_rtd_cpu_dais(rtd, i, dai)				\
 	for ((i) = 0;							\
 	     ((i) < rtd->num_cpus) && ((dai) = rtd->cpu_dais[i]);	\
-- 
2.20.1

