Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AB11E22
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 17:44:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D83C1801;
	Thu,  2 May 2019 17:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D83C1801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556811863;
	bh=roQrx6uCSEUvUmpQo9hGPjhhwdgcmAb+D8KNtsnfcek=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4wTfFUVRVZn7w9n8/11D/Kgj6n7HKZUf70U0aamYLxTgGvPLWwi2Ef2V7UNVo4Jr
	 g11VIm35dfcEifwBUFhIRDP5Q0/uTelFuVthwIKGr5y+9Dhs5NINQn5F+olwBoiCL8
	 pjocvy0+F/CdffiwzJ6P8u7HhWgMPRKI5R3XmWWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A511F896C7;
	Thu,  2 May 2019 17:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB963F896C7; Thu,  2 May 2019 17:42:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9698AF89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 17:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9698AF89693
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 08:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; d="scan'208";a="320871714"
Received: from sfloyd-t480s.amr.corp.intel.com (HELO [10.251.147.239])
 ([10.251.147.239])
 by orsmga005.jf.intel.com with ESMTP; 02 May 2019 08:42:30 -0700
To: Greg KH <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
 <20190502151933.GA32285@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7929c54b-2b00-cbc3-4aa7-6966b0bf2259@linux.intel.com>
Date: Thu, 2 May 2019 10:42:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502151933.GA32285@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Sanyog Kale <sanyog.r.kale@intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: Re: [alsa-devel] [PATCH 00/14] soundwire: more code cleanups
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



On 5/2/19 10:19 AM, Greg KH wrote:
> On Thu, May 02, 2019 at 04:29:16PM +0530, Vinod Koul wrote:
>> After applying cleanup from Pierre, I realized few more things can be
>> cleaned up as well, so fixing these instance in the subsystem.
>>
>> Looks like bool is no longer encouraged, but I have skipped those and few
>> alignment as they caused code to look worse.
>>
>> Greg,
>> if you are okay I would like to add this as well (i know it is late, but
>> they are cosmetic changes and no logic ones, let me know and I can
>> send a updated PR)
> 
> This made no sense, as it was on top of Pierre's patches.
> 
> I've applied both his, and your, patch series to the tree now, hopefully
> this type of mess doesn't happen again in the future.
> 
> Please be a lot more specific as to what you expect me to do with a
> patch series, and what exactly it is for/against/after, as this was not
> obvious at all.
> 
> ugh, someone owes me a drink...
> 
> greg k-h

I'll be glad to buy a round at the next ELC.

I also boiled initially when I saw the Kconfig patch until I realized it 
was a different patch. Same for the SPDX files. It wasn't obvious from a 
quick review and I could have been the one sending a nasty email.

There are additional cleanups from Vinod that I saw but didn't fix as I 
wasn't sure they made the code readable (e.g. dev_dbg logs exceeding 80 
chars and newlines after loops), but I also missed others that are very 
much needed, so please add my Rvb tag for this 'more code cleanups' series.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thank you Vinod for the additional work. I am almost done with the 
sysfs/debugfs cleanups and should post that next week.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
