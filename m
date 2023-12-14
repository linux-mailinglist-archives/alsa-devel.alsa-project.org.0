Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A7E813505
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 16:41:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15B2BDF2;
	Thu, 14 Dec 2023 16:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15B2BDF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702568463;
	bh=MebzFsFfhSJ5dIfclJguwUeKJcn4t6kLU1YEnX6kTVk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V5kqH4ViIJKREx70tjEzj7XqnCF/DFkJ2h29mkfvx23W/E5MN22DZF5juoPvqxzgG
	 cXwEgUZ4Dj6Y8CT6yMAjDNPFJrCfPcNyBVRjjXh1UNQmegR8DPm7STjDcXGZ/qE3Ea
	 3Y8fwguXQOA7nVatbNtL2tFyOP6kwh5AXZ5E3qzw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B63F0F80587; Thu, 14 Dec 2023 16:40:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C223DF80124;
	Thu, 14 Dec 2023 16:40:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A738BF8016A; Thu, 14 Dec 2023 16:40:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87D67F8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 16:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87D67F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jkWP3dlq
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BECwqvj011581;
	Thu, 14 Dec 2023 09:40:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=z3TGw5/xezw89jMNYCXSuUDyHpcWKRZb/6RcGoYuygE=; b=
	jkWP3dlqx/A9WQkKPMxF1whG/BUJzvaf36HAJldN9eW7WaU4TJ65ZimSatJr7jSu
	YAkMJBWShqnZGGjmQSPTgka6u1LDkC8Uq658dGEs6wiInYopckxU32q9G/zsmSC/
	XYQZBebxuTGSgEbzKrED1lzpGh2rA+dkImOJqFFdBpTZXAZGgr8Wg5oymTnMIWkP
	nwaDtFAQPZV5QDRr5aoovgTgJlx201N65Zduls9MqxO6zu139x2vdN/ts9rNixbU
	EmFQAkQ8JM3Cbn8MjGN2+uQYINm3fSOrQNGUMGtDaiY+NwbOhK/+RiJcnRv/L91C
	Q3euNMQwlExvPpDfTo6Ubw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uvnhpp9c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 09:40:00 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Dec
 2023 15:39:59 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Thu, 14 Dec 2023 15:39:59 +0000
Received: from [198.90.251.142] (EDIN4WRCFY3.ad.cirrus.com [198.90.251.142])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2580F11CC;
	Thu, 14 Dec 2023 15:39:59 +0000 (UTC)
Message-ID: <d98a3157-6e58-4dd9-a35a-759bcdcbe0c9@opensource.cirrus.com>
Date: Thu, 14 Dec 2023 15:39:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/1] ALSA: hda: cs35l41: Dell Fiorano add missing _DSD
 properties
To: Takashi Iwai <tiwai@suse.de>, <patches@opensource.cirrus.com>
CC: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <sbinding@opensource.cirrus.com>,
        <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        Jasper Smet
	<josbeir@gmail.com>
References: <20231212195243.10666-1-alex.vinarskis@gmail.com>
 <87fs05qc65.wl-tiwai@suse.de>
Content-Language: en-US
From: Stuart Henderson <stuarth@opensource.cirrus.com>
In-Reply-To: <87fs05qc65.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rHyxExfuHEw1QW_H6SzrQsJ3uLSBj6WG
X-Proofpoint-ORIG-GUID: rHyxExfuHEw1QW_H6SzrQsJ3uLSBj6WG
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LYRBM4QRQLD77MPJT6SXOHWPRTOIVBR6
X-Message-ID-Hash: LYRBM4QRQLD77MPJT6SXOHWPRTOIVBR6
X-MailFrom: prvs=77126fb03d=stuarth@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYRBM4QRQLD77MPJT6SXOHWPRTOIVBR6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 14/12/2023 11:02, Takashi Iwai wrote:
> On Tue, 12 Dec 2023 20:52:43 +0100,
> Aleksandrs Vinarskis wrote:
>> Dell XPS 9530 (2023) has two SPI connected CS35L41 amplifiers, however
>> is missing _DSD properties, cs-gpios and has a firmware bug which caps SPI
>> controller's speed to unusable 3051Hz. This patch adds _DSD properties and
>> sets second cs-gpio. In case SPI speed bug is detected, it will not
>> initialize the device to avoid hangs on wake up.
>>
>> Resolution of SPI speed bug requires either a patch to `intel-lpss.c` or an
>> UEFI update with corrected values from Dell. Tested with locally applied
>> patch to `intel-lpss` on multiple XPS 9530 devices.
>>
>> Co-developed-by: Jasper Smet <josbeir@gmail.com>
>> Signed-off-by: Jasper Smet <josbeir@gmail.com>
>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Can Cirrus team review this?
>
>
> thanks,
>
> Takashi

