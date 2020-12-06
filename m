Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB642D01F7
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 09:36:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAACF17DC;
	Sun,  6 Dec 2020 09:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAACF17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607243814;
	bh=IlKL2TJ7rMTooE34+t9+fSWNPCqRE86LlG7ciOGEQsU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vBFOKNmWlzGP95ZBUc6vrjGPD5gN6l0C7qcjdDEBZIsBiDl5+LT81YK9pZ0O2PHPB
	 tw/1AKxF7ZDfqoj6+lZSRGI7fvaBFyiw/XuxHYSBerSlIz9dbHJBcEifbNmSSux2aD
	 z5a55/s8zN7eiaS0ulxUN1+i/BMftw7mEo969EMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB222F8025A;
	Sun,  6 Dec 2020 09:35:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5B48F80255; Sun,  6 Dec 2020 09:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56805F8010A
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 09:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56805F8010A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA877AB63
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 08:35:28 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: rawmidi: Access runtime->avail always in spinlock
Date: Sun,  6 Dec 2020 09:35:27 +0100
Message-Id: <20201206083527.21163-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

The runtime->avail field may be accessed concurrently while some
places refer to it without taking the runtime->lock spinlock, as
detected by KCSAN.  Usually this isn't a big problem, but for
consistency and safety, we should take the spinlock at each place
referencing this field.

Reported-by: syzbot+a23a6f1215c84756577c@syzkaller.appspotmail.com
Reported-by: syzbot+3d367d1df1d2b67f5c19@syzkaller.appspotmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi.c | 49 +++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index c78720a3299c..257ad5206240 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -95,11 +95,21 @@ static inline unsigned short snd_rawmidi_file_flags(struct file *file)
 	}
 }
 
-static inline int snd_rawmidi_ready(struct snd_rawmidi_substream *substream)
+static inline bool __snd_rawmidi_ready(struct snd_rawmidi_runtime *runtime)
+{
+	return runtime->avail >= runtime->avail_min;
+}
+
+static bool snd_rawmidi_ready(struct snd_rawmidi_substream *substream)
 {
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
+	unsigned long flags;
+	bool ready;
 
-	return runtime->avail >= runtime->avail_min;
+	spin_lock_irqsave(&runtime->lock, flags);
+	ready = __snd_rawmidi_ready(runtime);
+	spin_unlock_irqrestore(&runtime->lock, flags);
+	return ready;
 }
 
 static inline int snd_rawmidi_ready_append(struct snd_rawmidi_substream *substream,
@@ -1019,7 +1029,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 	if (result > 0) {
 		if (runtime->event)
 			schedule_work(&runtime->event_work);
-		else if (snd_rawmidi_ready(substream))
+		else if (__snd_rawmidi_ready(runtime))
 			wake_up(&runtime->sleep);
 	}
 	spin_unlock_irqrestore(&runtime->lock, flags);
@@ -1098,7 +1108,7 @@ static ssize_t snd_rawmidi_read(struct file *file, char __user *buf, size_t coun
 	result = 0;
 	while (count > 0) {
 		spin_lock_irq(&runtime->lock);
-		while (!snd_rawmidi_ready(substream)) {
+		while (!__snd_rawmidi_ready(runtime)) {
 			wait_queue_entry_t wait;
 
 			if ((file->f_flags & O_NONBLOCK) != 0 || result > 0) {
@@ -1115,9 +1125,11 @@ static ssize_t snd_rawmidi_read(struct file *file, char __user *buf, size_t coun
 				return -ENODEV;
 			if (signal_pending(current))
 				return result > 0 ? result : -ERESTARTSYS;
-			if (!runtime->avail)
-				return result > 0 ? result : -EIO;
 			spin_lock_irq(&runtime->lock);
+			if (!runtime->avail) {
+				spin_unlock_irq(&runtime->lock);
+				return result > 0 ? result : -EIO;
+			}
 		}
 		spin_unlock_irq(&runtime->lock);
 		count1 = snd_rawmidi_kernel_read1(substream,
@@ -1255,7 +1267,7 @@ int __snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream, int coun
 	runtime->avail += count;
 	substream->bytes += count;
 	if (count > 0) {
-		if (runtime->drain || snd_rawmidi_ready(substream))
+		if (runtime->drain || __snd_rawmidi_ready(runtime))
 			wake_up(&runtime->sleep);
 	}
 	return count;
@@ -1444,9 +1456,11 @@ static ssize_t snd_rawmidi_write(struct file *file, const char __user *buf,
 				return -ENODEV;
 			if (signal_pending(current))
 				return result > 0 ? result : -ERESTARTSYS;
-			if (!runtime->avail && !timeout)
-				return result > 0 ? result : -EIO;
 			spin_lock_irq(&runtime->lock);
+			if (!runtime->avail && !timeout) {
+				spin_unlock_irq(&runtime->lock);
+				return result > 0 ? result : -EIO;
+			}
 		}
 		spin_unlock_irq(&runtime->lock);
 		count1 = snd_rawmidi_kernel_write1(substream, buf, NULL, count);
@@ -1526,6 +1540,7 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 	struct snd_rawmidi *rmidi;
 	struct snd_rawmidi_substream *substream;
 	struct snd_rawmidi_runtime *runtime;
+	unsigned long buffer_size, avail, xruns;
 
 	rmidi = entry->private_data;
 	snd_iprintf(buffer, "%s\n\n", rmidi->name);
@@ -1544,13 +1559,16 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 				    "  Owner PID    : %d\n",
 				    pid_vnr(substream->pid));
 				runtime = substream->runtime;
+				spin_lock_irq(&runtime->lock);
+				buffer_size = runtime->buffer_size;
+				avail = runtime->avail;
+				spin_unlock_irq(&runtime->lock);
 				snd_iprintf(buffer,
 				    "  Mode         : %s\n"
 				    "  Buffer size  : %lu\n"
 				    "  Avail        : %lu\n",
 				    runtime->oss ? "OSS compatible" : "native",
-				    (unsigned long) runtime->buffer_size,
-				    (unsigned long) runtime->avail);
+				    buffer_size, avail);
 			}
 		}
 	}
@@ -1568,13 +1586,16 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 					    "  Owner PID    : %d\n",
 					    pid_vnr(substream->pid));
 				runtime = substream->runtime;
+				spin_lock_irq(&runtime->lock);
+				buffer_size = runtime->buffer_size;
+				avail = runtime->avail;
+				xruns = runtime->xruns;
+				spin_unlock_irq(&runtime->lock);
 				snd_iprintf(buffer,
 					    "  Buffer size  : %lu\n"
 					    "  Avail        : %lu\n"
 					    "  Overruns     : %lu\n",
-					    (unsigned long) runtime->buffer_size,
-					    (unsigned long) runtime->avail,
-					    (unsigned long) runtime->xruns);
+					    buffer_size, avail, xruns);
 			}
 		}
 	}
-- 
2.26.2

