Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C3427136
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 21:11:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD44168C;
	Fri,  8 Oct 2021 21:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD44168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633720265;
	bh=JHhn0kYUfjqV/oAGv2Rv1Yuf/tuCWtFqLNbr/B5ACno=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ad3Xv0s6iDXYRzqzsfUTn63YQ3Mhgq5wvdjlsFhYIzYJQYivnUDPgGNDtKTFgwXvW
	 kzccPiVaTXORRfkvhrlnjGLpyY337ru8lJrqkouTmh7C9zj7P/AqsBq4vVEoR0gjTL
	 +s9tnvssWaw30sx7Ko7vOO9nNwczC+hfvAPfoa+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2900F800F0;
	Fri,  8 Oct 2021 21:09:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B69CF800F0; Fri,  8 Oct 2021 21:09:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=NICE_REPLY_A,PRX_BODY_78,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAF39F800F0
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 21:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF39F800F0
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="213713810"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; 
 d="scan'208,223";a="213713810"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 12:09:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; 
 d="scan'208,223";a="440744915"
Received: from vgopala1-mobl.amr.corp.intel.com (HELO [10.212.34.202])
 ([10.212.34.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 12:09:30 -0700
Subject: Re: [RFC PATCH v2 0/5] ASoC: soc-pcm: fix trigger race conditions
 with shared BE
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
 <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
 <1efa1c31-7342-05f8-5f73-95e2462d4179@linux.intel.com>
 <3683cf39-632b-50df-c65d-63779c464850@nvidia.com>
 <11257d77-9975-3b00-94da-5dc1b5c95fc6@linux.intel.com>
 <s5hk0ip9js7.wl-tiwai@suse.de>
 <ff43fede-aa66-3cb7-6365-e1f279cd135f@linux.intel.com>
 <s5hzgrk98y9.wl-tiwai@suse.de>
 <80882fe6-ea30-43f6-8d83-8995dd28c748@linux.intel.com>
 <s5hwnmo96vh.wl-tiwai@suse.de>
 <60c6a90b-290d-368c-ce61-4d86e70eaa78@linux.intel.com>
 <s5hily88rri.wl-tiwai@suse.de>
 <75894aba-ca1a-51d6-df7d-ad53fcd89f79@linux.intel.com>
 <s5hee8w82ng.wl-tiwai@suse.de>
 <e9340874-320a-8fc6-f3a4-9cf77f85db25@linux.intel.com>
 <s5hczof7eoq.wl-tiwai@suse.de>
 <dcdb8f74-51db-86a1-959f-909dfac22b26@linux.intel.com>
Message-ID: <29397354-dc5b-7837-c71b-df4bde707df2@linux.intel.com>
Date: Fri, 8 Oct 2021 14:09:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dcdb8f74-51db-86a1-959f-909dfac22b26@linux.intel.com>
Content-Type: multipart/mixed; boundary="------------167B2BF01D3F949E954584C8"
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, vkoul@kernel.org, broonie@kernel.org,
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

This is a multi-part message in MIME format.
--------------167B2BF01D3F949E954584C8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


>> Basically we need to protect two things:
>> - The BE links
>> - The concurrent accesses to BEs
>> The former belongs to each FE that holds the links, and the FE stream
>> lock would cover.  The latter is rather a per-BE business.
>>
>> An oft-seen risk of multiple locks is deadlocking, but in this case,
>> as long as we keep the lock order FE->BE, nothing wrong can happen.
> 
> famous last words  "nothing wrong can happen." :-)
> 
> I already added a helper to do this FE lock, I can easily replace the
> implementation to remove the spin_lock and use the FE PCM lock.
> we might even add the lock in the definition of for_each_dpcm_be() to
> avoid misses.
> 
> Let me try this out today, thanks for the suggestions.

well, it's not successful at all...

When I replace the existing dpcm_lock with the FE PCM lock as you
suggested, without any additional changes, speaker-test produces valid
audio on the endpoints, but if I try a Ctrl-C or limit the number of
loops with the '-l' option, I hear an endless loop on the same buffer
and I have to power cycle my test device to stop the sound.

See 2 patches attached, the first patch with the introduction of the
helper works fine, the second with the use of the FE PCM lock doesn't.
In hindsight I am glad I worked on minimal patches, one after the other,
to identify problems.

And when I add the BE lock, then nothing happens. Device stuck and no
audio...

There must be something we're missing related to the locking...

My work version is at
https://github.com/plbossart/sound/tree/fix/dpcm-lock5 if anyone wants
to take a look.


--------------167B2BF01D3F949E954584C8
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-ASoC-soc-pcm-remove-dpcm-spin_lock-use-PCM-stream-lo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-ASoC-soc-pcm-remove-dpcm-spin_lock-use-PCM-stream-lo.pa";
 filename*1="tch"

From f0a7068b50057eb918821dbcda6d448f49f5f1c4 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 7 Oct 2021 15:35:23 -0500
Subject: [PATCH 2/2] ASoC: soc-pcm: remove dpcm spin_lock, use PCM stream lock

There is no need for a DPCM-specific lock at the card level, we can
use the FE-specific PCM lock instead. In addition, these PCM lock will
rely on either a spin-lock or a mutex depending on atomicity.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc.h  | 2 --
 sound/soc/soc-core.c | 1 -
 sound/soc/soc-pcm.c  | 4 ++--
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 8e6dd8a257c5..5872a8864f3b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -893,8 +893,6 @@ struct snd_soc_card {
 	struct mutex pcm_mutex;
 	enum snd_soc_pcm_subclass pcm_subclass;
 
-	spinlock_t dpcm_lock;
-
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c830e96afba2..51ef9917ca98 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2339,7 +2339,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->mutex);
 	mutex_init(&card->dapm_mutex);
 	mutex_init(&card->pcm_mutex);
-	spin_lock_init(&card->dpcm_lock);
 
 	return snd_soc_bind_card(card);
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 52851827d53f..c1dbd8633587 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -31,13 +31,13 @@
 
 void snd_soc_dpcm_fe_lock_irq(struct snd_soc_pcm_runtime *fe, int stream)
 {
-	spin_lock_irq(&fe->card->dpcm_lock);
+	snd_pcm_stream_lock_irq(snd_soc_dpcm_get_substream(fe, stream));
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_lock_irq);
 
 void snd_soc_dpcm_fe_unlock_irq(struct snd_soc_pcm_runtime *fe, int stream)
 {
-	spin_unlock_irq(&fe->card->dpcm_lock);
+	snd_pcm_stream_unlock_irq(snd_soc_dpcm_get_substream(fe, stream));
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_unlock_irq);
 
-- 
2.25.1


--------------167B2BF01D3F949E954584C8
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ASoC-soc-pcm-introduce-snd_soc_dpcm_fe_lock_irq-unlo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-ASoC-soc-pcm-introduce-snd_soc_dpcm_fe_lock_irq-unlo.pa";
 filename*1="tch"

From c35ccac18235f6f50e2d0e9fb6167612dcc753f7 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 29 Sep 2021 11:30:19 -0500
Subject: [PATCH 1/2] ASoC: soc-pcm: introduce
 snd_soc_dpcm_fe_lock_irq/unlock_irq()

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


--------------167B2BF01D3F949E954584C8--
