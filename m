Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE27382D3E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 15:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 439591690;
	Mon, 17 May 2021 15:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 439591690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621257581;
	bh=NL42gk3ybgWKcZjl3GkXtsDxvidm1FpuPHd+lqh5DcY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=je95TlkHYPe5f/8CjvHssz9QDgb3daHA3xp6Mf+My0uVp54SQTS3X1hbj+K/D/AXg
	 cvbxArN38QZ6SmRPDTSvfix89+zIzljuFMY7FmL2WdkmaDpNi8EvHX/hK/pwft5k2A
	 FmnPOuh7Tx/VLemvb5L8AXUMignCTXsnFNbHsX0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A205F804DA;
	Mon, 17 May 2021 15:16:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6F79F804D9; Mon, 17 May 2021 15:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13402F80258
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13402F80258
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 504E0B1DA
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 13:15:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/11] ALSA: usx2y: Fix spaces
Date: Mon, 17 May 2021 15:15:36 +0200
Message-Id: <20210517131545.27252-3-tiwai@suse.de>
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

This patch corrects merely the spaces in the usx2y code, including the
superfluous trailing space in the debug prints and a slight reformat
of some comment lines.  Nothing really touches about the code itself.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/us122l.c          |  38 ++++----
 sound/usb/usx2y/usX2Yhwdep.c      |  52 ++++++-----
 sound/usb/usx2y/usX2Yhwdep.h      |   2 +-
 sound/usb/usx2y/usb_stream.c      |  43 ++++++---
 sound/usb/usx2y/usbus428ctldefs.h |  18 ++--
 sound/usb/usx2y/usbusx2y.c        |  78 ++++++++---------
 sound/usb/usx2y/usbusx2y.h        |   6 +-
 sound/usb/usx2y/usbusx2yaudio.c   | 140 +++++++++++++++++-------------
 sound/usb/usx2y/usx2yhwdeppcm.c   |  90 +++++++++----------
 9 files changed, 256 insertions(+), 211 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index 6e1bfe894dd5..53e7eb4480b3 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -49,7 +49,7 @@ static int us122l_create_usbmidi(struct snd_card *card)
 	static const struct snd_usb_audio_quirk quirk = {
 		.vendor_name =	"US122L",
 		.product_name =	NAME_ALLCAPS,
-		.ifnum = 	1,
+		.ifnum =	1,
 		.type = QUIRK_MIDI_US122L,
 		.data = &quirk_data
 	};
@@ -71,7 +71,7 @@ static int us144_create_usbmidi(struct snd_card *card)
 	static const struct snd_usb_audio_quirk quirk = {
 		.vendor_name =	"US144",
 		.product_name =	NAME_ALLCAPS,
-		.ifnum = 	0,
+		.ifnum =	0,
 		.type = QUIRK_MIDI_US122L,
 		.data = &quirk_data
 	};
@@ -95,6 +95,7 @@ static void pt_info_set(struct usb_device *dev, u8 v)
 static void usb_stream_hwdep_vm_open(struct vm_area_struct *area)
 {
 	struct us122l *us122l = area->vm_private_data;
+
 	atomic_inc(&us122l->mmap_count);
 	snd_printdd(KERN_DEBUG "%i\n", atomic_read(&us122l->mmap_count));
 }
@@ -138,6 +139,7 @@ static vm_fault_t usb_stream_hwdep_vm_fault(struct vm_fault *vmf)
 static void usb_stream_hwdep_vm_close(struct vm_area_struct *area)
 {
 	struct us122l *us122l = area->vm_private_data;
+
 	atomic_dec(&us122l->mmap_count);
 	snd_printdd(KERN_DEBUG "%i\n", atomic_read(&us122l->mmap_count));
 }
@@ -148,11 +150,11 @@ static const struct vm_operations_struct usb_stream_hwdep_vm_ops = {
 	.close = usb_stream_hwdep_vm_close,
 };
 
