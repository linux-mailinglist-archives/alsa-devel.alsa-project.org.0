Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A529AD87
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 12:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4982C166E;
	Fri, 23 Aug 2019 12:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4982C166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566557156;
	bh=El/e5TmrgyDaycrfpTKCgRk1vShRGmU049kzf6r5Inc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TT5DkI1V9SkD2nDuZsIRcl2hXSn5Mu/9g3P+GDxcwB/Xqjz48CyONUYMoryKIvgkS
	 uBOxWDKpUndLtWeUEZieSu4B422GVWWbIzO1dhPnqUNr42bUkYp8zIGjDEoT1NnVyL
	 WNDDOm5mYpAlMY1vh4kCMoJ/DglqomDo+0lR+gT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59BC3F80147;
	Fri, 23 Aug 2019 12:44:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 662E3F80147; Fri, 23 Aug 2019 12:44:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7407F80147
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 12:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7407F80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 03:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="181686463"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga003.jf.intel.com with ESMTP; 23 Aug 2019 03:43:58 -0700
To: Mark Brown <broonie@kernel.org>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <a08b2547-3fe5-5c48-9513-c5ade151c01e@linux.intel.com>
 <50932a9f-2f3e-c150-77c7-f021f84ed4d1@intel.com>
 <20190823102652.GM23391@sirena.co.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <c845fda4-c18d-2ca8-7337-6e6af74d239c@intel.com>
Date: Fri, 23 Aug 2019 12:43:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823102652.GM23391@sirena.co.uk>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, lgirdwood@gmail.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Wasko,
 Michal" <michal.wasko@intel.com>
Subject: Re: [alsa-devel] [PATCH 00/35] ASoC: Intel: Clenaup SST
 initialization
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

On 2019-08-23 12:26, Mark Brown wrote:
> On Fri, Aug 23, 2019 at 10:29:59AM +0200, Cezary Rojewski wrote:
>> On 2019-08-22 22:55, Pierre-Louis Bossart wrote:
>>> On 8/22/19 2:03 PM, Cezary Rojewski wrote:
> 
>>>> Code seen here is part of new Skylake fundament, located at the very
>>>> bottom of internal mainline. Said mainline is tested constantly on at
>>>> least sigle platform from every cAVS bucket (description below). This
>>>> week, BDW has been added to the CI family and was essential in
>>>> validating legacy changes. Baytrail platform is still missing. Changes
>>>> for BYT directly mirror HSW/ BDW but due to current lack of platform
>>>> were untested.
>>>> Boards engaged in testing: rt286, rt298, rt274.
> 
>>> this is not enough, sorry. these are RVPs and you need to check with
>>> commercial devices supported in sound/soc/intel/boards/.
> 
>> What machine board has to do with FW and host side? If it has, we better
>> notify the owner so he can fix codec's code at once. All boards MUST follow
>> recommended protocol whether its HDA or I2S in communicating with /skylake.
>> This is hardware IP we taking about. I could as well test all platforms with
>> AudioPrecision and say: shipit.
> 
> ...
> 
>> DSP "commercial devices" with 99% of home audio being routed through
>> HD-Audio legacy? I do contact representatives of "commercial devices" daily,
>> you of all should be aware of fact that in almost all cases they are fed
>> neither with upstream code nor upstream binaries.
>> For the first time since eons sound/soc/intel/skylake code is tested before
>> upstreaming, yet you still defend the mistakes of the past?
> 
> System vendors don't really matter here, end users with their
> desktops and laptops do.  If a user has a system and they for
> whatever reason upgrade their kernel from one upstream version to
> another and don't touch any other aspect of their system the
> expectation is that they'll still have everything working after
> the upgrade.  This means that if there's bugs in how things were
> deployed in the past the kernel ought to try to work with those
> bugs.
> 

Noted, see below comments.

>>>> Some upstream FW binaries are not compatible with existing /skylake
>>>> driver while changes found here (HARDWARE_CONFIG/ FIRMWARE_CONFIG) make
>>>> use of firmware ability to offload hardware-specifics away from driver.
>>>> These and more are core part of any cAVS design and are to be
>>>> implemented and used by host. This too is missing on Linux upstream.
> 
> This sounds like it might be a problem.
> 

Problem is, HARDWARE/ FIRMWARE_CONFIG (and more upcoming) should be the 
core part of cAVS driver, implemented before any PCM related code is added.

>>>> SKL FW binary existing on upstream is a descendant of old spt branch,
>>>> obsoleted for 4-5 years now. That FW is a stub, quickly replaced by
>>>> kbl which is to be used on all 1.5 cAVS platforms.
> 
> That's well within the lifespan people will expect from a PC
> these days, my personal systems are mostly older than that and
> do fine at most things except for big builds.
> 

It's not about age itself. It's about the fact that FW binaries from 
non-supported or main FW branches ended here and given the date these 
have been added, it has already been recommended to make use of kbl or 
apl_auto branches.

>> If I could, I'd rather prefer the "detect and notify" as it is impossible to
>> repair all the mistakes made in /sound/soc/intel/skylake.
> 
> Do we have a sense of how many such systems exist?
> 
>> However, in practice there isn't any reliable way to verify the actual
>> usability of old FW binary against host site as the interface is volatile
>> and numbers alone don't mean much.
>> Patch with FW binaries would not remove old ones, simply add new versions to
>> the directory.
> 
> Can you do things the other way around and positively identify
> firmwares that meet whatever standards you're interested in here?
> 

The only thing that comes to my mind is the following:
- during boot up sequence, in response to any INVALID_REQUEST or such 
coming from FW, collapse and dump: "upgrade firmware" message

- once boot up sequence is completed, disregard INVALID_REQUEST check as 
it is also the common response of FW in various scenarios

- user removes existing sym link from /lib/firmware/intel and creates 
new one, pointing to updated FW binary that should also be present in 
/lib/firmware/intel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
