Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB339F8CC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6B31179F;
	Tue,  8 Jun 2021 16:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6B31179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161887;
	bh=t525L66iFX5KrTozwEdzAMDpducLtI1AEoqPusfQljw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvDZP2c0VTlRXV0dYgfdmVsovPDybnqG0ozGJ/d0FF0WWFZRAjJ3Bl/Z10ZRzsgQ+
	 QwyI4pgeMbOVaNLIdRIiT1KtfIw0DFeiKOS18nm12TJ35IEe/UZucun3aQYPOgWoNA
	 0uYd96V4VCdVVZgPvSQswxOvk6Ahbs84zsWbfJ9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFDA3F804ED;
	Tue,  8 Jun 2021 16:06:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0434F805E3; Tue,  8 Jun 2021 16:06:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71097F804E4
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71097F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="L6appTKM"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="9cvWwGSb"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A26B01FDEB
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lo4EFOXWEMemGadDUi2/eZbJvCOOt+fp0emFD82IN1M=;
 b=L6appTKMg+8QO4gT24HPdt8QicCyF1W2e5LSo91RdLoyECBvGzLDFSTdz5B/Kgl8lXFPAD
 zSM+4tOcDIAxnASih0Bu3e6Bm5tRc0jqHY2GeRqrG9c/K431Q+dHvHICd53220a07b30jV
 ZM+CmZYAduChs6C6+oNZCQBzW1RPZwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lo4EFOXWEMemGadDUi2/eZbJvCOOt+fp0emFD82IN1M=;
 b=9cvWwGSb/kRidmhXD2/v47pLgJW0un3goiHvJeBAGKrncM8EJW9fbO7Pi29HlIyOfzN7k1
 +SDJjLPn89hm/qCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 99EF6A3B84;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 39/66] ALSA: echoaudio: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:13 +0200
Message-Id: <20210608140540.17885-40-tiwai@suse.de>
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

PCI echoaudio drivers contain a few assignments in if condition, which
is a bad coding style that may confuse readers and occasionally lead
to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/echoaudio/darla20_dsp.c   |   6 +-
 sound/pci/echoaudio/darla24_dsp.c   |   6 +-
 sound/pci/echoaudio/echo3g_dsp.c    |   3 +-
 sound/pci/echoaudio/echoaudio.c     | 220 ++++++++++++++++------------
 sound/pci/echoaudio/echoaudio_dsp.c |  12 +-
 sound/pci/echoaudio/echoaudio_gml.c |   3 +-
 sound/pci/echoaudio/gina20_dsp.c    |   6 +-
 sound/pci/echoaudio/gina24_dsp.c    |   6 +-
 sound/pci/echoaudio/indigo_dsp.c    |   6 +-
 sound/pci/echoaudio/indigodj_dsp.c  |   6 +-
 sound/pci/echoaudio/indigoio_dsp.c  |   6 +-
 sound/pci/echoaudio/layla20_dsp.c   |   6 +-
 sound/pci/echoaudio/layla24_dsp.c   |   9 +-
 sound/pci/echoaudio/mia_dsp.c       |   6 +-
 sound/pci/echoaudio/midi.c          |   4 +-
 sound/pci/echoaudio/mona_dsp.c      |   6 +-
 16 files changed, 190 insertions(+), 121 deletions(-)

diff --git a/sound/pci/echoaudio/darla20_dsp.c b/sound/pci/echoaudio/darla20_dsp.c
index 320837ba7bab..0356efad7528 100644
--- a/sound/pci/echoaudio/darla20_dsp.c
+++ b/sound/pci/echoaudio/darla20_dsp.c
@@ -36,7 +36,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != DARLA20))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw: could not initialize DSP comm page\n");
 		return err;
@@ -53,7 +54,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	chip->asic_loaded = true;
 	chip->input_clock_types = ECHO_CLOCK_BIT_INTERNAL;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
diff --git a/sound/pci/echoaudio/darla24_dsp.c b/sound/pci/echoaudio/darla24_dsp.c
index 8736b5e81ca3..b96300772aee 100644
--- a/sound/pci/echoaudio/darla24_dsp.c
+++ b/sound/pci/echoaudio/darla24_dsp.c
@@ -36,7 +36,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != DARLA24))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw: could not initialize DSP comm page\n");
 		return err;
