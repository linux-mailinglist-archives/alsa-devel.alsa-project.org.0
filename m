Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98B45A12
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 12:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 890851879;
	Fri, 14 Jun 2019 12:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 890851879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560507061;
	bh=vZVKfCQTERsJ6nsiGluMR3rSC/JGXVcW7qwr4Xb24JQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qX3bRJOLZGco8bf16ohGl0ZY+R5XDtqrSoU8B8nUizPyl6TsdbRK9tciy2RPMS0m2
	 ErhXey7SSPSwGCtx39BLOC04CZEk0CpntfhSx2krLpYAX/6dj3LBlsAqO3QWgC3FfU
	 Wei3+xbZ8todlorYw/u9BHZDFil9FmJPIzd21dGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64044F89735;
	Fri, 14 Jun 2019 12:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9439AF89719; Fri, 14 Jun 2019 12:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 053BDF896CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 053BDF896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="auCqgzYg"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 636532175B;
 Fri, 14 Jun 2019 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560505701;
 bh=HiNzyg8VDQXd60h0vp/Ui1GLxtsvSr+hsmK43UdS4WI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=auCqgzYgEEeDKO03kQ8mc2k+AqnuEbsO9iGnng84v71eR3X7B6SIihzKHAzqebThx
 7vP7HMepKA+dKPyaT8dHDSTrJcNdoHIn/tkSXlwgz4u+JDzQquw2avEZkus7XIDsQH
 vh6ENfMGKc+JZY/skihgHb6yuBiacMOf1q5Db3sI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Fri, 14 Jun 2019 11:47:56 +0200
Message-Id: <20190614094756.2965-5-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614094756.2965-1-gregkh@linuxfoundation.org>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH 5/5] sound: soc: core: no need to check return
	value of debugfs_create functions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Also, there is no need to store the individual debugfs file name, just
remove the whole directory all at once, saving a local variable.

Note, the soc-pcm "state" file has now moved to a subdirectory, as it is
only a good idea to save the dentries for debugfs directories, not
individual files, as the individual file debugfs functions are changing
to not return a dentry.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/sound/soc.h  |  1 -
 sound/soc/soc-core.c | 31 ++++++-------------------------
 sound/soc/soc-dapm.c | 26 ++++----------------------
 sound/soc/soc-pcm.c  | 14 ++++----------
 4 files changed, 14 insertions(+), 58 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 482b4ea87c3c..4acd8f6bf460 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1177,7 +1177,6 @@ struct snd_soc_card {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_card_root;
-	struct dentry *debugfs_pop_time;
 #endif
 	u32 pop_time;
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2403bec2fccf..8d047e0a3e74 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -207,23 +207,11 @@ DEFINE_SHOW_ATTRIBUTE(component_list);
 
 static void soc_init_card_debugfs(struct snd_soc_card *card)
 {
-	if (!snd_soc_debugfs_root)
-		return;
-
 	card->debugfs_card_root = debugfs_create_dir(card->name,
 						     snd_soc_debugfs_root);
-	if (!card->debugfs_card_root) {
-		dev_warn(card->dev,
-			 "ASoC: Failed to create card debugfs directory\n");
-		return;
-	}
 
-	card->debugfs_pop_time = debugfs_create_u32("dapm_pop_time", 0644,
-						    card->debugfs_card_root,
-						    &card->pop_time);
-	if (!card->debugfs_pop_time)
-		dev_warn(card->dev,
-			 "ASoC: Failed to create pop time debugfs file\n");
+	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
+			   &card->pop_time);
 }
 
 static void soc_cleanup_card_debugfs(struct snd_soc_card *card)
