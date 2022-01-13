Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E673648DA4F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 16:00:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70DC61FA5;
	Thu, 13 Jan 2022 16:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70DC61FA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642086052;
	bh=QAJmWtCS1F0Penig05ppnAZid5xClp9Dptxjb66eIXI=;
	h=Date:Subject:To:From:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NKQidmxfhkwFfPYEggNQm7R7nMojfynTjgo5T9524JyvQEYloZeygnFcD2RgqQLVh
	 WXNNtwcS14wKZCU4vtilDoXCx0FBMPbC+LNx86C73JVLQtLjxYvaO96MaKSvMf1VRd
	 C5v4KODMfGTfD+D3FgljYa7sUUuJoSBLFAmXzjIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF7C3F80141;
	Thu, 13 Jan 2022 15:59:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12C5BF8013F; Thu, 13 Jan 2022 15:59:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDDCEF80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 15:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDDCEF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="I5BG8fsm"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220113145932euoutp026c1d1cb6a2871a8ac9e03d5c7fb8a69d~J3H4CviU10411104111euoutp02m
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 14:59:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220113145932euoutp026c1d1cb6a2871a8ac9e03d5c7fb8a69d~J3H4CviU10411104111euoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1642085972;
 bh=BqnuR7IhYcAW9fb5XMPJTuBbM7lhv3E84Ed+3VNytEs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=I5BG8fsmELxCSU8OUBmXlOWrI27anhMPnb9GgM8iR+DbC2PcpiQRt/0LhmBegmBh7
 kv9UIhMb/E9HPW/BV4g51CAQV7ezuu7Wfq4DhX0ViF6vjPIL8bxhqb3Stue5aL8gbm
 /JxQUVYZ1JgPmhpLEQo4h3aYA3DLmH1PVf6Ak2Nc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220113145932eucas1p1706d8757e2b952375df3c056fc27e4eb~J3H34faez0201502015eucas1p1Q;
 Thu, 13 Jan 2022 14:59:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8F.6C.10009.45E30E16; Thu, 13
 Jan 2022 14:59:32 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220113145932eucas1p24ba417692ca1ecc2a851f30a8c460851~J3H3Mwgww2821728217eucas1p2m;
 Thu, 13 Jan 2022 14:59:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220113145932eusmtrp2983a7e03577f6129cc583b4f7b555c02~J3H3MC4RT1862318623eusmtrp29;
 Thu, 13 Jan 2022 14:59:32 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-af-61e03e54c969
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DA.81.09522.35E30E16; Thu, 13
 Jan 2022 14:59:31 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220113145931eusmtip2e93812f47ea1141e645e36be8735e94d~J3H2xtFh30337403374eusmtip2X;
 Thu, 13 Jan 2022 14:59:31 +0000 (GMT)