@@ -52,7 +53,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	chip->input_clock_types = ECHO_CLOCK_BIT_INTERNAL |
 		ECHO_CLOCK_BIT_ESYNC;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
diff --git a/sound/pci/echoaudio/echo3g_dsp.c b/sound/pci/echoaudio/echo3g_dsp.c
index 6deb80c42f11..9e1f2cad0909 100644
--- a/sound/pci/echoaudio/echo3g_dsp.c
+++ b/sound/pci/echoaudio/echo3g_dsp.c
@@ -49,7 +49,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != ECHO3G))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 9bd67ac33657..a62e5581ad14 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -301,38 +301,42 @@ static int pcm_open(struct snd_pcm_substream *substream,
 	snd_pcm_set_sync(substream);
 
 	/* Only mono and any even number of channels are allowed */
-	if ((err = snd_pcm_hw_constraint_list(runtime, 0,
-					      SNDRV_PCM_HW_PARAM_CHANNELS,
-					      &pipe->constr)) < 0)
+	err = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS,
+					 &pipe->constr);
+	if (err < 0)
 		return err;
 
 	/* All periods should have the same size */
-	if ((err = snd_pcm_hw_constraint_integer(runtime,
-						 SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 
 	/* The hw accesses memory in chunks 32 frames long and they should be
 	32-bytes-aligned. It's not a requirement, but it seems that IRQs are
 	generated with a resolution of 32 frames. Thus we need the following */
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0,
-					      SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					      32)) < 0)
+	err = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 32);
+	if (err < 0)
 		return err;
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0,
-					      SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					      32)) < 0)
+	err = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 32);
+	if (err < 0)
 		return err;
 
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
-				       SNDRV_PCM_HW_PARAM_RATE,
-					hw_rule_sample_rate, chip,
-				       SNDRV_PCM_HW_PARAM_RATE, -1)) < 0)
+	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+				  SNDRV_PCM_HW_PARAM_RATE,
+				  hw_rule_sample_rate, chip,
+				  SNDRV_PCM_HW_PARAM_RATE, -1);
+	if (err < 0)
 		return err;
 
 	/* Allocate a page for the scatter-gather list */
-	if ((err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-				       &chip->pci->dev,
-				       PAGE_SIZE, &pipe->sgpage)) < 0) {
+	err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
+				  &chip->pci->dev,
+				  PAGE_SIZE, &pipe->sgpage);
+	if (err < 0) {
 		dev_err(chip->card->dev, "s-g list allocation failed\n");
 		return err;
 	}
@@ -358,18 +362,21 @@ static int pcm_analog_in_open(struct snd_pcm_substream *substream)
 	struct echoaudio *chip = snd_pcm_substream_chip(substream);
 	int err;
 
-	if ((err = pcm_open(substream, num_analog_busses_in(chip) -
-			    substream->number)) < 0)
+	err = pcm_open(substream,
+		       num_analog_busses_in(chip) - substream->number);
+	if (err < 0)
 		return err;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
-				       SNDRV_PCM_HW_PARAM_CHANNELS,
-				       hw_rule_capture_channels_by_format, NULL,
-				       SNDRV_PCM_HW_PARAM_FORMAT, -1)) < 0)
+	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+				  SNDRV_PCM_HW_PARAM_CHANNELS,
+				  hw_rule_capture_channels_by_format, NULL,
+				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
+	if (err < 0)
 		return err;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
-				       SNDRV_PCM_HW_PARAM_FORMAT,
-				       hw_rule_capture_format_by_channels, NULL,
-				       SNDRV_PCM_HW_PARAM_CHANNELS, -1)) < 0)
+	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+				  SNDRV_PCM_HW_PARAM_FORMAT,
+				  hw_rule_capture_format_by_channels, NULL,
+				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
+	if (err < 0)
 		return err;
 
 	return 0;
@@ -387,19 +394,22 @@ static int pcm_analog_out_open(struct snd_pcm_substream *substream)
 #else
 	max_channels = num_analog_busses_out(chip);
 #endif
-	if ((err = pcm_open(substream, max_channels - substream->number)) < 0)
+	err = pcm_open(substream, max_channels - substream->number);
+	if (err < 0)
 		return err;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
