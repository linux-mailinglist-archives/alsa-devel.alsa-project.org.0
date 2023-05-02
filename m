Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C876F4318
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 13:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 709BB1633;
	Tue,  2 May 2023 13:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 709BB1633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683028400;
	bh=5TDJBGho7NuyI7LYiIBjLXEGotRwakyWWtTnk21Vgv8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cbJ/jLaQgbgBHaXkeWFLye0C2rSyUijnY0ZkaKEc3BZoMHB14YG1u2SDLeOJyjcZn
	 DD/U5vdcWRnnJIK7RN46D3+9G6Aja56uEHVJcA5K765V9o55N2mL3059bW0CqSg5Lh
	 N+GI9d8Wh2ugp7DIvUvgQRVIm6/eb1fD63bEcUX0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D0F5F80549;
	Tue,  2 May 2023 13:51:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 336DFF80551; Tue,  2 May 2023 13:51:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B2E28F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 13:50:40 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F18F411E2;
	Tue,  2 May 2023 13:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F18F411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683028240; bh=Ebl8z2/5a0VHyBfxYsbeJHRJ4u/yYHRaSR7H8RSYqts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=3A2nMTN7Y0vWZHjh4YhHwoxUzFQL0HHaVuT7/Eexicxt0o2Th3/AMrH53W0i9AjyH
	 WKA4MXZntubk8otIRKb/sOPFODujIPI/fOrFywavVWUy2XjTiORoWMunMQrZnGamy2
	 KRa+akkC2HIJVh2Qt9d9y68lsrKHpCdscQIJO4zY=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  2 May 2023 13:50:37 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-lib 1/4] pcm: hw: setup explicit silencing for
 snd_pcm_drain by default
Date: Tue,  2 May 2023 13:50:07 +0200
Message-Id: <20230502115010.986325-2-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502115010.986325-1-perex@perex.cz>
References: <20230502115010.986325-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JXQ22QLOYFJDDBOTM3LHGV2J24KHN7IC
X-Message-ID-Hash: JXQ22QLOYFJDDBOTM3LHGV2J24KHN7IC
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXQ22QLOYFJDDBOTM3LHGV2J24KHN7IC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some applications may not follow the period_size transfer blocks and
also the driver developers may not follow the consequeces of the
access beyond valid samples in the playback DMA buffer.

To avoid clicks, fill a little silence at the end of the playback
ring buffer when the snd_pcm_drain() is called.

Related: https://lore.kernel.org/alsa-devel/20230420113324.877164-2-oswald.buddenhagen@gmx.de/
Related: https://lore.kernel.org/alsa-devel/20230405201219.2197789-2-oswald.buddenhagen@gmx.de/
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 src/pcm/pcm.c       | 33 ++++++++++++++++++-------------
 src/pcm/pcm_hw.c    | 47 +++++++++++++++++++++++++++++++++++++++++++++
 src/pcm/pcm_local.h |  4 ++++
 3 files changed, 71 insertions(+), 13 deletions(-)

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
index daa3e1ff..d8f32bd9 100644
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
@@ -718,7 +732,40 @@ static int snd_pcm_hw_drop(snd_pcm_t *pcm)
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
+	if ((pcm->boundary % pcm->period_size) == 0) {
+		silence_size = pcm->period_size - (*pcm->appl.ptr % pcm->period_size);
+		if (silence_size == pcm->period_size)
+			silence_size = 0;
+	} else {
+		/* it not not easy to compute the period cross point
+		 * in this case because period is not aligned to the boundary
+		 * - use the full range (one period) in this case
+		 */
+		silence_size = pcm->period_size;
+	}
+	silence_size += pcm->rate / 10;	/* 1/10th of second */
+	if (sw_params.silence_size < silence_size) {
+		/* fill the silence soon as possible (in the bellow ioctl
+		 * or the next period wake up)
+		 */
+		sw_params.silence_threshold = pcm->buffer_size;
+		sw_params.silence_size = silence_size;
+		if (ioctl(hw->fd, SNDRV_PCM_IOCTL_SW_PARAMS, &sw_params) < 0) {
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

