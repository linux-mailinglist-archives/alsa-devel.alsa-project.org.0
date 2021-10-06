Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B072424773
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 21:49:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A6B9846;
	Wed,  6 Oct 2021 21:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A6B9846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633549747;
	bh=jrUmHDNwWBYHcPuzK05HMFz7qWUlC5s9R7Q+efXYjM0=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gshi5D530zuYIKpAEYhUCiRWkDzh4oMCXkxLMnq7b0ko7PaHME33GbnHPTisLdyzz
	 NFjaEuj3EKSoF/5e9c45s/eNYXhBhWmvVfpBh7w/nhNiCSoegMo/rjHkcaHPQDzmAu
	 bCPKTevFVAaT+c2S+5YQWbxTqjyng/NHhsJ6pOrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF61F8010B;
	Wed,  6 Oct 2021 21:47:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F0ABF80240; Wed,  6 Oct 2021 21:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D36BF8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 21:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D36BF8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="206901357"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="206901357"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 12:47:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439245194"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 12:47:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH v2 0/5] ASoC: soc-pcm: fix trigger race conditions
 with shared BE
To: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org
References: <20211004225441.233375-1-pierre-louis.bossart@linux.intel.com>
 <cce82420-d744-ee43-d514-b77ac4905ffa@nvidia.com>
 <1efa1c31-7342-05f8-5f73-95e2462d4179@linux.intel.com>
 <3683cf39-632b-50df-c65d-63779c464850@nvidia.com>
Message-ID: <11257d77-9975-3b00-94da-5dc1b5c95fc6@linux.intel.com>
Date: Wed, 6 Oct 2021 14:47:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3683cf39-632b-50df-c65d-63779c464850@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


> I tested this further. It appears that things work fine till 'patch 3/5'
> of yours. After I take 'patch 4/5', the print "BUG: scheduling while
> atomic: aplay" started showing up and I see a hang. This failure was
> seen for 2x1 mixer test itself.
> 
> The 'patch 4/5' introduces mutex_lock/unlock() in dpcm_be_dai_trigger().
> This seems to be the problem, since trigger() runs in atomic context
> depending on the PCM 'nonatomic' flag. I am not sure if your design sets
> 'nonatomic' flag by default and that is why the issue is not seen at
> your end?
> 
> With below (just for testing purpose), tests ran well. I was able to run
> 2x1, 3x1 ... 10x1 mixer tests.

This is useful information, thanks a lot Sameer for your time.

Unfortunately removing the lines below will not work, that's
precisely what's needed to prevent multiple triggers from being sent to
the same shared BE.

I don't have a clear idea why we see different results, and now I have
even less understanding of the ALSA/ASoC/DPCM locking model. We use
card->mutex, card->pcm_mutex, card->dpcm_lock,
substream->self_group.mutex or lock, client_mutex, dapm_mutex....

I don't think any of the DPCM code is ever called from an interrupt
context, so the errors you reported seem more like a card configuration,
specifically the interaction with 'aplay'/userspace will happen for FEs.
BEs are mostly hidden to userspace.

One possible difference is that all our DPCM solutions are based on
non-atomic FEs (since they all involve an IPC with a DSP), so we would
always use the top banch of these tests:

	if (nonatomic) \
		mutex_ ## mutex_action(&group->mutex); \
	else \
		spin_ ## action(&group->lock);

I don't see this nonatomic flag set anywhere in the sound/soc/tegra
code, so it's possible that in your case the spin_lock/spin_lock_irq is
used before triggering the FE, and using a mutex before the BE trigger
throws errors? I think Takashi mentioned that the BEs inherit the
properties of the FE to some extent.

Looking at the code, I see that only Intel legacy, SOF and Qualcomm
drivers set nonatomic=1, so maybe we can assume that that FEs for a card
are either all atomic or all non-atomic, maybe we could then use a
spinlock or a mutex. But if the FEs can be different then I am not sure
what locking model might work, we can't have a BE protected by a
spinlock or a mutex depending on the property of the FE. We need one
method only to guarantee a mutual exclusion.

Takashi, Mark, do you think that an all/none assumption on FE nonatomic
properties would make sense?
