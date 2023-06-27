Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A34741013
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 13:30:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA3584C;
	Wed, 28 Jun 2023 13:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA3584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687951849;
	bh=LarlstMM/fuFkL60HPWXMPI27ldhHUjCFh2GE8feVcQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JmapmKQX0j45l/F8CU7bGzpqP4txfE3x/mn1cjygqXPaoe3ZFLdubtHaIZt67vKWy
	 N/pFMxsU9kfU0df+s1Bv1OrlUB6fptRobuPeOaxbsViaNUNMqT1kW2n4qal0ObsbzP
	 KZe5qYTPW778DdaO1fRPdu9YPi7eW2ZxP1TXeeS0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2330AF8055C; Wed, 28 Jun 2023 13:29:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B001EF8055C;
	Wed, 28 Jun 2023 13:29:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55101F80544; Tue, 27 Jun 2023 11:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 449B8F800E3
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 11:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 449B8F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=bEG9tJct
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6689430d803so2355006b3a.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 02:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687859805; x=1690451805;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hujbIY55doI6O8/m1tW9FFQi85pBz1jV9D3SM708Vs=;
        b=bEG9tJct1KZYbxGfh6jyAnWppOW23cMFzLGB5sG2GQNmu6r7At8oEhJwqnRYr851yy
         CMEW2CHrDQXQSNdGEp9ars9suyXU/cThKu9wAZTea2wC9XnQEXG6eSG69nh1PsCrIRiW
         o00BtxyFrdbLvUMRigztbulqgbpT1cueYd9RagF8/Dtpmw7Xf3rWQejf4SjED00WkE5Z
         jZMTtr8CekIiGcR9Y5ZNvHMMCugF5JE/cjODwoZNcT8Y0paVbVZryENeqwPT36OTQ1SA
         dthBkallc57ZnAKuu5RVlm6B3CgnSRgp1nntffl7PLpStW8SbS+hhuzVLSXEutJweM9S
         eDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687859805; x=1690451805;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hujbIY55doI6O8/m1tW9FFQi85pBz1jV9D3SM708Vs=;
        b=JWs3qAH0UAqUyaxc58C/KozL6+pNqqKkcOgydPVdgGUTfdTKHVclK9ywdS3O45g4ZI
         7QtUJH5K+6e9SrVTBunqbHnOWPSr+cJA1asgZajd2hndonqHW2WYu2z3ZQWVbq4LmtsI
         eSc6o96t4k3LJzBYsFiaVHZt97nQVsfcPBL2Go379srZOY6da1xqsZ4iODk1SOz+nOib
         Rspr5KeSnwH/IdqtvJT7fUpPvgtcfmYdBYEnVLi+57biMpkwXqpj1iEGxJ/zozZch0jE
         Z4S4OFOCJjAQ86mFVVrRyXai1idX60TQHGpeQIKO5jzkaukI1b/UUSgw/Y9otSGAKQeX
         H5/Q==
X-Gm-Message-State: AC+VfDygk0xACnGW9DNEY+N3eDvSszaNmmMNV81mB+OT4y3sBp8Gr+xF
	6IMGCo3NNe4kLKE6TwlizNA=
X-Google-Smtp-Source: 
 ACHHUZ5WVISo1YP3SNQ/0ZKGrBjNBIgGIOloCf7piWhXiZOmE1VgfLdLEHzcn0U5sFfGlK99QkR6Sw==
X-Received: by 2002:a05:6a20:3d94:b0:126:926:26b8 with SMTP id
 s20-20020a056a203d9400b00126092626b8mr9111685pzi.62.1687859804608;
        Tue, 27 Jun 2023 02:56:44 -0700 (PDT)
Received: from 377044c6c369.cse.ust.hk (191host097.mobilenet.cse.ust.hk.
 [143.89.191.97])
        by smtp.gmail.com with ESMTPSA id
 v1-20020aa78501000000b0067db7c32419sm812085pfn.15.2023.06.27.02.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 02:56:44 -0700 (PDT)
