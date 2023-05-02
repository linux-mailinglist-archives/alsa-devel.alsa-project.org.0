Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387F6F4312
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 13:52:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8A8F1664;
	Tue,  2 May 2023 13:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8A8F1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683028353;
	bh=8r9KVwgJHm0edxCaCjnDsec4ZCPA7600wNcyVgj4/E8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=a6wlpxyGNaNUgR3Xh2wWfR1KkJEdiG1FWwmmKyHorYZKiCIwP61BNjjDd19Q0cpEH
	 fWb3FwJt/+sRu4PLtdN0h3N2azO2bCUozkboEuV8PpWvSaqbbfTBO3NKlx3Ie3PVxQ
	 1q7XhZjFGtgnuORAqIZyXgkbdU7t0JjpsCLUeVk0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 642CBF80529;
	Tue,  2 May 2023 13:50:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C063F8052E; Tue,  2 May 2023 13:50:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D58AF8049E
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 13:50:43 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 62F3311E2;
	Tue,  2 May 2023 13:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 62F3311E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683028242; bh=6cGUh0bloQTppsRGccGwlyiMZGz5IOCyZIiqwAJwx50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GGP6uuZAC+IFdPWUgcJ3DKLwDp6tWuxBN9I+tR7qomg3m4eenTVtMciknUlDy8K0v
	 qqfxsGMCYA7x5/uyThFX+Ecp3269Ot0j4Ezyow8Te+us98CmYZvli+evMgdF0Vw3IO
	 kF+KiEBRJZYNmbv+iCB6JgiUz0D96263AyDQnKm8=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  2 May 2023 13:50:40 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-lib 2/4] pcm: hw: add drain_silence configuration keyword
Date: Tue,  2 May 2023 13:50:08 +0200
Message-Id: <20230502115010.986325-3-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502115010.986325-1-perex@perex.cz>
References: <20230502115010.986325-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W32T4EET5AD6FMD5GISI2T6VOE3PBI4J
X-Message-ID-Hash: W32T4EET5AD6FMD5GISI2T6VOE3PBI4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W32T4EET5AD6FMD5GISI2T6VOE3PBI4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

  # Add silence in drain (-1 = auto /default/, 0 = off, > 0 silenced frames)
  [drain_silence INT]

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 src/pcm/pcm_hw.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
index d8f32bd9..30ff843c 100644
--- a/src/pcm/pcm_hw.c
+++ b/src/pcm/pcm_hw.c
@@ -111,6 +111,7 @@ typedef struct {
 		int max;
 	} rates;
 	int channels;
+	int drain_silence;
 	/* for chmap */
 	unsigned int chmap_caps;
 	snd_pcm_chmap_query_t **chmap_override;
@@ -738,8 +739,16 @@ static int snd_pcm_hw_drain(snd_pcm_t *pcm)
 
 	if (pcm->stream != SND_PCM_STREAM_PLAYBACK)
 		goto __skip_silence;
-	/* compute end silence size, align to period size + extra time */
+	if (hw->drain_silence == 0)
+		goto __skip_silence;
 	snd_pcm_sw_params_current_no_lock(pcm, &sw_params);
+	if (hw->drain_silence > 0) {
+		silence_size = hw->drain_silence;
+		if (silence_size > pcm->buffer_size)
+			silence_size = pcm->buffer_size;
+		goto __manual_silence;
+	}
+	/* compute end silence size, align to period size + extra time */
 	if ((pcm->boundary % pcm->period_size) == 0) {
 		silence_size = pcm->period_size - (*pcm->appl.ptr % pcm->period_size);
 		if (silence_size == pcm->period_size)
@@ -752,6 +761,7 @@ static int snd_pcm_hw_drain(snd_pcm_t *pcm)
 		silence_size = pcm->period_size;
 	}
 	silence_size += pcm->rate / 10;	/* 1/10th of second */
+__manual_silence:
 	if (sw_params.silence_size < silence_size) {
 		/* fill the silence soon as possible (in the bellow ioctl
 		 * or the next period wake up)
@@ -1818,6 +1828,7 @@ pcm.name {
 	[rate INT]		# Restrict only to the given rate
 	  or [rate [INT INT]]	# Restrict only to the given rate range (min max)
 	[chmap MAP]		# Override channel maps; MAP is a string array
+	[drain_silence INT]	# Add silence in drain (-1 = auto /default/, 0 = off, > 0 silenced frames)
 }
 \endcode
 
@@ -1850,7 +1861,7 @@ int _snd_pcm_hw_open(snd_pcm_t **pcmp, const char *name,
 	long card = -1, device = 0, subdevice = -1;
 	const char *str;
 	int err, sync_ptr_ioctl = 0;
-	int min_rate = 0, max_rate = 0, channels = 0;
+	int min_rate = 0, max_rate = 0, channels = 0, drain_silence = -1;
 	snd_pcm_format_t format = SND_PCM_FORMAT_UNKNOWN;
 	snd_config_t *n;
 	int nonblock = 1; /* non-block per default */
@@ -1991,6 +2002,16 @@ int _snd_pcm_hw_open(snd_pcm_t **pcmp, const char *name,
 			}
 			continue;
 		}
+		if (strcmp(id, "drain_silence") == 0) {
+			long val;
+			err = snd_config_get_integer(n, &val);
+			if (err < 0) {
+				SNDERR("Invalid type for %s", id);
+				goto fail;
+			}
+			drain_silence = val;
+			continue;
+		}
 		SNDERR("Unknown field %s", id);
 		err = -EINVAL;
 		goto fail;
@@ -2033,6 +2054,7 @@ int _snd_pcm_hw_open(snd_pcm_t **pcmp, const char *name,
 	}
 	if (chmap)
 		hw->chmap_override = chmap;
+	hw->drain_silence = drain_silence;
 
 	return 0;
 
-- 
2.39.2

