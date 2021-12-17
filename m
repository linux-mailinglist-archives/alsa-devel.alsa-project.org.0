Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55E478AC0
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 13:02:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2CA2847;
	Fri, 17 Dec 2021 13:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2CA2847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639742552;
	bh=pb+XjonEHKjgm9U7dOqLODd8dkU+f3FBjmAlL/lAN94=;
	h=Date:Subject:From:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fSkZHfD+dIVPEWKeCtHeO5jj2cWUj59SIsQcFXyKmleNxL22LTrKWz7mlRvP85gmi
	 E0exQ+kR6g0/RXwRcXzIDEPUgCBmA5X45dAD7OX2ygmTsOX85ciKF91vj4+ihsVwPS
	 zz7otcetiD3XUlENmCdrZiHMdopvURsN0zkQ1Xbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41D81F80568;
	Fri, 17 Dec 2021 12:57:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC68EF80564; Fri, 17 Dec 2021 12:57:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 229CEF80564
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 12:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 229CEF80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="sYDcWSP8"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211217115745euoutp02d3c73705d6c86f180c03e1004573a113~BiOcWsWDX2919329193euoutp02k
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 11:57:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211217115745euoutp02d3c73705d6c86f180c03e1004573a113~BiOcWsWDX2919329193euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1639742265;
 bh=3flGcue8yQlSWFbdPjV3HW/NQbAgnVPzim2zrj2GJss=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=sYDcWSP8t/zaNzM7J16WggrtpJ21iuNPWlU92wphXql3oe+jHtLBbz6+D4dJ1DRkW
 389el7UblcK/2MRG8gnsKIT432Rclsb3TkPeQED8boVsQHahcim+sAB+aknZhkPwQR
 4HVlFl5ufbXCE5svWg24jAcRonOpevoQSD+osQmI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211217115744eucas1p1e5ae04360c6a0fa5e1afc16688a61687~BiObM7XeP3220932209eucas1p19;
 Fri, 17 Dec 2021 11:57:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EC.32.10260.83B7CB16; Fri, 17
 Dec 2021 11:57:44 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211217115743eucas1p10e721164cd845176f9dc5c4c2ad86838~BiOahoFWn0622806228eucas1p1b;
 Fri, 17 Dec 2021 11:57:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211217115743eusmtrp256c283f037189c963dbaba5ef4a4edce~BiOagnhlG2810628106eusmtrp2a;
 Fri, 17 Dec 2021 11:57:43 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-34-61bc7b386426
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 68.1F.09522.73B7CB16; Fri, 17
 Dec 2021 11:57:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211217115742eusmtip2046e9ef2fb651de062f0fd6f67bd7c48~BiOZY8LEF1330513305eusmtip2T;
 Fri, 17 Dec 2021 11:57:42 +0000 (GMT)
