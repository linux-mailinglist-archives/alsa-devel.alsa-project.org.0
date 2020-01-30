Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7E914D71C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 08:48:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 467101673;
	Thu, 30 Jan 2020 08:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 467101673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580370515;
	bh=tZuh4miYrBLJdmSOT890zu0TwandbVoRVJmNALEWr1U=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbYn9SmMjsVLJ/GqT6Af94madNv7Rezo6aI+jy8o+ZCBOJGZVoKYwi1rud+ochi1K
	 ZSnI5vt0I/vqNRDSiQn6Dh8sNyZhEtGv2pxNqpQAOcxw7gAMWu60dPR1BSZOCxgtr1
	 cPc9h3IbmRpcDaP6a6q4eGYX2NFn86pLbATUrwNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5959DF80150;
	Thu, 30 Jan 2020 08:46:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C10DF80150; Thu, 30 Jan 2020 08:46:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B116AF800F1
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 08:46:43 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 65F63A003F;
 Thu, 30 Jan 2020 08:46:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 65F63A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1580370402; bh=oclTF+6FTb8l5YhguDp/D3D+QAasjKx2QbXbY+xxpnQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=APpeWFiK5N9SS/AmM1zUYx2gKFWUk6chBLgArA2yYCQjWU0iG/q/laCDyjK0BjTFJ
 lW3hNh4uDnkkhNX2F7+3rdKN77RvWcyyB880tspcmZbU5LG4q9/5oJfK5gbcr4WlAf
 4ViOAGMqE6QTZpwfY9IwD1/sIx6OmARkgjxqnSmw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 30 Jan 2020 08:46:39 +0100 (CET)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sylvain.bertrand@gmail.com, alsa-devel@alsa-project.org
References: <20200129232340.GA23769@freedom>
 <fffaf462-fd7a-6d09-e808-21d94f883365@linux.intel.com>
 <20200130070642.GA7741@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <857505b9-2375-7d73-5c1a-644dff952cdd@perex.cz>
Date: Thu, 30 Jan 2020 08:46:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200130070642.GA7741@workstation>
Content-Language: en-US
Subject: Re: [alsa-devel] no period wakeup support
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

Dne 30. 01. 20 v 8:06 Takashi Sakamoto napsal(a):
> On Wed, Jan 29, 2020 at 05:43:19PM -0600, Pierre-Louis Bossart wrote:
>>> Nowadays, is this reasonable to consider disabling the period wakeup as default
>>> instead of expecting period wakeup by default?
>>
>> I'd say yes - it's been nearly 10 years since this capability was added, and
>> it's quite common across HDaudio, Chrome, Android plaforms.
>>
>> But considering this as a default doesn't mean it's available in 100% of the
>> cases, you still you need to check that
>>
>> a) the driver is capable of disabling the period wakeup
>> b) the driver is capable of providing a precise position outside of period
>> elapsed events (usually marked with the INFO_BATCH capability).
>>
>> alsa-lib gives you the means to query both cases.
>>
>> Note that you also have the case where you cannot disable interrupts but can
>> still use timer-based solutions (e.g. for USB audio).
> 
> I suspect this advice.
> 
> In design of ALSA PCM core, runtime of PCM substream is configured for
> the mode of no-period-wakeup just in a case that userspace application
> requests it[1].
> 
> As long as developers take enough care of compatibility for existent
> applications, it's better to support period wakeup for each IRQ as a
> default, then support no-period-wakeup mode as an option.
> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/core/pcm_native.c#n715

I agree. We should not break the basic part of the API.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