The patch looks sensible, with some minor comments below, however we're 
just at the tail end of testing a patch chain that genericises a lot of 
this code and adds support for a rather large batch of other laptops 
with incomplete DSD.  We're hoping to push this upstream on Monday.

Can I be awkward and ask that we hold off on this patch chain until 
then?  Then we can add this laptop using the new approach.

If/when the chain is accepted, we will add support for a few Dell 
laptops as well, including this one.

>> ---
>>   sound/pci/hda/cs35l41_hda_property.c | 47 ++++++++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
>> index c83328971728..69446a794397 100644
>> --- a/sound/pci/hda/cs35l41_hda_property.c
>> +++ b/sound/pci/hda/cs35l41_hda_property.c
>> @@ -7,9 +7,55 @@
>>   // Author: Stefan Binding <sbinding@opensource.cirrus.com>
>>   
>>   #include <linux/gpio/consumer.h>
>> +#include <linux/spi/spi.h>
>>   #include <linux/string.h>
>>   #include "cs35l41_hda_property.h"
>>   
>> +/*
>> + * Device 10280BEB (Dell XPS 9530) doesn't have _DSD at all. Moreover, pin that is typically
>> + * used for `speaker_id` is missing. SPI's cs-gpios definitions are also missing.
>> + */
>> +static int dell_fiorano_no_acpi(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
>> +				const char *hid)
>> +{
>> +	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
>> +	struct spi_device *spi = to_spi_device(cs35l41->dev);
>> +
>> +	/*
>> +	 * 10280BEB has a firmware bug, which wrongly enables clock divider for intel-lpss
>> +	 * Resultant SPI clock is 100Mhz/32767=3051Hz, which leads to ~3 minute hang on boot/wake up
>> +	 * Avoid initializing device if lpss was not patched/fixed UEFI was not installed
>> +	 */
>> +	if (spi->max_speed_hz < CS35L41_SPI_MAX_FREQ) {
>> +		dev_err(cs35l41->dev, "SPI's max_speed_hz is capped at %u Hz, will not continue to avoid hanging\n",
>> +			spi->max_speed_hz);
>> +		return -EINVAL;
>> +	}

Instead of erroring out, I wonder if we can noodle our way to the 
appropriate clk and clk_set_rate it up to 4MHz for this particular 
laptop only?  Stefan's taking a look at that.

Also, any SPI rate >~100k is probably just about usable, so we don't 
want to error on <4MHz.  Quite often the spi clock is set at some value 
just below 4MHz.  It's unclear if this is going to get fixed in the BIOS 
at this point, so we don't know what exact rate we'd eventually receive.

>> +
>> +	dev_info(cs35l41->dev, "Adding DSD properties for %s\n", cs35l41->acpi_subsystem_id);
>> +
>> +	/* check SPI address to assign the index */
>> +	cs35l41->index = id;
>> +	cs35l41->channel_index = 0;
>> +	/* 10280BEB is missing pin which is typically assigned to `spk-id-gpios` */
>> +	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, cs35l41->index, 2, -1);
>> +	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 1, GPIOD_OUT_LOW);
>> +
>> +	hw_cfg->spk_pos = cs35l41->index  ? 1 : 0;	// 0th L, 1st R
>> +	hw_cfg->bst_type = CS35L41_EXT_BOOST;
>> +	hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
>> +	hw_cfg->gpio1.valid = true;
>> +	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
>> +	hw_cfg->gpio2.valid = true;
>> +	hw_cfg->valid = true;
>> +
>> +	/* Add second cs-gpio here */
>> +	if (cs35l41->index)
>> +		spi->cs_gpiod = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
This will break once you pick up AMD's multi-cs patches, we should use 
spi_set_csgpiod instead.
>> +
>> +	return 0;
>> +}
>> +
>>   /*
>>    * Device CLSA010(0/1) doesn't have _DSD so a gpiod_get by the label reset won't work.
>>    * And devices created by serial-multi-instantiate don't have their device struct
>> @@ -92,6 +138,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>>   	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
>>   	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
>>   	{ "CSC3551", "103C89C6", hp_vision_acpi_fix },
>> +	{ "CSC3551", "10280BEB", dell_fiorano_no_acpi },
>>   	{}
>>   };
>>   
>> -- 
>> 2.40.1
>>
