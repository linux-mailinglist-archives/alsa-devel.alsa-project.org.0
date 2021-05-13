Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE90037F977
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 16:12:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 417CA17D1;
	Thu, 13 May 2021 16:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 417CA17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620915133;
	bh=Xo+cf3ArPivyKWvl4p0IjwHhLVMZXldTt/ozfzHbQqw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZEku8MV9aS2w7Czc7mjc4r/855LK5m1Cii5umrhQcNSOIjifYVputLVGHgQa/Yjm
	 dvMDjcx60wHzHvzGvesqXitteAwXwKA3c+G2k1FymGSRbCZrDsIhzk+kUG7s3MxqaB
	 Clg8Thxpg0VCVHis8OVjBzvwSRi+DJ7tM5CB7Lwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 923EAF800E3;
	Thu, 13 May 2021 16:10:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADC65F80163; Thu, 13 May 2021 16:10:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7C8AF800E3
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 16:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C8AF800E3
IronPort-SDR: H/3D1IREXpGNoCiv4y/jxl6xX8tTEQ5xni2lpa0VCoUKIycWBDs7yTzUwsuXaeLn6GbqCHQTzB
 H7l3q59Y6DOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="220945961"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="220945961"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 07:10:12 -0700
IronPort-SDR: 9lA6jpWMbKZenqEjl9EFHl6Euu5C8WA+kdhWo0wmUixuBWSziTRn+U8J1crUCi+9DuYRANrER5
 EsVFoEDO9SGg==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="456377915"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.5.163])
 ([10.213.5.163])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 07:10:10 -0700
Subject: Re: no_period_wakeup, axfer and --sched-model=timer
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <687f9871-7484-1370-04d1-9c968e86f72b@linux.intel.com>
 <20210513132520.GA109626@workstation>
 <954a2bc9-f6aa-6c5f-c3f1-62400f22cb3f@linux.intel.com>
 <20210513135955.GA124922@workstation>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <2dfe267c-60a8-b10c-6321-a167c9ccc0aa@intel.com>
Date: Thu, 13 May 2021 16:10:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513135955.GA124922@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On 2021-05-13 3:59 PM, Takashi Sakamoto wrote:
> On Thu, May 13, 2021 at 03:37:02PM +0200, Amadeusz Sławiński wrote:
>> On 5/13/2021 3:25 PM, Takashi Sakamoto wrote:
>>> Hi,
>>>
>>> On Thu, May 13, 2021 at 01:34:25PM +0200, Amadeusz Sławiński wrote:
>>>> I was checking some stuff relater to NO_PERIOD_WAKEUP and noticed that axfer
>>>> has support for using either --sched-model=irq or --sched-model=timer.
>>>> However from few quick tests it seems like it doesn't work?

...

>>> It's a regression added by a commit e5e6a7838b06 ("axfer: return ETIMEDOUT
>>> when no event occurs after waiter expiration"), and the -ETIMEDOUT come
>>> neither from ALSA PCM core nor alsa-lib. Thanks for your reporting!
>>>
>>>    * https://github.com/alsa-project/alsa-utils/commit/e5e6a7838b06
>>>
>>> As a quick fix, please revert the commit. I'll post better fixes later.
>>>
>>> After the revert, it looks work well under my hardware:
>>>
>>
>> Yes, I can confirm, that it fixes the problem. Thanks for quick workaround!
> 
> That's good. I just filed the better fix. Please apply it with your local
> repository instead of the revert patch.
> 
>   * alsa-utils: axfer: fix regression of timeout in timer-based scheduling model #88
>    * https://github.com/alsa-project/alsa-utils/pull/88
> 
> Anyway, thank you for reporting the bug. In recent years I've been
> working for devices in which no-period-wakeup is unavailable, so I
> overlooked the bug so long...

No problem Takashi, happens to us all. We thank you for a very quick 
reply and solving the issue.

Regards,
Czarek