Message-ID: <91d7a1df-9e90-7c07-f15c-7ca1dad0b4ef@samsung.com>
Date: Thu, 13 Jan 2022 15:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] ASoC: soc-pcm: Fix DPCM lockdep warning due to nested
 stream locks
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220113141858.10904-1-tiwai@suse.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djPc7ohdg8SDT7PVLK4cvEQk8XUh0/Y
 LN4cn85k8ev/MyaLl5vfMDmwemz43MTmsWlVJ5vHvJOBHu/3XWXz2Hy6OoA1issmJTUnsyy1
 SN8ugSvj/KLnzAV3qip+r1vC3MC4P7uLkZNDQsBE4sjM0+xdjFwcQgIrGIGcpcwQzhdGia+P
 FzFCOJ8ZJWY8ucQG0/Lj6z5WiMRyRomOOzeg+j8ySvTNawOr4hWwk2hrXcsKYrMIqEo8uDkP
 Ki4ocXLmExYQW1QgSeLhg19gtrBApETz8clMIDazgLjErSfzwWwRAVuJzqkQZzALtDNKnLj+
 kRkkwSZgKNH1tgtsKKeAsUTXhvMsEM3yEs1bZ4M9ISFwgUPiVf9yRoi7XSR+rOpngbCFJV4d
 38IOYctI/N8Jsg2koZlR4uG5tewQTg+jxOWmGVDd1hJ3zv0CWscBtEJTYv0ufYiwo8S346dY
 QcISAnwSN94KQhzBJzFp23RmiDCvREebEES1msSs4+vg1h68cIl5AqPSLKRwmYXk/1lI3pmF
 sHcBI8sqRvHU0uLc9NRiw7zUcr3ixNzi0rx0veT83E2MwJRz+t/xTzsY5776qHeIkYmD8RCj
 BAezkghvf9H9RCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8yZkbEoUE0hNLUrNTUwtSi2CyTByc
 Ug1MDifPHZddyDb/0bIHi6978c1j//I5r6h607FXacf+O044qrZSJOvvgotVu8oaX9Qq3HRh
 0Ev+/9UrpH/q1n08nDNT5b9uPKrhf1Fc3/5FhGkJ4+7g3V61uyW3Kz4UYFqduPDCislRwe7G
 5r+fqVyJ4dmkYJdhLiRkzVn1ITD60ZLbK1hZPhXt65KeHCUXVXjiqN8HBXnBkhb2QuMXd29O
 Xxb65XHltJqZ2y2Dbpa+sn6hs/wfC5/2SrPMn+vTHn2dNuHHuRvmRb+1Wdo+/k71dRLt+tCl
 k5Cl76jyc/2nFV5m0utP3LsXIymkdz/ocNDyLeG7pALP2a26tOS2zaOctWXH+d7diGR/kx68
 NOnmJCWW4oxEQy3mouJEAAGHPXuoAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xe7rBdg8SDQ7Ps7C4cvEQk8XUh0/Y
 LN4cn85k8ev/MyaLl5vfMDmwemz43MTmsWlVJ5vHvJOBHu/3XWXz2Hy6OoA1Ss+mKL+0JFUh
 I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j/KLnzAV3qip+r1vC
 3MC4P7uLkZNDQsBE4sfXfaxdjFwcQgJLGSW2vL7MCpGQkTg5rQHKFpb4c62LDaLoPaNEX8cd
 FpAEr4CdRFvrWrAiFgFViQc357FBxAUlTs58AlTDwSEqkCTxYYsfSFhYIFKi+fhkJhCbWUBc
 4taT+WC2iICtROfURYwg85kF2hklJkz4zAKxrI1RYt+7i2BD2QQMJbredoHZnALGEl0bzrNA
 TDKT6NraxQhhy0s0b53NPIFRaBaSO2YhWTgLScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al
 6yXn525iBEbYtmM/N+9gnPfqo94hRiYOxkOMEhzMSiK8/UX3E4V4UxIrq1KL8uOLSnNSiw8x
 mgIDYyKzlGhyPjDG80riDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUa
 mNITFnpwT7rqvXyuwaX/t45NNneYfsxvlnacmOfcGQ7Ji9wr34hMDFbb+fwZk+pjh8XXVovt
 fbXpwTueMsZVMwVZJjV5z7HaNMX52q3TORtsGSPSih4eF37CuPHA3yNC/oEbnR3dS5/uXBzG
 4yZ2w5wh5Km78+Q/z+MjFvMuWnup9YtN0lLeBbZ7LqpXqOw61bCsYuPhnFKZsvoPBqu0NWcv
 7T27vqo1x7U52zby0uEnftf4bxwtLQh4JK5u/4rlseOL875nOrZF8innpH+O9y/qual6yfNz
 SnXBo7CSRz5qq4XVuFZu2/D/GoPj5P36E6dkbTg1X7AhbcPir0VBravT/gc8/8z78UbP01Ph
 MkeVWIozEg21mIuKEwEU0Y5bOQMAAA==
X-CMS-MailID: 20220113145932eucas1p24ba417692ca1ecc2a851f30a8c460851
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220113141905eucas1p1efcaf3ad1d07e784635586bb5d38c4d6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220113141905eucas1p1efcaf3ad1d07e784635586bb5d38c4d6
References: <CGME20220113141905eucas1p1efcaf3ad1d07e784635586bb5d38c4d6@eucas1p1.samsung.com>
 <20220113141858.10904-1-tiwai@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 13.01.2022 15:18, Takashi Iwai wrote:
