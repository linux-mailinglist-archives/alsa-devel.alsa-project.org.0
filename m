Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED265F038
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 16:37:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DD2B10B1C;
	Thu,  5 Jan 2023 16:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DD2B10B1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672933028;
	bh=xgAd2O/Zijue1zb9nEVD5lN8ZlFkuzV1lRvlJ4jCCIA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=tyTkKjD2k5poZIQF5Zj9BdbSFW8iuxWf/uRtiPeaarTvUt1lAdkkjT3EObByMDQsX
	 wXf0yA0o8IP6LFPWAjcUYOgG0DBSC/Dzy/O/Q+7NAwhNpTEpxsxztEQMs/EeU5aMeL
	 IgJD7pYWPPu65Kt31W1jTZGcJj3qF/oil3RXlMc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9407F80238;
	Thu,  5 Jan 2023 16:36:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05309F804AA; Thu,  5 Jan 2023 16:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E04F800C0
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 16:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E04F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LIBqhv71
Received: by mail-wm1-x335.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso1573736wmb.3
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 07:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kvwqpJq/sWstUjN/Pua0GP82pg20gx6l3H5SMuew58w=;
 b=LIBqhv71F6oN/z6W+fYXDBeFzFe2MpK+aw3yhi8/HQSWiltu9+oY901hBIdfT19W47
 vjy/X5/VQ3K0hs7GZ2SRn2GJmvVWHfiBfOHGdhX22FnhKW+qxrigS5xvbLgBFHrt2e0Y
 Od0Z75vlnAYo52CndQhxXoj4f8Jv54TR0JZAf2xkAfuV2eOH+N56w6YxhrYxkBmBRjF5
 mtqHP+5aiBy4btna+uhtW/+hgT1J8aBnbyUIGaxC1DyQRYv1B4OArwaxaYmimcx7yMcr
 VvQoNVD31RB4eGl0zW6XTzEctYNH4izIqOA5CaLe0r2qOZzrjr9aRg5I5b4IcN15dbkJ
 IuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kvwqpJq/sWstUjN/Pua0GP82pg20gx6l3H5SMuew58w=;
 b=DXNUrYEO3rtxXZqKAc6eeBeSxxb2d7+XEQHqlE0ZWLRDfss5wmu7TxyiobIrtLbrVa
 roq0xZy1UHx4lR8JUYtVYfyWbxPeN5fBNh8Utfu7vFM7rRBC/Qiyh0/5lyM6BDxDNR9M
 jmFqYKMDilthGl4eQRHETo4U2IoKKKpWBs0Qa3mObSyAC2PNjpikHfqG49mZ9oWezAak
 6pKlrv/FSfBhjgPua67CvZJ7DDemsE7XnDLcF52+IJOHzu2I6NnC2aqeTPrynMHXXLBK
 VTd4EnLzNChcSmyiko90U+6k67IIFRG1NLGHzuuUlpp7Ugs40VuzY1FHMuBhMiVPdYOG
 TkiQ==
X-Gm-Message-State: AFqh2ko0/I/KlGNSoqkTEbuNKyo1yXKMZnYQWhREkGn6Ke038ddaoZMB
 AY0wwY6bqWe0AT59R9tPLdvkZo27Ceo=
X-Google-Smtp-Source: AMrXdXshnMp/8r7uoZyDG6WwP6W8xAEhOg52ymbvsFjYORe6C21h/M1TBePhjFrhU96g6twd0wMvgA==
X-Received: by 2002:a05:600c:601e:b0:3d4:a1ba:a971 with SMTP id
 az30-20020a05600c601e00b003d4a1baa971mr36941729wmb.24.1672932961227; 
 Thu, 05 Jan 2023 07:36:01 -0800 (PST)
Received: from Dell-Boy.localdomain (surfbythesea.plus.com. [81.174.134.71])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003d22528decesm3318094wms.43.2023.01.05.07.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 07:36:00 -0800 (PST)
From: Alan Young <consult.awy@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] pcm_rate: fix hw_ptr boundary wrapping issue
Date: Thu,  5 Jan 2023 15:35:46 +0000
Message-Id: <20230105153546.468288-1-consult.awy@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: tiwai@suse.de, Alan Young <consult.awy@gmail.com>,
 mahendran.kuppusamy@in.bosch.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Wrap the hw_ptr using the total position of the slave hw_ptr, including
boundary wraps. Otherwise, small errors can creep in due to residuals
(when boundary is not a multiple of period size) and which can
accumulate.

Signed-off-by: Alan Young <consult.awy@gmail.com>
Fixes: 7570e5d7 ("pcm: rate: fix the hw_ptr update until the boundary available")
---
 src/pcm/pcm_rate.c | 54 ++++++++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
