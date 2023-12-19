Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7095481834E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 09:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D185A83E;
	Tue, 19 Dec 2023 09:27:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D185A83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702974474;
	bh=tpeSwTKO58UcIVSYGbh2WLXo2wDugL+o9FLgPEAcyMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=poU6OuaCYn/AkAxoaSwtq6bFMw598FhU6dSnrAF/J9yhTDY0/q0fSkWYZ4NmS8Y3H
	 sSjmFZVyvPYXbRlkGCdGe1YTyyVSoW4zuiwxsiaefB9dV44xLDdWY6AYlgjfE3ezCA
	 pkjH3yxeHHSy7dy8ae9Ig+/+WE7LtVxNKBaSB08Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6921DF805AD; Tue, 19 Dec 2023 09:27:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99120F80579;
	Tue, 19 Dec 2023 09:27:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D76F6F80425; Tue, 19 Dec 2023 09:27:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C087FF800D2
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 09:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C087FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NYlgnuOG
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so4073059f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Dec 2023 00:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702974383; x=1703579183;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44tWTX/RSFAs3xTgaKfAwubj6hvu6hnjcH+agLDrfuI=;
        b=NYlgnuOGS1rYf08dF/HNFpJHenWcvS7tKq6cBlPbfzoqAHPV+vCam/SsMzrd/29ic3
         t8sxS/TsFEgGBgtdR2r01Otu9T1tu7DDvsEm01QYB+w/VgbuRGy3SxmQUon3M/5OdYci
         d8rGrwk5JN8A6ZHu6h8cP+TVYQ9eKmvVxPWL9s+iiHTlKDmqPUfFigvoNjv4ocaTpXl6
         mVKocnxRc3Yuk+W80TPA/B7e/H39BaVC4rNSjVc/Ij85d2x6pGk1BqsIDaNJW81yar6j
         0/zXJp2XB+H1bEmqa+l5rBxjZh/+XxfjuzKpkmYq53qcDwdJjKYO3L7/ThUvZ6aqK3v6
         YnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702974383; x=1703579183;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44tWTX/RSFAs3xTgaKfAwubj6hvu6hnjcH+agLDrfuI=;
        b=WAy62w4yHFHja3oSzKlQ+YajtCbbRqBm5etInjuw2VKu0s+B6bEb1lpr+awHKxJgs8
         MHLmqEIrWuOIcY1NpPyWdZyjUKJXF04XuYvMttoh180gRil01IRyDaHKOg738oyb7luo
         yOTO4eM5GoGTdHuo7BLlhPTys+dsxDvPspZTY1XXMZB8DcMrq9Q9UH4SUng0D+oK6kY9
         8/s4aXICnYgcylN4IurkAaYDwVuHr7KBAhh8a1K9R0XHPbpJEkORvF7cH2y6p+TUodPC
         GvwLE81t80dcT6Gwl2b7lD9msZuYGEToAUAnpgrdey01rxUJ8vmDNu+PT/spTD+KlrOZ
         y2bQ==
X-Gm-Message-State: AOJu0Yw7O5bkVar6p+mG3e0YKFk48bdmvcD2QjTswkzRuZoL6TI6ub8j
	WGWnoKXo+75gNaUgNnLApmlCLg==
X-Google-Smtp-Source: 
 AGHT+IFhixtyy2y9O5fWKScajlDY2zaXPIfDPrVd3MMvihiJ4///TFioM3EVhUMMvTdIrJts+xU3cQ==
X-Received: by 2002:a5d:6801:0:b0:336:6e12:7c62 with SMTP id
 w1-20020a5d6801000000b003366e127c62mr861872wru.110.1702974383315;
        Tue, 19 Dec 2023 00:26:23 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a5d5385000000b0033662cf5e51sm6719841wrv.93.2023.12.19.00.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 00:26:22 -0800 (PST)
Message-ID: <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
Date: Tue, 19 Dec 2023 10:26:20 +0200
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
 <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
 <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
 <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: 
 <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z76FOUBOLCX6SLRC6KS4GM4E2RYJLZKY
