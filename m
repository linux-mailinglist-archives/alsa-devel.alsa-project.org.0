Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 487372A0BE9
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 17:56:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0DC81658;
	Fri, 30 Oct 2020 17:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0DC81658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604076977;
	bh=jumTg99QhxBe1QGvNjH8MMWNfc09B+CIFrqDnxnCjNk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ku9vMIH+S9e/k5sC5kG/Ip191fhLYym3NneiwALkBTGbnmgLdxd7szW8+6KBOJ6GI
	 It2IbtBp/ryKQgJb3TOJuMmyucU30oLx+EcJSwd/7DB4k9hHxC6uL1/x6mmWo5N3e3
	 7XWVoJhJVdIJUVV+kevl/z+X/NShN+D9hpfZTlaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 228C8F80249;
	Fri, 30 Oct 2020 17:54:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B105F80212; Fri, 30 Oct 2020 17:54:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B55F0F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 17:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B55F0F800FF
IronPort-SDR: rofsWRzlCNsg+/l5xAYKWLy7t7BN9qOml5mKIXbW4fbHuBbgIjxVm0QCUNJg914V33sNuQ8QuH
 0D9g4whNt57Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="165136818"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="165136818"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 09:54:36 -0700
IronPort-SDR: PLekFtLEEY6YTiYO9pHHlQ2RtiqVwr2QLS6Dk/6e85wc5VXor0qhwFoEcmpxbknRBx5PX/4SMx
 bENMMqlCIQ5w==
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="469577604"
Received: from rdchavez-mobl2.amr.corp.intel.com (HELO [10.212.91.180])
 ([10.212.91.180])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 09:54:34 -0700
Subject: Re: [PATCH 2/2] ASoC: intel: sof_rt5682: Add quirk for Dooly
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20201030063654.25877-1-brent.lu@intel.com>
 <20201030063654.25877-3-brent.lu@intel.com>
 <c83b3f20-2afd-12da-c349-31f35f8f6aa5@linux.intel.com>
 <DM6PR11MB3642F7AB13991ACF8A32B1DE97150@DM6PR11MB3642.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <95b8d2f7-3b8d-ee61-c99f-a62fce165618@linux.intel.com>
Date: Fri, 30 Oct 2020 11:54:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB3642F7AB13991ACF8A32B1DE97150@DM6PR11MB3642.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>, "Wang,
 Rander" <rander.wang@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, "Zhi, Yong" <yong.zhi@intel.com>
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



On 10/30/20 11:44 AM, Lu, Brent wrote:
> , Brent Lu wrote:
>>> This DMI product family string of this board is "Google_Hatch" so the
>>> DMI quirk will take place. However, this board is using rt1015 speaker
>>> amp instead of max98357a specified in the quirk. Therefore, we need an
>>> new DMI quirk for this board.
>>
>> Do you actually need a DMI quirk for this platform?
>>
>> the .driver_data below uses the exact same settings as what you would use
>> with the generic solution based on ACPI IDs, see below.
>>
>> Wondering if patch1 would be enough?
>>
> 
> Dooly has DMI family string " Google_Hatch" so the DMI quirk will overwrite the
> driver_data. I asked google but they prefer not removing this string so it seems to
> me that one extra DMI quirk is needed.

I find this pretty funny. The PRODUCT_FAMILY was added to reduce the 
number of quirks, but of course there's a variant that has nothing to do 
with this 'FAMILY'.

You should add a comment on this, to make sure this information remains 
in the code and we don't lose it during code cleanups.

> 
>                  {
>                                  .callback = sof_rt5682_quirk_cb,
>                                  .matches = {
>                                                  DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Hatch"),
>                                  },
>                                  .driver_data = (void *)(SOF_RT5682_MCLK_EN |
>                                                                                  SOF_RT5682_MCLK_24MHZ |
>                                                                                  SOF_RT5682_SSP_CODEC(0) |
>                                                                                  SOF_SPEAKER_AMP_PRESENT |
>                                                                                  SOF_RT5682_SSP_AMP(1)),
>                  },
> 
> The other way is using acpi_dev_present() in probe to update the quirk with correct
> codec setting. Which one do you think is better?

The DMI quirk you added is probably better for now, I don't know if the 
odds of getting things right with acpi_dev_present() are that high or if 
we are going to get even more variants on top of this variant (e.g. 
tweeter/booster cases...).
If we get too many quirks we'll see later if we can simplify.

So if you don't mind adding a comment on the 'Dooly' quirk in a v3 that 
series is good to go.  Thank you!