Message-ID: <17b6b4fc-ecbe-1b36-5843-d9394baaf669@samsung.com>
Date: Fri, 17 Dec 2021 12:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH 4/6] ASoC: soc-pcm: serialize BE triggers
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <660cd57a-d445-63ba-b0bf-6bf6168ffee0@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMKsWRmVeSWpSXmKPExsWy7djP87oW1XsSDR5NYLO4cvEQk8XUh0/Y
 LOZ9Sbe4cuctu8X58xvYLV4d3sVo8e1KB5PF5V1z2CxmnN/HZNG5q5/V4shzJYtf/58xWdxd
 95fF4vCbdlaLjjtqFhu+r2W0eLn5DZPFzjsnmC22/KpxEPbY8LmJzWPnrLvsHptWdbJ5zDsZ
 6NHb/I7NY9/bZWwe385MZPHo27KK0WP9lqssHptPV3t83iQXwB3FZZOSmpNZllqkb5fAlTHz
 3hGWgiW5FVsutbM2MP6J62Lk5JAQMJF4dOovaxcjF4eQwApGibYFd5ggnC+MEmt6+9ghnM+M
 EksermOEaemf2APVspxR4lPvBUYI5yOjxKzHF1lBqngF7CQuvJ4M1sEioCqxsO8qG0RcUOLk
 zCcsILaoQJJEa8cfJhBbWMBWYvaWjWC9zALiEreezAeLswkYSnS97QLrFRGIk1j+5TzYScwC
 s1kl5ly7CLSAg4NTwF5ixzQhiF55ieats5lBaiQE7nFKdJxfygZxtovEuiuXoWxhiVfHt7BD
 2DIS/3fOZ4JoaGaUeHhuLTuE08MocblpBtTT1hJ3zv1iA9nGLKApsX6XPkTYUaLrewMrSFhC
 gE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSahRQss5C8PwvJO7MQ9i5g
 ZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmC5P/zv+dQfjilcf9Q4xMnEwHmKU4GBW
 EuFVXL47UYg3JbGyKrUoP76oNCe1+BCjNAeLkjhvcuaGRCGB9MSS1OzU1ILUIpgsEwenVAOT
 eJeqhqLoVHUthoxNq6fuDDln2Si8VO/v3/r9Jeuv+t6duOHP+9XvVRYd+dJTvEJEtTh2696n
 9oE8wXs7C3km+Fd4yCw33akkV+BTcF92deyPLh9Rg7N3iyrtyhicjt31ERG53mYRz+nbKMr9
 oPFNO9sJ2aafxc8fmjRfYZ1689GDDS1inH1ip++qHowIZbgiubj4lcfl+P3eW/NM4wQmf7yu
 rvCvs3rOI5bFCvVCRi3f+uxuKm5e/WrD96XiQa9+CSx5XCH6p+nYrKb7+acivyt+0W/N/V/2
 d6XJQqU72T1GpXOqZTwO+URuWMhtOOGeqMkk6XietyUOG1a+UtxYVa0wX0gxoyHg955/1U+V
 WIozEg21mIuKEwF5gMVfBgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42I5/e/4PV3z6j2JBse3ClpcuXiIyWLqwyds
 FvO+pFtcufOW3eL8+Q3sFq8O72K0+Halg8ni8q45bBYzzu9jsujc1c9qceS5ksWv/8+YLO6u
 +8ticfhNO6tFxx01iw3f1zJavNz8hsli550TzBZbftU4CHts+NzE5rFz1l12j02rOtk85p0M
 9Ohtfsfmse/tMjaPb2cmsnj0bVnF6LF+y1UWj82nqz0+b5IL4I7SsynKLy1JVcjILy6xVYo2
 tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy5h57whLwZLcii2X2lkbGP/EdTFy
 ckgImEj0T+xh7WLk4hASWMooMWfpZRaIhIzEyWkNrBC2sMSfa11sEEXvGSUunuoBK+IVsJO4
 8HoyI4jNIqAqsbDvKhtEXFDi5MwnYDWiAkkSu9dtBYsLC9hKzN6yEWwos4C4xK0n85lAbDYB
 Q4mut11gNSICcRK7Fx5iAVnGLDCXVaLv4W1miM37GCU2tRxk72Lk4OAUsJfYMU0IYpCZRNfW
 LkYIW16ieets5gmMQrOQ3DELyb5ZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cT
 IzA9bDv2c/MOxnmvPuodYmTiYDzEKMHBrCTCq7h8d6IQb0piZVVqUX58UWlOavEhRlNgYExk
 lhJNzgcmqLySeEMzA1NDEzNLA1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqZCaUGb
 P3kr2uLF57z+mHj64CUVTZ3+5mafon/sqekJd9dNUxeyWb/Swlv1bN2zLRde8/NOvBd93Pu0
 ccCKRu0LkyuK5p5zPD8/x+gi99YQxv2bN0/U6D0xOyZ0Zw3DHlfOq5ufrI5v6z2ZrOJaudRy
 o92p+Q/ebOd6/+1x1GkJfr+Tu55cZLH3Pmt37Uj99+f2kr0dQctVPrGyFaa+22X0JLRWvyp6
 o9CHtU90nW4bcq540J1nwR4qu6pSakWBm6DWwQieN+H1+veOzMtcJNR8XiG670ew0+tN01+F
 P719g93Sukn+UZ2rf9DVqxfeT905XddKuf5CUtFfSxameTcbV19eayO9/lrVvhUKPN5KLMUZ
 iYZazEXFiQB2R/3omAMAAA==
X-CMS-MailID: 20211217115743eucas1p10e721164cd845176f9dc5c4c2ad86838
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211217115743eucas1p10e721164cd845176f9dc5c4c2ad86838
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211217115743eucas1p10e721164cd845176f9dc5c4c2ad86838
References: <20211207173745.15850-1-pierre-louis.bossart@linux.intel.com>
 <20211207173745.15850-5-pierre-louis.bossart@linux.intel.com>
 <660cd57a-d445-63ba-b0bf-6bf6168ffee0@samsung.com>
 <CGME20211217115743eucas1p10e721164cd845176f9dc5c4c2ad86838@eucas1p1.samsung.com>
Cc: 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

Dear All,