From: Chengfeng Ye <dg573847474@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <dg573847474@gmail.com>
Subject: [PATCH] ALSA: sb: fix potential deadlock on &chip->mixer_lock
Date: Tue, 27 Jun 2023 09:56:16 +0000
Message-Id: <20230627095616.5333-1-dg573847474@gmail.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: dg573847474@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OWVJOW4CN3BUCBNSPRKBACLTTMYOVH4T
X-Message-ID-Hash: OWVJOW4CN3BUCBNSPRKBACLTTMYOVH4T
X-Mailman-Approved-At: Wed, 28 Jun 2023 11:29:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OWVJOW4CN3BUCBNSPRKBACLTTMYOVH4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As &chip->mixer_lock is also acquired by the irq snd_sb8dsp_interrupt()
which executes under hard-irq context, code executing under process
context should disable irq before acquiring the lock, otherwise
deadlock could happen if the process context hold the lock then
preempt by the interruption.

As the ALSA Driver document described, PCM prepare callbacks are not
executed with irq disabled by default, thus the acquiring of
&chip->mixer_lock should be irq disabled.

Possible deadlock scenario:
snd_sb8_playback_prepare
    -> spin_lock(&chip->mixer_lock);
        <irq interrupt>
        -> snd_sb8dsp_interrupt()
        -> snd_sb8_capture_trigger()
        -> spin_lock(&chip->mixer_lock); (deadlock here)

This flaw was found using an experimental static analysis tool we are
developing for irq-related deadlock.

The tentative patch fix the potential deadlock by spin_lock_irqsave().

Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
---
 sound/isa/sb/sb8_main.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/isa/sb/sb8_main.c b/sound/isa/sb/sb8_main.c
index 2ed176a5a574..81af8dcddcd2 100644
--- a/sound/isa/sb/sb8_main.c
+++ b/sound/isa/sb/sb8_main.c
@@ -148,10 +148,12 @@ static int snd_sb8_playback_prepare(struct snd_pcm_substream *substream)
 		snd_sbdsp_command(chip, format);
 	else if (stereo) {
 		/* set playback stereo mode */
-		spin_lock(&chip->mixer_lock);
+		unsigned long flags;
+
+		spin_lock_irqsave(&chip->mixer_lock, flags);
 		mixreg = snd_sbmixer_read(chip, SB_DSP_STEREO_SW);
 		snd_sbmixer_write(chip, SB_DSP_STEREO_SW, mixreg | 0x02);
-		spin_unlock(&chip->mixer_lock);
+		spin_unlock_irqrestore(&chip->mixer_lock, flags);
 
 		/* Soundblaster hardware programming reference guide, 3-23 */
 		snd_sbdsp_command(chip, SB_DSP_DMA8_EXIT);
@@ -164,12 +166,13 @@ static int snd_sb8_playback_prepare(struct snd_pcm_substream *substream)
 	}
 	snd_sbdsp_command(chip, SB_DSP_SAMPLE_RATE);
 	if (stereo) {
+		unsigned long flags;
 		snd_sbdsp_command(chip, 256 - runtime->rate_den / 2);
-		spin_lock(&chip->mixer_lock);
+		spin_lock_irqsave(&chip->mixer_lock, flags);
 		/* save output filter status and turn it off */
 		mixreg = snd_sbmixer_read(chip, SB_DSP_PLAYBACK_FILT);
 		snd_sbmixer_write(chip, SB_DSP_PLAYBACK_FILT, mixreg | 0x20);
-		spin_unlock(&chip->mixer_lock);
+		spin_unlock_irqrestore(&chip->mixer_lock, flags);
 		/* just use force_mode16 for temporary storate... */
 		chip->force_mode16 = mixreg;
 	} else {
@@ -289,12 +292,13 @@ static int snd_sb8_capture_prepare(struct snd_pcm_substream *substream)
 		snd_sbdsp_command(chip, SB_DSP_STEREO_8BIT);
 	snd_sbdsp_command(chip, SB_DSP_SAMPLE_RATE);
 	if (stereo) {
+		unsigned long flags;
 		snd_sbdsp_command(chip, 256 - runtime->rate_den / 2);
-		spin_lock(&chip->mixer_lock);
+		spin_lock_irqsave(&chip->mixer_lock, flags);
 		/* save input filter status and turn it off */
 		mixreg = snd_sbmixer_read(chip, SB_DSP_CAPTURE_FILT);
 		snd_sbmixer_write(chip, SB_DSP_CAPTURE_FILT, mixreg | 0x20);
-		spin_unlock(&chip->mixer_lock);
+		spin_lock_irqsave(&chip->mixer_lock, flags);
 		/* just use force_mode16 for temporary storate... */
 		chip->force_mode16 = mixreg;
 	} else {
-- 
2.17.1

