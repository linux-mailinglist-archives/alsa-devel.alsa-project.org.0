Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0540B104945
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 04:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67FCC1748;
	Thu, 21 Nov 2019 04:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67FCC1748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574306541;
	bh=7DEZYvHzNEOfzsL7715rBco8VRE3zbpbzmZKsY0Kdxc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i70ZR2WE4pq7gxcHNxv9xIO5hMt6nlfErIk5j6ozdI/a+TKF7cvRcVIF2iFpCPTEo
	 hbGqtu8BDypnxy6cT4Fgy+5mSwEqgWNxMfgqijT4nl3v160kGrNMY1XNNHClAe7RAp
	 jTcA7eCB4Py5YZLw5hjz/I7vf2T+jLOmRwqVQfvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EF14F80145;
	Thu, 21 Nov 2019 04:20:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 381A0F80146; Thu, 21 Nov 2019 04:20:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59CE0F800F0
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 04:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59CE0F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 19:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="290176484"
Received: from akiruban-mobl.amr.corp.intel.com (HELO [10.255.228.77])
 ([10.255.228.77])
 by orsmga001.jf.intel.com with ESMTP; 20 Nov 2019 19:20:27 -0800
To: Tzung-Bi Shih <tzungbi@google.com>
References: <20191120060256.212818-1-tzungbi@google.com>
 <20191120060256.212818-4-tzungbi@google.com>
 <8273f728-3d4b-b0dc-03b7-6276c5ae4460@linux.intel.com>
 <CA+Px+wWSajOFXwLAS+jrO9XUBeKaxjZaEOqng0YO9VmL3VXaSQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7f055263-01a6-e1cd-8085-1790222bb808@linux.intel.com>
Date: Wed, 20 Nov 2019 21:20:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CA+Px+wWSajOFXwLAS+jrO9XUBeKaxjZaEOqng0YO9VmL3VXaSQ@mail.gmail.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: max98090: fix possible race
 conditions
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


> 
>>> max98090_interrupt      max98090_pll_work      max98090 codec
>>> ----------------------------------------------------------------------
>>>                                                  ULK = 1
>>> receive ULK INT
>>> read 0x01
>>>                                                  ULK = 0 (clear on read)
>>> schedule max98090_pll_work
>>>                           restart max98090 codec
>>>                                                  ULK = 1
>>> receive ULK INT
>>> read 0x01
>>>                                                  ULK = 0 (clear on read)
>>>                           read 0x1
>>>                           assert ULK == 0 (2).
>>
>> what are those 0x01 and 0x1? is the second a typo possibly?
> 
> ACK, a typo.
> 
>>> In the case (2), both max98090_interrupt and max98090_pll_work read
>>> the same clear-on-read register.  max98090_pll_work would falsely
>>> thought PLL is locked.
>>>
>>> There are 2 possible options:
>>> A. turn off ULK interrupt before scheduling max98090_pll_work; and turn
>>> on again before exiting max98090_pll_work.
>>> B. remove the second thread of execution.
>>>
>>> Adopts option B which is more straightforward.
>>
>> but has the side effect of possibly adding a 10ms delay in the interrupt
>> thread?
> 
> (forgot to mention) Option A cannot fix the case (2) race condition:
> there would be 2 threads read the same clear-on-read register.  In
> theory, the hardware should faster than CPUs' accesses via I2C.
> max98090 should returns ULK=1 any time if PLL is unlocked.  Shall we
> ignore the case (2) and adopt option A?

I don't have any specific recommendation, just trying to follow your 
line of thought on a problem that bugged be in the past. If your tests 
shows that the extra delay is fine, then it's good progress

Still you may want to clarify your second point and the commit message. 
The first race condition was clear, the second one not so much.

what did you mean with 'assert ULK == 0' and what does this map to in 
pll_work

the code looks as this:

static void max98090_pll_work(struct work_struct *work)
{
	if (!snd_soc_component_is_active(component))
		return;

	/* Toggle shutdown OFF then ON */
	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
			    M98090_SHDNN_MASK, 0);

	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);

	/* Give PLL time to lock */
	msleep(10);
}

so in what does the race occur?

or was it race with the other work queue, which starts like this:

static void max98090_pll_det_enable_work(struct work_struct *work)
{
	struct max98090_priv *max98090 =
		container_of(work, struct max98090_priv,
			     pll_det_enable_work.work);
	struct snd_soc_component *component = max98090->component;
	unsigned int status, mask;

	/*
	 * Clear status register in order to clear possibly already occurred
	 * PLL unlock. If PLL hasn't still locked, the status will be set
	 * again and PLL unlock interrupt will occur.
	 * Note this will clear all status bits
	 */
	regmap_read(max98090->regmap, M98090_REG_DEVICE_STATUS, &status);

So here indeed there is the same read, but what is the consequence of 
the read?
	
did you mean that in the pll_det_enable_work the value of 'status' may 
be incorrect as it was cleared already?

But the interrupt does not schedule the pll_det_enable_work(), it 
happens on a trigger, so how would the race happen?

it'd be good if you provide more details on the flow so that all 
reviewers get the ideas, it's a good opportunity to fix this for good 
and move on.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
