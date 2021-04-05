Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB03546F8
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Apr 2021 21:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7581116F6;
	Mon,  5 Apr 2021 21:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7581116F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617649793;
	bh=C1kVRHv4egJZxd8crIBfz0dUkFBY/ilNR+zaMLfSmXk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6pH46x2tlEzi2moBfK9sBtHP9RVhe2dg9YUshZcQN3LQjqL0KqyJJ7pIe45meDbS
	 bFh9WMO/mRw0bxoVeZReap+EWxEVCo0IZ+3Fr0Oq3wi1/7QcVdRzR1ZJPxmIV9XbKR
	 Mu9ILcPYZfgedxRHepsquhHC7hvRybgOVUtPA7tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A79F80164;
	Mon,  5 Apr 2021 21:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AB4FF80124; Mon,  5 Apr 2021 21:08:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB889F80124
 for <alsa-devel@alsa-project.org>; Mon,  5 Apr 2021 21:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB889F80124
IronPort-SDR: nDq1FQNa+xm2GXWGHR1Pa722qCOm/TgAFV5CN1+o7DTSpCoL1KGLLA7/VcbWdGOV3QmjqXHJm1
 yzzhGxJvFZlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="192946586"
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; d="scan'208";a="192946586"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 12:08:08 -0700
IronPort-SDR: VWi1JLsaZAVvlqpxRGMKsBvp7vRhCLW0BNV7GqwgsSiEF1Q1owbQdpqfXMGs2hcLW2cFMQOtE1
 D0ApP9YDiFnw==
X-IronPort-AV: E=Sophos;i="5.81,307,1610438400"; d="scan'208";a="420847777"
Received: from esiow1-mobl1.amr.corp.intel.com (HELO [10.212.57.118])
 ([10.212.57.118])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 12:08:05 -0700
Subject: Re: [PATCH] ASoC: amd: Add support for ALC1015P codec in acp3x
 machine driver
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
References: <1617095628-8324-1-git-send-email-Vijendar.Mukunda@amd.com>
 <82817878-a30d-2b0c-07f8-48bcca3ebc80@linux.intel.com>
 <a55c7a75-22ab-31fc-81b3-ed8fa24027f4@amd.com>
 <20210330153534.GF4976@sirena.org.uk>
 <cd0d87e0-caa5-b671-9c91-1c5f35c2f017@linux.intel.com>
 <972d38d8-39c8-66d7-292d-37c1f0e027bd@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b330ca5e-1162-29c9-d846-fbfbd9db638f@linux.intel.com>
Date: Mon, 5 Apr 2021 11:24:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <972d38d8-39c8-66d7-292d-37c1f0e027bd@amd.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org,
 Sunil-kumar.Dommati@amd.com, kent_chen@realtek.com,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, shumingf@realtek.com,
 Tzung-Bi Shih <tzungbi@google.com>, Alexander.Deucher@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 flove@realtek.com, Akshu Agrawal <akshu.agrawal@amd.com>
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



>>>>>>    static const struct acpi_device_id acp3x_audio_acpi_match[] = {
>>>>>>        { "AMDI5682", (unsigned long)&acp3x_5682},
>>>>>>        { "AMDI1015", (unsigned long)&acp3x_1015},
>>>>>> +    { "AMDP1015", (unsigned long)&acp3x_1015p},
>>>
>>>>> This isn't a valid ACPI ID. AMDP does not exist in
>>>
>>> ...
>>>
>>>>> There was a similar issue with Intel platforms using this part, we had
>>>>> to use a different HID.
>>>
>>>> Is it okay if i use "AMDI1016" for ALC1015P?
>>>
>>> That's valid, though obviously you might regret that later on if someone
>>> releases a CODEC with a 1016 name (equally well ACPI being what it is
>>> there's no good options for naming).
>>
>> wish granted, the 1016 already exists :-)
>> you may want to align with what we did for Intel and use the same HID: 
>> RTL1015
> 
> As per RTK team inputs, "RTL1015" ACPI HID is in use for RT1015p codec 
> driver.
> RTK team suggested us to use "RTL1015A" as ACPI HID.
> Let us know, if we can use "RTL1015A" as an ACPI HID?

Not if you want to be compliant. The part ID remains pegged to 4 hex 
digits, no matter what the vendor ID representation is.

The only solution I can suggest is using the PCI ID 0x1002, ie.

AMDI1015 -> AMD platform with RT1015
10021015 -> AMD platform with RT1015p

Note that it's not only ACPI's fault, other standards also only allow 
for 16 bits for part IDs, we'd have the same issue with SoundWire.
