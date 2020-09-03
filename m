Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C66425BF5B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 12:49:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA75718FA;
	Thu,  3 Sep 2020 12:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA75718FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599130149;
	bh=uEXZL9gVWGsJokjzjCrROPDZ8x28vPt0k5+5lYfEnQw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VSNxIO8o6UEv6JuR9clmePQPbUH/0igx26PimLv0/TKveHQ637U9eMpJmyXP7nakw
	 LeSkRHtcauUIzjE7egGXONvqhLK+9KhXB/EQkWyBNMW0Qt8hxaXuOP3PAxQEkBh8OX
	 Hr1PdWSfQmOEdvxwVArcWtf8S5aSuNbcb3+n6Xq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FF82F8032A;
	Thu,  3 Sep 2020 12:42:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14ACDF802FB; Thu,  3 Sep 2020 12:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB723F802BC
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 12:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB723F802BC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D52C3B150;
 Thu,  3 Sep 2020 10:41:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/11] ALSA: hdsp: Replace tasklet with work
Date: Thu,  3 Sep 2020 12:41:26 +0200
Message-Id: <20200903104131.21097-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200903104131.21097-1-tiwai@suse.de>
References: <20200903104131.21097-1-tiwai@suse.de>
Cc: Clemens Ladisch <clemens@ladisch.de>
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

The tasklet is an old API that should be deprecated, usually can be
converted to another decent API.  In HDSP driver, a tasklet is still
used for offloading the MIDI I/O handling (optional via mixer
switch).  It can be achieved gracefully with a work queued, too.

This patch replaces the tasklet usage in HDSP driver with a simple
work.  The conversion is fairly straightforward.  The only significant
difference is that a superfluous tasklet_kill() call is removed from
snd_hdap_midi_input_trigger().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c | 55 ++++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index dda56ecfd33b..cea53a878c36 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -447,8 +447,8 @@ struct hdsp {
 	struct snd_pcm_substream *capture_substream;
 	struct snd_pcm_substream *playback_substream;
         struct hdsp_midi      midi[2];
-	struct tasklet_struct midi_tasklet;
-	int		      use_midi_tasklet;
+	struct work_struct    midi_work;
+	int		      use_midi_work;
 	int                   precise_ptr;
 	u32                   control_register;	     /* cached value */
 	u32                   control2_register;     /* cached value */
@@ -1385,7 +1385,6 @@ static void snd_hdsp_midi_input_trigger(struct snd_rawmidi_substream *substream,
 		}
 	} else {
 		hdsp->control_register &= ~ie;
-		tasklet_kill(&hdsp->midi_tasklet);
 	}
 
 	hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
@@ -2542,37 +2541,37 @@ static int snd_hdsp_put_precise_pointer(struct snd_kcontrol *kcontrol, struct sn
 	return change;
 }
 
-#define HDSP_USE_MIDI_TASKLET(xname, xindex) \
+#define HDSP_USE_MIDI_WORK(xname, xindex) \
 { .iface = SNDRV_CTL_ELEM_IFACE_CARD, \
   .name = xname, \
   .index = xindex, \
-  .info = snd_hdsp_info_use_midi_tasklet, \
-  .get = snd_hdsp_get_use_midi_tasklet, \
-  .put = snd_hdsp_put_use_midi_tasklet \
+  .info = snd_hdsp_info_use_midi_work, \
+  .get = snd_hdsp_get_use_midi_work, \
+  .put = snd_hdsp_put_use_midi_work \
 }
 
-static int hdsp_set_use_midi_tasklet(struct hdsp *hdsp, int use_tasklet)
+static int hdsp_set_use_midi_work(struct hdsp *hdsp, int use_work)
 {
-	if (use_tasklet)
-		hdsp->use_midi_tasklet = 1;
+	if (use_work)
+		hdsp->use_midi_work = 1;
 	else
-		hdsp->use_midi_tasklet = 0;
+		hdsp->use_midi_work = 0;
 	return 0;
 }
 
-#define snd_hdsp_info_use_midi_tasklet		snd_ctl_boolean_mono_info
+#define snd_hdsp_info_use_midi_work		snd_ctl_boolean_mono_info
 
