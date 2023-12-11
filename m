Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531E80C01D
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 04:45:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D53B844;
	Mon, 11 Dec 2023 04:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D53B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702266312;
	bh=r0pYP1q8Gtj2CB7Ycqp8y43LjjXbBC2kfyo7Qr4SBMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QTjjsncQvZjnwteZEvdbk3kO42NFfF4CgR0QTf7hXv7k/L7HL2HuHPAlDYFAX/WKF
	 1g73ceaTXERQ/tLW4aRV2onsvjP5mmMD5AoRbTnpF5XrToPTU2XyxrN7HUQUj+jsq3
	 jLejOR9RIY+JWEfW89lBJqjhYOdwrOYqGMY/RVpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAED0F80568; Mon, 11 Dec 2023 04:44:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 716B9F80571;
	Mon, 11 Dec 2023 04:44:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79654F8016E; Mon, 11 Dec 2023 04:44:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54BC9F80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 04:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54BC9F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=E0buIQN5
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bf1e32571so4629662e87.2
        for <alsa-devel@alsa-project.org>;
 Sun, 10 Dec 2023 19:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702266262; x=1702871062;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/vqeWpmuaC2GKHcpPmHJB7dDJL1y38uQQZMJmxyCF0=;
        b=E0buIQN5Kp7ANZDuUb+l1tC/z9R4SEhwQHj1/YzPCiwHdsIqSwA8xcBwLkcuSZK2hv
         Pnl0k0ORRzawiORxF03sU3jSMSkKocCxlRzfolEijAwuV6t6fSmsPTm84A1jS9VksjIo
         XCqLugACqaB20kgGSEnU/s0Olh4aHXSlZ0DOZaPdWh6b6x8GIrGdkAGwvfuEDTKzAqO4
         eenwy1umLwIitYZ1VOsEBMSeQ7qzTLtIRzVXHhbv36k7koIEMCRcA93Vas/BjTungXVw
         gSBdmOwFVsg6zRlGa+Ykkqgv38MZ7tgNoGxe+BXjUVH2EsAKEGYT0pEoIAOaAECfrfi+
         KjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702266262; x=1702871062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/vqeWpmuaC2GKHcpPmHJB7dDJL1y38uQQZMJmxyCF0=;
        b=G/aMKDeP1AeVknDkAi+3HM1+C2tO2f6VzgPux/uFWXZcYJQQjlPpVkjz9KQ+pr63bv
         kn75cJXfxHKQdT/Yxbkvb2zuPnl3bIK6RI+tgJryRcQem1mK+3H8ZGyF3Pe7lPDYJz7Z
         GvzjW+0nEI8lgfj/HsUF7HhctIIdUjpqmR9cijQLxCezqAcxbQp4z1NfTcxxCVUG8msx
         tliv1hoMbMcXdzmXuVd7uja3LTA0VKJ1X79m2NL4VLpbj2WPmZzA7t8t8OtIL9sghf5d
         1Rfkam3xk5KhRgJYvj5x44gyIj1Zm6g0sw+KLRIl8MxB5IIY+MHZDTXA3fhqGW9XdrDZ
         rMQQ==
X-Gm-Message-State: AOJu0Yzjvm0et1o8YPSXI1O/aoq+/g4CyOjg41rw/McAPUKT0GA6165L
	EGI2hX9M1JSO2ZqTFH1XspDPvA==
X-Google-Smtp-Source: 
 AGHT+IF5PtBpY6xhcdNz9G3vVrurxD3qF8aQpcfrWHvhTTpJjLx5LRR48o/Ym5kxD82928DzeICIlg==
X-Received: by 2002:ac2:562c:0:b0:50b:fd06:1c8a with SMTP id
 b12-20020ac2562c000000b0050bfd061c8amr1341405lff.26.1702266261661;
        Sun, 10 Dec 2023 19:44:21 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id
 w2-20020a50d782000000b0054cceab1940sm3269357edi.29.2023.12.10.19.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 19:44:20 -0800 (PST)
Message-ID: <2cadfffa-00bf-4e6a-bfce-9cc654b042a1@linaro.org>
Date: Mon, 11 Dec 2023 03:44:18 +0000
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
 <9f577482-30d9-4e1d-9469-812d323b18c6@linaro.org>
 <BN7PR12MB2802C8279CA95FA08F8DDCF2DC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: 
 <BN7PR12MB2802C8279CA95FA08F8DDCF2DC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YP2EMBXBO4GWLFJ5R2XCKGKMPB3UBA3K
