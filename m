Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099E43E48F8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 17:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FEF852;
	Mon,  9 Aug 2021 17:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FEF852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628523460;
	bh=Ul8U5Q5qokvySYpt/8vNtUu0g5G6kfwAV3795wPIyCc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ftoaSzFSknw7XIk9Zm/cHdhWOkl3rmJvKXfWGKIZN9n6PXXbOE6Yh0/HiRlcysPTt
	 CcY7yRiRQVArEOI5i8T/0TUydn+iGM41dGT9EPZBOo2k6HuVhEk/LlYYQgR5Qgf5jr
	 uvcspbkPsMlfXXJzyIq+eftMNdPgLsaGMLqaJOT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA4F9F8032D;
	Mon,  9 Aug 2021 17:36:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64B82F802D2; Mon,  9 Aug 2021 17:36:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 039EAF800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 17:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 039EAF800FD
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="194309997"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="194309997"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 08:36:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="505287039"
Received: from jsmalone-mobl1.amr.corp.intel.com (HELO [10.212.48.42])
 ([10.212.48.42])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 08:36:01 -0700
Subject: Re: [PATCH] soundwire: intel: trap TRIGGER_SUSPEND in .trigger
 callback
To: Takashi Iwai <tiwai@suse.de>
References: <20210727053256.29949-1-yung-chuan.liao@linux.intel.com>
 <s5h8s1sfevg.wl-tiwai@suse.de>
 <a25d47a6-2599-7101-cd93-e5304b271948@linux.intel.com>
 <YQd2BM3wGzKpfZn1@matsya> <s5hpmuwz98o.wl-tiwai@suse.de>
 <YQeQxj7Ejh14jIoc@matsya>
 <DM6PR11MB4074EF8726AA5ED297871225FFEF9@DM6PR11MB4074.namprd11.prod.outlook.com>
 <9ef7e341-13f4-69f7-964d-8e6efdd57ca7@linux.intel.com>
 <YQ07BVDyPD1Vb4R8@matsya>
 <a40644ba-bee7-0fc2-93e5-b1746ecda938@linux.intel.com>
 <YRCozWNtypjnTp0b@matsya> <s5hy29bnkqh.wl-tiwai@suse.de>
 <acef4e19-dd85-a079-341b-4b26b45c8efb@linux.intel.com>
 <s5h7dguodn8.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1096a0dc-0c8d-b7e8-bfd3-f157c1b696de@linux.intel.com>
Date: Mon, 9 Aug 2021 10:35:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5h7dguodn8.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, "Liao,
 Bard" <bard.liao@intel.com>
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




>>> Actually, there was one big piece I overlooked.  The whole DPCM BE
>>> operation is *always* tied with FE's.  That is, the nonatomic flag is
>>> completely ignored for BE, but just follows what FE sets up.
>>>
>>> And that's the very confusing point when reviewing the code.  You
>>> cannot know whether it's written for non-atomic context or not.  This
>>> means that it's also error-prone; the code that assumes the operation
>>> in a certain mode might mismatch with the bound FE.
>>>
>>> So, ideally, both FE and BE should set the proper nonatomic flags, and
>>> have a consistency check with WARN_ON() at the run time.
>>
>> Sorry Takashi, I am not following. Are you asking me to add a .nonatomic
>> flag in all the exiting BEs along with a WARN_ON?
>>
>> I can do this, but that's a sure way to trigger massive amounts of
>> user-reported "regression in kernel 5.1x". Is this really what you want?
> 
> That's why I wrote "ideally".  We all know that the world is no
> perfect...  So hardening in that way would be possible, but it has to
> be done carefully if we really go for it, and I'm not asking you to do
> that now.
> 
>> Also I don't understand how this would help with the specific problem
>> raised in this patch: can we yes/no do something 'heavy' in a *DAI*
>> callback? What is the definition of 'heavy'?
> 
> My previous comment wasn't specifically about your patch itself but
> rather arguing a generic problem.  We have no notion or matching
> mechanism of the atomicity of DPCM BE.

I think the only problem is actually on the SoundWire dailinks.

For SSP/DMIC we don't do anything for BE dailinks, there's no IPC or
waits, only some settings/masks. I don't see any need to set the
.nonatomic field in those cases.

But for SoundWire, we do use the 'stream' functions from the BE ops
callbacks - sdw_prepare_stream, sdw_trigger_stream - which will do a
bank switch operation. That's certainly not an atomic operation, there's
a clear wait_for_completion().

That seems like a miss indeed, I'll add a patch to set the .nonatomic
field for these links.

But for this patch proper, does anyone have an objection? I am still not
clear on what is permissible at the DAI level.

>> And last, I am not sure it's always the case that a BE follows the FE
>> configuration. We've had cases of BE->BE loopbacks where the host
>> doesn't see or configured the data.
> 
> Hm, how the trigger and other PCM callbacks for BE get called in that
> mode?


IIRC everything was handled with DAPM, changing pin states would enable
data transfers. Not 100% sure and that's not really relevant anyways,
you did have a point that the SoundWire BEs are not correctly configured.
