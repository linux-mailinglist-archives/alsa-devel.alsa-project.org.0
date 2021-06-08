Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00C39F8EA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:22:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC78F17C8;
	Tue,  8 Jun 2021 16:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC78F17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162123;
	bh=r7pmUJ1Y0FnLmyTwMgS0bZMUxFWehPuJ68xBGwm8ZAw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aCehi7QgXum0xo0OqFGCkRESiCUQKcOAYThixJc66g5QnyYX2QptT1t6RYZqwx+5C
	 8D7TDZ7ABElho39tSPrKfMIZqncZKEOJxvS6j6kRf/5A+ivw5VcPLDIDDKYtGq/Yi+
	 jWRSG6NUDffHX3TPPvctaf+DYe9h+ihbx3TsaQVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5859EF80623;
	Tue,  8 Jun 2021 16:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17DA6F80604; Tue,  8 Jun 2021 16:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3133F804EB
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3133F804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="pI6M5dTz"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ngZ8KvxX"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 934501FDF4
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/xD5M9bVFxCi8b9w8koC91B3JsZYyeLE4W/1z6lYz4=;
 b=pI6M5dTzvKu+Fqn6jBpTzozcBm/FTsF8iQutUk/VrNl0Vk9epbo0dWfxSEF93zv9LRJc3U
 +sU3lWMdpHQxlsbhE+HobS6IO5JJ0g9lnxAO8wUyDKajt6SSu612zouCBBv1jE/X3gVyir
 XLt9UwHjyNpFzviJWLZauyVugh4ZPY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/xD5M9bVFxCi8b9w8koC91B3JsZYyeLE4W/1z6lYz4=;
 b=ngZ8KvxXLPjTTd+C6Tb0aVeP40EINYvbktYytLICLP2r5vBtjHKT86njkfoshpqvdBQmEb
 FEi3/gM80OldfbDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 80501A3B84;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 56/66] ALSA: seq: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:30 +0200
Message-Id: <20210608140540.17885-57-tiwai@suse.de>
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

There are lots of places doing assignments in if condition in ALSA
sequencer core, which is a bad coding style that may confuse readers
and occasionally lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss.c        | 26 +++++++++------
 sound/core/seq/oss/seq_oss_init.c   |  9 +++--
 sound/core/seq/oss/seq_oss_midi.c   | 33 ++++++++++++-------
 sound/core/seq/oss/seq_oss_rw.c     |  3 +-
 sound/core/seq/oss/seq_oss_synth.c  |  9 +++--
 sound/core/seq/oss/seq_oss_writeq.c |  3 +-
 sound/core/seq/seq_clientmgr.c      | 51 +++++++++++++++++++----------
 sound/core/seq/seq_dummy.c          |  3 +-
 sound/core/seq/seq_fifo.c           |  3 +-
 sound/core/seq/seq_memory.c         |  6 ++--
 sound/core/seq/seq_midi.c           | 27 ++++++++-------
 sound/core/seq/seq_queue.c          | 21 ++++++++----
 sound/core/seq/seq_virmidi.c        |  9 ++---
 13 files changed, 131 insertions(+), 72 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
