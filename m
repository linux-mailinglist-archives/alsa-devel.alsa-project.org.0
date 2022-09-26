Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0945E9D92
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 11:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8A0574C;
	Mon, 26 Sep 2022 11:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8A0574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664184451;
	bh=PHknalFy7Zem7NHnuStcPlLmB5vWKrLCU3i3bap4l+k=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g7flr0dj94l8KYulCE1wXY0XmBEnRJX9IeDWZzkd16rSbUlgh8ZSAzG/05RndqUYT
	 KGLU56lkvTt/uLK6EhLLrASzce9FVRTxjkaO44Q7nEomhMXGnJOtoa5H+tESl5bEge
	 6cQFMn2CmgNENkwZlDRKJBWLF/h/8B61BLon4LAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F38F802BE;
	Mon, 26 Sep 2022 11:26:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EC08F80134; Mon, 26 Sep 2022 11:26:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8860F80134
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 11:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8860F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VQMkr3g/"
Received: by mail-yb1-xb2d.google.com with SMTP id b136so7614573yba.2
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 02:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=k3JaCAa0Ojx0EKiQCLZh3CttxHg/OgI4IyIXY1aba7M=;
 b=VQMkr3g/QEcREiUm+IWxFwExq5TBxrnMktmvPB5UDVX7EGjahhZwJ6WfGnL0uA3YGF
 BLokVo2R7Z9pwgSw/yzDCGsxjEJOTCKcyzNdj1lkdaeUZpPJ8m50SmuOCZlSWBJ+tY9u
 yB6IpiEPJb69XDyU480Tv55Tls7IqL7F+IJZZUaF3PSO4vAF/vvnO4jOTwMf/PB1kyQG
 o9a9HfFP02Hllhk+T4UYIxbP9HjJy04LjQ4e2glGOOTP4lma62mMopGyrzrtSoMzaDGq
 dhhkt25LlPKCEYFehhv3Ie+N2TLoW1r/Upq9BBzs6Sbx+K2lw6c6emhZ0IuME9l5M9pU
 7lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=k3JaCAa0Ojx0EKiQCLZh3CttxHg/OgI4IyIXY1aba7M=;
 b=Os3kRsO0v06fWUhvzYxfJoe4LF7vZA3k+bTNJlDz9JFVCLQGwMPhUfFeHoteIpAn1K
 GuS5iI0gWT3U9pCjn0wNGZZfsaEytccit4Va+ObS/AqtEYpp2lAgElZqEbkUWH3M4MFS
 oXrWmQtQzP12EoG71NZgFR4bSwyRvpCZhpQU8QGJGcamI3+febUiwZjT+0BThJrpIFdY
 g8yUBlXd2vBTwgoW64NzMvOW8qBgig6W0HVuwhLWZNObfPAoBe8eTbUtF77J4z+r0HPV
 Fzr/Z0RsNepan9LcwwBCAHNxTki86cZjn2Z2zI/mOJN1cz9dEcZuvn7TiXsg3AoIuOgN
 473w==
X-Gm-Message-State: ACrzQf0fpkMwoZ5xDkA4+7sbEftTVKxsfSI37sf5EeKt5uKGH15LnNP7
 Opu7EzUpBEq5344PXG3EvZ/d2dW7XLF043Klu9Y=
X-Google-Smtp-Source: AMsMyM7Pwf//UKDt3oLm9ck0yi1KSi1HYMbs4kNvG2je1ovHLSUuLJyebgfBNZS6+b+crqaP+uQvV22WhQf/L9tM8iI=
X-Received: by 2002:a25:84c9:0:b0:6b5:3e75:9797 with SMTP id
 x9-20020a2584c9000000b006b53e759797mr16116510ybm.148.1664184388030; Mon, 26
 Sep 2022 02:26:28 -0700 (PDT)
MIME-Version: 1.0
From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date: Mon, 26 Sep 2022 17:26:17 +0800
Message-ID: <CAFcO6XNk5Wtjju=DBOcJr46miBbaWT7jL+zjhWMp+xnz7k5K9A@mail.gmail.com>
Subject: A divide error bug in snd_pcm_write
To: perex@perex.cz, tiwai@suse.com, pierre-louis.bossart@linux.intel.com, 
 broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
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

Hi, there is a divide error bug in snd_pcm_write in
sound/core/pcm_native.c in the latest kernel.

