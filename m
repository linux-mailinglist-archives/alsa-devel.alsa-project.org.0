Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4427680C01A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 04:42:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFDB3950;
	Mon, 11 Dec 2023 04:42:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFDB3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702266170;
	bh=rU9OUjFWh2TqTP6yoo68g2xplUOrMTa/ThfHXcMz0pw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A2UYOgvxx1kfb6I4S1Wwlb1BJkwGRoXU11+sOpPpGWEAw2wfx9hav4kJHvTZLLLak
	 7xOYELrlR+yRjFa+MGAn1fyRICpe+yW+788AkOsA/oIxQFeToucJem+F8ER40G8VSL
	 knKGUVpBbdQYaCvcQLaUnGCdxKd6b5kN3NBr7nwU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28194F8020D; Mon, 11 Dec 2023 04:42:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3514F80571;
	Mon, 11 Dec 2023 04:42:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6368FF80124; Mon, 11 Dec 2023 04:36:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4182F8001F
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 04:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4182F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NemB4b7d
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5510479806dso1216298a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 10 Dec 2023 19:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702265590; x=1702870390;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqNPXHMTB4FcRiyJZx6FRt2mBNVGf6u2fS63Yrzy71c=;
        b=NemB4b7dJMG5LDL8JUGR0xMAXdyRyGQUUGdgx9zbBns2d7f2QShQW1WFzxnb0vzFyg
         594ttJaxDwM7ReZ6Ev/qMWc3H0mLHQaCtMEdyatFmTnCWWIBSfrvIDh5jrP4esJpuLHx
         eKp1dg2Q+0eXAAqB7qG/DwmOP4F6FCcoicR4tqpa0WIQPyYAZ2IpA4RWn6kccUS8X4lT
         hAMJDtc8HMCcnXNil0drKx3MbYFHXBrqVu8eCUDUaru8wgNs/opbFJPgsXbKSD7id5b/
         +CvC1KtS7oKsSeAVg47BaR7ru5wd1YnIUpr6KEEyP0UHXNv+ob7XqwxG4GKQkyNvitgw
         BF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702265590; x=1702870390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqNPXHMTB4FcRiyJZx6FRt2mBNVGf6u2fS63Yrzy71c=;
        b=s7ii9OSizk3EHUScrna/0uXTbBcgQq/sRyjFN5FVe1Ivr/tIALAaTYhDMzab8KdXUQ
         0pxExkahJjTrHueaWrQYHDycg2KzFosoeWSK0SJx4cqhEH9z/L6fNSGZttW+qA3BksIB
         71BxihOvljiGsRcim7gYHnhsji/duLWJh3HVapo32wIXUQ85cbwkgtNEopD/ZEHu2b1S
         dHJzctmZgTVjy6n/ZAFFR7zjRgTPjDwQBSCwpAPk+SC3jvPCZYZaQ4ITv8egWCSxio+5
         Gcr5wrGseyMuZpTPBcJuHhElg+OcrTDPvlIV3cy9+KUapoZjYKwS3R+5Q132sk89aTcR
         t2zw==
X-Gm-Message-State: AOJu0Yzz3NidcDAoasVkBWgG6jJimcgrSANXJbWFs0E/VQYVR20k7H7j
	U6zeiGn8e+lS7trQIwQbns1vhQ==
X-Google-Smtp-Source: 
 AGHT+IF8Dlajrv6pbvu0jejDFv94gGz6TWGl172LjPCSXoBDXsO+7DBqbrZGe8N1+N5g0QfMuU1TPg==
X-Received: by 2002:a05:6402:903:b0:54c:79cc:dad1 with SMTP id
 g3-20020a056402090300b0054c79ccdad1mr1226451edz.54.1702265590308;
        Sun, 10 Dec 2023 19:33:10 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id
 dk11-20020a0564021d8b00b0054c8415f834sm3211782edb.34.2023.12.10.19.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 19:33:09 -0800 (PST)
Message-ID: <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
Date: Mon, 11 Dec 2023 03:33:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: 
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: B7TNX3OVYMMJRLC7Z6EQVWPCONVPCKEJ
X-Message-ID-Hash: B7TNX3OVYMMJRLC7Z6EQVWPCONVPCKEJ
X-MailFrom: tudor.ambarus@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B7TNX3OVYMMJRLC7Z6EQVWPCONVPCKEJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/8/23 17:05, Mahapatra, Amit Kumar wrote:
> Hello Tudor,

Hi!

