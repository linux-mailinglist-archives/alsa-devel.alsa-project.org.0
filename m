Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57B14DB79
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 14:24:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6F861614;
	Thu, 30 Jan 2020 14:23:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6F861614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580390648;
	bh=iy2z42jJ1NYuIVysMzDK2pIbY4fpdGIU5JJkLV6t7MA=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sbr5JkJYg/0HZyAgwQEesxHQZbO16ACO3DK/XnpsBb3UFZgHUn/mqPmjakTe6lj8V
	 YoZbYvW9ofnz/j3HecQzoxFb84krTvIFV76wc4600A8CCNI/JBCc/Zl26oo1J9M9yE
	 NTz0swgSTh2L4XSzS1sBe0/COMdrSda18DPWLQuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29FEDF80276;
	Thu, 30 Jan 2020 14:22:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACFBBF80274; Thu, 30 Jan 2020 14:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C03AF80259
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 14:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C03AF80259
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 05:22:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="229941087"
Received: from jsmesenc-mobl.amr.corp.intel.com (HELO [10.252.140.145])
 ([10.252.140.145])
 by orsmga003.jf.intel.com with ESMTP; 30 Jan 2020 05:22:00 -0800
To: Jaroslav Kysela <perex@perex.cz>, sylvain.bertrand@gmail.com,
 alsa-devel@alsa-project.org
References: <20200129232340.GA23769@freedom>
 <fffaf462-fd7a-6d09-e808-21d94f883365@linux.intel.com>
 <20200130070642.GA7741@workstation>
 <857505b9-2375-7d73-5c1a-644dff952cdd@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9cbee940-05b9-e7ea-d51f-a6ef9e0cf1bb@linux.intel.com>
Date: Thu, 30 Jan 2020 07:22:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <857505b9-2375-7d73-5c1a-644dff952cdd@perex.cz>
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



On 1/30/20 1:46 AM, Jaroslav Kysela wrote:
> Dne 30. 01. 20 v 8:06 Takashi Sakamoto napsal(a):
>> On Wed, Jan 29, 2020 at 05:43:19PM -0600, Pierre-Louis Bossart wrote:
>>>> Nowadays, is this reasonable to consider disabling the period wakeup 
>>>> as default
>>>> instead of expecting period wakeup by default?
>>>
>>> I'd say yes - it's been nearly 10 years since this capability was 
>>> added, and
>>> it's quite common across HDaudio, Chrome, Android plaforms.
>>>
>>> But considering this as a default doesn't mean it's available in 100% 
>>> of the
>>> cases, you still you need to check that
>>>
>>> a) the driver is capable of disabling the period wakeup
>>> b) the driver is capable of providing a precise position outside of 
>>> period
>>> elapsed events (usually marked with the INFO_BATCH capability).
>>>
>>> alsa-lib gives you the means to query both cases.
>>>
>>> Note that you also have the case where you cannot disable interrupts 
>>> but can
>>> still use timer-based solutions (e.g. for USB audio).
>>
>> I suspect this advice.
>>
>> In design of ALSA PCM core, runtime of PCM substream is configured for
>> the mode of no-period-wakeup just in a case that userspace application
>> requests it[1].
>>
>> As long as developers take enough care of compatibility for existent
>> applications, it's better to support period wakeup for each IRQ as a
>> default, then support no-period-wakeup mode as an option.
>>
>>
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/core/pcm_native.c#n715 
>>
> 
> I agree. We should not break the basic part of the API.

I think you misunderstood my point. I was suggesting an approach similar 
to that of PulseAudio/CRAS/Android, where you first try and use the 
no-period-wakeup, and fallback to the traditional interrupt-based mode 
if it's not possible. The idea is that the no-period-wakeup should work 
now in a majority of the cases, so should be the primary mode 
recommended, not to deprecate or break the period-based solution.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
