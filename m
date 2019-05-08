Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E3C17ED4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 19:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01AE71779;
	Wed,  8 May 2019 19:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01AE71779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557335186;
	bh=dwKPkmHnamkRVglkpRnr9j3bPCn5bSyiANYqgm8CnKk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W/RcQuIm1ekSMpqoGItwKyw+e4w33RV3Rdb1Aa44aQ84DqWYBQK7gMglw/LxZ30Xu
	 YE0cSTsnvsuNzhHfz994GFu/+ji+xKAHyzo1mVC+NkmwhbAtqe9c0//n66YimmqpLG
	 vQgZKJgMVDgX0h/pQ2J5MBqFCuwuTPu1KY9vI3uA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69CEBF896F0;
	Wed,  8 May 2019 19:04:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A75EF896F0; Wed,  8 May 2019 19:04:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85889F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 19:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85889F80796
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 10:04:34 -0700
X-ExtLoop1: 1
Received: from mayalewx-mobl1.amr.corp.intel.com (HELO [10.255.230.159])
 ([10.255.230.159])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 10:04:27 -0700
To: Evan Green <evgreen@chromium.org>
References: <20190507215359.113378-1-evgreen@chromium.org>
 <20190507215359.113378-3-evgreen@chromium.org>
 <866afac2-e457-375b-d745-88952b11d75e@linux.intel.com>
 <CAE=gft4sDo1cLeU8Cm1CRZu2PzVG0iu-b7UaWxWVrsUeZ=SYhQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6fd9ca2b-dcf6-801f-209e-11eba59203fe@linux.intel.com>
Date: Wed, 8 May 2019 12:04:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAE=gft4sDo1cLeU8Cm1CRZu2PzVG0iu-b7UaWxWVrsUeZ=SYhQ@mail.gmail.com>
Content-Language: en-US
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Yu Zhao <yuzhao@google.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Rakesh Ughreja <rakesh.a.ughreja@intel.com>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>,
 Guenter Roeck <groeck@chromium.org>, Jenny TC <jenny.tc@intel.com>
Subject: Re: [alsa-devel] [PATCH v2 2/2] ASoC: Intel: Skylake: Add Cometlake
	PCI IDs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/8/19 11:51 AM, Evan Green wrote:
> On Tue, May 7, 2019 at 3:31 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>> On 5/7/19 4:53 PM, Evan Green wrote:
>>> Add PCI IDs for Intel CometLake platforms, which from a software
>>> point of view are extremely similar to Cannonlake platforms.
>>
>> Humm, I have mixed feelings here.
>>
>> Yes the hardware is nearly identical, with the exception of one detail
>> that's not visible to the kernel, but there is no support for DMICs with
>> the Skylake driver w/ HDaudio, and Chrome platforms are only going with
>> SOF, so is it wise to add these two CometLake platforms to the default
>> SND_SOC_INTEL_SKYLAKE selector, which is used by a number of distributions?
>>
>> I don't mind if we add those PCI IDs and people use this driver if they
>> wish to, but it may be time for an explicit opt-in? The
>> SND_SOC_INTEL_SKYLAKE definition should even be pruned to mean SKL, APL,
>> KBL and GLK, and we can add DMI-based quirks for e.g. the Up2 board and
>> GLK Chromebooks which work with SOF.
> 
> I don't have the context here, so feel free to ignore me. But it seems
> like such a tiny amount of extra bits to add to make Cometlake work,
> and then there's no hassle for the distributions when Cometlake
> devices start showing up in the wild. So while things are more or less
> the same, why not continue piggypacking off the default?
> Or are you saying that the lack of DMIC support means the default
> should be to use a different driver?

Yes, it's the latter case, SOF will be the only driver supporting DMICs 
on CometLake, so it'd be better to avoid creating a conflict with SOF or 
enabling a configuration by default which is known to have restrictions. 
It's fine to add the CML IDs, but better avoid adding CML under the 
SKYLAKE all-you-can-eat selector.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