-
 static int usb_stream_hwdep_open(struct snd_hwdep *hw, struct file *file)
 {
 	struct us122l	*us122l = hw->private_data;
 	struct usb_interface *iface;
+
 	snd_printdd(KERN_DEBUG "%p %p\n", hw, file);
 	if (hw->used >= 2)
 		return -EBUSY;
@@ -173,6 +175,7 @@ static int usb_stream_hwdep_release(struct snd_hwdep *hw, struct file *file)
 {
 	struct us122l	*us122l = hw->private_data;
 	struct usb_interface *iface;
+
 	snd_printdd(KERN_DEBUG "%p %p\n", hw, file);
 
 	if (us122l->is_us144) {
@@ -243,6 +246,7 @@ static __poll_t usb_stream_hwdep_poll(struct snd_hwdep *hw,
 	mask = EPOLLIN | EPOLLOUT | EPOLLWRNORM | EPOLLERR;
 	if (mutex_trylock(&us122l->mutex)) {
 		struct usb_stream *s = us122l->sk.s;
+
 		if (s && s->state == usb_stream_ready) {
 			if (us122l->first == file)
 				polled = &s->periods_polled;
@@ -262,6 +266,7 @@ static __poll_t usb_stream_hwdep_poll(struct snd_hwdep *hw,
 static void us122l_stop(struct us122l *us122l)
 {
 	struct list_head *p;
+
 	list_for_each(p, &us122l->midi_list)
 		snd_usbmidi_input_stop(p);
 
@@ -320,13 +325,13 @@ static bool us122l_start(struct us122l *us122l,
 	err = us122l_set_sample_rate(us122l->dev, rate);
 	if (err < 0) {
 		us122l_stop(us122l);
-		snd_printk(KERN_ERR "us122l_set_sample_rate error \n");
+		snd_printk(KERN_ERR "us122l_set_sample_rate error\n");
 		goto out;
 	}
 	err = usb_stream_start(&us122l->sk);
 	if (err < 0) {
 		us122l_stop(us122l);
-		snd_printk(KERN_ERR "us122l_start error %i \n", err);
+		snd_printk(KERN_ERR "us122l_start error %i\n", err);
 		goto out;
 	}
 	list_for_each(p, &us122l->midi_list)
@@ -431,7 +436,6 @@ static int usb_stream_hwdep_new(struct snd_card *card)
 	return 0;
 }
 
-
 static bool us122l_create_card(struct snd_card *card)
 {
 	int err;
@@ -440,13 +444,13 @@ static bool us122l_create_card(struct snd_card *card)
 	if (us122l->is_us144) {
 		err = usb_set_interface(us122l->dev, 0, 1);
 		if (err) {
-			snd_printk(KERN_ERR "usb_set_interface error \n");
+			snd_printk(KERN_ERR "usb_set_interface error\n");
 			return false;
 		}
 	}
 	err = usb_set_interface(us122l->dev, 1, 1);
 	if (err) {
-		snd_printk(KERN_ERR "usb_set_interface error \n");
+		snd_printk(KERN_ERR "usb_set_interface error\n");
 		return false;
 	}
 
@@ -461,13 +465,14 @@ static bool us122l_create_card(struct snd_card *card)
 	else
 		err = us122l_create_usbmidi(card);
 	if (err < 0) {
-		snd_printk(KERN_ERR "us122l_create_usbmidi error %i \n", err);
+		snd_printk(KERN_ERR "us122l_create_usbmidi error %i\n", err);
 		goto stop;
 	}
 	err = usb_stream_hwdep_new(card);
 	if (err < 0) {
-/* release the midi resources */
+		/* release the midi resources */
 		struct list_head *p;
+
 		list_for_each(p, &us122l->midi_list)
 			snd_usbmidi_disconnect(p);
 
@@ -484,6 +489,7 @@ static void snd_us122l_free(struct snd_card *card)
 {
 	struct us122l	*us122l = US122L(card);
 	int		index = us122l->card_index;
+
 	if (index >= 0  &&  index < SNDRV_CARDS)
 		snd_us122l_card_used[index] = 0;
 }
@@ -565,7 +571,7 @@ static int snd_us122l_probe(struct usb_interface *intf,
 
 	if (id->driver_info & US122L_FLAG_US144 &&
 			device->speed == USB_SPEED_HIGH) {
-		snd_printk(KERN_ERR "disable ehci-hcd to run US-144 \n");
+		snd_printk(KERN_ERR "disable ehci-hcd to run US-144\n");
 		return -ENODEV;
 	}
 
@@ -601,7 +607,7 @@ static void snd_us122l_disconnect(struct usb_interface *intf)
 	us122l_stop(us122l);
 	mutex_unlock(&us122l->mutex);
 
-/* release the midi resources */
+	/* release the midi resources */
 	list_for_each(p, &us122l->midi_list) {
 		snd_usbmidi_disconnect(p);
 	}
@@ -661,13 +667,13 @@ static int snd_us122l_resume(struct usb_interface *intf)
 	if (us122l->is_us144) {
 		err = usb_set_interface(us122l->dev, 0, 1);
 		if (err) {
-			snd_printk(KERN_ERR "usb_set_interface error \n");
+			snd_printk(KERN_ERR "usb_set_interface error\n");
 			goto unlock;
 		}
 	}
 	err = usb_set_interface(us122l->dev, 1, 1);
 	if (err) {
-		snd_printk(KERN_ERR "usb_set_interface error \n");
+		snd_printk(KERN_ERR "usb_set_interface error\n");
 		goto unlock;
 	}
 
@@ -677,7 +683,7 @@ static int snd_us122l_resume(struct usb_interface *intf)
 	err = us122l_set_sample_rate(us122l->dev,
 				     us122l->sk.s->cfg.sample_rate);
 	if (err < 0) {
-		snd_printk(KERN_ERR "us122l_set_sample_rate error \n");
+		snd_printk(KERN_ERR "us122l_set_sample_rate error\n");
 		goto unlock;
 	}
 	err = usb_stream_start(&us122l->sk);
@@ -717,8 +723,8 @@ static const struct usb_device_id snd_us122l_usb_id_table[] = {
 	},
 	{ /* terminator */ }
 };
-
 MODULE_DEVICE_TABLE(usb, snd_us122l_usb_id_table);
+
 static struct usb_driver snd_us122l_usb_driver = {
 	.name =		"snd-usb-us122l",
 	.probe =	snd_us122l_probe,
diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
index 10868c3fb656..90246518dbdd 100644
--- a/sound/usb/usx2y/usX2Yhwdep.c
+++ b/sound/usb/usx2y/usX2Yhwdep.c
@@ -21,13 +21,13 @@
 static vm_fault_t snd_us428ctls_vm_fault(struct vm_fault *vmf)
 {
 	unsigned long offset;
-	struct page * page;
+	struct page *page;
 	void *vaddr;
 
 	snd_printdd("ENTER, start %lXh, pgoff %ld\n",
 		   vmf->vma->vm_start,
 		   vmf->pgoff);
-	
+
 	offset = vmf->pgoff << PAGE_SHIFT;
 	vaddr = (char *)((struct usx2ydev *)vmf->vma->vm_private_data)->us428ctls_sharedmem + offset;
 	page = virt_to_page(vaddr);
@@ -44,20 +44,20 @@ static const struct vm_operations_struct us428ctls_vm_ops = {
 	.fault = snd_us428ctls_vm_fault,
 };
 
-static int snd_us428ctls_mmap(struct snd_hwdep * hw, struct file *filp, struct vm_area_struct *area)
+static int snd_us428ctls_mmap(struct snd_hwdep *hw, struct file *filp, struct vm_area_struct *area)
 {
 	unsigned long	size = (unsigned long)(area->vm_end - area->vm_start);
 	struct usx2ydev	*us428 = hw->private_data;
 
 	// FIXME this hwdep interface is used twice: fpga download and mmap for controlling Lights etc. Maybe better using 2 hwdep devs?
 	// so as long as the device isn't fully initialised yet we return -EBUSY here.
- 	if (!(us428->chip_status & USX2Y_STAT_CHIP_INIT))
+	if (!(us428->chip_status & USX2Y_STAT_CHIP_INIT))
 		return -EBUSY;
 
-	/* if userspace tries to mmap beyond end of our buffer, fail */ 
-        if (size > PAGE_ALIGN(sizeof(struct us428ctls_sharedmem))) {
-		snd_printd( "%lu > %lu\n", size, (unsigned long)sizeof(struct us428ctls_sharedmem)); 
-                return -EINVAL;
+	/* if userspace tries to mmap beyond end of our buffer, fail */
+	if (size > PAGE_ALIGN(sizeof(struct us428ctls_sharedmem))) {
+		snd_printd("%lu > %lu\n", size, (unsigned long)sizeof(struct us428ctls_sharedmem));
+		return -EINVAL;
 	}
 
 	if (!us428->us428ctls_sharedmem) {
@@ -79,6 +79,7 @@ static __poll_t snd_us428ctls_poll(struct snd_hwdep *hw, struct file *file, poll
 	__poll_t	mask = 0;
 	struct usx2ydev	*us428 = hw->private_data;
 	struct us428ctls_sharedmem *shm = us428->us428ctls_sharedmem;
+
 	if (us428->chip_status & USX2Y_STAT_CHIP_HUP)
 		return EPOLLHUP;
 
@@ -123,7 +124,6 @@ static int snd_usx2y_hwdep_dsp_status(struct snd_hwdep *hw,
 	return 0;
 }
 
-
 static int usx2y_create_usbmidi(struct snd_card *card)
 {
 	static const struct snd_usb_midi_endpoint_info quirk_data_1 = {
@@ -135,8 +135,8 @@ static int usx2y_create_usbmidi(struct snd_card *card)
 	static const struct snd_usb_audio_quirk quirk_1 = {
 		.vendor_name =	"TASCAM",
 		.product_name =	NAME_ALLCAPS,
-		.ifnum = 	0,
-       		.type = QUIRK_MIDI_FIXED_ENDPOINT,
+		.ifnum =	0,
+		.type = QUIRK_MIDI_FIXED_ENDPOINT,
 		.data = &quirk_data_1
 	};
 	static const struct snd_usb_midi_endpoint_info quirk_data_2 = {
@@ -148,8 +148,8 @@ static int usx2y_create_usbmidi(struct snd_card *card)
 	static const struct snd_usb_audio_quirk quirk_2 = {
 		.vendor_name =	"TASCAM",
 		.product_name =	"US428",
-		.ifnum = 	0,
-       		.type = QUIRK_MIDI_FIXED_ENDPOINT,
+		.ifnum =	0,
+		.type = QUIRK_MIDI_FIXED_ENDPOINT,
 		.data = &quirk_data_2
 	};
 	struct usb_device *dev = usx2y(card)->dev;
@@ -158,7 +158,7 @@ static int usx2y_create_usbmidi(struct snd_card *card)
 		le16_to_cpu(dev->descriptor.idProduct) == USB_ID_US428 ?
 		&quirk_2 : &quirk_1;
 
-	snd_printdd("usx2y_create_usbmidi \n");
+	snd_printdd("usx2y_create_usbmidi\n");
 	return snd_usbmidi_create(card, iface, &usx2y(card)->midi_list, quirk);
 }
 
@@ -168,10 +168,10 @@ static int usx2y_create_alsa_devices(struct snd_card *card)
 
 	do {
 		if ((err = usx2y_create_usbmidi(card)) < 0) {
-			snd_printk(KERN_ERR "usx2y_create_alsa_devices: usx2y_create_usbmidi error %i \n", err);
+			snd_printk(KERN_ERR "usx2y_create_alsa_devices: usx2y_create_usbmidi error %i\n", err);
 			break;
 		}
-		if ((err = usx2y_audio_create(card)) < 0) 
+		if ((err = usx2y_audio_create(card)) < 0)
 			break;
 		if ((err = usx2y_hwdep_pcm_new(card)) < 0)
 			break;
@@ -180,17 +180,17 @@ static int usx2y_create_alsa_devices(struct snd_card *card)
 	} while (0);
 
 	return err;
-} 
+}
 
 static int snd_usx2y_hwdep_dsp_load(struct snd_hwdep *hw,
 				    struct snd_hwdep_dsp_image *dsp)
 {
 	struct usx2ydev *priv = hw->private_data;
-	struct usb_device* dev = priv->dev;
+	struct usb_device *dev = priv->dev;
 	int lret, err;
 	char *buf;
 
-	snd_printdd( "dsp_load %s\n", dsp->name);
+	snd_printdd("dsp_load %s\n", dsp->name);
 
 	buf = memdup_user(dsp->image, dsp->length);
 	if (IS_ERR(buf))
@@ -198,7 +198,7 @@ static int snd_usx2y_hwdep_dsp_load(struct snd_hwdep *hw,
 
 	err = usb_set_interface(dev, 0, 1);
 	if (err)
-		snd_printk(KERN_ERR "usb_set_interface error \n");
+		snd_printk(KERN_ERR "usb_set_interface error\n");
 	else
 		err = usb_bulk_msg(dev, usb_sndbulkpipe(dev, 2), buf, dsp->length, &lret, 6000);
 	kfree(buf);
@@ -208,28 +208,27 @@ static int snd_usx2y_hwdep_dsp_load(struct snd_hwdep *hw,
 		msleep(250);				// give the device some time
 		err = usx2y_async_seq04_init(priv);
 		if (err) {
-			snd_printk(KERN_ERR "usx2y_async_seq04_init error \n");
+			snd_printk(KERN_ERR "usx2y_async_seq04_init error\n");
 			return err;
 		}
 		err = usx2y_in04_init(priv);
 		if (err) {
-			snd_printk(KERN_ERR "usx2y_in04_init error \n");
+			snd_printk(KERN_ERR "usx2y_in04_init error\n");
 			return err;
 		}
 		err = usx2y_create_alsa_devices(hw->card);
 		if (err) {
-			snd_printk(KERN_ERR "usx2y_create_alsa_devices error %i \n", err);
+			snd_printk(KERN_ERR "usx2y_create_alsa_devices error %i\n", err);
 			snd_card_free(hw->card);
 			return err;
 		}
-		priv->chip_status |= USX2Y_STAT_CHIP_INIT; 
+		priv->chip_status |= USX2Y_STAT_CHIP_INIT;
 		snd_printdd("%s: alsa all started\n", hw->name);
 	}
 	return err;
 }
 
-
-int usx2y_hwdep_new(struct snd_card *card, struct usb_device* device)
+int usx2y_hwdep_new(struct snd_card *card, struct usb_device *device)
 {
 	int err;
 	struct snd_hwdep *hw;
@@ -247,4 +246,3 @@ int usx2y_hwdep_new(struct snd_card *card, struct usb_device* device)
 	sprintf(hw->name, "/dev/bus/usb/%03d/%03d", device->bus->busnum, device->devnum);
 	return 0;
 }
-
diff --git a/sound/usb/usx2y/usX2Yhwdep.h b/sound/usb/usx2y/usX2Yhwdep.h
index 34cef625712c..0c9946d9cd99 100644
--- a/sound/usb/usx2y/usX2Yhwdep.h
+++ b/sound/usb/usx2y/usX2Yhwdep.h
@@ -2,6 +2,6 @@
 #ifndef USX2YHWDEP_H
 #define USX2YHWDEP_H
 
-int usx2y_hwdep_new(struct snd_card *card, struct usb_device* device);
+int usx2y_hwdep_new(struct snd_card *card, struct usb_device *device);
 
 #endif
diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
index 091c071b270a..2d4934b68083 100644
--- a/sound/usb/usx2y/usb_stream.c
+++ b/sound/usb/usx2y/usb_stream.c
@@ -8,12 +8,12 @@
 
 #include "usb_stream.h"
 
-
 /*                             setup                                  */
 
 static unsigned usb_stream_next_packet_size(struct usb_stream_kernel *sk)
 {
 	struct usb_stream *s = sk->s;
+
 	sk->out_phase_peeked = (sk->out_phase & 0xffff) + sk->freqn;
 	return (sk->out_phase_peeked >> 16) * s->cfg.frame_size;
 }
@@ -25,6 +25,7 @@ static void playback_prep_freqn(struct usb_stream_kernel *sk, struct urb *urb)
 
 	for (pack = 0; pack < sk->n_o_ps; pack++) {
 		int l = usb_stream_next_packet_size(sk);
+
 		if (s->idle_outsize + lb + l > s->period_size)
 			goto check;
 
@@ -56,6 +57,7 @@ static int init_pipe_urbs(struct usb_stream_kernel *sk, unsigned use_packsize,
 	     ++u, transfer += transfer_length) {
 		struct urb *urb = urbs[u];
 		struct usb_iso_packet_descriptor *desc;
+
 		urb->transfer_buffer = transfer;
 		urb->dev = dev;
 		urb->pipe = pipe;
@@ -84,9 +86,8 @@ static int init_urbs(struct usb_stream_kernel *sk, unsigned use_packsize,
 		      struct usb_device *dev, int in_pipe, int out_pipe)
 {
 	struct usb_stream	*s = sk->s;
-	char			*indata = (char *)s + sizeof(*s) +
-					sizeof(struct usb_stream_packet) *
-					s->inpackets;
+	char			*indata =
+		(char *)s + sizeof(*s) + sizeof(struct usb_stream_packet) * s->inpackets;
 	int			u;
 
 	for (u = 0; u < USB_STREAM_NURBS; ++u) {
@@ -107,7 +108,6 @@ static int init_urbs(struct usb_stream_kernel *sk, unsigned use_packsize,
 	return 0;
 }
 
-
 /*
  * convert a sampling rate into our full speed format (fs/1000 in Q16.16)
  * this will overflow at approx 524 kHz
@@ -231,12 +231,12 @@ struct usb_stream *usb_stream_new(struct usb_stream_kernel *sk,
 	return sk->s;
 }
 
-
 /*                             start                                  */
 
 static bool balance_check(struct usb_stream_kernel *sk, struct urb *urb)
 {
 	bool r;
+
 	if (unlikely(urb->status)) {
 		if (urb->status != -ESHUTDOWN && urb->status != -ENOENT)
 			snd_printk(KERN_WARNING "status=%i\n", urb->status);
@@ -267,6 +267,7 @@ static void subs_set_complete(struct urb **urbs, void (*complete)(struct urb *))
 
 	for (u = 0; u < USB_STREAM_NURBS; u++) {
 		struct urb *urb = urbs[u];
+
 		urb->complete = complete;
 	}
 }
@@ -284,6 +285,7 @@ static int usb_stream_prepare_playback(struct usb_stream_kernel *sk,
 
 	for (; s->sync_packet < 0; ++p, ++s->sync_packet) {
 		struct urb *ii = sk->completed_inurb;
+
 		id = ii->iso_frame_desc +
 			ii->number_of_packets + s->sync_packet;
 		l = id->actual_length;
@@ -351,6 +353,7 @@ static int submit_urbs(struct usb_stream_kernel *sk,
 		       struct urb *inurb, struct urb *outurb)
 {
 	int err;
+
 	prepare_inurb(sk->idle_outurb->number_of_packets, sk->idle_inurb);
 	err = usb_submit_urb(sk->idle_inurb, GFP_ATOMIC);
 	if (err < 0)
@@ -447,6 +450,7 @@ static void stream_idle(struct usb_stream_kernel *sk,
 
 	for (p = 0; p < inurb->number_of_packets; ++p) {
 		struct usb_iso_packet_descriptor *id = inurb->iso_frame_desc;
+
 		l = id[p].actual_length;
 		if (unlikely(l == 0 || id[p].status)) {
 			snd_printk(KERN_WARNING "underrun, status=%u\n",
@@ -503,6 +507,7 @@ static void stream_idle(struct usb_stream_kernel *sk,
 static void i_capture_idle(struct urb *urb)
 {
 	struct usb_stream_kernel *sk = urb->context;
+
 	if (balance_capture(sk, urb))
 		stream_idle(sk, urb, sk->i_urb);
 }
@@ -510,6 +515,7 @@ static void i_capture_idle(struct urb *urb)
 static void i_playback_idle(struct urb *urb)
 {
 	struct usb_stream_kernel *sk = urb->context;
+
 	if (balance_playback(sk, urb))
 		stream_idle(sk, sk->i_urb, urb);
 }
@@ -518,10 +524,12 @@ static void stream_start(struct usb_stream_kernel *sk,
 			 struct urb *inurb, struct urb *outurb)
 {
 	struct usb_stream *s = sk->s;
+
 	if (s->state >= usb_stream_sync1) {
 		int l, p, max_diff, max_diff_0;
 		int urb_size = 0;
 		unsigned frames_per_packet, min_frames = 0;
+
 		frames_per_packet = (s->period_size - s->idle_insize);
 		frames_per_packet <<= 8;
 		frames_per_packet /=
@@ -536,6 +544,7 @@ static void stream_start(struct usb_stream_kernel *sk,
 		max_diff = max_diff_0;
 		for (p = 0; p < inurb->number_of_packets; ++p) {
 			int diff;
+
 			l = inurb->iso_frame_desc[p].actual_length;
 			urb_size += l;
 
@@ -562,6 +571,7 @@ static void stream_start(struct usb_stream_kernel *sk,
 			s->next_inpacket_split_at = 0;
 		} else {
 			unsigned split = s->inpacket_head;
+
 			l = s->idle_insize;
 			while (l > s->inpacket[split].length) {
 				l -= s->inpacket[split].length;
@@ -609,6 +619,7 @@ static void i_capture_start(struct urb *urb)
 
 	for (p = 0; p < urb->number_of_packets; ++p) {
 		int l = id[p].actual_length;
+
 		if (l < s->cfg.frame_size) {
 			++empty;
 			if (s->state >= usb_stream_sync0) {
@@ -628,6 +639,7 @@ static void i_capture_start(struct urb *urb)
 		       urb->iso_frame_desc[0].actual_length);
 		for (pack = 1; pack < urb->number_of_packets; ++pack) {
 			int l = urb->iso_frame_desc[pack].actual_length;
+
 			printk(KERN_CONT " %i", l);
 		}
 		printk(KERN_CONT "\n");
@@ -643,6 +655,7 @@ static void i_capture_start(struct urb *urb)
 static void i_playback_start(struct urb *urb)
 {
 	struct usb_stream_kernel *sk = urb->context;
+
 	if (balance_playback(sk, urb))
 		stream_start(sk, sk->i_urb, urb);
 }
@@ -671,6 +684,7 @@ int usb_stream_start(struct usb_stream_kernel *sk)
 	for (u = 0; u < 2; u++) {
 		struct urb *inurb = sk->inurb[u];
 		struct urb *outurb = sk->outurb[u];
+
 		playback_prep_freqn(sk, outurb);
 		inurb->number_of_packets = outurb->number_of_packets;
 		inurb->transfer_buffer_length =
@@ -680,6 +694,7 @@ int usb_stream_start(struct usb_stream_kernel *sk)
 		if (u == 0) {
 			int now;
 			struct usb_device *dev = inurb->dev;
+
 			frame = usb_get_current_frame_number(dev);
 			do {
 				now = usb_get_current_frame_number(dev);
@@ -688,14 +703,16 @@ int usb_stream_start(struct usb_stream_kernel *sk)
 		}
 		err = usb_submit_urb(inurb, GFP_ATOMIC);
 		if (err < 0) {
-			snd_printk(KERN_ERR"usb_submit_urb(sk->inurb[%i])"
-				   " returned %i\n", u, err);
+			snd_printk(KERN_ERR
+				   "usb_submit_urb(sk->inurb[%i]) returned %i\n",
+				   u, err);
 			return err;
 		}
 		err = usb_submit_urb(outurb, GFP_ATOMIC);
 		if (err < 0) {
-			snd_printk(KERN_ERR"usb_submit_urb(sk->outurb[%i])"
-				   " returned %i\n", u, err);
+			snd_printk(KERN_ERR
+				   "usb_submit_urb(sk->outurb[%i]) returned %i\n",
+				   u, err);
 			return err;
 		}
 
@@ -716,8 +733,8 @@ int usb_stream_start(struct usb_stream_kernel *sk)
 			snd_printd(KERN_DEBUG "goto dotry;\n");
 			goto dotry;
 		}
-		snd_printk(KERN_WARNING"couldn't start"
-			   " all urbs on the same start_frame.\n");
+		snd_printk(KERN_WARNING
+			   "couldn't start all urbs on the same start_frame.\n");
 		return -EFAULT;
 	}
 
@@ -729,6 +746,7 @@ int usb_stream_start(struct usb_stream_kernel *sk)
 /* wait, check */
 	{
 		int wait_ms = 3000;
+
 		while (s->state != usb_stream_ready && wait_ms > 0) {
 			snd_printdd(KERN_DEBUG "%i\n", s->state);
 			msleep(200);
@@ -745,6 +763,7 @@ int usb_stream_start(struct usb_stream_kernel *sk)
 void usb_stream_stop(struct usb_stream_kernel *sk)
 {
 	int u;
+
 	if (!sk->s)
 		return;
 	for (u = 0; u < USB_STREAM_NURBS; ++u) {
diff --git a/sound/usb/usx2y/usbus428ctldefs.h b/sound/usb/usx2y/usbus428ctldefs.h
index 7366a940ffbb..06b27d23d3c2 100644
--- a/sound/usb/usx2y/usbus428ctldefs.h
+++ b/sound/usb/usx2y/usbus428ctldefs.h
@@ -39,15 +39,15 @@ enum E_IN84 {
 
 
 struct us428_ctls {
-	unsigned char   fader[9];
-	unsigned char 	transport;
-	unsigned char 	modifier;
-	unsigned char 	filters_elect;
-	unsigned char 	select;
-	unsigned char   mute;
-	unsigned char   unknown;
-	unsigned char   wswitch;	     
-	unsigned char   wheel[5];
+	unsigned char	fader[9];
+	unsigned char	transport;
+	unsigned char	modifier;
+	unsigned char	filters_elect;
+	unsigned char	select;
+	unsigned char	mute;
+	unsigned char	unknown;
+	unsigned char	wswitch;
+	unsigned char	wheel[5];
 };
 
 struct us428_set_byte {
diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index cdbb27a96e04..88f2249a0ad5 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -70,7 +70,7 @@
 
 2003-11-03 Karsten Wiese
 	Version 0.3:
-	24Bit support. 
+	24Bit support.
 	"arecord -D hw:1 -c 2 -r 48000 -M -f S24_3LE|aplay -D hw:1 -c 2 -r 48000 -M -f S24_3LE" works.
 
 2003-08-22 Karsten Wiese
@@ -94,16 +94,15 @@
 	This helped me much on my slowish PII 400 & PIII 500.
 	ACPI yet untested but might cause the same bad behaviour.
 	Use a kernel with lowlatency and preemptiv patches applied.
-	To autoload snd-usb-midi append a line 
+	To autoload snd-usb-midi append a line
 		post-install snd-usb-us428 modprobe snd-usb-midi
 	to /etc/modules.conf.
 
 	known problems:
 	sliders, knobs, lights not yet handled except MASTER Volume slider.
-       	"pcm -c 2" doesn't work. "pcm -c 2 -m direct_interleaved" does.
+	"pcm -c 2" doesn't work. "pcm -c 2 -m direct_interleaved" does.
 	KDE3: "Enable full duplex operation" deadlocks.
 
-	
 2002-08-31 Karsten Wiese
 	Version 0.0.3: audio also simplex;
 	simplifying: iso urbs only 1 packet, melted structs.
@@ -115,7 +114,7 @@
 	The firmware has been sniffed from win2k us-428 driver 3.09.
 
  *   Copyright (c) 2002 - 2004 Karsten Wiese
-*/
+ */
 
 #include <linux/init.h>
 #include <linux/module.h>
@@ -132,14 +131,12 @@
 #include "usbusx2y.h"
 #include "usX2Yhwdep.h"
 
-
-
 MODULE_AUTHOR("Karsten Wiese <annabellesgarden@yahoo.de>");
 MODULE_DESCRIPTION("TASCAM "NAME_ALLCAPS" Version 0.8.7.2");
 MODULE_LICENSE("GPL");
 
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX; /* Index 0-max */
-static char* id[SNDRV_CARDS] = SNDRV_DEFAULT_STR; /* Id for this card */
+static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR; /* Id for this card */
 static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP; /* Enable this card */
 
 module_param_array(index, int, NULL, 0444);
@@ -149,22 +146,23 @@ MODULE_PARM_DESC(id, "ID string for "NAME_ALLCAPS".");
 module_param_array(enable, bool, NULL, 0444);
 MODULE_PARM_DESC(enable, "Enable "NAME_ALLCAPS".");
 
-
 static int snd_usx2y_card_used[SNDRV_CARDS];
 
-static void usx2y_usb_disconnect(struct usb_device* usb_device, void* ptr);
+static void usx2y_usb_disconnect(struct usb_device *usb_device, void *ptr);
 static void snd_usx2y_card_private_free(struct snd_card *card);
 
-/* 
- * pipe 4 is used for switching the lamps, setting samplerate, volumes ....   
+/*
+ * pipe 4 is used for switching the lamps, setting samplerate, volumes ....
  */
 static void i_usx2y_out04_int(struct urb *urb)
 {
 #ifdef CONFIG_SND_DEBUG
 	if (urb->status) {
-		int 		i;
+		int i;
 		struct usx2ydev *usx2y = urb->context;
-		for (i = 0; i < 10 && usx2y->as04.urb[i] != urb; i++);
+
+		for (i = 0; i < 10 && usx2y->as04.urb[i] != urb; i++)
+			;
 		snd_printdd("i_usx2y_out04_int() urb %i status=%i\n", i, urb->status);
 	}
 #endif
@@ -186,22 +184,25 @@ static void i_usx2y_in04_int(struct urb *urb)
 	//	printk("%i:0x%02X ", 8, (int)((unsigned char*)usx2y->in04_buf)[8]); Master volume shows 0 here if fader is at max during boot ?!?
 	if (us428ctls) {
 		int diff = -1;
+
 		if (-2 == us428ctls->ctl_snapshot_last) {
 			diff = 0;
 			memcpy(usx2y->in04_last, usx2y->in04_buf, sizeof(usx2y->in04_last));
 			us428ctls->ctl_snapshot_last = -1;
 		} else {
 			int i;
+
 			for (i = 0; i < 21; i++) {
-				if (usx2y->in04_last[i] != ((char*)usx2y->in04_buf)[i]) {
+				if (usx2y->in04_last[i] != ((char *)usx2y->in04_buf)[i]) {
 					if (diff < 0)
 						diff = i;
-					usx2y->in04_last[i] = ((char*)usx2y->in04_buf)[i];
+					usx2y->in04_last[i] = ((char *)usx2y->in04_buf)[i];
 				}
 			}
 		}
 		if (0 <= diff) {
 			int n = us428ctls->ctl_snapshot_last + 1;
+
 			if (n >= N_US428_CTL_BUFS  ||  n < 0)
 				n = 0;
 			memcpy(us428ctls->ctl_snapshot + n, usx2y->in04_buf, sizeof(us428ctls->ctl_snapshot[0]));
@@ -210,8 +211,7 @@ static void i_usx2y_in04_int(struct urb *urb)
 			wake_up(&usx2y->us428ctls_wait_queue_head);
 		}
 	}
-	
-	
+
 	if (usx2y->us04) {
 		if (0 == usx2y->us04->submitted)
 			do {
@@ -221,11 +221,13 @@ static void i_usx2y_in04_int(struct urb *urb)
 		if (us428ctls && us428ctls->p4out_last >= 0 && us428ctls->p4out_last < N_US428_P4OUT_BUFS) {
 			if (us428ctls->p4out_last != us428ctls->p4out_sent) {
 				int j, send = us428ctls->p4out_sent + 1;
+
 				if (send >= N_US428_P4OUT_BUFS)
 					send = 0;
 				for (j = 0; j < URBS_ASYNC_SEQ  &&  !err; ++j)
 					if (0 == usx2y->as04.urb[j]->status) {
 						struct us428_p4out *p4out = us428ctls->p4out + send;	// FIXME if more than 1 p4out is new, 1 gets lost.
+
 						usb_fill_bulk_urb(usx2y->as04.urb[j], usx2y->dev,
 								  usb_sndbulkpipe(usx2y->dev, 0x04), &p4out->val.vol,
 								  p4out->type == ELT_LIGHT ? sizeof(struct us428_lights) : 5,
@@ -249,8 +251,7 @@ static void i_usx2y_in04_int(struct urb *urb)
  */
 int usx2y_async_seq04_init(struct usx2ydev *usx2y)
 {
-	int	err = 0,
-		i;
+	int	err = 0, i;
 
 	usx2y->as04.buffer = kmalloc_array(URBS_ASYNC_SEQ,
 					   URB_DATA_LEN_ASYNC_SEQ, GFP_KERNEL);
@@ -262,11 +263,10 @@ int usx2y_async_seq04_init(struct usx2ydev *usx2y)
 				err = -ENOMEM;
 				break;
 			}
-			usb_fill_bulk_urb(	usx2y->as04.urb[i], usx2y->dev,
-						usb_sndbulkpipe(usx2y->dev, 0x04),
-						usx2y->as04.buffer + URB_DATA_LEN_ASYNC_SEQ*i, 0,
-						i_usx2y_out04_int, usx2y
-				);
+			usb_fill_bulk_urb(usx2y->as04.urb[i], usx2y->dev,
+					  usb_sndbulkpipe(usx2y->dev, 0x04),
+					  usx2y->as04.buffer + URB_DATA_LEN_ASYNC_SEQ*i, 0,
+					  i_usx2y_out04_int, usx2y);
 			err = usb_urb_ep_type_check(usx2y->as04.urb[i]);
 			if (err < 0)
 				break;
@@ -276,12 +276,12 @@ int usx2y_async_seq04_init(struct usx2ydev *usx2y)
 
 int usx2y_in04_init(struct usx2ydev *usx2y)
 {
-	if (! (usx2y->in04_urb = usb_alloc_urb(0, GFP_KERNEL)))
+	if (!(usx2y->in04_urb = usb_alloc_urb(0, GFP_KERNEL)))
 		return -ENOMEM;
 
-	if (! (usx2y->in04_buf = kmalloc(21, GFP_KERNEL)))
+	if (!(usx2y->in04_buf = kmalloc(21, GFP_KERNEL)))
 		return -ENOMEM;
-	 
+
 	init_waitqueue_head(&usx2y->in04_wait_queue);
 	usb_fill_int_urb(usx2y->in04_urb, usx2y->dev, usb_rcvintpipe(usx2y->dev, 0x4),
 			 usx2y->in04_buf, 21,
@@ -295,6 +295,7 @@ int usx2y_in04_init(struct usx2ydev *usx2y)
 static void usx2y_unlinkseq(struct snd_usx2y_async_seq *s)
 {
 	int	i;
+
 	for (i = 0; i < URBS_ASYNC_SEQ; ++i) {
 		usb_kill_urb(s->urb[i]);
 		usb_free_urb(s->urb[i]);
@@ -303,32 +304,32 @@ static void usx2y_unlinkseq(struct snd_usx2y_async_seq *s)
 	kfree(s->buffer);
 }
 
-
 static const struct usb_device_id snd_usx2y_usb_id_table[] = {
 	{
 		.match_flags =	USB_DEVICE_ID_MATCH_DEVICE,
 		.idVendor =	0x1604,
-		.idProduct =	USB_ID_US428 
+		.idProduct =	USB_ID_US428
 	},
 	{
 		.match_flags =	USB_DEVICE_ID_MATCH_DEVICE,
 		.idVendor =	0x1604,
-		.idProduct =	USB_ID_US122 
+		.idProduct =	USB_ID_US122
 	},
- 	{
+	{
 		.match_flags =	USB_DEVICE_ID_MATCH_DEVICE,
 		.idVendor =	0x1604,
 		.idProduct =	USB_ID_US224
 	},
 	{ /* terminator */ }
 };
+MODULE_DEVICE_TABLE(usb, snd_usx2y_usb_id_table);
 
 static int usx2y_create_card(struct usb_device *device,
 			     struct usb_interface *intf,
 			     struct snd_card **cardp)
 {
 	int		dev;
-	struct snd_card *	card;
+	struct snd_card *card;
 	int err;
 
 	for (dev = 0; dev < SNDRV_CARDS; ++dev)
@@ -349,7 +350,7 @@ static int usx2y_create_card(struct usb_device *device,
 	strcpy(card->driver, "USB "NAME_ALLCAPS"");
 	sprintf(card->shortname, "TASCAM "NAME_ALLCAPS"");
 	sprintf(card->longname, "%s (%x:%x if %d at %03d/%03d)",
-		card->shortname, 
+		card->shortname,
 		le16_to_cpu(device->descriptor.idVendor),
 		le16_to_cpu(device->descriptor.idProduct),
 		0,//us428(card)->usbmidi.ifnum,
@@ -359,14 +360,13 @@ static int usx2y_create_card(struct usb_device *device,
 	return 0;
 }
 
-
 static int usx2y_usb_probe(struct usb_device *device,
 			   struct usb_interface *intf,
 			   const struct usb_device_id *device_id,
 			   struct snd_card **cardp)
 {
 	int		err;
-	struct snd_card *	card;
+	struct snd_card *card;
 
 	*cardp = NULL;
 	if (le16_to_cpu(device->descriptor.idVendor) != 0x1604 ||
@@ -408,7 +408,6 @@ static void snd_usx2y_disconnect(struct usb_interface *intf)
 				 usb_get_intfdata(intf));
 }
 
-MODULE_DEVICE_TABLE(usb, snd_usx2y_usb_id_table);
 static struct usb_driver snd_usx2y_usb_driver = {
 	.name =		"snd-usb-usx2y",
 	.probe =	snd_usx2y_probe,
@@ -430,12 +429,13 @@ static void snd_usx2y_card_private_free(struct snd_card *card)
 /*
  * Frees the device.
  */
-static void usx2y_usb_disconnect(struct usb_device *device, void* ptr)
+static void usx2y_usb_disconnect(struct usb_device *device, void *ptr)
 {
 	if (ptr) {
 		struct snd_card *card = ptr;
 		struct usx2ydev *usx2y = usx2y(card);
 		struct list_head *p;
+
 		usx2y->chip_status = USX2Y_STAT_CHIP_HUP;
 		usx2y_unlinkseq(&usx2y->as04);
 		usb_kill_urb(usx2y->in04_urb);
@@ -444,7 +444,7 @@ static void usx2y_usb_disconnect(struct usb_device *device, void* ptr)
 		list_for_each(p, &usx2y->midi_list) {
 			snd_usbmidi_disconnect(p);
 		}
-		if (usx2y->us428ctls_sharedmem) 
+		if (usx2y->us428ctls_sharedmem)
 			wake_up(&usx2y->us428ctls_wait_queue_head);
 		snd_card_free(card);
 	}
diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
index c330af628bcc..5ad6e3767621 100644
--- a/sound/usb/usx2y/usbusx2y.h
+++ b/sound/usb/usx2y/usbusx2y.h
@@ -3,9 +3,9 @@
 #define USBUSX2Y_H
 #include "../usbaudio.h"
 #include "../midi.h"
-#include "usbus428ctldefs.h" 
+#include "usbus428ctldefs.h"
 
-#define NRURBS	        2	
+#define NRURBS	        2
 
 
 #define URBS_ASYNC_SEQ 10
@@ -55,7 +55,7 @@ struct snd_usx2y_substream {
 	struct usx2ydev	*usx2y;
 	struct snd_pcm_substream *pcm_substream;
 
-	int			endpoint;		
+	int			endpoint;
 	unsigned int		maxpacksize;		/* max packet size in bytes */
 
 	atomic_t		state;
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index 8033bb7255d5..f92a9d52ea33 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -11,7 +11,7 @@
  *
  *   Copyright (c) 2002 by Takashi Iwai <tiwai@suse.de>
  *
- *   Many codes borrowed from audio.c by 
+ *   Many codes borrowed from audio.c by
  *	    Alan Cox (alan@lxorguk.ukuu.org.uk)
  *	    Thomas Sailer (sailer@ife.ee.ethz.ch)
  */
@@ -28,50 +28,51 @@
 #include "usx2y.h"
 #include "usbusx2y.h"
 
-#define USX2Y_NRPACKS 4			/* Default value used for nr of packs per urb.
-					  1 to 4 have been tested ok on uhci.
-					  To use 3 on ohci, you'd need a patch:
-					  look for "0000425-linux-2.6.9-rc4-mm1_ohci-hcd.patch.gz" on
-					  "https://bugtrack.alsa-project.org/alsa-bug/bug_view_page.php?bug_id=0000425"
-					  .
-					  1, 2 and 4 work out of the box on ohci, if I recall correctly.
-					  Bigger is safer operation,
-					  smaller gives lower latencies.
-					*/
-#define USX2Y_NRPACKS_VARIABLE y	/* If your system works ok with this module's parameter
-					   nrpacks set to 1, you might as well comment 
-					   this #define out, and thereby produce smaller, faster code.
-					   You'd also set USX2Y_NRPACKS to 1 then.
-					*/
+/* Default value used for nr of packs per urb.
+ * 1 to 4 have been tested ok on uhci.
+ * To use 3 on ohci, you'd need a patch:
+ * look for "0000425-linux-2.6.9-rc4-mm1_ohci-hcd.patch.gz" on
+ * "https://bugtrack.alsa-project.org/alsa-bug/bug_view_page.php?bug_id=0000425"
+ *
+ * 1, 2 and 4 work out of the box on ohci, if I recall correctly.
+ * Bigger is safer operation, smaller gives lower latencies.
+ */
+#define USX2Y_NRPACKS 4
+
+/* If your system works ok with this module's parameter
+ * nrpacks set to 1, you might as well comment
+ * this define out, and thereby produce smaller, faster code.
+ * You'd also set USX2Y_NRPACKS to 1 then.
+ */
+#define USX2Y_NRPACKS_VARIABLE 1
 
 #ifdef USX2Y_NRPACKS_VARIABLE
- static int nrpacks = USX2Y_NRPACKS; /* number of packets per urb */
- #define  nr_of_packs() nrpacks
- module_param(nrpacks, int, 0444);
- MODULE_PARM_DESC(nrpacks, "Number of packets per URB.");
+static int nrpacks = USX2Y_NRPACKS; /* number of packets per urb */
+#define  nr_of_packs() nrpacks
+module_param(nrpacks, int, 0444);
+MODULE_PARM_DESC(nrpacks, "Number of packets per URB.");
 #else
- #define nr_of_packs() USX2Y_NRPACKS
+#define nr_of_packs() USX2Y_NRPACKS
 #endif
 
-
 static int usx2y_urb_capt_retire(struct snd_usx2y_substream *subs)
 {
 	struct urb	*urb = subs->completed_urb;
 	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
 	unsigned char	*cp;
-	int 		i, len, lens = 0, hwptr_done = subs->hwptr_done;
+	int		i, len, lens = 0, hwptr_done = subs->hwptr_done;
 	struct usx2ydev	*usx2y = subs->usx2y;
 
 	for (i = 0; i < nr_of_packs(); i++) {
-		cp = (unsigned char*)urb->transfer_buffer + urb->iso_frame_desc[i].offset;
+		cp = (unsigned char *)urb->transfer_buffer + urb->iso_frame_desc[i].offset;
 		if (urb->iso_frame_desc[i].status) { /* active? hmm, skip this */
-			snd_printk(KERN_ERR "active frame status %i. "
-				   "Most probably some hardware problem.\n",
+			snd_printk(KERN_ERR
+				   "active frame status %i. Most probably some hardware problem.\n",
 				   urb->iso_frame_desc[i].status);
 			return urb->iso_frame_desc[i].status;
 		}
 		len = urb->iso_frame_desc[i].actual_length / usx2y->stride;
-		if (! len) {
+		if (!len) {
 			snd_printd("0 == len ERROR!\n");
 			continue;
 		}
@@ -80,6 +81,7 @@ static int usx2y_urb_capt_retire(struct snd_usx2y_substream *subs)
 		if ((hwptr_done + len) > runtime->buffer_size) {
 			int cnt = runtime->buffer_size - hwptr_done;
 			int blen = cnt * usx2y->stride;
+
 			memcpy(runtime->dma_area + hwptr_done * usx2y->stride, cp, blen);
 			memcpy(runtime->dma_area, cp + blen, len * usx2y->stride - blen);
 		} else {
@@ -100,6 +102,7 @@ static int usx2y_urb_capt_retire(struct snd_usx2y_substream *subs)
 	}
 	return 0;
 }
+
 /*
  * prepare urb for playback data pipe
  *
@@ -140,6 +143,7 @@ static int usx2y_urb_play_prepare(struct snd_usx2y_substream *subs,
 			 * copy the data to the temp buffer.
 			 */
 			int len;
+
 			len = runtime->buffer_size - subs->hwptr;
 			urb->transfer_buffer = subs->tmpbuf;
 			memcpy(subs->tmpbuf, runtime->dma_area +
@@ -183,6 +187,7 @@ static void usx2y_urb_play_retire(struct snd_usx2y_substream *subs, struct urb *
 static int usx2y_urb_submit(struct snd_usx2y_substream *subs, struct urb *urb, int frame)
 {
 	int err;
+
 	if (!urb)
 		return -ENODEV;
 	urb->start_frame = (frame + NRURBS * nr_of_packs());  // let hcd do rollover sanity checks
@@ -243,13 +248,13 @@ static inline int usx2y_usbframe_complete(struct snd_usx2y_substream *capsubs,
 	return 0;
 }
 
-
 static void usx2y_clients_stop(struct usx2ydev *usx2y)
 {
 	int s, u;
 
 	for (s = 0; s < 4; s++) {
 		struct snd_usx2y_substream *subs = usx2y->subs[s];
+
 		if (subs) {
 			snd_printdd("%i %p state=%i\n", s, subs, atomic_read(&subs->state));
 			atomic_set(&subs->state, STATE_STOPPED);
@@ -257,11 +262,13 @@ static void usx2y_clients_stop(struct usx2ydev *usx2y)
 	}
 	for (s = 0; s < 4; s++) {
 		struct snd_usx2y_substream *subs = usx2y->subs[s];
+
 		if (subs) {
 			if (atomic_read(&subs->state) >= STATE_PRERUNNING)
 				snd_pcm_stop_xrun(subs->pcm_substream);
 			for (u = 0; u < NRURBS; u++) {
 				struct urb *urb = subs->urb[u];
+
 				if (NULL != urb)
 					snd_printdd("%i status=%i start_frame=%i\n",
 						    u, urb->status, urb->start_frame);
@@ -302,6 +309,7 @@ static void i_usx2y_urb_complete(struct urb *urb)
 	{
 		struct snd_usx2y_substream *capsubs = usx2y->subs[SNDRV_PCM_STREAM_CAPTURE],
 			*playbacksubs = usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
+
 		if (capsubs->completed_urb &&
 		    atomic_read(&capsubs->state) >= STATE_PREPARED &&
 		    (playbacksubs->completed_urb ||
@@ -316,22 +324,25 @@ static void i_usx2y_urb_complete(struct urb *urb)
 	}
 }
 
-static void usx2y_urbs_set_complete(struct usx2ydev * usx2y,
+static void usx2y_urbs_set_complete(struct usx2ydev *usx2y,
 				    void (*complete)(struct urb *))
 {
 	int s, u;
+
 	for (s = 0; s < 4; s++) {
 		struct snd_usx2y_substream *subs = usx2y->subs[s];
+
 		if (NULL != subs)
 			for (u = 0; u < NRURBS; u++) {
-				struct urb * urb = subs->urb[u];
+				struct urb *urb = subs->urb[u];
+
 				if (NULL != urb)
 					urb->complete = complete;
 			}
 	}
 }
 
-static void usx2y_subs_startup_finish(struct usx2ydev * usx2y)
+static void usx2y_subs_startup_finish(struct usx2ydev *usx2y)
 {
 	usx2y_urbs_set_complete(usx2y, i_usx2y_urb_complete);
 	usx2y->prepare_subs = NULL;
@@ -342,6 +353,7 @@ static void i_usx2y_subs_startup(struct urb *urb)
 	struct snd_usx2y_substream *subs = urb->context;
 	struct usx2ydev *usx2y = subs->usx2y;
 	struct snd_usx2y_substream *prepare_subs = usx2y->prepare_subs;
+
 	if (NULL != prepare_subs)
 		if (urb->start_frame == prepare_subs->urb[0]->start_frame) {
 			usx2y_subs_startup_finish(usx2y);
@@ -362,7 +374,6 @@ static void usx2y_subs_prepare(struct snd_usx2y_substream *subs)
 	subs->transfer_done = 0;
 }
 
-
 static void usx2y_urb_release(struct urb **urb, int free_tb)
 {
 	if (*urb) {
@@ -373,12 +384,14 @@ static void usx2y_urb_release(struct urb **urb, int free_tb)
 		*urb = NULL;
 	}
 }
+
 /*
  * release a substreams urbs
  */
 static void usx2y_urbs_release(struct snd_usx2y_substream *subs)
 {
 	int i;
+
 	snd_printdd("usx2y_urbs_release() %i\n", subs->endpoint);
 	for (i = 0; i < NRURBS; i++)
 		usx2y_urb_release(subs->urb + i,
@@ -387,6 +400,7 @@ static void usx2y_urbs_release(struct snd_usx2y_substream *subs)
 	kfree(subs->tmpbuf);
 	subs->tmpbuf = NULL;
 }
+
 /*
  * initialize a substream's urbs
  */
@@ -411,6 +425,7 @@ static int usx2y_urbs_allocate(struct snd_usx2y_substream *subs)
 	/* allocate and initialize data urbs */
 	for (i = 0; i < NRURBS; i++) {
 		struct urb **purb = subs->urb + i;
+
 		if (*purb) {
 			usb_kill_urb(*purb);
 			continue;
@@ -443,6 +458,7 @@ static int usx2y_urbs_allocate(struct snd_usx2y_substream *subs)
 static void usx2y_subs_startup(struct snd_usx2y_substream *subs)
 {
 	struct usx2ydev *usx2y = subs->usx2y;
+
 	usx2y->prepare_subs = subs;
 	subs->urb[0]->start_frame = -1;
 	wmb();
@@ -459,6 +475,7 @@ static int usx2y_urbs_start(struct snd_usx2y_substream *subs)
 	subs->completed_urb = NULL;
 	for (i = 0; i < 4; i++) {
 		struct snd_usx2y_substream *subs = usx2y->subs[i];
+
 		if (subs != NULL && atomic_read(&subs->state) >= STATE_PREPARED)
 			goto start;
 	}
@@ -467,8 +484,10 @@ static int usx2y_urbs_start(struct snd_usx2y_substream *subs)
 	usx2y_subs_startup(subs);
 	for (i = 0; i < NRURBS; i++) {
 		struct urb *urb = subs->urb[i];
+
 		if (usb_pipein(urb->pipe)) {
 			unsigned long pack;
+
 			if (0 == i)
 				atomic_set(&subs->state, STATE_STARTING3);
 			urb->dev = usx2y->dev;
@@ -476,9 +495,9 @@ static int usx2y_urbs_start(struct snd_usx2y_substream *subs)
 				urb->iso_frame_desc[pack].offset = subs->maxpacksize * pack;
 				urb->iso_frame_desc[pack].length = subs->maxpacksize;
 			}
-			urb->transfer_buffer_length = subs->maxpacksize * nr_of_packs(); 
+			urb->transfer_buffer_length = subs->maxpacksize * nr_of_packs();
 			if ((err = usb_submit_urb(urb, GFP_ATOMIC)) < 0) {
-				snd_printk (KERN_ERR "cannot submit datapipe for urb %d, err = %d\n", i, err);
+				snd_printk(KERN_ERR "cannot submit datapipe for urb %d, err = %d\n", i, err);
 				err = -EPIPE;
 				goto cleanup;
 			} else
@@ -509,8 +528,10 @@ static int usx2y_urbs_start(struct snd_usx2y_substream *subs)
 static snd_pcm_uframes_t snd_usx2y_pcm_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_usx2y_substream *subs = substream->runtime->private_data;
+
 	return subs->hwptr_done;
 }
+
 /*
  * start/stop substream
  */
@@ -540,7 +561,6 @@ static int snd_usx2y_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return 0;
 }
 
-
 /*
  * allocate a buffer, setup samplerate
  *
@@ -553,8 +573,7 @@ static const struct s_c2
 {
 	char c1, c2;
 }
-	setrate_44100[] =
-{
+	setrate_44100[] = {
 	{ 0x14, 0x08},	// this line sets 44100, well actually a little less
 	{ 0x18, 0x40},	// only tascam / frontier design knows the further lines .......
 	{ 0x18, 0x42},
@@ -589,8 +608,8 @@ static const struct s_c2
 	{ 0x18, 0x7C},
 	{ 0x18, 0x7E}
 };
-static const struct s_c2 setrate_48000[] =
-{
+
+static const struct s_c2 setrate_48000[] = {
 	{ 0x14, 0x09},	// this line sets 48000, well actually a little less
 	{ 0x18, 0x40},	// only tascam / frontier design knows the further lines .......
 	{ 0x18, 0x42},
@@ -625,12 +644,13 @@ static const struct s_c2 setrate_48000[] =
 	{ 0x18, 0x7C},
 	{ 0x18, 0x7E}
 };
+
 #define NOOF_SETRATE_URBS ARRAY_SIZE(setrate_48000)
 
 static void i_usx2y_04int(struct urb *urb)
 {
 	struct usx2ydev *usx2y = urb->context;
-	
+
 	if (urb->status)
 		snd_printk(KERN_ERR "snd_usx2y_04int() urb->status=%i\n", urb->status);
 	if (0 == --usx2y->us04->len)
@@ -645,7 +665,7 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 	const struct s_c2	*ra = rate == 48000 ? setrate_48000 : setrate_44100;
 
 	if (usx2y->rate != rate) {
-		us = kzalloc(sizeof(*us) + sizeof(struct urb*) * NOOF_SETRATE_URBS, GFP_KERNEL);
+		us = kzalloc(sizeof(*us) + sizeof(struct urb *) * NOOF_SETRATE_URBS, GFP_KERNEL);
 		if (NULL == us) {
 			err = -ENOMEM;
 			goto cleanup;
@@ -661,8 +681,8 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 				err = -ENOMEM;
 				goto cleanup;
 			}
-			((char*)(usbdata + i))[0] = ra[i].c1;
-			((char*)(usbdata + i))[1] = ra[i].c2;
+			((char *)(usbdata + i))[0] = ra[i].c1;
+			((char *)(usbdata + i))[1] = ra[i].c2;
 			usb_fill_bulk_urb(us->urb[i], usx2y->dev, usb_sndbulkpipe(usx2y->dev, 4),
 					  usbdata + i, 2, i_usx2y_04int, usx2y);
 		}
@@ -681,6 +701,7 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 			us->submitted =	2*NOOF_SETRATE_URBS;
 			for (i = 0; i < NOOF_SETRATE_URBS; ++i) {
 				struct urb *urb = us->urb[i];
+
 				if (!urb)
 					continue;
 				if (urb->status) {
@@ -705,7 +726,8 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
 static int usx2y_format_set(struct usx2ydev *usx2y, snd_pcm_format_t format)
 {
 	int alternate, err;
-	struct list_head* p;
+	struct list_head *p;
+
 	if (format == SNDRV_PCM_FORMAT_S24_3LE) {
 		alternate = 2;
 		usx2y->stride = 6;
@@ -718,7 +740,7 @@ static int usx2y_format_set(struct usx2ydev *usx2y, snd_pcm_format_t format)
 	}
 	usb_kill_urb(usx2y->in04_urb);
 	if ((err = usb_set_interface(usx2y->dev, 0, alternate))) {
-		snd_printk(KERN_ERR "usb_set_interface error \n");
+		snd_printk(KERN_ERR "usb_set_interface error\n");
 		return err;
 	}
 	usx2y->in04_urb->dev = usx2y->dev;
@@ -778,11 +800,13 @@ static int snd_usx2y_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_usx2y_substream *subs = runtime->private_data;
+
 	mutex_lock(&subs->usx2y->pcm_mutex);
 	snd_printdd("snd_usx2y_hw_free(%p)\n", substream);
 
 	if (SNDRV_PCM_STREAM_PLAYBACK == substream->stream) {
 		struct snd_usx2y_substream *cap_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
+
 		atomic_set(&subs->state, STATE_STOPPED);
 		usx2y_urbs_release(subs);
 		if (!cap_subs->pcm_substream ||
@@ -794,6 +818,7 @@ static int snd_usx2y_pcm_hw_free(struct snd_pcm_substream *substream)
 		}
 	} else {
 		struct snd_usx2y_substream *playback_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
+
 		if (atomic_read(&playback_subs->state) < STATE_PREPARED) {
 			atomic_set(&subs->state, STATE_STOPPED);
 			usx2y_urbs_release(subs);
@@ -802,6 +827,7 @@ static int snd_usx2y_pcm_hw_free(struct snd_pcm_substream *substream)
 	mutex_unlock(&subs->usx2y->pcm_mutex);
 	return 0;
 }
+
 /*
  * prepare callback
  *
@@ -814,12 +840,13 @@ static int snd_usx2y_pcm_prepare(struct snd_pcm_substream *substream)
 	struct usx2ydev *usx2y = subs->usx2y;
 	struct snd_usx2y_substream *capsubs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
 	int err = 0;
+
 	snd_printdd("snd_usx2y_pcm_prepare(%p)\n", substream);
 
 	mutex_lock(&usx2y->pcm_mutex);
 	usx2y_subs_prepare(subs);
-// Start hardware streams
-// SyncStream first....
+	// Start hardware streams
+	// SyncStream first....
 	if (atomic_read(&capsubs->state) < STATE_PREPARED) {
 		if (usx2y->format != runtime->format)
 			if ((err = usx2y_format_set(usx2y, runtime->format)) < 0)
@@ -840,8 +867,7 @@ static int snd_usx2y_pcm_prepare(struct snd_pcm_substream *substream)
 	return err;
 }
 
-static const struct snd_pcm_hardware snd_usx2y_2c =
-{
+static const struct snd_pcm_hardware snd_usx2y_2c = {
 	.info =			(SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID |
@@ -860,8 +886,6 @@ static const struct snd_pcm_hardware snd_usx2y_2c =
 	.fifo_size =              0
 };
 
-
-
 static int snd_usx2y_pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_usx2y_substream	*subs = ((struct snd_usx2y_substream **)
@@ -878,8 +902,6 @@ static int snd_usx2y_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-
-
 static int snd_usx2y_pcm_close(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -890,9 +912,7 @@ static int snd_usx2y_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-
-static const struct snd_pcm_ops snd_usx2y_pcm_ops =
-{
+static const struct snd_pcm_ops snd_usx2y_pcm_ops = {
 	.open =		snd_usx2y_pcm_open,
 	.close =	snd_usx2y_pcm_close,
 	.hw_params =	snd_usx2y_pcm_hw_params,
@@ -902,7 +922,6 @@ static const struct snd_pcm_ops snd_usx2y_pcm_ops =
 	.pointer =	snd_usx2y_pcm_pointer,
 };
 
-
 /*
  * free a usb stream instance
  */
@@ -919,6 +938,7 @@ static void usx2y_audio_stream_free(struct snd_usx2y_substream **usx2y_substream
 static void snd_usx2y_pcm_private_free(struct snd_pcm *pcm)
 {
 	struct snd_usx2y_substream **usx2y_stream = pcm->private_data;
+
 	if (usx2y_stream)
 		usx2y_audio_stream_free(usx2y_stream);
 }
@@ -983,14 +1003,14 @@ static int usx2y_audio_stream_new(struct snd_card *card, int playback_endpoint,
 int usx2y_audio_create(struct snd_card *card)
 {
 	int err = 0;
-	
+
 	INIT_LIST_HEAD(&usx2y(card)->pcm_list);
 
 	if (0 > (err = usx2y_audio_stream_new(card, 0xA, 0x8)))
 		return err;
 	if (le16_to_cpu(usx2y(card)->dev->descriptor.idProduct) == USB_ID_US428)
-	     if (0 > (err = usx2y_audio_stream_new(card, 0, 0xA)))
-		     return err;
+		if (0 > (err = usx2y_audio_stream_new(card, 0, 0xA)))
+			return err;
 	if (le16_to_cpu(usx2y(card)->dev->descriptor.idProduct) != USB_ID_US122)
 		err = usx2y_rate_set(usx2y(card), 44100);	// Lets us428 recognize output-volume settings, disturbs us122.
 	return err;
diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index 399470e51c41..b7e15fc3d1b4 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -6,7 +6,7 @@
 
  Its usb's unableness to atomically handle power of 2 period sized data chuncs
  at standard samplerates,
- what led to this part of the usx2y module: 
+ what led to this part of the usx2y module:
  It provides the alsa kernel half of the usx2y-alsa-jack driver pair.
  The pair uses a hardware dependent alsa-device for mmaped pcm transport.
  Advantage achieved:
@@ -35,7 +35,7 @@
  Kernel:
  - rawusb dma pcm buffer transport should go to snd-usb-lib, so also snd-usb-audio
    devices can use it.
-   Currently rawusb dma pcm buffer transport (this file) is only available to snd-usb-usx2y. 
+   Currently rawusb dma pcm buffer transport (this file) is only available to snd-usb-usx2y.
 */
 
 #include <linux/delay.h>
@@ -46,15 +46,16 @@
 
 #include <sound/hwdep.h>
 
-
 static int usx2y_usbpcm_urb_capt_retire(struct snd_usx2y_substream *subs)
 {
 	struct urb	*urb = subs->completed_urb;
 	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
-	int 		i, lens = 0, hwptr_done = subs->hwptr_done;
+	int		i, lens = 0, hwptr_done = subs->hwptr_done;
 	struct usx2ydev	*usx2y = subs->usx2y;
+
 	if (0 > usx2y->hwdep_pcm_shm->capture_iso_start) { //FIXME
 		int head = usx2y->hwdep_pcm_shm->captured_iso_head + 1;
+
 		if (head >= ARRAY_SIZE(usx2y->hwdep_pcm_shm->captured_iso))
 			head = 0;
 		usx2y->hwdep_pcm_shm->capture_iso_start = head;
@@ -62,7 +63,9 @@ static int usx2y_usbpcm_urb_capt_retire(struct snd_usx2y_substream *subs)
 	}
 	for (i = 0; i < nr_of_packs(); i++) {
 		if (urb->iso_frame_desc[i].status) { /* active? hmm, skip this */
-			snd_printk(KERN_ERR "active frame status %i. Most probably some hardware problem.\n", urb->iso_frame_desc[i].status);
+			snd_printk(KERN_ERR
+				   "active frame status %i. Most probably some hardware problem.\n",
+				   urb->iso_frame_desc[i].status);
 			return urb->iso_frame_desc[i].status;
 		}
 		lens += urb->iso_frame_desc[i].actual_length / usx2y->stride;
@@ -80,7 +83,7 @@ static int usx2y_usbpcm_urb_capt_retire(struct snd_usx2y_substream *subs)
 }
 
 static inline int usx2y_iso_frames_per_buffer(struct snd_pcm_runtime *runtime,
-					      struct usx2ydev * usx2y)
+					      struct usx2ydev *usx2y)
 {
 	return (runtime->buffer_size * 1000) / usx2y->rate + 1;	//FIXME: so far only correct period_size == 2^x ?
 }
@@ -133,16 +136,18 @@ static int usx2y_hwdep_urb_play_prepare(struct snd_usx2y_substream *subs,
 	return 0;
 }
 
-
 static inline void usx2y_usbpcm_urb_capt_iso_advance(struct snd_usx2y_substream *subs,
 						     struct urb *urb)
 {
 	int pack;
+
 	for (pack = 0; pack < nr_of_packs(); ++pack) {
 		struct usb_iso_packet_descriptor *desc = urb->iso_frame_desc + pack;
+
 		if (NULL != subs) {
 			struct snd_usx2y_hwdep_pcm_shm *shm = subs->usx2y->hwdep_pcm_shm;
 			int head = shm->captured_iso_head + 1;
+
 			if (head >= ARRAY_SIZE(shm->captured_iso))
 				head = 0;
 			shm->captured_iso[head].frame = urb->start_frame + pack;
@@ -189,7 +194,7 @@ static inline int usx2y_usbpcm_usbframe_complete(struct snd_usx2y_substream *cap
 			return err;
 		}
 	}
-	
+
 	playbacksubs->completed_urb = NULL;
 
 	state = atomic_read(&capsubs->state);
@@ -214,7 +219,6 @@ static inline int usx2y_usbpcm_usbframe_complete(struct snd_usx2y_substream *cap
 	return 0;
 }
 
-
 static void i_usx2y_usbpcm_urb_complete(struct urb *urb)
 {
 	struct snd_usx2y_substream *subs = urb->context;
@@ -249,7 +253,6 @@ static void i_usx2y_usbpcm_urb_complete(struct urb *urb)
 	}
 }
 
-
 static void usx2y_hwdep_urb_release(struct urb **urb)
 {
 	usb_kill_urb(*urb);
@@ -263,12 +266,13 @@ static void usx2y_hwdep_urb_release(struct urb **urb)
 static void usx2y_usbpcm_urbs_release(struct snd_usx2y_substream *subs)
 {
 	int i;
+
 	snd_printdd("snd_usx2y_urbs_release() %i\n", subs->endpoint);
 	for (i = 0; i < NRURBS; i++)
 		usx2y_hwdep_urb_release(subs->urb + i);
 }
 
-static void usx2y_usbpcm_subs_startup_finish(struct usx2ydev * usx2y)
+static void usx2y_usbpcm_subs_startup_finish(struct usx2ydev *usx2y)
 {
 	usx2y_urbs_set_complete(usx2y, i_usx2y_usbpcm_urb_complete);
 	usx2y->prepare_subs = NULL;
@@ -279,11 +283,13 @@ static void i_usx2y_usbpcm_subs_startup(struct urb *urb)
 	struct snd_usx2y_substream *subs = urb->context;
 	struct usx2ydev *usx2y = subs->usx2y;
 	struct snd_usx2y_substream *prepare_subs = usx2y->prepare_subs;
+
 	if (NULL != prepare_subs &&
 	    urb->start_frame == prepare_subs->urb[0]->start_frame) {
 		atomic_inc(&prepare_subs->state);
 		if (prepare_subs == usx2y->subs[SNDRV_PCM_STREAM_CAPTURE]) {
 			struct snd_usx2y_substream *cap_subs2 = usx2y->subs[SNDRV_PCM_STREAM_CAPTURE + 2];
+
 			if (cap_subs2 != NULL)
 				atomic_inc(&cap_subs2->state);
 		}
@@ -313,6 +319,7 @@ static int usx2y_usbpcm_urbs_allocate(struct snd_usx2y_substream *subs)
 	/* allocate and initialize data urbs */
 	for (i = 0; i < NRURBS; i++) {
 		struct urb **purb = subs->urb + i;
+
 		if (*purb) {
 			usb_kill_urb(*purb);
 			continue;
@@ -346,11 +353,13 @@ static int snd_usx2y_usbpcm_hw_free(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_usx2y_substream *subs = runtime->private_data,
 		*cap_subs2 = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE + 2];
+
 	mutex_lock(&subs->usx2y->pcm_mutex);
 	snd_printdd("snd_usx2y_usbpcm_hw_free(%p)\n", substream);
 
 	if (SNDRV_PCM_STREAM_PLAYBACK == substream->stream) {
 		struct snd_usx2y_substream *cap_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
+
 		atomic_set(&subs->state, STATE_STOPPED);
 		usx2y_usbpcm_urbs_release(subs);
 		if (!cap_subs->pcm_substream ||
@@ -366,6 +375,7 @@ static int snd_usx2y_usbpcm_hw_free(struct snd_pcm_substream *substream)
 		}
 	} else {
 		struct snd_usx2y_substream *playback_subs = subs->usx2y->subs[SNDRV_PCM_STREAM_PLAYBACK];
+
 		if (atomic_read(&playback_subs->state) < STATE_PREPARED) {
 			atomic_set(&subs->state, STATE_STOPPED);
 			if (NULL != cap_subs2)
@@ -381,7 +391,8 @@ static int snd_usx2y_usbpcm_hw_free(struct snd_pcm_substream *substream)
 
 static void usx2y_usbpcm_subs_startup(struct snd_usx2y_substream *subs)
 {
-	struct usx2ydev * usx2y = subs->usx2y;
+	struct usx2ydev *usx2y = subs->usx2y;
+
 	usx2y->prepare_subs = subs;
 	subs->urb[0]->start_frame = -1;
 	smp_wmb();	// Make sure above modifications are seen by i_usx2y_subs_startup()
@@ -390,8 +401,7 @@ static void usx2y_usbpcm_subs_startup(struct snd_usx2y_substream *subs)
 
 static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 {
-	int	p, u, err,
-		stream = subs->pcm_substream->stream;
+	int	p, u, err, stream = subs->pcm_substream->stream;
 	struct usx2ydev *usx2y = subs->usx2y;
 
 	if (SNDRV_PCM_STREAM_CAPTURE == stream) {
@@ -410,6 +420,7 @@ static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 
 	for (p = 0; p < 4; p++) {
 		struct snd_usx2y_substream *subs = usx2y->subs[p];
+
 		if (subs != NULL && atomic_read(&subs->state) >= STATE_PREPARED)
 			goto start;
 	}
@@ -419,10 +430,13 @@ static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 	for (u = 0; u < NRURBS; u++) {
 		for (p = 0; 3 >= (stream + p); p += 2) {
 			struct snd_usx2y_substream *subs = usx2y->subs[stream + p];
+
 			if (subs != NULL) {
 				struct urb *urb = subs->urb[u];
+
 				if (usb_pipein(urb->pipe)) {
 					unsigned long pack;
+
 					if (0 == u)
 						atomic_set(&subs->state, STATE_STARTING3);
 					urb->dev = usx2y->dev;
@@ -430,9 +444,9 @@ static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 						urb->iso_frame_desc[pack].offset = subs->maxpacksize * (pack + u * nr_of_packs());
 						urb->iso_frame_desc[pack].length = subs->maxpacksize;
 					}
-					urb->transfer_buffer_length = subs->maxpacksize * nr_of_packs(); 
+					urb->transfer_buffer_length = subs->maxpacksize * nr_of_packs();
 					if ((err = usb_submit_urb(urb, GFP_KERNEL)) < 0) {
-						snd_printk (KERN_ERR "cannot usb_submit_urb() for urb %d, err = %d\n", u, err);
+						snd_printk(KERN_ERR "cannot usb_submit_urb() for urb %d, err = %d\n", u, err);
 						err = -EPIPE;
 						goto cleanup;
 					}  else {
@@ -444,7 +458,7 @@ static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 				} else {
 					atomic_set(&subs->state, STATE_STARTING1);
 					break;
-				}			
+				}
 			}
 		}
 	}
@@ -452,11 +466,11 @@ static int usx2y_usbpcm_urbs_start(struct snd_usx2y_substream *subs)
 	wait_event(usx2y->prepare_wait_queue, NULL == usx2y->prepare_subs);
 	if (atomic_read(&subs->state) != STATE_PREPARED)
 		err = -EPIPE;
-		
+
  cleanup:
 	if (err) {
 		usx2y_subs_startup_finish(usx2y);	// Call it now
-		usx2y_clients_stop(usx2y);		// something is completely wroong > stop evrything			
+		usx2y_clients_stop(usx2y);		// something is completely wroong > stop evrything
 	}
 	return err;
 }
@@ -473,6 +487,7 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 	struct usx2ydev *usx2y = subs->usx2y;
 	struct snd_usx2y_substream *capsubs = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE];
 	int err = 0;
+
 	snd_printdd("snd_usx2y_pcm_prepare(%p)\n", substream);
 
 	if (NULL == usx2y->hwdep_pcm_shm) {
@@ -485,8 +500,8 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 
 	mutex_lock(&usx2y->pcm_mutex);
 	usx2y_subs_prepare(subs);
-// Start hardware streams
-// SyncStream first....
+	// Start hardware streams
+	// SyncStream first....
 	if (atomic_read(&capsubs->state) < STATE_PREPARED) {
 		if (usx2y->format != runtime->format)
 			if ((err = usx2y_format_set(usx2y, runtime->format)) < 0)
@@ -505,15 +520,14 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 		if (atomic_read(&subs->state) < STATE_PREPARED) {
 			while (usx2y_iso_frames_per_buffer(runtime, usx2y) >
 			       usx2y->hwdep_pcm_shm->captured_iso_frames) {
-				snd_printdd("Wait: iso_frames_per_buffer=%i,"
-					    "captured_iso_frames=%i\n",
+				snd_printdd("Wait: iso_frames_per_buffer=%i,captured_iso_frames=%i\n",
 					    usx2y_iso_frames_per_buffer(runtime, usx2y),
 					    usx2y->hwdep_pcm_shm->captured_iso_frames);
 				if (msleep_interruptible(10)) {
 					err = -ERESTARTSYS;
 					goto up_prepare_mutex;
 				}
-			} 
+			}
 			if (0 > (err = usx2y_usbpcm_urbs_start(subs)))
 				goto up_prepare_mutex;
 		}
@@ -528,8 +542,7 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 	return err;
 }
 
-static const struct snd_pcm_hardware snd_usx2y_4c =
-{
+static const struct snd_pcm_hardware snd_usx2y_4c = {
 	.info =			(SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID),
@@ -547,8 +560,6 @@ static const struct snd_pcm_hardware snd_usx2y_4c =
 	.fifo_size =              0
 };
 
-
-
 static int snd_usx2y_usbpcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_usx2y_substream	*subs = ((struct snd_usx2y_substream **)
@@ -566,7 +577,6 @@ static int snd_usx2y_usbpcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-
 static int snd_usx2y_usbpcm_close(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -576,9 +586,7 @@ static int snd_usx2y_usbpcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-
-static const struct snd_pcm_ops snd_usx2y_usbpcm_ops =
-{
+static const struct snd_pcm_ops snd_usx2y_usbpcm_ops = {
 	.open =		snd_usx2y_usbpcm_open,
 	.close =	snd_usx2y_usbpcm_close,
 	.hw_params =	snd_usx2y_pcm_hw_params,
@@ -588,7 +596,6 @@ static const struct snd_pcm_ops snd_usx2y_usbpcm_ops =
 	.pointer =	snd_usx2y_pcm_pointer,
 };
 
-
 static int usx2y_pcms_busy_check(struct snd_card *card)
 {
 	struct usx2ydev	*dev = usx2y(card);
@@ -596,6 +603,7 @@ static int usx2y_pcms_busy_check(struct snd_card *card)
 
 	for (i = 0; i < dev->pcm_devs * 2; i++) {
 		struct snd_usx2y_substream *subs = dev->subs[i];
+
 		if (subs && subs->pcm_substream &&
 		    SUBSTREAM_BUSY(subs->pcm_substream))
 			return -EBUSY;
@@ -616,7 +624,6 @@ static int snd_usx2y_hwdep_pcm_open(struct snd_hwdep *hw, struct file *file)
 	return err;
 }
 
-
 static int snd_usx2y_hwdep_pcm_release(struct snd_hwdep *hw, struct file *file)
 {
 	struct snd_card *card = hw->card;
@@ -630,17 +637,14 @@ static int snd_usx2y_hwdep_pcm_release(struct snd_hwdep *hw, struct file *file)
 	return err;
 }
 
-
 static void snd_usx2y_hwdep_pcm_vm_open(struct vm_area_struct *area)
 {
 }
 
-
 static void snd_usx2y_hwdep_pcm_vm_close(struct vm_area_struct *area)
 {
 }
 
-
 static vm_fault_t snd_usx2y_hwdep_pcm_vm_fault(struct vm_fault *vmf)
 {
 	unsigned long offset;
@@ -653,15 +657,13 @@ static vm_fault_t snd_usx2y_hwdep_pcm_vm_fault(struct vm_fault *vmf)
 	return 0;
 }
 
-
 static const struct vm_operations_struct snd_usx2y_hwdep_pcm_vm_ops = {
 	.open = snd_usx2y_hwdep_pcm_vm_open,
 	.close = snd_usx2y_hwdep_pcm_vm_close,
 	.fault = snd_usx2y_hwdep_pcm_vm_fault,
 };
 
-
-static int snd_usx2y_hwdep_pcm_mmap(struct snd_hwdep * hw, struct file *filp, struct vm_area_struct *area)
+static int snd_usx2y_hwdep_pcm_mmap(struct snd_hwdep *hw, struct file *filp, struct vm_area_struct *area)
 {
 	unsigned long	size = (unsigned long)(area->vm_end - area->vm_start);
 	struct usx2ydev	*usx2y = hw->private_data;
@@ -669,9 +671,9 @@ static int snd_usx2y_hwdep_pcm_mmap(struct snd_hwdep * hw, struct file *filp, st
 	if (!(usx2y->chip_status & USX2Y_STAT_CHIP_INIT))
 		return -EBUSY;
 
-	/* if userspace tries to mmap beyond end of our buffer, fail */ 
+	/* if userspace tries to mmap beyond end of our buffer, fail */
 	if (size > PAGE_ALIGN(sizeof(struct snd_usx2y_hwdep_pcm_shm))) {
-		snd_printd("%lu > %lu\n", size, (unsigned long)sizeof(struct snd_usx2y_hwdep_pcm_shm)); 
+		snd_printd("%lu > %lu\n", size, (unsigned long)sizeof(struct snd_usx2y_hwdep_pcm_shm));
 		return -EINVAL;
 	}
 
@@ -684,21 +686,21 @@ static int snd_usx2y_hwdep_pcm_mmap(struct snd_hwdep * hw, struct file *filp, st
 	return 0;
 }
 
-
 static void snd_usx2y_hwdep_pcm_private_free(struct snd_hwdep *hwdep)
 {
 	struct usx2ydev *usx2y = hwdep->private_data;
+
 	if (NULL != usx2y->hwdep_pcm_shm)
 		free_pages_exact(usx2y->hwdep_pcm_shm, sizeof(struct snd_usx2y_hwdep_pcm_shm));
 }
 
-
 int usx2y_hwdep_pcm_new(struct snd_card *card)
 {
 	int err;
 	struct snd_hwdep *hw;
 	struct snd_pcm *pcm;
 	struct usb_device *dev = usx2y(card)->dev;
+
 	if (1 != nr_of_packs())
 		return 0;
 
-- 
2.26.2

