Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BF876C90
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B5B92090;
	Fri, 26 Jul 2019 17:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B5B92090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564154695;
	bh=LYYydTTwEcEHZ9oHPSAFVBc79ntuHwbz34g3Vr/GRvI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O5UJN8TCP4vvydNY4ErLWxC98i8p42h3D5BRmCb27F+MuvsVZZ526DTkbjLkBXw8R
	 uNSXaSMOzZZOO+Nyx4AHJsRz716Ka18Iu3FPSyP3YcvDonWDw2yq936QjWRK25NmlF
	 JgJkintUzNavGbqIhSKq7QWOhIFBNnD4KO82Dj5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95774F803D1;
	Fri, 26 Jul 2019 17:23:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E523F80393; Fri, 26 Jul 2019 17:23:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91075F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91075F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322064852"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 08:23:01 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <6d268dd6-5f1a-e1f4-b0be-c3b978f89cb1@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6db19ecc-3cb0-68f6-537f-be1df4bf2750@linux.intel.com>
Date: Fri, 26 Jul 2019 10:23:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6d268dd6-5f1a-e1f4-b0be-c3b978f89cb1@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 00/40] soundwire: updates for 5.4
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


>> Comments and feedback welcome!
> 
> Hello Pierre,
> 
> This patchset is pretty large - I'd suggest dividing next RFC into 
> segments: debugfs, info, power-management, basic flow corrections and 
> frame shape calculator.

There was an intent to provide a logical progression...

First debugfs, since I believe it was reviewed before, and I wanted 
folks like Greg to double-check it without burrying it too deep.

Then all corrections, followed by the allocator.

And last all PM stuff, split by regular suspend/resume and pm_runtime.

The RFC state is precisely to gather feedback, if folks want a different 
order that's fine. I just wanted to be transparent and share what we have.

> Some commits have no messages and others lack additional info - tried to 
> provide feedback wherever I could, though, especially for the last one, 
> it would be vital to post additional info so in-depth feedback can be 
> provided.

The lack of commits is a miss, I went from 170 debug/integration patches 
to 40 yesterday and my brain was fried.

> Maybe nothing for calculator will come up, maybe something will. In 
> general I remember it being an essential part of SDW and one where many 
> bugs where found during the initial verification phase.

the frame allocation is a critical piece and it does need to be 
hardened. However we can do so in steps. The current setups we have 
support 1 Slave per link and a limited amount of bandwidth. The links 
themselves don't operate at the max frequency.
Also note that that the streams are 'statically' defined by the 
dailinks, and the allocation is not fully dynamic with random 
configurations being request. If you fail you fail fast.

Nevertheless I do plan to recheck the allocator with an additional 
scripting tool. It'd be very good to e.g. dump the current setup in a 
debugfs file and show to users what is happening (or not happening). I 
didn't recall you worked on SoundWire and I can use your practical 
knowledge to make the code and tools better :-)

> 
> Thanks for your contribution and have a good day!

Thanks for reviewing this long series and have a nice week-end.
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
