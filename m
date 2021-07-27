Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F63D7874
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 16:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F0F41EF5;
	Tue, 27 Jul 2021 16:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F0F41EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627396050;
	bh=1qyfoBucutD841N0qUjue3cFf0Pcjj+62jYOKQFZjmQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=em9dhdcFitDStAqRngVwXqqqHVXUclaEIsTB8lgxgpkKBERKFDkBjWqjSSx9OsTIR
	 G8GZE1Fr+XMdnjWvjcn5Xu4CzKd2Q5bErm9niynDV4Ny9F+iL1kfSB2GAJhq2QW+eF
	 /GnJDg84ZnbPLXicB2E05g7JVaWJwreZ/EQvYF4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90CD7F8027C;
	Tue, 27 Jul 2021 16:26:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D14EF80276; Tue, 27 Jul 2021 16:26:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0D89F80159
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 16:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0D89F80159
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="192731864"
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; d="scan'208";a="192731864"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 07:25:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; d="scan'208";a="417429101"
Received: from pmdeshpa-mobl1.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 07:25:46 -0700
Subject: Re: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
To: Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20210727053256.29949-1-yung-chuan.liao@linux.intel.com>
 <s5h8s1sfevg.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a25d47a6-2599-7101-cd93-e5304b271948@linux.intel.com>
Date: Tue, 27 Jul 2021 09:12:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5h8s1sfevg.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, vkoul@kernel.org,
 bard.liao@intel.com, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Thanks Takashi for the review.


>> This patch provides both a simplification of the suspend flows and a
>> better balanced operation during suspend/resume transition.
>>
>> The exiting code relies on a convoluted way of dealing with suspend
>> signals. Since there is no .suspend DAI callback, we used the
>> component .suspend and marked all the component DAI dmas as
>> 'suspended'. The information was used in the .prepare stage to
>> differentiate resume operations from xrun handling, and only
>> reinitialize SHIM registers and DMA in the former case.
>>
>> While this solution has been working reliably for about 2 years, there
>> is a much better solution consisting in trapping the TRIGGER_SUSPEND
>> in the .trigger DAI ops. The DMA is still marked in the same way for
>> the .prepare op to run, but in addition the callbacks sent to DSP
>> firmware are now balanced.
>>
>> Normal operation:
>> hw_params -> intel_params_stream
>> hw_free   -> intel_free_stream
>>
>> suspend    -> intel_free_stream
>> prepare    -> intel_params_stream
>>
>> This balanced operation was not required with existing SOF firmware
>> relying on static pipelines instantiated at every boot. With the
>> on-going transition to dynamic pipelines, it's however a requirement
>> to keep the use count for the DAI widget balanced across all
>> transitions.
> 
> The trigger callback is handled in the stream lock atomically, and are
> you sure that you want to operate a possibly heavy task there?

It's a good objection that we didn't think of.

I guess it depends on the definition of 'heavy' and what is acceptable
in such a 'trigger' context.

The intel_free_stream() routine only sends an IPC to the firmware to
release the DMA resources. It doesn't perform any memory allocation
tasks at the kernel level, it only sends information to the firmware
that the DMA can be stopped/released. We could trace how much time that
really means but I don't expect it to be 'long'. I also don't think the
IPC waits for the DMA to be actually stopped/released, the IPC completes
when the message is acknowledged with the doorbell registers (I will
double-check this point).

It's really similar to all the existing IPCs sent in trigger context, we
already send an IPC for ALL trigger commands such as
START/STOP/PAUSE_PUSH/PAUSE_RELEASE. see e.g. sof_pcm_trigger() in
sound/soc/sof/pcm.c

What is needed for dynamic pipelines is the ability to deal with
suspend-resume, so we would send IPCs in those cases as well.

That said, it's true that we marked all the FE dailinks as nonatomic
precisely because they would involve IPCs, but here we are dealing with
BE dailinks that are typically thought of as 'atomic'. Just thinking
aloud, maybe we need to tag all those dailinks as 'nonatomic' as well?

> If it's just for releasing before re-acquiring a stream, you can do it
> in sync_stop PCM ops instead, too.  This is called in prior to prepare
> and hw_params ops when a stream has been stopped or suspended
> beforehand.

Humm, I must admit I have never heard of this sync_stop routine :-)

It's not exposed as a DAI callback, I only see this exposed at the
component level. That wouldn't be too helpful, the existing solution was
based on using the suspend at the component level, which was a bit of a
hack - we marked all component DAIs as suspended, including the ones
that were never started.

The idea of using the DAI seems much better to me, we don't need to
track which DAI is started or not, just use the pointer passed by higher
layers.

Anyways, thanks for the feedback, that gave us a lot of things to think
about.
-Pierre