X-Message-ID-Hash: Z76FOUBOLCX6SLRC6KS4GM4E2RYJLZKY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z76FOUBOLCX6SLRC6KS4GM4E2RYJLZKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 15.12.2023 13:20, Mahapatra, Amit Kumar wrote:
> Hello Tudor,
> 

Hi!

>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Friday, December 15, 2023 4:03 PM
>> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
>> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
>> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
>> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
>> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
>> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org; michael@walle.cc;
>> linux-mtd@lists.infradead.org; nicolas.ferre@microchip.com;
>> alexandre.belloni@bootlin.com; claudiu.beznea@tuxon.dev; Simek, Michal
>> <michal.simek@amd.com>; linux-arm-kernel@lists.infradead.org; alsa-
>> devel@alsa-project.org; patches@opensource.cirrus.com; linux-
>> sound@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>;
>> amitrkcian2002@gmail.com
>> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support
>> in spi-nor
>>
>>
>>
>> On 12/15/23 10:02, Mahapatra, Amit Kumar wrote:
>>> Hello Tudor,
>>
>> Hi,
>>
>>>
>>>> -----Original Message-----
>>>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> Sent: Friday, December 15, 2023 1:40 PM
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
>>>>
>>>>
>>>> On 15.12.2023 09:55, Mahapatra, Amit Kumar wrote:
>>>>>> Thanks! Can you share with us what flashes you used for testing in
>>>>>> the stacked and parallel configurations?
>>>>> I used SPI-NOR QSPI flashes for testing stacked and parallel.
>>>>
>>>> I got that, I wanted the flash name or device ID.
>>>
>>> N25Q00A, MX66U2G45G, IS25LP01G & W25H02JV are some of the QSPI
>> flashes
>>> on which we tested. Additionally, we conducted tests on over 30
>>> different QSPI flashes from four distinct vendors (Miron, Winbond,
>> Macronix, and ISSI).
>>>
>>
>> Great.
>>
>>>> What I'm interested is if each flash is in its own package. Are they?
>>>
>>> I'm sorry, but I don't quite understand what you mean by "if each
>>> flash in its own package."
>>>
>>
>> There are flashes that are stacked at the physical level. It's a single flash with
>> multiple dies, that are all under a single physical package.
> 
> Got it. The W25H02JV QSPI flash I mentioned earlier is a device with 
> with four dies that are stacked at the physical level.
> 
>>
>> As I understand, your stacked flash model is at logical level. You have
>> 2 flashes each in its own package. 2 different entities. Is my understanding
>> correct?
> 
> Yes, that’s correct.
> 
> I'd like to contribute to your earlier point regarding the placement of 
> the stacked layer. As you correctly highlighted, it should be in the 
> spi-mem generic layer. For instance, when a read/write operation extends 
> across multiple flashes (whether SPI-NOR or SPI-NAND), the stacked layer 
> must handle the flash crossover. This requires setting the appropriate CS 
> index in mem->spi->cs_index_mask to select the correct slave device and 
> updating the data buffer, address & data length in spi_mem_op struct 
> variable. Does this align with your understanding?
> 

This was the initial idea, yes, but we'll have to see how mtd concat
fits in. Maybe the abstraction can be made at the mtd level, which I
suspect mtd concat does. I have to read that driver, never opened it.

Something else to consider: I see that Micron has a twin quad mode:
https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25t/generation-b/mt25t_qljs_l_512_xba_0.pdf?rev=de70b770c5dc4da8b8ead06b57c03500

The micron's "Separate Chip-Select and Clock Signals" resembles the
AMD's dual parallel 8-bit.
Micron's "Shared Chip-Select and Clock Signals" differs from the AMD's
stacked mode, as Micron uses DQ[3:0] and DQ[7:4], whereas AMD considers
both as DQ[3:0].

I had a short chat with Michael and he highlighted that instead of the
parallel mode, one would be better of with an octal device. I wonder
whether the quad parallel is worth the effort. I see AMD can select
either quad (single/stacked/parallel) or octal (single/stacked). Is the
parallel mode considered obsolete for new IPs?

Cheers,
ta
