Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56F256490
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 05:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848A518D5;
	Sat, 29 Aug 2020 05:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848A518D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598673177;
	bh=BrH7Hq43MFT643etmrcPFD2ciosy5EKJSghGTnYGsaw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNEhsRDReWyXoxEJ7q/DU+wP1gJ6CzhY1uoPlgeAtNvw7EEimSfMbZx1xkWUtwVAn
	 HLlikh9YUuQd+ksFTXduFRl/nztxtxRIn+MzTNyvi+QQ27CsJ8rkMQFTWEY4b7nj4d
	 vtZK496GvwtbxmTV5BIa/8+IMn7Jg0oeFi1gCQm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A81EEF80260;
	Sat, 29 Aug 2020 05:51:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95988F8025A; Sat, 29 Aug 2020 05:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FROM,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn
 [202.108.3.167]) by alsa1.perex.cz (Postfix) with SMTP id 812C6F8012E
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 05:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 812C6F8012E
Received: from unknown (HELO localhost.localdomain)([221.219.168.120])
 by sina.com with ESMTP
 id 5F49D09D0002ACC0; Sat, 29 Aug 2020 11:50:55 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 820213628766
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+12a3fcd1493ec6585007@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in snd_pcm_oss_release
Date: Sat, 29 Aug 2020 11:50:43 +0800
Message-Id: <20200829035043.4612-1-hdanton@sina.com>
In-Reply-To: <000000000000cd24b305adde81ff@google.com>
References: <000000000000cd24b305adde81ff@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org, arnd@arndb.de,
 tiwai@suse.com, syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 hdanton@sina.com, akpm@linux-foundation.org, walken@google.com, vbabka@suse.cz
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


Thu, 27 Aug 2020 09:34:15 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    f37be724 Add linux-next specific files for 20200826
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=137c7cb9900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1e5a1cf036089d95
> dashboard link: https://syzkaller.appspot.com/bug?extid=12a3fcd1493ec6585007
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+12a3fcd1493ec6585007@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: use-after-free in snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2367 [inline]
> BUG: KASAN: use-after-free in snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2361 [inline]
> BUG: KASAN: use-after-free in snd_pcm_oss_release+0x28d/0x300 sound/core/oss/pcm_oss.c:2548
> Read of size 8 at addr ffff888026b66480 by task syz-executor.1/27751
> 
> CPU: 1 PID: 27751 Comm: syz-executor.1 Not tainted 5.9.0-rc2-next-20200826-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x18f/0x20d lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0xae/0x497 mm/kasan/report.c:383
>  __kasan_report mm/kasan/report.c:513 [inline]
>  kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
>  snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2367 [inline]
>  snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2361 [inline]
>  snd_pcm_oss_release+0x28d/0x300 sound/core/oss/pcm_oss.c:2548
>  __fput+0x285/0x920 fs/file_table.c:281
>  task_work_run+0xdd/0x190 kernel/task_work.c:141
>  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>  exit_to_user_mode_loop kernel/entry/common.c:140 [inline]
>  exit_to_user_mode_prepare+0x195/0x1c0 kernel/entry/common.c:167
>  syscall_exit_to_user_mode+0x59/0x2b0 kernel/entry/common.c:242
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x416f01
> Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48 83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48 89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
> RSP: 002b:00007ffdd39a5e70 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
> RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000416f01
> RDX: 0000000000000001 RSI: 0000000001190428 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 00007ffdd39a5f60 R11: 0000000000000293 R12: 0000000001190428
> R13: 0000000000268c54 R14: ffffffffffffffff R15: 000000000118cfec
> 
> Allocated by task 27754:
>  kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
>  kasan_set_track mm/kasan/common.c:56 [inline]
>  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:461
>  kmem_cache_alloc_trace+0x16e/0x2c0 mm/slab.c:3550
>  kmalloc include/linux/slab.h:554 [inline]
>  kzalloc include/linux/slab.h:666 [inline]
>  snd_pcm_oss_open_file sound/core/oss/pcm_oss.c:2389 [inline]
>  snd_pcm_oss_open.part.0+0x55e/0x1290 sound/core/oss/pcm_oss.c:2491
>  snd_pcm_oss_open+0x3c/0x50 sound/core/oss/pcm_oss.c:2455
>  soundcore_open+0x445/0x600 sound/sound_core.c:593
>  chrdev_open+0x266/0x770 fs/char_dev.c:414
>  do_dentry_open+0x4b9/0x11b0 fs/open.c:817
>  do_open fs/namei.c:3251 [inline]
>  path_openat+0x1b9a/0x2730 fs/namei.c:3368
>  do_filp_open+0x17e/0x3c0 fs/namei.c:3395
>  do_sys_openat2+0x16d/0x420 fs/open.c:1168
>  do_sys_open fs/open.c:1184 [inline]
>  __do_sys_openat fs/open.c:1200 [inline]
>  __se_sys_openat fs/open.c:1195 [inline]
>  __x64_sys_openat+0x13f/0x1f0 fs/open.c:1195
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Freed by task 27754:
>  kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
>  kasan_set_track+0x1c/0x30 mm/kasan/common.c:56
>  kasan_set_free_info+0x1b/0x30 mm/kasan/generic.c:355
>  __kasan_slab_free+0xd8/0x120 mm/kasan/common.c:422
>  __cache_free mm/slab.c:3418 [inline]
>  kfree+0x103/0x2c0 mm/slab.c:3756
>  snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2371 [inline]
>  snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2361 [inline]
>  snd_pcm_oss_release+0x17e/0x300 sound/core/oss/pcm_oss.c:2548
>  __fput+0x285/0x920 fs/file_table.c:281
>  task_work_run+0xdd/0x190 kernel/task_work.c:141
>  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>  exit_to_user_mode_loop kernel/entry/common.c:140 [inline]
>  exit_to_user_mode_prepare+0x195/0x1c0 kernel/entry/common.c:167
>  syscall_exit_to_user_mode+0x59/0x2b0 kernel/entry/common.c:242
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> The buggy address belongs to the object at ffff888026b66480
>  which belongs to the cache kmalloc-32 of size 32
> The buggy address is located 0 bytes inside of
>  32-byte region [ffff888026b66480, ffff888026b664a0)
> The buggy address belongs to the page:
> page:0000000076bbbb49 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888026b66fc1 pfn:0x26b66
> flags: 0xfffe0000000200(slab)
> raw: 00fffe0000000200 ffffea0002385208 ffffea0000782448 ffff8880aa040100
> raw: ffff888026b66fc1 ffff888026b66000 000000010000002e 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffff888026b66380: fa fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
>  ffff888026b66400: 00 fc fc fc fc fc fc fc 00 00 00 00 fc fc fc fc
> >ffff888026b66480: fa fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
>                    ^
>  ffff888026b66500: 00 fc fc fc fc fc fc fc 00 fc fc fc fc fc fc fc
>  ffff888026b66580: fa fb fb fb fc fc fc fc fb fb fb fb fc fc fc fc
> ==================================================================

Hard to see why file is released more than once though it's not
that hard to prepare a fix.

--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2535,6 +2535,10 @@ static int snd_pcm_oss_release(struct in
 	struct snd_pcm_oss_file *pcm_oss_file;
 
 	pcm_oss_file = file->private_data;
+	if (!pcm_oss_file)
+		return 0;
+	file->private_data = NULL;
+
 	substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	if (substream == NULL)
 		substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];

