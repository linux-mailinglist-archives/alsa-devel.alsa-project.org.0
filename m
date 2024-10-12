Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A44E99C4B9
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 11:06:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E14B6A;
	Mon, 14 Oct 2024 11:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E14B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728896811;
	bh=ZuXhQ4f777h3sKcZFs0JJg3Gusula59d9ABR+JTLeno=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dWl7kjuz2lB/9jAIa6gLDASox98k63BH13JWwKgsP4S2+1vfAyKnBL1uDJtyI2Da1
	 phzoR+W0h8NWJ5mMBy9aNSFy9KwJa0IoDIjqFaDNwYUTdanwNIZCUzajD1pupffvsc
	 0FAhyiOX2HnzM4z62sw49Bg+9Ksk1JwaiBQ7i4Zg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 482DBF805CB; Mon, 14 Oct 2024 11:06:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7034F805D9;
	Mon, 14 Oct 2024 11:06:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9B5FF80528; Sat, 12 Oct 2024 23:00:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl
 [IPv6:2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by alsa1.perex.cz (Postfix) with ESMTP id EDAA4F80104
	for <alsa-devel@alsa-project.org>; Sat, 12 Oct 2024 23:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDAA4F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (4096-bit key,
 unprotected) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.a=rsa-sha256
 header.s=key header.b=RrF7TUSD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1728766819; bh=ZuXhQ4f777h3sKcZFs0JJg3Gusula59d9ABR+JTLeno=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=RrF7TUSDzPEGEThYw21Kp5Z3774suwLoKcbOUDePd9KCyB6D6r13ZV8weaFpA8tCT
	 QoUeIK9kMejf6IQsKn8eKc1QQp/VOSrZN8/4ES0dCQ42UC8P5j1jzSJk492M0hvz3J
	 8ja2t7a4nHrT9XfgwjQlmE+YlQZvNDHr3sHNakmFAWs89WOkP0tt/qKw70fRxC7UYY
	 WiYLKCgwHPKb1PL+xjXtPMfTIL3w3F0fhpMzbG4u9jeBXB23Lp4RdPLaziq6cwkUHH
	 WGYXmlTlsAei+XZcjhQKL/qjfir2Pnep72kIrj9qHnyiAlJOaVHarCQqb+fTAd46PC
	 PQ0jpJkfW/vdPAxIAAr7Q/lwAkMC5/d2xvY0Cvqeud8SDzKIC8TIel6FvceO0mMOeE
	 KJNaxfJqux2dj34zdX4HZMYSb8c79kQSysS9m/EF+tbTZtCHA17AETvIB1Rymu2VzS
	 K3MLLIfNj+uUWiYtObrN1zWN57N3tyADX6EyJ6LOB9TppU1zA1bSND28wrskxe/hwG
	 4fvntaxkTmVcmruWM9Yc3SajPU3AxryuxjJMN03D9OacpNPgJ1XCvukkiw7P2PgZIX
	 gD6YX0TmveeNLayAjVf6MONRUHOeyvC4U7EiK7i5LtWsC3+fB+dYVT6yZHCXS7gqou
	 c7VRA8o3ySTb9KCOBfBvtXZI=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 79FE3160917;
	Sat, 12 Oct 2024 23:00:19 +0200 (CEST)
Message-ID: <1328d40c-235d-4449-96c2-1d9b91298e11@ijzerbout.nl>
Date: Sat, 12 Oct 2024 23:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: rt-sdw-common: Common functions for Realtek
 soundwire driver
From: Kees Bakker <kees@ijzerbout.nl>
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>
References: <959e8dcb075948459be4463f6a4ca6ee@realtek.com>
 <a5ad3f88-b4bb-41ad-97c0-1511d205a785@ijzerbout.nl>
Content-Language: en-US
In-Reply-To: <a5ad3f88-b4bb-41ad-97c0-1511d205a785@ijzerbout.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: kees@ijzerbout.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: C7ADWJ44M236BJOMO5D7AGZHBU5EZU6H
X-Message-ID-Hash: C7ADWJ44M236BJOMO5D7AGZHBU5EZU6H
X-Mailman-Approved-At: Mon, 14 Oct 2024 09:05:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7ADWJ44M236BJOMO5D7AGZHBU5EZU6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Op 08-10-2024 om 22:59 schreef Kees Bakker:
> Op 01-10-2024 om 11:16 schreef Jack Yu:
>> This is the first version of common functions for Realtek
>> soundwire codec driver.
>>
>> Signed-off-by: Jack Yu <jack.yu@realtek.com>
>> ---
>>   sound/soc/codecs/Kconfig         |   5 +
>>   sound/soc/codecs/Makefile        |   2 +
>>   sound/soc/codecs/rt-sdw-common.c | 238 +++++++++++++++++++++++++++++++
>>   sound/soc/codecs/rt-sdw-common.h |  66 +++++++++
>>   4 files changed, 311 insertions(+)
>>   create mode 100644 sound/soc/codecs/rt-sdw-common.c
>>   create mode 100644 sound/soc/codecs/rt-sdw-common.h
>>
>> [...]
>> +/**
>> + * rt_sdca_headset_detect - Headset jack type detection.
>> + *
>> + * @map: map for setting.
>> + * @entity_id: SDCA entity ID.
>> + *
>> + * A headset jack type will be returned, a negative errno will
>> + * be returned in error cases.
>> + */
>> +int rt_sdca_headset_detect(struct regmap *map, unsigned int entity_id)
>> +{
>> +    unsigned int det_mode, jack_type;
>> +    int ret;
>> +
>> +    /* get detected_mode */
>> +    ret = regmap_read(map, SDW_SDCA_CTL(SDCA_NUM_JACK_CODEC, entity_id,
>> +            RT_SDCA_CTL_DETECTED_MODE, 0), &det_mode);
>> +
>> +    if (ret < 0)
>> +        goto io_error;
>> +
>> +    switch (det_mode) {
>> +    case 0x00:
>> +        jack_type = 0;
>> +        break;
>> +    case 0x03:
>> +        jack_type = SND_JACK_HEADPHONE;
>> +        break;
>> +    case 0x05:
>> +        jack_type = SND_JACK_HEADSET;
>> +        break;
> There is no default case. So, variable jack_type can remain 
> uninitialized and then used for the return value.
> Perhaps you can combine "case 0x00" with "default".
>> +    }
>> +
>> +    /* write selected_mode */
>> +    if (det_mode) {
>> +        ret = regmap_write(map, SDW_SDCA_CTL(SDCA_NUM_JACK_CODEC, 
>> entity_id,
>> +                RT_SDCA_CTL_SELECTED_MODE, 0), det_mode);
>> +        if (ret < 0)
>> +            goto io_error;
>> +    }
>> +
>> +    return jack_type;
>>
Please have a look at my comment again.
If regmap_read returns a `det_mode` not 0, 3 or 5 then the function will 
return jack_type
with an uninitialzed value.
-- 
Kees
