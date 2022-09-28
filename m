Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19D5ED80B
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 10:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4006CE11;
	Wed, 28 Sep 2022 10:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4006CE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664354468;
	bh=Nh8zVkI764C79JD/zOGUpjoTiHdV4xPlRb3vpHlIbd4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d5cCS5rDZKH1okqieWqW//A5xhIl49KmsGOPmquubK4lWU9+nigTizH+t59Nb7ysM
	 vnn3+CMxI8/hXctf/JaXEPjBncu/9Ikgge7nXl+YYce6AoFnxWgoGF+6gjUHvBZTJr
	 CXYnb8bXlpBnPIF0PyWZ2DlR5dOHFn1UOp9sUDOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA0C1F804EC;
	Wed, 28 Sep 2022 10:39:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97055F80272; Wed, 28 Sep 2022 10:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3243F80272
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 10:39:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3243F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bhjRh8Pr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664354385; x=1695890385;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Nh8zVkI764C79JD/zOGUpjoTiHdV4xPlRb3vpHlIbd4=;
 b=bhjRh8Prcgoi3k7dBnC56udYIJaxLY/n0YPS5bly8mF3L71pASlc9/8L
 s+RDaLxpY7I/cPfLkTVyzQuitiUlubARSaYzo591/ICAOFvm1ZoYiqFU6
 EONBkcKrkT2zJjUAdgnKlirgt+Pzv+bASGOLrpbhOwDz795ibenvUZ0m+
 uL92FZ3aJ+W8yayOwqAXQTXWCKHpI2j4Tfys9KdhYaDFC56FsnVJAMOFI
 9FoE7iPqfeJZ3HzNGh2QugBA+e6stunKlqav9RxJEh6BXAX5uZwsh+E6M
 +wdF+jhDW3J4Ph8JVYPTqV2LK/yhyGTJUN+aQOveLfoyDIFofpnCMHbvK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="365591350"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="365591350"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:39:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="617131356"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="617131356"
Received: from morank-mobl3.ger.corp.intel.com (HELO [10.251.211.7])
 ([10.251.211.7])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:39:17 -0700
Message-ID: <9cb844a7-6eac-0085-3c8c-32004a22c849@linux.intel.com>
Date: Wed, 28 Sep 2022 10:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: soc-pcm: fix fe and be race when accessing
 substream->runtime
Content-Language: en-US
To: Eugeniu Rosca <erosca@de.adit-jv.com>
References: <1664210154-11552-1-git-send-email-erosca@de.adit-jv.com>
 <bdf56f23-1019-b4c8-a11a-3934db432cf1@linux.intel.com>
 <20220927123043.GB4547@lxhi-065>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220927123043.GB4547@lxhi-065>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Yanmin Zhang <yanmin_zhang@linux.intel.com>, alsa-devel@alsa-project.org,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Zhang Yanmin <yanmin.zhang@intel.com>, linux-kernel@vger.kernel.org,
 Ramesh Babu <ramesh.babu@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Dean Jenkins <Dean_Jenkins@mentor.com>, Mark Brown <broonie@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>, xiao jin <jin.xiao@intel.com>
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



On 9/27/22 14:30, Eugeniu Rosca wrote:
> Hi Pierre,
> 
> On Di, Sep 27, 2022 at 09:51:46 +0200, Pierre-Louis Bossart wrote:
>> On 9/26/22 18:35, Eugeniu Rosca wrote:
>>> From: xiao jin <jin.xiao@intel.com>
>>>
>>> After start of fe and be, fe might go to close without triggering
>>> STOP, and substream->runtime is freed. However, be is still at
>>> START state and its substream->runtime still points to the
>>> freed runtime.
>>>
>>> Later on, FE is opened/started again, and triggers STOP.
>>> snd_pcm_do_stop => dpcm_fe_dai_trigger
>>>                 => dpcm_fe_dai_do_trigger
>>>                 => dpcm_be_dai_trigger
>>>                 => dpcm_do_trigger
>>>                 => soc_pcm_trigger
>>>                 => skl_platform_pcm_trigger
>>> skl_platform_pcm_trigger accesses the freed old runtime data and
>>> kernel panic.
>>>
>>> The patch fixes it by assigning be_substream->runtime in
>>> dpcm_be_dai_startup when be's state is START.
>>
>> Can I ask on which kernel this patch was validated and on what platform?
> 
> As shared with Czarek in https://lore.kernel.org/alsa-devel/20220927110022.GA3802@lxhi-065/ ,
> this patch was originally extracted from the out-of-tree Intel Apollo
> Lake v4.1 KNL releases, hence it was validated on Intel ref.boards.
> 
> No re-testing/re-validation has been performed on the latest vanilla.

There's no way to predict how a patch for a kernel 4.1 - released 7
years ago - would behave with a new kernel. If it's not tested it cannot
be merged.

> One of the goals behind submitting the patch is getting in touch
> with the original authors, as well as the members of alsa-devel,
> to assess if the patch is still relevant.

The only thing we could do is have more clarity on the test case and try
to reproduce it.

>>
>> We've done a lot of work since last year on DPCM states, 
> 
> Could you please feedback if the work on the DPCM states is
> pre- or post-v5.10?

It doesn't matter for this discussion on the upstream kernel. But yes
it's post v5.10.

> 
>> and I wonder
>> the problem mentioned above actually exists on recent kernels.
>>
>> Specifically, if the FE is closed, I don't get how the BE is not closed
>> as well. And if this problem is found on a recent kernel, then it should
>> be seen in the AVS driver as well, no?
> 
> It is totally conceivable (if not very likely) that the mainline
> advancements in the sound subsystem make this patch obsolete.
> 
> I would be happy if that's the final outcome of our discussion
> (since this will allow dropping the patch in our downstream kernel).
> 
> Best Regards,
> Eugeniu
