Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114ED80C4CB
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 10:36:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CBDE82A;
	Mon, 11 Dec 2023 10:36:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CBDE82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702287413;
	bh=CtpzQWiE2e3jbtz8JhNrUpgV398xPgpPVQXfOx68xNU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qq5attQCacS9J3FW1FU+PJYS88uMF5BK13QV7ZvZKLjRi0pTkqeOEDbNQqIaYPRR0
	 6fguftVVoYjnCwlPU8S2/NG8O1TPSf46pEMKf5k3FDCJq/j6LqFc8vqPcN/wvP9CcG
	 WkqKdnbnRUc7N2DgiCzOXTVc9itlnlgnkCCamjJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A0C9F80578; Mon, 11 Dec 2023 10:36:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CB0BF80571;
	Mon, 11 Dec 2023 10:36:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81F98F80166; Mon, 11 Dec 2023 10:35:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6550CF800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 10:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6550CF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SYzg+PF/
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-54c5d041c23so5929913a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 01:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702287325; x=1702892125;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPBBuiUC0h6HJxl4BMSfR4W/EGNQD+gaR8NSJwfR2Gk=;
        b=SYzg+PF/GfSAREVUxsZyX9WyoqTz35JMLpTnvRv1avi+XMZov6j0Tc1nIquWCcER/M
         JePY9VsUWn4PHXreW0tgaXA0tknuPNlKeN4uG5NJPquysnwg3+mKSGhzvZITPydKbF/n
         I9NNSIFoT/0JyjHNm84MDKd0VZkgNae5IzFRL6kQflorIoYjZFoEHdCTsjK3Re9HdgtE
         PR66xt91SQcGt3QAKKQVgtLTncjYBduzR/Ia1gN4wwwJ5tAf9MKx+Ow2/zCXnz3KELdN
         jhLp7YiwNddo6ZCQ3G1/ofcSCxYZqNsJ7yjRw6lzsYPnjKF+k3Yvi6YG/Wk6m/zfHPQv
         YsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287325; x=1702892125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPBBuiUC0h6HJxl4BMSfR4W/EGNQD+gaR8NSJwfR2Gk=;
        b=Z7YuuSLAPGZW5sD346j0aB0wUV1/oJICp4V5aLEBcyeV59uropBwOCWOL2bLMQX+RU
         RY2k5LfqDqsowgGpjKWIHPasPoXfar3xdaZSeA+83TN7AWayQpIfyTnMSgZCH2lWLHL8
         zMbz1xbOm4Jea2sWDMrM2nS6SctaiBvQxfdQEK56COmB85ovfAugNXh9QtIa7VdehS5y
         hJ9rrN/H2bsYYGKp6k+Hzke08C8rzucMRP9O6RlKOuKN2yYi7OCxp4XA86BdOeMevTo4
         TppUAmklTXwxfWpdpa9BJDl0BjMefh3TRF+ke+JE6aUbgvAfP+O3UnD+FEC38Vf1GO9M
         SxoA==
X-Gm-Message-State: AOJu0YwUxiTrPCBMWiJf7cGaUeWITGUYsPmeMk5VYPY/+Bj320tv6xoH
	r3PdIwU1fq9r2Tzw6MA4S48zqQ==
X-Google-Smtp-Source: 
 AGHT+IFX69vaIMEbLW/TqLvsqwcZgbImckFRzF090TZyX4ErPch2iorzjHVHCi6wE4KnWzRGQkk4JQ==
X-Received: by 2002:a50:d4d7:0:b0:548:4774:e59c with SMTP id
 e23-20020a50d4d7000000b005484774e59cmr1528899edj.35.1702287325265;
        Mon, 11 Dec 2023 01:35:25 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id
 s2-20020a05640217c200b00551422c2ceasm418127edy.44.2023.12.11.01.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:35:24 -0800 (PST)
Message-ID: <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
Date: Mon, 11 Dec 2023 09:35:21 +0000
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
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: 
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OZF4KNCE5HM53GIBK6GYVEASTUOMA345
X-Message-ID-Hash: OZF4KNCE5HM53GIBK6GYVEASTUOMA345
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZF4KNCE5HM53GIBK6GYVEASTUOMA345/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/11/23 06:56, Mahapatra, Amit Kumar wrote:
> 
> 
>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Monday, December 11, 2023 9:03 AM
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
>>
>>
>> On 12/8/23 17:05, Mahapatra, Amit Kumar wrote:
>>> Hello Tudor,
>>
>> Hi!
> 
> Hello Tudor,
> 

Hi!

