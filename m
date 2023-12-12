Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AEB80EF91
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 16:03:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 665F4AEA;
	Tue, 12 Dec 2023 16:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 665F4AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702393407;
	bh=c1+ffC/4SX+tGSx7cS/2QocEZ2C4FCD1pc53CcZnBe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hU17pVQqkFiESrxFSrF+3XqrViQrNv+WLd3zHis6mxIEGbAmNomuBPCUtjQBMTReh
	 2lxY4r4qYs36KE2I5Tf3tc+bktMYbiU7UH7RlIJzVkL4MMcfmsF5oibInV394MCdlu
	 TcQUw5BRpdQ2ujGtMg0EkN7LtzselLlouod+7D8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB7D4F80568; Tue, 12 Dec 2023 16:02:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 099CDF8057A;
	Tue, 12 Dec 2023 16:02:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AED4F8016A; Tue, 12 Dec 2023 16:02:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0D17F80124
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 16:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D17F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gmp2FMTV
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50d176eb382so5459348e87.2
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Dec 2023 07:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702393355; x=1702998155;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJSaOj/O3sNlbMjuItblJHTlzvK1I9vT1qpvbGVa2tk=;
        b=gmp2FMTVeAX9Dp4oOag4Z1jVPnAjkxiDFC1Z9oD4gZWZAzMJr8nxhNvV76aI1xReys
         o57gyodgb8cRZwpTsCiPc2UioLH458yQhI/HbPQhhtFD8fNOWl0rmwtz6fH0D3UWnJua
         nigP7vEP8uureDVjNHOzd9PxJDmjw4sowTV7q9a+zPg1OumWHak406AhOn0flszp35Uz
         GF6N05Ncv3lr4xOV8CDmIkVXuiCev9CeL17uIS8V2dUTGRbf/U1nFZHXjOGyIL5ozrIg
         ZyG1qFpBrtKWT+NgyKC1jnZYCLrJFJCveMnP9atutD306Eq2VPt2wlbro6M5LLJpUEvA
         1w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702393355; x=1702998155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJSaOj/O3sNlbMjuItblJHTlzvK1I9vT1qpvbGVa2tk=;
        b=TBZuYKrwYM+HVYgVtHzOUFVD0QvbtJ7bM0V40/+qtpb5/4yYMdlJDAnQ2iU2LBbUSc
         1oZgJXvmRkGHCNF38bEf5xY/ekK9xIB9Ekj9/OKORm1a0oD3AjOBEgUq2BunFy/pw2UN
         287sS2dISEAy31o18VZLFXZPPmfcTukab9Z9KWXV99wm+Zt6Qig+X0CVBR0Jz1zzWE67
         GfqfL/zPj294w66el1GY+paO8uIEUEC/sVU1S7I7Z+zoC/oV92Gx0EraxQC27ZgimUon
         +g3csNj7j7PKotN3WuyesWjXdWb+TnJlG+LOQ4xAJ5vlTU7p920Yci6Ot9CNMINRF893
         SQcA==
X-Gm-Message-State: AOJu0YwnPemuC4jXXMPPTn/S4wp16gbHGtg5wx17GMDgNtpmioPZMEkq
	QqE9vIufHid3suWa+k+QTd/zEA==
X-Google-Smtp-Source: 
 AGHT+IEQrTt5tPm83DHZ6HyQKpuEeSOXvUyNiD23wBW25lvvmAykVrQcO2UewxP10LZ8abWJJdsapw==
X-Received: by 2002:a05:6512:3a90:b0:50d:23e4:fe9c with SMTP id
 q16-20020a0565123a9000b0050d23e4fe9cmr3279122lfu.64.1702393354454;
        Tue, 12 Dec 2023 07:02:34 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id
 v10-20020a170906564a00b009fea232316bsm6343831ejr.193.2023.12.12.07.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 07:02:33 -0800 (PST)
Message-ID: <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
Date: Tue, 12 Dec 2023 15:02:31 +0000
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
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: 
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LS33NDE54EL6IT7HPL3O6RKVFQL7VTEX
X-Message-ID-Hash: LS33NDE54EL6IT7HPL3O6RKVFQL7VTEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LS33NDE54EL6IT7HPL3O6RKVFQL7VTEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/11/23 13:37, Mahapatra, Amit Kumar wrote:

Hi!

cut

