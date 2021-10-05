Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5474227A4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 15:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93A68167D;
	Tue,  5 Oct 2021 15:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93A68167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633439959;
	bh=xHot8P2EAysF6jPI4ItnwpbcnqHU6rh3Hrf2FOmvXfI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NMQ2yZvcWEuYe5asDaB0KyfXFNly/43qDoc3rfDAe1z8JdNN8RvNri+NAyvSslJqp
	 s/EYoxWC5PLlLHZKcBy2gmtw+2GhQsnAprk3Ahqb82CQRLaaixI1LQfpgYWGquYzJ/
	 1P6Rsf+VUjq7mGDY52YPoK5VMfEZDhvPnIinfZV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53333F8010B;
	Tue,  5 Oct 2021 15:18:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E577F8027D; Tue,  5 Oct 2021 15:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A618AF8010B
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 15:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A618AF8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="248994036"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="248994036"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 06:17:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="523766323"
Received: from emccutch-mobl.amr.corp.intel.com (HELO [10.212.34.81])
 ([10.212.34.81])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 06:17:44 -0700
Subject: Re: [RFC PATCH v2 0/5] ASoC: soc-pcm: fix trigger race conditions
 with shared BE
To: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
 <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1efa1c31-7342-05f8-5f73-95e2462d4179@linux.intel.com>
Date: Tue, 5 Oct 2021 08:17:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 vkoul@kernel.org, broonie@kernel.org, Gyeongtaek Lee <gt82.lee@samsung.com>,
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


> I did a quick test of your patches on my Tegra board and seeing issues
> with multiple streams. For instance, I ran it for a 2x1 mixer
> configuration and hitting below:
> 
> [  277.661886] BUG: scheduling while atomic: aplay/1306/0x00000100
> [  287.713193] BUG: spinlock cpu recursion on CPU#0, aplay/1307
> [  287.719138]  lock: 0xffff00008cc820f0, .magic: dead4ead, .owner:
> aplay/1306, .owner_cpu: 0
> [  287.727319] CPU: 0 PID: 1307 Comm: aplay Tainted: G W        
> 5.15.0-rc3-next-20210927-00026-gffdabce987b1 #12
> [  287.737783] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> [  287.744228] Call trace:
> [  287.746656]  dump_backtrace+0x0/0x1c0
> [  287.750300]  show_stack+0x18/0x28
> [  287.753604]  dump_stack_lvl+0x7c/0xa8
> [  287.757236]  dump_stack+0x18/0x34
> [  287.760536]  spin_dump+0x70/0x90
> [  287.763732]  do_raw_spin_lock+0xd8/0x120
> [  287.767615]  _raw_spin_lock_irq+0x60/0x80
> [  287.771581]  snd_pcm_stream_lock_irq+0x20/0x48 [snd_pcm]
> [  287.776853]  snd_pcm_drain+0x1ec/0x348 [snd_pcm]
> [  287.781421]  snd_pcm_common_ioctl+0xacc/0x1938 [snd_pcm]
> [  287.786685]  snd_pcm_ioctl+0x2c/0x48 [snd_pcm]
> [  287.791101]  __arm64_sys_ioctl+0xb0/0xf0
> [  287.794982]  invoke_syscall+0x44/0x108
> [  287.798683]  el0_svc_common.constprop.3+0x74/0x100
> [  287.803416]  do_el0_svc+0x24/0x90
> [  287.806687]  el0_svc+0x20/0x60
> [  287.809705]  el0t_64_sync_handler+0x94/0xb8
> [  287.813839]  el0t_64_sync+0x180/0x184
> 
> 
> And in some case just below:
> 
> [ 1074.212276] BUG: scheduling while atomic: aplay/12327/0x00000100
> [ 1095.227509] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 1095.233443] rcu:     0-...0: (1 GPs behind)
> idle=4af/1/0x4000000000000004 softirq=19902/19902 fqs=2626
> [ 1095.242528] rcu:     2-...0: (1 GPs behind)
> idle=9d5/1/0x4000000000000000 softirq=22707/22707 fqs=262

Thanks Sameer for the overnight tests, much appreciated.

My patches don't change anything related to a spinlock or pcm stream
management, so not sure what could cause this rather spectacular
failure. That hints at a fundamental configuration difference, possibly
caused by your component chaining?

Since in your case you have a 1:1 mapping between FE and BE, would you
mind testing by backtracking, one patch at a time to see which one of
the three last patches could cause a problem on your board?

Thanks again for your time!
-Pierre

