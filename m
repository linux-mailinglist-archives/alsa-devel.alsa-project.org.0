Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB916B3D3
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 23:24:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C46081679;
	Mon, 24 Feb 2020 23:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C46081679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582583045;
	bh=tOjU5RfuWWI7RWXSn/OJDBrhls3HSVlU7T5QEdR4Zgs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tQjD3I+zpF0QeO443mA4+DqkcLt1bW6ExrA/LZAiI/Jhdxs90fExgpdi+KhxJcOz0
	 ZPuoR3UygyH95iITezt2iv/8ICoHS2A5S6DmXSOegWQNV4ehY2NX7fU8/RaC6SWkkn
	 XE2NsDYyihTsQZ/TN8NhS7nb+wZGQbRX9qo4SDbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7486F80216;
	Mon, 24 Feb 2020 23:21:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82268F80213; Mon, 24 Feb 2020 23:21:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C770CF80137
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 23:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C770CF80137
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3481331B;
 Mon, 24 Feb 2020 14:21:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A87383F534;
 Mon, 24 Feb 2020 14:21:37 -0800 (PST)
Date: Mon, 24 Feb 2020 22:21:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: add dpcm_create/remove_debugfs_state()" to
 the asoc tree
In-Reply-To: <877e0jjc9b.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-877e0jjc9b.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: soc-pcm: add dpcm_create/remove_debugfs_state()

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

From 154dae87e73faa6d56265f22cae16dcdcea3dbb0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Feb 2020 15:57:06 +0900
Subject: [PATCH] ASoC: soc-pcm: add dpcm_create/remove_debugfs_state()

soc-pcm.c has implementation which depends on CONFIG_DEBUG_FS.
But, we don't want to have random #ifdef.
This patch adds dpcm_create/remove_debugfs_state() and care it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/877e0jjc9b.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 51 ++++++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index fc98ab87fa45..c5cfd88720c2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -164,6 +164,36 @@ void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
 	debugfs_create_file("state", 0444, rtd->debugfs_dpcm_root,
 			    rtd, &dpcm_state_fops);
 }
+
+static void dpcm_create_debugfs_state(struct snd_soc_dpcm *dpcm, int stream)
+{
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%s:%s", dpcm->be->dai_link->name,
+			 stream ? "capture" : "playback");
+	if (name) {
+		dpcm->debugfs_state = debugfs_create_dir(
+			name, dpcm->fe->debugfs_dpcm_root);
+		debugfs_create_u32("state", 0644, dpcm->debugfs_state,
+				   &dpcm->state);
+		kfree(name);
+	}
+}
+
+static void dpcm_remove_debugfs_state(struct snd_soc_dpcm *dpcm)
+{
+	debugfs_remove_recursive(dpcm->debugfs_state);
+}
+
+#else
+static inline void dpcm_create_debugfs_state(struct snd_soc_dpcm *dpcm,
+					     int stream)
+{
+}
+
+static inline void dpcm_remove_debugfs_state(struct snd_soc_dpcm *dpcm)
+{
+}
 #endif
 
 static int soc_rtd_startup(struct snd_soc_pcm_runtime *rtd,
@@ -1254,9 +1284,6 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 {
 	struct snd_soc_dpcm *dpcm;
 	unsigned long flags;
-#ifdef CONFIG_DEBUG_FS
-	char *name;
-#endif
 
 	/* only add new dpcms */
 	for_each_dpcm_be(fe, stream, dpcm) {
@@ -1281,17 +1308,8 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 			stream ? "capture" : "playback",  fe->dai_link->name,
 			stream ? "<-" : "->", be->dai_link->name);
 
-#ifdef CONFIG_DEBUG_FS
-	name = kasprintf(GFP_KERNEL, "%s:%s", be->dai_link->name,
-			 stream ? "capture" : "playback");
-	if (name) {
-		dpcm->debugfs_state = debugfs_create_dir(name,
-							 fe->debugfs_dpcm_root);
-		debugfs_create_u32("state", 0644, dpcm->debugfs_state,
-				   &dpcm->state);
-		kfree(name);
-	}
-#endif
+	dpcm_create_debugfs_state(dpcm, stream);
+
 	return 1;
 }
 
@@ -1344,9 +1362,8 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 		/* BEs still alive need new FE */
 		dpcm_be_reparent(fe, dpcm->be, stream);
 
-#ifdef CONFIG_DEBUG_FS
-		debugfs_remove_recursive(dpcm->debugfs_state);
-#endif
+		dpcm_remove_debugfs_state(dpcm);
+
 		spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 		list_del(&dpcm->list_be);
 		list_del(&dpcm->list_fe);
-- 
2.20.1

