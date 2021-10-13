Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9742C362
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 16:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB7FB168C;
	Wed, 13 Oct 2021 16:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB7FB168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634135658;
	bh=u/f5LqXKf8fsODTd94e2w2HM1b7IhhX57r3wHnTyNDU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1rF3fDuD5IKXZqokbAgcCq3TY0MlJB6Hrbp2C3IdNl6FUFSW98cjeJfp8zVe563C
	 q0jqm5IKOVDSkq0SZQ1rUHlKHQwPERW+sdD8loAJhbNDR1waAbaEK8hbtVIizOhs3p
	 uJX/r/aJIPot4qTQnlLHkMoV6Tw28h+flEHhARXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FBBEF80515;
	Wed, 13 Oct 2021 16:31:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7D14F804FF; Wed, 13 Oct 2021 16:31:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92658F8025B
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 16:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92658F8025B
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="313639534"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="313639534"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524649514"
Received: from ssafavib-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.164.198])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH v3 04/13] ASoC: soc-pcm: introduce
 snd_soc_dpcm_fe_lock_irq/unlock_irq()
Date: Wed, 13 Oct 2021 09:30:41 -0500
Message-Id: <20211013143050.244444-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

In preparation for more changes, add two new helpers to gradually
modify the DPCM locks.

Since DPCM functions are not used from interrupt handlers, we can only
use the lock_irq case.

While most of the uses of DPCM are internal to soc-pcm.c, some drivers
in soc/fsl and soc/sh do make use of DPCM-related loops that will
require protection, adding EXPORT_SYMBOL_GPL() is needed for those
drivers.

The stream argument is unused in this patch but will be enabled in
follow-up patches.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-dpcm.h |  3 +++
 sound/soc/soc-pcm.c      | 42 +++++++++++++++++++++++-----------------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 9c00118603e7..8ed40b8f3da8 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -151,4 +151,7 @@ bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget, enum snd_soc_dapm_d
 #define dpcm_be_dai_startup_unwind(fe, stream)	dpcm_be_dai_stop(fe, stream, 0, NULL)
 #define dpcm_be_dai_shutdown(fe, stream)	dpcm_be_dai_stop(fe, stream, 1, NULL)
 
+void snd_soc_dpcm_fe_lock_irq(struct snd_soc_pcm_runtime *fe, int stream);
+void snd_soc_dpcm_fe_unlock_irq(struct snd_soc_pcm_runtime *fe, int stream);
+
 #endif
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 19539300d94d..52851827d53f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -29,6 +29,18 @@
 
 #define DPCM_MAX_BE_USERS	8
 
+void snd_soc_dpcm_fe_lock_irq(struct snd_soc_pcm_runtime *fe, int stream)
+{
+	spin_lock_irq(&fe->card->dpcm_lock);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_lock_irq);
+
+void snd_soc_dpcm_fe_unlock_irq(struct snd_soc_pcm_runtime *fe, int stream)
+{
+	spin_unlock_irq(&fe->card->dpcm_lock);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_unlock_irq);
+
 /* can this BE stop and free */
 static int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 					 struct snd_soc_pcm_runtime *be, int stream);
@@ -85,7 +97,6 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 	struct snd_pcm_hw_params *params = &fe->dpcm[stream].hw_params;
 	struct snd_soc_dpcm *dpcm;
 	ssize_t offset = 0;
-	unsigned long flags;
 
 	/* FE state */
 	offset += scnprintf(buf + offset, size - offset,
@@ -113,7 +124,7 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 		goto out;
 	}
 
-	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		params = &dpcm->hw_params;
@@ -134,7 +145,7 @@ static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 					   params_channels(params),
 					   params_rate(params));
 	}
-	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 out:
 	return offset;
 }
@@ -1141,7 +1152,6 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
 	struct snd_soc_dpcm *dpcm;
-	unsigned long flags;
 
 	/* only add new dpcms */
 	for_each_dpcm_be(fe, stream, dpcm) {
@@ -1157,10 +1167,10 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 	dpcm->fe = fe;
 	be->dpcm[stream].runtime = fe->dpcm[stream].runtime;
 	dpcm->state = SND_SOC_DPCM_LINK_STATE_NEW;
-	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	list_add(&dpcm->list_be, &fe->dpcm[stream].be_clients);
 	list_add(&dpcm->list_fe, &be->dpcm[stream].fe_clients);
-	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	dev_dbg(fe->dev, "connected new DPCM %s path %s %s %s\n",
 			stream ? "capture" : "playback",  fe->dai_link->name,
@@ -1203,7 +1213,6 @@ static void dpcm_be_reparent(struct snd_soc_pcm_runtime *fe,
 void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_dpcm *dpcm, *d;
-	unsigned long flags;
 
 	for_each_dpcm_be_safe(fe, stream, dpcm, d) {
 		dev_dbg(fe->dev, "ASoC: BE %s disconnect check for %s\n",
@@ -1222,10 +1231,10 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 
 		dpcm_remove_debugfs_state(dpcm);
 
-		spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+		snd_soc_dpcm_fe_lock_irq(fe, stream);
 		list_del(&dpcm->list_be);
 		list_del(&dpcm->list_fe);
-		spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+		snd_soc_dpcm_fe_unlock_irq(fe, stream);
 		kfree(dpcm);
 	}
 }
@@ -1451,12 +1460,11 @@ int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
 void dpcm_clear_pending_state(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_dpcm *dpcm;
-	unsigned long flags;
 
-	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm)
 		dpcm_set_be_update_state(dpcm->be, stream, SND_SOC_DPCM_UPDATE_NO);
-	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 }
 
 void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
@@ -2374,7 +2382,6 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	struct snd_soc_dpcm *dpcm;
 	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
 	int ret = 0;
-	unsigned long flags;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s open on FE %s\n",
 			stream ? "capture" : "playback", fe->dai_link->name);
@@ -2443,7 +2450,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	dpcm_be_dai_shutdown(fe, stream);
 disconnect:
 	/* disconnect any pending BEs */
-	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 
@@ -2455,7 +2462,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 			be->dpcm[stream].state == SND_SOC_DPCM_STATE_NEW)
 				dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
 	}
-	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	if (ret < 0)
 		dev_err(fe->dev, "ASoC: %s() failed (%d)\n", __func__, ret);
@@ -2855,10 +2862,9 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 	struct snd_soc_dpcm *dpcm;
 	int state;
 	int ret = 1;
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_fe(be, stream, dpcm) {
 
 		if (dpcm->fe == fe)
@@ -2872,7 +2878,7 @@ static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
 			}
 		}
 	}
-	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	/* it's safe to do this BE DAI */
 	return ret;
-- 
2.25.1

