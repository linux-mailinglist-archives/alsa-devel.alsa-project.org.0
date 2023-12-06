Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EF18072CD
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 15:44:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0525883A;
	Wed,  6 Dec 2023 15:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0525883A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701873884;
	bh=TQSLRdp1jIEPTl6a3uqpbCPU4qhp21SnMhVdObWFcC4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q0Lx22Bhd0roRGDeKFBb40PKw7ejjLPlL3VzpS3IJyYqeZpyiSKbn5QMU1Vd8fABy
	 wtsRvwLsBlGEunZej/qKaTY6H5F2oBAe0dpqqJ8gzPGpCv0uoHZsy1FwN+BYbOh+/p
	 EJ0qJwibX/8Xw9tfZGHLiOl0Rter3bloN6k72JKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7941CF8028D; Wed,  6 Dec 2023 15:44:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D32EF80564;
	Wed,  6 Dec 2023 15:44:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC8CF8024E; Wed,  6 Dec 2023 15:44:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4DE0F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 15:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4DE0F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JlhMRi6d
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54bf9a54fe3so8923432a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Dec 2023 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701873839; x=1702478639;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/sUNB5ZgX1IJ9770bfc42rc11+iIaUcvTzWeH8l1S8=;
        b=JlhMRi6d8bG4CLXjJ8/QbqaZdVWH87VmdPG1SlLE6L7ZGsLyXrtzW5D3SGolbLEQG9
         j1mctf9JdkSBEp4Ia+XYaEljOIiQqe+7CKTgDtQdSG6X4J4JgbQLJRqVithgqNVnrIhz
         AFEo+qA8lNsOEzbhDrhKw8Ns0EvZklmoXQz7iW1m79sSwmJSnDcc0gd1Wj4cfGn29kFd
         8661rro8CIV4n2TJA652jTAqwMUg+bY5w6iuxNhsShWgfGnHMIawPKCU6bn+Lq+wRDVX
         qCEyxsI2OMOqgAvPhXBoA55dk84kZm9GD+YJD4HISEdEKvfuPEg5bj+6zbgzoZoIRtmG
         PPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873839; x=1702478639;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/sUNB5ZgX1IJ9770bfc42rc11+iIaUcvTzWeH8l1S8=;
        b=gHT5hKqkCs2lNdQmHeROpeufj1CUd+PV7zJSc635nBapDnBQFp8VJHCThGnLYjYSC+
         l6BLMHrPqLoVYv1M3Jkt8MMV/tEH+IQrScaowyvw6sXaGu2wPKhMlkMw0Eu8am65/uW9
         +vk1E9Y9rsRFAkOp9PkwybOQ8a/5KsM/BsQZT5KW7L5kYquQYMkxtsMqnwJ17TZrWAcm
         nrKqRoAgNy1BJZ1WhI0vdQL3Gga2G3kkkFRtA5wU3yG+H5q5ffcmWHhgUVqIw1zyfUU+
         o1zxrmDJbghu2TIovs4oYFXzRhCI9etxn9vmszDEhnmqbzVDPvEwTEPybc3hUK3Vkwyx
         f84Q==
X-Gm-Message-State: AOJu0Yya260gk3hfX/Vn/2MX2YmP1BIbh2w63BgNvXtsCh8rFIP8oUnS
	GFdK1in/aECT3h2VvtnTyybIfg==
X-Google-Smtp-Source: 
 AGHT+IHDAvptVLTEL9dhcaG+Hbai6J369y6guW1ZLyEztJsP78iBp+Sc57pMqBtc7BIzBcb9a1OzXg==
X-Received: by 2002:a50:d0cc:0:b0:54c:4837:9a9c with SMTP id
 g12-20020a50d0cc000000b0054c48379a9cmr758869edf.67.1701873838794;
        Wed, 06 Dec 2023 06:43:58 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id
 bo24-20020a0564020b3800b0054cc22af09esm49861edb.46.2023.12.06.06.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 06:43:58 -0800 (PST)
Message-ID: <9f577482-30d9-4e1d-9469-812d323b18c6@linaro.org>
Date: Wed, 6 Dec 2023 14:43:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sbinding@opensource.cirrus.com, lee@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, git@amd.com,
 amitrkcian2002@gmail.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
In-Reply-To: <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EYPIZEKYL2WI4OP6CGPQUI6Y5LMZ67H4
X-Message-ID-Hash: EYPIZEKYL2WI4OP6CGPQUI6Y5LMZ67H4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYPIZEKYL2WI4OP6CGPQUI6Y5LMZ67H4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/6/23 14:30, Tudor Ambarus wrote:
> Hi, Amit,
> 
> On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
>> Each flash that is connected in stacked mode should have a separate
>> parameter structure. So, the flash parameter member(*params) of the spi_nor
>> structure is changed to an array (*params[2]). The array is used to store
>> the parameters of each flash connected in stacked configuration.
>>
>> The current implementation assumes that a maximum of two flashes are
>> connected in stacked mode and both the flashes are of same make but can
>> differ in sizes. So, except the sizes all other flash parameters of both
>> the flashes are identical.
> 
> Do you plan to add support for different flashes in stacked mode? If
> not, wouldn't it be simpler to have just an array of flash sizes instead
> of duplicating the entire params struct?
> 
>>
>> SPI-NOR is not aware of the chip_select values, for any incoming request
>> SPI-NOR will decide the flash index with the help of individual flash size
>> and the configuration type (single/stacked). SPI-NOR will pass on the flash
>> index information to the SPI core & SPI driver by setting the appropriate
>> bit in nor->spimem->spi->cs_index_mask. For example, if nth bit of
>> nor->spimem->spi->cs_index_mask is set then the driver would
>> assert/de-assert spi->chip_slect[n].
>>
>> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
>> ---
>>  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-------
>>  drivers/mtd/spi-nor/core.h  |   4 +
>>  include/linux/mtd/spi-nor.h |  15 +-
>>  3 files changed, 240 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 93ae69b7ff83..e990be7c7eb6 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
> 
> cut
> 
>> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
>>  static int spi_nor_late_init_params(struct spi_nor *nor)
>>  {
>>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
>> -	int ret;
>> +	struct device_node *np = spi_nor_get_flash_node(nor);
>> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
>> +	u32 idx = 0;
>> +	int rc, ret;
>>  
>>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>>  	    nor->manufacturer->fixups->late_init) {
>> @@ -2937,6 +3042,44 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
>>  	if (params->n_banks > 1)
>>  		params->bank_size = div64_u64(params->size, params->n_banks);
>>  
>> +	nor->num_flash = 0;
>> +
>> +	/*
>> +	 * The flashes that are connected in stacked mode should be of same make.
>> +	 * Except the flash size all other properties are identical for all the
>> +	 * flashes connected in stacked mode.
>> +	 * The flashes that are connected in parallel mode should be identical.
>> +	 */
>> +	while (idx < SNOR_FLASH_CNT_MAX) {
>> +		rc = of_property_read_u64_index(np, "stacked-memories", idx, &flash_size[idx]);

also, it's not clear to me why you read this property multiple times.
Have you sent a device tree patch somewhere? It will help me understand
what you're trying to achieve.

> 
> This is a little late in my opinion, as we don't have any sanity check
> on the flashes that are stacked on top of the first. We shall at least
> read and compare the ID for all.
> 
> Cheers,
> ta
