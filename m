Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9432E1255
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 03:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BB001774;
	Wed, 23 Dec 2020 03:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BB001774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608690117;
	bh=77ZSZWfbcvJpjRQEnqkDrt0xG/D+qCn+Gkdj4HHB7FA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=byNEc9q1ylf/ncIcUdITNoqnI+8cMnwjV0hhx/tNLf5klDw1Gfcx2mDo2JZm0HsET
	 g+DcbwEyHxCXse+wEcBlzVKNult9mSvFt9oDKxkBeWnMa5VRtYbjxxmdjg3or4FTXg
	 yjOdrKac2PzySqyA2YDT5aN/gCb+b404GD48Haws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75A8EF8013F;
	Wed, 23 Dec 2020 03:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A71BDF804E1; Wed, 23 Dec 2020 03:20:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EFDEF801EB
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 03:20:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EFDEF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y9/tE8cF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F07122273;
 Wed, 23 Dec 2020 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690006;
 bh=77ZSZWfbcvJpjRQEnqkDrt0xG/D+qCn+Gkdj4HHB7FA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y9/tE8cFqtclvml2JS0MyGLo0JSqeUHRHcpa50ETCxfSvMhpTutIhs4URS7f2nTyp
 7B0gUtkt6OisQO5+jDUBzyaUJz1CtJKxHvNLDP6VHNZvFEQkKiUojLY12df10t9O37
 LcbU3izLpzMERUNi8sVO9I3+m768dBMtrAeOfBDp/xebexjw4Qydyjo5G2I5ipu40g
 QZNlGZBD+r+IljCS2K2ASSTj+ImoXoh7yoCU5ahsCL2k/jsA2GqPJ9fEGmYkutnvyT
 /YhZccO6TZVkcE5WWG7XZ21wZko0p/HaIfQ2XcR5TZk6wtSCavOm9Ia6x3cgiC90nu
 87U1G95KyeR2w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 087/130] ALSA: rawmidi: Access runtime->avail
 always in spinlock
Date: Tue, 22 Dec 2020 21:17:30 -0500
Message-Id: <20201223021813.2791612-87-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org,
 syzbot+3d367d1df1d2b67f5c19@syzkaller.appspotmail.com,
 syzbot+a23a6f1215c84756577c@syzkaller.appspotmail.com
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 88a06d6fd6b369d88cec46c62db3e2604a2f50d5 ]

The runtime->avail field may be accessed concurrently while some
places refer to it without taking the runtime->lock spinlock, as
detected by KCSAN.  Usually this isn't a big problem, but for
consistency and safety, we should take the spinlock at each place
referencing this field.

Reported-by: syzbot+a23a6f1215c84756577c@syzkaller.appspotmail.com
Reported-by: syzbot+3d367d1df1d2b67f5c19@syzkaller.appspotmail.com
Link: https://lore.kernel.org/r/20201206083527.21163-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/rawmidi.c | 49 +++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 94db4683cfaff..6a3543b8455fc 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -72,11 +72,21 @@ static inline unsigned short snd_rawmidi_file_flags(struct file *file)
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
@@ -945,7 +955,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 	if (result > 0) {
 		if (runtime->event)
 			schedule_work(&runtime->event_work);
-		else if (snd_rawmidi_ready(substream))
+		else if (__snd_rawmidi_ready(runtime))
 			wake_up(&runtime->sleep);
 	}
 	spin_unlock_irqrestore(&runtime->lock, flags);
@@ -1024,7 +1034,7 @@ static ssize_t snd_rawmidi_read(struct file *file, char __user *buf, size_t coun
 	result = 0;
 	while (count > 0) {
 		spin_lock_irq(&runtime->lock);
-		while (!snd_rawmidi_ready(substream)) {
+		while (!__snd_rawmidi_ready(runtime)) {
 			wait_queue_entry_t wait;
 
 			if ((file->f_flags & O_NONBLOCK) != 0 || result > 0) {
@@ -1041,9 +1051,11 @@ static ssize_t snd_rawmidi_read(struct file *file, char __user *buf, size_t coun
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
@@ -1181,7 +1193,7 @@ int __snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream, int coun
 	runtime->avail += count;
 	substream->bytes += count;
 	if (count > 0) {
-		if (runtime->drain || snd_rawmidi_ready(substream))
+		if (runtime->drain || __snd_rawmidi_ready(runtime))
 			wake_up(&runtime->sleep);
 	}
 	return count;
@@ -1370,9 +1382,11 @@ static ssize_t snd_rawmidi_write(struct file *file, const char __user *buf,
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
@@ -1452,6 +1466,7 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 	struct snd_rawmidi *rmidi;
 	struct snd_rawmidi_substream *substream;
 	struct snd_rawmidi_runtime *runtime;
+	unsigned long buffer_size, avail, xruns;
 
 	rmidi = entry->private_data;
 	snd_iprintf(buffer, "%s\n\n", rmidi->name);
@@ -1470,13 +1485,16 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
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
@@ -1494,13 +1512,16 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
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
2.27.0