-				       SNDRV_PCM_HW_PARAM_CHANNELS,
-				       hw_rule_playback_channels_by_format,
-				       NULL,
-				       SNDRV_PCM_HW_PARAM_FORMAT, -1)) < 0)
+	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+				  SNDRV_PCM_HW_PARAM_CHANNELS,
+				  hw_rule_playback_channels_by_format,
+				  NULL,
+				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
+	if (err < 0)
 		return err;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
-				       SNDRV_PCM_HW_PARAM_FORMAT,
-				       hw_rule_playback_format_by_channels,
-				       NULL,
-				       SNDRV_PCM_HW_PARAM_CHANNELS, -1)) < 0)
+	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+				  SNDRV_PCM_HW_PARAM_FORMAT,
+				  hw_rule_playback_format_by_channels,
+				  NULL,
+				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
+	if (err < 0)
 		return err;
 
 	return 0;
@@ -426,15 +436,17 @@ static int pcm_digital_in_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto din_exit;
 
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
-				       SNDRV_PCM_HW_PARAM_CHANNELS,
-				       hw_rule_capture_channels_by_format, NULL,
-				       SNDRV_PCM_HW_PARAM_FORMAT, -1)) < 0)
+	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+				  SNDRV_PCM_HW_PARAM_CHANNELS,
+				  hw_rule_capture_channels_by_format, NULL,
+				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
+	if (err < 0)
 		goto din_exit;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
-				       SNDRV_PCM_HW_PARAM_FORMAT,
-				       hw_rule_capture_format_by_channels, NULL,
-				       SNDRV_PCM_HW_PARAM_CHANNELS, -1)) < 0)
+	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+				  SNDRV_PCM_HW_PARAM_FORMAT,
+				  hw_rule_capture_format_by_channels, NULL,
+				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
+	if (err < 0)
 		goto din_exit;
 
 din_exit:
@@ -463,17 +475,19 @@ static int pcm_digital_out_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto dout_exit;
 
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
-				       SNDRV_PCM_HW_PARAM_CHANNELS,
-				       hw_rule_playback_channels_by_format,
-				       NULL, SNDRV_PCM_HW_PARAM_FORMAT,
-				       -1)) < 0)
+	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+				  SNDRV_PCM_HW_PARAM_CHANNELS,
+				  hw_rule_playback_channels_by_format,
+				  NULL, SNDRV_PCM_HW_PARAM_FORMAT,
+				  -1);
+	if (err < 0)
 		goto dout_exit;
-	if ((err = snd_pcm_hw_rule_add(substream->runtime, 0,
-				       SNDRV_PCM_HW_PARAM_FORMAT,
-				       hw_rule_playback_format_by_channels,
-				       NULL, SNDRV_PCM_HW_PARAM_CHANNELS,
-				       -1)) < 0)
+	err = snd_pcm_hw_rule_add(substream->runtime, 0,
+				  SNDRV_PCM_HW_PARAM_FORMAT,
+				  hw_rule_playback_format_by_channels,
+				  NULL, SNDRV_PCM_HW_PARAM_CHANNELS,
+				  -1);
+	if (err < 0)
 		goto dout_exit;
 
 dout_exit:
@@ -907,8 +921,9 @@ static int snd_echo_new_pcm(struct echoaudio *chip)
 	separated */
 
 	/* PCM#0 Virtual outputs and analog inputs */
