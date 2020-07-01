Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 443EF21110D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 18:50:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8A961688;
	Wed,  1 Jul 2020 18:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8A961688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593622209;
	bh=9yOVr4qOgk03XtSkEixCsQ8DspNpEIilMaC3NDAM4cE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9wAwwi2heyFJbgnx5DDbnzGOD875WKCSb/Ve5+OuzpS2Bm2F2njks8mXwKyhQNi/
	 f98E53YqaAq902Sqb60y5EfLVQSLr4t3w9NMPP/zCRAUN8lfMrA7eHRTEHg8OV6uff
	 EKAX3m1qeoyB3EvK9zZ3+w7ajX1Nm+k03v5oM6Dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDFB7F8021D;
	Wed,  1 Jul 2020 18:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4102AF80217; Wed,  1 Jul 2020 18:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46736F801D8
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 18:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46736F801D8
IronPort-SDR: tppwL6OeZG0MRdSwNONwFJeVHOerwIvexs8xQgoYUESmSx7mDYe35NkQlSnAzS21kyesY6XaVK
 Et1QuOC5AvRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="211693587"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="211693587"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 09:48:20 -0700
IronPort-SDR: ywwjct/MbgHFM/ViP9O9jEEhk1M7aKesW/NJjeFQnWmYsFWc6cSzOYE9BcpU3t2rIRRgEn4U84
 lRc91hDufqxg==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="455167707"
Received: from dsapozni-mobl1.amr.corp.intel.com (HELO [10.251.16.243])
 ([10.251.16.243])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 09:48:18 -0700
Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: "N, Harshapriya" <harshapriya.n@intel.com>,
 =?UTF-8?Q?=c5=81ukasz_Majczak?= <lma@semihalf.com>
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
 <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
 <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
 <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
 <268b11b6-9f4c-d769-a7f9-536d77198705@linux.intel.com>
 <CAFJ_xboUTDtnpvskb2dY4fGhGLNkEgT0sH3dU0NYJV_Cb_gqPw@mail.gmail.com>
 <BY5PR11MB4307284BAE6DA415CFC0865CFD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <CAFJ_xbq3DU8NMmymYHLjy0z+QbGRAOmB4NaiXPphAr2Zu0MPAg@mail.gmail.com>
 <BY5PR11MB4307CBA736456853777A9FD9FD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <BY5PR11MB4307C20278F32D17551112FAFD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7e38bb2e-2132-d305-e94d-043fa53bd836@linux.intel.com>
Date: Wed, 1 Jul 2020 11:48:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB4307C20278F32D17551112FAFD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>
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



On 7/1/20 11:37 AM, N, Harshapriya wrote:
>>
>>>> For speakers and headsets its 48Khz, 2 ch and 24 bit and this
>>>> setting is done based on the front-end dai For speakers, however
>>>> support only
>>>> 16 bit, so we set it back to 16 bit If the front end dai is dmic,
>>>> then the channel
>>> is set to either 2 or 4 dmic_constraints. No other formats need to be set.
>>>>
>>>> All the SSP1 usages do not have the same parameters (as dmic is on
>>>> SSP1 and its different as given above) Most parameters are same for
>>> speakers and headset which are on different SSP. This is the reason we
>>> had a single fixup function.
>> On SSP1, for dmic we need to fix the channels which is derived from dmic_num
>> of the snd_soc_acpi_mach structure based on the number of dmic on the
>> board.
>> The channel is something that might be different from speakers.
>> We might not want to constraint the dmic capture to always be 48Khz as well.
>> Given this, there seems to me, 2 ways to set it:
>> 1. Derive if the fixup is being called for dmic or speaker 2. Having a new dailink
>>
>> If #2 is not preferred (going by Pierre's comments), can we use rtd-
>>> cpu_dai/codec_dai->name to figure out if its for dmic or speaker?
>> I can test this and get back to you.
> Tested and the following is something we can use without creating a new dailink.
>         	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> 	if (!strcmp(codec_dai->name, KBL_REALTEK_DMIC_CODEC_DAI)) {
> 		if (params_channels(params) == 2 ||  DMIC_CH(dmic_constraints) == 2)
> 			channels->min = channels->max = 2;
> 		else
> 			channels->min = channels->max = 4;
> 	} else {
> 		rate->min = rate->max = 48000;
> 		channels->min = channels->max = 2;
> 		snd_mask_none(fmt);
> 		snd_mask_set_format(fmt, pcm_fmt);
> 	}
> 
> Pierre, thoughts?

thanks Harsha, that looks like what I had in mind, but my earlier 
question was why we deal with the rates and formats only in the last case?

