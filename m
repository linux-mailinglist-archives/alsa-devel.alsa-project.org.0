Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D26D41B45BE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 15:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63BD116B5;
	Wed, 22 Apr 2020 15:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63BD116B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587560493;
	bh=90V6KBKYjT3rTJ8mhPB53Iqgjvj2NL3thp2qeNj2sBw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D1EUKnxZsrxAqujnSzcefv2ypwC1iIed4t8iZCnXWYowB8gudU0VA+B/4goEmrRyy
	 d28+i+3Hhg6blQV4WmRyAZbo5gwvklJgVbiOA7ld7BKeqNCuq7Wn/ftB76Dp10lrcg
	 tdigNtLgTjGzhAgUAahvGIeqOJkZnDu+4cSAZOlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AA35F80142;
	Wed, 22 Apr 2020 14:59:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2018F801D9; Wed, 22 Apr 2020 14:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4D40F800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 14:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4D40F800FF
IronPort-SDR: CIXyfiX6TtNwlgvnY+acorR1kJQFecNjbOC0B1Z8aZbiCp5oQOLJ0fTGJWpe1SMfW1CGJkQPh9
 RIX+oUY2YVbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 05:59:38 -0700
IronPort-SDR: l+Z0xxLDTRnRxJtK0ztiV/q54ivyUk/hcVoDctmmTiKNDDmOX1mLf/DAiDwoMhhnraA8329bd7
 K+M1iTXYqTpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; d="scan'208";a="259060745"
Received: from lokoro-mobl.amr.corp.intel.com (HELO [10.251.147.75])
 ([10.251.147.75])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 05:59:38 -0700
Subject: Re: [PATCH] ASoC: SOF: Fix build
To: Mark Brown <broonie@kernel.org>
References: <20200422112602.13109-1-broonie@kernel.org>
 <2c307fac-077e-6692-a57a-2c2084a4742f@linux.intel.com>
 <20200422125145.GE4898@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <276595db-6a14-d4c4-8490-33a0b06b241b@linux.intel.com>
Date: Wed, 22 Apr 2020 07:59:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422125145.GE4898@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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



On 4/22/20 7:51 AM, Mark Brown wrote:
> On Wed, Apr 22, 2020 at 07:11:26AM -0500, Pierre-Louis Bossart wrote:
>> On 4/22/20 6:26 AM, Mark Brown wrote:
> 
>>> The recent batch of SOF changes failed to build on some x86
>>> configurations including an allmodconfig, revert the commits:
> 
>> Not sure what happened here, these patches were held for a rather long time
>> in the SOF tree, I haven't seen any kbuild report or email on this?
> 
> This was reported by Stephen:
> 
>     https://lore.kernel.org/linux-next/20200421121130.44423958@canb.auug.org.au/
> 
> with you in CC and the failures have been visible on kernelci.
> 
>> We'll fix 'this' but if there's a pointer on what configurations failed that
>> would be nice to know.
> 
> As the above and Stephen's report said it shows up in allmodconfig,
> that's the one I tested.  I'm guessing it should show up in most
> configurations where that code gets built.

Gah, yes, I missed this report. I still don't get how this error went 
undetected for weeks on the SOF side, will look into this.
We'll resubmit the whole thing.