@@ -234,19 +222,12 @@ static void soc_cleanup_card_debugfs(struct snd_soc_card *card)
 static void snd_soc_debugfs_init(void)
 {
 	snd_soc_debugfs_root = debugfs_create_dir("asoc", NULL);
-	if (IS_ERR_OR_NULL(snd_soc_debugfs_root)) {
-		pr_warn("ASoC: Failed to create debugfs directory\n");
-		snd_soc_debugfs_root = NULL;
-		return;
-	}
 
-	if (!debugfs_create_file("dais", 0444, snd_soc_debugfs_root, NULL,
-				 &dai_list_fops))
-		pr_warn("ASoC: Failed to create DAI list debugfs file\n");
+	debugfs_create_file("dais", 0444, snd_soc_debugfs_root, NULL,
+			    &dai_list_fops);
 
-	if (!debugfs_create_file("components", 0444, snd_soc_debugfs_root, NULL,
-				 &component_list_fops))
-		pr_warn("ASoC: Failed to create component list debugfs file\n");
+	debugfs_create_file("components", 0444, snd_soc_debugfs_root, NULL,
+			    &component_list_fops);
 }
 
 static void snd_soc_debugfs_exit(void)
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 81a7a12196ff..bc43060e8a70 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2153,42 +2153,24 @@ static const struct file_operations dapm_bias_fops = {
 void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
 	struct dentry *parent)
 {
-	struct dentry *d;
-
 	if (!parent)
 		return;
 
 	dapm->debugfs_dapm = debugfs_create_dir("dapm", parent);
 
-	if (!dapm->debugfs_dapm) {
-		dev_warn(dapm->dev,
-		       "ASoC: Failed to create DAPM debugfs directory\n");
-		return;
-	}
-
-	d = debugfs_create_file("bias_level", 0444,
-				dapm->debugfs_dapm, dapm,
-				&dapm_bias_fops);
-	if (!d)
-		dev_warn(dapm->dev,
-			 "ASoC: Failed to create bias level debugfs file\n");
+	debugfs_create_file("bias_level", 0444, dapm->debugfs_dapm, dapm,
+			    &dapm_bias_fops);
 }
 
 static void dapm_debugfs_add_widget(struct snd_soc_dapm_widget *w)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct dentry *d;
 
 	if (!dapm->debugfs_dapm || !w->name)
 		return;
 
-	d = debugfs_create_file(w->name, 0444,
-				dapm->debugfs_dapm, w,
-				&dapm_widget_power_fops);
-	if (!d)
-		dev_warn(w->dapm->dev,
-			"ASoC: Failed to create %s debugfs file\n",
-			w->name);
+	debugfs_create_file(w->name, 0444, dapm->debugfs_dapm, w,
+			    &dapm_widget_power_fops);
 }
 
 static void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 0a4f60c7a188..00ab01377909 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1258,9 +1258,9 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 			stream ? "<-" : "->", be->dai_link->name);
 
 #ifdef CONFIG_DEBUG_FS
-	if (fe->debugfs_dpcm_root)
-		dpcm->debugfs_state = debugfs_create_u32(be->dai_link->name, 0644,
-				fe->debugfs_dpcm_root, &dpcm->state);
+	dpcm->debugfs_state = debugfs_create_dir(be->dai_link->name,
+						 fe->debugfs_dpcm_root);
+	debugfs_create_u32("state", 0644, dpcm->debugfs_state, &dpcm->state);
 #endif
 	return 1;
 }
@@ -1315,7 +1315,7 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 		dpcm_be_reparent(fe, dpcm->be, stream);
 
 #ifdef CONFIG_DEBUG_FS
-		debugfs_remove(dpcm->debugfs_state);
+		debugfs_remove_recursive(dpcm->debugfs_state);
 #endif
 		spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 		list_del(&dpcm->list_be);
@@ -3449,12 +3449,6 @@ void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
 
 	rtd->debugfs_dpcm_root = debugfs_create_dir(rtd->dai_link->name,
 			rtd->card->debugfs_card_root);
-	if (!rtd->debugfs_dpcm_root) {
-		dev_dbg(rtd->dev,
-			 "ASoC: Failed to create dpcm debugfs directory %s\n",
-			 rtd->dai_link->name);
-		return;
-	}
 
 	debugfs_create_file("state", 0444, rtd->debugfs_dpcm_root,
 			    rtd, &dpcm_state_fops);
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