index c8076859..a29fc5a9 100644
--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -52,6 +52,7 @@ struct _snd_pcm_rate {
 	snd_pcm_generic_t gen;
 	snd_pcm_uframes_t appl_ptr, hw_ptr, last_slave_hw_ptr;
 	snd_pcm_uframes_t last_commit_ptr;
+	u_int64_t slave_hw_ptr_wrap;
 	snd_pcm_uframes_t orig_avail_min;
 	snd_pcm_sw_params_t sw_params;
 	snd_pcm_format_t sformat;
@@ -562,6 +563,8 @@ static int snd_pcm_rate_init(snd_pcm_t *pcm)
 	if (rate->ops.reset)
 		rate->ops.reset(rate->obj);
 	rate->last_commit_ptr = 0;
+	rate->last_slave_hw_ptr = 0;
+	rate->slave_hw_ptr_wrap = 0;
 	rate->start_pending = 0;
 	return 0;
 }
@@ -638,33 +641,48 @@ snd_pcm_rate_read_areas1(snd_pcm_t *pcm,
 static inline void snd_pcm_rate_sync_hwptr0(snd_pcm_t *pcm, snd_pcm_uframes_t slave_hw_ptr)
 {
 	snd_pcm_rate_t *rate;
-	snd_pcm_sframes_t slave_hw_ptr_diff;
-	snd_pcm_sframes_t last_slave_hw_ptr_frac;
+	snd_pcm_uframes_t new_hw_ptr;
+	snd_pcm_uframes_t slave_residual;
 
 	if (pcm->stream != SND_PCM_STREAM_PLAYBACK)
 		return;
 
 	rate = pcm->private_data;
-	slave_hw_ptr_diff = pcm_frame_diff(slave_hw_ptr, rate->last_slave_hw_ptr, rate->gen.slave->boundary);
-	if (slave_hw_ptr_diff == 0)
+	if (slave_hw_ptr == rate->last_slave_hw_ptr)
 		return;
-	last_slave_hw_ptr_frac = rate->last_slave_hw_ptr % rate->gen.slave->period_size;
-	/* While handling fraction part fo slave period, rounded value will be
-	 * introduced by input_frames().
-	 * To eliminate rounding issue on rate->hw_ptr, subtract last rounded
-	 * value from rate->hw_ptr and add new rounded value of present
-	 * slave_hw_ptr fraction part to rate->hw_ptr. Hence,
-	 * rate->hw_ptr += [ (no. of updated slave periods * pcm rate period size) -
-	 * 	fractional part of last_slave_hw_ptr rounded value +
-	 * 	fractional part of updated slave hw ptr's rounded value ]
+
+	/*
+	 * Our hw_ptr may wrap at a different time to that of the slave as the
+	 * number of period / boundary may differ. It is essential that our hw_ptr
+	 * wraps at the correct point, along with our appl_ptr. Otherwise the
+	 * avail calculation will be incorrect.
+	 *
+	 * Track the number of slave hw_ptr boundary wraps and use that to calculate
+	 * our new_hw_ptr from the total number of samples converted.
 	 */
-	rate->hw_ptr += (
-			(((last_slave_hw_ptr_frac + slave_hw_ptr_diff) / rate->gen.slave->period_size) * pcm->period_size) -
-			rate->ops.input_frames(rate->obj, last_slave_hw_ptr_frac) +
-			rate->ops.input_frames(rate->obj, (last_slave_hw_ptr_frac + slave_hw_ptr_diff) % rate->gen.slave->period_size));
+	if (slave_hw_ptr < rate->last_slave_hw_ptr) {
+		rate->slave_hw_ptr_wrap += rate->gen.slave->boundary;
+	}
 	rate->last_slave_hw_ptr = slave_hw_ptr;
 
-	rate->hw_ptr %= pcm->boundary;
+	/*
+	 * Calculate rate->hw_ptr using total number of frames consumed by slave hw_ptr,
+	 * including any boundary wraps.
+	 */
+	if (rate->slave_hw_ptr_wrap) {
+		/*
+		 * Restrict explicit 64-bit calculations to case where rate->slave_hw_ptr_wrap
+		 * is non-zero, which will only happen in 32-bit environments.
+		 */
+		u_int64_t wrapped_slave_hw_ptr = slave_hw_ptr + rate->slave_hw_ptr_wrap;
+		new_hw_ptr = ((wrapped_slave_hw_ptr / rate->gen.slave->period_size) * pcm->period_size) % pcm->boundary;
+		slave_residual = wrapped_slave_hw_ptr % rate->gen.slave->period_size;
+	} else {
+		new_hw_ptr = (slave_hw_ptr / rate->gen.slave->period_size) * pcm->period_size;
+		slave_residual = slave_hw_ptr % rate->gen.slave->period_size;
+	}
+	new_hw_ptr += rate->ops.input_frames(rate->obj, slave_residual);
+	rate->hw_ptr = new_hw_ptr % pcm->boundary;
 }
 
 static inline void snd_pcm_rate_sync_hwptr(snd_pcm_t *pcm)
-- 
2.25.1