##Root Cause
When open the device of /dev/snd/pcmC#D#p, there would attach a
runtime to pcm->substream via snd_pcm_open_substream. see the code
below:
```
int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
    struct file *file,
    struct snd_pcm_substream **rsubstream)
{
......

 runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
if (runtime == NULL)
return -ENOMEM;

size = PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status));
runtime->status = alloc_pages_exact(size, GFP_KERNEL);
if (runtime->status == NULL) {
kfree(runtime);
return -ENOMEM;
}
memset(runtime->status, 0, size);

size = PAGE_ALIGN(sizeof(struct snd_pcm_mmap_control));
runtime->control = alloc_pages_exact(size, GFP_KERNEL);
if (runtime->control == NULL) {
free_pages_exact(runtime->status,
      PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status)));
kfree(runtime);
return -ENOMEM;
}
memset(runtime->control, 0, size);

init_waitqueue_head(&runtime->sleep);
init_waitqueue_head(&runtime->tsleep);

runtime->status->state = SNDRV_PCM_STATE_OPEN;
mutex_init(&runtime->buffer_mutex);
atomic_set(&runtime->buffer_accessing, 0);

substream->runtime = runtime;
substream->private_data = pcm->private_data;
substream->ref_count = 1;
substream->f_flags = file->f_flags;
substream->pid = get_pid(task_pid(current));
pstr->substream_opened++;
*rsubstream = substream;
return 0;
}
```
It would kzmalloc a new runtime. And initialize runtime simply.
If we write some data to the device. it would call snd_pcm_write or
snd_pcm_writev. and read some date from the device, it would call
snd_pcm_read or snd_pcm_readv.
Anyway, the four function would use data of runtime, but some data of
runtime is NULL not be initialized, see the code below:
```
static ssize_t snd_pcm_write(struct file *file, const char __user *buf,
    size_t count, loff_t * offset)
{
struct snd_pcm_file *pcm_file;
struct snd_pcm_substream *substream;
struct snd_pcm_runtime *runtime;
snd_pcm_sframes_t result;

pcm_file = file->private_data;
substream = pcm_file->substream;
if (PCM_RUNTIME_CHECK(substream))
return -ENXIO;
runtime = substream->runtime;
if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
   runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
return -EBADFD;
if (!frame_aligned(runtime, count))    ///////  [1]
return -EINVAL;
count = bytes_to_frames(runtime, count);    /////// [2]
result = snd_pcm_lib_write(substream, buf, count);
if (result > 0)
result = frames_to_bytes(runtime, result);
return result;
}
```
[1] call frame_aligned to aligned.
```
static inline int frame_aligned(struct snd_pcm_runtime *runtime, ssize_t bytes)
{
return bytes % runtime->byte_align == 0;
}
```
but runtime->byte_align is NULL.

[2] call bytes_to_frames.
```
static inline ssize_t frames_to_bytes(struct snd_pcm_runtime *runtime,
snd_pcm_sframes_t size)
{
return size * runtime->frame_bits / 8;
}
```
but runtime->frame_bits is NULL.

##reproduce it
[ 1189.305083][ T4656] divide error: 0000 [#1] PREEMPT SMP
[ 1189.305600][ T4656] CPU: 1 PID: 4656 Comm: snd_pcm_write Not
tainted 6.0.0-rc7 #16
[ 1189.306157][ T4656] Hardware name: QEMU Standard PC (i440FX + PIIX,
1996), BIOS 1.13.0-1ubuntu1 04/01/2014
[ 1189.306760][ T4656] RIP: 0010:snd_pcm_write+0x33/0xa0
[ 1189.307155][ T4656] Code: 8b 38 48 85 ff 74 72 48 8b 9f c0 00 00 00
48 85 db 74 66 48 8b 83 00 01 00 00 f7 00 f7 ff ff ff 74 6b 48 89 d0
48 89 d1 31 d2 <48> f7 b3 91
[ 1189.308553][ T4656] RSP: 0018:ffffc9000adc7e68 EFLAGS: 00010246
[ 1189.309034][ T4656] RAX: 0000000000000000 RBX: ffff888048ec2000
RCX: 0000000000000000
[ 1189.309583][ T4656] RDX: 0000000000000000 RSI: 0000000000000000
RDI: ffff888046fc9c00
[ 1189.310163][ T4656] RBP: 0000000000000000 R08: 0000000000000000
R09: 0000000000020026
[ 1189.310679][ T4656] R10: 0000000000000001 R11: 0000000000000000
R12: 0000000000000000
[ 1189.311226][ T4656] R13: ffffc9000adc7f08 R14: 0000000000000000
R15: 0000000000000000
[ 1189.311754][ T4656] FS:  00000000012d8880(0000)
GS:ffff88807ec00000(0000) knlGS:0000000000000000
[ 1189.312350][ T4656] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1189.312780][ T4656] CR2: 0000000020000000 CR3: 000000004b496000
CR4: 00000000000006e0
[ 1189.313234][ T4656] Call Trace:
[ 1189.313424][ T4656]  <TASK>
[ 1189.313597][ T4656]  vfs_write+0xe6/0x4d0
[ 1189.313836][ T4656]  ksys_write+0x60/0xe0
[ 1189.314071][ T4656]  do_syscall_64+0x35/0xb0
[ 1189.314324][ T4656]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[ 1189.314734][ T4656] RIP: 0033:0x44dc3d
[ 1189.315007][ T4656] Code: 28 c3 e8 36 29 00 00 66 0f 1f 44 00 00 f3
0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b
4c 24 08 0f 05 <48> 3d 01 f8
[ 1189.316338][ T4656] RSP: 002b:00007ffcbdf5ef38 EFLAGS: 00000246
ORIG_RAX: 0000000000000001
[ 1189.317012][ T4656] RAX: ffffffffffffffda RBX: 0000000000400530
RCX: 000000000044dc3d
[ 1189.317693][ T4656] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000003
[ 1189.318172][ T4656] RBP: 00007ffcbdf5ef50 R08: 0000000082000000
R09: 0000000000000000
[ 1189.318648][ T4656] R10: 000000000000ffff R11: 0000000000000246
R12: 00000000004030a0
[ 1189.319182][ T4656] R13: 0000000000000000 R14: 00000000004c5018
R15: 0000000000000000


Regrads,
 butt3rflyh4ck.




-- 
Active Defense Lab of Venustech
