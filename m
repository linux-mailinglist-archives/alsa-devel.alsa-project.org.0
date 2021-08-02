Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1093DCFC6
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 06:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 640BE17C9;
	Mon,  2 Aug 2021 06:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 640BE17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627879017;
	bh=OVnec3Fb6+MC+MzTGB40rLm+9DyEmwn6VAtvMe4QWBQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=raBHzOOCd1n3mstkVfTyo3x6qvBFCQJtFZFeGWu98TZGm49v2VgTc3Rrk/QwAHqUa
	 um4n4DQQ/oO012dBQSXjit3OkYaahh61HUH/yO8l3ImQvPJPzt+dqFPE0oWCoVHZ+d
	 T3qXh5vGK0idSDnbTKab5c1P/MM6F+JUqe7uTUIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDDFBF80268;
	Mon,  2 Aug 2021 06:35:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54E9DF8025F; Mon,  2 Aug 2021 06:35:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82D50F8014D
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 06:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D50F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GwxiGdVs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D18F60FC1;
 Mon,  2 Aug 2021 04:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627878921;
 bh=OVnec3Fb6+MC+MzTGB40rLm+9DyEmwn6VAtvMe4QWBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GwxiGdVsN3kxGdIuNNbMJJwSz/+uYuHdGexy2+KT3yYOaocanmNFUDo5ps1AmD+c9
 eljfQ8f1FwnE04smZ+4L+sG7E1BkXIH6hHqJ8miP6w1d9ATAWLtaxl/oLGmEadd7FI
 1HPvYK3yng83vd4qL+dqRuyWUJmRjnFrStRW5w/6yaSWqrgJ/tdyv3T8Cl1d7A250x
 CRSpbSLhOaLHcjukrZ+hNrGmTwYYium2ayf5kIPgchhC0lG0UDNrfJ6C49mXXKe+ae
 /mxiD7JuzbIBwOmzitkgFm1A4sN4gALp2CjgPaIfpwulA67b3WTVOhHy7c6RyTgQnK
 1N1cbQy9mmWkw==
Date: Mon, 2 Aug 2021 10:05:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
Message-ID: <YQd2BM3wGzKpfZn1@matsya>
References: <20210727053256.29949-1-yung-chuan.liao@linux.intel.com>
 <s5h8s1sfevg.wl-tiwai@suse.de>
 <a25d47a6-2599-7101-cd93-e5304b271948@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a25d47a6-2599-7101-cd93-e5304b271948@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
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

On 27-07-21, 09:12, Pierre-Louis Bossart wrote:
> Thanks Takashi for the review.
> 
> 
> >> This patch provides both a simplification of the suspend flows and a
> >> better balanced operation during suspend/resume transition.
> >>
> >> The exiting code relies on a convoluted way of dealing with suspend
> >> signals. Since there is no .suspend DAI callback, we used the
> >> component .suspend and marked all the component DAI dmas as
> >> 'suspended'. The information was used in the .prepare stage to
> >> differentiate resume operations from xrun handling, and only
> >> reinitialize SHIM registers and DMA in the former case.
> >>
> >> While this solution has been working reliably for about 2 years, there
> >> is a much better solution consisting in trapping the TRIGGER_SUSPEND
> >> in the .trigger DAI ops. The DMA is still marked in the same way for
> >> the .prepare op to run, but in addition the callbacks sent to DSP
> >> firmware are now balanced.
> >>
> >> Normal operation:
> >> hw_params -> intel_params_stream
> >> hw_free   -> intel_free_stream
> >>
> >> suspend    -> intel_free_stream
> >> prepare    -> intel_params_stream
> >>
> >> This balanced operation was not required with existing SOF firmware
> >> relying on static pipelines instantiated at every boot. With the
> >> on-going transition to dynamic pipelines, it's however a requirement
> >> to keep the use count for the DAI widget balanced across all
> >> transitions.
> > 
> > The trigger callback is handled in the stream lock atomically, and are
> > you sure that you want to operate a possibly heavy task there?
> 
> It's a good objection that we didn't think of.

Doesn't Intel use non atomic trigger to send IPCs which anyway involve
code which can sleep..?

> 
> I guess it depends on the definition of 'heavy' and what is acceptable
> in such a 'trigger' context.
> 
> The intel_free_stream() routine only sends an IPC to the firmware to
> release the DMA resources. It doesn't perform any memory allocation
> tasks at the kernel level, it only sends information to the firmware
> that the DMA can be stopped/released. We could trace how much time that
> really means but I don't expect it to be 'long'. I also don't think the
> IPC waits for the DMA to be actually stopped/released, the IPC completes
> when the message is acknowledged with the doorbell registers (I will
> double-check this point).
> 
> It's really similar to all the existing IPCs sent in trigger context, we
> already send an IPC for ALL trigger commands such as
> START/STOP/PAUSE_PUSH/PAUSE_RELEASE. see e.g. sof_pcm_trigger() in
> sound/soc/sof/pcm.c
> 
> What is needed for dynamic pipelines is the ability to deal with
> suspend-resume, so we would send IPCs in those cases as well.
> 
> That said, it's true that we marked all the FE dailinks as nonatomic
> precisely because they would involve IPCs, but here we are dealing with
> BE dailinks that are typically thought of as 'atomic'. Just thinking
> aloud, maybe we need to tag all those dailinks as 'nonatomic' as well?
> 
> > If it's just for releasing before re-acquiring a stream, you can do it
> > in sync_stop PCM ops instead, too.  This is called in prior to prepare
> > and hw_params ops when a stream has been stopped or suspended
> > beforehand.
> 
> Humm, I must admit I have never heard of this sync_stop routine :-)
> 
> It's not exposed as a DAI callback, I only see this exposed at the
> component level. That wouldn't be too helpful, the existing solution was
> based on using the suspend at the component level, which was a bit of a
> hack - we marked all component DAIs as suspended, including the ones
> that were never started.
> 
> The idea of using the DAI seems much better to me, we don't need to
> track which DAI is started or not, just use the pointer passed by higher
> layers.
> 
> Anyways, thanks for the feedback, that gave us a lot of things to think
> about.
> -Pierre

-- 
~Vinod
