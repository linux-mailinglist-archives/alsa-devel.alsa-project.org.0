Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF65533CE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 15:39:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8D82069;
	Tue, 21 Jun 2022 15:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8D82069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655818786;
	bh=4g1OBCKHsQO3IKCZZ/oEJywrdg/bmeF4o4W6XXd/1Fc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=en5DyUDYDaRcRLpyaYu4DXSlrpFCrCcYMd96rs/8Ov12tB5r6amexR5DLftuCny4F
	 Ysrhl1vuy1GEhxzTN6HzZIpgrpK03XmNz9KKqPHDyOdGIT0fRuO/xZLacTPJaD0sYR
	 UfR0Z82X7qlTGQlZYDxz/tpFKTo73pbyVeui+1bQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB689F80253;
	Tue, 21 Jun 2022 15:38:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E0E9F80104; Tue, 21 Jun 2022 15:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F91F80104;
 Tue, 21 Jun 2022 15:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F91F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IcqH5kkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655818719; x=1687354719;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4g1OBCKHsQO3IKCZZ/oEJywrdg/bmeF4o4W6XXd/1Fc=;
 b=IcqH5kkgDKvS8Ivr/1V6OdHsi3avXhd1MdNJGCKLaTTZ/zK0+yYL7jeN
 Eihrzh4rXuabS+nZxWsbkGA0aN6AZuMOogTc2m+aU/0x4D9afun658zF2
 9Dm6j5KJ6KoLlGLirM/bQ3BzXLXP6+2A8RuuIVBS//AzGZcC6itc+WwXv
 IAZJ0Oj2jeoZ9DE1KCx5nvOuMoLHAAVFXanvhti01067phZixzksPngyq
 vnfisHFtJua7b6fBI6VlfFQeWVwQPYzA8AmPOHK0G/40RCgeDWfC29hYm
 Lqs6QW6dAMOtUWuO69Zh7oL8uA/Zbj0qwFmvg7e7A+rQbynti5aPkyLNT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="280167012"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="280167012"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 06:38:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="591653651"
Received: from dpasupul-mobl.amr.corp.intel.com (HELO [10.209.178.35])
 ([10.209.178.35])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 06:38:30 -0700
Message-ID: <f80c7bf2-1d9e-40d7-d3bd-c8bbe548934b@linux.intel.com>
Date: Tue, 21 Jun 2022 08:11:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [Sound-open-firmware] ASoC: SOF: Race condition in ipc.c
Content-Language: en-US
To: noman pouigt <variksla@gmail.com>, Mark Brown <broonie@kernel.org>,
 liam.r.girdwood@linux.intel.com
References: <CAES_P+_aC4cHMB3Tn0pz13_gKCpXs=efeae2JBvEPOK5zidYnA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAES_P+_aC4cHMB3Tn0pz13_gKCpXs=efeae2JBvEPOK5zidYnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 rander.wang@intel.com, yangyingliang@huawei.com,
 peter.ujfalusi@linux.intel.com, sound-open-firmware@alsa-project.org
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



On 6/20/22 21:46, noman pouigt wrote:
> Folks,
> 
> I have borrowed part of SOF architecture for my own DSP
> framework development as the memory on the DSP is
> extremely small and wouldn't be able to support SOF.

You're providing very little context here. Of course it's open-source
and you can do whatever you want with the code, but it's not clear if
the 'borrowed' code can deal with your specific case.

> Currently I am running into a race condition as below:
> 
> CPU                                            DSP
> PCM_TRIGGER_START
> sof_ipc_send_msg ---->
> 
>                                       <------Immediate ACK
> ipc3_wait_tx_done
> (wait_event_timeout)
>                                       <------ POSITION update
> 
> snd_pcm_period_elapsed
> 
> 
> As you can see TRIGGER_START didn't even finish
> and waiting for it to complete in ipc3_wait_tx_done
> function. However, before it could complete the position
> interrupt was issued which results in calling period_elapsed
> function.
> 
> In order to fix this I assume below is called in SOF framework:
> schedule_work(&spcm->stream[substream->stream].period_elapsed_work);
> 
> How is this design working? If the interrupt is coming too fast
> from the DSP than the associated function with this schedule_work
> will not get called as the scheduler will not get time to schedule the
> workqueue and elapsed function will not be called thereby not increasing
> the hw_ptr. How is the flow control for data transfer achieved?

The schedule_work was added by this commit, and the explanations are
rather straightforward:

commit e2803e610aecb36ea4fec5a04861547664580d0c

Author: Keyon Jie <yang.jie@linux.intel.com>

Date:   Tue Apr 30 18:09:25 2019 -0500




ASoC: SOF: PCM: add period_elapsed work to fix race condition in
interrupt context

"
The IPC implementation in SOF requires sending IPCs serially: we should
not send a new IPC command to the firmware before we get an ACK (or time
out) from firmware, and the IRQ processing is complete.

snd_pcm_period_elapsed() can be called in interrupt context before
IRQ_HANDLED is returned. When the PCM is done draining, a STOP
IPC will then be sent, which breaks the expectation that IPCs are
handled serially and leads to IPC timeouts.

This patch adds a workqueue to defer the call to snd_pcm_elapsed() after
the IRQ is handled.
"

I am not sure what the problem you have really is.

It's not really surprising that the first period is consumed
immediately, the flow will become more steady-state afterwards.

The DMAs should be primed to deal with more than one period, and the
schedule_work() will only signal that the application can refill the
ring buffer. There's all kinds of delays that will happen depending on
load and scheduling, and if the POSITION_UPDATE was received immediately
then there's should be still plenty of time to provide a new buffer.

> 
> I am facing the above problem in my design.
> 
> I am wondering if I can simply add one more IPC command(don't call
> wait_event_interruptible for this) after TRIGGER_START to start the
> streaming.This way schedule_work for updating period_elapsed function
> can be avoided and it can be called in an interrupt context.

See commit above, this won't work because you'll be sending an IPC while
dealing with an IPC.
