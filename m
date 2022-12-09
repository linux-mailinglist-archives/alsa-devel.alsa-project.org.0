Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CE7648179
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 12:17:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A56C2132;
	Fri,  9 Dec 2022 12:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A56C2132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670584666;
	bh=wSXkakgGYe8yiJbrRpEHGjiOqNToaxvZoVpQZkfXars=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ESeJomUYKXegsIT42RjLvyzEBzljL/HSOGB3nphwzSlGAO9UW/bXZf3MdzjiHEf/A
	 pYCFLAAg0JueNpvqWK5JwVeDlVBQaiB91YpeDXELdHps+6o2AjmZkFf+ZDDjQ471QF
	 WCCCIDkC352a/96PzqazbrpjVlN0fCHhY6qFH6Dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD50DF800F8;
	Fri,  9 Dec 2022 12:16:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 446EFF8022D; Fri,  9 Dec 2022 12:16:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F96BF80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 12:16:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F96BF80007
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VpfH8//R
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B94pTC1003426; Fri, 9 Dec 2022 05:16:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=9atow78hvykn5Vc3eFPeIJmOcg6TT3MeuElSx9jZL9Y=;
 b=VpfH8//R6XBbHi9Y8tCgtCV8D0VLsXUP54Wa6q9iRimlIkqP11GbAe4zfZV5gah+Y2Mx
 knTIJldUtikSm5YzkPgz1K384fH1dC08FXqI6i5eFK74aJmGGjhZVMDF1zi2y09ZL29p
 2KHMKPWTjNo/JucvIOa0C5CTwur4jts2BwQtBsphzLoNYIpxkqQNEEr9r2UpU+KPK1JC
 SKq8CDcsyJ6y10i4T67wAWFbyK57xC7McdyFe3vXN8gI47j07X8u1xA1E+PIJ3zB1t6E
 iUQxcj8VtMVZ2fo3DYgcJsi4Ui4TMOJnlcCE28vj4gaADTlZO8j43jNm+l2Xc36XaYeK aQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3m84r6pvxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 05:16:42 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 9 Dec
 2022 05:16:40 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 9 Dec 2022 05:16:40 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5642DB0E;
 Fri,  9 Dec 2022 11:16:40 +0000 (UTC)
Date: Fri, 9 Dec 2022 11:16:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ASoC: wm8994: Fix potential deadlock
Message-ID: <20221209111640.GK105268@ediswmail.ad.cirrus.com>
References: <CGME20221209091928eucas1p1cfc768d888a6e6c57fcaa0fe320cfced@eucas1p1.samsung.com>
 <20221209091657.1183-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221209091657.1183-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: JW0C1SuHOfp6VrXwOhVOR80GLDfafi4b
X-Proofpoint-GUID: JW0C1SuHOfp6VrXwOhVOR80GLDfafi4b
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 09, 2022 at 10:16:57AM +0100, Marek Szyprowski wrote:
> Commit c0feea594e05 ("workqueue: don't skip lockdep work dependency in
> cancel_work_sync()") revealed the following locking issue in the wm8994
> codec:
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.0.0-rc1-00001-gc0feea594e05-dirty #13097 Not tainted
> ------------------------------------------------------
> kworker/1:1/32 is trying to acquire lock:
> c2bd4300 (&wm8994->accdet_lock){+.+.}-{3:3}, at: wm1811_mic_work+0x38/0xdc
> 
> but task is already holding lock:
> f08f5f28 ((work_completion)(&(&wm8994->mic_work)->work)){+.+.}-{0:0}, at: process_one_work+0x1e4/0x778
> 
> which lock already depends on the new lock.
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #1 ((work_completion)(&(&wm8994->mic_work)->work)){+.+.}-{0:0}:
>        __cancel_work_timer+0x198/0x22c
>        wm1811_jackdet_irq+0x124/0x238
>        process_one_work+0x288/0x778
>        worker_thread+0x44/0x504
>        kthread+0xf0/0x124
>        ret_from_fork+0x14/0x2c
>        0x0
> 
> -> #0 (&wm8994->accdet_lock){+.+.}-{3:3}:
>        lock_acquire+0x124/0x3e4
>        __mutex_lock+0x90/0x948
>        mutex_lock_nested+0x1c/0x24
>        wm1811_mic_work+0x38/0xdc
>        process_one_work+0x288/0x778
>        worker_thread+0x44/0x504
>        kthread+0xf0/0x124
>        ret_from_fork+0x14/0x2c
>        0x0
> 
> other info that might help us debug this:
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock((work_completion)(&(&wm8994->mic_work)->work));
>                                lock(&wm8994->accdet_lock);
>                                lock((work_completion)(&(&wm8994->mic_work)->work));
>   lock(&wm8994->accdet_lock);
> 
>  *** DEADLOCK ***
> 
> 2 locks held by kworker/1:1/32:
>  #0: c1c072a8 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_one_work+0x1e4/0x778
>  #1: f08f5f28 ((work_completion)(&(&wm8994->mic_work)->work)){+.+.}-{0:0}, at: process_one_work+0x1e4/0x778
> 
> stack backtrace:
> CPU: 1 PID: 32 Comm: kworker/1:1 Not tainted 6.0.0-rc1-00001-gc0feea594e05-dirty #13097
> Hardware name: Samsung Exynos (Flattened Device Tree)
> Workqueue: events_power_efficient wm1811_mic_work
>  unwind_backtrace from show_stack+0x10/0x14
>  show_stack from dump_stack_lvl+0x58/0x70
>  dump_stack_lvl from check_noncircular+0xf0/0x158
>  check_noncircular from __lock_acquire+0x15e8/0x2a7c
>  __lock_acquire from lock_acquire+0x124/0x3e4
>  lock_acquire from __mutex_lock+0x90/0x948
>  __mutex_lock from mutex_lock_nested+0x1c/0x24
>  mutex_lock_nested from wm1811_mic_work+0x38/0xdc
>  wm1811_mic_work from process_one_work+0x288/0x778
>  process_one_work from worker_thread+0x44/0x504
>  worker_thread from kthread+0xf0/0x124
>  kthread from ret_from_fork+0x14/0x2c
> Exception stack(0xf08f5fb0 to 0xf08f5ff8)
> ...
> --->8---
> 
> Fix this by dropping wm8994->accdet_lock while calling
> cancel_delayed_work_sync(&wm8994->mic_work) in wm1811_jackdet_irq().
> 
> Fixes: c0cc3f166525 ("ASoC: wm8994: Allow a delay between jack insertion and microphone detect")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
