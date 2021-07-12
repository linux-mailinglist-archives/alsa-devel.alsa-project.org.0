Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8A3C463A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 11:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A59091686;
	Mon, 12 Jul 2021 11:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A59091686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626081658;
	bh=cDcuIqccbwf5ddf9CzGhLFgRZg8/iGLXcDgzk2M/jhA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AFALNf4PG52WZTyM8l0yuhJH0vbJ1e7TaAouzAnVXLLK45bRqinY/C7RLTgMG1oLa
	 0QjBP3JKZZRzNd6SA0oWN6TVdGy5r7nlZeP0dTpHt7JixXTV8QF4z+D8Jktomrjr6y
	 XXkJ8E2Nw44sqQUaT9rpER3NbtwOW6Rh5QqOSZ50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 010EFF802E7;
	Mon, 12 Jul 2021 11:19:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66166F8026D; Mon, 12 Jul 2021 11:19:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1614DF80253
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 11:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1614DF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="niPGAPJt"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="+ipNCcTD"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EAE521FF65
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626081557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Yz3sHm7SnDcgZku9IKUnrQyv4+grSLZ2GydUC/qWn0c=;
 b=niPGAPJt5YX2Sg1/SN5VyWbONP8jWxo4YbrAsLSCyit4wtEHJc4TtlLxaZ7/MIsq4YiGeC
 JedBmL4muBWqmBBZKlB9hAJVphaFCx3qYb2vU08G8bQV4w67OsU85ysDqIA8ZJPWPLAZfP
 GrKrubm6wWM1NO9Xv2JElVElLyN/69c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626081557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Yz3sHm7SnDcgZku9IKUnrQyv4+grSLZ2GydUC/qWn0c=;
 b=+ipNCcTDFMPZpuQc0nGANdFIZ2lVZ4Qtxf822L6VSq8AT9A7dMj/kce4llBnI2ADP8s8Us
 VEff9E+jILR9xcDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E56E9A3B8B;
 Mon, 12 Jul 2021 09:19:17 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: x86: simplify with sync_stop PCM ops
Date: Mon, 12 Jul 2021 11:19:15 +0200
Message-Id: <20210712091915.28067-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The reset procedure in had_do_reset() is exactly for the recently
introduced PCM sync_stop ops.  Replace the call with the new ops and
clean up the unnecessary code and flags.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 31 ++++++++-----------------------
 sound/x86/intel_hdmi_audio.h |  1 -
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index a34d7d9c2a57..6d87c099d997 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1024,19 +1024,21 @@ static void wait_clear_underrun_bit(struct snd_intelhad *intelhaddata)
 	dev_err(intelhaddata->dev, "Unable to clear UNDERRUN bits\n");
 }
 
-/* Perform some reset procedure but only when need_reset is set;
+/* Perform some reset procedure after stopping the stream;
  * this is called from prepare or hw_free callbacks once after trigger STOP
  * or underrun has been processed in order to settle down the h/w state.
  */
-static void had_do_reset(struct snd_intelhad *intelhaddata)
+static int had_pcm_sync_stop(struct snd_pcm_substream *substream)
 {
-	if (!intelhaddata->need_reset || !intelhaddata->connected)
-		return;
+	struct snd_intelhad *intelhaddata = snd_pcm_substream_chip(substream);
+
+	if (!intelhaddata->connected)
+		return 0;
 
 	/* Reset buffer pointers */
 	had_reset_audio(intelhaddata);
 	wait_clear_underrun_bit(intelhaddata);
-	intelhaddata->need_reset = false;
+	return 0;
 }
 
 /* called from irq handler */
@@ -1050,7 +1052,6 @@ static void had_process_buffer_underrun(struct snd_intelhad *intelhaddata)
 		snd_pcm_stop_xrun(substream);
 		had_substream_put(intelhaddata);
 	}
-	intelhaddata->need_reset = true;
 }
 
 /*
@@ -1141,19 +1142,6 @@ static int had_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/*
- * ALSA PCM hw_free callback
- */
-static int had_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_intelhad *intelhaddata;
-
-	intelhaddata = snd_pcm_substream_chip(substream);
-	had_do_reset(intelhaddata);
-
-	return 0;
-}
-
 /*
  * ALSA PCM trigger callback
  */
@@ -1178,7 +1166,6 @@ static int had_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		/* Disable Audio */
 		had_enable_audio(intelhaddata, false);
-		intelhaddata->need_reset = true;
 		break;
 
 	default:
@@ -1210,8 +1197,6 @@ static int had_pcm_prepare(struct snd_pcm_substream *substream)
 	dev_dbg(intelhaddata->dev, "rate=%d\n", runtime->rate);
 	dev_dbg(intelhaddata->dev, "channels=%d\n", runtime->channels);
 
-	had_do_reset(intelhaddata);
-
 	/* Get N value in KHz */
 	disp_samp_freq = intelhaddata->tmds_clock_speed;
 
@@ -1287,9 +1272,9 @@ static const struct snd_pcm_ops had_pcm_ops = {
 	.open =		had_pcm_open,
 	.close =	had_pcm_close,
 	.hw_params =	had_pcm_hw_params,
-	.hw_free =	had_pcm_hw_free,
 	.prepare =	had_pcm_prepare,
 	.trigger =	had_pcm_trigger,
+	.sync_stop =	had_pcm_sync_stop,
 	.pointer =	had_pcm_pointer,
 	.mmap =		had_pcm_mmap,
 };
diff --git a/sound/x86/intel_hdmi_audio.h b/sound/x86/intel_hdmi_audio.h
index bb3853195922..7ce8c2a7d714 100644
--- a/sound/x86/intel_hdmi_audio.h
+++ b/sound/x86/intel_hdmi_audio.h
@@ -127,7 +127,6 @@ struct snd_intelhad {
 	union aud_cfg aud_config;	/* AUD_CONFIG reg value cache */
 	struct work_struct hdmi_audio_wq;
 	struct mutex mutex; /* for protecting chmap and eld */
-	bool need_reset;
 	struct snd_jack *jack;
 };
 
-- 
2.26.2

