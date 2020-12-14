Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF762D9D56
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 18:14:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 387671783;
	Mon, 14 Dec 2020 18:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 387671783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607966049;
	bh=nxMQYiF4bmKWiy3sjXp1HWbLNQe6OkT5zHVT1iAI9kg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lwA4mc0/24v5AAKb/QPziyrF9pTcCfK1DbQwljZKWZD3jx2Nu9gb1RYyTle9Q5wMY
	 4by8OsIKu3N/swET/4pu/cxo5hpoK1HIC5bG9/s7oBe9MTnOJ9qiMU3q9X+Ii/DAnY
	 XnrL6ynTkZU6wqPKmzuExNCuREBjKRzW5vnHy4B0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A61F3F80240;
	Mon, 14 Dec 2020 18:12:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87D8CF801F7; Mon, 14 Dec 2020 18:12:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B370EF80121
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 18:12:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B370EF80121
IronPort-SDR: 9S7FTYUTBSlVwsmlm+OenhLj2CFFGNGRDBT2w/b5YOz4eID2fYOvz7xIS0LjMyv2d2qWTGnc3n
 Cz9xL2I2nn7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="153974806"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="153974806"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 09:12:25 -0800
IronPort-SDR: Lm5otmU7jX1gdy7grGunV9LIRMpxcSr5FRaKyAtAYgxjpZgaEsXmhwshwe08779i8bYJBRxGno
 eLUIvbYSgvQw==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="367515888"
Received: from mnpatel-mobl.amr.corp.intel.com (HELO [10.209.33.233])
 ([10.209.33.233])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 09:12:23 -0800
Subject: Re: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume control
To: Jaroslav Kysela <perex@perex.cz>, jack.yu@realtek.com,
 broonie@kernel.org, lgirdwood@gmail.com, Takashi Iwai <tiwai@suse.de>
References: <20201214064903.2746-1-jack.yu@realtek.com>
 <8eeddc8c-91cb-e62d-6114-547117d4d83e@perex.cz>
 <0096059b-de76-d9a3-2446-b4c3becabce8@linux.intel.com>
 <0b0afd81-0595-c661-ec1e-e81b7e8f8fec@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7d74544f-77f2-db01-db3d-d1d8a56d576d@linux.intel.com>
Date: Mon, 14 Dec 2020 11:12:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0b0afd81-0595-c661-ec1e-e81b7e8f8fec@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 derek.fang@realtek.com, flove@realtek.com, shumingf@realtek.com,
 bard.liao@intel.com
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

Hi Jaroslav,

>>>> Add main capture switch and main capture volume for callback to be in
>>>> single operation.
>>>
>>> Could you be more verbose, what you're trying to do in the patch description?
> 
> I see that it's just additional volume coupling functionality (one control,
> set all four output volume/switch registers, right?).
> 
> Some points:
> 
> 1) the separate volume controls don't send change events back to the user
> space when the coupled capture settings is applied and versa vice - no sync
> 2) we have already virtual master API - sound/core/vmaster.c which should
> cover this requirement
> 3) I don't see the purpose for this coupling (the capture direction)

That was for UCM integration - agree the context was not well captured 
in the commit message

We have 'Capture Switch' and 'Capture Volume' statements that are 
required, and currently mistakenly set to SOF controls when they should 
be codec controls.

So when we have several possible inputs controls for the codec (ADC 07 
or ADC 27) depending on the microphone settings, which one should be 
used in UCM?

We thought this would simplify the UCM integration by adding one generic 
control. If you have a better suggestion we are all ears.

>>>> +	 * "Main Capture Volume" looks the same as "ADC 07 Capture Volume",
>>>
>>> I would just use "Capture Volume" and "Capture Switch" here without the Main
>>> prefix to follow other drivers.
>>
>> It's similar to the 'Master Capture Switch' used in HDaudio, what other
>> drivers were you referring to?
> 
> HDAudio is using just 'Capture Switch' and 'Capture Volume' for the root
> capture controls plus the input selector (enum). The Master prefix is used
> only for the playback direction. And the word master is not prohibited for the
> audio context, is it?

The naming is not the problem, we can remove the 'main' if needed, the 
point is how to go about UCM integration.

