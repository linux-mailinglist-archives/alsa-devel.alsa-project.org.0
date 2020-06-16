Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637DE1FB1DD
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 15:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 007A51672;
	Tue, 16 Jun 2020 15:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 007A51672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592313576;
	bh=pEFfkALKDSC8/x2HjIbpCn/sZsK6z3BdswLJCd1sAX0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BOY7MLzMbt54hfMTlhUNrpk0BNyS5aHG7T3DAdIng9zbu5TJxr8SG66SDXevz+eQ+
	 8bj81zAycpAh06k6vwR8dDhsDnsUZM0mYPlde2A4W8/NrOPmLSV1ymh4yLVxiT+LXB
	 nJUwdqQF5Mh45i3/jATLmYHtXRc5y7ZGr9irrfnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD22F80245;
	Tue, 16 Jun 2020 15:17:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 205B2F80245; Tue, 16 Jun 2020 15:17:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCC7DF800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 15:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCC7DF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="OlOpipht"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EUMW/bEashtO586ffyz1ljJ1OZGveLvglHUaZik2x+I=; b=OlOpiphtI1WRPYuyZY0cas/zLm
 ohwN7iWAgmykgnlMcG+kDzPzsaCHohaexZCZGczrkf5E60hIzeh4C7SlDPEWk8Aim7x6WXlx1H1dy
 EX/m8Mpi5eeDhxIZ/C72b28PbcT1cQLmaPHZ6wYj5GXvDghipMoZ2skjD4Z1njfK8QYcL/ofv0Kru
 a0720qKE0/Mk+czZqciEOqfoAD7dywa/qFCIyRQDGZwi+4CeJezFyrn8egww8naYxvru1ntBe548J
 s0Uj5lBqbbZ/0AvV4ZNxJdztBXhhX3+xHBk2y5TB7XTfHc+APQJ9CXTYrBpnqYFJpB0G6JKduYY25
 J2I4iNag==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jlBTD-000MY2-9G; Tue, 16 Jun 2020 14:17:43 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jlBTD-0001Fy-1V; Tue, 16 Jun 2020 14:17:43 +0100
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/3] echoaudio: Race conditions around "opencount"
Date: Tue, 16 Jun 2020 14:17:41 +0100
Message-Id: <20200616131743.4793-1-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2006161409060.30751@stax.localdomain>
References: <2006161409060.30751@stax.localdomain>
Cc: alsa-devel@alsa-project.org
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

Use of atomics does not make these statements robust:

       atomic_inc(&chip->opencount);
       if (atomic_read(&chip->opencount) > 1 && chip->rate_set)
               chip->can_set_rate=0;

and

       if (atomic_read(&chip->opencount)) {
               if (chip->opencount) {
                       changed = -EAGAIN;
               } else {
                       changed = set_digital_mode(chip, dmode);

It would be necessary to atomically increment or decrement the value
and use the returned result. And yet we still need to prevent other
threads making use of "can_set_rate" while we set it.

However in all but one case the atomic is misleading as they are already
running with "mode_mutex" held.

Decisions are made on mode setting are often intrinsically connected
to "opencount" because some operations are not permitted unless
there is sole ownership.

So instead simplify this, and use "mode_mutex" as a lock for all reference
counting and mode setting.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 sound/pci/echoaudio/echoaudio.c | 76 ++++++++++++++++++---------------
 sound/pci/echoaudio/echoaudio.h |  6 +--
 2 files changed, 45 insertions(+), 37 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 0941a7a17623..82a49dfd2384 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -245,13 +245,20 @@ static int hw_rule_sample_rate(struct snd_pcm_hw_params *params,
 						      SNDRV_PCM_HW_PARAM_RATE);
 	struct echoaudio *chip = rule->private;
 	struct snd_interval fixed;
+	int err;
+
+	mutex_lock(&chip->mode_mutex);
 
-	if (!chip->can_set_rate) {
+	if (chip->can_set_rate) {
+		err = 0;
+	} else {
 		snd_interval_any(&fixed);
 		fixed.min = fixed.max = chip->sample_rate;
-		return snd_interval_refine(rate, &fixed);
+		err = snd_interval_refine(rate, &fixed);
 	}
-	return 0;
+
+	mutex_unlock(&chip->mode_mutex);
+	return err;
 }
 
 
@@ -322,7 +329,7 @@ static int pcm_open(struct snd_pcm_substream *substream,
 				       SNDRV_PCM_HW_PARAM_RATE, -1)) < 0)
 		return err;
 
-	/* Finally allocate a page for the scatter-gather list */
+	/* Allocate a page for the scatter-gather list */
 	if ((err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
 				       &chip->pci->dev,
 				       PAGE_SIZE, &pipe->sgpage)) < 0) {
@@ -330,6 +337,17 @@ static int pcm_open(struct snd_pcm_substream *substream,
 		return err;
 	}
 
+	/*
+	 * Sole ownership required to set the rate
+	 */
+
+	dev_dbg(chip->card->dev, "pcm_open opencount=%d can_set_rate=%d, rate_set=%d",
+		chip->opencount, chip->can_set_rate, chip->rate_set);
+
+	chip->opencount++;
+	if (chip->opencount > 1 && chip->rate_set)
+		chip->can_set_rate = 0;
+
 	return 0;
 }
 
@@ -353,12 +371,7 @@ static int pcm_analog_in_open(struct snd_pcm_substream *substream)
 				       hw_rule_capture_format_by_channels, NULL,
 				       SNDRV_PCM_HW_PARAM_CHANNELS, -1)) < 0)
 		return err;