On 17.12.2021 11:11, Marek Szyprowski wrote:
> On 07.12.2021 18:37, Pierre-Louis Bossart wrote:
>> From: Takashi Iwai <tiwai@suse.de>
>>
>> When more than one FE is connected to a BE, e.g. in a mixing use case,
>> the BE can be triggered multiple times when the FE are opened/started
>> concurrently. This race condition is problematic in the case of
>> SoundWire BE dailinks, and this is not desirable in a general
>> case.
>>
>> This patch relies on the existing BE PCM lock, which takes atomicity 
>> into
>> account. The locking model assumes that all interactions start with
>> the FE, so that there is no deadlock between FE and BE locks.
>>
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> [test, checkpatch fix and clarification of commit message by plbossart]
>> Signed-off-by: Pierre-Louis Bossart 
>> <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>
> This patch recently landed in linux-next (next-20211215) as commit 
> b2ae80663008 ("ASoC: soc-pcm: serialize BE triggers").

It turned out that the issue is caused by the previous patch "[PATCH 
3/6] ASoC: soc-pcm: Fix and cleanup DPCM locking 
<https://lore.kernel.org/all/20211207173745.15850-4-pierre-louis.bossart@linux.intel.com/#r>", 
merged as commit b7898396f4bb ("ASoC: soc-pcm: Fix and cleanup DPCM 
locking"), for some reasons 'git bisect' pointed me initially to the 
wrong patch. I will re-report it under the proper patch. Reverting it 
and the next patches on top of linux-next fixes the issue.


> I found that it triggers a warning on my test boards. This is the one 
> from Exynos4412-based Odroid U3 board:
>
> # speaker-test -l1
>
> speaker-test 1.1.8
>
> Playback device is default
> Stream parameters are 48000Hz, S16_LE, 1 channels
> Using 16 octaves of pink noise
> Rate set to 48000Hz (requested 48000Hz)
> Buffer size range from 128 to 131072
> Period size range from 64 to 65536
> Using max buffer size 131072
> Periods = 4
> was set period_size = 32768
> was set buffer_size = 131072
>  0 - Front Left
>
> ============================================
> WARNING: possible recursive locking detected
> 5.16.0-rc1-00270-gb2ae80663008 #11109 Not tainted
> --------------------------------------------
> speaker-test/1312 is trying to acquire lock:
> c1d78ca4 (&group->lock){....}-{2:2}, at: dpcm_be_dai_trigger+0x80/0x300
>
> but task is already holding lock:
> c1d788a4 (&group->lock){....}-{2:2}, at: 
> snd_pcm_action_lock_irq+0x68/0x7c
>
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>
>        CPU0
>        ----
>   lock(&group->lock);
>   lock(&group->lock);
>
>  *** DEADLOCK ***
>
>  May be due to missing lock nesting notation
>
> 1 lock held by speaker-test/1312:
>  #0: c1d788a4 (&group->lock){....}-{2:2}, at: 
> snd_pcm_action_lock_irq+0x68/0x7c
>
> stack backtrace:
> CPU: 0 PID: 1312 Comm: speaker-test Not tainted 
> 5.16.0-rc1-00270-gb2ae80663008 #11109
> Hardware name: Samsung Exynos (Flattened Device Tree)
> [<c0110b30>] (unwind_backtrace) from [<c010c618>] (show_stack+0x10/0x14)
> [<c010c618>] (show_stack) from [<c0b65d24>] (dump_stack_lvl+0x58/0x70)
> [<c0b65d24>] (dump_stack_lvl) from [<c0193740>] 
> (__lock_acquire+0x15ac/0x319c)
> [<c0193740>] (__lock_acquire) from [<c0195dd8>] 
> (lock_acquire+0x14c/0x424)
> [<c0195dd8>] (lock_acquire) from [<c0b745b8>] 
> (_raw_spin_lock_irqsave+0x44/0x60)
> [<c0b745b8>] (_raw_spin_lock_irqsave) from [<c0926b6c>] 
> (dpcm_be_dai_trigger+0x80/0x300)
> [<c0926b6c>] (dpcm_be_dai_trigger) from [<c0927004>] 
> (dpcm_fe_dai_do_trigger+0x124/0x1e4)
> [<c0927004>] (dpcm_fe_dai_do_trigger) from [<c090728c>] 
> (snd_pcm_action+0x74/0xb0)
> [<c090728c>] (snd_pcm_action) from [<c0907eac>] 
> (snd_pcm_action_lock_irq+0x3c/0x7c)
> [<c0907eac>] (snd_pcm_action_lock_irq) from [<c02f13a0>] 
> (sys_ioctl+0x568/0xd44)
> [<c02f13a0>] (sys_ioctl) from [<c0100060>] (ret_fast_syscall+0x0/0x1c)
> Exception stack(0xc4777fa8 to 0xc4777ff0)
> 7fa0:                   004f5210 b6e27394 00000004 00004142 004f5398 
> 004f5398
> 7fc0: 004f5210 b6e27394 00020000 00000036 00000000 00000000 bee588e8 
> 00008000
> 7fe0: b6e277c4 bee58874 b6d8e888 b6c751dc
> Time per period = 0.253397
> max98090 1-0010: PLL unlocked
> BUG: sleeping function called from invalid context at 
> kernel/locking/rwsem.c:1526
> in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 1312, name: 
> speaker-test
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> INFO: lockdep is turned off.
> irq event stamp: 8158
> hardirqs last  enabled at (8157): [<c0b747d0>] 
> _raw_spin_unlock_irqrestore+0x5c/0x60
> hardirqs last disabled at (8158): [<c0b74570>] 
> _raw_spin_lock_irq+0x58/0x5c
> softirqs last  enabled at (7854): [<c0101578>] __do_softirq+0x348/0x610
> softirqs last disabled at (7849): [<c012e7a4>] __irq_exit_rcu+0x144/0x1ec
> Preemption disabled at:
> [<00000000>] 0x0
> CPU: 0 PID: 1312 Comm: speaker-test Not tainted 
> 5.16.0-rc1-00270-gb2ae80663008 #11109
> Hardware name: Samsung Exynos (Flattened Device Tree)
> [<c0110b30>] (unwind_backtrace) from [<c010c618>] (show_stack+0x10/0x14)
> [<c010c618>] (show_stack) from [<c0b65d24>] (dump_stack_lvl+0x58/0x70)
> [<c0b65d24>] (dump_stack_lvl) from [<c0158b04>] 
> (__might_resched+0x1c0/0x288)
> [<c0158b04>] (__might_resched) from [<c0b71898>] (down_write+0x24/0x8c)
> [<c0b71898>] (down_write) from [<c030ed64>] 
> (simple_recursive_removal+0x6c/0x370)
> [<c030ed64>] (simple_recursive_removal) from [<c04d07a4>] 
> (debugfs_remove+0x38/0x4c)
> [<c04d07a4>] (debugfs_remove) from [<c0928784>] 
> (dpcm_be_disconnect+0x160/0x2c4)
> [<c0928784>] (dpcm_be_disconnect) from [<c092895c>] 
> (dpcm_fe_dai_cleanup+0x74/0xb0)
> [<c092895c>] (dpcm_fe_dai_cleanup) from [<c0928d90>] 
> (dpcm_fe_dai_close+0xe8/0x14c)
> [<c0928d90>] (dpcm_fe_dai_close) from [<c090977c>] 
> (snd_pcm_release_substream.part.0+0x3c/0xcc)
> [<c090977c>] (snd_pcm_release_substream.part.0) from [<c0909878>] 
> (snd_pcm_release+0x54/0xa4)
> [<c0909878>] (snd_pcm_release) from [<c02dc400>] (__fput+0x88/0x258)
> [<c02dc400>] (__fput) from [<c014cd44>] (task_work_run+0x8c/0xc8)
> [<c014cd44>] (task_work_run) from [<c010c08c>] 
> (do_work_pending+0x4a4/0x598)
> [<c010c08c>] (do_work_pending) from [<c0100088>] 
> (slow_work_pending+0xc/0x20)
> Exception stack(0xc4777fb0 to 0xc4777ff8)
> 7fa0:                                     00000000 004f5260 004eaa9c 
> 00000000
> 7fc0: 004f5260 004f536c 004f5210 00000006 004fb700 004e6e8c 004d6120 
> bee58cc4
> 7fe0: b6e27e64 bee58928 b6d8eda4 b6d09ac0 60000050 00000004
>
> Let me know how I can help debugging this issue.
>
>> ---
>>   sound/soc/soc-pcm.c | 46 ++++++++++++++++++++++++++++-----------------
>>   1 file changed, 29 insertions(+), 17 deletions(-)
>>
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index 2e282c42bac2..7043857e30b1 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -46,12 +46,18 @@ static inline void 
>> snd_soc_dpcm_stream_lock_irq(struct snd_soc_pcm_runtime *rtd,
>>       snd_pcm_stream_lock_irq(snd_soc_dpcm_get_substream(rtd, stream));
>>   }
>>   +#define snd_soc_dpcm_stream_lock_irqsave(rtd, stream, flags) \
>> +    snd_pcm_stream_lock_irqsave(snd_soc_dpcm_get_substream(rtd, 
>> stream), flags)
>> +
>>   static inline void snd_soc_dpcm_stream_unlock_irq(struct 
>> snd_soc_pcm_runtime *rtd,
>>                             int stream)
>>   {
>>       snd_pcm_stream_unlock_irq(snd_soc_dpcm_get_substream(rtd, 
>> stream));
>>   }
>>   +#define snd_soc_dpcm_stream_unlock_irqrestore(rtd, stream, flags) \
>> + snd_pcm_stream_unlock_irqrestore(snd_soc_dpcm_get_substream(rtd, 
>> stream), flags)
>> +
>>   #define DPCM_MAX_BE_USERS    8
>>     static inline const char *soc_cpu_dai_name(struct 
>> snd_soc_pcm_runtime *rtd)
>> @@ -2079,6 +2085,7 @@ int dpcm_be_dai_trigger(struct 
>> snd_soc_pcm_runtime *fe, int stream,
>>   {
>>       struct snd_soc_pcm_runtime *be;
>>       struct snd_soc_dpcm *dpcm;
>> +    unsigned long flags;
>>       int ret = 0;
>>         for_each_dpcm_be(fe, stream, dpcm) {
>> @@ -2087,9 +2094,11 @@ int dpcm_be_dai_trigger(struct 
>> snd_soc_pcm_runtime *fe, int stream,
>>           be = dpcm->be;
>>           be_substream = snd_soc_dpcm_get_substream(be, stream);
>>   +        snd_soc_dpcm_stream_lock_irqsave(be, stream, flags);
>> +
>>           /* is this op for this BE ? */
>>           if (!snd_soc_dpcm_be_can_update(fe, be, stream))
>> -            continue;
>> +            goto next;
>>             dev_dbg(be->dev, "ASoC: trigger BE %s cmd %d\n",
>>               be->dai_link->name, cmd);
>> @@ -2099,77 +2108,80 @@ int dpcm_be_dai_trigger(struct 
>> snd_soc_pcm_runtime *fe, int stream,
>>               if ((be->dpcm[stream].state != 
>> SND_SOC_DPCM_STATE_PREPARE) &&
>>                   (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
>>                   (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
>> -                continue;
>> +                goto next;
>>                 ret = soc_pcm_trigger(be_substream, cmd);
>>               if (ret)
>> -                goto end;
>> +                goto next;
>>                 be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
>>               break;
>>           case SNDRV_PCM_TRIGGER_RESUME:
>>               if ((be->dpcm[stream].state != 
>> SND_SOC_DPCM_STATE_SUSPEND))
>> -                continue;
>> +                goto next;
>>                 ret = soc_pcm_trigger(be_substream, cmd);
>>               if (ret)
>> -                goto end;
>> +                goto next;
>>                 be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
>>               break;
>>           case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>               if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
>> -                continue;
>> +                goto next;
>>                 ret = soc_pcm_trigger(be_substream, cmd);
>>               if (ret)
>> -                goto end;
>> +                goto next;
>>                 be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
>>               break;
>>           case SNDRV_PCM_TRIGGER_STOP:
>>               if ((be->dpcm[stream].state != 
>> SND_SOC_DPCM_STATE_START) &&
>>                   (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
>> -                continue;
>> +                goto next;
>>                 if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
>> -                continue;
>> +                goto next;
>>                 ret = soc_pcm_trigger(be_substream, cmd);
>>               if (ret)
>> -                goto end;
>> +                goto next;
>>                 be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
>>               break;
>>           case SNDRV_PCM_TRIGGER_SUSPEND:
>>               if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
>> -                continue;
>> +                goto next;
>>                 if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
>> -                continue;
>> +                goto next;
>>                 ret = soc_pcm_trigger(be_substream, cmd);
>>               if (ret)
>> -                goto end;
>> +                goto next;
>>                 be->dpcm[stream].state = SND_SOC_DPCM_STATE_SUSPEND;
>>               break;
>>           case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>               if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
>> -                continue;
>> +                goto next;
>>                 if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
>> -                continue;
>> +                goto next;
>>                 ret = soc_pcm_trigger(be_substream, cmd);
>>               if (ret)
>> -                goto end;
>> +                goto next;
>>                 be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
>>               break;
>>           }
>> +next:
>> +        snd_soc_dpcm_stream_unlock_irqrestore(be, stream, flags);
>> +        if (ret)
>> +            break;
>>       }
>> -end:
>>       if (ret < 0)
>>           dev_err(fe->dev, "ASoC: %s() failed at %s (%d)\n",
>>               __func__, be->dai_link->name, ret);
>
> Best regards

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

