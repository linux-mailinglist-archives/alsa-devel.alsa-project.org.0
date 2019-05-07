Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96791165F8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 16:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E73F17D0;
	Tue,  7 May 2019 16:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E73F17D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557240312;
	bh=+QIWFG1Q5iNRBeWZ+lVJCr7UZCyHHj2gHi0raWin50w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPvNpP2nMUcNkXTtPDNxa/xqjxA5th3etlaa3WZu1y8EjijfiM0bG59mQSx+LTapH
	 0FCCkejHmEW4BVk7jAKekpPn3HtwDoJ/4tEzfM8l16erQi8tQSDV95dYmQwH8UvkFS
	 Y9PcS08mD17PRCGN5r1RDNS+lzDsdGW5Blo/U8mQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F6A9F89678;
	Tue,  7 May 2019 16:43:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 633F6F89674; Tue,  7 May 2019 16:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76700F807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 16:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76700F807B5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 07:43:17 -0700
X-ExtLoop1: 1
Received: from asakoono-mobl.gar.corp.intel.com (HELO [10.251.159.132])
 ([10.251.159.132])
 by fmsmga005.fm.intel.com with ESMTP; 07 May 2019 07:43:15 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
 <20190504002926.28815-2-pierre-louis.bossart@linux.intel.com>
 <20190507122651.GO16052@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <47fd3ca6-6910-f101-9b63-f653cd1443f9@linux.intel.com>
Date: Tue, 7 May 2019 09:43:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507122651.GO16052@vkoul-mobl>
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



On 5/7/19 7:26 AM, Vinod Koul wrote:
> On 03-05-19, 19:29, Pierre-Louis Bossart wrote:
>> The convention is that the SoundWire controller device is a child of
>> the HDAudio controller. However there can be more than one child
>> exposed in the DSDT table, and the current namespace walk returns the
>> last device.
>>
>> Add a filter and terminate early when a valid _ADR is provided,
>> otherwise keep iterating to find the next child.
> 
> So what are the other devices in DSDT here..

this is what I see:

Scope (HDAS)
         {
             Device (IDA)
             {
                 Name (_ADR, 0x00020001)  // _ADR: Address
             }
         }

I thought this was nonsense but your question triggered me to look into 
the Intel SST ACPI specs (not public I am afraid but shared with the OS 
who shall not be named).
Using the same source of information as below, I *believe* this is 
HDaudio related, bits 31..16 mean HDaudio with codec SDI 2, and NodeId 1 
for the function group. This would make sense as I believe there are two 
codecs on the board that can be pin-strapped to boot either in HDaudio 
or SoundWire mode- but this is a conjecture only.

At any rate, we need a hardware rework and mutual exclusion between 
HDaudio and SoundWire, so we have to ignore this one when SoundWire is 
enabled.

>> +
>> +	/*
>> +	 * On some Intel platforms, multiple children of the HDAS
>> +	 * device can be found, but only one of them is the SoundWire
>> +	 * controller. The SNDW device is always exposed with
>> +	 * Name(_ADR, 0x40000000) so filter accordingly
>> +	 */
>> +	if (adr != 0x40000000)
> 
> I do not recall if 4 corresponds to the links you have or soundwire
> device type, is this number documented somewhere is HDA specs?

I thought it was a magic number, but I did check and for once it's 
documented and the values match the spec :-)
I see in the ACPI docs bits 31..28 set to 4 indicate a SoundWire Link 
Type and bits 3..0 indicate the SoundWire controller instance, the rest 
is reserved to zero.

> 
> Also it might good to create a define for this

I will respin this one to add the documentation above, and only filter 
on the 4 ms-bits. Thanks for forcing me to RTFM :-)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