-	if ((err = snd_pcm_new(chip->card, "PCM", 0, num_pipes_out(chip),
-				num_analog_busses_in(chip), &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "PCM", 0, num_pipes_out(chip),
+			  num_analog_busses_in(chip), &pcm);
+	if (err < 0)
 		return err;
 	pcm->private_data = chip;
 	chip->analog_pcm = pcm;
@@ -919,8 +934,9 @@ static int snd_echo_new_pcm(struct echoaudio *chip)
 
 #ifdef ECHOCARD_HAS_DIGITAL_IO
 	/* PCM#1 Digital inputs, no outputs */
-	if ((err = snd_pcm_new(chip->card, "Digital PCM", 1, 0,
-			       num_digital_busses_in(chip), &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "Digital PCM", 1, 0,
+			  num_digital_busses_in(chip), &pcm);
+	if (err < 0)
 		return err;
 	pcm->private_data = chip;
 	chip->digital_pcm = pcm;
@@ -937,9 +953,10 @@ static int snd_echo_new_pcm(struct echoaudio *chip)
 	register two PCM devices: */
 
 	/* PCM#0 Analog i/o */
-	if ((err = snd_pcm_new(chip->card, "Analog PCM", 0,
-			       num_analog_busses_out(chip),
-			       num_analog_busses_in(chip), &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "Analog PCM", 0,
+			  num_analog_busses_out(chip),
+			  num_analog_busses_in(chip), &pcm);
+	if (err < 0)
 		return err;
 	pcm->private_data = chip;
 	chip->analog_pcm = pcm;
@@ -950,9 +967,10 @@ static int snd_echo_new_pcm(struct echoaudio *chip)
 
 #ifdef ECHOCARD_HAS_DIGITAL_IO
 	/* PCM#1 Digital i/o */
-	if ((err = snd_pcm_new(chip->card, "Digital PCM", 1,
-			       num_digital_busses_out(chip),
-			       num_digital_busses_in(chip), &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "Digital PCM", 1,
+			  num_digital_busses_out(chip),
+			  num_digital_busses_in(chip), &pcm);
+	if (err < 0)
 		return err;
 	pcm->private_data = chip;
 	chip->digital_pcm = pcm;
@@ -1567,7 +1585,8 @@ static int snd_echo_clock_source_put(struct snd_kcontrol *kcontrol,
 	if (chip->input_clock != dclock) {
 		mutex_lock(&chip->mode_mutex);
 		spin_lock_irq(&chip->lock);
-		if ((changed = set_input_clock(chip, dclock)) == 0)
+		changed = set_input_clock(chip, dclock);
+		if (!changed)
 			changed = 1;	/* no errors */
 		spin_unlock_irq(&chip->lock);
 		mutex_unlock(&chip->mode_mutex);
@@ -1911,7 +1930,8 @@ static int snd_echo_create(struct snd_card *card,
 
 	pci_write_config_byte(pci, PCI_LATENCY_TIMER, 0xC0);
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	pci_set_master(pci);
 
@@ -1943,8 +1963,9 @@ static int snd_echo_create(struct snd_card *card,
 	if (sz > PAGE_SIZE)
 		sz = PAGE_SIZE;		/* We map only the required part */
 
-	if ((chip->iores = request_mem_region(chip->dsp_registers_phys, sz,
-					      ECHOCARD_NAME)) == NULL) {
+	chip->iores = request_mem_region(chip->dsp_registers_phys, sz,
+					 ECHOCARD_NAME);
+	if (!chip->iores) {
 		dev_err(chip->card->dev, "cannot get memory region\n");
 		snd_echo_free(chip);
 		return -EBUSY;
@@ -1988,7 +2009,8 @@ static int snd_echo_create(struct snd_card *card,
 		return err;
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_echo_free(chip);
 		return err;
 	}
@@ -2024,7 +2046,8 @@ static int snd_echo_probe(struct pci_dev *pci,
 		return err;
 
 	chip = NULL;	/* Tells snd_echo_create to allocate chip */
-	if ((err = snd_echo_create(card, pci, &chip)) < 0) {
+	err = snd_echo_create(card, pci, &chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -2040,7 +2063,8 @@ static int snd_echo_probe(struct pci_dev *pci,
 		card->shortname, pci_id->subdevice & 0x000f, dsp,
 		chip->dsp_registers_phys, chip->irq);
 
-	if ((err = snd_echo_new_pcm(chip)) < 0) {
+	err = snd_echo_new_pcm(chip);
+	if (err < 0) {
 		dev_err(chip->card->dev, "new pcm error %d\n", err);
 		snd_card_free(card);
 		return err;
@@ -2048,7 +2072,8 @@ static int snd_echo_probe(struct pci_dev *pci,
 
 #ifdef ECHOCARD_HAS_MIDI
 	if (chip->has_midi) {	/* Some Mia's do not have midi */
-		if ((err = snd_echo_midi_create(card, chip)) < 0) {
+		err = snd_echo_midi_create(card, chip);
+		if (err < 0) {
 			dev_err(chip->card->dev, "new midi error %d\n", err);
 			snd_card_free(card);
 			return err;
@@ -2058,7 +2083,8 @@ static int snd_echo_probe(struct pci_dev *pci,
 
 #ifdef ECHOCARD_HAS_VMIXER
 	snd_echo_vmixer.count = num_pipes_out(chip) * num_busses_out(chip);
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_vmixer, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_vmixer, chip));
+	if (err < 0)
 		goto ctl_error;
 #ifdef ECHOCARD_HAS_LINE_OUT_GAIN
 	err = snd_ctl_add(chip->card,
@@ -2074,39 +2100,48 @@ static int snd_echo_probe(struct pci_dev *pci,
 #endif /* ECHOCARD_HAS_VMIXER */
 
 #ifdef ECHOCARD_HAS_INPUT_GAIN
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_line_input_gain, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_line_input_gain, chip));
+	if (err < 0)
 		goto ctl_error;
 #endif
 
 #ifdef ECHOCARD_HAS_INPUT_NOMINAL_LEVEL
-	if (!chip->hasnt_input_nominal_level)
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_intput_nominal_level, chip))) < 0)
+	if (!chip->hasnt_input_nominal_level) {
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_intput_nominal_level, chip));
+		if (err < 0)
 			goto ctl_error;
+	}
 #endif
 
 #ifdef ECHOCARD_HAS_OUTPUT_NOMINAL_LEVEL
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_output_nominal_level, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_output_nominal_level, chip));
+	if (err < 0)
 		goto ctl_error;
 #endif
 
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_vumeters_switch, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_vumeters_switch, chip));
+	if (err < 0)
 		goto ctl_error;
 
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_vumeters, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_vumeters, chip));
+	if (err < 0)
 		goto ctl_error;
 
 #ifdef ECHOCARD_HAS_MONITOR
 	snd_echo_monitor_mixer.count = num_busses_in(chip) * num_busses_out(chip);
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_monitor_mixer, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_monitor_mixer, chip));
+	if (err < 0)
 		goto ctl_error;
 #endif
 
 #ifdef ECHOCARD_HAS_DIGITAL_IN_AUTOMUTE
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_automute_switch, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_automute_switch, chip));
+	if (err < 0)
 		goto ctl_error;
 #endif
 
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_channels_info, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_channels_info, chip));
+	if (err < 0)
 		goto ctl_error;
 
 #ifdef ECHOCARD_HAS_DIGITAL_MODE_SWITCH
@@ -2116,7 +2151,8 @@ static int snd_echo_probe(struct pci_dev *pci,
 		if (chip->digital_modes & (1 << i))
 			chip->digital_mode_list[chip->num_digital_modes++] = i;
 
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_digital_mode_switch, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_digital_mode_switch, chip));
+	if (err < 0)
 		goto ctl_error;
 #endif /* ECHOCARD_HAS_DIGITAL_MODE_SWITCH */
 
@@ -2129,20 +2165,24 @@ static int snd_echo_probe(struct pci_dev *pci,
 
 	if (chip->num_clock_sources > 1) {
 		chip->clock_src_ctl = snd_ctl_new1(&snd_echo_clock_source_switch, chip);
-		if ((err = snd_ctl_add(chip->card, chip->clock_src_ctl)) < 0)
+		err = snd_ctl_add(chip->card, chip->clock_src_ctl);
+		if (err < 0)
 			goto ctl_error;
 	}
 #endif /* ECHOCARD_HAS_EXTERNAL_CLOCK */
 
 #ifdef ECHOCARD_HAS_DIGITAL_IO
-	if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_spdif_mode_switch, chip))) < 0)
+	err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_spdif_mode_switch, chip));
+	if (err < 0)
 		goto ctl_error;
 #endif
 
 #ifdef ECHOCARD_HAS_PHANTOM_POWER
