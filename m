Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 785DD382D32
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 15:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84E6167F;
	Mon, 17 May 2021 15:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84E6167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621257507;
	bh=PWg/EkvYrzXgt6HZBZqW+TajTj3lKJEbfp+9YYPLXCs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLyEQn+ypDG726Q+krQ9UrKXSikRwxEF/3wUhYJbgJq+x888fcMGyNT6fHMHSl7Vq
	 hjY5Z0DeFPUFKR2iaPpBeJN3PXD45BNLWm952IpBl972Q/KD+pcfRSOmWL7K1jpUbg
	 OVF5R1KSAU7kEymLOO1tgWiRTv/FPac5H8iwQPkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1A3BF804B0;
	Mon, 17 May 2021 15:16:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D918AF804AB; Mon, 17 May 2021 15:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 288F6F8029B
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 288F6F8029B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66037B1C6
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 13:15:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/11] ALSA: usx2y: Coding style fixes
Date: Mon, 17 May 2021 15:15:37 +0200
Message-Id: <20210517131545.27252-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210517131545.27252-1-tiwai@suse.de>
References: <20210517131545.27252-1-tiwai@suse.de>
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

This patch fixes various trivial coding-style issues in usx2y code,
such as:
* the assginments in if condition
* comparison order with constants
* NULL / zero checks
* unsigned -> unsigned int
* addition of braces in control blocks
* debug print with function names
* move local variables in block into function head
* reduction of too nested indentations

No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/us122l.c        |  25 ++--
 sound/usb/usx2y/us122l.h        |   2 +-
 sound/usb/usx2y/usX2Yhwdep.c    |  38 ++---
 sound/usb/usx2y/usb_stream.c    |  32 +++--
 sound/usb/usx2y/usb_stream.h    |  23 ++--
 sound/usb/usx2y/usbusx2y.c      | 122 ++++++++--------
 sound/usb/usx2y/usbusx2y.h      |   2 +-
 sound/usb/usx2y/usbusx2yaudio.c | 220 +++++++++++++++--------------
 sound/usb/usx2y/usx2yhwdeppcm.c | 237 +++++++++++++++++---------------
 9 files changed, 381 insertions(+), 320 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index 53e7eb4480b3..0b0a87a631a0 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -114,9 +114,9 @@ static vm_fault_t usb_stream_hwdep_vm_fault(struct vm_fault *vmf)
 		goto unlock;
 
 	offset = vmf->pgoff << PAGE_SHIFT;
