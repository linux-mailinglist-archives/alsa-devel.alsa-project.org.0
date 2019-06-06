Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B67183783A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 17:37:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24B0D15E5;
	Thu,  6 Jun 2019 17:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24B0D15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559835474;
	bh=PZSGhzrT4eyfWJwejwdxddOfa84m2s/VOK6eRCY+guQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fblZOFWL2VyCkKQUn0OSJJrTILtVq6fQkXOKkdOQNtHSUaPQRzmj9AahHFnY6hniP
	 b1p/7K+if7TU7gu24PA+8vjz3mENPBoOpJbL4m/Rxg4cV0lmeVVJpWiGzD50C9l7Mv
	 ddly2Zc+mJz6AsYphrO71TqQzZCs3kJy9EVaM8ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 679E1F896F8;
	Thu,  6 Jun 2019 17:36:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44021F896F7; Thu,  6 Jun 2019 17:36:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62486F896CE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 17:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62486F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 08:36:01 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 06 Jun 2019 08:36:00 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 11F5F580490;
 Thu,  6 Jun 2019 08:35:59 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20190606112222.16502-1-srinivas.kandagatla@linaro.org>
 <9427a73a-e09a-4a9c-7690-271d2e2e1024@linux.intel.com>
 <f13c82d2-94a4-9517-bcf6-95aa40c6a42f@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <43a381df-13d7-eaac-a1ae-704db5659cb9@linux.intel.com>
Date: Thu, 6 Jun 2019 10:36:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f13c82d2-94a4-9517-bcf6-95aa40c6a42f@linaro.org>
Content-Language: en-US
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2] soundwire: stream: fix bad unlock
	balance
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

On 6/6/19 9:58 AM, Srinivas Kandagatla wrote:
> 
> 
> On 06/06/2019 15:28, Pierre-Louis Bossart wrote:
>> On 6/6/19 6:22 AM, Srinivas Kandagatla wrote:
>>> multi bank switching code takes lock on condition but releases without
>>> any check resulting in below warning.
>>> This patch fixes this.
>>
>>
>> Question to make sure we are talking about the same thing: multi-link 
>> bank switching is a capability beyond the scope of the SoundWire spec 
>> which requires hardware support to synchronize links and as Sanyog 
>> hinted at in a previous email follow a different flow for bank switches.
>>
>> You would not use the multi-link mode if you have different links that 
>> can operate independently and have no synchronization requirement. You 
>> would conversely use the multi-link mode if you have two devices on 
>> the same type on different links and want audio to be rendered at the 
>> same time.
>>
>> Can you clarify if indeed you were using the full-blown multi-link 
>> mode with hardware synchronization or a regular single-link operation? 
>> I am not asking for details of your test hardware, just trying to 
>> reconstruct the program flow leading to this problem.
>>
> 
> Am testing on a regular single link, which hits this path.
> 
>> It could also be that your commit message was meant to say:
>> "the msg lock is taken for multi-link cases only but released 
>> unconditionally, leading to an unlock balance warning for single-link 
>> usages"?
> Yes.

Thanks for the precision. the change is legit so assuming the commit 
message is reworded to mention single link usage please feel free to 
take the following tag.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