> The recent change for DPCM locking caused spurious lockdep warnings.
> Actually the warnings are false-positive, as those are triggered due
> to the nested stream locks for FE and BE.  Since both locks belong to
> the same lock class, lockdep sees it as if a deadlock.
>
> For fixing this, we need take PCM stream locks for BE with the nested
> lock primitives.  Since currently snd_pcm_stream_lock*() helper
> assumes only the top-level single locking, a new helper function
> snd_pcm_stream_lock_irqsave_nested() is defined for a single-depth
> nested lock, which is now used in the BE DAI trigger that is always
> performed inside a FE stream lock.
>
> Fixes: b7898396f4bb ("ASoC: soc-pcm: Fix and cleanup DPCM locking")
> Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: https://lore.kernel.org/r/73018f3c-9769-72ea-0325-b3f8e2381e30@redhat.com
> Link: https://lore.kernel.org/alsa-devel/9a0abddd-49e9-872d-2f00-a1697340f786@samsung.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Thanks for the fix! It helps a bit, but I still get a warning (a 
different one now):

root@target:~# speaker-test -l1

speaker-test 1.1.8

Playback device is default
Stream parameters are 48000Hz, S16_LE, 1 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 128 to 131072
Period size range from 64 to 65536
Using max buffer size 131072
Periods = 4
was set period_size = 32768
was set buffer_size = 131072
  0 - Front Left
Time per period = 0.022199
max98090 1-0010: PLL unlocked

=====================================================
WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
5.16.0-next-20220113-00001-g3967460dbcf4 #11212 Not tainted
-----------------------------------------------------
speaker-test/1319 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
c1296410 (pin_fs_lock){+.+.}-{2:2}, at: simple_pin_fs+0x1c/0xac

and this task is already holding:
c2fe6ea4 (&group->lock){..-.}-{2:2}, at: dpcm_be_disconnect+0x3c/0x348
which would create a new lock dependency:
  (&group->lock){..-.}-{2:2} -> (pin_fs_lock){+.+.}-{2:2}

but this new dependency connects a SOFTIRQ-irq-safe lock:
  (&group->lock){..-.}-{2:2}

... which became SOFTIRQ-irq-safe at:
   _raw_spin_lock_irqsave+0x4c/0x60
   snd_pcm_period_elapsed+0x10/0x2c
   pl330_tasklet+0x9dc/0xaa4
   tasklet_action_common.constprop.6+0x74/0xfc
   __do_softirq+0x140/0x5ec
   irq_exit+0x1cc/0x200
   __irq_svc+0x54/0x88
   arch_cpu_idle+0x40/0x44
   arch_cpu_idle+0x40/0x44
   default_idle_call+0x74/0x2c4
   do_idle+0x1cc/0x284
   cpu_startup_entry+0x18/0x1c
   start_kernel+0x678/0x6bc

to a SOFTIRQ-irq-unsafe lock:
  (pin_fs_lock){+.+.}-{2:2}

... which became SOFTIRQ-irq-unsafe at:
...
   _raw_spin_lock+0x38/0x48
   simple_pin_fs+0x1c/0xac
   start_creating+0x6c/0x170
   debugfs_create_dir+0x10/0x10c
   pinctrl_init+0x2c/0xd4
   do_one_initcall+0x6c/0x3a4
   kernel_init_freeable+0x1c4/0x214
   kernel_init+0x18/0x12c
   ret_from_fork+0x14/0x2c
   0x0

other info that might help us debug this:

  Possible interrupt unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(pin_fs_lock);
                                local_irq_disable();
                                lock(&group->lock);
                                lock(pin_fs_lock);
   <Interrupt>
     lock(&group->lock);

  *** DEADLOCK ***

3 locks held by speaker-test/1319:
  #0: c2fcbef0 (&pcm->open_mutex){+.+.}-{3:3}, at: snd_pcm_release+0x38/0xa8
  #1: c1fcb94c (&card->pcm_mutex){+.+.}-{3:3}, at: 
