Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A8E112B36
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 13:18:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E15A82C;
	Wed,  4 Dec 2019 13:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E15A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575461888;
	bh=vgltc1pD6NlEwLhzRRvi16uPqYskYrG2aQR4nXT4pEo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JyGQPK/BnJxctME1DRumWUu678WczNBdGviXs1/drnrfrgnred2K5lDj3CNQxlo8u
	 exPyVSYdJhNg2YRIWCt2HT7SQnu3hAsV+2ro2eJgKuE2lTxnsIbe+QptJBPN4nHkoE
	 mQhlLHr4GwaIOlnOfQPrZwN/Fu2waaaOMyplc8tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37AB9F80234;
	Wed,  4 Dec 2019 13:15:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41219F800B4; Wed,  4 Dec 2019 13:15:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB621F800B4
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 13:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB621F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XW15VeP4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=KZy//0s5KGIpmo+DJWE4E9+X7U0v6D0G0qtVA+bVmFE=; b=XW15VeP4M8jD
 chy8AG60aUb3kK663dqLOFJrP9R14BDCczBQJ9dvXD6G9G7Ek78H7j27sGOvRSaGsim6SsOMynALf
 EDiRD22aA81xAaTk5plTAx2G6dkz49vDxC+l/9Maz48wG+oQdewo9qJI0SF/Fs29SXuKsV0ca9f/l
 fDQKc=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1icTZ5-0000AG-Qm; Wed, 04 Dec 2019 12:15:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 1D9F1D003B4; Wed,  4 Dec 2019 12:15:31 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20191203173007.46504-1-cujomalainey@chromium.org>
Message-Id: <applied-20191203173007.46504-1-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Date: Wed,  4 Dec 2019 12:15:31 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: core: Init pcm runtime work early to
	avoid warnings" to the asoc tree
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

   ASoC: core: Init pcm runtime work early to avoid warnings

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

From 4bf2e385aa59c2fae5f880aa25cfd2b470109093 Mon Sep 17 00:00:00 2001
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Tue, 3 Dec 2019 09:30:07 -0800
Subject: [PATCH] ASoC: core: Init pcm runtime work early to avoid warnings

There are cases where we fail before we reach soc_new_pcm which would
init the workqueue. When we fail we attempt to flush the queue which
generates warnings from the workqueue subsystem when we have not inited
the queue. Solution is to use a proxy function to get around this issue.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191203173007.46504-1-cujomalainey@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h      |  1 +
 sound/soc/soc-compress.c |  6 ++----
 sound/soc/soc-core.c     | 10 ++++++++++
 sound/soc/soc-pcm.c      | 11 ++++-------
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index c28a1ed5e8df..262896799826 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1150,6 +1150,7 @@ struct snd_soc_pcm_runtime {
 	unsigned int num_codecs;
 
 	struct delayed_work delayed_work;
+	void (*close_delayed_work_func)(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_dpcm_root;
 #endif
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 61f230324164..6615ef64c7f5 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -214,10 +214,8 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
  * This is to ensure there are no pops or clicks in between any music tracks
  * due to DAPM power cycling.
  */
-static void close_delayed_work(struct work_struct *work)
+static void close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_pcm_runtime *rtd =
-			container_of(work, struct snd_soc_pcm_runtime, delayed_work.work);
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -929,7 +927,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	}
 
 	/* DAPM dai link stream work */
-	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
+	rtd->close_delayed_work_func = close_delayed_work;
 
 	rtd->compr = compr;
 	compr->private_data = rtd;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 062653ab03a3..0e2e628302f1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -435,6 +435,15 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 	device_unregister(rtd->dev);
 }
 
+static void close_delayed_work(struct work_struct *work) {
+	struct snd_soc_pcm_runtime *rtd =
+			container_of(work, struct snd_soc_pcm_runtime,
+				     delayed_work.work);
+
+	if (rtd->close_delayed_work_func)
+		rtd->close_delayed_work_func(rtd);
+}
+
 static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
@@ -470,6 +479,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 
 	rtd->dev = dev;
 	dev_set_drvdata(dev, rtd);
+	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
 
 	/*
 	 * for rtd->codec_dais
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 01eb8700c3de..b78f6ff2b1d3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -637,10 +637,8 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
  * This is to ensure there are no pops or clicks in between any music tracks
  * due to DAPM power cycling.
  */
-static void close_delayed_work(struct work_struct *work)
+static void close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_pcm_runtime *rtd =
-			container_of(work, struct snd_soc_pcm_runtime, delayed_work.work);
 	struct snd_soc_dai *codec_dai = rtd->codec_dais[0];
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -660,7 +658,7 @@ static void close_delayed_work(struct work_struct *work)
 	mutex_unlock(&rtd->card->pcm_mutex);
 }
 
-static void codec2codec_close_delayed_work(struct work_struct *work)
+static void codec2codec_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
 	/*
 	 * Currently nothing to do for c2c links
@@ -2974,10 +2972,9 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 
 	/* DAPM dai link stream work */
 	if (rtd->dai_link->params)
-		INIT_DELAYED_WORK(&rtd->delayed_work,
-				  codec2codec_close_delayed_work);
+		rtd->close_delayed_work_func = codec2codec_close_delayed_work;
 	else
-		INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
+		rtd->close_delayed_work_func = close_delayed_work;
 
 	pcm->nonatomic = rtd->dai_link->nonatomic;
 	rtd->pcm = pcm;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