> 
>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Wednesday, December 6, 2023 8:00 PM
>> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
>> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
>> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
>> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
>> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
>> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
>> michael@walle.cc; linux-mtd@lists.infradead.org;
>> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
>> claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>; linux-
>> arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org;
>> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-
>> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com
>> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support
>> in spi-nor
>>
>> Hi, Amit,
>>
>> On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
>>> Each flash that is connected in stacked mode should have a separate
>>> parameter structure. So, the flash parameter member(*params) of the
>>> spi_nor structure is changed to an array (*params[2]). The array is
>>> used to store the parameters of each flash connected in stacked
>> configuration.
>>>
>>> The current implementation assumes that a maximum of two flashes are
>>> connected in stacked mode and both the flashes are of same make but
>>> can differ in sizes. So, except the sizes all other flash parameters
>>> of both the flashes are identical.
>>
>> Do you plan to add support for different flashes in stacked mode? If not,
> 
> No, according to the current implementation, in stacked mode, both flashes 
> must be of the same make.
> 
>> wouldn't it be simpler to have just an array of flash sizes instead of
>> duplicating the entire params struct?
> 
> Yes, that is accurate. In alignment with our current stacked support use case we 
> can have an array of flash sizes instead.
> The primary purpose of having an array of params struct was to facilitate 
> potential future extensions, allowing the addition of stacked support for 
> different flashes
> 

right. Don't do this change yet, let's decide on the overall
architecture first.

>>
>>>
>>> SPI-NOR is not aware of the chip_select values, for any incoming
>>> request SPI-NOR will decide the flash index with the help of
>>> individual flash size and the configuration type (single/stacked).
>>> SPI-NOR will pass on the flash index information to the SPI core & SPI
>>> driver by setting the appropriate bit in
>>> nor->spimem->spi->cs_index_mask. For example, if nth bit of
>>> nor->spimem->spi->cs_index_mask is set then the driver would
>>> assert/de-assert spi->chip_slect[n].
>>>
>>> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
>>> ---
>>>  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-------
>>>  drivers/mtd/spi-nor/core.h  |   4 +
>>>  include/linux/mtd/spi-nor.h |  15 +-
>>>  3 files changed, 240 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 93ae69b7ff83..e990be7c7eb6 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>
>> cut
>>
>>> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct
>>> spi_nor *nor)  static int spi_nor_late_init_params(struct spi_nor
>>> *nor)  {
>>>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor,
>> 0);
>>> -	int ret;
>>> +	struct device_node *np = spi_nor_get_flash_node(nor);
>>> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
>>> +	u32 idx = 0;
>>> +	int rc, ret;
>>>
>>>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>>>  	    nor->manufacturer->fixups->late_init) { @@ -2937,6 +3042,44 @@
>>> static int spi_nor_late_init_params(struct spi_nor *nor)
>>>  	if (params->n_banks > 1)
>>>  		params->bank_size = div64_u64(params->size, params-
>>> n_banks);
>>>
>>> +	nor->num_flash = 0;
>>> +
>>> +	/*
>>> +	 * The flashes that are connected in stacked mode should be of same
>> make.
>>> +	 * Except the flash size all other properties are identical for all the
>>> +	 * flashes connected in stacked mode.
>>> +	 * The flashes that are connected in parallel mode should be identical.
>>> +	 */
>>> +	while (idx < SNOR_FLASH_CNT_MAX) {
>>> +		rc = of_property_read_u64_index(np, "stacked-memories",
>> idx,
>>> +&flash_size[idx]);
>>
>> This is a little late in my opinion, as we don't have any sanity check on the
>> flashes that are stacked on top of the first. We shall at least read and compare
>> the ID for all.
> 
> Alright, I will incorporate a sanity check for reading and comparing the 
> ID of the stacked flash. Subsequently, I believe this stacked logic 
> should be relocated to spi_nor_get_flash_info() where we identify the 
> first flash. Please share your thoughts on this. Additionally, do you 

I'm wondering whether we can add a layer on top of the flash type to
handle the stacked/parallel modes. This way everything will become flash
type independent. Would it be possible to stack 2 SPI NANDs? How about a
SPI NOR and a SPI NAND?

Is the datasheet of the controller public?

> anticipate that SPI-NOR should throw an error if the second or any 
> subsequent flash within the stacked connection is different? Or would you 
> prefer it to print a warning and operate in single mode (i.e., only the 
> first flash)?

Both options are fine, but I haven't yet decided on the overall
architecture.

Cheers,
ta
