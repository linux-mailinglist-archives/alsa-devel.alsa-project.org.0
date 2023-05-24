Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193370F805
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 15:50:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 136791F9;
	Wed, 24 May 2023 15:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 136791F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684936249;
	bh=eOWh+03SOK7Ma/sA2JICrBy2SCdrGT1dVFFRySHiFBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b2CAljRDJI1A0izWE1fMjdmS2rZBNfNHbVVHDnR1hqug2sMB97bOHcK0d0iSODR5Y
	 ZmMj6aAQ09X2ew5R1vCwWVJqgaeQlbgsBejR+18Q+1fUAA+BaMhh9aABOSkvxHrJFP
	 N/bKQutpD+zutDB96PCN7FW0+7YIdfnjfmz1R2Go=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EB34F80249; Wed, 24 May 2023 15:49:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B5DFF80249;
	Wed, 24 May 2023 15:49:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58A9EF8024E; Wed, 24 May 2023 15:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54F01F80086
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 15:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54F01F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=O7Qsp6hF
Received: from [192.168.1.90] (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BBF796605943;
	Wed, 24 May 2023 14:49:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684936181;
	bh=eOWh+03SOK7Ma/sA2JICrBy2SCdrGT1dVFFRySHiFBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O7Qsp6hFFseZyO9Y61woxfnLQ7oR35mF7vipm2dk/c4+9mVrNZYJLFloqs/vzkHst
	 NrXlx5DLBKi34JaJdpL5g8XeVnpTlzsW4/xk3V8t+gXa2zuznY0LAqrLAYRYuHn3Ti
	 lIHEczYNcFyW27XPdxT0t3G2zOmhyMPQlnJ11kywsGHd/Upwnl6hF1rPQq/216bbAC
	 ArGaN+tOO9X4EZdXoDgRiujGsWcSvSn91tBjvfhmDXPbdKPlyHXdXkj2FpWBRBq+6W
	 XsAVJZlkxnVTIZcYOkIfsV7BbB16dPeBJjBSKvtXvx/JnHNl21yGoHmRQmeIKqTU6b
	 gnueVO9Dpr0Pw==
Message-ID: <cfa23203-1626-440b-ec27-efe56cb297d2@collabora.com>
Date: Wed, 24 May 2023 16:49:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] ASoC: es8316: Increment max value for ALC Capture
 Target Volume control
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Zhu Ning <zhuning0077@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 David Yang <yangxiaohua@everest-semi.com>, Daniel Drake
 <drake@endlessm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@collabora.com
References: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
 <20230524074156.147387-2-cristian.ciocaltea@collabora.com>
 <5dbcbf84-602a-44de-ad99-268d4d5b4b2f@sirena.org.uk>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <5dbcbf84-602a-44de-ad99-268d4d5b4b2f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QWCF5HGYD6CYUFK7IXZTCGHCXMNNMINM
X-Message-ID-Hash: QWCF5HGYD6CYUFK7IXZTCGHCXMNNMINM
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWCF5HGYD6CYUFK7IXZTCGHCXMNNMINM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/24/23 13:30, Mark Brown wrote:
> On Wed, May 24, 2023 at 10:41:54AM +0300, Cristian Ciocaltea wrote:
> 
>> This means that either the hardware default is wrongly set to 0xB
>> instead of 0xA, or the specs are incorrect and instead of having the
>> range 0xA-0xF mapped to -1.5 dB, the single value 0xA should have been
>> mapped to -1.5 dB and the remaining range 0xB-0xF to 0 dB.
> 
>> Increment the max value allowed for ALC Capture Target Volume control,
>> so that it matches the hardware default.
> 
>> -	SOC_SINGLE_TLV("ALC Capture Target Volume", ES8316_ADC_ALC3, 4, 10, 0,
>> +	SOC_SINGLE_TLV("ALC Capture Target Volume", ES8316_ADC_ALC3, 4, 11, 0,
>>  		       alc_target_tlv),
> 
> The description above of what the control does doesn't seem to match
> what alc_target_tlv specifies - it is:
> 
>   static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(alc_target_tlv, -1650, 150, 0);
> 
> which is saying that the value goes from -16.5dB up in steps of 1.5dB
> but your description above says that 0-10 map to -1.5dB and other values
> are 0dB.

My description above mentioned only the 0xA-0xF (10-15) range, anything
before that is fine and the implementation matches the specs:

0000 –> -16.5 dB
0001 –> -15.0 dB
0010 –> -13.5 dB
...
0111 –>  -6.0 dB
1000 –>  -4.5 dB
1001 –>  -3.0 dB

The inconsistency is here:
1010-1111 –> -1.5 dB

Since the hardware default is 1011 (11) instead of 1010 (10), I assumed
the specs could be wrong and probably should have provided the following
mappings:

1010 ->  -1.5 dB
1011-1111 -> 0 dB

> Presumably you can check the effects of changing the value?  It seems
> plausible that what's written in the code might be accurate and the
> higher values might actually change the gain but it'd be better to
> check.

I haven't noticed a (measurable) change in gain when switching between
10 and 11, but my testing equipment is also not that great. Will try to
improve the tests accuracy.

Thanks,
Cristian
