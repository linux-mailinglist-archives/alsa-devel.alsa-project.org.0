Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB838DAA4
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 11:13:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADD181663;
	Sun, 23 May 2021 11:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADD181663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621761201;
	bh=pM5hVFLlsN3ZAXKcOd7YBDcFQZUPSaSoIpdHFr2jwjo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DIoMa17R+Ez72hL2SSL5USa/q4Fwzuq+LaHrtKSbVRFJbLRj7YR+f3Z7PGN9y5kZG
	 XWpi4ZPxcwOy2403ULBgh7ApjyaQHNgTrAby8mcHF6IB1T47qqDUKzFCXspdt9yhmm
	 poT6G0dMmy6PKnJafUP3sd8gywbh1ZHTftZN8xng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0FF9F804D8;
	Sun, 23 May 2021 11:09:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A813F804B4; Sun, 23 May 2021 11:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FAEDF80212
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 11:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FAEDF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xlZMA4jg"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="zliJL7pu"
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621760963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ml52YfugawCu2dD114l7MalQqFsrwMvYDk4h6cmgPFc=;
 b=xlZMA4jgNuXn/039R3XrrEnZsAdOMS8PkP2oj6TzB5qeB0L/sgMhLIJwQHZMIjvWdDhal8
 koMR/hvsNahcT6e2/E78oFlDkwVlgQ7i1MhyJvNbRhYwaNQpPKPbAnz0pIhGKjaOf6wbZr
 /Mmhif+yq7HqbHVkM1QpAKDcnjE5cx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621760963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ml52YfugawCu2dD114l7MalQqFsrwMvYDk4h6cmgPFc=;
 b=zliJL7puoPpg8n+E/JJABytfDO1SXl3cBlAxTv/Mgz2VNR/yvyP2ZvLWCETDeGgA89SVlW
 lJP30E5Ebu4BUsCg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22D9BAC87;
 Sun, 23 May 2021 09:09:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 5/6] ALSA: Drop superfluous argument from snd_power_wait()
Date: Sun, 23 May 2021 11:09:19 +0200
Message-Id: <20210523090920.15345-6-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210523090920.15345-1-tiwai@suse.de>
References: <20210523090920.15345-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
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

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h     | 4 ++--
 sound/core/init.c        | 6 +-----
 sound/core/pcm_native.c  | 2 +-
 sound/soc/soc-core.c     | 2 +-
 sound/usb/usx2y/us122l.c | 2 +-
 5 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 3acb754108b1..c4ade121727d 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -189,12 +189,12 @@ static inline void snd_power_sync_ref(struct snd_card *card)
 }
 
 /* init.c */
-int snd_power_wait(struct snd_card *card, unsigned int power_state);
+int snd_power_wait(struct snd_card *card);
 int snd_power_ref_and_wait(struct snd_card *card);
 
 #else /* ! CONFIG_PM */
 
-static inline int snd_power_wait(struct snd_card *card, unsigned int state) { return 0; }
+static inline int snd_power_wait(struct snd_card *card) { return 0; }
 static inline void snd_power_ref(struct snd_card *card) {}
 static inline void snd_power_unref(struct snd_card *card) {}
 static inline int snd_power_ref_and_wait(struct snd_card *card) { return 0; }
diff --git a/sound/core/init.c b/sound/core/init.c
index 2c62e035bc62..70114fd26956 100644
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
index 8dbe86cf2e4f..82f80d0c068b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3193,7 +3193,7 @@ static int snd_pcm_common_ioctl(struct file *file,
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

