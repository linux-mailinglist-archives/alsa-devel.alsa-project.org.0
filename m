Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA136920F6
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 15:41:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3FFD83B;
	Fri, 10 Feb 2023 15:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3FFD83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676040076;
	bh=jAmj0RGTbJe31/wJNJOtBK00bSvRA/WFct2zqCkKvQc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hAruUgEp6SBBte/nyHUaMmIJruEY5eigUra+w1atkmfibPvhgpE7oZBKCaIt8SK5U
	 y7NuuvTImkq4eUK4BYpWo3cE7GcVvrUYR/OHzve+NAlB/QUbaIAYbFqHpj7+7icS+J
	 xwmjBJ2eni78+L9YUdnp++0GWWCTRC8cbUBirPgI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ADE5F800B8;
	Fri, 10 Feb 2023 15:40:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57485F800E4; Fri, 10 Feb 2023 15:40:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CC48F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 15:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC48F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=n8fZM4DL
Received: from [192.168.86.246]
 (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 22A6A66020EC;
	Fri, 10 Feb 2023 14:39:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676039998;
	bh=jAmj0RGTbJe31/wJNJOtBK00bSvRA/WFct2zqCkKvQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n8fZM4DLbj+rsWKXPth6DfwVrom2jMbsSNsQo4LcQivcAFQILz2tx9G6H/IB4aEtB
	 YNI4hc0/OLyoiUDtMZaWRBDNkaZBxpYbMv920uqgJ/HP7e2l/eaqHDNRgXZ0mF9FW1
	 FKhDX2q4LD74iIkuJu1jgboDNgweps0UXhncQJRBi31poHST2YARS7UJeKDTfon8ev
	 deyXuj1aMcxj/z/0AsDrpWO6pWA8IrQ0yz0GGP/0IHr49D+Jo/XQqlYVq9+VL6XCk0
	 uYCS4aFJ7ToiMIZ03ElXmzGvLwRIagNtZRakD1jgfBljfMOAEwBFBYkA/uwUCpYPgw
	 XicfLV4Me+mXw==
Message-ID: <cfacc3d6-2daa-6aa3-ba19-281b7e48bb47@collabora.com>
Date: Fri, 10 Feb 2023 14:39:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 3/4] ALSA: cs35l41: Add shared boost feature
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230210091942.10866-1-lucas.tanure@collabora.com>
 <20230210091942.10866-4-lucas.tanure@collabora.com>
 <20230210134341.GF68926@ediswmail.ad.cirrus.com>
