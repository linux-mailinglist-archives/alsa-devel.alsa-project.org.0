Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C54C217510
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 19:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBCA815E2;
	Tue,  7 Jul 2020 19:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBCA815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594142714;
	bh=Po1EXddBRcRnfactfWwkxgpW1nRoknyQ2rRe4/foGoE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XkDrGvEyJq8gduGHicgSlXfGU73lXcWD6y4IvLOb1WqH8mnNq7p8XVqhIMJGqCek/
	 0YOfMaeQkv7tfh5i7/5CKm8yipH1mFxJ3STYtLaexq//y9tQP8ywavGZb73mJRLCAs
	 wiZ29m/AgtQELyEwg7y2lr76ig9fA8F5xKewa4Ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1597CF800DF;
	Tue,  7 Jul 2020 19:23:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 391A8F8011F; Tue,  7 Jul 2020 19:23:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E51AF8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 19:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E51AF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yIsJoXc2"
Received: from embeddedor (unknown [200.39.26.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EC1020708;
 Tue,  7 Jul 2020 17:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594142602;
 bh=Po1EXddBRcRnfactfWwkxgpW1nRoknyQ2rRe4/foGoE=;
 h=Date:From:To:Cc:Subject:From;
 b=yIsJoXc2lF1/lscSH0hTwQdTXq8l6ryFpg2gzFfTuf+qppqRiBDOowzP/UfytV2yn
 hGhAkuh/z5dEnEBxdm4eSFmztwDI+Biyvb4zUS2THxKmwX9POTtsm5SY7SLJvrbHkJ
 BTMY7bXhhpWy26uE9vpQW5JD1NyAbpihPriax/Y8=
Date: Tue, 7 Jul 2020 12:28:47 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: Use fallthrough pseudo-keyword
Message-ID: <20200707172847.GA27659@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org
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

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/atmel/ac97c.c                    |   16 ++++++++--------
 sound/core/memalloc.c                  |    2 +-
 sound/core/oss/pcm_oss.c               |    2 +-
 sound/core/oss/pcm_plugin.c            |    2 +-
 sound/core/pcm_native.c                |    8 ++++----
 sound/core/seq/oss/seq_oss_timer.c     |    2 +-
 sound/core/seq/seq_midi_emul.c         |    2 +-
 sound/drivers/opl3/opl3_midi.c         |    4 ++--
 sound/isa/galaxy/galaxy.c              |    6 +++---
 sound/isa/msnd/msnd_pinnacle_mixer.c   |    3 +--
 sound/isa/opti9xx/miro.c               |   10 +++++-----
 sound/isa/opti9xx/opti92x-ad1848.c     |   12 +++++++-----
 sound/isa/sb/sb8_main.c                |   10 +++++-----
 sound/oss/dmasound/dmasound_atari.c    |    2 +-
 sound/oss/dmasound/dmasound_core.c     |    4 ++--
 sound/pci/ac97/ac97_codec.c            |    4 ++--
 sound/pci/atiixp.c                     |    6 +++---
 sound/pci/azt3328.c                    |    2 +-
 sound/pci/echoaudio/echoaudio.c        |    4 ++--
 sound/pci/emu10k1/emupcm.c             |    5 ++---
 sound/pci/hda/hda_beep.c               |    2 +-
 sound/pci/hda/patch_conexant.c         |    2 +-
 sound/pci/hda/patch_realtek.c          |    4 ++--
 sound/pci/ice1712/delta.c              |    2 +-
 sound/pci/intel8x0.c                   |    8 ++++----
 sound/pci/mixart/mixart.c              |    2 +-
 sound/pci/mixart/mixart_core.c         |    2 +-
 sound/pci/nm256/nm256.c                |    6 +++---
 sound/pci/ymfpci/ymfpci_main.c         |    2 +-
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c |    4 ++--
 sound/sparc/dbri.c                     |    8 ++++----
 sound/usb/card.c                       |    2 +-
 sound/usb/clock.c                      |    2 +-
 sound/usb/pcm.c                        |    2 +-
 sound/usb/stream.c                     |    3 +--
 35 files changed, 78 insertions(+), 79 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index a1dce9725b98..a62f1cdad68f 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -356,14 +356,14 @@ atmel_ac97c_playback_trigger(struct snd_pcm_substream *substream, int cmd)
 	camr = ac97c_readl(chip, CAMR);
 
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE: /* fall through */
-	case SNDRV_PCM_TRIGGER_RESUME: /* fall through */
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
 		ptcr = ATMEL_PDC_TXTEN;
 		camr |= AC97C_CMR_CENA | AC97C_CSR_ENDTX;
 		break;
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH: /* fall through */
-	case SNDRV_PCM_TRIGGER_SUSPEND: /* fall through */
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ptcr |= ATMEL_PDC_TXTDIS;
 		if (chip->opened <= 1)
@@ -388,14 +388,14 @@ atmel_ac97c_capture_trigger(struct snd_pcm_substream *substream, int cmd)
 	ptcr = readl(chip->regs + ATMEL_PDC_PTSR);
 
 	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE: /* fall through */
-	case SNDRV_PCM_TRIGGER_RESUME: /* fall through */
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
 		ptcr = ATMEL_PDC_RXTEN;
 		camr |= AC97C_CMR_CENA | AC97C_CSR_ENDRX;
 		break;
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH: /* fall through */
-	case SNDRV_PCM_TRIGGER_SUSPEND: /* fall through */
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ptcr |= ATMEL_PDC_RXTDIS;
 		if (chip->opened <= 1)
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index bea46ed157a6..9f3e14aebe30 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -157,7 +157,7 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 		 */
 		dmab->dev.type = SNDRV_DMA_TYPE_DEV;
 #endif /* CONFIG_GENERIC_ALLOCATOR */
-		/* fall through */
+		fallthrough;
 	case SNDRV_DMA_TYPE_DEV:
 	case SNDRV_DMA_TYPE_DEV_UC:
 		snd_malloc_dev_pages(dmab, size);
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 68630244b00f..327ec42a36b0 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2851,7 +2851,7 @@ static int snd_pcm_oss_mmap(struct file *file, struct vm_area_struct *area)
 		substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
 		if (substream)
 			break;
-		/* Fall through */
+		fallthrough;
 	case VM_READ:
 		substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
 		break;
diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 1545f8fdb4db..d5ca161d588c 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -357,7 +357,7 @@ snd_pcm_format_t snd_pcm_plug_slave_format(snd_pcm_format_t format,
 				if (snd_mask_test(format_mask, (__force int)format1))
 					return format1;
 			}
-			/* fall through */
+			fallthrough;
 		default:
 			return (__force snd_pcm_format_t)-EINVAL;
 		}
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 9630d2523948..84b140f800fd 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1903,7 +1903,7 @@ static int snd_pcm_prepare(struct snd_pcm_substream *substream,
 	switch (substream->runtime->status->state) {
 	case SNDRV_PCM_STATE_PAUSED:
 		snd_pcm_pause(substream, false);
-		/* fallthru */
+		fallthrough;
 	case SNDRV_PCM_STATE_SUSPENDED:
 		snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
 		break;
@@ -2811,7 +2811,7 @@ static int do_pcm_hwsync(struct snd_pcm_substream *substream)
 	case SNDRV_PCM_STATE_DRAINING:
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 			return -EBADFD;
-		/* Fall through */
+		fallthrough;
 	case SNDRV_PCM_STATE_RUNNING:
 		return snd_pcm_update_hw_ptr(substream);
 	case SNDRV_PCM_STATE_PREPARED:
@@ -3816,7 +3816,7 @@ static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 	case SNDRV_PCM_MMAP_OFFSET_STATUS_OLD:
 		if (pcm_file->no_compat_mmap || !IS_ENABLED(CONFIG_64BIT))
 			return -ENXIO;
-		/* fallthrough */
+		fallthrough;
 	case SNDRV_PCM_MMAP_OFFSET_STATUS_NEW:
 		if (!pcm_status_mmap_allowed(pcm_file))
 			return -ENXIO;
@@ -3824,7 +3824,7 @@ static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 	case SNDRV_PCM_MMAP_OFFSET_CONTROL_OLD:
 		if (pcm_file->no_compat_mmap || !IS_ENABLED(CONFIG_64BIT))
 			return -ENXIO;
-		/* fallthrough */
+		fallthrough;
 	case SNDRV_PCM_MMAP_OFFSET_CONTROL_NEW:
 		if (!pcm_control_mmap_allowed(pcm_file))
 			return -ENXIO;
diff --git a/sound/core/seq/oss/seq_oss_timer.c b/sound/core/seq/oss/seq_oss_timer.c
index a35d429e4c27..f9f57232a83f 100644
--- a/sound/core/seq/oss/seq_oss_timer.c
+++ b/sound/core/seq/oss/seq_oss_timer.c
@@ -79,7 +79,7 @@ snd_seq_oss_process_timer_event(struct seq_oss_timer *rec, union evrec *ev)
 		case TMR_WAIT_REL:
 			parm += rec->cur_tick;
 			rec->realtime = 0;
-			/* fall through */
+			fallthrough;
 		case TMR_WAIT_ABS:
 			if (parm == 0) {
 				rec->realtime = 1;
diff --git a/sound/core/seq/seq_midi_emul.c b/sound/core/seq/seq_midi_emul.c
index 198f285594e3..81d2ef5e5811 100644
--- a/sound/core/seq/seq_midi_emul.c
+++ b/sound/core/seq/seq_midi_emul.c
@@ -309,7 +309,7 @@ do_control(const struct snd_midi_op *ops, void *drv,
 		break;
 	case MIDI_CTL_MSB_DATA_ENTRY:
 		chan->control[MIDI_CTL_LSB_DATA_ENTRY] = 0;
-		/* fall through */
+		fallthrough;
 	case MIDI_CTL_LSB_DATA_ENTRY:
 		if (chan->param_type == SNDRV_MIDI_PARAM_TYPE_REGISTERED)
 			rpn(ops, drv, chan, chset);
diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index 2f6e8023e05c..eb23c55323ae 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -354,7 +354,7 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 			instr_4op = 1;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		spin_unlock_irqrestore(&opl3->voice_lock, flags);
 		return;
@@ -443,7 +443,7 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 		switch (connection) {
 		case 0x03:
 			snd_opl3_calc_volume(&vol_op[2], vel, chan);
-			/* fallthru */
+			fallthrough;
 		case 0x02:
 			snd_opl3_calc_volume(&vol_op[0], vel, chan);
 			break;
diff --git a/sound/isa/galaxy/galaxy.c b/sound/isa/galaxy/galaxy.c
index ce409e75ae51..65f9f46c9f58 100644
--- a/sound/isa/galaxy/galaxy.c
+++ b/sound/isa/galaxy/galaxy.c
@@ -247,7 +247,7 @@ static int snd_galaxy_match(struct device *dev, unsigned int n)
 		break;
 	case 2:
 		irq[n] = 9;
-		/* Fall through */
+		fallthrough;
 	case 9:
 		wss_config[n] |= WSS_CONFIG_IRQ_9;
 		break;
@@ -292,7 +292,7 @@ static int snd_galaxy_match(struct device *dev, unsigned int n)
 	case 1:
 		if (dma1[n] == 0)
 			break;
-		/* Fall through */
+		fallthrough;
 	default:
 		dev_err(dev, "invalid capture DMA %d\n", dma2[n]);
 		return 0;
@@ -322,7 +322,7 @@ static int snd_galaxy_match(struct device *dev, unsigned int n)
 		break;
 	case 2:
 		mpu_irq[n] = 9;
-		/* Fall through */
+		fallthrough;
 	case 9:
 		config[n] |= GALAXY_CONFIG_MPUIRQ_2;
 		break;
diff --git a/sound/isa/msnd/msnd_pinnacle_mixer.c b/sound/isa/msnd/msnd_pinnacle_mixer.c
index 02c566fca9e5..287ab740dd16 100644
--- a/sound/isa/msnd/msnd_pinnacle_mixer.c
+++ b/sound/isa/msnd/msnd_pinnacle_mixer.c
@@ -219,8 +219,7 @@ static int snd_msndmix_set(struct snd_msnd *dev, int d, int left, int right)
 	case MSND_MIXER_VOLUME:		/* master volume */
 		writew(wLeft, dev->SMA + SMA_wCurrMastVolLeft);
 		writew(wRight, dev->SMA + SMA_wCurrMastVolRight);
-		/* fall through */
-
+		fallthrough;
 	case MSND_MIXER_AUX:			/* aux pot control */
 		/* scaled by master volume */
 		/* fall through */
diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index b039429e6871..44ed1b65f6ce 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -163,13 +163,13 @@ static int aci_busy_wait(struct snd_miro_aci *aci)
 			switch (timeout-ACI_MINTIME) {
 			case 0 ... 9:
 				out /= 10;
-				/* fall through */
+				fallthrough;
 			case 10 ... 19:
 				out /= 10;
-				/* fall through */
+				fallthrough;
 			case 20 ... 30:
 				out /= 10;
-				/* fall through */
+				fallthrough;
 			default:
 				set_current_state(TASK_UNINTERRUPTIBLE);
 				schedule_timeout(out);
@@ -824,7 +824,7 @@ static unsigned char snd_miro_read(struct snd_miro *chip,
 			retval = inb(chip->mc_base + 9);
 			break;
 		}
-		/* fall through */
+		fallthrough;
 
 	case OPTi9XX_HW_82C929:
 		retval = inb(chip->mc_base + reg);
@@ -854,7 +854,7 @@ static void snd_miro_write(struct snd_miro *chip, unsigned char reg,
 			outb(value, chip->mc_base + 9);
 			break;
 		}
-		/* fall through */
+		fallthrough;
 
 	case OPTi9XX_HW_82C929:
 		outb(value, chip->mc_base + reg);
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index 0e6d20e49158..881d3b5711d2 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -249,7 +249,7 @@ static unsigned char snd_opti9xx_read(struct snd_opti9xx *chip,
 			retval = inb(chip->mc_base + 9);
 			break;
 		}
-		/* Fall through */
+		fallthrough;
 
 	case OPTi9XX_HW_82C928:
 	case OPTi9XX_HW_82C929:
@@ -292,7 +292,7 @@ static void snd_opti9xx_write(struct snd_opti9xx *chip, unsigned char reg,
 			outb(value, chip->mc_base + 9);
 			break;
 		}
-		/* Fall through */
+		fallthrough;
 
 	case OPTi9XX_HW_82C928:
 	case OPTi9XX_HW_82C929:
@@ -343,7 +343,7 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(4), 0xf0, 0xfc);
 		/* enable wave audio */
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(6), 0x02, 0x02);
-		/* Fall through */
+		fallthrough;
 
 	case OPTi9XX_HW_82C925:
 		/* enable WSS mode */
@@ -380,7 +380,8 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 	case OPTi9XX_HW_82C931:
 		/* disable 3D sound (set GPIO1 as output, low) */
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(20), 0x04, 0x0c);
-		/* fall through */
+		fallthrough;
+
 	case OPTi9XX_HW_82C933:
 		/*
 		 * The BTC 1817DW has QS1000 wavetable which is connected
@@ -392,7 +393,8 @@ static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 		 * or digital input signal.
 		 */
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(26), 0x01, 0x01);
-		/* fall through */
+		fallthrough;
+
 	case OPTi9XX_HW_82C930:
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(6), 0x02, 0x03);
 		snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(3), 0x00, 0xff);
diff --git a/sound/isa/sb/sb8_main.c b/sound/isa/sb/sb8_main.c
index e33dfe165276..86d0d2fdf48a 100644
--- a/sound/isa/sb/sb8_main.c
+++ b/sound/isa/sb/sb8_main.c
@@ -116,13 +116,13 @@ static int snd_sb8_playback_prepare(struct snd_pcm_substream *substream)
 			chip->playback_format = SB_DSP_HI_OUTPUT_AUTO;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	case SB_HW_201:
 		if (rate > 23000) {
 			chip->playback_format = SB_DSP_HI_OUTPUT_AUTO;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	case SB_HW_20:
 		chip->playback_format = SB_DSP_LO_OUTPUT_AUTO;
 		break;
@@ -261,7 +261,7 @@ static int snd_sb8_capture_prepare(struct snd_pcm_substream *substream)
 			chip->capture_format = SB_DSP_HI_INPUT_AUTO;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	case SB_HW_20:
 		chip->capture_format = SB_DSP_LO_INPUT_AUTO;
 		break;
@@ -361,7 +361,7 @@ irqreturn_t snd_sb8dsp_interrupt(struct snd_sb *chip)
 	case SB_MODE_PLAYBACK_16:	/* ok.. playback is active */
 		if (chip->hardware != SB_HW_JAZZ16)
 			break;
-		/* fall through */
+		fallthrough;
 	case SB_MODE_PLAYBACK_8:
 		substream = chip->playback_substream;
 		if (chip->playback_format == SB_DSP_OUTPUT)
@@ -371,7 +371,7 @@ irqreturn_t snd_sb8dsp_interrupt(struct snd_sb *chip)
 	case SB_MODE_CAPTURE_16:
 		if (chip->hardware != SB_HW_JAZZ16)
 			break;
-		/* fall through */
+		fallthrough;
 	case SB_MODE_CAPTURE_8:
 		substream = chip->capture_substream;
 		if (chip->capture_format == SB_DSP_INPUT)
diff --git a/sound/oss/dmasound/dmasound_atari.c b/sound/oss/dmasound/dmasound_atari.c
index 823ccfa089b2..81c6a9830727 100644
--- a/sound/oss/dmasound/dmasound_atari.c
+++ b/sound/oss/dmasound/dmasound_atari.c
@@ -1449,7 +1449,7 @@ static int FalconMixerIoctl(u_int cmd, u_long arg)
 		tt_dmasnd.input_gain =
 			RECLEVEL_VOXWARE_TO_GAIN(data & 0xff) << 4 |
 			RECLEVEL_VOXWARE_TO_GAIN(data >> 8 & 0xff);
-		/* fall through - return set value */
+		fallthrough;	/* return set value */
 	case SOUND_MIXER_READ_MIC:
 		return IOCTL_OUT(arg,
 			RECLEVEL_GAIN_TO_VOXWARE(tt_dmasnd.input_gain >> 4 & 0xf) |
diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index f802ea331e24..38f25e97538f 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -1478,13 +1478,13 @@ static int dmasound_setup(char *str)
 			printk("dmasound_setup: invalid catch radius, using default = %d\n", catchRadius);
 		else
 			catchRadius = ints[3];
-		/* fall through */
+		fallthrough;
 	case 2:
 		if (ints[1] < MIN_BUFFERS)
 			printk("dmasound_setup: invalid number of buffers, using default = %d\n", numWriteBufs);
 		else
 			numWriteBufs = ints[1];
-		/* fall through */
+		fallthrough;
 	case 1:
 		if ((size = ints[2]) < 256) /* check for small buffer specs */
 			size <<= 10 ;
diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 6758c072000e..012a7ee849e8 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -218,11 +218,11 @@ static int snd_ac97_valid_reg(struct snd_ac97 *ac97, unsigned short reg)
 	case AC97_ID_ST_AC97_ID4:
 		if (reg == 0x08)
 			return 0;
-		/* fall through */
+		fallthrough;
 	case AC97_ID_ST7597:
 		if (reg == 0x22 || reg == 0x7a)
 			return 1;
-		/* fall through */
+		fallthrough;
 	case AC97_ID_AK4540:
 	case AC97_ID_AK4542:
 		if (reg <= 0x1c || reg == 0x20 || reg == 0x26 || reg >= 0x7c)
diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 85d3b4e95489..a25d75455802 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -896,15 +896,15 @@ static int snd_atiixp_playback_prepare(struct snd_pcm_substream *substream)
 	case 8:
 		data |= ATI_REG_OUT_DMA_SLOT_BIT(10) |
 			ATI_REG_OUT_DMA_SLOT_BIT(11);
-		/* fall through */
+		fallthrough;
 	case 6:
 		data |= ATI_REG_OUT_DMA_SLOT_BIT(7) |
 			ATI_REG_OUT_DMA_SLOT_BIT(8);
-		/* fall through */
+		fallthrough;
 	case 4:
 		data |= ATI_REG_OUT_DMA_SLOT_BIT(6) |
 			ATI_REG_OUT_DMA_SLOT_BIT(9);
-		/* fall through */
+		fallthrough;
 	default:
 		data |= ATI_REG_OUT_DMA_SLOT_BIT(3) |
 			ATI_REG_OUT_DMA_SLOT_BIT(4);
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 58167d8469e1..77c7030ebbfa 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -1232,7 +1232,7 @@ snd_azf3328_codec_setfmt(struct snd_azf3328_codec_data *codec,
 	case AZF_FREQ_32000: freq = SOUNDFORMAT_FREQ_32000; break;
 	default:
 		snd_printk(KERN_WARNING "unknown bitrate %d, assuming 44.1kHz!\n", bitrate);
-		/* fall-through */
+		fallthrough;
 	case AZF_FREQ_44100: freq = SOUNDFORMAT_FREQ_44100; break;
 	case AZF_FREQ_48000: freq = SOUNDFORMAT_FREQ_48000; break;
 	case AZF_FREQ_66200: freq = SOUNDFORMAT_FREQ_SUSPECTED_66200; break;
diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 0941a7a17623..6c285380b150 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -690,7 +690,7 @@ static int pcm_prepare(struct snd_pcm_substream *substream)
 		break;
 	case SNDRV_PCM_FORMAT_S32_BE:
 		format.data_are_bigendian = 1;
-		/* fall through */
+		fallthrough;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		format.bits_per_sample = 32;
 		break;
@@ -742,7 +742,7 @@ static int pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 					pipe->last_counter = 0;
 					pipe->position = 0;
 					*pipe->dma_counter = 0;
-					/* fall through */
+					fallthrough;
 				case PIPE_STATE_PAUSED:
 					pipe->state = PIPE_STATE_STARTED;
 					break;
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index b934c6ac52dd..b2ddabb99438 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -753,7 +753,7 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 		snd_emu10k1_playback_invalidate_cache(emu, 1, epcm->extra);	/* do we need this? */
 		snd_emu10k1_playback_invalidate_cache(emu, 0, epcm->voices[0]);
-		/* fall through */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		if (cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
@@ -902,8 +902,7 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 			snd_emu10k1_playback_invalidate_cache(emu, 0, epcm->voices[i]);
 		}
 		snd_emu10k1_playback_invalidate_cache(emu, 1, epcm->extra);
-
-		/* fall through */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		snd_emu10k1_playback_prepare_voice(emu, epcm->extra, 1, 1, NULL);
diff --git a/sound/pci/hda/hda_beep.c b/sound/pci/hda/hda_beep.c
index 841523f6b88d..53a2b89f8983 100644
--- a/sound/pci/hda/hda_beep.c
+++ b/sound/pci/hda/hda_beep.c
@@ -102,7 +102,7 @@ static int snd_hda_beep_event(struct input_dev *dev, unsigned int type,
 	case SND_BELL:
 		if (hz)
 			hz = 1000;
-		/* fallthru */
+		fallthrough;
 	case SND_TONE:
 		if (beep->linear_tone)
 			beep->tone = beep_linear_tone(beep, hz);
diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 396b5503038a..9002888670f9 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -1014,7 +1014,7 @@ static int patch_conexant_auto(struct hda_codec *codec)
 		break;
 	case 0x14f150f2:
 		codec->power_save_node = 1;
-		/* Fall through */
+		fallthrough;
 	default:
 		codec->pin_amp_workaround = 1;
 		snd_hda_pick_fixup(codec, cxt5066_fixup_models,
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6d73f8beadb6..fcd303b696e7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -374,7 +374,7 @@ static void alc_fill_eapd_coef(struct hda_codec *codec)
 	case 0x10ec0295:
 	case 0x10ec0299:
 		alc_update_coef_idx(codec, 0x67, 0xf000, 0x3000);
-		/* fallthrough */
+		fallthrough;
 	case 0x10ec0215:
 	case 0x10ec0233:
 	case 0x10ec0235:
@@ -4709,7 +4709,7 @@ static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
 		break;
 	case 0x10ec0867:
 		alc_update_coefex_idx(codec, 0x57, 0x5, 0, 1<<14);
-		/* fallthru */
+		fallthrough;
 	case 0x10ec0221:
 	case 0x10ec0662:
 		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
diff --git a/sound/pci/ice1712/delta.c b/sound/pci/ice1712/delta.c
index 81929063b2fa..1d2a0287284b 100644
--- a/sound/pci/ice1712/delta.c
+++ b/sound/pci/ice1712/delta.c
@@ -691,7 +691,7 @@ static int snd_ice1712_delta_init(struct snd_ice1712 *ice)
 		break;
 	case ICE1712_SUBDEVICE_DELTADIO2496:
 		ice->gpio.set_pro_rate = delta_1010_set_rate_val;
-		/* fall thru */
+		fallthrough;
 	case ICE1712_SUBDEVICE_DELTA66:
 		ice->spdif.ops.open = delta_open_spdif;
 		ice->spdif.ops.setup_rate = delta_setup_spdif;
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 1781a1c081c3..675bb0da00a0 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -810,7 +810,7 @@ static int snd_intel8x0_pcm_trigger(struct snd_pcm_substream *substream, int cmd
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 		ichdev->suspended = 0;
-		/* fall through */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		val = ICH_IOCE | ICH_STARTBM;
@@ -818,7 +818,7 @@ static int snd_intel8x0_pcm_trigger(struct snd_pcm_substream *substream, int cmd
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		ichdev->suspended = 1;
-		/* fall through */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 		val = 0;
 		break;
@@ -852,7 +852,7 @@ static int snd_intel8x0_ali_trigger(struct snd_pcm_substream *substream, int cmd
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 		ichdev->suspended = 0;
-		/* fall through */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -869,7 +869,7 @@ static int snd_intel8x0_ali_trigger(struct snd_pcm_substream *substream, int cmd
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		ichdev->suspended = 1;
-		/* fall through */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		/* pause */
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index 7ba487443c7f..efff220b26ea 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -169,7 +169,7 @@ static int mixart_set_clock(struct mixart_mgr *mgr,
 	case PIPE_RUNNING:
 		if(rate != 0)
 			break;
-		/* fall through */
+		fallthrough;
 	default:
 		if(rate == 0)
 			return 0; /* nothing to do */
diff --git a/sound/pci/mixart/mixart_core.c b/sound/pci/mixart/mixart_core.c
index 048a2660d18d..0bdd33b0af65 100644
--- a/sound/pci/mixart/mixart_core.c
+++ b/sound/pci/mixart/mixart_core.c
@@ -527,7 +527,7 @@ irqreturn_t snd_mixart_threaded_irq(int irq, void *dev_id)
 				dev_err(&mgr->pci->dev,
 					"canceled notification %x !\n", msg);
 			}
-			/* fall through */
+			fallthrough;
 		case MSG_TYPE_ANSWER:
 			/* answer or notification to a message we are waiting for*/
 			mutex_lock(&mgr->msg_lock);
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index ebce4d259e06..240195e85e3d 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -560,7 +560,7 @@ snd_nm256_playback_trigger(struct snd_pcm_substream *substream, int cmd)
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 		s->suspended = 0;
-		/* fallthru */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 		if (! s->running) {
 			snd_nm256_playback_start(chip, s, substream);
@@ -569,7 +569,7 @@ snd_nm256_playback_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		s->suspended = 1;
-		/* fallthru */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 		if (s->running) {
 			snd_nm256_playback_stop(chip);
@@ -1664,7 +1664,7 @@ static int snd_nm256_probe(struct pci_dev *pci,
 			return -ENODEV;
 		case NM_RESET_WORKAROUND_2:
 			reset_workaround_2 = 1;
-			/* Fall-through */
+			fallthrough;
 		case NM_RESET_WORKAROUND:
 			reset_workaround = 1;
 			break;
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index db7d76a3cfeb..cacc6a9d14c8 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -400,7 +400,7 @@ static int snd_ymfpci_playback_trigger(struct snd_pcm_substream *substream,
 			kctl = chip->pcm_mixer[substream->number].ctl;
 			kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 		}
-		/* fall through */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		chip->ctrl_playback[ypcm->voices[0]->number + 1] = 0;
diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
index 6cbe5cb34358..dfc4295b69c4 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
@@ -45,7 +45,7 @@ static int pdacf_pcm_trigger(struct snd_pcm_substream *subs, int cmd)
 	case SNDRV_PCM_TRIGGER_START:
 		chip->pcm_hwptr = 0;
 		chip->pcm_tdone = 0;
-		/* fall thru */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		mask = 0;
@@ -132,7 +132,7 @@ static int pdacf_pcm_prepare(struct snd_pcm_substream *subs)
 	case SNDRV_PCM_FORMAT_S24_3LE:
 	case SNDRV_PCM_FORMAT_S24_3BE:
 		chip->pcm_sample = 3;
-		/* fall through */
+		fallthrough;
 	default: /* 24-bit */
 		aval = AK4117_DIF_24R;
 		chip->pcm_frame = 3;
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index cf7049999261..17b79d45d17f 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -580,16 +580,16 @@ static __u32 reverse_bytes(__u32 b, int len)
 	switch (len) {
 	case 32:
 		b = ((b & 0xffff0000) >> 16) | ((b & 0x0000ffff) << 16);
-		/* fall through */
+		fallthrough;
 	case 16:
 		b = ((b & 0xff00ff00) >> 8) | ((b & 0x00ff00ff) << 8);
-		/* fall through */
+		fallthrough;
 	case 8:
 		b = ((b & 0xf0f0f0f0) >> 4) | ((b & 0x0f0f0f0f) << 4);
-		/* fall through */
+		fallthrough;
 	case 4:
 		b = ((b & 0xcccccccc) >> 2) | ((b & 0x33333333) << 2);
-		/* fall through */
+		fallthrough;
 	case 2:
 		b = ((b & 0xaaaaaaaa) >> 1) | ((b & 0x55555555) << 1);
 	case 1:
diff --git a/sound/usb/card.c b/sound/usb/card.c
index 162bdd6eb4d4..696e788c5d31 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -230,7 +230,7 @@ static int snd_usb_create_streams(struct snd_usb_audio *chip, int ctrlif)
 		dev_warn(&dev->dev,
 			 "unknown interface protocol %#02x, assuming v1\n",
 			 protocol);
-		/* fall through */
+		fallthrough;
 
 	case UAC_VERSION_1: {
 		struct uac1_ac_header_descriptor *h1;
diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index b118cf97607f..f3ca59005d91 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -670,7 +670,7 @@ int snd_usb_init_sample_rate(struct snd_usb_audio *chip, int iface,
 			else
 				return 0;
 		}
-	/* fall through */
+		fallthrough;
 	case UAC_VERSION_2:
 		return set_sample_rate_v2v3(chip, iface, alts, fmt, rate);
 	}
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 8a05dcb1344f..6282c539bbb4 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1741,7 +1741,7 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		subs->trigger_tstamp_pending_update = true;
-		/* fall through */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		subs->data_endpoint->prepare_data_urb = prepare_playback_urb;
 		subs->data_endpoint->retire_data_urb = retire_playback_urb;
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 15296f2c902c..4d1e6579e54d 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1146,9 +1146,8 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 			dev_dbg(&dev->dev, "%u:%d: unknown interface protocol %#02x, assuming v1\n",
 				iface_no, altno, protocol);
 			protocol = UAC_VERSION_1;
-			/* fall through */
+			fallthrough;
 		case UAC_VERSION_1:
-			/* fall through */
 		case UAC_VERSION_2: {
 			int bm_quirk = 0;
 