-static int snd_hdsp_get_use_midi_tasklet(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
+static int snd_hdsp_get_use_midi_work(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct hdsp *hdsp = snd_kcontrol_chip(kcontrol);
 
 	spin_lock_irq(&hdsp->lock);
-	ucontrol->value.integer.value[0] = hdsp->use_midi_tasklet;
+	ucontrol->value.integer.value[0] = hdsp->use_midi_work;
 	spin_unlock_irq(&hdsp->lock);
 	return 0;
 }
 
-static int snd_hdsp_put_use_midi_tasklet(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
+static int snd_hdsp_put_use_midi_work(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct hdsp *hdsp = snd_kcontrol_chip(kcontrol);
 	int change;
@@ -2582,8 +2581,8 @@ static int snd_hdsp_put_use_midi_tasklet(struct snd_kcontrol *kcontrol, struct s
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
 	spin_lock_irq(&hdsp->lock);
-	change = (int)val != hdsp->use_midi_tasklet;
-	hdsp_set_use_midi_tasklet(hdsp, val);
+	change = (int)val != hdsp->use_midi_work;
+	hdsp_set_use_midi_work(hdsp, val);
 	spin_unlock_irq(&hdsp->lock);
 	return change;
 }
@@ -2950,7 +2949,7 @@ HDSP_SPDIF_SYNC_CHECK("SPDIF Lock Status", 0),
 HDSP_ADATSYNC_SYNC_CHECK("ADAT Sync Lock Status", 0),
 HDSP_TOGGLE_SETTING("Line Out", HDSP_LineOut),
 HDSP_PRECISE_POINTER("Precise Pointer", 0),
-HDSP_USE_MIDI_TASKLET("Use Midi Tasklet", 0),
+HDSP_USE_MIDI_WORK("Use Midi Tasklet", 0),
 };
 
 
@@ -3370,7 +3369,7 @@ snd_hdsp_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 	snd_iprintf(buffer, "MIDI1 Input status: 0x%x\n", hdsp_read(hdsp, HDSP_midiStatusIn0));
 	snd_iprintf(buffer, "MIDI2 Output status: 0x%x\n", hdsp_read(hdsp, HDSP_midiStatusOut1));
 	snd_iprintf(buffer, "MIDI2 Input status: 0x%x\n", hdsp_read(hdsp, HDSP_midiStatusIn1));
-	snd_iprintf(buffer, "Use Midi Tasklet: %s\n", hdsp->use_midi_tasklet ? "on" : "off");
+	snd_iprintf(buffer, "Use Midi Tasklet: %s\n", hdsp->use_midi_work ? "on" : "off");
 
 	snd_iprintf(buffer, "\n");
 
@@ -3791,9 +3790,9 @@ static int snd_hdsp_set_defaults(struct hdsp *hdsp)
 	return 0;
 }
 
-static void hdsp_midi_tasklet(struct tasklet_struct *t)
+static void hdsp_midi_work(struct work_struct *work)
 {
-	struct hdsp *hdsp = from_tasklet(hdsp, t, midi_tasklet);
+	struct hdsp *hdsp = container_of(work, struct hdsp, midi_work);
 
 	if (hdsp->midi[0].pending)
 		snd_hdsp_midi_input_read (&hdsp->midi[0]);
@@ -3838,7 +3837,7 @@ static irqreturn_t snd_hdsp_interrupt(int irq, void *dev_id)
 	}
 
 	if (midi0 && midi0status) {
-		if (hdsp->use_midi_tasklet) {
+		if (hdsp->use_midi_work) {
 			/* we disable interrupts for this input until processing is done */
 			hdsp->control_register &= ~HDSP_Midi0InterruptEnable;
 			hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
@@ -3849,7 +3848,7 @@ static irqreturn_t snd_hdsp_interrupt(int irq, void *dev_id)
 		}
 	}
 	if (hdsp->io_type != Multiface && hdsp->io_type != RPM && hdsp->io_type != H9632 && midi1 && midi1status) {
-		if (hdsp->use_midi_tasklet) {
+		if (hdsp->use_midi_work) {
 			/* we disable interrupts for this input until processing is done */
 			hdsp->control_register &= ~HDSP_Midi1InterruptEnable;
 			hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
@@ -3859,8 +3858,8 @@ static irqreturn_t snd_hdsp_interrupt(int irq, void *dev_id)
 			snd_hdsp_midi_input_read (&hdsp->midi[1]);
 		}
 	}
-	if (hdsp->use_midi_tasklet && schedule)
-		tasklet_schedule(&hdsp->midi_tasklet);
+	if (hdsp->use_midi_work && schedule)
+		queue_work(system_highpri_wq, &hdsp->midi_work);
 	return IRQ_HANDLED;
 }
 
@@ -5182,7 +5181,7 @@ static int snd_hdsp_create(struct snd_card *card,
 
 	spin_lock_init(&hdsp->lock);
 
-	tasklet_setup(&hdsp->midi_tasklet, hdsp_midi_tasklet);
+	INIT_WORK(&hdsp->midi_work, hdsp_midi_work);
 
 	pci_read_config_word(hdsp->pci, PCI_CLASS_REVISION, &hdsp->firmware_rev);
 	hdsp->firmware_rev &= 0xff;
@@ -5235,7 +5234,7 @@ static int snd_hdsp_create(struct snd_card *card,
 	hdsp->irq = pci->irq;
 	card->sync_irq = hdsp->irq;
 	hdsp->precise_ptr = 0;
-	hdsp->use_midi_tasklet = 1;
+	hdsp->use_midi_work = 1;
 	hdsp->dds_value = 0;
 
 	if ((err = snd_hdsp_initialize_memory(hdsp)) < 0)
@@ -5305,7 +5304,7 @@ static int snd_hdsp_free(struct hdsp *hdsp)
 {
 	if (hdsp->port) {
 		/* stop the audio, and cancel all interrupts */
-		tasklet_kill(&hdsp->midi_tasklet);
+		cancel_work_sync(&hdsp->midi_work);
 		hdsp->control_register &= ~(HDSP_Start|HDSP_AudioInterruptEnable|HDSP_Midi0InterruptEnable|HDSP_Midi1InterruptEnable);
 		hdsp_write (hdsp, HDSP_controlRegister, hdsp->control_register);
 	}
-- 
2.16.4

