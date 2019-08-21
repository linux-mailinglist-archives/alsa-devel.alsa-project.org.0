Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE54397C01
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 16:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 212FE1664;
	Wed, 21 Aug 2019 16:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 212FE1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566396323;
	bh=+NU7cjCKJTKHHc5oJCLbauM6Phwt3xttejDPvekfOIk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kRkqiB46OO1JmRRJZWKNYCNUFaFIrHHDwQj8qj2HheDfXScghg4wZQQWVDku5CfWA
	 1GG8/pFQ8k6haXzffD7lG0vCi5G4Vvo8aPCGv7gLmo7CuCbA6u+MnE/m95l9+12ntK
	 wdvWLAfZmDwb5qkBAcICzcmoHEFJc/Ia/Z5yBIOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1173FF802FB;
	Wed, 21 Aug 2019 16:03:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84FDEF80306; Wed, 21 Aug 2019 16:03:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D3C5F802E0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 16:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D3C5F802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 07:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="172786398"
Received: from jmillerk-mobl1.amr.corp.intel.com (HELO [10.251.18.166])
 ([10.251.18.166])
 by orsmga008.jf.intel.com with ESMTP; 21 Aug 2019 07:03:27 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
 <20190821090742.GI12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8ec1bed6-af4d-4be1-93b6-273ee27ce5e4@linux.intel.com>
Date: Wed, 21 Aug 2019 09:03:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821090742.GI12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Blauciak@gmail-pop.l.google.com, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>
Subject: Re: [alsa-devel] [PATCH 00/17] soundwire: fixes for 5.4
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



On 8/21/19 4:07 AM, Vinod Koul wrote:
> On 05-08-19, 19:55, Pierre-Louis Bossart wrote:
>> This series provides an update on the initial RFC. Debugfs and Intel
>> updates will be provided in follow-up patches. The order of patches
>> was changed since the RFC so detailed change logs are provided below.
> 
> Applied all except 14, which didnt apply, thanks

yes, that's a miss, there was a debugfs line that created a dependency 
with the other patches that were not applied because of the lack of 
alignment between soundwire/fixes and soundwire/next.
Will resubmit.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