index 250a92b18726..77c1214acd90 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -67,13 +67,16 @@ static int __init alsa_seq_oss_init(void)
 {
 	int rc;
 
-	if ((rc = register_device()) < 0)
+	rc = register_device();
+	if (rc < 0)
 		goto error;
-	if ((rc = register_proc()) < 0) {
+	rc = register_proc();
+	if (rc < 0) {
 		unregister_device();
 		goto error;
 	}
-	if ((rc = snd_seq_oss_create_client()) < 0) {
+	rc = snd_seq_oss_create_client();
+	if (rc < 0) {
 		unregister_proc();
 		unregister_device();
 		goto error;
@@ -133,7 +136,8 @@ odev_release(struct inode *inode, struct file *file)
 {
 	struct seq_oss_devinfo *dp;
 
-	if ((dp = file->private_data) == NULL)
+	dp = file->private_data;
+	if (!dp)
 		return 0;
 
 	mutex_lock(&register_mutex);
@@ -226,16 +230,18 @@ register_device(void)
 	int rc;
 
 	mutex_lock(&register_mutex);
-	if ((rc = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_SEQUENCER,
-					  NULL, 0,
-					  &seq_oss_f_ops, NULL)) < 0) {
+	rc = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_SEQUENCER,
+				     NULL, 0,
+				     &seq_oss_f_ops, NULL);
+	if (rc < 0) {
 		pr_err("ALSA: seq_oss: can't register device seq\n");
 		mutex_unlock(&register_mutex);
 		return rc;
 	}
-	if ((rc = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_MUSIC,
-					  NULL, 0,
-					  &seq_oss_f_ops, NULL)) < 0) {
+	rc = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_MUSIC,
+				     NULL, 0,
+				     &seq_oss_f_ops, NULL);
+	if (rc < 0) {
 		pr_err("ALSA: seq_oss: can't register device music\n");
 		snd_unregister_oss_device(SNDRV_OSS_DEVICE_TYPE_SEQUENCER, NULL, 0);
 		mutex_unlock(&register_mutex);
diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 4534a154b8c8..a53d81a86af2 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -95,7 +95,8 @@ snd_seq_oss_create_client(void)
 	port->kernel = &port_callback;
 	
 	call_ctl(SNDRV_SEQ_IOCTL_CREATE_PORT, port);
-	if ((system_port = port->addr.port) >= 0) {
+	system_port = port->addr.port;
+	if (system_port >= 0) {
 		struct snd_seq_port_subscribe subs;
 
 		memset(&subs, 0, sizeof(subs));
@@ -354,7 +355,8 @@ alloc_seq_queue(struct seq_oss_devinfo *dp)
 	qinfo.owner = system_client;
 	qinfo.locked = 1;
 	strcpy(qinfo.name, "OSS Sequencer Emulation");
-	if ((rc = call_ctl(SNDRV_SEQ_IOCTL_CREATE_QUEUE, &qinfo)) < 0)
+	rc = call_ctl(SNDRV_SEQ_IOCTL_CREATE_QUEUE, &qinfo);
+	if (rc < 0)
 		return rc;
 	dp->queue = qinfo.queue;
 	return 0;
@@ -485,7 +487,8 @@ snd_seq_oss_system_info_read(struct snd_info_buffer *buf)
 	snd_iprintf(buf, "\nNumber of applications: %d\n", num_clients);
 	for (i = 0; i < num_clients; i++) {
 		snd_iprintf(buf, "\nApplication %d: ", i);
-		if ((dp = client_table[i]) == NULL) {
+		dp = client_table[i];
+		if (!dp) {
 			snd_iprintf(buf, "*empty*\n");
 			continue;
 		}
diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index 3f82c196de46..1e3bf086f867 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -152,7 +152,8 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	/*
 	 * look for the identical slot
 	 */
-	if ((mdev = find_slot(pinfo->addr.client, pinfo->addr.port)) != NULL) {
+	mdev = find_slot(pinfo->addr.client, pinfo->addr.port);
+	if (mdev) {
 		/* already exists */
 		snd_use_lock_free(&mdev->use_lock);
 		return 0;
@@ -218,7 +219,8 @@ snd_seq_oss_midi_check_exit_port(int client, int port)
 	unsigned long flags;
 	int index;
 
-	if ((mdev = find_slot(client, port)) != NULL) {
+	mdev = find_slot(client, port);
+	if (mdev) {
 		spin_lock_irqsave(&register_lock, flags);
 		midi_devs[mdev->seq_device] = NULL;
 		spin_unlock_irqrestore(&register_lock, flags);
@@ -250,7 +252,8 @@ snd_seq_oss_midi_clear_all(void)
 
 	spin_lock_irqsave(&register_lock, flags);
 	for (i = 0; i < max_midi_devs; i++) {
-		if ((mdev = midi_devs[i]) != NULL) {
+		mdev = midi_devs[i];
+		if (mdev) {
 			snd_midi_event_free(mdev->coder);
 			kfree(mdev);
 			midi_devs[i] = NULL;
@@ -318,7 +321,8 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 	struct seq_oss_midi *mdev;
 	struct snd_seq_port_subscribe subs;
 
-	if ((mdev = get_mididev(dp, dev)) == NULL)
+	mdev = get_mididev(dp, dev);
+	if (!mdev)
 		return -ENODEV;
 
 	/* already used? */
@@ -384,7 +388,8 @@ snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 	struct seq_oss_midi *mdev;
 	struct snd_seq_port_subscribe subs;
 
-	if ((mdev = get_mididev(dp, dev)) == NULL)
+	mdev = get_mididev(dp, dev);
+	if (!mdev)
 		return -ENODEV;
 	if (! mdev->opened || mdev->devinfo != dp) {
 		snd_use_lock_free(&mdev->use_lock);
@@ -421,7 +426,8 @@ snd_seq_oss_midi_filemode(struct seq_oss_devinfo *dp, int dev)
 	struct seq_oss_midi *mdev;
 	int mode;
 
-	if ((mdev = get_mididev(dp, dev)) == NULL)
+	mdev = get_mididev(dp, dev);
+	if (!mdev)
 		return 0;
 
 	mode = 0;
@@ -443,7 +449,8 @@ snd_seq_oss_midi_reset(struct seq_oss_devinfo *dp, int dev)
 {
 	struct seq_oss_midi *mdev;
 
-	if ((mdev = get_mididev(dp, dev)) == NULL)
+	mdev = get_mididev(dp, dev);
+	if (!mdev)
 		return;
 	if (! mdev->opened) {
 		snd_use_lock_free(&mdev->use_lock);
@@ -491,7 +498,8 @@ snd_seq_oss_midi_get_addr(struct seq_oss_devinfo *dp, int dev, struct snd_seq_ad
 {
 	struct seq_oss_midi *mdev;
 
-	if ((mdev = get_mididev(dp, dev)) == NULL)
+	mdev = get_mididev(dp, dev);
+	if (!mdev)
 		return;
 	addr->client = mdev->client;
 	addr->port = mdev->port;
@@ -511,7 +519,8 @@ snd_seq_oss_midi_input(struct snd_seq_event *ev, int direct, void *private_data)
 
 	if (dp->readq == NULL)
 		return 0;
-	if ((mdev = find_slot(ev->source.client, ev->source.port)) == NULL)
+	mdev = find_slot(ev->source.client, ev->source.port);
+	if (!mdev)
 		return 0;
 	if (! (mdev->opened & PERM_READ)) {
 		snd_use_lock_free(&mdev->use_lock);
@@ -623,7 +632,8 @@ snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char c, stru
 {
 	struct seq_oss_midi *mdev;
 
-	if ((mdev = get_mididev(dp, dev)) == NULL)
+	mdev = get_mididev(dp, dev);
+	if (!mdev)
 		return -ENODEV;
 	if (snd_midi_event_encode_byte(mdev->coder, c, ev)) {
 		snd_seq_oss_fill_addr(dp, ev, mdev->client, mdev->port);
@@ -642,7 +652,8 @@ snd_seq_oss_midi_make_info(struct seq_oss_devinfo *dp, int dev, struct midi_info
 {
 	struct seq_oss_midi *mdev;
 
-	if ((mdev = get_mididev(dp, dev)) == NULL)
+	mdev = get_mididev(dp, dev);
+	if (!mdev)
 		return -ENXIO;
 	inf->device = dev;
 	inf->dev_type = 0; /* FIXME: ?? */
diff --git a/sound/core/seq/oss/seq_oss_rw.c b/sound/core/seq/oss/seq_oss_rw.c
index 537d5f423e20..8a142fd54a19 100644
--- a/sound/core/seq/oss/seq_oss_rw.c
+++ b/sound/core/seq/oss/seq_oss_rw.c
@@ -132,7 +132,8 @@ snd_seq_oss_write(struct seq_oss_devinfo *dp, const char __user *buf, int count,
 		}
 
 		/* insert queue */
-		if ((err = insert_queue(dp, &rec, opt)) < 0)
+		err = insert_queue(dp, &rec, opt);
+		if (err < 0)
 			break;
 
 		result += ev_size;
diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
index 722f5059b300..e3394919daa0 100644
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -451,7 +451,8 @@ snd_seq_oss_synth_load_patch(struct seq_oss_devinfo *dp, int dev, int fmt,
 
 	if (info->is_midi)
 		return 0;
-	if ((rec = get_synthdev(dp, dev)) == NULL)
+	rec = get_synthdev(dp, dev);
+	if (!rec)
 		return -ENXIO;
 
 	if (rec->oper.load_patch == NULL)
@@ -569,7 +570,8 @@ snd_seq_oss_synth_ioctl(struct seq_oss_devinfo *dp, int dev, unsigned int cmd, u
 	info = get_synthinfo_nospec(dp, dev);
 	if (!info || info->is_midi)
 		return -ENXIO;
-	if ((rec = get_synthdev(dp, dev)) == NULL)
+	rec = get_synthdev(dp, dev);
+	if (!rec)
 		return -ENXIO;
 	if (rec->oper.ioctl == NULL)
 		rc = -ENXIO;
@@ -619,7 +621,8 @@ snd_seq_oss_synth_make_info(struct seq_oss_devinfo *dp, int dev, struct synth_in
 		inf->device = dev;
 		strscpy(inf->name, minf.name, sizeof(inf->name));
 	} else {
-		if ((rec = get_synthdev(dp, dev)) == NULL)
+		rec = get_synthdev(dp, dev);
+		if (!rec)
 			return -ENXIO;
 		inf->synth_type = rec->synth_type;
 		inf->synth_subtype = rec->synth_subtype;
diff --git a/sound/core/seq/oss/seq_oss_writeq.c b/sound/core/seq/oss/seq_oss_writeq.c
index 0a02a59103b4..3e3209ce53b1 100644
--- a/sound/core/seq/oss/seq_oss_writeq.c
+++ b/sound/core/seq/oss/seq_oss_writeq.c
@@ -27,7 +27,8 @@ snd_seq_oss_writeq_new(struct seq_oss_devinfo *dp, int maxlen)
 	struct seq_oss_writeq *q;
 	struct snd_seq_client_pool pool;
 
-	if ((q = kzalloc(sizeof(*q), GFP_KERNEL)) == NULL)
+	q = kzalloc(sizeof(*q), GFP_KERNEL);
+	if (!q)
 		return NULL;
 	q->dp = dp;
 	q->maxlen = maxlen;
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index b6a24fb5e76b..2e9d695d336c 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -416,7 +416,10 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
 	if (snd_BUG_ON(!client))
 		return -ENXIO;
 
-	if (!client->accept_input || (fifo = client->data.user.fifo) == NULL)
+	if (!client->accept_input)
+		return -ENXIO;
+	fifo = client->data.user.fifo;
+	if (!fifo)
 		return -ENXIO;
 
 	if (atomic_read(&fifo->overflow) > 0) {
@@ -435,9 +438,9 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
 		int nonblock;
 
 		nonblock = (file->f_flags & O_NONBLOCK) || result > 0;
-		if ((err = snd_seq_fifo_cell_out(fifo, &cell, nonblock)) < 0) {
+		err = snd_seq_fifo_cell_out(fifo, &cell, nonblock);
+		if (err < 0)
 			break;
-		}
 		if (snd_seq_ev_is_variable(&cell->event)) {
 			struct snd_seq_event tmpev;
 			tmpev = cell->event;
@@ -970,7 +973,8 @@ static int snd_seq_client_enqueue_event(struct snd_seq_client *client,
 		return err;
 
 	/* we got a cell. enqueue it. */
-	if ((err = snd_seq_enqueue_event(cell, atomic, hop)) < 0) {
+	err = snd_seq_enqueue_event(cell, atomic, hop);
+	if (err < 0) {
 		snd_seq_cell_free(cell);
 		return err;
 	}
@@ -1312,7 +1316,8 @@ static int snd_seq_ioctl_create_port(struct snd_seq_client *client, void *arg)
 		return -EINVAL;
 	}
 	if (client->type == KERNEL_CLIENT) {
-		if ((callback = info->kernel) != NULL) {
+		callback = info->kernel;
+		if (callback) {
 			if (callback->owner)
 				port->owner = callback->owner;
 			port->private_data = callback->private_data;
@@ -1466,13 +1471,17 @@ static int snd_seq_ioctl_subscribe_port(struct snd_seq_client *client,
 	struct snd_seq_client *receiver = NULL, *sender = NULL;
 	struct snd_seq_client_port *sport = NULL, *dport = NULL;
 
-	if ((receiver = snd_seq_client_use_ptr(subs->dest.client)) == NULL)
+	receiver = snd_seq_client_use_ptr(subs->dest.client);
+	if (!receiver)
 		goto __end;
-	if ((sender = snd_seq_client_use_ptr(subs->sender.client)) == NULL)
+	sender = snd_seq_client_use_ptr(subs->sender.client);
+	if (!sender)
 		goto __end;
-	if ((sport = snd_seq_port_use_ptr(sender, subs->sender.port)) == NULL)
+	sport = snd_seq_port_use_ptr(sender, subs->sender.port);
+	if (!sport)
 		goto __end;
-	if ((dport = snd_seq_port_use_ptr(receiver, subs->dest.port)) == NULL)
+	dport = snd_seq_port_use_ptr(receiver, subs->dest.port);
+	if (!dport)
 		goto __end;
 
 	result = check_subscription_permission(client, sport, dport, subs);
@@ -1508,13 +1517,17 @@ static int snd_seq_ioctl_unsubscribe_port(struct snd_seq_client *client,
 	struct snd_seq_client *receiver = NULL, *sender = NULL;
 	struct snd_seq_client_port *sport = NULL, *dport = NULL;
 
-	if ((receiver = snd_seq_client_use_ptr(subs->dest.client)) == NULL)
+	receiver = snd_seq_client_use_ptr(subs->dest.client);
+	if (!receiver)
 		goto __end;
-	if ((sender = snd_seq_client_use_ptr(subs->sender.client)) == NULL)
+	sender = snd_seq_client_use_ptr(subs->sender.client);
+	if (!sender)
 		goto __end;
-	if ((sport = snd_seq_port_use_ptr(sender, subs->sender.port)) == NULL)
+	sport = snd_seq_port_use_ptr(sender, subs->sender.port);
+	if (!sport)
 		goto __end;
-	if ((dport = snd_seq_port_use_ptr(receiver, subs->dest.port)) == NULL)
+	dport = snd_seq_port_use_ptr(receiver, subs->dest.port);
+	if (!dport)
 		goto __end;
 
 	result = check_subscription_permission(client, sport, dport, subs);
@@ -1926,9 +1939,11 @@ static int snd_seq_ioctl_get_subscription(struct snd_seq_client *client,
 	struct snd_seq_client_port *sport = NULL;
 
 	result = -EINVAL;
-	if ((sender = snd_seq_client_use_ptr(subs->sender.client)) == NULL)
+	sender = snd_seq_client_use_ptr(subs->sender.client);
+	if (!sender)
 		goto __end;
-	if ((sport = snd_seq_port_use_ptr(sender, subs->sender.port)) == NULL)
+	sport = snd_seq_port_use_ptr(sender, subs->sender.port);
+	if (!sport)
 		goto __end;
 	result = snd_seq_port_get_subscription(&sport->c_src, &subs->dest,
 					       subs);
@@ -1955,9 +1970,11 @@ static int snd_seq_ioctl_query_subs(struct snd_seq_client *client, void *arg)
 	struct list_head *p;
 	int i;
 
-	if ((cptr = snd_seq_client_use_ptr(subs->root.client)) == NULL)
+	cptr = snd_seq_client_use_ptr(subs->root.client);
+	if (!cptr)
 		goto __end;
-	if ((port = snd_seq_port_use_ptr(cptr, subs->root.port)) == NULL)
+	port = snd_seq_port_use_ptr(cptr, subs->root.port);
+	if (!port)
 		goto __end;
 
 	switch (subs->type) {
diff --git a/sound/core/seq/seq_dummy.c b/sound/core/seq/seq_dummy.c
index cd5a4cad8881..ac760b1e3d12 100644
--- a/sound/core/seq/seq_dummy.c
+++ b/sound/core/seq/seq_dummy.c
@@ -109,7 +109,8 @@ create_port(int idx, int type)
 	struct snd_seq_port_callback pcb;
 	struct snd_seq_dummy_port *rec;
 
-	if ((rec = kzalloc(sizeof(*rec), GFP_KERNEL)) == NULL)
+	rec = kzalloc(sizeof(*rec), GFP_KERNEL);
+	if (!rec)
 		return NULL;
 
 	rec->client = my_client;
diff --git a/sound/core/seq/seq_fifo.c b/sound/core/seq/seq_fifo.c
index eaaa8b5830bb..f8e02e98709a 100644
--- a/sound/core/seq/seq_fifo.c
+++ b/sound/core/seq/seq_fifo.c
@@ -143,7 +143,8 @@ static struct snd_seq_event_cell *fifo_cell_out(struct snd_seq_fifo *f)
 {
 	struct snd_seq_event_cell *cell;
 
-	if ((cell = f->head) != NULL) {
+	cell = f->head;
+	if (cell) {
 		f->head = cell->next;
 
 		/* reset tail if this was the last element */
diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index e245bb6ba533..b7aee23fc387 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -69,7 +69,8 @@ int snd_seq_dump_var_event(const struct snd_seq_event *event,
 	int len, err;
 	struct snd_seq_event_cell *cell;
 
-	if ((len = get_var_len(event)) <= 0)
+	len = get_var_len(event);
+	if (len <= 0)
 		return len;
 
 	if (event->data.ext.len & SNDRV_SEQ_EXT_USRPTR) {
@@ -133,7 +134,8 @@ int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char
 	int len, newlen;
 	int err;
 
-	if ((len = get_var_len(event)) < 0)
+	len = get_var_len(event);
+	if (len < 0)
 		return len;
 	newlen = len;
 	if (size_aligned > 0)
diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index 6825940ea2cf..4589aac09154 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -101,7 +101,8 @@ static int dump_midi(struct snd_rawmidi_substream *substream, const char *buf, i
 	if (snd_BUG_ON(!substream || !buf))
 		return -EINVAL;
 	runtime = substream->runtime;
-	if ((tmp = runtime->avail) < count) {
+	tmp = runtime->avail;
+	if (tmp < count) {
 		if (printk_ratelimit())
 			pr_err("ALSA: seq_midi: MIDI output buffer overrun\n");
 		return -ENOMEM;
@@ -167,10 +168,11 @@ static int midisynth_subscribe(void *private_data, struct snd_seq_port_subscribe
 	struct snd_rawmidi_params params;
 
 	/* open midi port */
-	if ((err = snd_rawmidi_kernel_open(msynth->card, msynth->device,
-					   msynth->subdevice,
-					   SNDRV_RAWMIDI_LFLG_INPUT,
-					   &msynth->input_rfile)) < 0) {
+	err = snd_rawmidi_kernel_open(msynth->card, msynth->device,
+				      msynth->subdevice,
+				      SNDRV_RAWMIDI_LFLG_INPUT,
+				      &msynth->input_rfile);
+	if (err < 0) {
 		pr_debug("ALSA: seq_midi: midi input open failed!!!\n");
 		return err;
 	}
@@ -178,7 +180,8 @@ static int midisynth_subscribe(void *private_data, struct snd_seq_port_subscribe
 	memset(&params, 0, sizeof(params));
 	params.avail_min = 1;
 	params.buffer_size = input_buffer_size;
-	if ((err = snd_rawmidi_input_params(msynth->input_rfile.input, &params)) < 0) {
+	err = snd_rawmidi_input_params(msynth->input_rfile.input, &params);
+	if (err < 0) {
 		snd_rawmidi_kernel_release(&msynth->input_rfile);
 		return err;
 	}
@@ -209,10 +212,11 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 	struct snd_rawmidi_params params;
 
 	/* open midi port */
-	if ((err = snd_rawmidi_kernel_open(msynth->card, msynth->device,
-					   msynth->subdevice,
-					   SNDRV_RAWMIDI_LFLG_OUTPUT,
-					   &msynth->output_rfile)) < 0) {
+	err = snd_rawmidi_kernel_open(msynth->card, msynth->device,
+				      msynth->subdevice,
+				      SNDRV_RAWMIDI_LFLG_OUTPUT,
+				      &msynth->output_rfile);
+	if (err < 0) {
 		pr_debug("ALSA: seq_midi: midi output open failed!!!\n");
 		return err;
 	}
@@ -220,7 +224,8 @@ static int midisynth_use(void *private_data, struct snd_seq_port_subscribe *info
 	params.avail_min = 1;
 	params.buffer_size = output_buffer_size;
 	params.no_active_sensing = 1;
-	if ((err = snd_rawmidi_output_params(msynth->output_rfile.output, &params)) < 0) {
+	err = snd_rawmidi_output_params(msynth->output_rfile.output, &params);
+	if (err < 0) {
 		snd_rawmidi_kernel_release(&msynth->output_rfile);
 		return err;
 	}
diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index 13cfc2d47fa7..d6c02dea976c 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -222,7 +222,8 @@ struct snd_seq_queue *snd_seq_queue_find_name(char *name)
 	struct snd_seq_queue *q;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		if ((q = queueptr(i)) != NULL) {
+		q = queueptr(i);
+		if (q) {
 			if (strncmp(q->name, name, sizeof(q->name)) == 0)
 				return q;
 			queuefree(q);
@@ -432,7 +433,8 @@ int snd_seq_queue_timer_open(int queueid)
 	if (queue == NULL)
 		return -EINVAL;
 	tmr = queue->timer;
-	if ((result = snd_seq_timer_open(queue)) < 0) {
+	result = snd_seq_timer_open(queue);
+	if (result < 0) {
 		snd_seq_timer_defaults(tmr);
 		result = snd_seq_timer_open(queue);
 	}
@@ -548,7 +550,8 @@ void snd_seq_queue_client_leave(int client)
 
 	/* delete own queues from queue list */
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		if ((q = queue_list_remove(i, client)) != NULL)
+		q = queue_list_remove(i, client);
+		if (q)
 			queue_delete(q);
 	}
 
@@ -556,7 +559,8 @@ void snd_seq_queue_client_leave(int client)
 	 * they are not owned by this client
 	 */
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		if ((q = queueptr(i)) == NULL)
+		q = queueptr(i);
+		if (!q)
 			continue;
 		if (test_bit(client, q->clients_bitmap)) {
 			snd_seq_prioq_leave(q->tickq, client, 0);
@@ -578,7 +582,8 @@ void snd_seq_queue_client_leave_cells(int client)
 	struct snd_seq_queue *q;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		if ((q = queueptr(i)) == NULL)
+		q = queueptr(i);
+		if (!q)
 			continue;
 		snd_seq_prioq_leave(q->tickq, client, 0);
 		snd_seq_prioq_leave(q->timeq, client, 0);
@@ -593,7 +598,8 @@ void snd_seq_queue_remove_cells(int client, struct snd_seq_remove_events *info)
 	struct snd_seq_queue *q;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		if ((q = queueptr(i)) == NULL)
+		q = queueptr(i);
+		if (!q)
 			continue;
 		if (test_bit(client, q->clients_bitmap) &&
 		    (! (info->remove_mode & SNDRV_SEQ_REMOVE_DEST) ||
@@ -724,7 +730,8 @@ void snd_seq_info_queues_read(struct snd_info_entry *entry,
 	int owner;
 
 	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		if ((q = queueptr(i)) == NULL)
+		q = queueptr(i);
+		if (!q)
 			continue;
 
 		tmr = q->timer;
diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index 77d7037d1476..4abc38c70cae 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -482,10 +482,11 @@ int snd_virmidi_new(struct snd_card *card, int device, struct snd_rawmidi **rrmi
 	int err;
 	
 	*rrmidi = NULL;
-	if ((err = snd_rawmidi_new(card, "VirMidi", device,
-				   16,	/* may be configurable */
-				   16,	/* may be configurable */
-				   &rmidi)) < 0)
+	err = snd_rawmidi_new(card, "VirMidi", device,
+			      16,	/* may be configurable */
+			      16,	/* may be configurable */
+			      &rmidi);
+	if (err < 0)
 		return err;
 	strcpy(rmidi->name, rmidi->id);
 	rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
-- 
2.26.2

