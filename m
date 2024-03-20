Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C24FE8812E5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:05:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EB7F2BB4;
	Wed, 20 Mar 2024 15:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EB7F2BB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943559;
	bh=Ib1YGi6+k7//xZhCELUHLMN5Yymzlzl+jC3TmZzQS9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kqUPWObPQV25a2LQwBmHX5B+6rQc1+P6F/6T0OtPRSAwRzoUjdYvCYsdjAUAQUjRc
	 rnACpvR5ur7Zhh6VPEHJ2qzQb9fD8tWNVczsS6qDE/4EQwGcYMO0JedpueuAdGwBP9
	 7jXs35Bm2SVcYR9Y0aboQs1Cbo0cX0yHkfE1zne8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B07BEF896E4; Wed, 20 Mar 2024 15:00:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7700CF896F0;
	Wed, 20 Mar 2024 15:00:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02DAEF804E7; Wed, 20 Mar 2024 08:46:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74837F80088
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 08:46:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74837F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CntIZw8p
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92281FF807;
	Wed, 20 Mar 2024 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710920781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5e54mRdfjOEsN/nbRi2WZI4kTVdEISox3uake09K72s=;
	b=CntIZw8pN/VwkZVAO2SKwwcoAtquLsqesAgaQpn/KPk1iEZfAC8HeTtQHdijlfn6YGgsSx
	RQos6KXPFCJ4c+Xi5wqSS70s9jR4Zxwn5dareb5xQLoAPE3QoIrSICgKBVpvUdicaLz7tL
	wIKiOyqdbu88jmtnChKDI3UnAImFTS9B0/OAy9UvC3GUyqh3zn31c+5JvDi0HKX2kPTeQS
	7kalN+DfuBkBhSOnaZj3grj22/4vg70ATfphQ174JcteuOWhGa1BD317xg1aOTsUa0uI9O
	+ak0xuplA037PBZYHBDJJhmMdYh6XEXakJ5DiuGKbgj0s4IakIvCwG1PAHS++g==
Message-ID: <773cd098-0678-4edc-aea3-0418bedebc13@bootlin.com>
Date: Wed, 20 Mar 2024 08:46:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] ASoC: dt-bindings: davinic-mcbsp: Add the
 'ti,drive-dx' property
Content-Language: en-US
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
 <20240315112745.63230-13-bastien.curutchet@bootlin.com>
 <6e120eee-5cec-460c-87d2-40ef776efc3d@gmail.com>
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <6e120eee-5cec-460c-87d2-40ef776efc3d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VRUNEZUQYNMFSUZK7YRWXAXF4JKPXCT2
X-Message-ID-Hash: VRUNEZUQYNMFSUZK7YRWXAXF4JKPXCT2
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRUNEZUQYNMFSUZK7YRWXAXF4JKPXCT2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Péter,


On 3/19/24 19:02, Péter Ujfalusi wrote:
> 
> 
> On 15/03/2024 13:27, Bastien Curutchet wrote:
>> McBSP is able to handle capture and playback stream.
>> The McBSP's DX pins that outputs serial data during playback streams can
>> be used to output a chosen pattern during capture streams. For instance,
>> this can be useful to drive an active-low signal during capture streams
>> (by choosing <0> as pattern)
> 
> or configure the MCBSPx.DX pin as GPO and use it as a GPIO?

In my use case, DX pin is connected to the ADC chip select pin so I want
the DX pin to toggle the closest possible to capture's start. That's
why I introduced this feature over configuring the pin as GPO.

> 
> Quite novel use of the hardware, no doubt about it. If you don't have
> DMA servicing the TX, it will just re-transmit the word from from the
> DXR register when the transmitter is pulled out of reset.
> 
> Interesting, but I'm not sure if this belongs to DT.
> 
>> Add a 'ti,drive-dx' property that can be used to repeatedly output a
>> chosen pattern on DX pin while capture stream is ON.
>>
>> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
>> ---
>>   Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
>> index d8d4e7ea6e02..f4d1fc6bcd61 100644
>> --- a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
>> +++ b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
>> @@ -80,6 +80,13 @@ properties:
>>         Enable synchronisation error detections when an unexpected frame pulse is
>>         received. If not present, unexpected frame pulses are ignored.
>>   
>> +  ti,drive-dx:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      If the property is present, McBSP will repeatedly output the selected
>> +      value on DX pin during capture streams. For instance, if set to 0, this
>> +      can be used to drive an active-low signal.
>> +
>>   required:
>>     - "#sound-dai-cells"
>>     - compatible
> 

Best regards,
Bastien
