Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3694D6F4313
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 13:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2C521639;
	Tue,  2 May 2023 13:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2C521639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683028356;
	bh=E9oxnn98MhxBrsOvH7dJKh/YD38RYN+ixTHn36N/Jpc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=s003cq3Y9nfuMy0/yUzZMcKL8R11GTsjX8WSc9gTfkWQsCII+DEhKcGphtvxH7dfE
	 vTvl4ks97XW+2GPCK4CSrLUmNYKcm+Nl8wjjxbrnaFyTgvcX1uecKihds1eoh+pKuK
	 Bi/UUEnYVb85lI5oCH5beYL4FhzAYbwqAnYPShYc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 359B9F8052E;
	Tue,  2 May 2023 13:51:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A97FF8053B; Tue,  2 May 2023 13:50:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 691B9F8032B
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 13:50:45 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DA97211E2;
	Tue,  2 May 2023 13:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DA97211E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683028244; bh=zdatYxiN0/vkMvubX7YbUgDZwqJ8pQoC3Hjq3XlYSPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H1rg/zNlDisHofMotsvy3dSeg05WOxYoX2w4LTt3BOU7hLO8TIGDZ7MFJXoEBGqdh
	 exSwZNA3rYPC01BMNmO9C+c6QBV7zRIEKVnWW+8M1yKo4BlaazUJIpI6aUqC/s81Kh
	 X37UQLspsY/K9InafqMaMapRcHdncEYA7yY+74+0=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  2 May 2023 13:50:42 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-lib 3/4] pcm: hw: introduce SNDRV_PCM_INFO_PERFECT_DRAIN
Date: Tue,  2 May 2023 13:50:09 +0200
Message-Id: <20230502115010.986325-4-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502115010.986325-1-perex@perex.cz>
References: <20230502115010.986325-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DUYQJWBDPUHTXGTM5NSYF2VEAGXMJ4UX
X-Message-ID-Hash: DUYQJWBDPUHTXGTM5NSYF2VEAGXMJ4UX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUYQJWBDPUHTXGTM5NSYF2VEAGXMJ4UX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver may not require to touch the sample stream
for the drain operation at all. Handle this situation
in alsa-lib.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/pcm.h               |  1 +
 include/sound/uapi/asound.h |  1 +
 src/pcm/pcm.c               | 23 +++++++++++++++++++++++
 src/pcm/pcm_hw.c            |  4 +++-
 src/pcm/pcm_local.h         |  2 ++
 5 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/pcm.h b/include/pcm.h
index b5a514fa..f15462d9 100644
--- a/include/pcm.h
+++ b/include/pcm.h
@@ -722,6 +722,7 @@ int snd_pcm_hw_params_is_half_duplex(const snd_pcm_hw_params_t *params);
 int snd_pcm_hw_params_is_joint_duplex(const snd_pcm_hw_params_t *params);
 int snd_pcm_hw_params_can_sync_start(const snd_pcm_hw_params_t *params);
 int snd_pcm_hw_params_can_disable_period_wakeup(const snd_pcm_hw_params_t *params);
