Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7664227D2F0
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 17:40:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D1B7181B;
	Tue, 29 Sep 2020 17:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D1B7181B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601394021;
	bh=YOTf4iFAA29ZGEpqyqzHwZ46Ngz76Zyo6np3LTphrEM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bg9zKzgcSDWairWkycOWFjSME1JocOKVnVKcSkbSXKixlGT7DSgFWXYsAiYMQE4rN
	 6y8mRcJukBmaTpqalps8YtzJtM92eoWfHs3YpJ+yqUV5ql2fSuphV8v/d9V59jSGGv
	 tMDmPTcjdWVSXnZgRiGSb7tQZvhU/R85PIEUgURI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8071F800AB;
	Tue, 29 Sep 2020 17:38:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66FA6F801F5; Tue, 29 Sep 2020 17:37:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66FA4F800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 17:37:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66FA4F800AB
IronPort-SDR: LlVfFBqTQgLZCXTYfUIfPM+bvNBKaO+Gs5CoKbuVociMnwKaeYQ2/frR4KWhCpwz/TIBUqmCuD
 JNTDivlEvuDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="159592415"
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="159592415"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 08:37:47 -0700
IronPort-SDR: TsAirqVqOhAjYIdwzI62kONqQxzIYf4qnt7iO51KLCwwUep+KSVzrqEoLqWgW9z/jZmicilDqO
 M//5/5Kd5feQ==
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="294299059"
Received: from sinayosx-desk3.amr.corp.intel.com (HELO [10.212.155.136])
 ([10.212.155.136])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 08:37:46 -0700
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
To: Gyeongtaek Lee <gt82.lee@samsung.com>, 'Takashi Iwai' <tiwai@suse.de>
References: <CGME20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823@epcas2p3.samsung.com>
 <000001d6963c$3cc53690$b64fa3b0$@samsung.com> <s5heemlklo0.wl-tiwai@suse.de>
 <000501d69641$57b66460$07232d20$@samsung.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <13fad3a0-12b3-134e-5dc8-8184f1fa7021@linux.intel.com>
Date: Tue, 29 Sep 2020 09:00:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <000501d69641$57b66460$07232d20$@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, vkoul@kernel.org, hmseo@samsung.com,
 tkjung@samsung.com, pilsun.jang@samsung.com, s47.kang@samsung.com
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




>>>> Since the possible application's behavior after this pause is as same
>>>> as the normal pause (i.e. either resuming pause or dropping), I find
>>>> it OK to take the original approach.
>>> Thank you for the review.
>>> I think that I should resend the original patch.
>>
>> Let's wait a bit for other opinions.  We may add rather a new flag
>> instead of introducing a new state, too, for example.
>>
>> Also, I'm not sure about any side-effect to drivers that expect the
>> pause only during the running state.  We might need some check for a
>> capability flag?
> Ok. I will wait for more opinion and then resend fixed patch.

Question: have you thought about the case where a 'partial drain' 
happens, typically when you are doing gapless playback?

I see in snd_compress_wait_for_drain() a wait on a state different from 
DRAINING, which is precisely what would be modified with your proposal. 
It's been a while since I looked at this code but it'd be worth checking 
that the pause is supported in 'normal' and 'partial' drain cases.

