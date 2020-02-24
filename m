Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB52416B3D8
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 23:25:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF801679;
	Mon, 24 Feb 2020 23:24:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF801679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582583105;
	bh=ZqQfiDANLZxNXKb1ITClCK7AN6NuFr/iL6WSOW77ALs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gq0X02iGQWdh4QJaJk8gcCWzJHDPRDdcor1OA0GNHnuNxFIewSViRNOX74LN/2TK2
	 EIcd4zu0R4Tk5XA/vvjfa4hfy0SQwFyg+yGizzlHNttMWD47mR4TqNexIxkSX1FkTr
	 K/lMeFZafxX4l7R+pGLVxC0v5zwG6HOSb6eVtMFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E871EF8029A;
	Mon, 24 Feb 2020 23:21:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D5DAF80299; Mon, 24 Feb 2020 23:21:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6B686F8028A
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 23:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B686F8028A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2655231B;
 Mon, 24 Feb 2020 14:21:47 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EFD03F534;
 Mon, 24 Feb 2020 14:21:46 -0800 (PST)
Date: Mon, 24 Feb 2020 22:21:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: move dpcm_path_put() to soc-pcm.c" to the
 asoc tree
In-Reply-To: <87a75fjc9q.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87a75fjc9q.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: soc-pcm: move dpcm_path_put() to soc-pcm.c

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

From 52645e332d227a3d3cd345e97a10d99b7e80fae4 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Feb 2020 15:56:52 +0900
Subject: [PATCH] ASoC: soc-pcm: move dpcm_path_put() to soc-pcm.c

dpcm_path_put() (A) is calling kfree(*list).
The freed list is created by dapm_widget_list_create() (B) which is called
from snd_soc_dapm_dai_get_connected_widgets() (C) which is called from
dpcm_path_get() (D).

(B)	dapm_widget_list_create(**list, ...)
	{
		...
=>		*list = kzalloc();
		...
	}

(C)	snd_soc_dapm_dai_get_connected_widgets(..., **list, ...)
	{
		...
		dapm_widget_list_create(list, ...);
		...
	}

(D)	dpcm_path_get(..., **list)
	{
		...
		snd_soc_dapm_dai_get_connected_widgets(..., list, ...);
		...
	}

(A)	dpcm_path_put(**list)
	{
=>		kfree(*list);
	}

This kind of unbalance code is very difficult to read/understand.
To avoid this issue, this patch adds each missing paired function
dapm_widget_list_free()         for dapm_widget_list_create() (B), and
snd_soc_dapm_dai_free_widgets() for snd_soc_dapm_dai_get_connected_widgets() (C).

This patch uses these, and moves dpcm_path_put() next to dpcm_path_get().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87a75fjc9q.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dapm.h |  1 +
 include/sound/soc-dpcm.h |  7 +------
 sound/soc/soc-dapm.c     | 10 ++++++++++
 sound/soc/soc-pcm.c      |  5 +++++
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 9439e75945f6..464b20acd720 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -484,6 +484,7 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	struct snd_soc_dapm_widget_list **list,
 	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *,
 				      enum snd_soc_dapm_direction));
+void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
 
 struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(
 	struct snd_kcontrol *kcontrol);
diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 3e7819d2a6aa..40223577ec4a 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -145,6 +145,7 @@ static inline void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
 
 int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	int stream, struct snd_soc_dapm_widget_list **list_);
+void dpcm_path_put(struct snd_soc_dapm_widget_list **list);
 int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
 	int stream, struct snd_soc_dapm_widget_list **list, int new);
 int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream);
@@ -158,10 +159,4 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream);
 int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 	int event);
 
-static inline void dpcm_path_put(struct snd_soc_dapm_widget_list **list)
-{
-	kfree(*list);
-}
-
-
 #endif
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f2e678865480..8a7d700a0fda 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1105,6 +1105,11 @@ static int snd_soc_dapm_suspend_check(struct snd_soc_dapm_widget *widget)
 	}
 }
 
+static void dapm_widget_list_free(struct snd_soc_dapm_widget_list **list)
+{
+	kfree(*list);
+}
+
 static int dapm_widget_list_create(struct snd_soc_dapm_widget_list **list,
 	struct list_head *widgets)
 {
@@ -1310,6 +1315,11 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	return paths;
 }
 
+void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list)
+{
+	dapm_widget_list_free(list);
+}
+
 /*
  * Handler for regulator supply widget.
  */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1bf2db1732bf..3b3b32923783 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1302,6 +1302,11 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	return paths;
 }
 
+void dpcm_path_put(struct snd_soc_dapm_widget_list **list)
+{
+	snd_soc_dapm_dai_free_widgets(list);
+}
+
 static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dapm_widget_list **list_)
 {
-- 
2.20.1

