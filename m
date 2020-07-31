Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017F2348CA
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 18:00:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C5A21616;
	Fri, 31 Jul 2020 17:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C5A21616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596211200;
	bh=Nswth1GPbHtSZca1QBD71V7TNm8yWQ1dxE04THoXqWM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Awfa222Z8NhDNj3CASwG1slX5Gnrw829YLXFv2X40XUNgHfQ3t+j/3mCE3aiESqcZ
	 KNZlwveyccY2Gc1A2PERH0hjulB0kChq1kui4GlclvvynNIII4pQDXwR5/r+M8mAk7
	 47DF8CSkDJGrkUyJxcHR/Hs9Q52bP37L7F79wHjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52186F80111;
	Fri, 31 Jul 2020 17:58:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7D79F80171; Fri, 31 Jul 2020 17:58:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64970F8015C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 17:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64970F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="hGQWbaoC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=ujUFkLZbgrewUAlQWe1gl9LVY0mWPCUm2rS1sbAu7cw=; b=hGQWbaoCvvWYYCYso9EAGvSZc4
 prapGMlR+gCN2qbYl9qRb3n9OdDuT1DFaFd97Rx6XrUUEu64wuboYJ+fc5fjKbbQ0xm5pRpmrYeog
 VKNajZCiyOGIQRlBWV62KOe1qiXZninN3PlO5pjdQNZuwWmjUV8TKLr3+RHdY/9DudTxpX7uryQ4w
 AtX/5RECVsb7aQPAW3BJUbwJK6L7fz7omVOsNRPYaKS3sdbiw/jeN0Rme+B4f7uCCgU90PBKhhAgP
 j/UkaHcBS65SpW9KdO6TRzH4kHhnli7CrxuuemOxcbTnGxVGQk1TEcfOYQfSbRftlSqSmQM2OjXem
 gZMZ6HHQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1k1XQ1-0002Iv-CC; Fri, 31 Jul 2020 17:58:01 +0200
Received: from [2001:a61:2517:6d01:9e5c:8eff:fe01:8578]
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1k1XQ1-000Ps1-5I; Fri, 31 Jul 2020 17:58:01 +0200
Subject: Re: [PATCH 0/3] ASoC: core: Two step component registration
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200731144146.6678-1-cezary.rojewski@intel.com>
 <1828f3a2-f198-e6cd-ca6c-c66dc1ef82d1@linux.intel.com>
 <61faef6e-70e9-5574-5f3a-e333d0a71617@intel.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <a6d3e9fb-4aa2-b75b-4535-037edb256112@metafoo.de>
Date: Fri, 31 Jul 2020 17:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61faef6e-70e9-5574-5f3a-e333d0a71617@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.3/25890/Fri Jul 31 17:04:57 2020)
Cc: alsa-devel@alsa-project.org, olivier.moysan@st.com, alexandre.torgue@st.com,
 lgirdwood@gmail.com, arnaud.pouliquen@st.com, tiwai@suse.com,
 broonie@kernel.org, mcoquelin.stm32@gmail.com
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

On 7/31/20 5:47 PM, Cezary Rojewski wrote:
> On 2020-07-31 5:07 PM, Pierre-Louis Bossart wrote:
>> On 7/31/20 9:41 AM, Cezary Rojewski wrote:
>>> Provide a mechanism for true two-step component registration. This
>>> mimics device registration flow where initialization is the first step
>>> while addition goes as second in line. Drivers may choose to modify
>>> component's fields before registering component to ASoC subsystem via
>>> snd_soc_add_component.
>>
>> I must admit I don't see where this might be used for Intel 
>> platforms, we've been happily using snd_soc_register_component() 
>> without hitting limitations.
>
> Patchset targets entire ASoC framework, not Intel catalog. As 
> _initialize and _add are already in place, having a two-step 
> registration is cohesive with other "frameworks" e.g. device one.
>
> New to ASoC? Trying to learn soc-components? Guess what, 
> creation/registration procedure is exactly the same as one you're used 
> to already!
>
>> Also the only two uses of snd_soc_add_component() seem mainly driven 
>> by memory allocation - and avoiding a devm_kzalloc in 
>> snd_soc_register_component().
>
> In general, code quality and improvements to its flow should not 
> require ton of usages. But hey, you got two already.
>
>> Out of curiosity, can you provide an example where this two-step 
>> would be required or beneficial? Thanks!
>
> Overridding component->name which is currently always tied to 
> fmt_single_name so you may choose a different name than the ->dev one.

For what it is worth, I think this is a sensible change for the outlined 
reasons. It's something I've always had in the back of my mind, but 
there was never enough of a need to actually do it.

One change I'd like to see is the addition of snd_soc_component_alloc(), 
which combines the step of kzalloc() and snd_soc_component_init() as 
these will be done pretty much always in lockstep. And it also matches 
the APIs that other frameworks offer.

- Lars

