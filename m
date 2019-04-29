Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0A6E31D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 14:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B0171667;
	Mon, 29 Apr 2019 14:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B0171667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556542498;
	bh=dpw4RqzEtp0Z5ViCP2WslMz7yx5jw2CfjYhCenGIuss=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WwgK1yQuQA3MVs1c/t1vIndYFn4Zz3PDik+lRshijcncCAt52UjHsNK7aecPmsq76
	 AQvD3RYockTPUYUwD4mQNQXqlTIftF4povHhKx/ND+1THrc3EzHUZOWOkTEpTXyQeF
	 qGhRY+Utb9z+TP+2Cqa+YIOWeX8wR1NSBL2c11TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B94F80C0D;
	Mon, 29 Apr 2019 14:53:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B46B9F80CAB; Mon, 29 Apr 2019 14:53:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5EC0F806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 14:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5EC0F806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 05:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="146666925"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2019 05:53:06 -0700
Received: from brettjgr-mobl1.ger.corp.intel.com (unknown [10.254.180.216])
 by linux.intel.com (Postfix) with ESMTP id 105BA5803E4;
 Mon, 29 Apr 2019 05:53:05 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
References: <20190429112829.GH3845@vkoul-mobl.Dlink>
 <20190429114337.GA16771@kroah.com> <20190429114617.GJ3845@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <24c3eef6-2a91-afbd-04f1-2e9a0db29f1c@linux.intel.com>
Date: Mon, 29 Apr 2019 07:53:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429114617.GJ3845@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [GIT PULL] soundwire updates for v5.2-rc1
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

On 4/29/19 6:46 AM, Vinod Koul wrote:
> On 29-04-19, 13:43, Greg KH wrote:
>> On Mon, Apr 29, 2019 at 04:58:29PM +0530, Vinod Koul wrote:
>>> Hey Greg,
>>>
>>> Please PULL to receive updates to soundwire subsystem
>>>
>>> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
>>>
>>>    Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.2-rc1
>>
>> Pulled and pushed out, thanks,
> 
> That was fast :)

Vinod, is there any reason why you didn't take the rest of my clean-up 
patches? The feedback you provided wasn't really relevant (patches do 
apply and alignment is fine) and you didn't reply to my questions. 
That's not 'fast'. If we start having such delays with trivial patches, 
I can only imagine how well this is going to work with the rest of the 
patches I am cooking...
Regards
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