-	if (chip->has_phantom_power)
-		if ((err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_phantom_power_switch, chip))) < 0)
+	if (chip->has_phantom_power) {
+		err = snd_ctl_add(chip->card, snd_ctl_new1(&snd_echo_phantom_power_switch, chip));
+		if (err < 0)
 			goto ctl_error;
+	}
 #endif
 
 	err = snd_card_register(card);
diff --git a/sound/pci/echoaudio/echoaudio_dsp.c b/sound/pci/echoaudio/echoaudio_dsp.c
index d10d0e460f0b..2a40091d472c 100644
--- a/sound/pci/echoaudio/echoaudio_dsp.c
+++ b/sound/pci/echoaudio/echoaudio_dsp.c
@@ -349,7 +349,8 @@ static int load_dsp(struct echoaudio *chip, u16 *code)
 
 	/* If this board requires a resident loader, install it. */
 #ifdef DSP_56361
-	if ((i = install_resident_loader(chip)) < 0)
+	i = install_resident_loader(chip);
+	if (i < 0)
 		return i;
 #endif
 
@@ -495,7 +496,8 @@ static int load_firmware(struct echoaudio *chip)
 
 	/* See if the ASIC is present and working - only if the DSP is already loaded */
 	if (chip->dsp_code) {
-		if ((box_type = check_asic_status(chip)) >= 0)
+		box_type = check_asic_status(chip);
+		if (box_type >= 0)
 			return box_type;
 		/* ASIC check failed; force the DSP to reload */
 		chip->dsp_code = NULL;
@@ -509,7 +511,8 @@ static int load_firmware(struct echoaudio *chip)
 	if (err < 0)
 		return err;
 
-	if ((box_type = load_asic(chip)) < 0)
+	box_type = load_asic(chip);
+	if (box_type < 0)
 		return box_type;	/* error */
 
 	return box_type;
@@ -667,7 +670,8 @@ static int restore_dsp_rettings(struct echoaudio *chip)
 {
 	int i, o, err;
 
-	if ((err = check_asic_status(chip)) < 0)
+	err = check_asic_status(chip);
+	if (err < 0)
 		return err;
 
 	/* Gina20/Darla20 only. Should be harmless for other cards. */
diff --git a/sound/pci/echoaudio/echoaudio_gml.c b/sound/pci/echoaudio/echoaudio_gml.c
index eea6fe530ab4..248983fa2959 100644
--- a/sound/pci/echoaudio/echoaudio_gml.c
+++ b/sound/pci/echoaudio/echoaudio_gml.c
@@ -194,7 +194,8 @@ static int set_professional_spdif(struct echoaudio *chip, char prof)
 		}
 	}
 
