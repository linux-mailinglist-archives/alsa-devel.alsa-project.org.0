Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C04C76A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 08:20:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6B43166F;
	Thu, 20 Jun 2019 08:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6B43166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561011639;
	bh=zHmwDyD3eVulwU7UzeEqU5Jq+o/O+QugeZGiCK92tqw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qhNDrkHWqXhCzFxqDEtY2gbG7g9kSrTxokzI2upYEeVgsPEHRoeu7LaoKaJ36WSl5
	 O5vRSBIUOYf4ZZ51Y2qYGb9CU2q7PEpTVIMNtDZNLAVG7uqPF1W8qqGGtRkmixuej2
	 lbAWFK/QmGhRSvTxa2iteHNeSnIGC/rxRQXwiuGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07F72F89717;
	Thu, 20 Jun 2019 08:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EE4AF89717; Thu, 20 Jun 2019 08:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82089F80C15
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 08:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82089F80C15
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 23:17:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,395,1557212400"; d="scan'208";a="168426635"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jun 2019 23:17:36 -0700
Received: from xyang32-mobl.amr.corp.intel.com (unknown [10.252.27.214])
 by linux.intel.com (Postfix) with ESMTP id 6C453580418;
 Wed, 19 Jun 2019 23:17:34 -0700 (PDT)
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
 <20190617113644.25621-10-amadeuszx.slawinski@linux.intel.com>
 <75be86354032f4886cbaf7d430de2aa89eaab573.camel@linux.intel.com>
 <20190618130015.0fc388b4@xxx>
 <bd8855a7ab7a9958113631b76706120fd4427631.camel@linux.intel.com>
 <20190619103859.15bf51c5@xxx>
 <0c939329d17c50c353acacf164583ba259a775c0.camel@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <26946ff4-1c91-a7e0-4354-132cbd06235a@linux.intel.com>
Date: Thu, 20 Jun 2019 08:17:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <0c939329d17c50c353acacf164583ba259a775c0.camel@linux.intel.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 09/11] ASoC: Intel: hdac_hdmi: Set ops
 to NULL on remove
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


>>>>> Could you please give a bit more context on what error you see
>>>>> when this happens?
>>>>
>>>> Hi,
>>>>
>>>> I get Oops. This is what happens with all other patches in this
>>>> series and only this one reverted:
>>>>
>>>> root@APL:~# rmmod snd_soc_sst_bxt_rt298
>>>> root@APL:~# rmmod snd_soc_hdac_hdmi
>>>> root@APL:~# rmmod snd_soc_skl
>>>
>>> Thanks, Amadeusz. I think the order in which the drivers are
>>> removed
>>> is what's causing the oops in your case. With SOF, the order we
>>> remove is
>>>
>>> 1. rmmod sof_pci_dev
>>> 2. rmmod snd_soc_sst_bxt_rt298
>>> 3. rmmod snd_soc_hdac_hdmi
>>>
>>
>> Well, there is nothing enforcing the order in which modules can be
>> unloaded (and I see no reason to force it), as you can see from
>> following excerpt, you can either start unloading from
>> snd_soc_sst_bxt_rt298 or snd_soc_skl, and yes if you start from
>> snd_soc_skl, there is no problem.

there is a fundamental dependency that you are ignoring: the module 
snd_soc_sst_bxt_rt298 is a machine driver which will be probed when 
snd_soc_skl creates a platform_device.
Sure you can remove modules in a different order, but that's a bit of an 
artificial/academic exercise isn't it?

>>
> I am good with this patch. I just wanted to understand why we werent
> seeing this error with SOF. Sure, there's nothing enforcing the order
> in which modules are unloaded  but there must be a logical order for
> testing purposes.
> 
> Pierre, can you please comment on it. I vaguely remember discussing
> this with you last year.

Our tests remove the modules by taking care of dependencies and it's 
already unveiled dozens of issues.
We could add a sequence similar to Amadeusz and unbind the modules which 
are loaded with the creation of a platform_device (machine driver, 
dmic), I am just not sure how of useful this would be.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
