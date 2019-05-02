Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB3B11BE0
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 16:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84F1417B9;
	Thu,  2 May 2019 16:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84F1417B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556809059;
	bh=01UcPp/lALblXoPJWetaxAheE+mrhrn3JtPjBVHBkiI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jqL2HhuGcX0W8Q9+3/rCmJJejsfDmtwVeaiTDjOUeaamT6dO2R4eKOJ65QWCc8HB6
	 ivrgTZTAL++uDGHU3RKCTqdgJ1O9cZGcoPKLxoizISbi3y4IMSGb/FcjvJju1edjSs
	 5WRQZMW0TlyqPHMrhKzdNq8yrgHSuCECJFQE+u88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03CC7F896AA;
	Thu,  2 May 2019 16:55:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8AD7F896C7; Thu,  2 May 2019 16:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0806CF89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 16:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0806CF89693
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 07:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; d="scan'208";a="320858498"
Received: from sfloyd-t480s.amr.corp.intel.com (HELO [10.251.147.239])
 ([10.251.147.239])
 by orsmga005.jf.intel.com with ESMTP; 02 May 2019 07:55:43 -0700
To: Greg KH <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501155745.21806-23-pierre-louis.bossart@linux.intel.com>
 <20190502053746.GE3845@vkoul-mobl.Dlink> <20190502063219.GB14347@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5e81b8ff-b5e0-47a0-8bb9-d63e7532bf14@linux.intel.com>
Date: Thu, 2 May 2019 09:55:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502063219.GB14347@kroah.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 22/22] soundwire: add missing newlines
 in dynamic debug logs
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



On 5/2/19 1:32 AM, Greg KH wrote:
> On Thu, May 02, 2019 at 11:07:46AM +0530, Vinod Koul wrote:
>> On 01-05-19, 10:57, Pierre-Louis Bossart wrote:
>>> For some reason the newlines are not used everywhere. Fix as needed.
>>>
>>> Reported-by: Joe Perches <joe@perches.com>
>>> Reviewed-by: Takashi Iwai <tiwai@suse.de>
>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> ---
>>>   drivers/soundwire/bus.c            |  74 +++++++++----------
>>>   drivers/soundwire/cadence_master.c |  12 ++--
>>>   drivers/soundwire/intel.c          |  12 ++--
>>>   drivers/soundwire/stream.c         | 110 ++++++++++++++---------------
>>
>> Sorry this needs to be split up. I think bus.c and stream.c should go
>> in patch with cadence_master.c and intel.c in different ones
> 
> Again, _way_ too picky.  You can't look a gift horse _too_ closely in
> the mouth...
> 
> greg k-h

Vinod, your distinction between subsystem and driver is quite arbitrary 
and borderline unreasonable. I would counter that the Intel parts have 
actually nothing to do in this drivers/soundwire directory and should be 
moved to the SOF tree if you push your own logic one step. There already 
known variations on capabilities and number of links which would be 
better handled in sound/soc/sof/intel, just like SoundWire slaves are 
expected to be in sound/soc/codecs.

Besides this fixes *newlines*...

I will send an update but I am not happy about the directions here.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
