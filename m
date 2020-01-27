Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B2714A7A6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 17:00:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 194CA86F;
	Mon, 27 Jan 2020 16:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 194CA86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580140808;
	bh=8BzVMQY/X7TDP06E/unIiHSeVMw+PTKcHHdfKCmsA6Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u3lUz/V+eFvA+AqfCBpngPW1ykkp0PKuUPIY+bpWq4e/aXHFt5K/8TQoTM6bp+J1B
	 TUcm3xTN/TTePY15mRSQuJHDV1EJXLKr0KDv5a1fLxCRZtbjrJbkJEBS14feHRPCzo
	 kPDM8c2I+zKuWMZuxXKWbPUAtc4gOGTPQknTKrYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E06BCF80218;
	Mon, 27 Jan 2020 16:57:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56F8FF80256; Mon, 27 Jan 2020 16:57:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9C79F80082
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 16:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9C79F80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 07:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,370,1574150400"; d="scan'208";a="223277230"
Received: from vvaddepa-mobl.amr.corp.intel.com (HELO [10.252.204.5])
 ([10.252.204.5])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2020 07:57:34 -0800
To: "Wasko, Michal" <michal.wasko@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
 <9246ee43-ffec-2b28-3a56-211f08797342@intel.com>
 <a30fffb3-5f6b-eaa4-1684-3f19d973c54f@linux.intel.com>
 <013c7d4b-c08f-f476-50fe-70ae22580277@linux.intel.com>
 <5516562e-9f0c-55c8-a193-b1a80a341392@linux.intel.com>
 <1b8a4612-338e-0d75-57bb-6deb4055f45e@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <803a0824-ed50-7b7c-ef15-c98cafef77e2@linux.intel.com>
Date: Mon, 27 Jan 2020 09:30:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1b8a4612-338e-0d75-57bb-6deb4055f45e@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
 global-out-of-bounds bug
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


>>> As it was agreed with you Pierre the Skylake driver will be kept 
>>> under maintenance and the proposed changes are about to keep hda-dsp 
>>> configuration functional for anyone who would like to use it. Linus 
>>> laptop issue is actually one of the good reasons why we would like to 
>>> keep hda-dsp configuration functional
>>
>> We have to agree on what 'maintained' means then.
>>
>> I don't mind leaving the Skylake driver in the kernel and letting 
>> people who have access to Intel support use it. Cezary is listed as 
>> the maintainer as I suggested it, and this patch provides an necessary 
>> fix.
>>
>> But does this mean this Hdaudio option is usable by distributions and 
>> Linux users who don't have access to Intel support?
>>
>> I will assert that it's not, based on my own experience only 2 weeks 
>> ago. I tried to make audio work on a KBL NUC and had to comment stuff 
>> out due to an obsolete topology. see 
>> https://github.com/thesofproject/linux/pull/1667#issuecomment-572312157
> That is exactly the reason why we would like to update the Skylake 
> driver upstream code and it configuration files so that it will be 
> usable by the community and not only keep it functional internally. As 
> it was clarified by Cezary, we would like to make a minimum number of 
> changes that are required.
> 
> Is there Pierre any non-technical reason why we should not fix the 
> Skylake driver code on the upstream?

My comment was only regarding support of HDaudio codecs w/ the Skylake 
driver. I personally gave up trying to support this option after 1.5 yrs 
of recurring issues. It will take a lot more than minimal patches I am 
afraid if you want this option to work across all known commercial 
devices, you will have to address race conditions such as the probe 
failing when DRM is built as a module, or on specific SKL/APL devices.

If you are signing-up to do this work I have no objections, and if in 
addition you add support for DMICs you'd solve existing issues with 
KBL/AmberLake for which users are left without a solution.

Just be aware of what you are signing up for, it's not a 'minimal' effort.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