>>>>>>>  drivers/mtd/spi-nor/core.c  | 272
>>>>>>> +++++++++++++++++++++++++++++-----
>>>> --
>>>>>>>  drivers/mtd/spi-nor/core.h  |   4 +
>>>>>>>  include/linux/mtd/spi-nor.h |  15 +-
>>>>>>>  3 files changed, 240 insertions(+), 51 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/mtd/spi-nor/core.c
>>>>>>> b/drivers/mtd/spi-nor/core.c index 93ae69b7ff83..e990be7c7eb6
>>>>>>> 100644
>>>>>>> --- a/drivers/mtd/spi-nor/core.c
>>>>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>>>>
>>>>>> cut
>>>>>>
>>>>>>> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct
>>>>>>> spi_nor *nor)  static int spi_nor_late_init_params(struct spi_nor
>>>>>>> *nor)  {
>>>>>>>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor,
>>>>>> 0);
>>>>>>> -	int ret;
>>>>>>> +	struct device_node *np = spi_nor_get_flash_node(nor);
>>>>>>> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
>>>>>>> +	u32 idx = 0;
>>>>>>> +	int rc, ret;
>>>>>>>
>>>>>>>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>>>>>>>  	    nor->manufacturer->fixups->late_init) { @@ -2937,6 +3042,44
>>>>>>> @@ static int spi_nor_late_init_params(struct spi_nor *nor)
>>>>>>>  	if (params->n_banks > 1)
>>>>>>>  		params->bank_size = div64_u64(params->size, params-
>>>> n_banks);
>>>>>>>
>>>>>>> +	nor->num_flash = 0;
>>>>>>> +
>>>>>>> +	/*
>>>>>>> +	 * The flashes that are connected in stacked mode should be
>> of
>>>>>>> +same
>>>>>> make.
>>>>>>> +	 * Except the flash size all other properties are identical for all
>> the
>>>>>>> +	 * flashes connected in stacked mode.
>>>>>>> +	 * The flashes that are connected in parallel mode should be
>> identical.
>>>>>>> +	 */
>>>>>>> +	while (idx < SNOR_FLASH_CNT_MAX) {
>>>>>>> +		rc = of_property_read_u64_index(np, "stacked-
>> memories",
>>>>>> idx,
>>>>>>> +&flash_size[idx]);
>>>>>>
>>>>>> This is a little late in my opinion, as we don't have any sanity
>>>>>> check on the flashes that are stacked on top of the first. We shall
>>>>>> at least read and compare the ID for all.
>>>>>
>>>>> Alright, I will incorporate a sanity check for reading and comparing
>>>>> the ID of the stacked flash. Subsequently, I believe this stacked
>>>>> logic should be relocated to spi_nor_get_flash_info() where we
>>>>> identify the first flash. Please share your thoughts on this.
>>>>> Additionally, do you
>>>>
>>>> I'm wondering whether we can add a layer on top of the flash type to
>>>> handle
>>>
>>> When you mention "on top," are you referring to incorporating it into
>>> the MTD layer? Initially, Miquel had submitted this patch to address
>>
>> I mean something above SPI MEM flashes, be it NOR, NANDs or whatever.
>> Instead of treating the stacked flashes as a monolithic device and treat in SPI
>> NOR some array of flashes, to have a layer above which probes the SPI MEM
>> flash driver for each stacked flash. In your case SPI NOR would be probed
>> twice, as you use 2 SPI NOR flashes.
>>
>>> stacked/parallel handling in the MTD layer.
>>> https://lore.kernel.org/linux-mtd/20200114191052.0a16d116@xps13/t/
>>> However, the Device Tree bindings were initially not accepted.
>>
>> Okay, thanks for the pointer. I'll take a look.

haven't yet read the thread from above, but I skimmed over the AMD
controller datasheet.

>>
>>> Following a series of discussions, the below bindings were eventually
>>> merged.
>>> https://lore.kernel.org/all/20220126112608.955728-4-miquel.raynal@boot
>>> lin.com/
>>
>> I saw, thanks.
>>
>>>
>>>> the stacked/parallel modes. This way everything will become flash
>>>> type independent. Would it be possible to stack 2 SPI NANDs? How
>>>> about a SPI NOR and a SPI NAND?
>>>>
>>>> Is the datasheet of the controller public?
>>>
>>> Yes,
>>> https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/Quad-SPI-Control
>>> ler
>>>
>>
>> Wonderful, I'll take a look. I see two clocks there. Does this mean that the
>> stacked flashes can be operated at different frequencies? Do you know if we
> 
> In stacked configuration, both flashes utilize a common clock (single 
> clock line). In a parallel setup, the flashes share the same clock but 
> have distinct clock lines. Please refer the diagrams in the sections 
> below for reference.
> https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Interface-Diagrams

Thanks! Can you share with us what flashes you used for testing in the
stacked and parallel configurations?

>> can combine a SPI NOR with a SPI NAND in stacked configuration?
> 
> No, Xilinx/AMD QSPI controllers doesn't support this configuration.
> 

2 SPI NANDs shall work with the AMD controller, right?

I skimmed over the QSPI controller datasheet and wondered why one would
get complicated with 2 Quad Flashes when we have Octal. But then I saw
that the same SoC can configure an Octal controller (the Octal and Quad
controllers seems mutual exclusive) and that the Octal one can operate 2
octal flashes in stacked mode :).

Cheers,
ta