-	if ((err = write_control_reg(chip, control_reg, false)))
+	err = write_control_reg(chip, control_reg, false);
+	if (err)
 		return err;
 	chip->professional_spdif = prof;
 	dev_dbg(chip->card->dev, "set_professional_spdif to %s\n",
diff --git a/sound/pci/echoaudio/gina20_dsp.c b/sound/pci/echoaudio/gina20_dsp.c
index b2377573de09..c93939850357 100644
--- a/sound/pci/echoaudio/gina20_dsp.c
+++ b/sound/pci/echoaudio/gina20_dsp.c
@@ -40,7 +40,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != GINA20))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
@@ -58,7 +59,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	chip->input_clock_types = ECHO_CLOCK_BIT_INTERNAL |
 		ECHO_CLOCK_BIT_SPDIF;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
diff --git a/sound/pci/echoaudio/gina24_dsp.c b/sound/pci/echoaudio/gina24_dsp.c
index 8eff2b4f5ceb..56e9d1b9b330 100644
--- a/sound/pci/echoaudio/gina24_dsp.c
+++ b/sound/pci/echoaudio/gina24_dsp.c
@@ -44,7 +44,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != GINA24))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
@@ -74,7 +75,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 			ECHOCAPS_HAS_DIGITAL_MODE_SPDIF_CDROM;
 	}
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
diff --git a/sound/pci/echoaudio/indigo_dsp.c b/sound/pci/echoaudio/indigo_dsp.c
index c97dc83bbbdf..16eb082df56a 100644
--- a/sound/pci/echoaudio/indigo_dsp.c
+++ b/sound/pci/echoaudio/indigo_dsp.c
@@ -41,7 +41,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != INDIGO))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
@@ -56,7 +57,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	chip->asic_loaded = true;
 	chip->input_clock_types = ECHO_CLOCK_BIT_INTERNAL;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