-	atomic_inc(&chip->opencount);
-	if (atomic_read(&chip->opencount) > 1 && chip->rate_set)
-		chip->can_set_rate=0;
-	dev_dbg(chip->card->dev, "pcm_analog_in_open  cs=%d  oc=%d  r=%d\n",
-		chip->can_set_rate, atomic_read(&chip->opencount),
-		chip->sample_rate);
+
 	return 0;
 }
 
@@ -388,12 +401,7 @@ static int pcm_analog_out_open(struct snd_pcm_substream *substream)
 				       NULL,
 				       SNDRV_PCM_HW_PARAM_CHANNELS, -1)) < 0)
 		return err;
-	atomic_inc(&chip->opencount);
-	if (atomic_read(&chip->opencount) > 1 && chip->rate_set)
-		chip->can_set_rate=0;
-	dev_dbg(chip->card->dev, "pcm_analog_out_open  cs=%d  oc=%d  r=%d\n",
-		chip->can_set_rate, atomic_read(&chip->opencount),
-		chip->sample_rate);
+
 	return 0;
 }
 
@@ -429,10 +437,6 @@ static int pcm_digital_in_open(struct snd_pcm_substream *substream)
 				       SNDRV_PCM_HW_PARAM_CHANNELS, -1)) < 0)
 		goto din_exit;
 
-	atomic_inc(&chip->opencount);
-	if (atomic_read(&chip->opencount) > 1 && chip->rate_set)
-		chip->can_set_rate=0;
-
 din_exit:
 	mutex_unlock(&chip->mode_mutex);
 	return err;
@@ -471,9 +475,7 @@ static int pcm_digital_out_open(struct snd_pcm_substream *substream)
 				       NULL, SNDRV_PCM_HW_PARAM_CHANNELS,
 				       -1)) < 0)
 		goto dout_exit;
-	atomic_inc(&chip->opencount);
-	if (atomic_read(&chip->opencount) > 1 && chip->rate_set)
-		chip->can_set_rate=0;
+
 dout_exit:
 	mutex_unlock(&chip->mode_mutex);
 	return err;
@@ -488,23 +490,29 @@ static int pcm_digital_out_open(struct snd_pcm_substream *substream)
 static int pcm_close(struct snd_pcm_substream *substream)
 {
 	struct echoaudio *chip = snd_pcm_substream_chip(substream);
-	int oc;
 
 	/* Nothing to do here. Audio is already off and pipe will be
 	 * freed by its callback
 	 */
 
-	atomic_dec(&chip->opencount);
-	oc = atomic_read(&chip->opencount);
-	dev_dbg(chip->card->dev, "pcm_close  oc=%d  cs=%d  rs=%d\n", oc,
-		chip->can_set_rate, chip->rate_set);
-	if (oc < 2)
+	mutex_lock(&chip->mode_mutex);
+
+	dev_dbg(chip->card->dev, "pcm_open opencount=%d can_set_rate=%d, rate_set=%d",
+		chip->opencount, chip->can_set_rate, chip->rate_set);
+
+	chip->opencount--;
+
+	switch (chip->opencount) {
+	case 1:
 		chip->can_set_rate = 1;
-	if (oc == 0)
+		break;
+
+	case 0:
 		chip->rate_set = 0;
-	dev_dbg(chip->card->dev, "pcm_close2 oc=%d  cs=%d  rs=%d\n", oc,
-		chip->can_set_rate, chip->rate_set);
+		break;
+	}
 
+	mutex_unlock(&chip->mode_mutex);
 	return 0;
 }
 
@@ -1409,7 +1417,7 @@ static int snd_echo_digital_mode_put(struct snd_kcontrol *kcontrol,
 		/* Do not allow the user to change the digital mode when a pcm
 		device is open because it also changes the number of channels
 		and the allowed sample rates */
-		if (atomic_read(&chip->opencount)) {
+		if (chip->opencount) {
 			changed = -EAGAIN;
 		} else {
 			changed = set_digital_mode(chip, dmode);
@@ -1874,7 +1882,7 @@ static int snd_echo_create(struct snd_card *card,
 		chip->card = card;
 		chip->pci = pci;
 		chip->irq = -1;
-		atomic_set(&chip->opencount, 0);
+		chip->opencount = 0;
 		mutex_init(&chip->mode_mutex);
 		chip->can_set_rate = 1;
 	} else {
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index be4d0489394a..6fd283e4e676 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -336,7 +336,7 @@ struct echoaudio {
 	struct mutex mode_mutex;
 	u16 num_digital_modes, digital_mode_list[6];
 	u16 num_clock_sources, clock_source_list[10];
-	atomic_t opencount;
+	unsigned int opencount;  /* protected by mode_mutex */
 	struct snd_kcontrol *clock_src_ctl;
 	struct snd_pcm *analog_pcm, *digital_pcm;
 	struct snd_card *card;
@@ -353,8 +353,8 @@ struct echoaudio {
 	struct timer_list timer;
 	char tinuse;				/* Timer in use */
 	char midi_full;				/* MIDI output buffer is full */
-	char can_set_rate;
-	char rate_set;
+	char can_set_rate;                      /* protected by mode_mutex */
+	char rate_set;                          /* protected by mode_mutex */
 
 	/* This stuff is used mainly by the lowlevel code */
 	struct comm_page *comm_page;	/* Virtual address of the memory
-- 
2.17.5

