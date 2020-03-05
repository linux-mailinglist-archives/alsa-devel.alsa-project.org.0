Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4617ADE3
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 19:10:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10E281607;
	Thu,  5 Mar 2020 19:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10E281607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583431853;
	bh=3gRa+yMPzpeeeRDx9BUrmpxtlWofx0SWv2fiAJWzFSU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GoaNwqg9bvNY5VSKDGWrJQ7Mo5Fx2vk1SqKl7xZZToJeErpYfnp4h/7m/0KsPFEYb
	 v7bJR6aj/PYnfxB2mpArZy8ld6QWLlBK/WcL4gEt7ryBTAY5kqsNik9jNDcD9QStMT
	 POOQCF+rapdCBRJZ/rWYsWe5EkDTDtkXnPbqYxHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4CA9F80245;
	Thu,  5 Mar 2020 19:09:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88685F8025F; Thu,  5 Mar 2020 19:09:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12F94F800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 19:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F94F800D8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 10:08:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="387576939"
Received: from vheang-mobl1.amr.corp.intel.com (HELO [10.254.189.4])
 ([10.254.189.4])
 by orsmga004.jf.intel.com with ESMTP; 05 Mar 2020 10:08:58 -0800
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
To: Mark Brown <broonie@kernel.org>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
 <20200305135908.GF4046@sirena.org.uk>
 <c1419cb1-c1d6-897d-05a4-48e57a3e15db@linux.intel.com>
 <20200305174324.GH4046@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7c52ff6f-76ef-7c55-65e6-9c0437bb983a@linux.intel.com>
Date: Thu, 5 Mar 2020 12:08:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305174324.GH4046@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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



On 3/5/20 11:43 AM, Mark Brown wrote:
> On Thu, Mar 05, 2020 at 08:51:03AM -0600, Pierre-Louis Bossart wrote:
> 
>>> This doesn't answer the question: why is the machine driver not
>>> requesting the GPIO on device model probe?
> 
>> I *think* it's due to the need to use the codec component->dev, which is
>> only available with the dailink callbacks - not on platform device probe
>> which ends with the card registration.
> 
> Why do you have this need?  This is sounding a lot like the CODEC ought
> to be requesting it...

it's been that way since 2016 and the initial contribution. The Chrome 
folks might know more, I don't think anyone at Intel has worked on this 
code.

>>> So you've removed the driver which will have unbound the device but devm
>>> actions don't seem to have fired?  That seems worrying...
> 
>> Well, the devm uses the component device, not the card device, so when
>> removing the machine driver nothing should happen. The problem seems to be
>> in the removal of the codec and component drivers.
> 
> Right, it's always a bad idea to do allocations with devm_ on a device
> other than the one that you're currently working with - that clearly
> leads to lifetime issues.

that's precisely what I tried to correct.

>> We tried to use the card device instead but then the gpiod_get fails.
> 
> I think you need to take a step back and work out what you're actually
> doing here.  It doesn't sound like the problem has been fully understood
> so there's no clear articulation of what you're trying to do.

Can we split this RFC in two:
a) do you have any objections to adding an .exit() callback? That's what 
the main goal was

b) do you have any objections if we remove this devm_ use without trying 
to dig further into the gpio management. This is a 2015 product that we 
use to verify the SOF driver on Broadwell, not an Intel-owned device.

