Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7655BA96
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 16:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10DD11688;
	Mon, 27 Jun 2022 16:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10DD11688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656341387;
	bh=J/Uyrv9Ml3QuuNq4wbNithLsOoRRJ1NjSYLFb96ze/o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZZDRQCvtrc0dWqzj0W0UmhTnNvX0XdFsAvLCiDwxbrSbdwvsdEoUPPqNl/GBy+fa
	 GHsH055lQQ/Us8dpHGtGFvat9rdaQiY874ZXFBFolqOPKz0vKG2YFrGcl26gbRN93d
	 PI/P47gC0p4+wyGKfL6SeCpKYFYJR1VMHmE2cVJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B6DF8028D;
	Mon, 27 Jun 2022 16:48:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A05CCF8028B; Mon, 27 Jun 2022 16:48:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26DB7F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 16:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26DB7F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mvrSRN1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656341323; x=1687877323;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J/Uyrv9Ml3QuuNq4wbNithLsOoRRJ1NjSYLFb96ze/o=;
 b=mvrSRN1eegZo03Kf7w2ELdk+F7N0S04d/oKvP/0hPcbV5PVBuXlwm+aF
 x6chn80u1/lpyGhE55dlAHPXC3RF3eBCmBQb4+93Vtd8vNyCQQjxvdDhh
 dvo+NwbxT4WyOn0jwrxz33iYspg8U1x3trIrx78kjhp8Em4pEmj2SKaeX
 saCkJwlPUPoK/z1mcsKQLW94DzEZoGU2hzJjW3AXYpyEhDuXdsDOyZVEt
 ++v38ojp0uwJQpobeb5/TrY+EbjDxMYY0woZ8WhJcGXfP8d+f2OFt68fR
 SZ2jaZuJOUN+nWpp8NJBjuR6/SKmXyCXhH4NR0cI2+/IFXADFxGFAu/gj g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="264507427"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="264507427"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 07:48:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="622569939"
Received: from vthayala-mobl.amr.corp.intel.com (HELO [10.209.144.177])
 ([10.209.144.177])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 07:48:30 -0700
Message-ID: <34b54e4e-8997-c2b7-fdf0-24a1b95121ab@linux.intel.com>
Date: Mon, 27 Jun 2022 09:45:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
 <ac2b7d8b-a5be-4fac-169c-eaca185c9746@linux.intel.com>
 <3d9b45c0-b415-21d9-6af5-68fa1001ed17@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3d9b45c0-b415-21d9-6af5-68fa1001ed17@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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



On 6/25/22 03:29, Cezary Rojewski wrote:
> On 2022-06-24 3:52 PM, Pierre-Louis Bossart wrote:
>> On 6/24/22 08:43, Cezary Rojewski wrote:
>>> Address the warning: "Codec: dpcm_be_connect: FE is nonatomic but BE is
>>> not, forcing BE as nonatomic" by marking BE DAI as nonatomic. Aligns
>>> with what is already done for FE DAIs.
>>>
>>> This patchset iterates the change over all HSW and BDW related machine
>>> board drivers.
>>
>> I don't think this is necessary, I was planning to demote this warning
>> to a simple dev_dbg or possibly remove this message entirely.
>>
>> The BE DAIs can perfectly be declared as non-atomic in all Intel machine
>> drivers, except for SoundWire where there's a known delay during the
>> .trigger.
> 
> 
> Hmm.. that's a good feedback. Isn't ASoC's FE<->BE treated as a single
> PCM substream in sound/core/pcm_native.c though? If so, does it even
> make sense for card's BE DAI to be atomic, if it's FE counterpart is
> nonatomic already? Especially if it is specifying platform and cpu_dai
> that matches Intel's components which we know communicate using IPCs.

I guess it depends on the cpu_dai implementation. Not all
implementations implement a delay in the .trigger callback and/or rely
on IPCs.

> Warning is one thing, but will you be also getting rid of the
> if-statement in soc-pcm.c that actually forces nonatomic=1 on BE when FE
> is already declared as such? If the if-statement stays, I believe the
> declaring BE DAIs 'correctly' in the way to go.

I meant just removing the dev_warn() only.

See https://github.com/thesofproject/linux/pull/3723
