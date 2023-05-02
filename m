Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D519D6F4314
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 13:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CEDA1694;
	Tue,  2 May 2023 13:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CEDA1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683028378;
	bh=a55i5xQCKVDhq49Hwsr9Hl1rbgYZ+SaMu7ysELZdFNY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rWUQ0z3IWuyVM67O4vPnL/YUzYSVskCM51n03aTARLQGuxrpaFH6SE0pN7HJg4wHk
	 nHoFUSITRnoARXTHnyum6ML4j6QduKq/0WVoFfPflnT2HxRVVsM49L0iwhjRrp/FlE
	 l9pZndfl8oBBi4Td/G9yYltzo/5RjwBC9SxhBqDo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD76BF80542;
	Tue,  2 May 2023 13:51:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8D5FF80534; Tue,  2 May 2023 13:50:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C4C64F800EC
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 13:50:47 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2048511E2;
	Tue,  2 May 2023 13:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2048511E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683028247; bh=B2JnqXaCj+89DG6MIJGGwdqgmQDuDA13yykR1w13exw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZdEIcIwIdCBXCoYyrJv22l+stcfQXgnFvl964rZrY6SMNTVAfKjpCAyIvB9SZjNV/
	 uPjWxHU4rWbMtmaF8CFq0GkpObbvB9B2sAjdxQRYoNGoRW9eelOYpbHkix6e2oNrpP
	 KTPbVOVKnbZdxMB7UKHlrrZlbKX37IbqAygTEYo8=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  2 May 2023 13:50:45 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-lib 4/4] pcm: hw: introduce
 SNDRV_PCM_HW_PARAMS_DRAIN_SILENCE
Date: Tue,  2 May 2023 13:50:10 +0200
Message-Id: <20230502115010.986325-5-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502115010.986325-1-perex@perex.cz>
References: <20230502115010.986325-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZSWK6HDXP2CRRURSSEXFOMSEM3TFLMR2
X-Message-ID-Hash: ZSWK6HDXP2CRRURSSEXFOMSEM3TFLMR2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSWK6HDXP2CRRURSSEXFOMSEM3TFLMR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The application may not require to touch the sample stream
for the drain operation at all. Handle this situation
in alsa-lib.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/uapi/asound.h |  3 +++
 src/pcm/pcm.c               | 32 ++++++++++++++++++++++++++++++++
 src/pcm/pcm_hw.c            |  3 ++-
 src/pcm/pcm_local.h         |  1 +
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/include/sound/uapi/asound.h b/include/sound/uapi/asound.h
index 0b8834f2..f970179e 100644
--- a/include/sound/uapi/asound.h
+++ b/include/sound/uapi/asound.h
@@ -390,6 +390,9 @@ typedef int snd_pcm_hw_param_t;
 #define SNDRV_PCM_HW_PARAMS_NORESAMPLE	(1<<0)	/* avoid rate resampling */
 #define SNDRV_PCM_HW_PARAMS_EXPORT_BUFFER	(1<<1)	/* export buffer */
 #define SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP	(1<<2)	/* disable period wakeups */
+#define SNDRV_PCM_HW_PARAMS_NO_DRAIN_SILENCE	(1<<3)	/* supress drain with the filling
+							 * of the silence samples
+							 */
 
 struct snd_interval {
 	unsigned int min, max;
diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 099d83ee..5872ee6f 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -4958,6 +4958,38 @@ int snd_pcm_hw_params_get_period_wakeup(snd_pcm_t *pcm, snd_pcm_hw_params_t *par
 	return 0;
 }
 
+/**
+ * \brief Restrict a configuration space to allow the drain with the filling of silence samples
+ * \param pcm PCM handle
+ * \param params Configuration space
+ * \param val 0 = disable, 1 = enable (default) drain with the filling of silence samples
+ * \return 0 otherwise a negative error code
+ */
+int snd_pcm_hw_params_set_drain_silence(snd_pcm_t *pcm, snd_pcm_hw_params_t *params, unsigned int val)
+{
+	assert(pcm && params);
+	if (val)
+		params->flags &= ~SND_PCM_HW_PARAMS_NO_DRAIN_SILENCE;
+	else
+		params->flags |= SND_PCM_HW_PARAMS_NO_DRAIN_SILENCE;
+	params->rmask = ~0;
+	return snd_pcm_hw_refine(pcm, params);
+}
+
+/**
+ * \brief Extract drain with the filling of silence samples from a configuration space
+ * \param pcm PCM handle
+ * \param params Configuration space
+ * \param val 0 = disable, 1 = enable
+ * \return 0 otherwise a negative error code
+ */
+int snd_pcm_hw_params_get_drain_silence(snd_pcm_t *pcm, snd_pcm_hw_params_t *params, unsigned int *val)
+{
+	assert(pcm && params && val);
+	*val = params->flags & SND_PCM_HW_PARAMS_NO_DRAIN_SILENCE ? 0 : 1;
+	return 0;
+}
+
 /**
  * \brief Extract period time from a configuration space
  * \param params Configuration space
diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
index ea0c2ef2..90d5d07a 100644
--- a/src/pcm/pcm_hw.c
+++ b/src/pcm/pcm_hw.c
@@ -399,7 +399,8 @@ static int snd_pcm_hw_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	params->info &= ~0xf0000000;
 	if (pcm->tstamp_type != SND_PCM_TSTAMP_TYPE_GETTIMEOFDAY)
 		params->info |= SND_PCM_INFO_MONOTONIC;
-	hw->perfect_drain = !!(params->info & SND_PCM_INFO_PERFECT_DRAIN);
+	hw->perfect_drain = !!(params->info & SND_PCM_INFO_PERFECT_DRAIN) ||
+			    !!(params->flags & SND_PCM_HW_PARAMS_NO_DRAIN_SILENCE);
 	return query_status_data(hw);
 }
 
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index b039dda0..abea6654 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -107,6 +107,7 @@
 #define SND_PCM_HW_PARAMS_NORESAMPLE SNDRV_PCM_HW_PARAMS_NORESAMPLE
 #define SND_PCM_HW_PARAMS_EXPORT_BUFFER SNDRV_PCM_HW_PARAMS_EXPORT_BUFFER
 #define SND_PCM_HW_PARAMS_NO_PERIOD_WAKEUP SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP
+#define SND_PCM_HW_PARAMS_NO_DRAIN_SILENCE SNDRV_PCM_HW_PARAMS_NO_DRAIN_SILENCE
 
 #define SND_PCM_INFO_MONOTONIC	0x80000000
 
-- 
2.39.2

