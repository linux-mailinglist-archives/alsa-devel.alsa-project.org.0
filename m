Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CEE8216B
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34C9416A8;
	Mon,  5 Aug 2019 18:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34C9416A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565021614;
	bh=t5NZa2jBFTNmUbIgx6z7OmemUwBPLnWQD35oPjq2k9M=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gmGV6Vy40J623IQzbui2w4X5Vti0T0tbTBIoFkDB1hbMY+S9KHRnw+E8mCQWEKvCv
	 NojHyqnEwx8mw5bqIDRExUgNiPziCwF/0HK8/PGNCDPL4theeQxC3n9ip1S0GsVvqq
	 cb5AnWnQ3BjcJz/qlVBdNKuuQcUReQ2nuAV1O8gA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE103F8011B;
	Mon,  5 Aug 2019 18:10:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4058F80638; Mon,  5 Aug 2019 18:10:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AA78F80534
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AA78F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JN83gq5c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DFw+2h2ZmmlAkXtZbcj5vePFxc2t1K96bv1zUwYOM7o=; b=JN83gq5cgCgz
 cscIrmfj9DRFNKBUN3ZGc76K2yo+8d0xceU4ygLW4USiHDjCOqG8YJ3UzMguIOUZ1Xv+o+VSCZwu7
 PTm3qMVv0Eev7fuVmtGqkGzRRD5poCERchGUErhiePHjIO6idaXB85xnYC9Wxd6DvknutVQOs49k2
 wJTWY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYb-0000kR-JQ; Mon, 05 Aug 2019 16:09:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1E8742742E44; Mon,  5 Aug 2019 17:09:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r26d4d0f.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805160957.1E8742742E44@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:57 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_pcm_component_ioctrl()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_pcm_component_ioctrl()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 96a47908d8769479f5217bf3f432ccdc06a29747 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:51:51 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_pcm_component_ioctrl()

Current ALSA SoC is directly using component->driver->ops->xxx,
thus, the code nested deeply, and it makes code difficult to read,
and is not good for encapsulation.

We want to implement component related function at soc-component.c,
but, some of them need to care whole snd_soc_pcm_runtime (= rtd)
connected component.

Let's call component related function which need to care with
for_each_rtdcom() loop as snd_soc_pcm_component_xxx().
This patch adds new snd_soc_pcm_component_ioctrl() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r26d4d0f.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  2 ++
 sound/soc/soc-component.c     | 20 ++++++++++++++++++++
 sound/soc/soc-pcm.c           | 25 ++-----------------------
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 38b4be1d99f5..5db4e5d028d0 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -372,5 +372,7 @@ int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 					const char **dai_name);
 
 int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream);
+int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
+				unsigned int cmd, void *arg);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e2053c8bf1f0..a6c0857a9e90 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -442,3 +442,23 @@ int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
 
 	return 0;
 }
+
+int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
+				unsigned int cmd, void *arg)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component;
+	struct snd_soc_rtdcom_list *rtdcom;
+
+	for_each_rtdcom(rtd, rtdcom) {
+		component = rtdcom->component;
+
+		/* FIXME: use 1st ioctl */
+		if (component->driver->ops &&
+		    component->driver->ops->ioctl)
+			return component->driver->ops->ioctl(substream,
+							     cmd, arg);
+	}
+
+	return snd_pcm_lib_ioctl(substream, cmd, arg);
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 020e1d275076..12377b8d41c2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2453,27 +2453,6 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int soc_pcm_ioctl(struct snd_pcm_substream *substream,
-		     unsigned int cmd, void *arg)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		if (!component->driver->ops ||
-		    !component->driver->ops->ioctl)
-			continue;
-
-		/* FIXME: use 1st ioctl */
-		return component->driver->ops->ioctl(substream, cmd, arg);
-	}
-
-	return snd_pcm_lib_ioctl(substream, cmd, arg);
-}
-
 static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_pcm_substream *substream =
@@ -3013,7 +2992,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		rtd->ops.hw_free	= dpcm_fe_dai_hw_free;
 		rtd->ops.close		= dpcm_fe_dai_close;
 		rtd->ops.pointer	= soc_pcm_pointer;
-		rtd->ops.ioctl		= soc_pcm_ioctl;
+		rtd->ops.ioctl		= snd_soc_pcm_component_ioctl;
 	} else {
 		rtd->ops.open		= soc_pcm_open;
 		rtd->ops.hw_params	= soc_pcm_hw_params;
@@ -3022,7 +3001,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		rtd->ops.hw_free	= soc_pcm_hw_free;
 		rtd->ops.close		= soc_pcm_close;
 		rtd->ops.pointer	= soc_pcm_pointer;
-		rtd->ops.ioctl		= soc_pcm_ioctl;
+		rtd->ops.ioctl		= snd_soc_pcm_component_ioctl;
 	}
 
 	for_each_rtdcom(rtd, rtdcom) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