>>
>>>
>>>> -----Original Message-----
>>>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> Sent: Wednesday, December 6, 2023 8:00 PM
>>>> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
>>>> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
>>>> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
>>>> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
>>>> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
>>>> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
>>>> michael@walle.cc; linux-mtd@lists.infradead.org;
>>>> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
>>>> claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>;
>>>> linux- arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org;
>>>> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-
>>>> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com
>>>> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories
>>>> support in spi-nor
>>>>
>>>> Hi, Amit,
>>>>
>>>> On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
>>>>> Each flash that is connected in stacked mode should have a separate
>>>>> parameter structure. So, the flash parameter member(*params) of the
>>>>> spi_nor structure is changed to an array (*params[2]). The array is
>>>>> used to store the parameters of each flash connected in stacked
>>>> configuration.
>>>>>
>>>>> The current implementation assumes that a maximum of two flashes are
>>>>> connected in stacked mode and both the flashes are of same make but
>>>>> can differ in sizes. So, except the sizes all other flash parameters
>>>>> of both the flashes are identical.
>>>>
>>>> Do you plan to add support for different flashes in stacked mode? If
>>>> not,
>>>
>>> No, according to the current implementation, in stacked mode, both
>>> flashes must be of the same make.
>>>
>>>> wouldn't it be simpler to have just an array of flash sizes instead
>>>> of duplicating the entire params struct?
>>>
>>> Yes, that is accurate. In alignment with our current stacked support
>>> use case we can have an array of flash sizes instead.
>>> The primary purpose of having an array of params struct was to
>>> facilitate potential future extensions, allowing the addition of
>>> stacked support for different flashes
>>>
>>
>> right. Don't do this change yet, let's decide on the overall architecture first.
> 
> Sure.
>>
>>>>
>>>>>
>>>>> SPI-NOR is not aware of the chip_select values, for any incoming
>>>>> request SPI-NOR will decide the flash index with the help of
>>>>> individual flash size and the configuration type (single/stacked).
>>>>> SPI-NOR will pass on the flash index information to the SPI core &
>>>>> SPI driver by setting the appropriate bit in
>>>>> nor->spimem->spi->cs_index_mask. For example, if nth bit of
>>>>> nor->spimem->spi->cs_index_mask is set then the driver would
>>>>> assert/de-assert spi->chip_slect[n].
>>>>>
>>>>> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-
>> mahapatra@amd.com>
>>>>> ---
>>>>>  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-----
>> --
>>>>>  drivers/mtd/spi-nor/core.h  |   4 +
>>>>>  include/linux/mtd/spi-nor.h |  15 +-
>>>>>  3 files changed, 240 insertions(+), 51 deletions(-)
>>>>>
>>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>>> index 93ae69b7ff83..e990be7c7eb6 100644
>>>>> --- a/drivers/mtd/spi-nor/core.c
>>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>>
>>>> cut
>>>>
>>>>> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct
>>>>> spi_nor *nor)  static int spi_nor_late_init_params(struct spi_nor
>>>>> *nor)  {
>>>>>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor,
>>>> 0);
>>>>> -	int ret;
>>>>> +	struct device_node *np = spi_nor_get_flash_node(nor);
>>>>> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
>>>>> +	u32 idx = 0;
>>>>> +	int rc, ret;
>>>>>
>>>>>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>>>>>  	    nor->manufacturer->fixups->late_init) { @@ -2937,6 +3042,44 @@
>>>>> static int spi_nor_late_init_params(struct spi_nor *nor)
>>>>>  	if (params->n_banks > 1)
>>>>>  		params->bank_size = div64_u64(params->size, params-
>> n_banks);
>>>>>
>>>>> +	nor->num_flash = 0;
>>>>> +
>>>>> +	/*
>>>>> +	 * The flashes that are connected in stacked mode should be of
>>>>> +same
>>>> make.
>>>>> +	 * Except the flash size all other properties are identical for all the
>>>>> +	 * flashes connected in stacked mode.
>>>>> +	 * The flashes that are connected in parallel mode should be identical.
>>>>> +	 */
>>>>> +	while (idx < SNOR_FLASH_CNT_MAX) {
>>>>> +		rc = of_property_read_u64_index(np, "stacked-memories",
>>>> idx,
>>>>> +&flash_size[idx]);
>>>>
>>>> This is a little late in my opinion, as we don't have any sanity
>>>> check on the flashes that are stacked on top of the first. We shall
>>>> at least read and compare the ID for all.
>>>
>>> Alright, I will incorporate a sanity check for reading and comparing
>>> the ID of the stacked flash. Subsequently, I believe this stacked
>>> logic should be relocated to spi_nor_get_flash_info() where we
>>> identify the first flash. Please share your thoughts on this.
>>> Additionally, do you
>>
>> I'm wondering whether we can add a layer on top of the flash type to handle
> 
> When you mention "on top," are you referring to incorporating it into 
> the MTD layer? Initially, Miquel had submitted this patch to address 

I mean something above SPI MEM flashes, be it NOR, NANDs or whatever.
Instead of treating the stacked flashes as a monolithic device and treat
in SPI NOR some array of flashes, to have a layer above which probes the
SPI MEM flash driver for each stacked flash. In your case SPI NOR would
be probed twice, as you use 2 SPI NOR flashes.

> stacked/parallel handling in the MTD layer.
> https://lore.kernel.org/linux-mtd/20200114191052.0a16d116@xps13/t/
> However, the Device Tree bindings were initially not accepted. 

Okay, thanks for the pointer. I'll take a look.

> Following a series of discussions, the below bindings were 
> eventually merged.
> https://lore.kernel.org/all/20220126112608.955728-4-miquel.raynal@bootlin.com/

I saw, thanks.

> 
>> the stacked/parallel modes. This way everything will become flash type
>> independent. Would it be possible to stack 2 SPI NANDs? How about a SPI
>> NOR and a SPI NAND?
>>
>> Is the datasheet of the controller public?
> 
> Yes, https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/Quad-SPI-Controller
> 

Wonderful, I'll take a look. I see two clocks there. Does this mean that
the stacked flashes can be operated at different frequencies? Do you
know if we can combine a SPI NOR with a SPI NAND in stacked configuration?

I need to study this a bit. I'll try to involve Michael and Pratyush too.

Cheers,
ta
