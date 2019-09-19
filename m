Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D322B7DEF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 17:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D797E167A;
	Thu, 19 Sep 2019 17:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D797E167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568906274;
	bh=IW8UmBwZzm4TkoMK4ttTbJSzvbt49rToTDw6u09l9VI=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jj1TtFBAayb219dlkE5mSM4kyNV33IM/SY9drPy3njhzy/ES8fdzm+/aqCNC/8NGv
	 4MYXs1w0tY5oj5uSA/WJyd1Aglhq9tdQLzIAJyZhhfIqXn17Bhvqg2oJdU1foHQURR
	 K0aosKiaSczzoe0TKHuKvOL8q9aWnEonzb17NnLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B42FF80146;
	Thu, 19 Sep 2019 17:16:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58AE2F80096; Thu, 19 Sep 2019 17:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B3B1F80096
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 17:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B3B1F80096
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 08:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,523,1559545200"; d="scan'208";a="189635664"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 19 Sep 2019 08:15:59 -0700
Received: from pbossart-mac01.local (unknown [10.251.11.91])
 by linux.intel.com (Postfix) with ESMTP id CD21B5802A3;
 Thu, 19 Sep 2019 08:15:58 -0700 (PDT)
To: Mark Pearson <mpearson@lenovo.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Elimar Riesebieter <riesebie@lxtec.de>
References: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
 <853b3859-8c8e-1c52-becb-3807d351b8f1@linux.intel.com>
 <f11c5347d8504148a47fdbc48d920f59@lenovo.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <98b99cea-9be1-f232-f62c-1f0b7a10e295@linux.intel.com>
Date: Thu, 19 Sep 2019 10:15:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f11c5347d8504148a47fdbc48d920f59@lenovo.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [External] Re: alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
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

On 9/19/19 9:54 AM, Mark Pearson wrote:
>>
>> Indeed UCM is required for all cases where SOF and PulseAudio are used.
>>
>> Our thinking was however to add this UCM file to the new repository outside
>> of alsa-lib [1]. There is an on-going thread started by Jaroslav to move those
>> files and relicense them as BSD-3-Clause [2]
>>
>> [1]
>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
>> July/153257.html
>> [2]
>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
>> September/155246.html
> 
> Thanks Pierre.
> 
> Do we have any approximate timelines on when and how this will happen? (I'm new to this)
> 
> One of my main aims is that we have a customer using Debian and one of our platforms that require this change - I need to make sure I understand how this would roll out and what actions they need to take in the meantime if it's not going to be available in Debian.

I think the first order would be to have the file cleaned-up, with its 
Intel origin clearly stated with a signed-off-by tag.

Then once this is done, the Debian package creation needs to be handled 
(using either the ALSA repo or the cloned version on SOF GitHub). I 
don't have any experience with Debian packages so can't really comment 
on the effort it would take.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
