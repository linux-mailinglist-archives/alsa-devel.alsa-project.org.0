Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5217E89
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 18:53:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 416E01ABE;
	Wed,  8 May 2019 18:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 416E01ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557334399;
	bh=wO+cyi5lki/dpZsxPIXmKA1kkvs8XWKTd8TwNOMuPhs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dj56125inCk5+feSE1Fve5P8Db16xiI68oevvubO8LzqJ14MeLKZaPSzID4VRUIco
	 t1gbGkEoQZFxbS47O1nlCgRFQPw5RhpEgYFejaRqSGmOfpmEeK5aZNMVxQh7/tVwlm
	 H7Vfiv5qja7DBbUT/fTn/ZzJOdLf69EtTigPzYxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6201F896FD;
	Wed,  8 May 2019 18:51:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46624F896F0; Wed,  8 May 2019 18:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 282A8F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 18:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 282A8F8075E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 09:51:26 -0700
X-ExtLoop1: 1
Received: from mayalewx-mobl1.amr.corp.intel.com (HELO [10.255.230.159])
 ([10.255.230.159])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 09:51:24 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-3-pierre-louis.bossart@linux.intel.com>
 <20190504065444.GC9770@kroah.com>
 <c675ea60-5bfa-2475-8878-c589b8d20b32@linux.intel.com>
 <20190506151953.GA13178@kroah.com> <20190506162208.GI3845@vkoul-mobl.Dlink>
 <be72bbb1-b51f-8201-fdff-958836ed94d1@linux.intel.com>
 <20190507051959.GC16052@vkoul-mobl>
 <fde9c4cd-518b-cb67-5b05-1608c9d029e4@linux.intel.com>
 <20190508074009.GU16052@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9b61fd6f-69a1-ff70-a652-b45654f5dd96@linux.intel.com>
Date: Wed, 8 May 2019 11:51:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508074009.GU16052@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 2/7] soundwire: add Slave sysfs support
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


>>>> Vinod, the question was not for dp0 and dpN, it's fine to have
>>>> subdirectories there, but rather why we need separate devices for the master
>>>> and slave properties.
>>>
>>> Slave does not have a separate device. IIRC the properties for Slave are
>>> in /sys/bus/soundwire/device/<slave>/...
>>
>> I am not sure this is correct
>>
>> ACPI defines the slaves devices under
>> /sys/bus/acpi/PRP0001, e.g.
> 
> Yes the bus will create 'soundwire slave' device type (In acpi case
> created from ACPI walk) and we do link the ACPI as the firmware node.
> This is 'not' created for properties but for soundwire representation of
> slave devices. This is the one code driver attaches to.
>   
>> /sys/bus/acpi/devices/PRP00001:00/device:17# ls
> 
> Yes this would the companion ACPI device

I see, I must admit I missed this part.

I guess it's not technically broken but was is really necessary though 
to use this notion of companion ACPI device? For the controller it makes 
sense, that's how to match ACPI and PCI, but since Soundwire slaves are 
not fully enumerable, precisely why we need all these _DSD properties, 
couldn't we just use ACPI devices directly?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
