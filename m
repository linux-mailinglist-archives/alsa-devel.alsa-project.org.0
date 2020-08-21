Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328624D862
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 17:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028A2168B;
	Fri, 21 Aug 2020 17:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028A2168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598023162;
	bh=X1RAE76VbL6JC0P9wyKR77ydHYzYcFHze/sOAdktkrI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BpFsG0eEi9Zn/ZctD2z/PzjXX+JksSsN4hlFcZ+3SG7XotTtK51gzCrxgjTDWW+Rf
	 zQ4zzIU7RKfH8u2B6sfs35PvqNqnK3CQ/F9aq7U7tAt3IPavVelck3pNMAntSUubBF
	 aDpVp3m8kmpHPcvSR+pcU89yc+1HXSfd0yqrj0ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AF96F80216;
	Fri, 21 Aug 2020 17:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8746F80218; Fri, 21 Aug 2020 17:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E0C5F800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 17:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E0C5F800D2
IronPort-SDR: f3zmW1jFpfqNX0jaDtmobkvyZcxRl0AmZn/2wO0O4KE/sY68u5aj0GonnpcWnj7srzH0pfKY51
 pk++J8gyj80A==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="143189605"
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; d="scan'208";a="143189605"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 08:17:27 -0700
IronPort-SDR: X3WZs6CSMS+GgnkdfsfTbfDrbYXMtwd4QXENHMbQ/vkSmOsQgjxTnbAVin/D+ElXQ3Weo9quLC
 ipOKHUYXOXLg==
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; d="scan'208";a="442377166"
Received: from pcmiller-mobl1.amr.corp.intel.com (HELO [10.209.120.121])
 ([10.209.120.121])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 08:17:25 -0700
Subject: Re: [PATCH] soundwire: cadence: fix race condition between suspend
 and Slave device alerts
To: Vinod Koul <vkoul@kernel.org>
References: <20200817222340.18042-1-yung-chuan.liao@linux.intel.com>
 <20200819090637.GE2639@vkoul-mobl>
 <8d60fa6f-bb7f-daa8-5ae2-51386b87ccad@linux.intel.com>
 <20200821050758.GI2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <29ea5a44-b971-770a-519c-ae879557b63f@linux.intel.com>
Date: Fri, 21 Aug 2020 10:17:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821050758.GI2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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



>> cancel_work_sync() will either
>> a) wait until the current work completes, or
>> b) prevent a new one from starting.
>>
>> there's no way to really 'abort' a workqueue, 'cancel' means either complete
>> or don't start.
> 
> Quite right, as that is how everyone deals with it. Stop the irq from
> firing first and then wait until work is cancelled or completed, hence
> cancel_work_sync()

No, this cannot work... The work queue in progress will initiate 
transactions which would never complete because the interrupts are disabled.

>> if you disable the interrupts then cancel the work, you have a risk of not
>> letting the work complete if it already started (case a).
>>
>> The race is
>> a) the interrupt thread (this function) starts
>> b) the work is scheduled and starts
>> c) the suspend handler starts and disables interrupts in [1] below.
>> d) the work initiates transactions which will never complete since Cadence
>> interrupts have been disabled.
> 
> Would it not be better to let work handle the case of interrupts
> disabled and not initiates transactions which wont complete here? That
> sounds more reasonable to do rather than complete the work which anyone
> doesn't matter as you are suspending

A in-progress workqueue has no notion that interrupts are disabled, nor 
that the device is in the process of suspending. It writes into a fifo 
and blocks with wait_for_completion(). the complete() is done in an 
interrupt thread, triggered when the RX Fifo reaches a watermark.

So if you disable interrupts, the complete() never happens.

The safe way to do things with the current code is to let the workqueue 
complete, then disable interrupts.

We only disable interrupts on suspend, we don't need to test if 
interrupts are enabled for every single byte that's transmitted on the 
bus. Not to mention that this additional test would be racy as hell and 
require yet another synchronization primitive making the code more 
complicated.

So yes, the current transactions will complete and will be ignored, but 
it's a lot better than trying to prevent these transactions from 
happening with extra layers of complexity that will impact *every* 
transaction.

BTW I looked at another alternative based on the msg lock, so that 
interrupts cannot be disabled while a message is being sent. However 
because a workqueue may send multiple messages, e.g. to read registers 
are non-contiguous locations, there is no way to guarantee what happens 
how messages and interrupt disabling are scheduled, so there'd still be 
a case of a workqueue not completing and being stuck on a mutex_lock(), 
not so good either.

In short, this is the simplest way to fix the timeout on resume.
