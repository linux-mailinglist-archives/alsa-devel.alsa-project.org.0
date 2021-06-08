Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A639F8C1
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CEA4178A;
	Tue,  8 Jun 2021 16:15:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CEA4178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161769;
	bh=KH7FoAZkiyGYDqMLQbsbv+bY88Ew2oppIOcWet01nGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPkmxpaBt9I2HlpOUyLgqxnjcurDDsk8XuYZxf/6g7KJF9HcrCERFj3J3Io/jEp9v
	 LBXvHPij/UiAhrE6K0E+EHWy1jXU71qv0wXGkf3d7KSwQanSR+JW7cYPbQlmfD0bAZ
	 CbHpBtAJxw3uv14RvmWGFG045Br5BYISDxxuS3uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 055BFF805E6;
	Tue,  8 Jun 2021 16:06:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BA57F805B2; Tue,  8 Jun 2021 16:06:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4783CF804DA
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4783CF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Bm9AY63m"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="iEw6f+77"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 86B3D1FDE9
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJs1ezFt7SYyXEv2mdSxDNGmU67WBEB9eMUm3EuE8kE=;
 b=Bm9AY63mLc+nH8Ky73mdL58Vz1YtuF5Rh1zL2pkfgpRgDhbaEmzwYMsn+Gu8cGEjzA7pBv
 +z7O2HyHMcwy24DE1FLlhse4cbW06i4nXAeuZ1d39aSD0X6kyMTSruArEjfxAhchn/e8ga
 C5jfC5eSVvtLXv1ZRd8HkvV1+PgVfrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJs1ezFt7SYyXEv2mdSxDNGmU67WBEB9eMUm3EuE8kE=;
 b=iEw6f+77WZbY7b2q2kIWnkxGVlMMzdpn8LQ9wDu+YVfC7DZ/VMLQDtoJiUKdlM7Qxf7GHR
 2cII5QF1OXBU2qCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 77CBAA3B88;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 36/66] ALSA: ca0106: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:10 +0200
Message-Id: <20210608140540.17885-37-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

PCI CA0106 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ca0106/ca0106_main.c | 18 ++++++++++++------
 sound/pci/ca0106/ca_midi.c     |  3 ++-
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index bee4710916c4..99778711006a 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -575,9 +575,11 @@ static int snd_ca0106_pcm_open_playback_channel(struct snd_pcm_substream *substr
 	*/
         //channel->interrupt = snd_ca0106_pcm_channel_interrupt;
 	channel->epcm = epcm;
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
                 return err;
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
+	err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
+	if (err < 0)
                 return err;
 	snd_pcm_set_sync(substream);
 
@@ -668,10 +670,12 @@ static int snd_ca0106_pcm_open_capture_channel(struct snd_pcm_substream *substre
 	*/
         //channel->interrupt = snd_ca0106_pcm_channel_interrupt;
         channel->epcm = epcm;
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
                 return err;
 	//snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hw_constraints_capture_period_sizes);
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
+	err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
+	if (err < 0)
                 return err;
 	return 0;
 }
@@ -1166,7 +1170,8 @@ static int snd_ca0106_ac97(struct snd_ca0106 *chip)
 		.read = snd_ca0106_ac97_read,
 	};
   
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus);
+	if (err < 0)
 		return err;
 	pbus->no_vra = 1; /* we don't need VRA */
 
@@ -1759,7 +1764,8 @@ static int snd_ca0106_midi(struct snd_ca0106 *chip, unsigned int channel)
 
 	midi->dev_id = chip;
 	
-	if ((err = ca_midi_init(chip, midi, 0, name)) < 0)
+	err = ca_midi_init(chip, midi, 0, name);
+	if (err < 0)
 		return err;
 
 	return 0;
diff --git a/sound/pci/ca0106/ca_midi.c b/sound/pci/ca0106/ca_midi.c
index 18524e0a9102..957e60f64821 100644
--- a/sound/pci/ca0106/ca_midi.c
+++ b/sound/pci/ca0106/ca_midi.c
@@ -276,7 +276,8 @@ int ca_midi_init(void *dev_id, struct snd_ca_midi *midi, int device, char *name)
 	struct snd_rawmidi *rmidi;
 	int err;
 
-	if ((err = snd_rawmidi_new(midi->get_dev_id_card(midi->dev_id), name, device, 1, 1, &rmidi)) < 0)
+	err = snd_rawmidi_new(midi->get_dev_id_card(midi->dev_id), name, device, 1, 1, &rmidi);
+	if (err < 0)
 		return err;
 
 	midi->dev_id = dev_id;
-- 
2.26.2

