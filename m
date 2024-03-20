Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5488812E2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:05:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F5082BB4;
	Wed, 20 Mar 2024 15:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F5082BB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943541;
	bh=Ik5ahjZmxjfQ1FR/v6ZDPMYWeeijut/xAT0hg7CxjZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A4vcjEeu81/yEevnpMtcVvSjS91Gs0BRPcP4L/FTPDvpr0NQvNxxzznW3HkAWXV1g
	 Qwsmkvryu3b+8jVC1YPk3pzmER8WUe9vspUoIhFTWOeF0RDqNPtZutvC+2WvLJriq+
	 l6no1LSJtRB53sLb7fIecx0dJ/YQqcm593fKbr44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08231F896CC; Wed, 20 Mar 2024 15:00:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC31BF896E0;
	Wed, 20 Mar 2024 15:00:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 335B0F804E7; Wed, 20 Mar 2024 08:31:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 491D8F8025F
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 08:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 491D8F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q1cBSxYK
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68F241BF20A;
	Wed, 20 Mar 2024 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710919871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voBe4cnKC0PYia7ms5iUQbaUgT546itFPRtdPkNE1ao=;
	b=Q1cBSxYKQaIltFJkiNRkwe6YV7E7uUhmWbptRl2p/i0RABaEw6LCltBs36y+/AFubbLIoI
	Gm2n0LiHp+5jjpd7Ux+FiS6cQfihpFUlZuH5uqTXDDmejoDNW7Hpg8ku5vt7sfsVzszS2C
	HMOZ2ydoyDCJT6i8PqzsNXNMe27Y6ArMipnHj7rDltqswrI48QRV4v716Ay18bxoAkzimR
	uwKKDIkLQtJ/DDeNbbAsHpAJEFXACx1sRL6UePnwjfqnQWoT3NMwHx6ocx8grfkdymdzfE
	VFWAH2+u8OLiNA8UfJIbY6iTIrolrARnTn8ZBx+owPUttl1KIXsf1lN13sIPeA==
Message-ID: <f2d8715d-a1ad-45a4-952f-a702b29740be@bootlin.com>
Date: Wed, 20 Mar 2024 08:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] ASoC: ti: davinci-i2s: Add TDM support
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-8-bastien.curutchet@bootlin.com>
 <9d123584-1feb-404b-890f-2da694cf56d5@gmail.com>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <9d123584-1feb-404b-890f-2da694cf56d5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2RYBBUZXIZR2JZYQNTW67EEZJXK7MBMN
X-Message-ID-Hash: 2RYBBUZXIZR2JZYQNTW67EEZJXK7MBMN
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RYBBUZXIZR2JZYQNTW67EEZJXK7MBMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Péter,

>> +static int davinci_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
>> +				    unsigned int tx_mask,
>> +				    unsigned int rx_mask,
>> +				    int slots, int slot_width)
>> +{
>> +	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
>> +
>> +	dev_dbg(dev->dev, "%s - slots %d, slot_width %d\n", __func__, slots, slot_width);
> 
> The __func__ can be ommited, it is better to leave it for dynamic
> debugging by adding "dyndbg=+pmf" module parameter if needed.
> 

True, I'll remove the __func__.

>> +
>> +	if (slots > 128 || !slots) {
>> +		dev_err(dev->dev, "Invalid number of slots\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (rx_mask != (1 << slots) - 1) {
>> +		dev_err(dev->dev, "Invalid RX mask (0x%08x) : all slots must be used by McBSP\n",
>> +			rx_mask);
>> +		return -EINVAL;
> 
> This is only a restriction for RX?
> 

Nope you're right, I'll add the same for tx_mask.

>> +	}
>> +
>> +	if (davinci_i2s_tdm_word_length(slot_width) < 0) {
>> +		dev_err(dev->dev, "%s: Unsupported slot_width %d\n", __func__, slot_width);
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev->tdm_slots = slots;
>> +	dev->slot_width = slot_width;
>> +
>> +	return 0;
>> +}
>> +
>>   #define DEFAULT_BITPERSAMPLE	16
>>   
>>   static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>> @@ -228,6 +282,13 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>>   		DAVINCI_MCBSP_SRGR_FWID(DEFAULT_BITPERSAMPLE - 1);
>>   
>>   	dev->fmt = fmt;
>> +
>> +	if ((dev->tdm_slots || dev->slot_width) &&
>> +	    ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_BP_FC)) {
>> +		dev_err(dev->dev, "TDM is only supported for BP_FC format\n");
>> +		return -EINVAL;
> 
> I think this is not a valid statement, Fsync can be generated internally
> or coming from external source in TDM mode also.
> 

My hardware allow me to only test BP_FC so I wished to put some
'barriers' in front of untested things.


Best regards,
Bastien