-	if (offset < PAGE_ALIGN(s->read_size))
+	if (offset < PAGE_ALIGN(s->read_size)) {
 		vaddr = (char *)s + offset;
-	else {
+	} else {
 		offset -= PAGE_ALIGN(s->read_size);
 		if (offset >= PAGE_ALIGN(s->write_size))
 			goto unlock;
@@ -238,7 +238,7 @@ static __poll_t usb_stream_hwdep_poll(struct snd_hwdep *hw,
 					  struct file *file, poll_table *wait)
 {
 	struct us122l	*us122l = hw->private_data;
-	unsigned	*polled;
+	unsigned int	*polled;
 	__poll_t	mask;
 
 	poll_wait(file, &us122l->sk.sleep, wait);
@@ -255,8 +255,9 @@ static __poll_t usb_stream_hwdep_poll(struct snd_hwdep *hw,
 			if (*polled != s->periods_done) {
 				*polled = s->periods_done;
 				mask = EPOLLIN | EPOLLOUT | EPOLLWRNORM;
-			} else
+			} else {
 				mask = 0;
+			}
 		}
 		mutex_unlock(&us122l->mutex);
 	}
@@ -294,11 +295,11 @@ static int us122l_set_sample_rate(struct usb_device *dev, int rate)
 }
 
 static bool us122l_start(struct us122l *us122l,
-			 unsigned rate, unsigned period_frames)
+			 unsigned int rate, unsigned int period_frames)
 {
 	struct list_head *p;
 	int err;
-	unsigned use_packsize = 0;
+	unsigned int use_packsize = 0;
 	bool success = false;
 
 	if (us122l->dev->speed == USB_SPEED_HIGH) {
@@ -331,7 +332,7 @@ static bool us122l_start(struct us122l *us122l,
 	err = usb_stream_start(&us122l->sk);
 	if (err < 0) {
 		us122l_stop(us122l);
-		snd_printk(KERN_ERR "us122l_start error %i\n", err);
+		snd_printk(KERN_ERR "%s error %i\n", __func__, err);
 		goto out;
 	}
 	list_for_each(p, &us122l->midi_list)
@@ -342,12 +343,12 @@ static bool us122l_start(struct us122l *us122l,
 }
 
 static int usb_stream_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
-				  unsigned cmd, unsigned long arg)
+				  unsigned int cmd, unsigned long arg)
 {
 	struct usb_stream_config cfg;
 	struct us122l *us122l = hw->private_data;
 	struct usb_stream *s;
-	unsigned min_period_frames;
+	unsigned int min_period_frames;
 	int err = 0;
 	bool high_speed;
 
@@ -388,9 +389,9 @@ static int usb_stream_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 
 	mutex_lock(&us122l->mutex);
 	s = us122l->sk.s;
-	if (!us122l->master)
+	if (!us122l->master) {
 		us122l->master = file;
-	else if (us122l->master != file) {
+	} else if (us122l->master != file) {
 		if (!s || memcmp(&cfg, &s->cfg, sizeof(cfg))) {
 			err = -EIO;
 			goto unlock;
@@ -490,7 +491,7 @@ static void snd_us122l_free(struct snd_card *card)
 	struct us122l	*us122l = US122L(card);
 	int		index = us122l->card_index;
 
-	if (index >= 0  &&  index < SNDRV_CARDS)
+	if (index >= 0 && index < SNDRV_CARDS)
 		snd_us122l_card_used[index] = 0;
 }
 
diff --git a/sound/usb/usx2y/us122l.h b/sound/usb/usx2y/us122l.h
index 34bea99d343c..c32ae5e981e9 100644
--- a/sound/usb/usx2y/us122l.h
+++ b/sound/usb/usx2y/us122l.h
@@ -11,7 +11,7 @@ struct us122l {
 
 	struct mutex		mutex;
 	struct file		*first;
-	unsigned		second_periods_polled;
+	unsigned int		second_periods_polled;
 	struct file		*master;
 	struct file		*slave;
 	struct list_head	midi_list;
diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
index 90246518dbdd..2d4e943be2da 100644
--- a/sound/usb/usx2y/usX2Yhwdep.c
+++ b/sound/usb/usx2y/usX2Yhwdep.c
@@ -85,7 +85,7 @@ static __poll_t snd_us428ctls_poll(struct snd_hwdep *hw, struct file *file, poll
 
 	poll_wait(file, &us428->us428ctls_wait_queue_head, wait);
 
-	if (shm != NULL && shm->ctl_snapshot_last != shm->ctl_snapshot_red)
+	if (shm && shm->ctl_snapshot_last != shm->ctl_snapshot_red)
 		mask |= EPOLLIN;
 
 	return mask;
@@ -114,7 +114,7 @@ static int snd_usx2y_hwdep_dsp_status(struct snd_hwdep *hw,
 		id = USX2Y_TYPE_428;
 		break;
 	}
-	if (0 > id)
+	if (id < 0)
 		return -ENODEV;
 	strcpy(info->id, type_ids[id]);
 	info->num_dsps = 2;		// 0: Prepad Data, 1: FPGA Code
@@ -158,7 +158,7 @@ static int usx2y_create_usbmidi(struct snd_card *card)
 		le16_to_cpu(dev->descriptor.idProduct) == USB_ID_US428 ?
 		&quirk_2 : &quirk_1;
 
-	snd_printdd("usx2y_create_usbmidi\n");
+	snd_printdd("%s\n", __func__);
 	return snd_usbmidi_create(card, iface, &usx2y(card)->midi_list, quirk);
 }
 
@@ -166,20 +166,21 @@ static int usx2y_create_alsa_devices(struct snd_card *card)
 {
 	int err;
 
-	do {
-		if ((err = usx2y_create_usbmidi(card)) < 0) {
-			snd_printk(KERN_ERR "usx2y_create_alsa_devices: usx2y_create_usbmidi error %i\n", err);
-			break;
-		}
-		if ((err = usx2y_audio_create(card)) < 0)
-			break;
-		if ((err = usx2y_hwdep_pcm_new(card)) < 0)
-			break;
-		if ((err = snd_card_register(card)) < 0)
-			break;
-	} while (0);
-
-	return err;
+	err = usx2y_create_usbmidi(card);
+	if (err < 0) {
+		snd_printk(KERN_ERR "%s: usx2y_create_usbmidi error %i\n", __func__, err);
+		return err;
+	}
+	err = usx2y_audio_create(card);
+	if (err < 0)
+		return err;
+	err = usx2y_hwdep_pcm_new(card);
+	if (err < 0)
+		return err;
+	err = snd_card_register(card);
+	if (err < 0)
+		return err;
+	return 0;
 }
 
 static int snd_usx2y_hwdep_dsp_load(struct snd_hwdep *hw,
@@ -233,7 +234,8 @@ int usx2y_hwdep_new(struct snd_card *card, struct usb_device *device)
 	int err;
 	struct snd_hwdep *hw;
 
-	if ((err = snd_hwdep_new(card, SND_USX2Y_LOADER_ID, 0, &hw)) < 0)
+	err = snd_hwdep_new(card, SND_USX2Y_LOADER_ID, 0, &hw);
+	if (err < 0)
 		return err;
 
 	hw->iface = SNDRV_HWDEP_IFACE_USX2Y;
diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
index 2d4934b68083..820647331aba 100644
--- a/sound/usb/usx2y/usb_stream.c
+++ b/sound/usb/usx2y/usb_stream.c
@@ -10,7 +10,7 @@
 
 /*                             setup                                  */
 
-static unsigned usb_stream_next_packet_size(struct usb_stream_kernel *sk)
+static unsigned int usb_stream_next_packet_size(struct usb_stream_kernel *sk)
 {
 	struct usb_stream *s = sk->s;
 
@@ -44,9 +44,10 @@ static void playback_prep_freqn(struct usb_stream_kernel *sk, struct urb *urb)
 		    lb, s->period_size);
 }
 
-static int init_pipe_urbs(struct usb_stream_kernel *sk, unsigned use_packsize,
-			   struct urb **urbs, char *transfer,
-			   struct usb_device *dev, int pipe)
+static int init_pipe_urbs(struct usb_stream_kernel *sk,
+			  unsigned int use_packsize,
+			  struct urb **urbs, char *transfer,
+			  struct usb_device *dev, int pipe)
 {
 	int u, p;
 	int maxpacket = use_packsize ?
@@ -82,8 +83,8 @@ static int init_pipe_urbs(struct usb_stream_kernel *sk, unsigned use_packsize,
 	return 0;
 }
 
-static int init_urbs(struct usb_stream_kernel *sk, unsigned use_packsize,
-		      struct usb_device *dev, int in_pipe, int out_pipe)
+static int init_urbs(struct usb_stream_kernel *sk, unsigned int use_packsize,
+		     struct usb_device *dev, int in_pipe, int out_pipe)
 {
 	struct usb_stream	*s = sk->s;
 	char			*indata =
@@ -112,7 +113,7 @@ static int init_urbs(struct usb_stream_kernel *sk, unsigned use_packsize,
  * convert a sampling rate into our full speed format (fs/1000 in Q16.16)
  * this will overflow at approx 524 kHz
  */
-static inline unsigned get_usb_full_speed_rate(unsigned rate)
+static inline unsigned int get_usb_full_speed_rate(unsigned int rate)
 {
 	return ((rate << 13) + 62) / 125;
 }
@@ -121,7 +122,7 @@ static inline unsigned get_usb_full_speed_rate(unsigned rate)
  * convert a sampling rate into USB high speed format (fs/8000 in Q16.16)
  * this will overflow at approx 4 MHz
  */
-static inline unsigned get_usb_high_speed_rate(unsigned rate)
+static inline unsigned int get_usb_high_speed_rate(unsigned int rate)
 {
 	return ((rate << 10) + 62) / 125;
 }
@@ -129,7 +130,7 @@ static inline unsigned get_usb_high_speed_rate(unsigned rate)
 void usb_stream_free(struct usb_stream_kernel *sk)
 {
 	struct usb_stream *s;
-	unsigned u;
+	unsigned int u;
 
 	for (u = 0; u < USB_STREAM_NURBS; ++u) {
 		usb_free_urb(sk->inurb[u]);
@@ -150,9 +151,12 @@ void usb_stream_free(struct usb_stream_kernel *sk)
 
 struct usb_stream *usb_stream_new(struct usb_stream_kernel *sk,
 				  struct usb_device *dev,
-				  unsigned in_endpoint, unsigned out_endpoint,
-				  unsigned sample_rate, unsigned use_packsize,
-				  unsigned period_frames, unsigned frame_size)
+				  unsigned int in_endpoint,
+				  unsigned int out_endpoint,
+				  unsigned int sample_rate,
+				  unsigned int use_packsize,
+				  unsigned int period_frames,
+				  unsigned int frame_size)
 {
 	int packets, max_packsize;
 	int in_pipe, out_pipe;
@@ -528,7 +532,7 @@ static void stream_start(struct usb_stream_kernel *sk,
 	if (s->state >= usb_stream_sync1) {
 		int l, p, max_diff, max_diff_0;
 		int urb_size = 0;
-		unsigned frames_per_packet, min_frames = 0;
+		unsigned int frames_per_packet, min_frames = 0;
 
 		frames_per_packet = (s->period_size - s->idle_insize);
 		frames_per_packet <<= 8;
@@ -570,7 +574,7 @@ static void stream_start(struct usb_stream_kernel *sk,
 				(s->inpacket_head + 1) % s->inpackets;
 			s->next_inpacket_split_at = 0;
 		} else {
-			unsigned split = s->inpacket_head;
+			unsigned int split = s->inpacket_head;
 
 			l = s->idle_insize;
 			while (l > s->inpacket[split].length) {
diff --git a/sound/usb/usx2y/usb_stream.h b/sound/usb/usx2y/usb_stream.h
index 851358a8d709..73e57b341adc 100644
--- a/sound/usb/usx2y/usb_stream.h
+++ b/sound/usb/usx2y/usb_stream.h
@@ -12,7 +12,7 @@ struct usb_stream_kernel {
 
 	void *write_page;
 
-	unsigned n_o_ps;
+	unsigned int n_o_ps;
 
 	struct urb *inurb[USB_STREAM_NURBS];
 	struct urb *idle_inurb;
@@ -26,18 +26,21 @@ struct usb_stream_kernel {
 
 	wait_queue_head_t sleep;
 
-	unsigned out_phase;
-	unsigned out_phase_peeked;
-	unsigned freqn;
+	unsigned int out_phase;
+	unsigned int out_phase_peeked;
+	unsigned int freqn;
 };
 
 struct usb_stream *usb_stream_new(struct usb_stream_kernel *sk,
 				  struct usb_device *dev,
-				  unsigned in_endpoint, unsigned out_endpoint,
-				  unsigned sample_rate, unsigned use_packsize,
-				  unsigned period_frames, unsigned frame_size);
-void usb_stream_free(struct usb_stream_kernel *);
-int usb_stream_start(struct usb_stream_kernel *);
-void usb_stream_stop(struct usb_stream_kernel *);
+				  unsigned int in_endpoint,
+				  unsigned int out_endpoint,
+				  unsigned int sample_rate,
+				  unsigned int use_packsize,
+				  unsigned int period_frames,
+				  unsigned int frame_size);
+void usb_stream_free(struct usb_stream_kernel *sk);
+int usb_stream_start(struct usb_stream_kernel *sk);
+void usb_stream_stop(struct usb_stream_kernel *sk);
 
 #endif /* __USB_STREAM_H */
diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index 88f2249a0ad5..05b10bdc6380 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -163,7 +163,7 @@ static void i_usx2y_out04_int(struct urb *urb)
 
 		for (i = 0; i < 10 && usx2y->as04.urb[i] != urb; i++)
 			;
-		snd_printdd("i_usx2y_out04_int() urb %i status=%i\n", i, urb->status);
+		snd_printdd("%s urb %i status=%i\n", __func__, i, urb->status);
 	}
 #endif
 }
@@ -173,6 +173,8 @@ static void i_usx2y_in04_int(struct urb *urb)
 	int			err = 0;
 	struct usx2ydev		*usx2y = urb->context;
 	struct us428ctls_sharedmem	*us428ctls = usx2y->us428ctls_sharedmem;
+	struct us428_p4out *p4out;
+	int i, j, n, diff, send;
 
 	usx2y->in04_int_calls++;
 
@@ -183,15 +185,12 @@ static void i_usx2y_in04_int(struct urb *urb)
 
 	//	printk("%i:0x%02X ", 8, (int)((unsigned char*)usx2y->in04_buf)[8]); Master volume shows 0 here if fader is at max during boot ?!?
 	if (us428ctls) {
-		int diff = -1;
-
-		if (-2 == us428ctls->ctl_snapshot_last) {
+		diff = -1;
+		if (us428ctls->ctl_snapshot_last == -2) {
 			diff = 0;
 			memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof(usx2y->in04_last));
 			us428ctls->ctl_snapshot_last = -1;
 		} else {
-			int i;
-
 			for (i = 0; i < 21; i++) {
 				if (usx2y->in04_last[i] != ((char *)usx2y->in04_buf)[i]) {
 					if (diff < 0)
@@ -200,10 +199,9 @@ static void i_usx2y_in04_int(struct urb *urb)
 				}
 			}
 		}
-		if (0 <= diff) {
-			int n = us428ctls->ctl_snapshot_last + 1;
-
-			if (n >= N_US428_CTL_BUFS  ||  n < 0)
+		if (diff >= 0) {
+			n = us428ctls->ctl_snapshot_last + 1;
+			if (n >= N_US428_CTL_BUFS || n < 0)
 				n = 0;
 			memcpy(us428ctls->ctl_snapshot + n, usx2y->in04_buf, sizeof(us428ctls->ctl_snapshot[0]));
 			us428ctls->ctl_snapshot_differs_at[n] = diff;
@@ -213,21 +211,20 @@ static void i_usx2y_in04_int(struct urb *urb)
 	}
 
 	if (usx2y->us04) {
-		if (0 == usx2y->us04->submitted)
+		if (!usx2y->us04->submitted) {
 			do {
 				err = usb_submit_urb(usx2y->us04->urb[usx2y->us04->submitted++], GFP_ATOMIC);
 			} while (!err && usx2y->us04->submitted < usx2y->us04->len);
-	} else
+		}
+	} else {
 		if (us428ctls && us428ctls->p4out_last >= 0 && us428ctls->p4out_last < N_US428_P4OUT_BUFS) {
 			if (us428ctls->p4out_last != us428ctls->p4out_sent) {
-				int j, send = us428ctls->p4out_sent + 1;
-
+				send = us428ctls->p4out_sent + 1;
 				if (send >= N_US428_P4OUT_BUFS)
 					send = 0;
-				for (j = 0; j < URBS_ASYNC_SEQ  &&  !err; ++j)
-					if (0 == usx2y->as04.urb[j]->status) {
-						struct us428_p4out *p4out = us428ctls->p4out + send;	// FIXME if more than 1 p4out is new, 1 gets lost.
-
+				for (j = 0; j < URBS_ASYNC_SEQ && !err; ++j) {
+					if (!usx2y->as04.urb[j]->status) {
+						p4out = us428ctls->p4out + send;	// FIXME if more than 1 p4out is new, 1 gets lost.
 						usb_fill_bulk_urb(usx2y->as04.urb[j], usx2y->dev,
 								  usb_sndbulkpipe(usx2y->dev, 0x04), &p4out->val.vol,
 								  p4out->type == ELT_LIGHT ? sizeof(struct us428_lights) : 5,
@@ -236,8 +233,10 @@ static void i_usx2y_in04_int(struct urb *urb)
 						us428ctls->p4out_sent = send;
 						break;
 					}
+				}
 			}
 		}
+	}
 
 	if (err)
 		snd_printk(KERN_ERR "in04_int() usb_submit_urb err=%i\n", err);
@@ -255,31 +254,35 @@ int usx2y_async_seq04_init(struct usx2ydev *usx2y)
 
 	usx2y->as04.buffer = kmalloc_array(URBS_ASYNC_SEQ,
 					   URB_DATA_LEN_ASYNC_SEQ, GFP_KERNEL);
-	if (NULL == usx2y->as04.buffer) {
+	if (!usx2y->as04.buffer) {
 		err = -ENOMEM;
-	} else
+	} else {
 		for (i = 0; i < URBS_ASYNC_SEQ; ++i) {
-			if (NULL == (usx2y->as04.urb[i] = usb_alloc_urb(0, GFP_KERNEL))) {
+			usx2y->as04.urb[i] = usb_alloc_urb(0, GFP_KERNEL);
+			if (!usx2y->as04.urb[i]) {
 				err = -ENOMEM;
 				break;
 			}
 			usb_fill_bulk_urb(usx2y->as04.urb[i], usx2y->dev,
 					  usb_sndbulkpipe(usx2y->dev, 0x04),
-					  usx2y->as04.buffer + URB_DATA_LEN_ASYNC_SEQ*i, 0,
+					  usx2y->as04.buffer + URB_DATA_LEN_ASYNC_SEQ * i, 0,
 					  i_usx2y_out04_int, usx2y);
 			err = usb_urb_ep_type_check(usx2y->as04.urb[i]);
 			if (err < 0)
 				break;
 		}
+	}
 	return err;
 }
 
 int usx2y_in04_init(struct usx2ydev *usx2y)
 {
-	if (!(usx2y->in04_urb = usb_alloc_urb(0, GFP_KERNEL)))
+	usx2y->in04_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!usx2y->in04_urb)
 		return -ENOMEM;
 
-	if (!(usx2y->in04_buf = kmalloc(21, GFP_KERNEL)))
+	usx2y->in04_buf = kmalloc(21, GFP_KERNEL);
+	if (!usx2y->in04_buf)
 		return -ENOMEM;
 
 	init_waitqueue_head(&usx2y->in04_wait_queue);
@@ -354,8 +357,7 @@ static int usx2y_create_card(struct usb_device *device,
 		le16_to_cpu(device->descriptor.idVendor),
 		le16_to_cpu(device->descriptor.idProduct),
 		0,//us428(card)->usbmidi.ifnum,
-		usx2y(card)->dev->bus->busnum, usx2y(card)->dev->devnum
-		);
+		usx2y(card)->dev->bus->busnum, usx2y(card)->dev->devnum);
 	*cardp = card;
 	return 0;
 }
@@ -378,13 +380,18 @@ static int usx2y_usb_probe(struct usb_device *device,
 	err = usx2y_create_card(device, intf, &card);
 	if (err < 0)
 		return err;
-	if ((err = usx2y_hwdep_new(card, device)) < 0  ||
-	    (err = snd_card_register(card)) < 0) {
-		snd_card_free(card);
-		return err;
-	}
+	err = usx2y_hwdep_new(card, device);
+	if (err < 0)
+		goto error;
+	err = snd_card_register(card);
+	if (err < 0)
+		goto error;
 	*cardp = card;
 	return 0;
+
+ error:
+	snd_card_free(card);
+	return err;
 }
 
 /*
@@ -405,7 +412,7 @@ static int snd_usx2y_probe(struct usb_interface *intf, const struct usb_device_i
 static void snd_usx2y_disconnect(struct usb_interface *intf)
 {
 	usx2y_usb_disconnect(interface_to_usbdev(intf),
-				 usb_get_intfdata(intf));
+			     usb_get_intfdata(intf));
 }
 
 static struct usb_driver snd_usx2y_usb_driver = {
@@ -417,13 +424,15 @@ static struct usb_driver snd_usx2y_usb_driver = {
 
 static void snd_usx2y_card_private_free(struct snd_card *card)
 {
-	kfree(usx2y(card)->in04_buf);
-	usb_free_urb(usx2y(card)->in04_urb);
-	if (usx2y(card)->us428ctls_sharedmem)
-		free_pages_exact(usx2y(card)->us428ctls_sharedmem,
-				 sizeof(*usx2y(card)->us428ctls_sharedmem));
-	if (usx2y(card)->card_index >= 0  &&  usx2y(card)->card_index < SNDRV_CARDS)
-		snd_usx2y_card_used[usx2y(card)->card_index] = 0;
+	struct usx2ydev *usx2y = usx2y(card);
+
+	kfree(usx2y->in04_buf);
+	usb_free_urb(usx2y->in04_urb);
+	if (usx2y->us428ctls_sharedmem)
+		free_pages_exact(usx2y->us428ctls_sharedmem,
+				 sizeof(*usx2y->us428ctls_sharedmem));
+	if (usx2y->card_index >= 0 && usx2y->card_index < SNDRV_CARDS)
+		snd_usx2y_card_used[usx2y->card_index] = 0;
 }
 
 /*
@@ -431,23 +440,26 @@ static void snd_usx2y_card_private_free(struct snd_card *card)
  */
 static void usx2y_usb_disconnect(struct usb_device *device, void *ptr)
 {
-	if (ptr) {
-		struct snd_card *card = ptr;
-		struct usx2ydev *usx2y = usx2y(card);
-		struct list_head *p;
-
-		usx2y->chip_status = USX2Y_STAT_CHIP_HUP;
-		usx2y_unlinkseq(&usx2y->as04);
-		usb_kill_urb(usx2y->in04_urb);
-		snd_card_disconnect(card);
-		/* release the midi resources */
-		list_for_each(p, &usx2y->midi_list) {
-			snd_usbmidi_disconnect(p);
-		}
-		if (usx2y->us428ctls_sharedmem)
-			wake_up(&usx2y->us428ctls_wait_queue_head);
-		snd_card_free(card);
+	struct snd_card *card;
+	struct usx2ydev *usx2y;
+	struct list_head *p;
+
+	if (!ptr)
+		return;
+	card = ptr;
+	usx2y = usx2y(card);
+	usx2y->chip_status = USX2Y_STAT_CHIP_HUP;
+	usx2y_unlinkseq(&usx2y->as04);
+	usb_kill_urb(usx2y->in04_urb);
+	snd_card_disconnect(card);
+
+	/* release the midi resources */
+	list_for_each(p, &usx2y->midi_list) {
+		snd_usbmidi_disconnect(p);
 	}
+	if (usx2y->us428ctls_sharedmem)
+		wake_up(&usx2y->us428ctls_wait_queue_head);
+	snd_card_free(card);
 }
 
 module_usb_driver(snd_usx2y_usb_driver);
diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index 5ad6e3767621..6d0e97a07bb8 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -30,7 +30,7 @@ struct usx2ydev {
 	struct urb		*in04_urb;
 	void			*in04_buf;
 	char			in04_last[24];
-	unsigned		in04_int_calls;
+	unsigned int		in04_int_calls;
 	struct snd_usx2y_urb_seq	*us04;
 	wait_queue_head_t	in04_wait_queue;
 	struct snd_usx2y_async_seq	as04;
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index f92a9d52ea33..a2eeca9548f1 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -61,6 +61,7 @@ static int usx2y_urb_capt_retire(struct snd_usx2y_substream *subs)
 	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
 	unsigned char	*cp;
 	int		i, len, lens = 0, hwptr_done = subs->hwptr_done;
+	int		cnt, blen;
 	struct usx2ydev	*usx2y = subs->usx2y;
 
 	for (i = 0; i < nr_of_packs(); i++) {
@@ -79,9 +80,8 @@ static int usx2y_urb_capt_retire(struct snd_usx2y_substream *subs)
 
 		/* copy a data chunk */
 		if ((hwptr_done + len) > runtime->buffer_size) {
-			int cnt = runtime->buffer_size - hwptr_done;
-			int blen = cnt * usx2y->stride;
-
+			cnt = runtime->buffer_size - hwptr_done;
+			blen = cnt * usx2y->stride;
 			memcpy(runtime->dma_area + hwptr_done * usx2y->stride, cp, blen);
 			memcpy(runtime->dma_area, cp + blen, len * usx2y->stride - blen);
 		} else {
@@ -89,7 +89,8 @@ static int usx2y_urb_capt_retire(struct snd_usx2y_substream *subs)
 			       len * usx2y->stride);
 		}
 		lens += len;
-		if ((hwptr_done += len) >= runtime->buffer_size)
+		hwptr_done += len;
+		if (hwptr_done >= runtime->buffer_size)
 			hwptr_done -= runtime->buffer_size;
 	}
 
@@ -117,9 +118,9 @@ static int usx2y_urb_play_prepare(struct snd_usx2y_substream *subs,
 				  struct urb *cap_urb,
 				  struct urb *urb)
 {
-	int count, counts, pack;
 	struct usx2ydev *usx2y = subs->usx2y;
 	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
+	int count, counts, pack, len;
 
 	count = 0;
 	for (pack = 0; pack <  nr_of_packs(); pack++) {
@@ -137,13 +138,11 @@ static int usx2y_urb_play_prepare(struct snd_usx2y_substream *subs,
 			0;
 		urb->iso_frame_desc[pack].length = cap_urb->iso_frame_desc[pack].actual_length;
 	}
-	if (atomic_read(&subs->state) >= STATE_PRERUNNING)
+	if (atomic_read(&subs->state) >= STATE_PRERUNNING) {
 		if (subs->hwptr + count > runtime->buffer_size) {
 			/* err, the transferred area goes over buffer boundary.
 			 * copy the data to the temp buffer.
 			 */
-			int len;
-
 			len = runtime->buffer_size - subs->hwptr;
 			urb->transfer_buffer = subs->tmpbuf;
 			memcpy(subs->tmpbuf, runtime->dma_area +
@@ -155,11 +154,13 @@ static int usx2y_urb_play_prepare(struct snd_usx2y_substream *subs,
 		} else {
 			/* set the buffer pointer */
 			urb->transfer_buffer = runtime->dma_area + subs->hwptr * usx2y->stride;
-			if ((subs->hwptr += count) >= runtime->buffer_size)
+			subs->hwptr += count;
+			if (subs->hwptr >= runtime->buffer_size)
 				subs->hwptr -= runtime->buffer_size;
 		}
-	else
+	} else {
 		urb->transfer_buffer = subs->tmpbuf;
+	}
 	urb->transfer_buffer_length = count * usx2y->stride;
 	return 0;
 }
@@ -190,25 +191,26 @@ static int usx2y_urb_submit(struct snd_usx2y_substream *subs, struct urb *urb, i
 
 	if (!urb)
 		return -ENODEV;
-	urb->start_frame = (frame + NRURBS * nr_of_packs());  // let hcd do rollover sanity checks
+	urb->start_frame = frame + NRURBS * nr_of_packs();  // let hcd do rollover sanity checks
 	urb->hcpriv = NULL;
 	urb->dev = subs->usx2y->dev; /* we need to set this at each time */
-	if ((err = usb_submit_urb(urb, GFP_ATOMIC)) < 0) {
+	err = usb_submit_urb(urb, GFP_ATOMIC);
+	if (err < 0) {
 		snd_printk(KERN_ERR "usb_submit_urb() returned %i\n", err);
 		return err;
 	}
 	return 0;
 }
 
-static inline int usx2y_usbframe_complete(struct snd_usx2y_substream *capsubs,
-					  struct snd_usx2y_substream *playbacksubs,
-					  int frame)
+static int usx2y_usbframe_complete(struct snd_usx2y_substream *capsubs,
+				   struct snd_usx2y_substream *playbacksubs,
+				   int frame)
 {
 	int err, state;
 	struct urb *urb = playbacksubs->completed_urb;
 
 	state = atomic_read(&playbacksubs->state);
-	if (NULL != urb) {
+	if (urb) {
 		if (state == STATE_RUNNING)
 			usx2y_urb_play_retire(playbacksubs, urb);
 		else if (state >= STATE_PRERUNNING)
@@ -226,10 +228,12 @@ static inline int usx2y_usbframe_complete(struct snd_usx2y_substream *capsubs,
 		}
 	}
 	if (urb) {
-		if ((err = usx2y_urb_play_prepare(playbacksubs, capsubs->completed_urb, urb)) ||
-		    (err = usx2y_urb_submit(playbacksubs, urb, frame))) {
+		err = usx2y_urb_play_prepare(playbacksubs, capsubs->completed_urb, urb);
+		if (err)
+			return err;
+		err = usx2y_urb_submit(playbacksubs, urb, frame);
+		if (err)
 			return err;
-		}
 	}
 
 	playbacksubs->completed_urb = NULL;
@@ -237,11 +241,14 @@ static inline int usx2y_usbframe_complete(struct snd_usx2y_substream *capsubs,
 	state = atomic_read(&capsubs->state);
 	if (state >= STATE_PREPARED) {
 		if (state == STATE_RUNNING) {
-			if ((err = usx2y_urb_capt_retire(capsubs)))
+			err = usx2y_urb_capt_retire(capsubs);
+			if (err)
 				return err;
-		} else if (state >= STATE_PRERUNNING)
+		} else if (state >= STATE_PRERUNNING) {
 			atomic_inc(&capsubs->state);
-		if ((err = usx2y_urb_submit(capsubs, capsubs->completed_urb, frame)))
+		}
+		err = usx2y_urb_submit(capsubs, capsubs->completed_urb, frame);
+		if (err)
 			return err;
 	}
 	capsubs->completed_urb = NULL;
@@ -250,26 +257,25 @@ static inline int usx2y_usbframe_complete(struct snd_usx2y_substream *capsubs,
 
 static void usx2y_clients_stop(struct usx2ydev *usx2y)
 {
+	struct snd_usx2y_substream *subs;
+	struct urb *urb;
 	int s, u;
 
 	for (s = 0; s < 4; s++) {
-		struct snd_usx2y_substream *subs = usx2y->subs[s];
-
+		subs = usx2y->subs[s];
 		if (subs) {
 			snd_printdd("%i %p state=%i\n", s, subs, atomic_read(&subs->state));
 			atomic_set(&subs->state, STATE_STOPPED);
 		}
 	}
 	for (s = 0; s < 4; s++) {
-		struct snd_usx2y_substream *subs = usx2y->subs[s];
-
+		subs = usx2y->subs[s];
 		if (subs) {
 			if (atomic_read(&subs->state) >= STATE_PRERUNNING)
 				snd_pcm_stop_xrun(subs->pcm_substream);
 			for (u = 0; u < NRURBS; u++) {
-				struct urb *urb = subs->urb[u];
-
-				if (NULL != urb)
+				urb = subs->urb[u];
+				if (urb)
 					snd_printdd("%i status=%i start_frame=%i\n",
 						    u, urb->status, urb->start_frame);
 			}
@@ -291,6 +297,7 @@ static void i_usx2y_urb_complete(struct urb *urb)
 {
 	struct snd_usx2y_substream *subs = urb->context;
 	struct usx2ydev *usx2y = subs->usx2y;
+	struct snd_usx2y_substream *capsubs, *playbacksubs;
 
 	if (unlikely(atomic_read(&subs->state) < STATE_PREPARED)) {
 		snd_printdd("hcd_frame=%i ep=%i%s status=%i start_frame=%i\n",
@@ -306,20 +313,18 @@ static void i_usx2y_urb_complete(struct urb *urb)
 
 	subs->completed_urb = urb;
 
-	{
-		struct snd_usx2y_substream *capsubs = usx2y->subs[SNDRV_PCM_STREAM_CAPTURE],
-			*playbacksubs = usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
-
-		if (capsubs->completed_urb &&
-		    atomic_read(&capsubs->state) >= STATE_PREPARED &&
-		    (playbacksubs->completed_urb ||
-		     atomic_read(&playbacksubs->state) < STATE_PREPARED)) {
-			if (!usx2y_usbframe_complete(capsubs, playbacksubs, urb->start_frame))
-				usx2y->wait_iso_frame += nr_of_packs();
-			else {
-				snd_printdd("\n");
-				usx2y_clients_stop(usx2y);
-			}
+	capsubs = usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
+	playbacksubs = usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
+
+	if (capsubs->completed_urb &&
+	    atomic_read(&capsubs->state) >= STATE_PREPARED &&
+	    (playbacksubs->completed_urb ||
+	     atomic_read(&playbacksubs->state) < STATE_PREPARED)) {
+		if (!usx2y_usbframe_complete(capsubs, playbacksubs, urb->start_frame)) {
+			usx2y->wait_iso_frame += nr_of_packs();
+		} else {
+			snd_printdd("\n");
+			usx2y_clients_stop(usx2y);
 		}
 	}
 }
@@ -327,18 +332,19 @@ static void i_usx2y_urb_complete(struct urb *urb)
 static void usx2y_urbs_set_complete(struct usx2ydev *usx2y,
 				    void (*complete)(struct urb *))
 {
+	struct snd_usx2y_substream *subs;
+	struct urb *urb;
 	int s, u;
 
 	for (s = 0; s < 4; s++) {
-		struct snd_usx2y_substream *subs = usx2y->subs[s];
-
-		if (NULL != subs)
+		subs = usx2y->subs[s];
+		if (subs) {
 			for (u = 0; u < NRURBS; u++) {
-				struct urb *urb = subs->urb[u];
-
-				if (NULL != urb)
+				urb = subs->urb[u];
+				if (urb)
 					urb->complete = complete;
 			}
+		}
 	}
 }
 
@@ -354,12 +360,13 @@ static void i_usx2y_subs_startup(struct urb *urb)
 	struct usx2ydev *usx2y = subs->usx2y;
 	struct snd_usx2y_substream *prepare_subs = usx2y->prepare_subs;
 
-	if (NULL != prepare_subs)
+	if (prepare_subs) {
 		if (urb->start_frame == prepare_subs->urb[0]->start_frame) {
 			usx2y_subs_startup_finish(usx2y);
 			atomic_inc(&prepare_subs->state);
 			wake_up(&usx2y->prepare_wait_queue);
 		}
+	}
 
 	i_usx2y_urb_complete(urb);
 }
@@ -392,7 +399,7 @@ static void usx2y_urbs_release(struct snd_usx2y_substream *subs)
 {
 	int i;
 
-	snd_printdd("usx2y_urbs_release() %i\n", subs->endpoint);
+	snd_printdd("%s %i\n", __func__, subs->endpoint);
 	for (i = 0; i < NRURBS; i++)
 		usx2y_urb_release(subs->urb + i,
 				  subs != subs->usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK]);
@@ -410,6 +417,7 @@ static int usx2y_urbs_allocate(struct snd_usx2y_substream *subs)
 	unsigned int pipe;
 	int is_playback = subs == subs->usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
 	struct usb_device *dev = subs->usx2y->dev;
+	struct urb **purb;
 
 	pipe = is_playback ? usb_sndisocpipe(dev, subs->endpoint) :
 			usb_rcvisocpipe(dev, subs->endpoint);
@@ -417,21 +425,20 @@ static int usx2y_urbs_allocate(struct snd_usx2y_substream *subs)
 	if (!subs->maxpacksize)
 		return -EINVAL;
 
-	if (is_playback && NULL == subs->tmpbuf) {	/* allocate a temporary buffer for playback */
+	if (is_playback && !subs->tmpbuf) {	/* allocate a temporary buffer for playback */
 		subs->tmpbuf = kcalloc(nr_of_packs(), subs->maxpacksize, GFP_KERNEL);
 		if (!subs->tmpbuf)
 			return -ENOMEM;
 	}
 	/* allocate and initialize data urbs */
 	for (i = 0; i < NRURBS; i++) {
-		struct urb **purb = subs->urb + i;
-
+		purb = subs->urb + i;
 		if (*purb) {
 			usb_kill_urb(*purb);
 			continue;
 		}
 		*purb = usb_alloc_urb(nr_of_packs(), GFP_KERNEL);
-		if (NULL == *purb) {
+		if (!*purb) {
 			usx2y_urbs_release(subs);
 			return -ENOMEM;
 		}
@@ -440,7 +447,7 @@ static int usx2y_urbs_allocate(struct snd_usx2y_substream *subs)
 			(*purb)->transfer_buffer =
 				kmalloc_array(subs->maxpacksize,
 					      nr_of_packs(), GFP_KERNEL);
-			if (NULL == (*purb)->transfer_buffer) {
+			if (!(*purb)->transfer_buffer) {
 				usx2y_urbs_release(subs);
 				return -ENOMEM;
 			}
@@ -469,26 +476,26 @@ static int usx2y_urbs_start(struct snd_usx2y_substream *subs)
 {
 	int i, err;
 	struct usx2ydev *usx2y = subs->usx2y;
+	struct urb *urb;
+	unsigned long pack;
 
-	if ((err = usx2y_urbs_allocate(subs)) < 0)
+	err = usx2y_urbs_allocate(subs);
+	if (err < 0)
 		return err;
 	subs->completed_urb = NULL;
 	for (i = 0; i < 4; i++) {
 		struct snd_usx2y_substream *subs = usx2y->subs[i];
 
-		if (subs != NULL && atomic_read(&subs->state) >= STATE_PREPARED)
+		if (subs && atomic_read(&subs->state) >= STATE_PREPARED)
 			goto start;
 	}
 
  start:
 	usx2y_subs_startup(subs);
 	for (i = 0; i < NRURBS; i++) {
-		struct urb *urb = subs->urb[i];
-
+		urb = subs->urb[i];
 		if (usb_pipein(urb->pipe)) {
-			unsigned long pack;
-
-			if (0 == i)
+			if (!i)
 				atomic_set(&subs->state, STATE_STARTING3);
 			urb->dev = usx2y->dev;
 			for (pack = 0; pack < nr_of_packs(); pack++) {
@@ -496,13 +503,15 @@ static int usx2y_urbs_start(struct snd_usx2y_substream *subs)
 				urb->iso_frame_desc[pack].length = subs->maxpacksize;
 			}
 			urb->transfer_buffer_length = subs->maxpacksize * nr_of_packs();
-			if ((err = usb_submit_urb(urb, GFP_ATOMIC)) < 0) {
+			err = usb_submit_urb(urb, GFP_ATOMIC);
+			if (err < 0) {
 				snd_printk(KERN_ERR "cannot submit datapipe for urb %d, err = %d\n", i, err);
 				err = -EPIPE;
 				goto cleanup;
-			} else
-				if (i == 0)
+			} else {
+				if (!i)
 					usx2y->wait_iso_frame = urb->start_frame;
+			}
 			urb->transfer_flags = 0;
 		} else {
 			atomic_set(&subs->state, STATE_STARTING1);
@@ -510,7 +519,7 @@ static int usx2y_urbs_start(struct snd_usx2y_substream *subs)
 		}
 	}
 	err = 0;
-	wait_event(usx2y->prepare_wait_queue, NULL == usx2y->prepare_subs);
+	wait_event(usx2y->prepare_wait_queue, !usx2y->prepare_subs);
 	if (atomic_read(&subs->state) != STATE_PREPARED)
 		err = -EPIPE;
 
@@ -541,7 +550,7 @@ static int snd_usx2y_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		snd_printdd("snd_usx2y_pcm_trigger(START)\n");
+		snd_printdd("%s(START)\n", __func__);
 		if (atomic_read(&subs->state) == STATE_PREPARED &&
 		    atomic_read(&subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE]->state) >= STATE_PREPARED) {
 			atomic_set(&subs->state, STATE_PRERUNNING);
@@ -551,7 +560,7 @@ static int snd_usx2y_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		snd_printdd("snd_usx2y_pcm_trigger(STOP)\n");
+		snd_printdd("%s(STOP)\n", __func__);
 		if (atomic_read(&subs->state) >= STATE_PRERUNNING)
 			atomic_set(&subs->state, STATE_PREPARED);
 		break;
@@ -569,11 +578,11 @@ static int snd_usx2y_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
  * if sg buffer is supported on the later version of alsa, we'll follow
  * that.
  */
-static const struct s_c2
-{
+struct s_c2 {
 	char c1, c2;
-}
-	setrate_44100[] = {
+};
+
+static const struct s_c2 setrate_44100[] = {
 	{ 0x14, 0x08},	// this line sets 44100, well actually a little less
 	{ 0x18, 0x40},	// only tascam / frontier design knows the further lines .......
 	{ 0x18, 0x42},
@@ -653,7 +662,7 @@ static void i_usx2y_04int(struct urb *urb)
 
 	if (urb->status)
 		snd_printk(KERN_ERR "snd_usx2y_04int() urb->status=%i\n", urb->status);
-	if (0 == --usx2y->us04->len)
+	if (!--usx2y->us04->len)
 		wake_up(&usx2y->in04_wait_queue);
 }
 
@@ -663,21 +672,23 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 	struct snd_usx2y_urb_seq	*us = NULL;
 	int			*usbdata = NULL;
 	const struct s_c2	*ra = rate == 48000 ? setrate_48000 : setrate_44100;
+	struct urb *urb;
 
 	if (usx2y->rate != rate) {
 		us = kzalloc(sizeof(*us) + sizeof(struct urb *) * NOOF_SETRATE_URBS, GFP_KERNEL);
-		if (NULL == us) {
+		if (!us) {
 			err = -ENOMEM;
 			goto cleanup;
 		}
 		usbdata = kmalloc_array(NOOF_SETRATE_URBS, sizeof(int),
 					GFP_KERNEL);
-		if (NULL == usbdata) {
+		if (!usbdata) {
 			err = -ENOMEM;
 			goto cleanup;
 		}
 		for (i = 0; i < NOOF_SETRATE_URBS; ++i) {
-			if (NULL == (us->urb[i] = usb_alloc_urb(0, GFP_KERNEL))) {
+			us->urb[i] = usb_alloc_urb(0, GFP_KERNEL);
+			if (!us->urb[i]) {
 				err = -ENOMEM;
 				goto cleanup;
 			}
@@ -692,7 +703,7 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 		us->submitted =	0;
 		us->len =	NOOF_SETRATE_URBS;
 		usx2y->us04 =	us;
-		wait_event_timeout(usx2y->in04_wait_queue, 0 == us->len, HZ);
+		wait_event_timeout(usx2y->in04_wait_queue, !us->len, HZ);
 		usx2y->us04 =	NULL;
 		if (us->len)
 			err = -ENODEV;
@@ -700,8 +711,7 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 		if (us) {
 			us->submitted =	2*NOOF_SETRATE_URBS;
 			for (i = 0; i < NOOF_SETRATE_URBS; ++i) {
-				struct urb *urb = us->urb[i];
-
+				urb = us->urb[i];
 				if (!urb)
 					continue;
 				if (urb->status) {
@@ -722,7 +732,6 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 	return err;
 }
 
-
 static int usx2y_format_set(struct usx2ydev *usx2y, snd_pcm_format_t format)
 {
 	int alternate, err;
@@ -739,7 +748,8 @@ static int usx2y_format_set(struct usx2ydev *usx2y, snd_pcm_format_t format)
 		snd_usbmidi_input_stop(p);
 	}
 	usb_kill_urb(usx2y->in04_urb);
-	if ((err = usb_set_interface(usx2y->dev, 0, alternate))) {
+	err = usb_set_interface(usx2y->dev, 0, alternate);
+	if (err) {
 		snd_printk(KERN_ERR "usb_set_interface error\n");
 		return err;
 	}
@@ -762,6 +772,8 @@ static int snd_usx2y_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_format_t	format = params_format(hw_params);
 	struct snd_card *card = substream->pstr->pcm->card;
 	struct usx2ydev	*dev = usx2y(card);
+	struct snd_usx2y_substream *subs;
+	struct snd_pcm_substream *test_substream;
 	int i;
 
 	mutex_lock(&usx2y(card)->pcm_mutex);
@@ -770,9 +782,7 @@ static int snd_usx2y_pcm_hw_params(struct snd_pcm_substream *substream,
 	 * rate & format
 	 */
 	for (i = 0; i < dev->pcm_devs * 2; i++) {
-		struct snd_usx2y_substream *subs = dev->subs[i];
-		struct snd_pcm_substream *test_substream;
-
+		subs = dev->subs[i];
 		if (!subs)
 			continue;
 		test_substream = subs->pcm_substream;
@@ -800,13 +810,13 @@ static int snd_usx2y_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_usx2y_substream *subs = runtime->private_data;
+	struct snd_usx2y_substream *cap_subs, *playback_subs;
 
 	mutex_lock(&subs->usx2y->pcm_mutex);
 	snd_printdd("snd_usx2y_hw_free(%p)\n", substream);
 
-	if (SNDRV_PCM_STREAM_PLAYBACK == substream->stream) {
-		struct snd_usx2y_substream *cap_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
-
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		cap_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
 		atomic_set(&subs->state, STATE_STOPPED);
 		usx2y_urbs_release(subs);
 		if (!cap_subs->pcm_substream ||
@@ -817,8 +827,7 @@ static int snd_usx2y_pcm_hw_free(struct snd_pcm_substream *substream)
 			usx2y_urbs_release(cap_subs);
 		}
 	} else {
-		struct snd_usx2y_substream *playback_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
-
+		playback_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
 		if (atomic_read(&playback_subs->state) < STATE_PREPARED) {
 			atomic_set(&subs->state, STATE_STOPPED);
 			usx2y_urbs_release(subs);
@@ -841,21 +850,26 @@ static int snd_usx2y_pcm_prepare(struct snd_pcm_substream *substream)
 	struct snd_usx2y_substream *capsubs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
 	int err = 0;
 
-	snd_printdd("snd_usx2y_pcm_prepare(%p)\n", substream);
+	snd_printdd("%s(%p)\n", __func__, substream);
 
 	mutex_lock(&usx2y->pcm_mutex);
 	usx2y_subs_prepare(subs);
 	// Start hardware streams
 	// SyncStream first....
 	if (atomic_read(&capsubs->state) < STATE_PREPARED) {
-		if (usx2y->format != runtime->format)
-			if ((err = usx2y_format_set(usx2y, runtime->format)) < 0)
+		if (usx2y->format != runtime->format) {
+			err = usx2y_format_set(usx2y, runtime->format);
+			if (err < 0)
 				goto up_prepare_mutex;
-		if (usx2y->rate != runtime->rate)
-			if ((err = usx2y_rate_set(usx2y, runtime->rate)) < 0)
+		}
+		if (usx2y->rate != runtime->rate) {
+			err = usx2y_rate_set(usx2y, runtime->rate);
+			if (err < 0)
 				goto up_prepare_mutex;
+		}
 		snd_printdd("starting capture pipe for %s\n", subs == capsubs ? "self" : "playpipe");
-		if (0 > (err = usx2y_urbs_start(capsubs)))
+		err = usx2y_urbs_start(capsubs);
+		if (err < 0)
 			goto up_prepare_mutex;
 	}
 
@@ -888,8 +902,9 @@ static const struct snd_pcm_hardware snd_usx2y_2c = {
 
 static int snd_usx2y_pcm_open(struct snd_pcm_substream *substream)
 {
-	struct snd_usx2y_substream	*subs = ((struct snd_usx2y_substream **)
-					 snd_pcm_substream_chip(substream))[substream->stream];
+	struct snd_usx2y_substream	*subs =
+		((struct snd_usx2y_substream **)
+		 snd_pcm_substream_chip(substream))[substream->stream];
 	struct snd_pcm_runtime	*runtime = substream->runtime;
 
 	if (subs->usx2y->chip_status & USX2Y_STAT_CHIP_MMAP_PCM_URBS)
@@ -1006,11 +1021,14 @@ int usx2y_audio_create(struct snd_card *card)
 
 	INIT_LIST_HEAD(&usx2y(card)->pcm_list);
 
-	if (0 > (err = usx2y_audio_stream_new(card, 0xA, 0x8)))
+	err = usx2y_audio_stream_new(card, 0xA, 0x8);
+	if (err < 0)
 		return err;
-	if (le16_to_cpu(usx2y(card)->dev->descriptor.idProduct) == USB_ID_US428)
-		if (0 > (err = usx2y_audio_stream_new(card, 0, 0xA)))
+	if (le16_to_cpu(usx2y(card)->dev->descriptor.idProduct) == USB_ID_US428) {
+		err = usx2y_audio_stream_new(card, 0, 0xA);
+		if (err < 0)
 			return err;
+	}
 	if (le16_to_cpu(usx2y(card)->dev->descriptor.idProduct) != USB_ID_US122)
 		err = usx2y_rate_set(usx2y(card), 44100);	// Lets us428 recognize output-volume settings, disturbs us122.
 	return err;
diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index b7e15fc3d1b4..9219341d71c7 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -52,10 +52,10 @@ static int usx2y_usbpcm_urb_capt_retire(struct snd_usx2y_substream *subs)
 	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
 	int		i, lens = 0, hwptr_done = subs->hwptr_done;
 	struct usx2ydev	*usx2y = subs->usx2y;
+	int head;
 
-	if (0 > usx2y->hwdep_pcm_shm->capture_iso_start) { //FIXME
-		int head = usx2y->hwdep_pcm_shm->captured_iso_head + 1;
-
+	if (usx2y->hwdep_pcm_shm->capture_iso_start < 0) { //FIXME
+		head = usx2y->hwdep_pcm_shm->captured_iso_head + 1;
 		if (head >= ARRAY_SIZE(usx2y->hwdep_pcm_shm->captured_iso))
 			head = 0;
 		usx2y->hwdep_pcm_shm->capture_iso_start = head;
@@ -70,7 +70,8 @@ static int usx2y_usbpcm_urb_capt_retire(struct snd_usx2y_substream *subs)
 		}
 		lens += urb->iso_frame_desc[i].actual_length / usx2y->stride;
 	}
-	if ((hwptr_done += lens) >= runtime->buffer_size)
+	hwptr_done += lens;
+	if (hwptr_done >= runtime->buffer_size)
 		hwptr_done -= runtime->buffer_size;
 	subs->hwptr_done = hwptr_done;
 	subs->transfer_done += lens;
@@ -82,7 +83,7 @@ static int usx2y_usbpcm_urb_capt_retire(struct snd_usx2y_substream *subs)
 	return 0;
 }
 
-static inline int usx2y_iso_frames_per_buffer(struct snd_pcm_runtime *runtime,
+static int usx2y_iso_frames_per_buffer(struct snd_pcm_runtime *runtime,
 					      struct usx2ydev *usx2y)
 {
 	return (runtime->buffer_size * 1000) / usx2y->rate + 1;	//FIXME: so far only correct period_size == 2^x ?
@@ -106,10 +107,10 @@ static int usx2y_hwdep_urb_play_prepare(struct snd_usx2y_substream *subs,
 	struct snd_usx2y_hwdep_pcm_shm *shm = usx2y->hwdep_pcm_shm;
 	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
 
-	if (0 > shm->playback_iso_start) {
+	if (shm->playback_iso_start < 0) {
 		shm->playback_iso_start = shm->captured_iso_head -
 			usx2y_iso_frames_per_buffer(runtime, usx2y);
-		if (0 > shm->playback_iso_start)
+		if (shm->playback_iso_start < 0)
 			shm->playback_iso_start += ARRAY_SIZE(shm->captured_iso);
 		shm->playback_iso_head = shm->playback_iso_start;
 	}
@@ -136,18 +137,18 @@ static int usx2y_hwdep_urb_play_prepare(struct snd_usx2y_substream *subs,
 	return 0;
 }
 
-static inline void usx2y_usbpcm_urb_capt_iso_advance(struct snd_usx2y_substream *subs,
-						     struct urb *urb)
+static void usx2y_usbpcm_urb_capt_iso_advance(struct snd_usx2y_substream *subs,
+					      struct urb *urb)
 {
-	int pack;
+	struct usb_iso_packet_descriptor *desc;
+	struct snd_usx2y_hwdep_pcm_shm *shm;
+	int pack, head;
 
 	for (pack = 0; pack < nr_of_packs(); ++pack) {
-		struct usb_iso_packet_descriptor *desc = urb->iso_frame_desc + pack;
-
-		if (NULL != subs) {
-			struct snd_usx2y_hwdep_pcm_shm *shm = subs->usx2y->hwdep_pcm_shm;
-			int head = shm->captured_iso_head + 1;
-
+		desc = urb->iso_frame_desc + pack;
+		if (subs) {
+			shm = subs->usx2y->hwdep_pcm_shm;
+			head = shm->captured_iso_head + 1;
 			if (head >= ARRAY_SIZE(shm->captured_iso))
 				head = 0;
 			shm->captured_iso[head].frame = urb->start_frame + pack;
@@ -156,22 +157,22 @@ static inline void usx2y_usbpcm_urb_capt_iso_advance(struct snd_usx2y_substream
 			shm->captured_iso_head = head;
 			shm->captured_iso_frames++;
 		}
-		if ((desc->offset += desc->length * NRURBS*nr_of_packs()) +
-		    desc->length >= SSS)
+		desc->offset += desc->length * NRURBS * nr_of_packs();
+		if (desc->offset + desc->length >= SSS)
 			desc->offset -= (SSS - desc->length);
 	}
 }
 
-static inline int usx2y_usbpcm_usbframe_complete(struct snd_usx2y_substream *capsubs,
-						 struct snd_usx2y_substream *capsubs2,
-						 struct snd_usx2y_substream *playbacksubs,
-						 int frame)
+static int usx2y_usbpcm_usbframe_complete(struct snd_usx2y_substream *capsubs,
+					  struct snd_usx2y_substream *capsubs2,
+					  struct snd_usx2y_substream *playbacksubs,
+					  int frame)
 {
 	int err, state;
 	struct urb *urb = playbacksubs->completed_urb;
 
 	state = atomic_read(&playbacksubs->state);
-	if (NULL != urb) {
+	if (urb) {
 		if (state == STATE_RUNNING)
 			usx2y_urb_play_retire(playbacksubs, urb);
 		else if (state >= STATE_PRERUNNING)
@@ -189,10 +190,12 @@ static inline int usx2y_usbpcm_usbframe_complete(struct snd_usx2y_substream *cap
 		}
 	}
 	if (urb) {
-		if ((err = usx2y_hwdep_urb_play_prepare(playbacksubs, urb)) ||
-		    (err = usx2y_urb_submit(playbacksubs, urb, frame))) {
+		err = usx2y_hwdep_urb_play_prepare(playbacksubs, urb);
+		if (err)
+			return err;
+		err = usx2y_hwdep_urb_play_prepare(playbacksubs, urb);
+		if (err)
 			return err;
-		}
 	}
 
 	playbacksubs->completed_urb = NULL;
@@ -200,21 +203,26 @@ static inline int usx2y_usbpcm_usbframe_complete(struct snd_usx2y_substream *cap
 	state = atomic_read(&capsubs->state);
 	if (state >= STATE_PREPARED) {
 		if (state == STATE_RUNNING) {
-			if ((err = usx2y_usbpcm_urb_capt_retire(capsubs)))
+			err = usx2y_usbpcm_urb_capt_retire(capsubs);
+			if (err)
 				return err;
-		} else if (state >= STATE_PRERUNNING)
+		} else if (state >= STATE_PRERUNNING) {
 			atomic_inc(&capsubs->state);
+		}
 		usx2y_usbpcm_urb_capt_iso_advance(capsubs, capsubs->completed_urb);
-		if (NULL != capsubs2)
+		if (capsubs2)
 			usx2y_usbpcm_urb_capt_iso_advance(NULL, capsubs2->completed_urb);
-		if ((err = usx2y_urb_submit(capsubs, capsubs->completed_urb, frame)))
+		err = usx2y_urb_submit(capsubs, capsubs->completed_urb, frame);
+		if (err)
 			return err;
-		if (NULL != capsubs2)
-			if ((err = usx2y_urb_submit(capsubs2, capsubs2->completed_urb, frame)))
+		if (capsubs2) {
+			err = usx2y_urb_submit(capsubs2, capsubs2->completed_urb, frame);
+			if (err)
 				return err;
+		}
 	}
 	capsubs->completed_urb = NULL;
-	if (NULL != capsubs2)
+	if (capsubs2)
 		capsubs2->completed_urb = NULL;
 	return 0;
 }
@@ -242,11 +250,11 @@ static void i_usx2y_usbpcm_urb_complete(struct urb *urb)
 	capsubs2 = usx2y->subs[SNDRV_PCM_STREAM_CAPTURE + 2];
 	playbacksubs = usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
 	if (capsubs->completed_urb && atomic_read(&capsubs->state) >= STATE_PREPARED &&
-	    (NULL == capsubs2 || capsubs2->completed_urb) &&
+	    (!capsubs2 || capsubs2->completed_urb) &&
 	    (playbacksubs->completed_urb || atomic_read(&playbacksubs->state) < STATE_PREPARED)) {
-		if (!usx2y_usbpcm_usbframe_complete(capsubs, capsubs2, playbacksubs, urb->start_frame))
+		if (!usx2y_usbpcm_usbframe_complete(capsubs, capsubs2, playbacksubs, urb->start_frame)) {
 			usx2y->wait_iso_frame += nr_of_packs();
-		else {
+		} else {
 			snd_printdd("\n");
 			usx2y_clients_stop(usx2y);
 		}
@@ -283,14 +291,14 @@ static void i_usx2y_usbpcm_subs_startup(struct urb *urb)
 	struct snd_usx2y_substream *subs = urb->context;
 	struct usx2ydev *usx2y = subs->usx2y;
 	struct snd_usx2y_substream *prepare_subs = usx2y->prepare_subs;
+	struct snd_usx2y_substream *cap_subs2;
 
-	if (NULL != prepare_subs &&
+	if (prepare_subs &&
 	    urb->start_frame == prepare_subs->urb[0]->start_frame) {
 		atomic_inc(&prepare_subs->state);
 		if (prepare_subs == usx2y->subs[SNDRV_PCM_STREAM_CAPTURE]) {
-			struct snd_usx2y_substream *cap_subs2 = usx2y->subs[SNDRV_PCM_STREAM_CAPTURE + 2];
-
-			if (cap_subs2 != NULL)
+			cap_subs2 = usx2y->subs[SNDRV_PCM_STREAM_CAPTURE + 2];
+			if (cap_subs2)
 				atomic_inc(&cap_subs2->state);
 		}
 		usx2y_usbpcm_subs_startup_finish(usx2y);
@@ -309,6 +317,7 @@ static int usx2y_usbpcm_urbs_allocate(struct snd_usx2y_substream *subs)
 	unsigned int pipe;
 	int is_playback = subs == subs->usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
 	struct usb_device *dev = subs->usx2y->dev;
+	struct urb **purb;
 
 	pipe = is_playback ? usb_sndisocpipe(dev, subs->endpoint) :
 			usb_rcvisocpipe(dev, subs->endpoint);
@@ -318,14 +327,13 @@ static int usx2y_usbpcm_urbs_allocate(struct snd_usx2y_substream *subs)
 
 	/* allocate and initialize data urbs */
 	for (i = 0; i < NRURBS; i++) {
-		struct urb **purb = subs->urb + i;
-
+		purb = subs->urb + i;
 		if (*purb) {
 			usb_kill_urb(*purb);
 			continue;
 		}
 		*purb = usb_alloc_urb(nr_of_packs(), GFP_KERNEL);
-		if (NULL == *purb) {
+		if (!*purb) {
 			usx2y_usbpcm_urbs_release(subs);
 			return -ENOMEM;
 		}
@@ -351,15 +359,17 @@ static int usx2y_usbpcm_urbs_allocate(struct snd_usx2y_substream *subs)
 static int snd_usx2y_usbpcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_usx2y_substream *subs = runtime->private_data,
-		*cap_subs2 = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE + 2];
+	struct snd_usx2y_substream *subs = runtime->private_data;
+	struct snd_usx2y_substream *cap_subs;
+	struct snd_usx2y_substream *playback_subs;
+	struct snd_usx2y_substream *cap_subs2;
 
 	mutex_lock(&subs->usx2y->pcm_mutex);
-	snd_printdd("snd_usx2y_usbpcm_hw_free(%p)\n", substream);
-
-	if (SNDRV_PCM_STREAM_PLAYBACK == substream->stream) {
-		struct snd_usx2y_substream *cap_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
+	snd_printdd("%s(%p)\n", __func__, substream);
 
+	cap_subs2 = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE + 2];
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		cap_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
 		atomic_set(&subs->state, STATE_STOPPED);
 		usx2y_usbpcm_urbs_release(subs);
 		if (!cap_subs->pcm_substream ||
@@ -367,21 +377,20 @@ static int snd_usx2y_usbpcm_hw_free(struct snd_pcm_substream *substream)
 		    !cap_subs->pcm_substream->runtime->status ||
 		    cap_subs->pcm_substream->runtime->status->state < SNDRV_PCM_STATE_PREPARED) {
 			atomic_set(&cap_subs->state, STATE_STOPPED);
-			if (NULL != cap_subs2)
+			if (cap_subs2)
 				atomic_set(&cap_subs2->state, STATE_STOPPED);
 			usx2y_usbpcm_urbs_release(cap_subs);
-			if (NULL != cap_subs2)
+			if (cap_subs2)
 				usx2y_usbpcm_urbs_release(cap_subs2);
 		}
 	} else {
-		struct snd_usx2y_substream *playback_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
-
+		playback_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
 		if (atomic_read(&playback_subs->state) < STATE_PREPARED) {
 			atomic_set(&subs->state, STATE_STOPPED);
-			if (NULL != cap_subs2)
+			if (cap_subs2)
 				atomic_set(&cap_subs2->state, STATE_STOPPED);
 			usx2y_usbpcm_urbs_release(subs);
-			if (NULL != cap_subs2)
+			if (cap_subs2)
 				usx2y_usbpcm_urbs_release(cap_subs2);
 		}
 	}
@@ -403,16 +412,19 @@ static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 {
 	int	p, u, err, stream = subs->pcm_substream->stream;
 	struct usx2ydev *usx2y = subs->usx2y;
+	struct urb *urb;
+	unsigned long pack;
 
-	if (SNDRV_PCM_STREAM_CAPTURE == stream) {
+	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
 		usx2y->hwdep_pcm_shm->captured_iso_head = -1;
 		usx2y->hwdep_pcm_shm->captured_iso_frames = 0;
 	}
 
 	for (p = 0; 3 >= (stream + p); p += 2) {
 		struct snd_usx2y_substream *subs = usx2y->subs[stream + p];
-		if (subs != NULL) {
-			if ((err = usx2y_usbpcm_urbs_allocate(subs)) < 0)
+		if (subs) {
+			err = usx2y_usbpcm_urbs_allocate(subs);
+			if (err < 0)
 				return err;
 			subs->completed_urb = NULL;
 		}
@@ -421,7 +433,7 @@ static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 	for (p = 0; p < 4; p++) {
 		struct snd_usx2y_substream *subs = usx2y->subs[p];
 
-		if (subs != NULL && atomic_read(&subs->state) >= STATE_PREPARED)
+		if (subs && atomic_read(&subs->state) >= STATE_PREPARED)
 			goto start;
 	}
 
@@ -431,39 +443,37 @@ static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 		for (p = 0; 3 >= (stream + p); p += 2) {
 			struct snd_usx2y_substream *subs = usx2y->subs[stream + p];
 
-			if (subs != NULL) {
-				struct urb *urb = subs->urb[u];
-
-				if (usb_pipein(urb->pipe)) {
-					unsigned long pack;
-
-					if (0 == u)
-						atomic_set(&subs->state, STATE_STARTING3);
-					urb->dev = usx2y->dev;
-					for (pack = 0; pack < nr_of_packs(); pack++) {
-						urb->iso_frame_desc[pack].offset = subs->maxpacksize * (pack + u * nr_of_packs());
-						urb->iso_frame_desc[pack].length = subs->maxpacksize;
-					}
-					urb->transfer_buffer_length = subs->maxpacksize * nr_of_packs();
-					if ((err = usb_submit_urb(urb, GFP_KERNEL)) < 0) {
-						snd_printk(KERN_ERR "cannot usb_submit_urb() for urb %d, err = %d\n", u, err);
-						err = -EPIPE;
-						goto cleanup;
-					}  else {
-						snd_printdd("%i\n", urb->start_frame);
-						if (u == 0)
-							usx2y->wait_iso_frame = urb->start_frame;
-					}
-					urb->transfer_flags = 0;
-				} else {
-					atomic_set(&subs->state, STATE_STARTING1);
-					break;
+			if (!subs)
+				continue;
+			urb = subs->urb[u];
+			if (usb_pipein(urb->pipe)) {
+				if (!u)
+					atomic_set(&subs->state, STATE_STARTING3);
+				urb->dev = usx2y->dev;
+				for (pack = 0; pack < nr_of_packs(); pack++) {
+					urb->iso_frame_desc[pack].offset = subs->maxpacksize * (pack + u * nr_of_packs());
+					urb->iso_frame_desc[pack].length = subs->maxpacksize;
 				}
+				urb->transfer_buffer_length = subs->maxpacksize * nr_of_packs();
+				err = usb_submit_urb(urb, GFP_KERNEL);
+				if (err < 0) {
+					snd_printk(KERN_ERR "cannot usb_submit_urb() for urb %d, err = %d\n", u, err);
+					err = -EPIPE;
+					goto cleanup;
+				}  else {
+					snd_printdd("%i\n", urb->start_frame);
+					if (!u)
+						usx2y->wait_iso_frame = urb->start_frame;
+				}
+				urb->transfer_flags = 0;
+			} else {
+				atomic_set(&subs->state, STATE_STARTING1);
+				break;
 			}
 		}
 	}
 	err = 0;
-	wait_event(usx2y->prepare_wait_queue, NULL == usx2y->prepare_subs);
+	wait_event(usx2y->prepare_wait_queue, !usx2y->prepare_subs);
 	if (atomic_read(&subs->state) != STATE_PREPARED)
 		err = -EPIPE;
 
@@ -490,7 +500,7 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 
 	snd_printdd("snd_usx2y_pcm_prepare(%p)\n", substream);
 
-	if (NULL == usx2y->hwdep_pcm_shm) {
+	if (!usx2y->hwdep_pcm_shm) {
 		usx2y->hwdep_pcm_shm = alloc_pages_exact(sizeof(struct snd_usx2y_hwdep_pcm_shm),
 							 GFP_KERNEL);
 		if (!usx2y->hwdep_pcm_shm)
@@ -503,15 +513,20 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 	// Start hardware streams
 	// SyncStream first....
 	if (atomic_read(&capsubs->state) < STATE_PREPARED) {
-		if (usx2y->format != runtime->format)
-			if ((err = usx2y_format_set(usx2y, runtime->format)) < 0)
+		if (usx2y->format != runtime->format) {
+			err = usx2y_format_set(usx2y, runtime->format);
+			if (err < 0)
 				goto up_prepare_mutex;
-		if (usx2y->rate != runtime->rate)
-			if ((err = usx2y_rate_set(usx2y, runtime->rate)) < 0)
+		}
+		if (usx2y->rate != runtime->rate) {
+			err = usx2y_rate_set(usx2y, runtime->rate);
+			if (err < 0)
 				goto up_prepare_mutex;
+		}
 		snd_printdd("starting capture pipe for %s\n", subs == capsubs ?
 			    "self" : "playpipe");
-		if (0 > (err = usx2y_usbpcm_urbs_start(capsubs)))
+		err = usx2y_usbpcm_urbs_start(capsubs);
+		if (err < 0)
 			goto up_prepare_mutex;
 	}
 
@@ -528,14 +543,16 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 					goto up_prepare_mutex;
 				}
 			}
-			if (0 > (err = usx2y_usbpcm_urbs_start(subs)))
+			err = usx2y_usbpcm_urbs_start(subs);
+			if (err < 0)
 				goto up_prepare_mutex;
 		}
 		snd_printdd("Ready: iso_frames_per_buffer=%i,captured_iso_frames=%i\n",
 			    usx2y_iso_frames_per_buffer(runtime, usx2y),
 			    usx2y->hwdep_pcm_shm->captured_iso_frames);
-	} else
+	} else {
 		usx2y->hwdep_pcm_shm->capture_iso_start = -1;
+	}
 
  up_prepare_mutex:
 	mutex_unlock(&usx2y->pcm_mutex);
@@ -562,15 +579,18 @@ static const struct snd_pcm_hardware snd_usx2y_4c = {
 
 static int snd_usx2y_usbpcm_open(struct snd_pcm_substream *substream)
 {
-	struct snd_usx2y_substream	*subs = ((struct snd_usx2y_substream **)
-					 snd_pcm_substream_chip(substream))[substream->stream];
+	struct snd_usx2y_substream	*subs =
+		((struct snd_usx2y_substream **)
+		 snd_pcm_substream_chip(substream))[substream->stream];
 	struct snd_pcm_runtime	*runtime = substream->runtime;
 
 	if (!(subs->usx2y->chip_status & USX2Y_STAT_CHIP_MMAP_PCM_URBS))
 		return -EBUSY;
 
-	runtime->hw = SNDRV_PCM_STREAM_PLAYBACK == substream->stream ? snd_usx2y_2c :
-		(subs->usx2y->subs[3] ? snd_usx2y_4c : snd_usx2y_2c);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		runtime->hw = snd_usx2y_2c;
+	else
+		runtime->hw = (subs->usx2y->subs[3] ? snd_usx2y_4c : snd_usx2y_2c);
 	runtime->private_data = subs;
 	subs->pcm_substream = substream;
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIOD_TIME, 1000, 200000);
@@ -599,11 +619,11 @@ static const struct snd_pcm_ops snd_usx2y_usbpcm_ops = {
 static int usx2y_pcms_busy_check(struct snd_card *card)
 {
 	struct usx2ydev	*dev = usx2y(card);
+	struct snd_usx2y_substream *subs;
 	int i;
 
 	for (i = 0; i < dev->pcm_devs * 2; i++) {
-		struct snd_usx2y_substream *subs = dev->subs[i];
-
+		subs = dev->subs[i];
 		if (subs && subs->pcm_substream &&
 		    SUBSTREAM_BUSY(subs->pcm_substream))
 			return -EBUSY;
@@ -677,9 +697,9 @@ static int snd_usx2y_hwdep_pcm_mmap(struct snd_hwdep *hw, struct file *filp, str
 		return -EINVAL;
 	}
 
-	if (!usx2y->hwdep_pcm_shm) {
+	if (!usx2y->hwdep_pcm_shm)
 		return -ENODEV;
-	}
+
 	area->vm_ops = &snd_usx2y_hwdep_pcm_vm_ops;
 	area->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
 	area->vm_private_data = hw->private_data;
@@ -690,7 +710,7 @@ static void snd_usx2y_hwdep_pcm_private_free(struct snd_hwdep *hwdep)
 {
 	struct usx2ydev *usx2y = hwdep->private_data;
 
-	if (NULL != usx2y->hwdep_pcm_shm)
+	if (usx2y->hwdep_pcm_shm)
 		free_pages_exact(usx2y->hwdep_pcm_shm, sizeof(struct snd_usx2y_hwdep_pcm_shm));
 }
 
@@ -701,10 +721,11 @@ int usx2y_hwdep_pcm_new(struct snd_card *card)
 	struct snd_pcm *pcm;
 	struct usb_device *dev = usx2y(card)->dev;
 
-	if (1 != nr_of_packs())
+	if (nr_of_packs() != 1)
 		return 0;
 
-	if ((err = snd_hwdep_new(card, SND_USX2Y_USBPCM_ID, 1, &hw)) < 0)
+	err = snd_hwdep_new(card, SND_USX2Y_USBPCM_ID, 1, &hw);
+	if (err < 0)
 		return err;
 
 	hw->iface = SNDRV_HWDEP_IFACE_USX2Y_PCM;
@@ -717,9 +738,9 @@ int usx2y_hwdep_pcm_new(struct snd_card *card)
 	sprintf(hw->name, "/dev/bus/usb/%03d/%03d/hwdeppcm", dev->bus->busnum, dev->devnum);
 
 	err = snd_pcm_new(card, NAME_ALLCAPS" hwdep Audio", 2, 1, 1, &pcm);
-	if (err < 0) {
+	if (err < 0)
 		return err;
-	}
+
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_usx2y_usbpcm_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_usx2y_usbpcm_ops);
 
-- 
2.26.2

