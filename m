Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD739BE14
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 15:53:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30781662;
	Sat, 24 Aug 2019 15:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30781662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566654815;
	bh=6NLASa2v+zRMFhDQ9X5+CIGsQSpVp9KMm4tlf0nPcDk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iad6e/SM2s1yGuLVS0DkI49Ona1jxGzjliIm4U96/L3V5huDoBIL+LEIJNJ8ifIyc
	 LFXE49+U06s2Ah+IpYTe/uexH0EDjdA3Aob/BdSfvwAOr80T2x3gx+A5LVU1+wi/8F
	 nyNCnqctjJf9hNxOP/xVOYGacqeDiU0u5NmBVLls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79830F8036E;
	Sat, 24 Aug 2019 15:51:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01FA1F8036E; Sat, 24 Aug 2019 15:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 957D7F8014A
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 15:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 957D7F8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2019 06:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,425,1559545200"; d="scan'208";a="180940982"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.200])
 ([10.252.26.200])
 by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2019 06:51:35 -0700
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <a08b2547-3fe5-5c48-9513-c5ade151c01e@linux.intel.com>
 <50932a9f-2f3e-c150-77c7-f021f84ed4d1@intel.com>
 <20190823102652.GM23391@sirena.co.uk>
 <c845fda4-c18d-2ca8-7337-6e6af74d239c@intel.com>
 <70222fac-8c4e-5ceb-3c49-7020196b59df@linux.intel.com>
 <2e2a34b8-2451-01f6-79a1-14f06d1ed059@intel.com>
 <9dfd3a96-f286-34d6-fe57-9b6b8740e424@linux.intel.com>
 <20190823213920.GW23391@sirena.co.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <57196fe6-9291-5518-9fb6-731b9b5c27ed@intel.com>
Date: Sat, 24 Aug 2019 15:51:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823213920.GW23391@sirena.co.uk>
Content-Language: en-US
Cc: "Wasko, Michal" <michal.wasko@intel.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>
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

On 2019-08-23 23:39, Mark Brown wrote:
> On Fri, Aug 23, 2019 at 03:12:18PM -0500, Pierre-Louis Bossart wrote:
>> On 8/23/19 1:44 PM, Cezary Rojewski wrote:
> 
>>> Wasn't lying about FW version being unreliable. Let's say vendor
>>> receives quick FW drop with new RCR.. such eng drop may carry invalid
>>> numbers such as 0.0.0.0..
>>> In general, I try to avoid relying on FW version whenever possible. It
>>> can be dumped for debug reasons, true, but to be relied on? Not really.
> 
>> Goodness, that's really bad. I didn't realize this.
> 
> At a previous employer I modified our build stamping
> infrastructure to also include both a timestamp and a serialized
> build number in the version number since one of my colleagues was
> fond of sending people prereleases of what he was working on to
> other people with identical version numbers on different
> binaries leading to much confusion and checksumming.  You do see
> a lot of things with those serialized version numbers, especially
> SVN based projects.
> 
>>> Personally, I'm against all hardcodes and would simply recommend all
>>> user to redirect their symlinks when they do switch kernel - along with
>>> dumping warning/ error message in dmesg. Hardcodes bring problems with
>>> forward compatibility and that's why host should offload them away to
>>> FW.
> 
>> Cezary, I know you are not responsible for all this, but at this point if we
>> (Intel) can't guarantee any sort of interoperability with both firmware and
>> topology we should make it clear that this driver is not recommended unless
>> specific versions of the firmware/topology are used, and as a consequence
>> the typical client distros and desktop/laptop users should use HDaudio
>> legacy or SOF (for DMICs)
> 
> Not the most elegent solution but I'm wondering if keeping a copy
> of the driver as is around and using new locations for the fixed
> firmware might be the safest way to handle this.  We could have a
> wrapper which tries to load the newer firmware and uses the fixed
> driver code if that's there, otherwise tries the old driver with
> the existing firmware paths.  This is obviously a horror show and
> leaves the old code sitting there but given the mistakes that
> have been made the whole situation looks like a house of cards.
> 

Thanks for the feedback Mark. While I'm not yet on the "SOF will fix 
this" train, I'm keen to agree to leaving this entirely to SOF if it 
comes down to us duplicating /skylake.

However, we are not going to give up that easily. I'll see if some 
"golden config" hardcodes can't be provided in some legacy.c file which 
would be fetched if initial setup fails. E.g.: 2cores, 3ssps, 1PAGE_SIZE 
per trace buffer.. and such. There are quite a few factors to take into 
consideration though. If "asking" user via dmesg to upgrade the firmware 
if his/her setup contains obsolete binary is really not an option, then 
some magic words got to be involved.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
