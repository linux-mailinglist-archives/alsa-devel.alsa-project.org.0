Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B728038C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 18:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86C301915;
	Thu,  1 Oct 2020 18:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86C301915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601568532;
	bh=RyQSa8gv5F+Vn6Hte26kUUDhRc5BH6OJvkAT15+nNcQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GNO6LicYxOrGRZhTdbSVQHpPauKQY1aBg3xNTqbt3c+nlyOFnEzZxMNLpXpfY2Hv3
	 b88wJ8WewAjFmeQuxEnQiIJFXRUvRj9xJDg0qaPWvjwhlZjazQfyxi2xWqoZYebydg
	 xUzYuKMuKZCyBsXjrfVdTTinZtqjAWwoRcoj+LvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD601F801DB;
	Thu,  1 Oct 2020 18:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33934F801F5; Thu,  1 Oct 2020 18:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CC44F800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 18:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CC44F800AB
IronPort-SDR: yEafFQZt4zTmWqOk0Qd7gb5E3tUc07uwxvnlUUW7fzFajXIlD2lurKt++S5cMnkhO4z91Z+BNm
 1qLFJgRPZhmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="162006762"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="162006762"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:06:53 -0700
IronPort-SDR: DJ5VA135BAfuTG7VM2Lmw4R619B+hql8VxM631KI8yZjDvS0/TiXHuhLrRn6aUr03DgZy9tRTL
 2o4YO4GQPJ1Q==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="416111552"
Received: from myounan-mobl1.amr.corp.intel.com (HELO [10.251.131.17])
 ([10.251.131.17])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:06:50 -0700
Subject: Re: [PATCH 1/6] Add ancillary bus support
To: Greg KH <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110551.GD1939744@kroah.com> <20201001115847.GY816047@nvidia.com>
 <20201001121423.GA2375307@kroah.com> <20201001143334.GA1103926@nvidia.com>
 <20201001143855.GA2398269@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7c2266ea-a310-e097-9088-f08bc9773584@linux.intel.com>
Date: Thu, 1 Oct 2020 11:06:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001143855.GA2398269@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 tiwai@suse.de, ranjani.sridharan@intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Parav Pandit <parav@mellanox.com>
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



On 10/1/20 9:38 AM, Greg KH wrote:
> On Thu, Oct 01, 2020 at 11:33:34AM -0300, Jason Gunthorpe wrote:
>> On Thu, Oct 01, 2020 at 02:14:23PM +0200, Greg KH wrote:
>>> On Thu, Oct 01, 2020 at 08:58:47AM -0300, Jason Gunthorpe wrote:
>>>> On Thu, Oct 01, 2020 at 01:05:51PM +0200, Greg KH wrote:
>>>>   
>>>>> You have to be _VERY_ careful after calling
>>>>> ancillary_device_initialize(), as now you can not just free up the
>>>>> memory if something goes wrong before ancillary_device_add() is called,
>>>>> right?
>>>>
>>>> I've looked at way too many versions of this patch and related. This
>>>> is the only one so far that I didn't find various bugs on the error
>>>> cases.
>>>
>>> But you haven't seen the callers of this function.  Without this
>>> documented, you will have problems.
>>
>> I've seen the Intel irdma, both versions of the SOF stuff and an
>> internal mlx5 patch..
>>
>> Look at the SOF example, it has perfectly paired error unwinds. Each
>> function has unwind that cleans up exactly what it creates. Every
>> 'free' unwind is paired with an 'alloc' in the same function. Simple.
>> Easy to audit. Easy to correctly enhance down the road.
>>
>> This is the common kernel goto error design pattern.
> 
> But that's where people get this wrong.  Once device_initialize() is
> called, the "free" can not be called, something else must be,
> device_put().
> 
> Tricky, yes.  Messy, yes.  Sorry.
> 
>>> Why is this two-step process even needed here?
>>
>> Initializing the refcount close to the allocation is a common design
>> pattern as is initializing it close to registration. Both options are
>> tricky, both have various common subtle bugs, both have awkward
>> elements.
>>
>> At the end of the day, after something like 20 iterations, this is the
>> first series that actually doesn't have error unwind bugs.
>>
>> Can we empower Dave to make this choice? It is not like it is wild or
>> weird, the driver core already exposes _initialize and _add functions
>> that work in exactly the same way.
> 
> Sure, but without a real user that _NEEDS_ this two-step process, let's
> not include it.  Why bake complexity into the system from the start that
> is never used?
> 
> Iteration and evolution is fine, it's not like this is going to be
> set-in-stone for forever.

We initially had a single ancillary_device_register(). At some point, 
there was an ask to simplify the error handling by moving some of it to 
the caller, and an ask to let the IDAs be managed at the parent level to 
avoid possible discontinuities in the numbers allocated.

Both changes made it hard to deal with errors flow on the caller side. 
As you describe it above, we had to either free memory if the error 
happened before device_initialize() was called (e.g. missing .release 
callback, etc), or use put_device() afterwards.

Splitting the two appeared to be the only way to make sure the resources 
are released in the right way, with a single function we had several 
cases where the caller couldn't figure out whether to free memory or 
call put_device().

