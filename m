Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A66EAD11
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E24FBE8F;
	Fri, 21 Apr 2023 16:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E24FBE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682087843;
	bh=wqPxoZjkgefakv5jycqQflvRpQg/iHAnD3UY493SNkM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z4RCk90qcP2uERjwOEKcwyiGGBoiSDNeA9g9AorFRyeCcxCM1oTvFarOAPNR7t2wo
	 OxzUxvs3hWgGJbd318EDKKnfFrGdSkMOjJu40LwfuqDgPy+A4CFNG5+waXmr+fNnPY
	 TlsUTeZPe7S1mQ+h4bUeowxJHazcyLUHzwkB0dVE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49696F80149;
	Fri, 21 Apr 2023 16:36:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26084F80155; Fri, 21 Apr 2023 16:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E90BF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:36:20 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CD67411CF;
	Fri, 21 Apr 2023 16:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CD67411CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1682087779; bh=a6Xuzj0mzVgusYMWrNHY1xpGYof52mQVQODYGsO4lRA=;
	h=From:To:Cc:Subject:Date:From;
	b=qWrEQbizT+pW2+dXRlkapFNgq6kpbQ17TEq4V2XOqbslAga4A0dwxv63lSg+mY+FF
	 EHRe0G3MITh9T5EK7CkwV8Yj0YBeJBcxhxReL4tD5fPxtE+ojraVfU9l8SJH3k1kQE
	 L4ip7XJBE1uQaXZudjemWUpoG/osUuepTzASryuc=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 21 Apr 2023 16:36:16 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-lib] pcm: hw: setup explicit silencing for snd_pcm_drain
 by default
Date: Fri, 21 Apr 2023 16:36:06 +0200
Message-Id: <20230421143606.475100-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GDPVE25JX7U5UQ2BYYN6OMDOBAOP76JQ
X-Message-ID-Hash: GDPVE25JX7U5UQ2BYYN6OMDOBAOP76JQ
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GDPVE25JX7U5UQ2BYYN6OMDOBAOP76JQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RFC: Patch for alsa-lib. Not tested. For a discussion.

Some applications may not follow the period_size transfer blocks and
also the driver developers may not follow the consequeces of the
access beyond valid samples in the playback DMA buffer.

To avoid clicks, fill a little silence at the end of the playback
ring buffer when the snd_pcm_drain() is called.

TODO:
  - add SND_PCM_NO_DRAIN_SILENCE as a new flag for snd_pcm_open()
  - make this behaviour configurable (plugin config)

Cc: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 src/pcm/pcm.c       | 33 ++++++++++++++++++++-------------
 src/pcm/pcm_hw.c    | 45 +++++++++++++++++++++++++++++++++++++++++++++
 src/pcm/pcm_local.h |  4 ++++
 3 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 2b966d44..88b13ed4 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -6167,6 +6167,25 @@ int snd_pcm_hw_params_get_min_align(const snd_pcm_hw_params_t *params, snd_pcm_u
 	return 0;
 }
 
+#ifndef DOXYGEN
+void snd_pcm_sw_params_current_no_lock(snd_pcm_t *pcm, snd_pcm_sw_params_t *params)
+{
+	params->proto = SNDRV_PCM_VERSION;
+	params->tstamp_mode = pcm->tstamp_mode;
+	params->tstamp_type = pcm->tstamp_type;
+	params->period_step = pcm->period_step;
+	params->sleep_min = 0;
+	params->avail_min = pcm->avail_min;
+	sw_set_period_event(params, pcm->period_event);
+	params->xfer_align = 1;
+	params->start_threshold = pcm->start_threshold;
+	params->stop_threshold = pcm->stop_threshold;
+	params->silence_threshold = pcm->silence_threshold;
+	params->silence_size = pcm->silence_size;
+	params->boundary = pcm->boundary;
+}
+#endif
+
 /**
  * \brief Return current software configuration for a PCM
  * \param pcm PCM handle
@@ -6183,19 +6202,7 @@ int snd_pcm_sw_params_current(snd_pcm_t *pcm, snd_pcm_sw_params_t *params)
 		return -EIO;
 	}
 	__snd_pcm_lock(pcm); /* forced lock due to pcm field changes */
-	params->proto = SNDRV_PCM_VERSION;
-	params->tstamp_mode = pcm->tstamp_mode;
-	params->tstamp_type = pcm->tstamp_type;
-	params->period_step = pcm->period_step;
-	params->sleep_min = 0;
-	params->avail_min = pcm->avail_min;
-	sw_set_period_event(params, pcm->period_event);
-	params->xfer_align = 1;
-	params->start_threshold = pcm->start_threshold;
-	params->stop_threshold = pcm->stop_threshold;
-	params->silence_threshold = pcm->silence_threshold;
-	params->silence_size = pcm->silence_size;
-	params->boundary = pcm->boundary;
+	snd_pcm_sw_params_current_no_lock(pcm, params);
 	__snd_pcm_unlock(pcm);
 	return 0;
 }
diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
index daa3e1ff..4995b2cd 100644
--- a/src/pcm/pcm_hw.c
+++ b/src/pcm/pcm_hw.c
@@ -98,6 +98,8 @@ typedef struct {
 	bool mmap_control_fallbacked;
 	struct snd_pcm_sync_ptr *sync_ptr;
 
+	bool prepare_reset_sw_params;
+
 	int period_event;
 	snd_timer_t *period_timer;
 	struct pollfd period_timer_pfd;
@@ -534,6 +536,7 @@ static int snd_pcm_hw_sw_params(snd_pcm_t *pcm, snd_pcm_sw_params_t * params)
 		SYSMSG("SNDRV_PCM_IOCTL_SW_PARAMS failed (%i)", err);
 		goto out;
 	}
+	hw->prepare_reset_sw_params = false;
 	if ((snd_pcm_tstamp_type_t) params->tstamp_type != pcm->tstamp_type) {
 		if (hw->version < SNDRV_PROTOCOL_VERSION(2, 0, 12)) {
 			int on = (snd_pcm_tstamp_type_t) params->tstamp_type ==
@@ -660,7 +663,18 @@ static int snd_pcm_hw_hwsync(snd_pcm_t *pcm)
 static int snd_pcm_hw_prepare(snd_pcm_t *pcm)
 {
 	snd_pcm_hw_t *hw = pcm->private_data;
+	snd_pcm_sw_params_t sw_params;
 	int fd = hw->fd, err;
+
+	if (hw->prepare_reset_sw_params) {
+		snd_pcm_sw_params_current_no_lock(pcm, &sw_params);
+		if (ioctl(hw->fd, SNDRV_PCM_IOCTL_SW_PARAMS, sw_params) < 0) {
+			err = -errno;
+			SYSMSG("SNDRV_PCM_IOCTL_SW_PARAMS failed (%i)", err);
+			return err;
+		}
+		hw->prepare_reset_sw_params = false;
+	}
 	if (ioctl(fd, SNDRV_PCM_IOCTL_PREPARE) < 0) {
 		err = -errno;
 		SYSMSG("SNDRV_PCM_IOCTL_PREPARE failed (%i)", err);
@@ -718,7 +732,38 @@ static int snd_pcm_hw_drop(snd_pcm_t *pcm)
 static int snd_pcm_hw_drain(snd_pcm_t *pcm)
 {
 	snd_pcm_hw_t *hw = pcm->private_data;
+	snd_pcm_sw_params_t sw_params;
+	snd_pcm_uframes_t silence_size;
 	int err;
+
+	if (pcm->stream != SND_PCM_STREAM_PLAYBACK)
+		goto __skip_silence;
+	/* compute end silence size, align to period size + extra time */
+	snd_pcm_sw_params_current_no_lock(pcm, &sw_params);
+	if ((pcm->buffer_size % pcm->period_size) == 0) {
+		silence_size = pcm->period_size - (pcm->period_size % *pcm->appl.ptr);
+		if (silence_size == pcm->period_size)
+			silence_size = 0;
+	} else {
+		/* it not not easy to compute the period cross point
+		 * in this case because boundary is aligned only
+		 * to the buffer_size - use the full range (period)
+		 */
+		silence_size = pcm->period_size;
+	}
+	silence_size += pcm->rate / 10;	/* 1/10th of second */
+	if (sw_params.silence_size < silence_size) {
+		/* fill silence soon as possible (in the bellow ioctl) */
+		sw_params.silence_threshold = pcm->buffer_size;
+		sw_params.silence_size = silence_size;
+		if (ioctl(hw->fd, SNDRV_PCM_IOCTL_SW_PARAMS, sw_params) < 0) {
+			err = -errno;
+			SYSMSG("SNDRV_PCM_IOCTL_SW_PARAMS failed (%i)", err);
+			return err;
+		}
+		hw->prepare_reset_sw_params = true;
+	}
+__skip_silence:
 	if (ioctl(hw->fd, SNDRV_PCM_IOCTL_DRAIN) < 0) {
 		err = -errno;
 		SYSMSG("SNDRV_PCM_IOCTL_DRAIN failed (%i)", err);
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index ae0c44bf..4a859cd1 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -366,6 +366,8 @@ struct _snd_pcm {
 	snd1_pcm_hw_param_get_max
 #define snd_pcm_hw_param_name		\
 	snd1_pcm_hw_param_name
+#define snd_pcm_sw_params_current_no_lock \
+	snd1_pcm_sw_params_current_no_lock
 
 int snd_pcm_new(snd_pcm_t **pcmp, snd_pcm_type_t type, const char *name,
 		snd_pcm_stream_t stream, int mode);
@@ -390,6 +392,8 @@ void snd_pcm_mmap_appl_forward(snd_pcm_t *pcm, snd_pcm_uframes_t frames);
 void snd_pcm_mmap_hw_backward(snd_pcm_t *pcm, snd_pcm_uframes_t frames);
 void snd_pcm_mmap_hw_forward(snd_pcm_t *pcm, snd_pcm_uframes_t frames);
 
+void snd_pcm_sw_params_current_no_lock(snd_pcm_t *pcm, snd_pcm_sw_params_t *params);
+
 snd_pcm_sframes_t snd_pcm_mmap_writei(snd_pcm_t *pcm, const void *buffer, snd_pcm_uframes_t size);
 snd_pcm_sframes_t snd_pcm_mmap_readi(snd_pcm_t *pcm, void *buffer, snd_pcm_uframes_t size);
 snd_pcm_sframes_t snd_pcm_mmap_writen(snd_pcm_t *pcm, void **bufs, snd_pcm_uframes_t size);
-- 
2.39.2

