Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243BA99A004
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 11:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 673ECE0D;
	Fri, 11 Oct 2024 11:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 673ECE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728638433;
	bh=kIZSPXIViT8Q1YSTyt9uTHzlepL1QZQ8BHPfSoJyusc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rB3+qyh7KLrag/eSArVMPl2y1CgMbxhj7gzK5RvP7U4BgoQ26AQUHzVg+1hoi5uoK
	 m6zHBXNtzXbXEZotEYSDdCcjDWgUqNtfGYEAo2BhEeoGlHGWZ2ejlULDxSJm0UvIeH
	 VY//ONwck0YTLjUR8tZc9w3dsbSi1eKo4Cn6hhO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98BBDF805F9; Fri, 11 Oct 2024 11:19:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93FE7F805FB;
	Fri, 11 Oct 2024 11:19:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4445EF80528; Tue,  8 Oct 2024 22:43:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl
 [IPv6:2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by alsa1.perex.cz (Postfix) with ESMTP id A2967F800ED
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 22:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2967F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (4096-bit key,
 unprotected) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.a=rsa-sha256
 header.s=key header.b=DndsoKrO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1728420190; bh=kIZSPXIViT8Q1YSTyt9uTHzlepL1QZQ8BHPfSoJyusc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DndsoKrO2v8ZKJI2SpUdfW8XmYupSLn4f//RtObgbZnReVHJBZOxX+Bp8IP7WK9Rc
	 riae0OxGFo54mzfr3l2ydx3IqHACftZMJ8CdXApVaAoWsUQBgIam8IIIN7vTmHW+Xf
	 2YkONhSOgZkJhA9ItDPZolerPlFds58xAnYHOZ+JZrHCZ6WUcwASBqt8nuIfq0Eqk2
	 RmtPSSSwxC+Yi22qzk51veSK4ayNeK3Av9rLGBe1TLKUYtP/8c6GUywIPQBfPYTmA9
	 rnYKRmok9kMR82ztA1UL6CggBpVQdcoYZnPqZ4HH4C6AopeUP02JSCaXhh/ZdAmlV4
	 PKWiDIuQ3no5MVhJM0r3z98LX3rno/9+hRhdaWm9msZQQTgeTzwBtsyEHM9OSn9akf
	 0EBFE2QJZp9Q+/2vDFL5aIMg4VzHhUdTqCVp5b+vHlIX+MB3Spc2Ct65uMt91e85RP
	 zH1JVnn+qrgvn5F500wbWqKgHAou2akQ2vIQig5S0qVcDlEIqpKS/KhmdUGrq7UNno
	 2QWp4QhSeO2LPeJJXGOcIH6s1wFekBotZnDm93/VVeDwU7p7wQD6dgYJiwKpfhu44w
	 SpcUT7KnmYGivOFaEbnhMAwdhFHYjMnaKKAQDlrfbM0sPGyhA9L4fZC3AdZGovuD7U
	 rj9Tp3CpijUeEH/iXVwvTxpo=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id EAA2D18D98D;
	Tue,  8 Oct 2024 22:43:09 +0200 (CEST)
Message-ID: <7d73b0dc-48a5-4a50-b7fa-8fb0d5689e2d@ijzerbout.nl>
Date: Tue, 8 Oct 2024 22:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: rt-sdw-common: Common functions for Realtek
 soundwire driver
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
 <derek.fang@realtek.com>
References: <959e8dcb075948459be4463f6a4ca6ee@realtek.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <959e8dcb075948459be4463f6a4ca6ee@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: kees@ijzerbout.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4TDXGFLMBDQEJ43P2XE554UWSWKHYXUC
X-Message-ID-Hash: 4TDXGFLMBDQEJ43P2XE554UWSWKHYXUC
X-Mailman-Approved-At: Fri, 11 Oct 2024 09:19:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TDXGFLMBDQEJ43P2XE554UWSWKHYXUC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Op 01-10-2024 om 11:16 schreef Jack Yu:
> This is the first version of common functions for Realtek
> soundwire codec driver.
>
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
> ---
>   sound/soc/codecs/Kconfig         |   5 +
>   sound/soc/codecs/Makefile        |   2 +
>   sound/soc/codecs/rt-sdw-common.c | 238 +++++++++++++++++++++++++++++++
>   sound/soc/codecs/rt-sdw-common.h |  66 +++++++++
>   4 files changed, 311 insertions(+)
>   create mode 100644 sound/soc/codecs/rt-sdw-common.c
>   create mode 100644 sound/soc/codecs/rt-sdw-common.h
>
> [...]
> +/**
> + * rt_sdca_btn_type - Decision of button type.
> + *
> + * @buffer: UMP message buffer.
> + *
> + * A button type will be returned regarding to buffer,
> + * it returns zero if buffer cannot be recognized.
> + */
> +int rt_sdca_btn_type(unsigned char *buffer)
> +{
> +	u8 btn_type = 0;
> +	int ret;
No initializer ?? You probably want to set it to zero here.
> +
> +	btn_type |= buffer[0] & 0xf;
> +	btn_type |= (buffer[0] >> 4) & 0xf;
> +	btn_type |= buffer[1] & 0xf;
> +	btn_type |= (buffer[1] >> 4) & 0xf;
> +
> +	if (btn_type & BIT(0))
Variable "ret" is not initialized yet.
> +		ret |= SND_JACK_BTN_2;
> +	if (btn_type & BIT(1))
> +		ret |= SND_JACK_BTN_3;
> +	if (btn_type & BIT(2))
> +		ret |= SND_JACK_BTN_0;
> +	if (btn_type & BIT(3))
> +		ret |= SND_JACK_BTN_1;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(rt_sdca_btn_type);
>
