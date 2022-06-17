Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A94E54FE21
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 22:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0868F1EF4;
	Fri, 17 Jun 2022 22:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0868F1EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655496804;
	bh=GpP/AQJfNL63oKjzvzbT5EsC9mz66KqG9Wuyq6YXUq0=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1kDji3OgowhGf/uCjS2/Ln4v6DvHROw8EeTZ0QJwJyMUdG2QS9n4+uNfLmbU52tg
	 AN2akfXccA33k456QqPAIf7Vo2mxmgFId2A5NdWzrt+kGsX4yIhJrn85X2E/vWWNmr
	 G9jVk2bp2vgFts7g6giJpSi0o8PRNTlNqk7pfk1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E423F8028B;
	Fri, 17 Jun 2022 22:12:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 568E0F80527; Fri, 17 Jun 2022 22:12:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5110F8028B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 22:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5110F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LqduEKGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655496742; x=1687032742;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=GpP/AQJfNL63oKjzvzbT5EsC9mz66KqG9Wuyq6YXUq0=;
 b=LqduEKGhC8CbqkUojSS9bB5qJA2Ib5/89UH0+t5Z/v9ki8FdCQnifgvs
 /VDsmB3bnSQnP9I7DeubDJ/D4iNk3iaoD+yOmpjejJBcrGxyCIxMOP3wd
 XORfZB5sEUI18CZ0cwvvwADMTeAVIpIyTUVmbWO3iBip/qCvsOi20UiLT
 0zfOqXMS1MKpBMvUiLc3SUT6CiDqfiZsXY04hX9UbwIrf5JxSzsFJWaFC
 CMA9J+i3VuAK9wUi/1JtpVDIY1a4lhYZGix5zDOe4GrVp1OY55Un9d/Wd
 fbQmYtDG6YACJNzvW8oaarfDZy6KmkA1XhkVjYtTgvN2tzIkxdIPk1ZIy w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268293579"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268293579"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 13:12:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642170333"
Received: from patelman-mobl1.amr.corp.intel.com (HELO [10.212.115.29])
 ([10.212.115.29])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 13:12:01 -0700
Message-ID: <2b753e7f-ee15-06fb-6979-3cd6afae2000@linux.intel.com>
Date: Fri, 17 Jun 2022 15:12:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] ASoC: codecs: soundwire: call pm_runtime_resume() in
 component probe
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
References: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
 <20220616210825.132093-3-pierre-louis.bossart@linux.intel.com>
 <YqxNEjG19K/RbbFM@sirena.org.uk>
 <1ddc85ea-4e40-eb07-ee5b-8bc58514223d@linux.intel.com>
 <Yqy7xahv6vTjT/KO@sirena.org.uk>
 <ed329dca-48f7-16fd-96eb-337becd372d8@linux.intel.com>
 <59c76ae6-6d97-cdd4-ce1f-020ddf54593b@linux.intel.com>
In-Reply-To: <59c76ae6-6d97-cdd4-ce1f-020ddf54593b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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



On 6/17/22 14:05, Pierre-Louis Bossart wrote:
> 
>>>> What this patch does it make sure that the bus is operation when the
>>>> card is created. In usual cases, this is a no-op, this just helps with
>>>> corner test cases. It's not plugging a major hole in the pm_runtime
>>>> support, just fixing a programming sequence that was not tested before.
>>>
>>>> One possible objection is that we don't keep the reference and the bus
>>>> active until all components are probed. I tried doing this at the ASoC
>>>> core level, but that breaks all kinds of devices that have their own
>>>> quirky way of dealing with pm_runtime - specifically HDaudio and HDMI.
>>>> That's why I added this resume here.
>>>
>>>> Makes sense?
>>>
>>> Ish.  Ugh, right.  So it's not fixing anything really, it's mainly
>>> papering over cracks where things are being missed.  In any case it's
>>> not doing any harm and it helps things for now.
>>
>> You got it right. There are additional patches that were sent to use
>> pm_runtime_resume_and_get() on set_jack, and other clear cases that were
>> missed, but this is more of a blanket "do not harm" resume in case codec
>> drivers are missing something.
> 
> please wait for merges, we're chasing two regressions with nonsensical
> mixer values
> 
> numid=5,iface=MIXER,name='PGA4.0 4 Master Capture Volume'
>   ; type=BOOLEAN,access=rw---R--,values=2
>   : values=on,on
>   | dBscale-min=-50.00dB,step=1.00dB,mute=1
> 
> and a spurious log that we missed:
> 
> snd-soc-dummy snd-soc-dummy: Runtime PM usage count underflow!

The two regressions are not caused by this series.

The mixer issue already exists and is fixed with Sameer Pujar's "ASoC:
ops: Fix multiple value control type" patch.

The "Runtime PM usage count underflow" is a mistake on my side, the
patch "ASoC: soc-component: use pm_runtime_resume_and_get()" is invalid
and shall not be merged.

No other problem detected.
