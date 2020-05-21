Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1F51DD5C4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 20:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9C971854;
	Thu, 21 May 2020 20:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9C971854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590084778;
	bh=5Yh1eNhRVpfBeCqP/LhxxzL+7ozJTGLC0hWHIKO40jg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFEQnPnozBHQNCNI/3f+3TrEKNy+UblLQhiDlaeVCjDnJl3MUfUnbJGux57FzvFZE
	 aoOlJChdMVYW8kPMTgsnZ6PPw0bAXvc23+lQS3JY8M4Itxn9jhJfrT47fdT6mdZnFK
	 PjQY/WPHK41bEXOvFQxaOWt5FLM2aOI3exy5nbzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94060F80161;
	Thu, 21 May 2020 20:11:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E55E8F80256; Thu, 21 May 2020 20:11:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34FC7F80161
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 20:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34FC7F80161
IronPort-SDR: ETlsU9xsvSIpjVwfLn6kgk5W7vmleEvs8zNwq6ZZfdOtuW/2yKLW5KO59X2fMVaKExdkWENJ1c
 9hXn5XFiUKkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 11:10:55 -0700
IronPort-SDR: JCuh9H/hp4YFzm3n4ukF0/9cPkRoVB2FWwSZl79U6XjFPyn3ZlfO784xWpxfyjmANOsbTNVHqS
 zGY1qBPYO/7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,418,1583222400"; d="scan'208";a="254062243"
Received: from dsrao-mobl.amr.corp.intel.com (HELO [10.255.229.80])
 ([10.255.229.80])
 by orsmga007.jf.intel.com with ESMTP; 21 May 2020 11:10:54 -0700
Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: =?UTF-8?Q?=c5=81ukasz_Majczak?= <lma@semihalf.com>
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
 <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
 <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
 <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <268b11b6-9f4c-d769-a7f9-536d77198705@linux.intel.com>
Date: Thu, 21 May 2020 13:10:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Harsha Priya <harshapriya.n@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bob Brandt <brndt@google.com>,
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



On 5/21/20 12:30 PM, Łukasz Majczak wrote:
> Hi Pierre
> 
> If you will take a look at the original kabylake_ssp_fixup() you will
> see that it is checking whether the related FE is "Kbl Audio Port",
> "Kbl Audio Headset Playback", "Kbl Audio Capture Port" or "Kbl Audio
> DMIC cap" - then for the first 3 cases it sets min/max channels to 2
> while for the "Kbl DMIC cap" it can be 2 or 4, that's is why I'm
> trying to split this, but maybe I'm missing here something.

I don't understand this code either.

I believe the intent is that for all SSP1-RT5663 usages, we should use

  		rate->min = rate->max = 48000;
		chan->min = chan->max = 2;
		snd_mask_none(fmt);
		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);

That is pretty easy to move to a dedicated ssp1 fixup.

for SSP0, we have RT5514 for capture and max98927 for playback, but the 
existing code does not explicitly deal with rate/channels/format for all 
cases, so it's not clear what should happen.

Harsha, can you help here?

> 
> Best regards,
> Lukasz
> 
> czw., 21 maj 2020 o 19:17 Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> napisał(a):
>>
>>
>>
>> On 5/21/20 12:08 PM, Łukasz Majczak wrote:
>>>>
>>>> don't add a new dailink, this is not right.
>>>>
>>> Can you advise a better solution how to assign different fixup
>>> functions to mic and to speakers? I was looking at "dmic01" dailink in
>>> skl_nau88l25_max98357a.c as an example.
>>
>> I am not sure I follow. the DMICs are handled on a shared SSP, so how
>> would one set a different fixup? The word length have to be the same.
