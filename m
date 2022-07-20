Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843BA57B78F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 15:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 286811779;
	Wed, 20 Jul 2022 15:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 286811779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658323954;
	bh=97Krov47Nh6N4s4IwW10q57tVLfvL2pyX4++1iM6ROo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFtY/4fa00Z5cKkxyGdMnFf9t/Ul/P7Iw3SVqPVRB3sBZy91crpUl5063zrF9Net4
	 3OwE0MaDyjlQKFfnO7qli9+x5161pCx2zW5nyF/U15xI5lDy0VuNof/a8mGMpICyr0
	 FTfvEF76vQsgjHB4m25qbu9bp9uSsrhHWuOF9iM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DA00F800BA;
	Wed, 20 Jul 2022 15:31:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FC65F80169; Wed, 20 Jul 2022 15:31:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D11CF800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 15:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D11CF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IFDeIA2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658323886; x=1689859886;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=97Krov47Nh6N4s4IwW10q57tVLfvL2pyX4++1iM6ROo=;
 b=IFDeIA2D2tp0CoSfIY7RBNO3umPHTtl3jAE08ItyN/PfDqGPARkz2xh0
 3VW0VdlxMGe46MhZr19bywEfK5ZjghoBWTZnCqk9HLdIJ1nH6ID+ZVTJe
 3NJ6fXH49MRE3oXvOLgOmr8CYHrtHDwC2MUfGd4741qjkLhq1ZUXtgYi1
 GKHbHZaq93vuNurLJ9XmM48uLZPVoVl7Hyl5l9Uaobt8p1zFE2a/jdqJb
 9M/eoNHsGywjueyz8/S2sYgzLnwYEVm3Fb1I0XBDREpi3EgIvKcvSvFl2
 XVcKanCyo/DcB1VgH7nArNrIvhGZtWjGZiyDGbGxVKGQ8PADTgeMKdPQq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="348470892"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="348470892"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 06:31:20 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="573305428"
Received: from tgeorge1-mobl.amr.corp.intel.com (HELO [10.212.79.208])
 ([10.212.79.208])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 06:31:19 -0700
Message-ID: <514f0fda-9475-e163-fd64-0bc675dd3447@linux.intel.com>
Date: Wed, 20 Jul 2022 08:31:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] ALSA: hda: Skip creating captures in SOF context
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20220719144753.252231-1-kai.heng.feng@canonical.com>
 <bd59b06a-de49-2a1a-d2a2-351957fec6d0@perex.cz>
 <CAAd53p6ru7CJ=pJ2knCL5pgU_Y+nA=yTPscKk225zTD-fv4qQg@mail.gmail.com>
 <34bddb2f-dc57-c08c-358e-26cf7824c203@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <34bddb2f-dc57-c08c-358e-26cf7824c203@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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



On 7/20/22 02:52, Jaroslav Kysela wrote:
> Dne 20. 07. 22 v 3:45 Kai-Heng Feng napsal(a):
>> On Tue, Jul 19, 2022 at 11:41 PM Jaroslav Kysela <perex@perex.cz> wrote:
>>>
>>> Dne 19. 07. 22 v 16:47 Kai-Heng Feng napsal(a):
>>>> On HP laptops that use SOF driver for DMIC, the micmute LED doesn't
>>>> light up when mic is muted after commit 9b014266ef8a ("ASoC: SOF:
>>>> topology: use new sound control LED layer").
>>>>
>>>> The micmute LED itself is still working via sysfs, but it doesn't follow
>>>> mute anymore. That's because unlike vendors like Dell and Lenovo, HP
>>>> laptops use HDA codec to control mute LEDs instead of ACPI. So on HP
>>>> laptops, both SOF and HDA create captures with
>>>> SNDRV_CTL_ELEM_ACCESS_MIC_LED access, snd_ctl_led_set_state() considers
>>>> there are two different kcontrols and one of them is not muted.
>>>
>>> It does not mean that it's a wrong behavior. When both controls are muted, the
>>> LED should be turned on. It just requires that all inputs are off (and it may
>>> be the default - probably we can set in UCM or so). If you turn the "Capture
>>> Switch" off in amixer / alsamixer, do things work as expected ?
>>
>> Yes. When all captures are muted the micmute LED is on.
>>
>>>
>>>> So skip creating captures for HDA when it's called from SOF, the
>>>> captures are already handled by SOF.
>>>
>>> The capture controls are for other inputs like external analog microphone. If
>>> it is required to suppress the MIC LED for some hardware, just skip the
>>> "spec->mic_mute_led = 1" assignment in hda_generic.c . Also, the check
>>> "codec->core.type != HDA_DEV_ASOC" is not sufficient, because you don't know,
>>> if the topology really sets the MIC LED flag.
>>
>> AFAIK the external analog microphone on DMIC laptop is driven by SOF driver too.
>> If those capture controls are indeed needed for external analog mics,
>> use UCM to mute them by default won't work either.
> 
> Could you describe this ? I though that only DMIC is handled by SOF when HDA
> codec is in the system. There is a separate analog codec for external analog
> microphone or the HDA codec is somehow connected to SOF/DSP ? If so, how ?

The HDA codec is connected in the same way in all cases, there's no
hardware/electrical/routing difference.

When used, the SOF driver will handle ALL links, be they DMIC or
HDAudio. The difference for HDaudio is that instead of a single DMA
transfer (DDR->FIFO), we have a first 'Host' DMA into the DSP SRAM, some
processing and a second 'Link' DMA from DSP SRAM to the HDaudio FIFO
(reversed flow for capture).