dpcm_fe_dai_close+0x1c/0x120
  #2: c2fe6ea4 (&group->lock){..-.}-{2:2}, at: dpcm_be_disconnect+0x3c/0x348

the dependencies between SOFTIRQ-irq-safe lock and the holding lock:
-> (&group->lock){..-.}-{2:2} {
    IN-SOFTIRQ-W at:
                     _raw_spin_lock_irqsave+0x4c/0x60
                     snd_pcm_period_elapsed+0x10/0x2c
                     pl330_tasklet+0x9dc/0xaa4
                     tasklet_action_common.constprop.6+0x74/0xfc
                     __do_softirq+0x140/0x5ec
                     irq_exit+0x1cc/0x200
                     __irq_svc+0x54/0x88
                     arch_cpu_idle+0x40/0x44
                     arch_cpu_idle+0x40/0x44
                     default_idle_call+0x74/0x2c4
                     do_idle+0x1cc/0x284
                     cpu_startup_entry+0x18/0x1c
                     start_kernel+0x678/0x6bc
    INITIAL USE at:
                    _raw_spin_lock_irq+0x4c/0x5c
                    dpcm_add_paths+0x260/0x4bc
                    dpcm_fe_dai_open+0x70/0x788
                    snd_pcm_open_substream+0x600/0x8f8
                    snd_pcm_open+0xa4/0x238
                    snd_pcm_playback_open+0x3c/0x60
                    chrdev_open+0xb0/0x1ac
                    do_dentry_open+0x244/0x3e4
                    path_openat+0x9f8/0xcbc
                    do_filp_open+0x78/0xe4
                    do_sys_openat2+0x28c/0x3d8
                    do_sys_open+0x8c/0xa8
                    ret_fast_syscall+0x0/0x1c
                    0xbefef3e0
  }
  ... key      at: [<c19c5f60>] __key.42687+0x0/0x8

the dependencies between the lock to be acquired
  and SOFTIRQ-irq-unsafe lock:
-> (pin_fs_lock){+.+.}-{2:2} {
    HARDIRQ-ON-W at:
                     _raw_spin_lock+0x38/0x48
                     simple_pin_fs+0x1c/0xac
                     start_creating+0x6c/0x170
                     debugfs_create_dir+0x10/0x10c
                     pinctrl_init+0x2c/0xd4
                     do_one_initcall+0x6c/0x3a4
                     kernel_init_freeable+0x1c4/0x214
                     kernel_init+0x18/0x12c
                     ret_from_fork+0x14/0x2c
                     0x0
    SOFTIRQ-ON-W at:
                     _raw_spin_lock+0x38/0x48
                     simple_pin_fs+0x1c/0xac
                     start_creating+0x6c/0x170
                     debugfs_create_dir+0x10/0x10c
                     pinctrl_init+0x2c/0xd4
                     do_one_initcall+0x6c/0x3a4
                     kernel_init_freeable+0x1c4/0x214
                     kernel_init+0x18/0x12c
                     ret_from_fork+0x14/0x2c
                     0x0
    INITIAL USE at:
                    _raw_spin_lock+0x38/0x48
                    simple_pin_fs+0x1c/0xac
                    start_creating+0x6c/0x170
                    debugfs_create_dir+0x10/0x10c
                    pinctrl_init+0x2c/0xd4
                    do_one_initcall+0x6c/0x3a4
                    kernel_init_freeable+0x1c4/0x214
                    kernel_init+0x18/0x12c
                    ret_from_fork+0x14/0x2c
                    0x0
  }
  ... key      at: [<c1296410>] pin_fs_lock+0x10/0x24
  ... acquired at:
    simple_pin_fs+0x1c/0xac
    debugfs_remove+0x28/0x4c
    dpcm_be_disconnect+0x164/0x348
    dpcm_fe_dai_cleanup+0x68/0xac
    dpcm_fe_dai_close+0xbc/0x120
    snd_pcm_release_substream.part.14+0x3c/0x9c
    snd_pcm_release+0x9c/0xa8
    __fput+0x88/0x258
    task_work_run+0x8c/0xc8
    do_work_pending+0x534/0x63c
    slow_work_pending+0xc/0x20
    0xb6d68ac0


