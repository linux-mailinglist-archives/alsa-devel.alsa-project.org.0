Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E285FB7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 12:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B2F1661;
	Thu,  8 Aug 2019 12:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B2F1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565260388;
	bh=DtxPTegVuihcG2pDZN8bjDSkNjHDyjqMKqIRdb8fnDk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gFkNwevDd+QRvlULv1IUYP20DcfOHcl8OeCz/GShjfRbElU6hHqFxx6gzf87tbr40
	 FD5C/Vd+2DTxhKte/tFd73KzS7ATh9o2Q7RRNH1OoSCTK2nkMJ8d806MAOpGTWtm16
	 ZeNxjo4ZVF0x09ilHHyhi7LPusAQpOk0MmUsjvFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A65BBF80535;
	Thu,  8 Aug 2019 12:31:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA61F80534; Thu,  8 Aug 2019 12:31:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22D94F800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 12:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22D94F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 03:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="199004264"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2019 03:31:10 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190807134745.1648-1-cezary.rojewski@intel.com>
 <4b0e1051-946b-ea7c-1e09-93e0825e5ac8@linux.intel.com>
 <b03e179d-23f8-ae3e-fcd2-996433e44894@intel.com>
 <9fd54b42-acb0-805c-5e36-5fedd3b5e322@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <1f65d726-dac1-bd3f-d207-8b3ae753bee3@intel.com>
Date: Thu, 8 Aug 2019 12:31:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9fd54b42-acb0-805c-5e36-5fedd3b5e322@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com
Subject: Re: [alsa-devel] [RESEND PATCH v3] ASoC: Intel: Skylake:
 large_config_get overhaul
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

On 2019-08-08 05:30, Pierre-Louis Bossart wrote:
>>>
>>> [1] here you are just saying that the looping is really not required 
>>> so there are no tests at all...
>>>
>>> [4] So shouldn't you split the two parts of this patch and separate 
>>> looping from not touching the data that's vendor-specific?
>>
>> So, looping mainly gets used in _sets_, for _gets_ I've not seen a 
>> live example, really - despite FW supporting such flow. However, I'd 
>> like to verify before adding any looping, possibly by creating a 
>> custom module myself. Followup to your point: existing looping was not 
>> tested either.
> 
> So how about removing this looping first in the existing code and add 
> the needed changes in a second patch? wouldn't that help make the 
> changes more self-contained? A large part of your patch below has 
> indentation differences which make it hard to figure out what the new 
> approach is.

Agreed. Must say, didn't get you at first.
Update v4 has been sent and should do a better job at guiding the reader 
through changes.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
