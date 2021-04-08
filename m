Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274D358693
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 16:14:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23FC71662;
	Thu,  8 Apr 2021 16:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23FC71662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617891284;
	bh=iYJv2jOSp1Dr2BPu1v8ZQb0xyeTDl9s68cVp4+Sk5BY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CrrUzhXIKOhwSyzzL1OZH4ApVrJm2muGkSlzYtQ6xgBMgmTvnHrx0TOG0s7qAaxq1
	 8yNSjq/MxzhQ9S44TFQhM8k1GcTWw611qSoohgItYEoQQJsTvqgr70AbpPxjc2t9N/
	 uoBhOefubvbvpO22SuOnCRX7lBH1zTHxhSMqEJcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C92F80246;
	Thu,  8 Apr 2021 16:13:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8945CF8020B; Thu,  8 Apr 2021 16:13:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 436BDF8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 16:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 436BDF8012F
IronPort-SDR: TdK6UxPy2uJoeSQqS8dkHxlYP9SDMFQUDfomn3B5zWnzDYP7m7sABtshuGd4mj7xN/lR+ze/w+
 94hXxQq+lTtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="191393513"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="191393513"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 07:12:58 -0700
IronPort-SDR: X3kvDasDLX4najNrszK5PWvTArR8vD6MJzEvgmFKvhIkPdb53oDZqZG5Iu54eCHrT3JLp996lL
 DeLuLu61sgAg==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="610098029"
Received: from raltaraw-mobl1.amr.corp.intel.com (HELO [10.212.106.80])
 ([10.212.106.80])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 07:12:58 -0700
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a15ad17a-e86d-50b3-64e2-9c9dd019ff2e@linux.intel.com>
Date: Thu, 8 Apr 2021 09:12:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5hpmz47w3i.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Curtis Malainey <cujomalainey@google.com>,
 ALSA development <alsa-devel@alsa-project.org>
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



On 4/8/21 8:18 AM, Takashi Iwai wrote:
> On Thu, 08 Apr 2021 14:05:02 +0200,
> Mark Brown wrote:
>>
>> On Thu, Apr 08, 2021 at 01:21:52PM +0200, Jaroslav Kysela wrote:
>>
>>> Yes, it's for UCM, but even if we don't consider this purpose, the kernel API
>>> should return some reasonable information rather than very generic (or empty)
>>> strings which are used in the native ALSA utilities for example. So, I think
>>> that we should allow to "fix" this info also from the user space rather than
>>> to extend the existing API.
>>
>> Half the point with UCM was supposed to be to rewrite the control names
>> we get from the devices into standard things that are useful for
>> userspace, having to remap things for UCM doesn't sound right.
> 
> I guess the question here is how to identify the proper profile for a
> certain platform and how to get it passed over the whole system.
> Theoretically, the rename of the card name or mixer name strings could
> be done in user-space side, too (e.g. mapping in alsa-lib or
> whatever), so I don't think it mandatory to make them variable via
> sysfs, if it's meant only for the consistency reason.
> 
> Didn't we discuss in the past about the possibility to store the
> profile name in the card component string?

Here's a summary of an earlier discussion with Jaroslav, based on an 
initial ask from Curtis https://github.com/thesofproject/linux/issues/2766:

When a specific PCI ID is detected, we probe the SOF driver and will 
load a default firmware binary and topology.

Because of OEM or user customization, we will have multiple versions of 
firmware and topology that will have to be enabled in specific setting. 
The last thing we want is hard-coded rules in the kernel on which 
firmware customization to use for which platform.

The suggestion was made to use udev rules to modify the default path for 
the firmware and topology, so that e.g. on a specific Chromebook you 
could load firmware from /lib/firmware/google/<device name>/sof-tplg. 
The same can happen for other OEMs that support Linux distributions such 
as Dell and Lenovo.

If the users wipes the OEM image and installs a standard distribution on 
the same device, they would by default use the firmware generated from 
the SOF main branch, without any differentiation and 3rd party IP.

So the point is: how do we expose this information to UCM? In the 
machine driver where the card is created? There is zero information on 
what the firmware/topology does. The information can only be extracted 
when the topology is loaded when probing the SOF component driver.

I don't think the point was to rewrite the controls but make sure that 
UCM is aware that the card definition was changed by a different 
selection of firmware.

Jaroslav, please correct me if I misunderstood the intent of this patch!