+int snd_pcm_hw_params_does_perfect_drain(const snd_pcm_hw_params_t *params);
 int snd_pcm_hw_params_supports_audio_wallclock_ts(const snd_pcm_hw_params_t *params); /* deprecated, use audio_ts_type */
 int snd_pcm_hw_params_supports_audio_ts_type(const snd_pcm_hw_params_t *params, int type);
 int snd_pcm_hw_params_get_rate_numden(const snd_pcm_hw_params_t *params,
diff --git a/include/sound/uapi/asound.h b/include/sound/uapi/asound.h
index fc18c024..0b8834f2 100644
--- a/include/sound/uapi/asound.h
+++ b/include/sound/uapi/asound.h
@@ -281,6 +281,7 @@ typedef int __bitwise snd_pcm_subformat_t;
 #define SNDRV_PCM_INFO_DOUBLE		0x00000004	/* Double buffering needed for PCM start/stop */
 #define SNDRV_PCM_INFO_BATCH		0x00000010	/* double buffering */
 #define SNDRV_PCM_INFO_SYNC_APPLPTR	0x00000020	/* need the explicit sync of appl_ptr update */
+#define SNDRV_PCM_INFO_PERFECT_DRAIN	0x00000040	/* silencing at the end of stream is not required */
 #define SNDRV_PCM_INFO_INTERLEAVED	0x00000100	/* channels are interleaved */
 #define SNDRV_PCM_INFO_NONINTERLEAVED	0x00000200	/* channels are not interleaved */
 #define SNDRV_PCM_INFO_COMPLEX		0x00000400	/* complex frame organization (mmap only) */
diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 88b13ed4..099d83ee 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -3707,6 +3707,29 @@ int snd_pcm_hw_params_can_disable_period_wakeup(const snd_pcm_hw_params_t *param
 	return !!(params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP);
 }
 
+/**
+ * \brief Check if hardware does perfect drain
+ * \param params Configuration space
+ * \retval 0 Hardware doesn't do perfect drain
+ * \retval 1 Hardware does perfect drain
+ *
+ * This function should only be called when the configuration space
+ * contains a single configuration. Call #snd_pcm_hw_params to choose
+ * a single configuration from the configuration space.
+ *
+ * The perfect drain means that the hardware does not use samples
+ * beyond the stream application pointer.
+ */
+int snd_pcm_hw_params_does_perfect_drain(const snd_pcm_hw_params_t *params)
+{
+	assert(params);
+	if (CHECK_SANITY(params->info == ~0U)) {
+		SNDMSG("invalid PCM info field");
+		return 0; /* FIXME: should be a negative error? */
+	}
+	return !!(params->info & SNDRV_PCM_INFO_PERFECT_DRAIN);
+}
+
 /**
  * \brief Check if hardware supports audio wallclock timestamps
  * \param params Configuration space
diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
index 30ff843c..ea0c2ef2 100644
--- a/src/pcm/pcm_hw.c
+++ b/src/pcm/pcm_hw.c
@@ -99,6 +99,7 @@ typedef struct {
 	struct snd_pcm_sync_ptr *sync_ptr;
 
 	bool prepare_reset_sw_params;
+	bool perfect_drain;
 
 	int period_event;
 	snd_timer_t *period_timer;
@@ -398,6 +399,7 @@ static int snd_pcm_hw_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	params->info &= ~0xf0000000;
 	if (pcm->tstamp_type != SND_PCM_TSTAMP_TYPE_GETTIMEOFDAY)
 		params->info |= SND_PCM_INFO_MONOTONIC;
+	hw->perfect_drain = !!(params->info & SND_PCM_INFO_PERFECT_DRAIN);
 	return query_status_data(hw);
 }
 
@@ -739,7 +741,7 @@ static int snd_pcm_hw_drain(snd_pcm_t *pcm)
 
 	if (pcm->stream != SND_PCM_STREAM_PLAYBACK)
 		goto __skip_silence;
-	if (hw->drain_silence == 0)
+	if (hw->drain_silence == 0 || hw->perfect_drain)
 		goto __skip_silence;
 	snd_pcm_sw_params_current_no_lock(pcm, &sw_params);
 	if (hw->drain_silence > 0) {
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index 4a859cd1..b039dda0 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -79,6 +79,8 @@
 #define SND_PCM_INFO_DOUBLE SNDRV_PCM_INFO_DOUBLE
 /** device transfers samples in batch */
 #define SND_PCM_INFO_BATCH SNDRV_PCM_INFO_BATCH
+/** device does perfect drain (silencing not required) */
+#define SND_PCM_INFO_PERFECT_DRAIN SNDRV_PCM_INFO_PERFECT_DRAIN
 /** device accepts interleaved samples */
 #define SND_PCM_INFO_INTERLEAVED SNDRV_PCM_INFO_INTERLEAVED
 /** device accepts non-interleaved samples */
-- 
2.39.2

