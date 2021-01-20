Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9C2FD5C3
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 17:35:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59891763;
	Wed, 20 Jan 2021 17:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59891763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611160512;
	bh=Sgiv29HNOW6r6YGFRorjQeaGnW6FceEsa7hvmdI24Rk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRhulkrS9Phl3+F1SZQ/5YXww3ze4bINtWOXOLA+ben5MPNtHPSw552R4UMJmt+KP
	 GsxCOUROUZ5YOaqG+C0dbjhruYB4EqVSjlDmQl8VzhP+BenLKjbTz87Oord8H0xqzg
	 TRwkr9WvdXBKV0SZMKGFGAmiknDziYN/Z7XNEeNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A011F80137;
	Wed, 20 Jan 2021 17:33:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79B7FF8016E; Wed, 20 Jan 2021 17:33:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BB11F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 17:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BB11F80164
IronPort-SDR: XFQQgwUPhMubenC4ax4z17fOLUayhk2qvq2zxtMo+hk/6RavmTNZwzvyYSN0XwFZJy09Tht19l
 gC4DOAuwUgMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="166798890"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="166798890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 08:33:23 -0800
IronPort-SDR: NaTwmjflADhRHtNI8n0obvI0Q7vHMzOHK+6I23GOLIWvsfLcOL1dFqajClmMBmHE+qn0RzpzKd
 YIBVWTkaq5xw==
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="426954211"
Received: from yperets-mobl1.ger.corp.intel.com (HELO [10.209.89.231])
 ([10.209.89.231])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 08:33:21 -0800
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: Check the kcontrol against NULL
To: =?UTF-8?Q?=c5=81ukasz_Majczak?= <lma@semihalf.com>
References: <20201210121438.7718-1-lma@semihalf.com>
 <20201217130439.141943-1-lma@semihalf.com>
 <CAFJ_xbprw7UKREWgRAq3dDAA9oC_3cWoozn5pCY8w9By4dASag@mail.gmail.com>
 <CAFJ_xbrvr7jcCB57MPwzXf=oC5OYT5KUBkcqHYyOYH=a5njfSA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8c22c415-1807-b673-20e3-bc8d7f4c05b7@linux.intel.com>
Date: Wed, 20 Jan 2021 10:33:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFJ_xbrvr7jcCB57MPwzXf=oC5OYT5KUBkcqHYyOYH=a5njfSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Guenter Roeck <groeck@google.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Radoslaw Biernacki <rad@semihalf.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@google.com>
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



On 1/20/21 9:49 AM, Łukasz Majczak wrote:
> Hi Pierre,
> 
> Is there anything more to do to get the ACK for this patch?

Adding Cezary and Amadeusz for feedback, I can't pretend having any sort 
of knowledge on the Skylake driver internals and topology usage.

> Best regards,
> Lukasz
> 
> wt., 12 sty 2021 o 12:34 Łukasz Majczak <lma@semihalf.com> napisał(a):
>>
>> Hi,
>>
>> This is just a kind reminder. Is there anything more required to
>> upstream this patch?
>>
>> Best regards,
>> Lukasz
>>
>>
>> czw., 17 gru 2020 o 14:06 Lukasz Majczak <lma@semihalf.com> napisał(a):
>>>
>>> There is no check for the kcontrol against NULL and in some cases
>>> it causes kernel to crash.
>>>
>>> Fixes: 2d744ecf2b984 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHLT")
>>> Cc: <stable@vger.kernel.org> # 5.4+
>>> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
>>> Reviewed-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
>>> ---
>>>   sound/soc/intel/skylake/skl-topology.c | 14 ++++++++++----
>>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>>   v1 -> v2: fixed coding style
>>>
>>> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
>>> index ae466cd592922..8f0bfda7096a9 100644
>>> --- a/sound/soc/intel/skylake/skl-topology.c
>>> +++ b/sound/soc/intel/skylake/skl-topology.c
>>> @@ -3618,12 +3618,18 @@ static void skl_tplg_complete(struct snd_soc_component *component)
>>>          int i;
>>>
>>>          list_for_each_entry(dobj, &component->dobj_list, list) {
>>> -               struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
>>> -               struct soc_enum *se =
>>> -                       (struct soc_enum *)kcontrol->private_value;
>>> -               char **texts = dobj->control.dtexts;
>>> +               struct snd_kcontrol *kcontrol;
>>> +               struct soc_enum *se;
>>> +               char **texts;
>>>                  char chan_text[4];
>>>
>>> +               kcontrol = dobj->control.kcontrol;
>>> +               if (!kcontrol)
>>> +                       continue;
>>> +
>>> +               se = (struct soc_enum *)kcontrol->private_value;
>>> +               texts = dobj->control.dtexts;
>>> +
>>>                  if (dobj->type != SND_SOC_DOBJ_ENUM ||
>>>                      dobj->control.kcontrol->put !=
>>>                      skl_tplg_multi_config_set_dmic)
>>> --
>>> 2.25.1
>>>
