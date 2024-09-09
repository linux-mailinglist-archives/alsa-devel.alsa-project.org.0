Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FD972158
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 19:52:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FC3284D;
	Mon,  9 Sep 2024 19:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FC3284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725904328;
	bh=eY6e0wMpGr8WqxVTymkObn0TwNs3B7eEMOO73YDRJpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vGIrfmGM//KW49UIJIKAzYcXKnjy3W8cDgfDyF+dkZPhaJ9i9hHvdAWDvyBunf45C
	 JArS7XUdTHZ45WvGdzHfV9ZknInb4hyuV1Acw1ZHbtTUMAmbweL9N4zS9CXc6a8HEG
	 5pEoWVeN0/4+UOg+ugcFCy5aRZN33aWhMWw1iyrQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6A26F805AB; Mon,  9 Sep 2024 19:51:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AF09F805AC;
	Mon,  9 Sep 2024 19:51:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CE7DF801F5; Mon,  9 Sep 2024 19:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30E8EF800E9
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 19:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E8EF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ihnda4iU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E95B5C026F;
	Mon,  9 Sep 2024 17:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A9EC4CECA;
	Mon,  9 Sep 2024 17:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725904287;
	bh=eY6e0wMpGr8WqxVTymkObn0TwNs3B7eEMOO73YDRJpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ihnda4iUVhNCl9YiyDBHWqtVTcj8v9zEcthQzTYSu1iOAYVtm7ZLoCwT7w3PgL/8l
	 3kHvLPIEvkxjk4FlmhC/f+YxFUkgcp7jh4yZKg+qfg84VOo6IRLszjQlAj28XZTgff
	 eyJtpfxLnSBjOmRqq5DAylbRcSOafNOWLMvIxj9h1nYRQ4cOKplip8VPrqWHs8mybr
	 smJEhzbiMaM3ZK6PZ/Kmw9U2G5tVA8AjcabcMFn5MYF8zn9i5SU/YFZ781GRcidoUD
	 Pg8EHTA2fnM4faxpJCirO5s0J4tlLS+8l3STAMpOHFhbpgpwKDLcIFWugYKPFHfeeR
	 Yn6WjEvfWoKvQ==
Message-ID: <7659bae7-93f6-492d-a54f-21abc611c2f2@kernel.org>
Date: Mon, 9 Sep 2024 19:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: microchip,sama7g5-i2smcc: Add
 'sound-name-prefix' property
To: Andrei.Simion@microchip.com, claudiu.beznea@tuxon.dev,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240909083530.14695-1-andrei.simion@microchip.com>
 <20240909083530.14695-3-andrei.simion@microchip.com>
 <2bb15a72-82ef-4bc4-b01e-e4768687bab6@kernel.org>
 <d4b445ec-dc9c-4313-8ef2-e5c086f21449@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <d4b445ec-dc9c-4313-8ef2-e5c086f21449@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AMXCMXC2DS3LELZZ2IJJ4RG27SV3EMRY
X-Message-ID-Hash: AMXCMXC2DS3LELZZ2IJJ4RG27SV3EMRY
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AMXCMXC2DS3LELZZ2IJJ4RG27SV3EMRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/09/2024 14:28, Andrei.Simion@microchip.com wrote:
>>>      minItems: 1
>>>
>>> +  sound-name-prefix:
>>> +    pattern: "^I2SMCC[0-9]$"
>>
>> This does not look correct. Name/prefix can be anything matching real
>> hardware, why are you restricting it? How can you predict all names?
>>
> Based on the datasheet, the SoC(s) have the following naming conventions:
>   - sama7g5: I2SMCC0 and I2SMCC1
>   - sam9x60/sam9x75: I2SMCC
> 
> To accommodate these variations, I propose using a more relaxed pattern: "^I2SMCC(0-9)?$".
> This pattern allows for both the fixed prefix and an optional single digit at the end.
> What are your thoughts on this approach?

I understand this does not differ per board, because it is component of
the SoC, yet still I do not see any value in enforcing name.

> 
> 
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description:
>>> +      Unique prefixes for the sink/source names of the component, ensuring
>>> +      distinct identification among multiple instances.
>>
>> You are duplicating property definitions. This is not needed at all.
>> Maybe your schema misses $ref to common schema.
>>
> 
> I understand the concern about duplicating property definitions.
> In the current file, I have referenced `dai-common` as shown here:
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/sound/microchip%2Csama7g5-i2smcc.yaml#L74C1-L75C27
> 
> Could you please confirm if this reference is correctly implemented,

Yeah, the dai-common $ref is correct, so you should not need it. Do you
see any warning?

> or suggest any adjustments needed to align with the common schema?

I claim nothing has to be done and entire patch is redundant or not much
helpful. Your commit msg did not explain *why* this is needed and what
problem you are fixing, so what I can say? I don't know why should be
aligned because I do not understand the problem being fixed.

Best regards,
Krzysztof

