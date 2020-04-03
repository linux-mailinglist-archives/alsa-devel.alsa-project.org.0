Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472A19D18C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 09:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ADA11687;
	Fri,  3 Apr 2020 09:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ADA11687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585900633;
	bh=e3d38Be7yW4YwP7tNETUuw8KxLxNPEi5GdAjuTUE8vY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2SNqa2+lcenF9YsunTIvC0VIduhv7YNoMK17VMHUYMffJgQptZKXMPDV1yllYvju
	 N9trlks9WtiQ5eCzea3JUKqB9cFcwmsWlk1LBPqZBlw9FsOTt4zUdyOgLYMBQCk/nB
	 +tb9Zgt1e2yWdxLCDAJLYLRDEIAVrwtSAB/+hHno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4155F8014B;
	Fri,  3 Apr 2020 09:55:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8430F8014C; Fri,  3 Apr 2020 09:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BA7BF800C2
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 09:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BA7BF800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rsy+eMQE"
Received: from localhost (unknown [49.207.63.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97C252073B;
 Fri,  3 Apr 2020 07:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585900523;
 bh=e3d38Be7yW4YwP7tNETUuw8KxLxNPEi5GdAjuTUE8vY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsy+eMQEVKanJXHwigj0QrSCR/4WPBIFwaz1Fpfab4eORlvIzXaJA1xr8Pa14TGSX
 WHPNiRxRReeP/Zi2ZVSBfV9V0xAjA9KLfSiiXPrhhvB5lmpZ2TbNl/vsVDcOeGSBWA
 ofV/t78h7N3jYRD83KZQwqSe+Bxsa58MvjZpg1sI=
Date: Fri, 3 Apr 2020 13:25:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?B?7J206rK97YOd?= <gt82.lee@samsung.com>
Subject: Re: [PATCH 1/1] ASoC: soc-compress: lock pcm_mutex to resolve
 lockdep error
Message-ID: <20200403075519.GQ72691@vkoul-mobl>
References: <CGME20200330110126epcas2p4525e5c6f61f7452df008696f9153770d@epcas2p4.samsung.com>
 <002101d60682$8ec21ed0$ac465c70$@samsung.com>
 <20200330114716.GA72691@vkoul-mobl>
 <00a501d606ff$5ec4ef00$1c4ecd00$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00a501d606ff$5ec4ef00$1c4ecd00$@samsung.com>
Cc: pilsun.jang@samsung.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
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

On 31-03-20, 10:54, 이경택 wrote:
> Hi,
> 
> On 30-03-20, 17:17, Vinod Koul wrote:
> >Hello,
> >
> >On 30-03-20, 20:01,  ̰    wrote:
> >> snd_soc_runtime_activate() and snd_soc_runtime_deactivate() require 
> >> locked pcm_mutex.
> >> 
> >> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
> >> ---
> >>  sound/soc/soc-compress.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >> 
> >> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c index 
> >> 392a1c5b15d3..42d416ac7e9b 100644
> >> --- a/sound/soc/soc-compress.c
> >> +++ b/sound/soc/soc-compress.c
> >> @@ -207,7 +207,9 @@ static int soc_compr_open_fe(struct 
> >> snd_compr_stream
> >> *cstream)
> >>  	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
> >>  	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
> >>  
> >> +	mutex_lock_nested(&fe->pcm_mutex, fe->pcm_subclass);
> >>  	snd_soc_runtime_activate(fe, stream);
> >> +	mutex_unlock(&fe->pcm_mutex);
> >
> >Can you please explain why you need the lock here, as
> >>  
> >>  	mutex_unlock(&fe->card->mutex);
> >
> >we already have a lock here..
> >
> >> @@ -285,7 +287,9 @@ static int soc_compr_free_fe(struct 
> >> snd_compr_stream
> >> *cstream)
> >>  	else
> >>  		stream = SNDRV_PCM_STREAM_CAPTURE;
> >>  
> >> +	mutex_lock_nested(&fe->pcm_mutex, fe->pcm_subclass);
> >>  	snd_soc_runtime_deactivate(fe, stream);
> >> +	mutex_unlock(&fe->pcm_mutex);
> >
> >And this instance is also using fe->card->mutex.. so I think double lock may not serve any purpose here..
> >
> >Can you explain why we need the extra lock?
> You are right.
> The mutex_lock with fe->pcm_mutex has no purpose.

Okay

> It just removes lockdep warning like the below
> <4>[ 1437.857354]  [5:          cplay:11547] ------------[ cut here ]------------
> <4>[ 1437.857463]  [5:          cplay:11547] WARNING: CPU: 5 PID: 11547 at sound/soc/soc-pcm.c:99 snd_soc_runtime_deactivate+0x88/0x140
> <4>[ 1437.857498]  [5:          cplay:11547] Modules linked in:
> <4>[ 1437.857557]  [5:          cplay:11547] CPU: 5 PID: 11547 Comm: cplay Tainted: G S      W         4.19.65-00198-ge6c3a8b64f3d-dirty #146
> <4>[ 1437.857590]  [5:          cplay:11547] Hardware name: Samsung xxx board based on xxx (DT)
> <4>[ 1437.857620]  [5:          cplay:11547] Call trace:
> <4>[ 1437.857662]  [5:          cplay:11547] [<ffffff800808d598>] dump_backtrace+0x0/0x404
> <4>[ 1437.857704]  [5:          cplay:11547] [<ffffff800808d9b0>] show_stack+0x14/0x1c
> <4>[ 1437.857745]  [5:          cplay:11547] [<ffffff8008c5dc24>] dump_stack+0xa0/0xd8
> <4>[ 1437.857784]  [5:          cplay:11547] [<ffffff80080a4b28>] __warn+0xcc/0x12c
> <4>[ 1437.857821]  [5:          cplay:11547] [<ffffff8008c5cd78>] report_bug+0x78/0xcc
> <4>[ 1437.857857]  [5:          cplay:11547] [<ffffff800808e5c0>] bug_handler+0x2c/0x88
> <4>[ 1437.857895]  [5:          cplay:11547] [<ffffff8008085510>] brk_handler+0x88/0xc8
> <4>[ 1437.857930]  [5:          cplay:11547] [<ffffff8008080f0c>] do_debug_exception+0x108/0x194
> <4>[ 1437.857968]  [5:          cplay:11547] Exception stack(0xffffff8028b0b960 to 0xffffff8028b0baa0)
> <4>[ 1437.858002]  [5:          cplay:11547] b960: 0000000000000024 ffffff8008e28a97 ffffffc975bb40a0 ffffff8028b0b748
> <4>[ 1437.858035]  [5:          cplay:11547] b980: 0000000000000080 0000000000000000 ffffff8008129638 0000000000000000
> <4>[ 1437.858066]  [5:          cplay:11547] b9a0: e0b1dc92eba18f00 e0b1dc92eba18f00 0000000000000003 0000000000000000
> <4>[ 1437.858098]  [5:          cplay:11547] b9c0: 0000000000240022 0000000000000004 ffffff8009b2f420 00000000fffffff5
> <4>[ 1437.858130]  [5:          cplay:11547] b9e0: ffffff8008c6baac 000000000000002c 00000000000000b0 ffffffc9673c1e80
> <4>[ 1437.858161]  [5:          cplay:11547] ba00: 0000000000000000 ffffffc8190e6100 0000000000000000 ffffffc95c262e88
> <4>[ 1437.858193]  [5:          cplay:11547] ba20: 0000000000000008 ffffffc8ec3050d0 ffffffc8fb81a4d0 0000000000000004
> <4>[ 1437.858224]  [5:          cplay:11547] ba40: 0000000000000009 ffffff8028b0bac0 ffffff8008a895c8 ffffff8028b0baa0
> <4>[ 1437.858256]  [5:          cplay:11547] ba60: ffffff8008a895c8 0000000060400005 ffffff8028b0ba48 ffffff800811d7b4
> <4>[ 1437.858287]  [5:          cplay:11547] ba80: 0000007fffffffff e0b1dc92eba18f00 ffffff8028b0bac0 ffffff8008a895c8
> <4>[ 1437.858318]  [5:          cplay:11547] [<ffffff8008082b18>] el1_dbg+0x18/0x78
> <4>[ 1437.858355]  [5:          cplay:11547] [<ffffff8008a895c8>] snd_soc_runtime_deactivate+0x88/0x140

So if the lockdep is complaining, then we should add lockdep assert in
the open_fe as well..

-- 
~Vinod
