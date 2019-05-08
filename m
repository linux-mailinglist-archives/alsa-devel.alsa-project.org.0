Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 932D617DFF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 18:22:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8721AA3;
	Wed,  8 May 2019 18:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8721AA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557332528;
	bh=v51AqC4KCWLUBBXjMo1IG5GhAj5CbZ5hUPTgtgE38Ug=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJuMpjUl5VahNcTcL9hDlYblAbx1opTsieiQBJZkHCLXCDkkdR9UlZgS4WjM+LJdt
	 LMKUmYXaO6kUlXRlURNEhWQTZM2Af8bY1WGffALwucfCViqhG3C9m/4V1S9LWPte+/
	 RkTgWa8BQLdAN3o9xfXqBmd3sIxHS4N3/NrFocfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6FEBF896F0;
	Wed,  8 May 2019 18:20:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E746F896F0; Wed,  8 May 2019 18:20:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81465F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 18:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81465F8075E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 09:20:12 -0700
X-ExtLoop1: 1
Received: from mayalewx-mobl1.amr.corp.intel.com (HELO [10.255.230.159])
 ([10.255.230.159])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 09:20:10 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
 <20190504002926.28815-2-pierre-louis.bossart@linux.intel.com>
 <20190507122651.GO16052@vkoul-mobl>
 <47fd3ca6-6910-f101-9b63-f653cd1443f9@linux.intel.com>
 <20190508050853.GT16052@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a6b3f1d1-c815-3c6b-7f35-ac5cc98960b2@linux.intel.com>
Date: Wed, 8 May 2019 11:20:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508050853.GT16052@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/8] soundwire: intel: filter SoundWire
 controller device search
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


>>>> +	/*
>>>> +	 * On some Intel platforms, multiple children of the HDAS
>>>> +	 * device can be found, but only one of them is the SoundWire
>>>> +	 * controller. The SNDW device is always exposed with
>>>> +	 * Name(_ADR, 0x40000000) so filter accordingly
>>>> +	 */
>>>> +	if (adr != 0x40000000)
>>>
>>> I do not recall if 4 corresponds to the links you have or soundwire
>>> device type, is this number documented somewhere is HDA specs?
>>
>> I thought it was a magic number, but I did check and for once it's
>> documented and the values match the spec :-)
>> I see in the ACPI docs bits 31..28 set to 4 indicate a SoundWire Link Type
>> and bits 3..0 indicate the SoundWire controller instance, the rest is
>> reserved to zero.
> 
> So in that case we should mask with bits 31..28 and match, who knows you
> may have multiple controller instances in future

yes, I was planning on only using the link type.

> I had a vague recollection that this was documented in the spec, glad
> that in turned out to be the case.
> 
> Btw was the update to HDA spec made public?

Not that I know of. The previous NHLT public doc has actually 
disappeared from the Intel site and I can't find it any longer, so 
currently the amount of public documentation is trending to zero :-(

> 
>>> Also it might good to create a define for this
>>
>> I will respin this one to add the documentation above, and only filter on
>> the 4 ms-bits. Thanks for forcing me to RTFM :-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
