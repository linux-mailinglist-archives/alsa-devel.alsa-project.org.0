Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086A7B609
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 01:05:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E566017A2;
	Wed, 31 Jul 2019 01:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E566017A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564527904;
	bh=12cAYqPtwscXRrVvres21ulZXs2x5CLJTAdolJHLf7o=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvTCyIaNFSSrSF5emWaA9GLE7rxXbidqnBwPjIaer18laT0SAguQwPQfndihxvfxA
	 NgZvVHLmpfc2bD7hiRuVI8Qri04Xw9WXpLSC9qwcWn3D2L6HI+z90QHb9AjR94PO7N
	 RIkarYjJjoJteScMuMzLKXiqyxNyeJ+ZddCaJ90c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3921AF804CA;
	Wed, 31 Jul 2019 01:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9500F804CB; Wed, 31 Jul 2019 01:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB0A0F80482
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 01:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB0A0F80482
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 16:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="183439066"
Received: from unknown (HELO [10.252.200.179]) ([10.252.200.179])
 by orsmga002.jf.intel.com with ESMTP; 30 Jul 2019 16:03:47 -0700
To: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>, marcin.rajwa@intel.com,
 Keyon Jie <yang.jie@linux.intel.com>, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org
References: <9d92551a-fa10-4ecd-47f1-5b3b67824a12@linux.intel.com>
 <0b20cfe6-064b-a4ce-ce9d-2634f3f23d7c@linux.intel.com>
 <5fda90f9-c387-440a-9ea8-648b22dda9b0@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c15cf1db-3858-8694-bcb4-3665c2f0c6b2@linux.intel.com>
Date: Tue, 30 Jul 2019 18:03:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5fda90f9-c387-440a-9ea8-648b22dda9b0@linux.intel.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: SOF: introduce
 no_stream_position so host_period_bytes preserves its data
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


>>> Change the use of host_period_bytes. So far this field was used
>>> as an bool value indicating whether FW should send stream position
>>> update. With this patch we use host_period_bytes to provide firmware
>>> information about the frequency of host interrupts aimed to read
>>> its input buffer. This is accoring to ALSA definition of 'FramePeriod'.
>>
>> according to the
>>
>>> Knowing this firmware can safely copy large/irregular chunks of data
>>
>> why irregular? ALSA periods are pretty regular and predictable.
> 
> I did not say ALSA periods are irregular I said that sometimes (like in 
> case of draining) firmware needs to copy irregular amount of that.
> 
> What I mean by "irregular" is not equal to ALSA period or multiple of 
> periods.

Marcin, in the v2 review this is what we discussed. The formatting may 
be off so please refer to the emails directly should this be difficult 
to read:

"
 >>>
 >>> Before I provide more feedback, can you clarify if the 
'host_period_bytes' is the same value as the ALSA period size (in 
bytes)? And what would be the value when the no_irq mode is used?
 >>
 >> Yes, this is the same value. It is obtained by 
*params_period_bytes**()* in kernel.
 >
 > ok good. I was afraid this would be a different concept.
 >
 > So what you are saying is that the draining happens by bursts whose 
size is tied to the period defined by the host, yes?
Yes. We try to fill host buffer as much as we can to gain fast draining 
but in the same time we give host time to read it.
"

I cannot reconcile the two threads, is the draining tied to the ALSA 
period size or not?

Care to clarify?

> 
>>
>>> (like data comming from i.e draining task) without the risk of buffer
>>
>> coming
>>
>> Please proof-read your commit messages (and use an editor which 
>> spell-checks for you), typos and misleading information don't exactly 
>> boost trust in the suggested patch, regardless of its merits.
> 
> 
> Sorry for typos. Should I correct them and resend again or correct here 
> as we discuss?


better send a v5 when we've clarified what the 'irregular' wording 
refers to.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
