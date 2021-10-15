Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7DE42F0C5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 14:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4997E16BA;
	Fri, 15 Oct 2021 14:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4997E16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634300787;
	bh=kVXsH31Em3GVrPhFEEL6PDhdIzJsR7FKuSDjVmbkMxw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDmDLTxb3Piq5o539OBnYwrp9+ADZc/s5fakUO1BqE5KYknTCmWKYcauxYmgux3iy
	 Xl2hnrFm7pKXf6lLZ3rVW+bP8jND+3Tq2GiDrJaqoMxETf+1knXt7Cgo/tyc9HKfUr
	 A8MLf6cIIEXtASkTtgjN3+gYAFjkvOdDhOiKFTm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AE4EF8028D;
	Fri, 15 Oct 2021 14:25:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBCC2F80269; Fri, 15 Oct 2021 14:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5203F8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 14:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5203F8012E
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="214839207"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="214839207"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 05:24:56 -0700
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="492523934"
Received: from liminghu-mobl.ccr.corp.intel.com (HELO [10.212.23.213])
 ([10.212.23.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 05:24:55 -0700
Subject: Re: [RFC PATCH v3 04/13] ASoC: soc-pcm: introduce
 snd_soc_dpcm_fe_lock_irq/unlock_irq()
To: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
 <20211013143050.244444-5-pierre-louis.bossart@linux.intel.com>
 <a98ea2c6-e617-0fb7-8b24-99b8edc8868a@nvidia.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6d7c8d71-d131-fd92-c1c6-e4f4380a4f77@linux.intel.com>
Date: Fri, 15 Oct 2021 07:24:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a98ea2c6-e617-0fb7-8b24-99b8edc8868a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
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



On 10/15/21 1:24 AM, Sameer Pujar wrote:
> 
> 
> On 10/13/2021 8:00 PM, Pierre-Louis Bossart wrote:
>> In preparation for more changes, add two new helpers to gradually
>> modify the DPCM locks.
>>
>> Since DPCM functions are not used from interrupt handlers, we can only
>> use the lock_irq case.
>>
>> While most of the uses of DPCM are internal to soc-pcm.c, some drivers
>> in soc/fsl and soc/sh do make use of DPCM-related loops that will
>> require protection, adding EXPORT_SYMBOL_GPL() is needed for those
>> drivers.
>>
>> The stream argument is unused in this patch but will be enabled in
>> follow-up patches.
>>
>> Signed-off-by: Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com>
>> ---
>>   include/sound/soc-dpcm.h |  3 +++
>>   sound/soc/soc-pcm.c      | 42 +++++++++++++++++++++++-----------------
>>   2 files changed, 27 insertions(+), 18 deletions(-)
> 
> 1. Till this patch and with DEBUG_LOCKDEP config enabled, I see

Did you mean "with this patch included", yes?

> following warning:
>    "WARNING: CPU: 0 PID: 0 at kernel/locking/irqflag-debug.c:10
> warn_bogus_irq_restore+0x30/0x40"
> 
>    However test passed though. Interestingly it was seen only for the
> first time I ran a 2x1 mixer test.
> 
> 2. Also after I load sound modules and card gets registered, I see some
> hw_param() calls for FE and BE. This seems harmless at this point, but
> is getting problematic with subsequent patches. This was not happening
> earier.

This patch doesn't change any of the flow, it just adds a wrapper in
preparation for the transition to the FE pcm lock.

The only change is that we use spin_lock_irq instead of the
irqsave/restore version, but that was also Takashi's recommendation.

the test results would suggest that on Tegra DPCM functions are used
from an interrupt context?