diff --git a/sound/pci/echoaudio/indigodj_dsp.c b/sound/pci/echoaudio/indigodj_dsp.c
index 2428b35f45d6..17a1d888d0b9 100644
--- a/sound/pci/echoaudio/indigodj_dsp.c
+++ b/sound/pci/echoaudio/indigodj_dsp.c
@@ -41,7 +41,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != INDIGO_DJ))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
@@ -56,7 +57,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	chip->asic_loaded = true;
 	chip->input_clock_types = ECHO_CLOCK_BIT_INTERNAL;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
diff --git a/sound/pci/echoaudio/indigoio_dsp.c b/sound/pci/echoaudio/indigoio_dsp.c
index 79b68ba70936..791787aa0744 100644
--- a/sound/pci/echoaudio/indigoio_dsp.c
+++ b/sound/pci/echoaudio/indigoio_dsp.c
@@ -41,7 +41,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != INDIGO_IO))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
@@ -56,7 +57,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	chip->asic_loaded = true;
 	chip->input_clock_types = ECHO_CLOCK_BIT_INTERNAL;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
diff --git a/sound/pci/echoaudio/layla20_dsp.c b/sound/pci/echoaudio/layla20_dsp.c
index 5e5b6e288a2d..5fb5c4a4598b 100644
--- a/sound/pci/echoaudio/layla20_dsp.c
+++ b/sound/pci/echoaudio/layla20_dsp.c
@@ -43,7 +43,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != LAYLA20))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
@@ -60,7 +61,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	chip->output_clock_types =
 		ECHO_CLOCK_BIT_WORD | ECHO_CLOCK_BIT_SUPER;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
diff --git a/sound/pci/echoaudio/layla24_dsp.c b/sound/pci/echoaudio/layla24_dsp.c
index c02bc1dcc170..ef27805d63f6 100644
--- a/sound/pci/echoaudio/layla24_dsp.c
+++ b/sound/pci/echoaudio/layla24_dsp.c
@@ -43,7 +43,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != LAYLA24))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
@@ -62,11 +63,13 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 		ECHOCAPS_HAS_DIGITAL_MODE_SPDIF_OPTICAL |
 		ECHOCAPS_HAS_DIGITAL_MODE_ADAT;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
-	if ((err = init_line_levels(chip)) < 0)
+	err = init_line_levels(chip);
+	if (err < 0)
 		return err;
 
 	return err;
diff --git a/sound/pci/echoaudio/mia_dsp.c b/sound/pci/echoaudio/mia_dsp.c
index 8f612a09c5d0..8a4dffc68889 100644
--- a/sound/pci/echoaudio/mia_dsp.c
+++ b/sound/pci/echoaudio/mia_dsp.c
@@ -44,7 +44,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != MIA))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
@@ -62,7 +63,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	chip->input_clock_types = ECHO_CLOCK_BIT_INTERNAL |
 		ECHO_CLOCK_BIT_SPDIF;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index 6045a115cffe..cb72d27e809e 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -308,8 +308,8 @@ static int snd_echo_midi_create(struct snd_card *card,
 {
 	int err;
 
-	if ((err = snd_rawmidi_new(card, card->shortname, 0, 1, 1,
-				   &chip->rmidi)) < 0)
+	err = snd_rawmidi_new(card, card->shortname, 0, 1, 1, &chip->rmidi);
+	if (err < 0)
 		return err;
 
 	strcpy(chip->rmidi->name, card->shortname);
diff --git a/sound/pci/echoaudio/mona_dsp.c b/sound/pci/echoaudio/mona_dsp.c
index f77db83dd73d..f8e7bb6ce040 100644
--- a/sound/pci/echoaudio/mona_dsp.c
+++ b/sound/pci/echoaudio/mona_dsp.c
@@ -44,7 +44,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	if (snd_BUG_ON((subdevice_id & 0xfff0) != MONA))
 		return -ENODEV;
 
-	if ((err = init_dsp_comm_page(chip))) {
+	err = init_dsp_comm_page(chip);
+	if (err) {
 		dev_err(chip->card->dev,
 			"init_hw - could not initialize DSP comm page\n");
 		return err;
@@ -67,7 +68,8 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 	else
 		chip->dsp_code_to_load = FW_MONA_301_DSP;
 
-	if ((err = load_firmware(chip)) < 0)
+	err = load_firmware(chip);
+	if (err < 0)
 		return err;
 	chip->bad_board = false;
 
-- 
2.26.2

