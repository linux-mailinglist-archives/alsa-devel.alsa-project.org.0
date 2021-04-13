Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B81635E329
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 17:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC4691686;
	Tue, 13 Apr 2021 17:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC4691686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618328998;
	bh=hZqaiAH4DSk5I2tELnvzWlDfxF1iGk33joRBamDrvsY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qh5UzThkQgBQy5CarlCiUK6aSGZFcGiLtBKtdYDy9VY+UFk7+NycGI42kiOt5tJrJ
	 MS5husMc8A1vQVCkxrugGB5QbPvyZEMa9ildwBqJDqXGxbEuyhUsJxZ1Ds32/ikZFq
	 gibmwht7veaikvXvndjTzoRYFchWrXLbSvvh/y6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D10F8022D;
	Tue, 13 Apr 2021 17:48:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61DF8F8022B; Tue, 13 Apr 2021 17:48:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D97F800EB
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 17:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D97F800EB
IronPort-SDR: CrZw0WlFpb4dDGBRN1S89NsU/Y9ECBtgJGbks3p5nqxy+GckR3DyXBcnGjjY6khuhPwnasElrq
 2Dtw0kiEcLuQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="255760529"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="255760529"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 08:47:53 -0700
IronPort-SDR: LK2OLSsjsiHBU0LfKcBf95yfTe7ynkpXltGI5HC8lHIdPRgGwScwZSvvZRZcDAObJXvgdxBJx8
 GAizSA1uYd1A==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="460627823"
Received: from kmartin1-mobl1.amr.corp.intel.com (HELO [10.212.30.204])
 ([10.212.30.204])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 08:47:52 -0700
Subject: Re: [PATCH] ASoC: Intel: Handle device properties with software node
 API
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20210322110638.2681-1-heikki.krogerus@linux.intel.com>
 <786795eb-6832-fd7d-4674-65be394c083d@linux.intel.com>
 <YFm0u9k/DNy5URsR@kuha.fi.intel.com>
 <39e2ab87-3b70-8659-6282-5b03d30f901b@linux.intel.com>
 <YHWMmR5gBvlpd7rl@kuha.fi.intel.com> <YHWlQooPtrTjyq+i@kuha.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4c7aa8d0-8660-b545-4b40-c6965e667a93@linux.intel.com>
Date: Tue, 13 Apr 2021 10:47:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHWlQooPtrTjyq+i@kuha.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 4/13/21 9:05 AM, Heikki Krogerus wrote:
> On Tue, Apr 13, 2021 at 03:20:45PM +0300, Heikki Krogerus wrote:
>> On Mon, Apr 12, 2021 at 03:36:20PM -0500, Pierre-Louis Bossart wrote:
>>> I took the code and split it in two for BYT/CHT (modified to remove devm_)
>>> and SoundWire parts (added as is).
>>>
>>> https://github.com/thesofproject/linux/pull/2810
>>>
>>> Both cases result in a refcount error on device_remove_sof when removing the
>>> platform device. I don't understand the code well enough to figure out what
>>> happens, but it's likely a case of the software node being removed twice?
>>
>> Right. Because you are injecting the node to an already existing
>> device, the node does not get linked with the device in sysfs. That
>> would increment the reference count in a normal case. It all happens
>> in the function software_node_notify(). Driver core calls it when a
>> device is added and also when it's removed. In this case it is only
>> called when it's removed.
>>
>> I think the best way to handle this now is to simply not decrementing
>> the ref count when you add the properties, so don't call
>> fwnode_handle_put() there (but add a comment explaining why you are
>> not calling it).
> 
> No, sorry... That's just too hacky. Let's not do that after all.
> 
> We can also fix this in the software node code. I'm attaching a patch
> that should make it possible to inject the software nodes also
> afterwards safely. This is definitely also not without its problems,
> but we can go with that if it works. Let me know.

I tested manually on bytcr w/ RT5640 and used the SOF CI farm to test 
the SoundWire cases, I don't see any issues with your patch. The 
refcount issue is gone and the module load/unload cycles don't report 
any problems.

Would you queue it for 5.13-rc1, or is this too late already?

>> For a better solution you would call device_reprobe() after you have
>> injected the software node, but before that you need to modify
>> device_reprobe() so it calls device_platform_notify() (which it really
>> should call in any case). But this should probable be done later,
>> separately.
>>
>> thanks,
>>
>> P.S.
>>
>> Have you guys considered the possibility of describing the connections
>> between all these components by using one of the methods that we now
>> have for that in kernel, for example device graph? It can now be
>> used also with software nodes (OF graph and ACPI device graph are of
>> course already fully supported).

I must admit I've never heard of a 'device graph'. Any pointers or APIs 
you can think of?
It's a good comment since we are planning to rework the SOF clients and 
machine driver handling.
