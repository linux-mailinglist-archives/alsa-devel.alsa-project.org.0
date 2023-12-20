Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF781A070
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 14:59:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271CF1F7;
	Wed, 20 Dec 2023 14:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271CF1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703080747;
	bh=z6TXa4fn9wXRHnFHYJTKN6FWlKYMpfmvMwoDtUnbHvk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HAMn2TZt6Jqv0XSjSSNrruNz5KtsHvhPWN1PFanD2MYFniecFgQ+tyyEjtD0IS4AS
	 qDZyUXqhpsbiSGQN8RiMh9WMjQBqZsea3lDoJWm0XS9abZ4ByFyaTh2p9BRHGk76o9
	 tX46LTCEjpxwDrZ/1poiWBxDl/dGyafVTbVNYAVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 468F0F80580; Wed, 20 Dec 2023 14:58:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5BF1F8057B;
	Wed, 20 Dec 2023 14:58:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E96DBF80425; Wed, 20 Dec 2023 14:58:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B751F8016E
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 14:58:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B751F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZFAQ4NF2
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BK4mAWx007661;
	Wed, 20 Dec 2023 07:58:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=2RaUXeYR8pBokcfoFMpjl40DICG+UU/c3Xv71HcDNpI=; b=
	ZFAQ4NF2p4wZFry81X1lDf0eDCF3IXECNJyUoc0sTJKNh+nsHP8PVx3jS7B+3Hrk
	7QhRfSTT94V8GkA1UPaeEY3oCpLfVb6lQpXPq0SItQGSbgqV12IbMoFkBa6NeyGO
	MgVFt3GzrY4ZnVaWEbfC8qLHoYZzQidwbrAbnHZGi7mn0xf+OvMrcwccep07s96f
	hDELUnTUcBlmrrRkwn7Q8NM3iTs94rxmvqJyUG95nwqkKHHA5+vs2Lu9HTW+m6+4
	dWPbqkCmjFW9L7uuuS80rtbNSHhW6CMNdyCTLRQ1YvVjKHGNlSKjPjJwBvXdDmd9
	GYtnSW5lQznrlK+trgnyww==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a625ger-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 07:58:21 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Dec
 2023 13:58:19 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Wed, 20 Dec 2023 13:58:19 +0000
Received: from [198.61.64.132] (LONN2DGDQ73.ad.cirrus.com [198.61.64.132])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BB12511AB;
	Wed, 20 Dec 2023 13:58:18 +0000 (UTC)
Message-ID: <97da898a-b747-44f3-87a7-021aea8ca4ac@opensource.cirrus.com>
Date: Wed, 20 Dec 2023 13:58:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: cs35l41: Add HP override
Content-Language: en-GB
To: Lorenz Brun <lorenz@brun.one>, James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20231219201513.2172580-1-lorenz@brun.one>
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <20231219201513.2172580-1-lorenz@brun.one>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xo9-pVIn1eM0HVOy6K49lfXuUYburjHR
X-Proofpoint-ORIG-GUID: Xo9-pVIn1eM0HVOy6K49lfXuUYburjHR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2MWHX24VYDZNFWIIO4SKSZWSF33RGVPF
X-Message-ID-Hash: 2MWHX24VYDZNFWIIO4SKSZWSF33RGVPF
X-MailFrom: prvs=7718def8b8=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MWHX24VYDZNFWIIO4SKSZWSF33RGVPF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I recently pushed up some changes that allow you to add laptops into a 
configuration table, these laptops should be added into that instead of 
creating a new function.

I don't have the configuration of some of these laptops right now to be 
able to review it, but hopefully I should be able to obtain them.

Thanks,

Stefan

On 19/12/2023 20:15, Lorenz Brun wrote:
> This adds an override for a series of notebooks using a common config
> taken from HP's proprietary Windows driver (csaudioext).
>
> This has been tested on a HP 15-ey0xxxx device (subsystem 103C8A31)
> together with another Realtek quirk and the calibration files from the
> proprietary driver.
>
> Signed-off-by: Lorenz Brun <lorenz@brun.one>
> ---
>   sound/pci/hda/cs35l41_hda_property.c | 59 ++++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)
>
> diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
> index c83328971728..8135ea532a94 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -6,6 +6,7 @@
>   //
>   // Author: Stefan Binding <sbinding@opensource.cirrus.com>
>   
> +#include <linux/acpi.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/string.h>
>   #include "cs35l41_hda_property.h"
> @@ -81,6 +82,42 @@ static int hp_vision_acpi_fix(struct cs35l41_hda *cs35l41, struct device *physde
>   	return 0;
>   }
>   
> +/*
> + * HP 2-channel I2C configuration with internal boost (4.1A inductor current) with no _DSD,
> + * reset GPIO can still be extracted from ACPI by index. Covers HP configurations 251, 252,
> + * 253, 254, 351, 352 and 353 in the proprietary driver (csaudioext).
> + */
> +static int hp_i2c_2ch_vbst_ipk41(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
> +			      const char *hid)
> +{
> +	// In case a valid _DSD exists, use that instead of the override. This stops applying
> +	// the override in case HP ever fixes their firmware.
> +	if (device_property_count_u32(physdev, "cirrus,dev-index") > 0)
> +		return -ENOENT;
> +
> +	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
> +
> +	cs35l41->index = id == 0x40 ? 0 : 1;
> +	cs35l41->channel_index = 0;
> +	// Get reset GPIO (shared for both instances) from ACPI GpioIo at index 0.
> +	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
> +	// Speaker ID GPIO is ACPI GpioIo index 1.
> +	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, 0, 0, 1);
> +
> +	hw_cfg->spk_pos = cs35l41->index ? 1 : 0; // left:right
> +	hw_cfg->gpio1.func = CS35L41_NOT_USED;
> +	hw_cfg->gpio1.valid = true;
> +	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
> +	hw_cfg->gpio2.valid = true;
> +	hw_cfg->bst_type = CS35L41_INT_BOOST;
> +	hw_cfg->bst_ind = 1000;
> +	hw_cfg->bst_ipk = 4100;
> +	hw_cfg->bst_cap = 10; // Exact value unknown, maps into correct range
> +	hw_cfg->valid = true;
> +
> +	return 0;
> +}
> +
>   struct cs35l41_prop_model {
>   	const char *hid;
>   	const char *ssid;
> @@ -92,6 +129,28 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>   	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
>   	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
>   	{ "CSC3551", "103C89C6", hp_vision_acpi_fix },
> +	{ "CSC3551", "103C8A28", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8A29", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8A2A", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8A2B", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8A2C", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8A2D", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8A2E", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8A30", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8A31", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BB3", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BB4", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BDF", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BE0", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BE1", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BE2", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BE9", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BDD", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BDE", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BE3", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BE5", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8BE6", hp_i2c_2ch_vbst_ipk41 },
> +	{ "CSC3551", "103C8B3A", hp_i2c_2ch_vbst_ipk41 },
>   	{}
>   };
>   
