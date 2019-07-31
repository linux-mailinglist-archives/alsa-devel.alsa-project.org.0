Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47B7C32D
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 15:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E11CA16EF;
	Wed, 31 Jul 2019 15:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E11CA16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564579206;
	bh=WDop31rgFUJO+Cps4QE7oKjej/jzn7Xtl+cswe/qpJA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/HbOBWT2rCe9Jugk+7gZxYenr1CSJp3TJPuvBMhcilK8W486LSevXFonisCbXHFT
	 mBPajHKoM980XDDfIyUWrWlF+eqxBsz7bwm4celIATzqlDM0oXpaXe8r0yjMJh93mx
	 OI5krP3tLRnTKDjEOINjrqxsfhGj3pj6mbig88O8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53F67F80508;
	Wed, 31 Jul 2019 15:17:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8A81F8049A; Wed, 31 Jul 2019 15:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BFFCF8048D
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 15:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BFFCF8048D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m/ZF9x1Q"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D42D1208C3;
 Wed, 31 Jul 2019 13:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564579055;
 bh=2N0684HTv95KKehklVxHq6DXS/I8WDSxRdv2AOlq4D4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m/ZF9x1QBM+357qoGsgHV4h1NrNBK61dejrM8gXIaLR8Di+ACpJYhdhQ9PsH0R48G
 QzaC+dtY/QXTmVFc80dNuiOvMZk7iS0tlYvsB0GB0Zzw7BSbyS3va35/iyul5Zlaz1
 sMdMYUxXZdkA+xL3O1QaA3ZY4u7NFE84aiqJdKTE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Date: Wed, 31 Jul 2019 15:17:15 +0200
Message-Id: <20190731131716.9764-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731131716.9764-1-gregkh@linuxfoundation.org>
References: <20190731131716.9764-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH v2 2/3] ASoC: core: no need to check return
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
v2: rebase on 5.3-rc1
    change Subject line to match the subsystem better
    rework based on debugfs core now reporting errors.

 include/sound/soc.h  |  1 -
 sound/soc/soc-core.c | 43 ++++++-------------------------------------
 sound/soc/soc-dapm.c | 30 ++++--------------------------
 sound/soc/soc-pcm.c  | 14 ++++----------
 4 files changed, 14 insertions(+), 74 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 4e8071269639..084d6d2268c6 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1224,7 +1224,6 @@ struct snd_soc_card {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_card_root;
-	struct dentry *debugfs_pop_time;
 #endif
 	u32 pop_time;
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index fd6eaae6c0ed..d0d916537818 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -165,13 +165,6 @@ static void soc_init_component_debugfs(struct snd_soc_component *component)
 				component->card->debugfs_card_root);
 	}
 
-	if (IS_ERR(component->debugfs_root)) {
-		dev_warn(component->dev,
-			"ASoC: Failed to create component debugfs directory: %ld\n",
-			PTR_ERR(component->debugfs_root));
-		return;
-	}
-
 	snd_soc_dapm_debugfs_init(snd_soc_component_get_dapm(component),
 		component->debugfs_root);
 }
@@ -215,32 +208,15 @@ DEFINE_SHOW_ATTRIBUTE(component_list);
 
 static void soc_init_card_debugfs(struct snd_soc_card *card)
 {
-	if (!snd_soc_debugfs_root)
-		return;
-
 	card->debugfs_card_root = debugfs_create_dir(card->name,
 						     snd_soc_debugfs_root);
-	if (IS_ERR(card->debugfs_card_root)) {
-		dev_warn(card->dev,
-			 "ASoC: Failed to create card debugfs directory: %ld\n",
-			 PTR_ERR(card->debugfs_card_root));
-		card->debugfs_card_root = NULL;
-		return;
-	}
 
-	card->debugfs_pop_time = debugfs_create_u32("dapm_pop_time", 0644,
-						    card->debugfs_card_root,
-						    &card->pop_time);
-	if (IS_ERR(card->debugfs_pop_time))
-		dev_warn(card->dev,
-			 "ASoC: Failed to create pop time debugfs file: %ld\n",
-			 PTR_ERR(card->debugfs_pop_time));
+	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
+			   &card->pop_time);
 }
 
 static void soc_cleanup_card_debugfs(struct snd_soc_card *card)
 {
-	if (!card->debugfs_card_root)
-		return;
 	debugfs_remove_recursive(card->debugfs_card_root);
 	card->debugfs_card_root = NULL;
 }
@@ -248,19 +224,12 @@ static void soc_cleanup_card_debugfs(struct snd_soc_card *card)
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
index f013b24c050a..1ec017aab829 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2154,50 +2154,28 @@ static const struct file_operations dapm_bias_fops = {
 void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
 	struct dentry *parent)
 {
-	struct dentry *d;
-
 	if (!parent || IS_ERR(parent))
 		return;
 
 	dapm->debugfs_dapm = debugfs_create_dir("dapm", parent);
 
-	if (IS_ERR(dapm->debugfs_dapm)) {
-		dev_warn(dapm->dev,
-			 "ASoC: Failed to create DAPM debugfs directory %ld\n",
-			 PTR_ERR(dapm->debugfs_dapm));
-		return;
-	}
-
-	d = debugfs_create_file("bias_level", 0444,
-				dapm->debugfs_dapm, dapm,
-				&dapm_bias_fops);
-	if (IS_ERR(d))
-		dev_warn(dapm->dev,
-			 "ASoC: Failed to create bias level debugfs file: %ld\n",
-			 PTR_ERR(d));
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
-	if (IS_ERR(d))
-		dev_warn(w->dapm->dev,
-			 "ASoC: Failed to create %s debugfs file: %ld\n",
-			 w->name, PTR_ERR(d));
+	debugfs_create_file(w->name, 0444, dapm->debugfs_dapm, w,
+			    &dapm_widget_power_fops);
 }
 
 static void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
 {
-	if (!dapm->debugfs_dapm)
-		return;
 	debugfs_remove_recursive(dapm->debugfs_dapm);
 	dapm->debugfs_dapm = NULL;
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 4878d22ebd8c..493429a90453 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1274,9 +1274,9 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
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
@@ -1331,7 +1331,7 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 		dpcm_be_reparent(fe, dpcm->be, stream);
 
 #ifdef CONFIG_DEBUG_FS
-		debugfs_remove(dpcm->debugfs_state);
+		debugfs_remove_recursive(dpcm->debugfs_state);
 #endif
 		spin_lock_irqsave(&fe->card->dpcm_lock, flags);
 		list_del(&dpcm->list_be);
@@ -3466,12 +3466,6 @@ void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
 
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