From: Lucas Tanure <lucas.tanure@collabora.com>
In-Reply-To: <20230210134341.GF68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MJ6OZTJ65PLXLUAPOH5YOLT6NKEHNFLL
X-Message-ID-Hash: MJ6OZTJ65PLXLUAPOH5YOLT6NKEHNFLL
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJ6OZTJ65PLXLUAPOH5YOLT6NKEHNFLL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10-02-2023 13:43, Charles Keepax wrote:
> On Fri, Feb 10, 2023 at 09:19:41AM +0000, Lucas Tanure wrote:
>> Shared boost allows two amplifiers to share a single boost circuit by
>> communicating on the MDSYNC bus.
>> The passive amplifier does not control the boost and receives data from
>> the active amplifier.
>>
>> Shared Boost is not supported in HDA Systems.
>> Based on David Rhodes shared boost patches.
>>
>> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
>> ---
> 
> Ok I found a copy of David's internal patch which helps a litte.
> 
>> --- a/sound/soc/codecs/cs35l41-lib.c
>> +++ b/sound/soc/codecs/cs35l41-lib.c
>> @@ -1114,12 +1114,31 @@ static const struct reg_sequence cs35l41_reset_to_safe[] = {
>>   	{ 0x00000040,			0x00000033 },
>>   };
>>   
>> +static const struct reg_sequence cs35l41_actv_seq[] = {
>> +	/* SYNC_BST_CTL_RX_EN = 0; SYNC_BST_CTL_TX_EN = 1 */
>> +	{CS35L41_MDSYNC_EN,        0x00001000},
> 
> David's internal patch appears to set 0x3000 on the active side,
> not sure where that difference snuck in, or which is the correct
> value. Your settings appear to make logical sense to me though, TX
> on the active side, RX on the passive side.
Yes, I an e-mail David said that the passive was controlling the boost 
and out putting the value to the active one, but in the Documentation 
patch he sent the explanation was exactly the opposite.

Quote:
" The passive amplifier does not control the boost and receives data 
from the active amplifier."

And as the patch sets TX and RX in the same chip I changed to follow the 
documentation.

> 
>> +	/* BST_CTL_SEL = CLASSH */
>> +	{CS35L41_BSTCVRT_VCTRL2,    0x00000001},
> 
> BST_CTL_SEL is in BSTCVRT_VCTRL1 (or BOOST_VOLTAGE_CFG, as it
> is called in the datasheet, yay us for using the same names).
> That does not mean this write is wrong, could just be the
> comment, but what this does write is a bit odd so I would like
> David to confirm this isn't some typo in his original patch.

I can't find BOOST_VOLTAGE_CFG on my datasheet, but BST_CTL_SEL is at 
0x00003804 ( BSTCVRT_VCTRL2 / VBST_CTL_2 ).
This write here is to select the boost control source, which for the 
active should be "Class H tracking value".
So I still think this is correct.

> 
>> +};
>> +
>> +static const struct reg_sequence cs35l41_pass_seq[] = {
>> +	/* SYNC_BST_CTL_RX_EN = 1; SYNC_BST_CTL_TX_EN = 0 */
>> +	{CS35L41_MDSYNC_EN,        0x00002000},
>> +	/* BST_EN = 0 */
>> +	{CS35L41_PWR_CTRL2,        0x00003300},
>> +	/* BST_CTL_SEL = MDSYNC */
>> +	{CS35L41_BSTCVRT_VCTRL2,    0x00000002},
> 
> Ditto here, comment doesn't match the write.

Same as above, re-write to be the passive, with RX not TX.

> 
>> -int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable)
>> +int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable,
>> +			  struct completion *pll_lock)
>>   {
>>   	int ret;
>> +	unsigned int gpio1_func, pad_control, pwr_ctrl1, pwr_ctrl3;
>> +	struct reg_sequence cs35l41_mdsync_down_seq[] = {
>> +		{CS35L41_PWR_CTRL3,		0},
>> +		{CS35L41_GPIO_PAD_CONTROL,	0},
>> +		{CS35L41_PWR_CTRL1,		0, 3000},
>> +	};
>> +	struct reg_sequence cs35l41_mdsync_up_seq[] = {
>> +		{CS35L41_PWR_CTRL3,	0},
>> +		{CS35L41_PWR_CTRL1,	0x00000000, 3000},
>> +		{CS35L41_PWR_CTRL1,	0x00000001, 3000},
>> +	};
>>   
>>   	switch (b_type) {
>> +	case CS35L41_SHD_BOOST_ACTV:
>> +	case CS35L41_SHD_BOOST_PASS:
>> +		regmap_read(regmap, CS35L41_PWR_CTRL3, &pwr_ctrl3);
>> +		regmap_read(regmap, CS35L41_GPIO_PAD_CONTROL, &pad_control);
>> +
>> +		pwr_ctrl3 &= ~CS35L41_SYNC_EN_MASK;
>> +		pwr_ctrl1 = enable << CS35L41_GLOBAL_EN_SHIFT;
> 
> Are you sure this is what you want? In the case of powering up,
> the sequence would end up being:
> 
> mdsync_down
>   -> sets GLOBAL_EN on
> mdsync_up
>   -> sets GLOBAL_EN off
>   -> sets GLOBAL_EN on
> 
> Feels like mdsync_down should always turn global_enable off? But
> again I don't know for sure. But then I guess why is there the
> extra write to turn it off in mdsync_up? 

For the disable case (DAPM turning everything off) SYNC and Global 
enable are off and the code hits

if (!enable)
	break;

But for for enable case (DAPM turning everything On) the code continues 
enabling SYNC_EN, and turning off Global enable, as requested by
"4.10.1 Multidevice Synchronization Enable" page 70.
But as it is a enable path Global should be enabled again.

I can't see any sign of
> GLOBAL_EN bouncing in David's internal patch.

Yes, but it is required by :
"4.10.1 Multidevice Synchronization Enable" page 70.

Thanks
Lucas

> 
>> +
>> +		gpio1_func = enable ? CS35L41_GPIO1_MDSYNC : CS35L41_GPIO1_HIZ;
>> +		gpio1_func <<= CS35L41_GPIO1_CTRL_SHIFT;
> 
> Hm... this is a good point, probably would be nice to return an
> error if the user sets a shared boost mode and a specific function
> for the GPIO1 pin.
> 
>> +		pad_control &= ~CS35L41_GPIO1_CTRL_MASK;
>> +		pad_control |= gpio1_func & CS35L41_GPIO1_CTRL_MASK;
>> +
>> +		cs35l41_mdsync_down_seq[0].def = pwr_ctrl3;
>> +		cs35l41_mdsync_down_seq[1].def = pad_control;
>> +		cs35l41_mdsync_down_seq[2].def = pwr_ctrl1;
>> +		ret = regmap_multi_reg_write(regmap, cs35l41_mdsync_down_seq,
>> +					     ARRAY_SIZE(cs35l41_mdsync_down_seq));
>> +		if (!enable)
>> +			break;
>> +
>> +		if (!pll_lock)
>> +			return -EINVAL;
>> +
>> +		ret = wait_for_completion_timeout(pll_lock, msecs_to_jiffies(1000));
>> +		if (ret == 0) {
>> +			ret = -ETIMEDOUT;
>> +		} else {
>> +			regmap_read(regmap, CS35L41_PWR_CTRL3, &pwr_ctrl3);
>> +			pwr_ctrl3 |= CS35L41_SYNC_EN_MASK;
>> +			cs35l41_mdsync_up_seq[0].def = pwr_ctrl3;
>> +			ret = regmap_multi_reg_write(regmap, cs35l41_mdsync_up_seq,
>> +						     ARRAY_SIZE(cs35l41_mdsync_up_seq));
>> +		}
>> +		break;
> 
> Thanks,
> Charles

