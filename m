Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F17A1387DF0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828111770;
	Tue, 18 May 2021 18:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828111770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621356880;
	bh=f1a5Y0NhI/zdy+tg/2vxDkVtP+D8PfDXmS2vQQfdFOU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=guQGNHoA8hCv6R5y024fEg6XUtGdNaX2Hk2aWz8O4Wd24wdvgIiG0Tm0R4mTpak7M
	 yc41AuwNEOgx/3zWXcyVJiRnlX2pwlq6h/fwy/pWSWqseaDMUC0ieZyVMpRLzCMJqw
	 sJSrrPs/fAKqh4yFePJyVPcqrHlBb0oykgedGY1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 093AFF80482;
	Tue, 18 May 2021 18:52:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1156BF80431; Tue, 18 May 2021 18:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224E3F80257
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224E3F80257
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8757FB1E2;
 Tue, 18 May 2021 16:52:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ALSA: Drop superfluous argument from snd_power_wait()
Date: Tue, 18 May 2021 18:52:01 +0200
Message-Id: <20210518165201.24376-8-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210518165201.24376-1-tiwai@suse.de>
References: <20210518165201.24376-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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

The power_state argument of snd_power_wait() is superfluous, receiving
only SNDRV_POWER_STATE_D0.  Let's drop it in all callers for
simplicity.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h        | 4 ++--
 sound/core/control.c        | 2 +-
 sound/core/control_compat.c | 2 +-
 sound/core/init.c           | 6 +-----
 sound/core/pcm_native.c     | 4 ++--
 sound/soc/soc-core.c        | 2 +-
 sound/usb/usx2y/us122l.c    | 2 +-
 7 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 430d775b3c0e..e1192a337582 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -177,13 +177,13 @@ static inline void snd_power_unref(struct snd_card *card)
 }
 
 /* init.c */
-int snd_power_wait(struct snd_card *card, unsigned int power_state);
+int snd_power_wait(struct snd_card *card);
 int snd_power_ref_and_wait(struct snd_card *card);
 void snd_power_sync_ref(struct snd_card *card);
 
 #else /* ! CONFIG_PM */
 
-static inline int snd_power_wait(struct snd_card *card, unsigned int state) { return 0; }
+static inline int snd_power_wait(struct snd_card *card) { return 0; }
 static inline void snd_power_ref(struct snd_card *card) {}
 static inline void snd_power_unref(struct snd_card *card) {}
 static inline int snd_power_ref_and_wait(struct snd_card *card) { return 0; }
diff --git a/sound/core/control.c b/sound/core/control.c
index 37f6f2ca0543..c145c6011878 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1774,7 +1774,7 @@ static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 	card = ctl->card;
 	if (snd_BUG_ON(!card))
 		return -ENXIO;
-	err = snd_power_wait(card, SNDRV_CTL_POWER_D0);
+	err = snd_power_wait(card);
 	if (err < 0)
 		return err;
 	switch (cmd) {
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index b9fe1ead435b..b4554ae21e33 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -432,7 +432,7 @@ static inline long snd_ctl_ioctl_compat(struct file *file, unsigned int cmd, uns
 	if (snd_BUG_ON(!ctl || !ctl->card))
 		return -ENXIO;
 
-	err = snd_power_wait(ctl->card, SNDRV_CTL_POWER_D0);
+	err = snd_power_wait(ctl->card);
 	if (err < 0)
 		return err;
 	switch (cmd) {
diff --git a/sound/core/init.c b/sound/core/init.c
index d11636fac608..7942da1085d2 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -1050,19 +1050,15 @@ EXPORT_SYMBOL_GPL(snd_power_ref_and_wait);
 /**
  * snd_power_wait - wait until the card gets powered up (old form)
  * @card: soundcard structure
- * @power_state: expected power state
  *
  * Wait until the card gets powered up to SNDRV_CTL_POWER_D0 state.
- * @power_state must be SNDRV_CTL_POWER_D0.
  *
  * Return: Zero if successful, or a negative error code.
  */
-int snd_power_wait(struct snd_card *card, unsigned int power_state)
+int snd_power_wait(struct snd_card *card)
 {
 	int ret;
 
-	if (WARN_ON(power_state != SNDRV_CTL_POWER_D0))
-		return 0;
 	ret = snd_power_ref_and_wait(card);
 	snd_power_unref(card);
 	return ret;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 3c6ba0dc2970..11acea02bc74 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2801,7 +2801,7 @@ static int snd_pcm_release(struct inode *inode, struct file *file)
 	pcm = substream->pcm;
 
 	/* block until the device gets woken up as it may touch the hardware */
-	snd_power_wait(pcm->card, SNDRV_CTL_POWER_D0);
+	snd_power_wait(pcm->card);
 
 	mutex_lock(&pcm->open_mutex);
 	snd_pcm_release_substream(substream);
@@ -3197,7 +3197,7 @@ static int snd_pcm_common_ioctl(struct file *file,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 
-	res = snd_power_wait(substream->pcm->card, SNDRV_CTL_POWER_D0);
+	res = snd_power_wait(substream->pcm->card);
 	if (res < 0)
 		return res;
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1c0904acb935..ddc65c12f6f4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -580,7 +580,7 @@ int snd_soc_suspend(struct device *dev)
 	 * Due to the resume being scheduled into a workqueue we could
 	 * suspend before that's finished - wait for it to complete.
 	 */
-	snd_power_wait(card->snd_card, SNDRV_CTL_POWER_D0);
+	snd_power_wait(card->snd_card);
 
 	/* we're going to block userspace touching us until resume completes */
 	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D3hot);
diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index 6e1bfe894dd5..596a1a1fea49 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -379,7 +379,7 @@ static int usb_stream_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 	if (cfg.period_frames < min_period_frames)
 		return -EINVAL;
 
-	snd_power_wait(hw->card, SNDRV_CTL_POWER_D0);
+	snd_power_wait(hw->card);
 
 	mutex_lock(&us122l->mutex);
 	s = us122l->sk.s;
-- 
2.26.2