stack backtrace:
CPU: 3 PID: 1319 Comm: speaker-test Not tainted 
5.16.0-next-20220113-00001-g3967460dbcf4 #11212
Hardware name: Samsung Exynos (Flattened Device Tree)
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __lock_acquire+0x2fe4/0x3188
  __lock_acquire from lock_acquire+0x2a0/0x42c
  lock_acquire from _raw_spin_lock+0x38/0x48
  _raw_spin_lock from simple_pin_fs+0x1c/0xac
  simple_pin_fs from debugfs_remove+0x28/0x4c
  debugfs_remove from dpcm_be_disconnect+0x164/0x348
  dpcm_be_disconnect from dpcm_fe_dai_cleanup+0x68/0xac
  dpcm_fe_dai_cleanup from dpcm_fe_dai_close+0xbc/0x120
  dpcm_fe_dai_close from snd_pcm_release_substream.part.14+0x3c/0x9c
  snd_pcm_release_substream.part.14 from snd_pcm_release+0x9c/0xa8
  snd_pcm_release from __fput+0x88/0x258
  __fput from task_work_run+0x8c/0xc8
  task_work_run from do_work_pending+0x534/0x63c
  do_work_pending from slow_work_pending+0xc/0x20
Exception stack(0xc2fe3fb0 to 0xc2fe3ff8)
3fa0:                                     00000000 00495260 0048aa9c 
00000000
3fc0: 00495260 0049536c 00495210 00000006 0049b700 00486e8c 00476120 
befefcc4
3fe0: b6e86e64 befef928 b6dedda4 b6d68ac0 60000050 00000004
BUG: sleeping function called from invalid context at 
kernel/locking/rwsem.c:1513
in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 1319, name: 
speaker-test
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
INFO: lockdep is turned off.
irq event stamp: 8596
hardirqs last  enabled at (8595): [<c0b8b238>] 
_raw_spin_unlock_irq+0x20/0x50
hardirqs last disabled at (8596): [<c0b8af94>] _raw_spin_lock_irq+0x24/0x5c
softirqs last  enabled at (8392): [<c01016fc>] __do_softirq+0x4cc/0x5ec
softirqs last disabled at (8387): [<c012fe0c>] irq_exit+0x1cc/0x200
Preemption disabled at:
[<00000000>] 0x0
CPU: 3 PID: 1319 Comm: speaker-test Not tainted 
5.16.0-next-20220113-00001-g3967460dbcf4 #11212
Hardware name: Samsung Exynos (Flattened Device Tree)
  unwind_backtrace from show_stack+0x10/0x14
  show_stack from dump_stack_lvl+0x58/0x70
  dump_stack_lvl from __might_resched+0x248/0x298
  __might_resched from down_write+0x24/0x90
  down_write from simple_recursive_removal+0xb4/0x35c
  simple_recursive_removal from debugfs_remove+0x38/0x4c
  debugfs_remove from dpcm_be_disconnect+0x164/0x348
  dpcm_be_disconnect from dpcm_fe_dai_cleanup+0x68/0xac
  dpcm_fe_dai_cleanup from dpcm_fe_dai_close+0xbc/0x120
  dpcm_fe_dai_close from snd_pcm_release_substream.part.14+0x3c/0x9c
  snd_pcm_release_substream.part.14 from snd_pcm_release+0x9c/0xa8
  snd_pcm_release from __fput+0x88/0x258
  __fput from task_work_run+0x8c/0xc8
  task_work_run from do_work_pending+0x534/0x63c
  do_work_pending from slow_work_pending+0xc/0x20
Exception stack(0xc2fe3fb0 to 0xc2fe3ff8)
3fa0:                                     00000000 00495260 0048aa9c 
00000000
3fc0: 00495260 0049536c 00495210 00000006 0049b700 00486e8c 00476120 
befefcc4
3fe0: b6e86e64 befef928 b6dedda4 b6d68ac0 60000050 00000004