X-Message-ID-Hash: YP2EMBXBO4GWLFJ5R2XCKGKMPB3UBA3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YP2EMBXBO4GWLFJ5R2XCKGKMPB3UBA3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/8/23 17:06, Mahapatra, Amit Kumar wrote:
> Hello Tudor,

Hi!

> 
>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Wednesday, December 6, 2023 8:14 PM
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
>> On 12/6/23 14:30, Tudor Ambarus wrote:
>>> Hi, Amit,
>>>
>>> On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
>>>> Each flash that is connected in stacked mode should have a separate
>>>> parameter structure. So, the flash parameter member(*params) of the
>>>> spi_nor structure is changed to an array (*params[2]). The array is
>>>> used to store the parameters of each flash connected in stacked
>> configuration.
>>>>
>>>> The current implementation assumes that a maximum of two flashes are
>>>> connected in stacked mode and both the flashes are of same make but
>>>> can differ in sizes. So, except the sizes all other flash parameters
>>>> of both the flashes are identical.
>>>
>>> Do you plan to add support for different flashes in stacked mode? If
>>> not, wouldn't it be simpler to have just an array of flash sizes
>>> instead of duplicating the entire params struct?
>>>
>>>>
>>>> SPI-NOR is not aware of the chip_select values, for any incoming
>>>> request SPI-NOR will decide the flash index with the help of
>>>> individual flash size and the configuration type (single/stacked).
>>>> SPI-NOR will pass on the flash index information to the SPI core &
>>>> SPI driver by setting the appropriate bit in
>>>> nor->spimem->spi->cs_index_mask. For example, if nth bit of
>>>> nor->spimem->spi->cs_index_mask is set then the driver would
>>>> assert/de-assert spi->chip_slect[n].
>>>>
>>>> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-
>> mahapatra@amd.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-------
>>>>  drivers/mtd/spi-nor/core.h  |   4 +
>>>>  include/linux/mtd/spi-nor.h |  15 +-
>>>>  3 files changed, 240 insertions(+), 51 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index 93ae69b7ff83..e990be7c7eb6 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>
>>> cut
>>>
>>>> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct
>>>> spi_nor *nor)  static int spi_nor_late_init_params(struct spi_nor
>>>> *nor)  {
>>>>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor,
>> 0);
>>>> -	int ret;
>>>> +	struct device_node *np = spi_nor_get_flash_node(nor);
>>>> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
>>>> +	u32 idx = 0;
>>>> +	int rc, ret;
>>>>
>>>>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>>>>  	    nor->manufacturer->fixups->late_init) { @@ -2937,6 +3042,44 @@
>>>> static int spi_nor_late_init_params(struct spi_nor *nor)
>>>>  	if (params->n_banks > 1)
>>>>  		params->bank_size = div64_u64(params->size, params-
>>> n_banks);
>>>>
>>>> +	nor->num_flash = 0;
>>>> +
>>>> +	/*
>>>> +	 * The flashes that are connected in stacked mode should be of same
>> make.
>>>> +	 * Except the flash size all other properties are identical for all the
>>>> +	 * flashes connected in stacked mode.
>>>> +	 * The flashes that are connected in parallel mode should be identical.
>>>> +	 */
>>>> +	while (idx < SNOR_FLASH_CNT_MAX) {
>>>> +		rc = of_property_read_u64_index(np, "stacked-memories",
>> idx,
>>>> +&flash_size[idx]);
>>
>> also, it's not clear to me why you read this property multiple times.
>> Have you sent a device tree patch somewhere? It will help me understand
>> what you're trying to achieve.
> 
> Miquel submitted the device tree patch; here is the series.
> https://lore.kernel.org/all/20220126112608.955728-1-miquel.raynal@bootlin.com/
> 

oh, yes, I remember seeing this on the ml, but I couldn't allocate time
to review it. Looking at:
https://lore.kernel.org/all/20220126112608.955728-4-miquel.raynal@bootlin.com/

Flash size is not necessary for SPI NORs, as it can be discovered via
SFDP. And spi-max-frequency should have been specified for all flashes,
as I expect it can differ. At least so that the controller chooses the
minimum frequency from all the max (if it can't operate the stacks at
different frequencies).

Cheers,
ta
