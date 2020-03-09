Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EFB17E5E3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:40:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C25FD16A2;
	Mon,  9 Mar 2020 18:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C25FD16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583775637;
	bh=x95hiN7AoVyeQYkeI9AS7l8A+EGs9LHurtxuD+nT4vU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qTOlGQeocxdoS2tOgubF+gckgISiQ2CFx9mNRwiTBBMKFBe8D5ODOaRb0D/lkg5/k
	 ciYTqcySmafLZ+kqKl7x3eSm6xj59B2e3+LFiJI5aiaBNPfmFsx4q8YoGmXsEEO6Zf
	 U7Vfa2WFi4sOeL8DUwP+xh7oKSwyPl2aT214TO44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44268F80260;
	Mon,  9 Mar 2020 18:39:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC400F8028D; Mon,  9 Mar 2020 18:38:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BFF0F80260
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:38:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFF0F80260
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 10:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="231008955"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.110])
 ([10.252.15.110])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2020 10:38:50 -0700
Subject: Re: [PATCH 4/7] ASoC: Intel: Skylake: Shield against no-NHLT
 configurations
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <20200305145314.32579-5-cezary.rojewski@intel.com>
 <7f74b049-4659-9656-4396-3c1b42d2e32c@linux.intel.com>
 <2a380994-a723-ea25-7feb-6a650a3889e3@intel.com>
 <d38dbb00-734f-7de9-ce0c-2ee06cec11d6@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <740bc65e-afe9-cefe-4a31-d19cc9d83c56@intel.com>
Date: Mon, 9 Mar 2020 18:38:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d38dbb00-734f-7de9-ce0c-2ee06cec11d6@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: vkoul@kernel.org, broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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

On 2020-03-09 18:01, Pierre-Louis Bossart wrote:
> On 3/9/20 8:03 AM, Cezary Rojewski wrote:
>> On 2020-03-06 22:03, Pierre-Louis Bossart wrote:
>>>
>>>
>>>> -    intel_nhlt_free(skl->nhlt);
>>>> +    if (skl->nhlt)
>>>> +        intel_nhlt_free(skl->nhlt);
>>>
>>> we could alternatively move the test in intel_nhlt_free, which seems 
>>> like a more robust thing to do?
>>
>> Depends. In general kernel-internal API trusts its caller and 
>> appending 'ifs' everywhere would unnecessarily slow entire kernel 
>> down. While intel_nhlt_free is called rarely, I'd still argue caller 
>> should be sane about its invocation.
>>
>> 'if' in skl_probe could be avoided had the function's structure been 
>> better. 'if' in skl_remove is just fine, though.
>>
>> Let's leave it as is.
> 
> it's also used in SOF:
> 
> sound/soc/sof/intel/hda.c:              intel_nhlt_free(nhlt);
> 
> that's why I suggested to factor the test so that both users don't need 
> to add the if.

I understand, and my explanation still applies.

SOF's intel_nhlt_free usage is great example actually. Caller is sane 
about its doings as it should be. Internal API needs not to suffer from 
callers irresponsibility.

PCM does not call ::free() if ::open() fails, same as device-driver 
model does not care about ::remove() if ::probe() fails.

Czarek
