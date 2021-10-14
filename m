Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2842DF17
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 18:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 566E3166E;
	Thu, 14 Oct 2021 18:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 566E3166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634228709;
	bh=soIGBTDdqDfzNp5keFabmz1UAu55XRteKqSVOtxwY5M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vJFiMYBdAYDTg69KF3Wq7U0CFnFIkzZEUhTo9eBWiIHKztf5OWTPlpREzF348lC9g
	 L9wBJ4xQopjpu00VbTvWFbIpXZ3z3v7bb8DYuDkolsNhsCb4l+z8iS3BKf/O40bgHe
	 sBqdn+Q3+d/Tg9L+sQn3WtrA0/gLVzmXRzQvH1gM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1FF8F80088;
	Thu, 14 Oct 2021 18:23:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0BCAF80212; Thu, 14 Oct 2021 18:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B7BCF8016C
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 18:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B7BCF8016C
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="207831227"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="207831227"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 09:19:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="461242570"
Received: from ktrimble-mobl.amr.corp.intel.com (HELO [10.209.188.150])
 ([10.209.188.150])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 09:19:09 -0700
Subject: Re: [PATCH] ALSA: pcm: Unify snd_pcm_delay() and snd_pcm_hwsync()
To: Takashi Iwai <tiwai@suse.de>
References: <20211014145323.26506-1-tiwai@suse.de>
 <08dec63b-4748-e165-73b4-88a5d2db9597@linux.intel.com>
 <s5hv91zvbal.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <65eb03c3-a06e-8903-69f6-12298b1b1362@linux.intel.com>
Date: Thu, 14 Oct 2021 11:19:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hv91zvbal.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 10/14/21 11:08 AM, Takashi Iwai wrote:
> On Thu, 14 Oct 2021 17:59:21 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>
>> On 10/14/21 9:53 AM, Takashi Iwai wrote:
>>> Both snd_pcm_delay() and snd_pcm_hwsync() do the almost same thing.
>>> The only difference is that the former calculate the delay, so unify
>>> them as a code cleanup, and treat NULL delay argument only for hwsync
>>> operation.
>>>
>>> Also, the patch does a slight code refactoring in snd_pcm_delay().
>>> The initialization of the delay value is done in the caller side now.
>>
>> I would have done the opposite change, i.e. keep snd_pcm_hwsync() but
>> add an optional delay argument/calculation.
>>
>> 'snd_pcm_delay' doesn't really hint at any hwsync operation.
>>
>> Just a naming difference really.
> 
> Yes, but also the difference of the number of arguments.  Changing
> other way round would need to more modifications in the end.

Ah yes, makes sense

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
