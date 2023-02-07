Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 522FA68E4BB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 01:07:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7114D210;
	Wed,  8 Feb 2023 01:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7114D210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675814850;
	bh=cfvcfREHPh+IggvFYU/1ryO6SCNcrW7aAlVSVH/ZGNQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CoCIPkC8jTCwAPvtkvCoCzli8ddLbJ2/0EEBjTz63zjlx235Mq+j5LwhApDSotbqK
	 fygEjgGx6V7u5+OCHFFWWtpVA3lKylnHf04Kp2wOKVi+LJwwG4lXUpgT6vORCrfy5d
	 tn15VOCku/TljKhWED9/MVXgMdQJIi4n3TswXMJc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8237FF8010B;
	Wed,  8 Feb 2023 01:06:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9755F8012B; Wed,  8 Feb 2023 01:06:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EBCBF800AF
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 01:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EBCBF800AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=CeR53vBJ
Received: from [192.168.86.246]
 (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0E3DE6602086;
	Tue,  7 Feb 2023 15:49:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675784971;
	bh=cfvcfREHPh+IggvFYU/1ryO6SCNcrW7aAlVSVH/ZGNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CeR53vBJRzwPjXGUbYyL6Oqi6B9zBJGFT2gHfCaC67eoPDJq3DTT0n1mUCNdEpRAp
	 bILX7Qq0QU7ek5QOtvnMdsO7Up22uzZsWNpQByGkZwd88WEZvaWfETwUTrYFRVuPPd
	 KJHBw/oS+BLqlYyYVPsZci/lbZDuaY1MN++Cb5ObSr5N5ohZ5l4I2qPMuktyG49scq
	 W5YrmFVI+cppp2Xr6C6jRGNwEJUpYre4/nZZ1NertMnLJj4bIFvPoKHzzh24ljxXgb
	 mNFmMitYeZTziWVGmOXa+XxSp0X4mIHM49dEsobi8ZS1EGaRTxINdtLfwIcfp8b5f1
	 R5AWl8kcZopcg==
Message-ID: <dd1bad2b-a56a-c4d2-cc28-6703febdc475@collabora.com>
Date: Tue, 7 Feb 2023 15:49:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] ALSA: cs35l41: Add shared boost feature
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230207104021.2842-1-lucas.tanure@collabora.com>
 <20230207104021.2842-2-lucas.tanure@collabora.com>
 <20230207114855.GC36097@ediswmail.ad.cirrus.com>
From: Lucas Tanure <lucas.tanure@collabora.com>
In-Reply-To: <20230207114855.GC36097@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JKHBCISPIMBA5AW7MESFK6Y6UJVGEQGG
X-Message-ID-Hash: JKHBCISPIMBA5AW7MESFK6Y6UJVGEQGG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKHBCISPIMBA5AW7MESFK6Y6UJVGEQGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07-02-2023 11:48, Charles Keepax wrote:
> On Tue, Feb 07, 2023 at 10:40:20AM +0000, Lucas Tanure wrote:
>> Shared boost allows two amplifiers to share a single boost
>> circuit by communicating on the MDSYNC bus.
>> The passive amplifier does not control the boost and receives
>> data from the active amplifier.
>>
>> Shared Boost is not supported in HDA Systems.
>>
> 
> Probably would be nice to put at least a note to say based on
> David's patches.
ack
> 
>> +static const struct reg_sequence cs35l41_shd_boost_seq[] = {
>> +	{CS35L41_PWR_CTRL3,	0x01000110},
> 
> This will blat whatever the user set in the DRE switch.
> Technically blats the CLASS H enable from the DAPM widget too,
> but as that always turns on should be a no-op. Probably should
> either not register the DRE switch or have setting it return an
> error for these boost modes.
Fixed in v2.
Changed to regmap_update_bits.
> 
>> +int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable,
>> +			  struct completion *pll_lock)
>>   {
>>   	int ret;
>> +	unsigned int gpio1;
>>   
>>   	switch (b_type) {
>> +	case CS35L41_SHD_BOOST_ACTV:
>> +	case CS35L41_SHD_BOOST_PASS:
>> +		regmap_update_bits(regmap, CS35L41_PWR_CTRL3, CS35L41_SYNC_EN_MASK, 0);
>> +
>> +		gpio1 = enable ? CS35L41_GPIO1_MDSYNC : CS35L41_GPIO1_HIZ;
>> +		regmap_update_bits(regmap, CS35L41_GPIO_PAD_CONTROL, CS35L41_GPIO1_CTRL_MASK,
>> +				   gpio1 << CS35L41_GPIO1_CTRL_SHIFT);
>> +
>> +		ret = regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
>> +					 enable << CS35L41_GLOBAL_EN_SHIFT);
>> +		usleep_range(3000, 3100);
>> +		if (!enable)
>> +			break;
>> +
>> +		if (!pll_lock)
>> +			return -EINVAL;
>> +
>> +		ret = wait_for_completion_timeout(pll_lock, msecs_to_jiffies(1000));
>> +		if (ret == 0)
>> +			ret = -ETIMEDOUT;
> 
> This feels kinda scary, in that you are relying on a 1 to 1
> correspondence between this code running and getting a PLL lock
> signal. The datasheet is helpfully completely vague on when PLL
> locks are triggered.
> 
> The PLL enable seems to be set through set_sysclk, which could
> be called multiple times, per DAPM power up.  Does the PLL
> lock only go once global enable has been set? Can't help
> but wonder if a reinit_completion should probably go somewhere
> to ensure we are getting this lock of the PLL not a past one.
Added a reinit_completion at cs35l41_pcm_startup

> 
>> @@ -483,6 +483,11 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
>>   		ret = IRQ_HANDLED;
>>   	}
>>   
>> +	if (status[2] & CS35L41_PLL_LOCK) {
>> +		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS3, CS35L41_PLL_LOCK);
>> +		complete(&cs35l41->pll_lock);
>> +	}
>> +
> 
> If you fall into any of the error cases in this IRQ handler above
> this, it will blat values you don't want into BST_EN although, to
> be fair that does look currently broken for external boost as
> well.
Fixed with a new patch in v2 series.

> 
> Thanks,
> Charles
> 

