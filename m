Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D6E6487CC
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 18:32:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5DE2212;
	Fri,  9 Dec 2022 18:31:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5DE2212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670607151;
	bh=6gaByd85Ir5jpC5TjpFdxoKpv9W8N2P7lwLZnGk0xEw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ppkFkkkcHct3EC5I/FWOiJvRi0lbAb/Ssvzge0z7/sPdO57l56yUupjlRnaSCAELu
	 AHOBW5bNjIKKCcPT01eRGa7spD+bJyE/DBShsUjq7wNQAZBLpyimNixST9JtHsTraj
	 B0ottDX+h3U/AyEpX3nUXPC9qSZN/zIf+qlWbEzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37297F800F8;
	Fri,  9 Dec 2022 18:31:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31204F800F8; Fri,  9 Dec 2022 18:31:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18E0EF800F8
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 18:31:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18E0EF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F9lb5mf+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670607092; x=1702143092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6gaByd85Ir5jpC5TjpFdxoKpv9W8N2P7lwLZnGk0xEw=;
 b=F9lb5mf+nIz6SVU9R4KchFlOKjf7SKcnV+zuYKE+Pm/qWEbfHehIhZ2M
 8ZO3XcEae5kseK3wheV4l1iHJV0taAXPdHLpHqCtnGp+MKfqQgQtKi2J/
 TxHcB92Ec9OJmNVKX0Rucbgtb8iPvvyJjkNnE15OJOjnRopmyDplNQE29
 0WG/U990yEDAjP0EjMmqISEO5Qecs72fXktjyZCjTuIzP23UNpBTQQbVA
 +fE+pjiTUsMJ/DlBbwAKGH4FRek0VfU4IJHYderclYSYuPkEFK25ZrjaU
 tcGzdhBnEuqzH2pey4sW1LZ/OpZMjaedLc0W5q+Y/CNj0VPJO6xSuHjZJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="316213602"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="316213602"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 09:31:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="625180439"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="625180439"
Received: from bdmeredi-mobl2.amr.corp.intel.com (HELO [10.212.15.195])
 ([10.212.15.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 09:31:25 -0800
Message-ID: <22043956-e18c-9ed6-5091-188ae40f3cd9@linux.intel.com>
Date: Fri, 9 Dec 2022 11:31:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v1] ASoC: Intel: sof_nau8825: add support for nau8825 with
 amp nau8318
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
References: <20221209150503.11875-1-ajye_huang@compal.corp-partner.google.com>
 <eca17001-93ff-d379-1ab2-2927f1831e78@linux.intel.com>
 <CALprXBayJtWRe9J+q7EahgpXrRy_B-tMAf0KXbDtWa+=4RKyHA@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CALprXBayJtWRe9J+q7EahgpXrRy_B-tMAf0KXbDtWa+=4RKyHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, "balamurugan . c" <balamurugan.c@intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>




>> This looks inconsistent with the commit message. There are separate
>> Kconfigs for different codecs.
>>
>> SND_SOC_NAU8315
>> SND_SOC_NAU8825
>>
>> Which is it?
>>
> 
> Sorry about confusing you, I think it is better to change the title as
> ASoC: Intel: sof_nau8825: add combination of nau8825 headset codec
> with nau8318 Amp.

Suggested edit:

ASoC: Intel: sof_nau8825: add variant with nau8318 amplifier.

> 
> And add some information about Nuvoton chips in the comment message.
> ***
> The nau8315 and nau8318 are both Nuvoton Amp chips. They use the same
> Amp driver nau8315.c. The acpi_device_id for nau8315 is "NVTN2010",
> for nau8318 is "NVTN2012".

That should be added in the commit message please.

>> NAK for this v1. Please clarify which codec you are using and make sure
>> all references are consistent.
>>
>>
> 
> I apologize for the unclear comment message, please give me any
> suggestions if needed, and I will send v2 for review.
> thanks.

Ok, makes sense now. Please do include the explanations on 8315/8318
variants, I couldn't figure out what chips were used.

I would also not use the same topology name as a different platform with
another amplifier. I appreciate you trying to reuse when possible, but
it's just better to create a new topology file. That way if you want any
update down the road you can do so, it's more maintainable and risk-free.