> ---
>   include/sound/pcm.h     | 15 +++++++++++++++
>   sound/core/pcm_native.c | 13 +++++++++++++
>   sound/soc/soc-pcm.c     |  6 +++---
>   3 files changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 9b187d86e1bd..36da42cd0774 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -617,6 +617,7 @@ void snd_pcm_stream_unlock(struct snd_pcm_substream *substream);
>   void snd_pcm_stream_lock_irq(struct snd_pcm_substream *substream);
>   void snd_pcm_stream_unlock_irq(struct snd_pcm_substream *substream);
>   unsigned long _snd_pcm_stream_lock_irqsave(struct snd_pcm_substream *substream);
> +unsigned long _snd_pcm_stream_lock_irqsave_nested(struct snd_pcm_substream *substream);
>   
>   /**
>    * snd_pcm_stream_lock_irqsave - Lock the PCM stream
> @@ -635,6 +636,20 @@ unsigned long _snd_pcm_stream_lock_irqsave(struct snd_pcm_substream *substream);
>   void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substream,
>   				      unsigned long flags);
>   
> +/**
> + * snd_pcm_stream_lock_irqsave_nested - Single-nested PCM stream locking
> + * @substream: PCM substream
> + * @flags: irq flags
> + *
> + * This locks the PCM stream like snd_pcm_stream_lock_irqsave() but with
> + * the single-depth lockdep subclass.
> + */
> +#define snd_pcm_stream_lock_irqsave_nested(substream, flags)		\
> +	do {								\
> +		typecheck(unsigned long, flags);			\
> +		flags = _snd_pcm_stream_lock_irqsave_nested(substream); \
> +	} while (0)
> +
>   /**
>    * snd_pcm_group_for_each_entry - iterate over the linked substreams
>    * @s: the iterator
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 621883e71194..a056b3ef3c84 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -172,6 +172,19 @@ unsigned long _snd_pcm_stream_lock_irqsave(struct snd_pcm_substream *substream)
>   }
>   EXPORT_SYMBOL_GPL(_snd_pcm_stream_lock_irqsave);
>   
> +unsigned long _snd_pcm_stream_lock_irqsave_nested(struct snd_pcm_substream *substream)
> +{
> +	unsigned long flags = 0;
> +	if (substream->pcm->nonatomic)
> +		mutex_lock_nested(&substream->self_group.mutex,
> +				  SINGLE_DEPTH_NESTING);
> +	else
> +		spin_lock_irqsave_nested(&substream->self_group.lock, flags,
> +					 SINGLE_DEPTH_NESTING);
> +	return flags;
> +}
> +EXPORT_SYMBOL_GPL(_snd_pcm_stream_lock_irqsave_nested);
> +
>   /**
>    * snd_pcm_stream_unlock_irqrestore - Unlock the PCM stream
>    * @substream: PCM substream
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 7abfc48b26ca..e8876e65c649 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -46,8 +46,8 @@ static inline void snd_soc_dpcm_stream_lock_irq(struct snd_soc_pcm_runtime *rtd,
>   	snd_pcm_stream_lock_irq(snd_soc_dpcm_get_substream(rtd, stream));
>   }
>   
> -#define snd_soc_dpcm_stream_lock_irqsave(rtd, stream, flags) \
> -	snd_pcm_stream_lock_irqsave(snd_soc_dpcm_get_substream(rtd, stream), flags)
> +#define snd_soc_dpcm_stream_lock_irqsave_nested(rtd, stream, flags) \
> +	snd_pcm_stream_lock_irqsave_nested(snd_soc_dpcm_get_substream(rtd, stream), flags)
>   
>   static inline void snd_soc_dpcm_stream_unlock_irq(struct snd_soc_pcm_runtime *rtd,
>   						  int stream)
> @@ -2094,7 +2094,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>   		be = dpcm->be;
>   		be_substream = snd_soc_dpcm_get_substream(be, stream);
>   
> -		snd_soc_dpcm_stream_lock_irqsave(be, stream, flags);
> +		snd_soc_dpcm_stream_lock_irqsave_nested(be, stream, flags);
>   
>   		/* is this op for this BE ? */
>   		if (!snd_soc_dpcm_be_can_update(fe, be, stream))

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

