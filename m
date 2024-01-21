Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19289835759
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 20:30:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA431F8;
	Sun, 21 Jan 2024 20:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA431F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705865443;
	bh=lzn/PJQVopxFhMAd/XJ5/RhSi1AeJbr0ckRsdkk0gI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QOgKcXb+rRWE44zY+jTcKu+qUp5+OcQTh9EhQH4/UrOWOW5Nv6cvNGWywYpniJ72z
	 NoP2ZQ/3eg0POwT7iKdsbHVRgSByccXMteYyXQvJRvXnrMdzikUQj0/zH+i4+0FRIW
	 Quyqk13ixNeOX/xvXTbtYnR1jh+lUvjWWi2RqjtM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 244C7F802BE; Sun, 21 Jan 2024 20:30:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3663F80563;
	Sun, 21 Jan 2024 20:30:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4383F8025F; Sun, 21 Jan 2024 20:30:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2675F800C1
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 20:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2675F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gW0DDfbP
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6e0a64d9449so1657355a34.2
        for <alsa-devel@alsa-project.org>;
 Sun, 21 Jan 2024 11:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705865392; x=1706470192;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/71KA+Z9avWu2cHYxMou4LBKNLAgsGE7jAm0VTGz0X8=;
        b=gW0DDfbP+/DWMzqCQ8BUmdce82YtfAB7D9y+JainZSKeynhsoQvpV7g6rpHWsd6tmm
         DhdcRcrY532k3/YxZaLoChjw3Twu0RE3MXMZ86gM07ecZQVa25gXHjEFYvesny3zQvP7
         1kwtSvIc/TeQ5jCIQKqjrlTk6wU4j+r8veYAX0IwhVjfhX7qbbji5AZ/JJVr+jP5KUUP
         d5OM3DsDZHRqIHuwtcTQIaCoROgn0kuS0GE80vU710MW3B8W7dHOB0ULgXoPiiBCt8FK
         iml9WXNPt/B6yhX2TVxFU9oABw9l78Loi1Y1hN8OR9VX7nHAUTFaWTmcOsBADxMKengZ
         Pcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705865392; x=1706470192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/71KA+Z9avWu2cHYxMou4LBKNLAgsGE7jAm0VTGz0X8=;
        b=AsiRbJ+yrm8BXv4HbvqcN4TUjH9gMKA2wfeX6aZMydsgeiDT266rgi+d9HPosMCOd/
         dLkDHkr9Ei03KUp+iHr5BlmGyFn/4KuKTpS6GNkytpGYi+c7XSNJDgZ8Cud34tUpDF66
         v7U0x5hYaYeez5D4ekKaeI98RKuybwllULc1Sr4a1L0S1cOxiXvZnLxtIrcqy4vnHTsH
         ZQfJbSjF94Tpu7inLgtLOURH5IAKlrqI0y0hptYAOtYZiGlsp6u7mKAurGrRkZUYN3/k
         kYhxE07vBjO7uVphxp+z2+cgs5ml3aDtdrTbEioCeoMMygJdr2LfA7pE29+ED38aq5kJ
         ujXQ==
X-Gm-Message-State: AOJu0YwNMAWPOS6CX7j7A/Wm9Rkm1UwQxslly6wG8x2YSmUQc3JENuqs
	jRig9cdAQ7Ck5flPPHoAgF7AfQFm31jEVWf00HYqgzRTLoWpncdf
X-Google-Smtp-Source: 
 AGHT+IGO0o0J2pAGLhCcX8eCUB4fj3TbCSnOczGo5AbTS9+T9WsIXxEt3XnhQmBNtlHxygiWGN/8Xg==
X-Received: by 2002:a9d:480b:0:b0:6dc:813:6c3f with SMTP id
 c11-20020a9d480b000000b006dc08136c3fmr4133438otf.38.1705865392022;
        Sun, 21 Jan 2024 11:29:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 r28-20020a635d1c000000b005c67a388836sm6901617pgb.62.2024.01.21.11.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 11:29:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ed1de0d4-9a88-47b1-a280-b872f6fdecb6@roeck-us.net>
Date: Sun, 21 Jan 2024 11:29:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Mark Brown <broonie@kernel.org>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sbinding@opensource.cirrus.com,
 lee@kernel.org, james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
 <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
 <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
 <9806d99fab46c928f337b30b21057b3e@walle.cc>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <9806d99fab46c928f337b30b21057b3e@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BF65EZGMMZYAXFFSSB3GO63O7FSXGVLI
X-Message-ID-Hash: BF65EZGMMZYAXFFSSB3GO63O7FSXGVLI
X-MailFrom: groeck7@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BF65EZGMMZYAXFFSSB3GO63O7FSXGVLI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 1/21/24 10:06, Michael Walle wrote:
>>>> FWIW, the problem is due to
>>>
>>>> +#define SPI_CS_CNT_MAX 4
>>>
>>>> in the offending patch, but apeed2400 FMC supports up to 5 SPI chip selects.
>>>>
>>>>   static const struct aspeed_spi_data ast2400_fmc_data = {
>>>>          .max_cs        = 5,
>>>>     ^^^^^^^^^^^^^^^^^^^
>>>>          .hastype       = true,
>>>
>>>> Limiting .max_cs to 4 or increasing SPI_CS_CNT_MAX to 5 fixes the problem,
>>>> though of course I don't know if increasing SPI_CS_CNT_MAX has other side
>>>> effects.
>>>
>>> Yeah, I was coming to a similar conclusion myself - the limit is just
>>> too low.  I can't see any problem with increasing it.
>>
>> It would cost a bit of memory and somewhat affect performance sine many
>> of the newly introduced loops are bound by SPI_CS_CNT_MAX and not by
>> num_chipselect.
>>
>> It also might make sense to document the new limit somewhere. Prior
>> to this commit it was not limited at all.
>> Documentation/devicetree/bindings/spi/spi-davinci.txt lists 5 chip
>> selects in its example for the use of cs-gpios.
>> Documentation/devicetree/bindings/spi/spi-controller.yaml also does not
>> list a limit.
> 
> Given that, that the rest of this series is under discussion (and esp. whether
> it is the correct way to do it) it might make sense to just revert the picked
> patches.
> 

I can't really comment on that, but I found that there is another
affected devicetree property: num-cs. Its range isn't limited in
Documentation/devicetree/bindings/spi/spi-controller.yaml. Various
dts/dtsi files use numbers as large as 8. The range is limited in some
bindings files, but not all of them.
Documentation/devicetree/bindings/spi/spi-lantiq-ssc.txt, for example,
says

   "num-cs: see spi-bus.txt, set to 8 if unset"

Various Broadcom dtsi files set it to 8.

So I guess 8 would be the absolute minimum to re-enable support for
affected systems.

Guenter

