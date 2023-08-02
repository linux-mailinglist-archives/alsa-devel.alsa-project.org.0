Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD2B76CE5C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 15:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DA0F1DD;
	Wed,  2 Aug 2023 15:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DA0F1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690982443;
	bh=i4c1B7YfpyWGgOs+H7TNvMmvm1hPbodEnXEw70f7+M4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NBYbzEiWzp9P+EcWgTtG/VXC+76w/f+1RO4CrWG1k+DKcZ7XOt5hJyWxoDfDyk0BR
	 BP6/qsqCVBapU+Ykl7HV5xaUp1T5vQSBGzqwY6n80JQvM3j5THoisUEMYXlpSda6AZ
	 /nGrExfvYyegiCPlP9X6NVe4mVpPHnxqi2V6+Ff4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CC3EF8016D; Wed,  2 Aug 2023 15:19:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27908F80149;
	Wed,  2 Aug 2023 15:19:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05F5EF8025A; Wed,  2 Aug 2023 15:19:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D63C3F8016D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 15:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D63C3F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qarNGyqa
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3728u7MB003668;
	Wed, 2 Aug 2023 08:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=CEnW8O8/S6TARYN0rxlTiLkY0nOM+zUIQm6mU6dNNHY=; b=
	qarNGyqaYLbKHC81s5KjgS8lSggZIEkiJfR8iNTLBXHo/+rP3GX83M4Y5XVURY1h
	n1k+JUSiOT9+QgQMo3jg9a4HyNLolKNBrrEjmPnyxsRtIupi40rJTW1sxZr6H8Qu
	sT1cRWSs6LSKKbiUGn5w21HwvWxX5b6VuQu/sptMk/zcMgCYWY3l7+zT3SkwCMOR
	NEJrBQiW5CzANJmgbJuP/T/ZLHKMmMfLDiKU9SrWeDemWQSGZ9jbDUYtiaXW/JF6
	S3jGSTWftXwvqxDBNui9+dO3BSRambSmF93IlLggaVwObIvy9KUEua2ozOyhjKpB
	DZfkeqXZhjdWT3rEDGZeeQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1vm24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 08:19:17 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 14:19:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Wed, 2 Aug 2023 14:19:15 +0100
Received: from [198.61.64.107] (EDIN4L06LR3.ad.cirrus.com [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BA6D845D;
	Wed,  2 Aug 2023 13:19:14 +0000 (UTC)
Message-ID: <c4b3e3d2-ab87-f9f5-95f9-7d572694b376@opensource.cirrus.com>
Date: Wed, 2 Aug 2023 14:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/2] ASoC: tas2783: Add source files for tas2783
 soundwire driver
To: Mark Brown <broonie@kernel.org>, Baojun.Xu <jim_monkey@163.com>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <shumingf@realtek.com>,
        <herve.codina@bootlin.com>, <povik+lin@cutebit.org>,
        <ryans.lee@analog.com>, <ckeepax@opensource.cirrus.com>,
        <sebastian.reichel@collabora.com>, <fido_max@inbox.ru>,
        <wangweidong.a@awinic.com>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <peeyush@ti.com>, <navada@ti.com>,
        <tiwai@suse.de>, <mengdong.lin@intel.com>,
        Baojun Xu <baojun.xu@ti.com>
References: <20230801141858.130745-1-jim_monkey@163.com>
 <35849737-dbff-4655-9062-5d5d0fd861df@sirena.org.uk>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <35849737-dbff-4655-9062-5d5d0fd861df@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gZwxkYuOnqpAVYBqHoF_G4LoHlTKnQ_o
X-Proofpoint-ORIG-GUID: gZwxkYuOnqpAVYBqHoF_G4LoHlTKnQ_o
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZJQI7ATA566XRB7CDGIVQF4P74T2D6EJ
X-Message-ID-Hash: ZJQI7ATA566XRB7CDGIVQF4P74T2D6EJ
X-MailFrom: prvs=3578dc8fdb=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJQI7ATA566XRB7CDGIVQF4P74T2D6EJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/8/23 14:01, Mark Brown wrote:
> On Tue, Aug 01, 2023 at 10:18:57PM +0800, Baojun.Xu wrote:
> 
>> +       while (val_size) {
>> +               /* to end of page */
>> +               bytes = SDW_REG_NO_PAGE - (reg & SDW_REGADDR);
> 
> regmap has paging support, can't the driver use that?
> 
>> +static const struct regmap_config tasdevice_regmap = {
>> +	.reg_bits = 32,
>> +	.val_bits = 8,
>> +	.readable_reg = tas2783_readable_register,
>> +	.volatile_reg = tas2783_volatile_register,
>> +	.max_register = 0x41008000 + TASDEVICE_REG(0xa1, 0x60, 0x7f),
>> +	.reg_defaults = tas2783_reg_defaults,
>> +	.num_reg_defaults = ARRAY_SIZE(tas2783_reg_defaults),
>> +	.cache_type = REGCACHE_RBTREE,
> 
> Please use _MAPLE for new devices, it's more modern than _RBTREE.  It
> should make little if any practical difference.
> 
>> +	.use_single_read = true,
>> +	.use_single_write = true,
>> +};
> 
>> +/*
>> + * Registers are big-endian on I2C and SPI but little-endian on SoundWire.
>> + * Exported firmware controls are big-endian on I2C/SPI but little-endian
>> + * on SoundWire.
> 
> Are you sure this isn't due to running on different host architecture?
> 
>> + * Firmware files are always big-endian and are opaque blobs.
>> + * Present a big-endian regmap and hide the endianness swap,
>> + * so that the ALSA byte controls always have the same byte order,
>> + * and firmware file blobs can be written verbatim.
>> + */
>> +static const struct regmap_bus tas2783_regmap_bus_sdw = {
>> +	.read = tas2783_sdw_read,
>> +	.write = tas2783_sdw_write,
>> +	.gather_write = tas2783_sdw_gather_write,
>> +	.reg_format_endian_default = REGMAP_ENDIAN_LITTLE,
>> +	.val_format_endian_default = REGMAP_ENDIAN_BIG,
>> +};
> 
> None of the other SoundWire devices use a custom bus, this all feels
> suspicous especially since there's a bunch of bypassing of the bus in
> places and calling functions directly.  I would expect everything
> outside the regmap code should be able to use the regmap, possibly
> excluding firmware download, and that regmap should be able to
> encapsulate any differences in endianness between the different buses.
> At the minute the regmap is reported as having 8 bit registers which
> should mean there are no endianness issues.
> 

This looks suspiciously like it has been copied from the cs35l56_sdw.c
driver without understanding why cs35l56 does this. This TAS2783 driver
is only SDW, so what has I2C and SPI have to do with this? It's a huge
coincidence for the TAS2783 to have exactly the same
backward-compatibility quirks as the CS35L56 that necessitated a custom
regmap, i.e. three control interfaces, a register map that is sent big
endian on I2C/SPI but little-endian on SDW, downloadable firmware with
a file format that is big-endian, and DSP registers that are endian
swapped on I2C/SPI but not SDW.

The rt*-sdw.c or max*-sdw.c devices are a better starting point for a
Soundwire codec driver.
