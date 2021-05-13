Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999237F8E8
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 15:38:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C3817D1;
	Thu, 13 May 2021 15:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C3817D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620913125;
	bh=AS3LhSlM15YNOzsG5HibdOn9HlU7oKi2y9/CD/y4xT4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JtMEtgWFR3B1Om84RmNekkF47sBejRPFDBoVuFJH1vA/mHWOwbfxTIv09EGWyc9fX
	 wrN3VDKW+9+JDCUYILzIjLjHLaDAdKiak0TEnVMUmVA6Tx11byph8GfE3Z3IDZTbgu
	 IYWUC9BV8AWpv6kf9HI0/YdaJAxGfz004NVitrdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 637D1F8012E;
	Thu, 13 May 2021 15:37:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEB03F80163; Thu, 13 May 2021 15:37:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98BC0F8013A
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 15:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98BC0F8013A
IronPort-SDR: jE7tlqzouUvv3Mh9QhhYuzYZvEa6KQoEoSZ2bD65ynyIM0H6lgOG3prOIoUxyh2ykNSwNYqlt/
 0DF4BZxxhPRg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="200002296"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="200002296"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 06:37:06 -0700
IronPort-SDR: F0nMYjYMFjYmcdOZIz59E6xkWOTmvU7OkG16ZMIGJDszRfrshYnmXMQz+pWUBMMf6EILsF/iIj
 SqgL0bJy2cnA==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="623634003"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.115])
 ([10.237.180.115])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 06:37:05 -0700
Subject: Re: no_period_wakeup, axfer and --sched-model=timer
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <687f9871-7484-1370-04d1-9c968e86f72b@linux.intel.com>
 <20210513132520.GA109626@workstation>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <954a2bc9-f6aa-6c5f-c3f1-62400f22cb3f@linux.intel.com>
Date: Thu, 13 May 2021 15:37:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210513132520.GA109626@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 5/13/2021 3:25 PM, Takashi Sakamoto wrote:
> Hi,
> 
> On Thu, May 13, 2021 at 01:34:25PM +0200, Amadeusz Sławiński wrote:
>> I was checking some stuff relater to NO_PERIOD_WAKEUP and noticed that axfer
>> has support for using either --sched-model=irq or --sched-model=timer.
>> However from few quick tests it seems like it doesn't work?
>>
>> $ aplay -l
>> **** List of PLAYBACK Hardware Devices ****
>> card 0: PCH [HDA Intel PCH], device 0: ALC283 Analog [ALC283 Analog]
>>    Subdevices: 1/1
>>    Subdevice #0: subdevice #0
>>
>>
>> When using  --sched-model=irq  it transfers data until I press Ctrl+C
>>
>> $ axfer transfer playback --sched-model=irq -D hw:0,0 -r 48000 -c2 -f S16_LE
>> /dev/urandom
>> PLAYBACK: Format 'Signed 16 bit Little Endian', Rate 48000 Hz, Channels
>> 'Stereo'
>> ^CPLAYBACK: Expected 4611686018427387903frames, Actual 163960frames
>> Aborted by signal: Interrupt
>>
>>
>> However with  --sched-model=timer  it time outs by itself:
>>
>> $ axfer transfer playback --sched-model=timer -D hw:0,0 -r 48000 -c2 -f
>> S16_LE /dev/urandom
>> PLAYBACK: Format 'Signed 16 bit Little Endian', Rate 48000 Hz, Channels
>> 'Stereo'
>> Fail to process frames: Connection timed out
>> PLAYBACK: Expected 4611686018427387903frames, Actual 16304frames
>>
>>
>> How well is NO_PERIOD_WAKEUP tested/supported? Is it a bug in axfer or
>> perhaps some issue in kernel code?
>>
>>  From some debugging I did, I have my suspicions that it gets stuck on poll
>> in:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/core/pcm_native.c?id=c06a2ba62fc401b7aaefd23f5d0bc06d2457ccc1#n3489
>> waiting for runtime->sleep to wake it, but seems like it never happens.
>>
>> What do you think?
> 
> It's a regression added by a commit e5e6a7838b06 ("axfer: return ETIMEDOUT
> when no event occurs after waiter expiration"), and the -ETIMEDOUT come
> neither from ALSA PCM core nor alsa-lib. Thanks for your reporting!
> 
>   * https://github.com/alsa-project/alsa-utils/commit/e5e6a7838b06
> 
> As a quick fix, please revert the commit. I'll post better fixes later.
> 
> After the revert, it looks work well under my hardware:
> 

Yes, I can confirm, that it fixes the problem. Thanks for quick workaround!
