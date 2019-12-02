Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553110EEA5
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 18:42:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFCA21663;
	Mon,  2 Dec 2019 18:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFCA21663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575308542;
	bh=CcdiN9QikojdsfLHJ5jpm4Dpg3bHwfpINqIsSUwm2E8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FF3TileT3bVazt3QjEBTdstjqFcha9BrOz1Fr+XdOupjVsVBUQSaW/Ern7bXn0Qqs
	 s8R+fttKF52kth+lu0SGf7c2nRmKwBcevOTZc/mkZcx9nFKQ/89PBMjyaOUCZ+Gpld
	 b2Cgsosz5gfnZkimsUkgq/IpGrVM3NitqAiI5V9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 434BCF80218;
	Mon,  2 Dec 2019 18:40:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03545F80214; Mon,  2 Dec 2019 18:40:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 170CDF801D9
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 18:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 170CDF801D9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 09:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="208164894"
Received: from svedurlx-mobl.amr.corp.intel.com (HELO [10.251.129.241])
 ([10.251.129.241])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2019 09:40:24 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <877e3og50x.wl-kuninori.morimoto.gx@renesas.com>
 <87pnhgeqc2.wl-kuninori.morimoto.gx@renesas.com>
 <8b7a2bc1-6d89-ea18-0816-70448cbf9cb0@linux.intel.com>
 <8736e93jd8.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dd007720-d517-c457-5000-be8f64d4fd5f@linux.intel.com>
Date: Mon, 2 Dec 2019 11:20:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <8736e93jd8.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 12/15] ASoC: soc-core: add missing
 return value check for soc_link_init()
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



On 11/27/19 12:48 AM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
>>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>>> index 79a4753..bdae48e 100644
>>> --- a/sound/soc/soc-core.c
>>> +++ b/sound/soc/soc-core.c
>>> @@ -1983,8 +1983,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>>>    		goto probe_end;
>>>    	}
>>>    -	for_each_card_rtds(card, rtd)
>>> -		soc_link_init(card, rtd);
>>> +	for_each_card_rtds(card, rtd) {
>>> +		ret = soc_link_init(card, rtd);
>>> +		if (ret < 0)
>>> +			goto probe_end;
>>> +	}
>>
>> Morimoto-san, this patch proves very useful to avoid a kernel oops
>> when a dailink init fails, but I still see a warning when cleaning-up.
>>
>> I was experimenting with a topology file that wasn't complete and came
>> across the warning below, would you have any ideas/recommendations on
>> what might be missing? I am running out of time this week so thought I
>> would ask, in case this rings a bell.
>>
>> Thanks!
>>
>> [   21.098662] bytcr_rt5640 bytcr_rt5640: ASoC: no source widget found
>> for modem_out
>> [   21.098677] bytcr_rt5640 bytcr_rt5640: ASoC: Failed to add route
>> modem_out -> direct -> ssp0 Tx
>> [   21.098694] bytcr_rt5640 bytcr_rt5640: ASoC: no sink widget found
>> for modem_in
>> [   21.098703] bytcr_rt5640 bytcr_rt5640: ASoC: Failed to add route
>> ssp0 Rx -> direct -> modem_in
>> [   21.098732] bytcr_rt5640 bytcr_rt5640: ASoC: failed to init
>> SSP2-Codec: -19
> 
> Do you mean, it could save you from Oops, but you still have warning ?

Correct.

> 
> It seems soc-dapm::snd_soc_dapm_add_routes() failed.
> Your kernel is missing widget route/path ?
> Or, sound card driver has some issue ?
> 
> I have been faced this error many times.
> I don't remember detail, but, if my memory was correct,
> it was always card driver setup timing, or missing something, in my case.

In this case it's a bad topology that does not contain widgets that the 
machine driver uses. Still that should be handled gracefully without 
warnings.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
