Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C597B68BE63
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E939832;
	Mon,  6 Feb 2023 14:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E939832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690641;
	bh=nLaN6niuDgmuORXdhUtclIEwbrHGlwBcGootV3J3l2s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kfxS585LGJUKBQYlM8l4x4YyAaSswHaPnSBMtXT4jfgUQ3lQYJyWIGG973O/S7H5/
	 2LRZ1Rl8DSzO5AD8aT9T4oqORJgclQ/Gy3Gt8Ih1HgRxdS0FnfNWFsiEbiZOlMuru7
	 6UVN4Ki50QQ7DalmIBjIlm1zF9ke2axMVpkzxu84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44E71F80551;
	Mon,  6 Feb 2023 14:35:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D8EF8032B; Fri,  3 Feb 2023 13:30:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00632F80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 13:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00632F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PC6jnhpr
Received: by mail-wm1-x32b.google.com with SMTP id o36so3759533wms.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 04:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oliUtLWESo3lQu6iHKqwx+2QOwN2sNCjDu921E6eImU=;
 b=PC6jnhprbBOYA5gQ8hht4uhJybrq7/0C64ACU2Gt9qfbW1pk9VfapwtzsEQiHMXbWG
 1JppW/crId+0Ce/5NY+vbYD8aQrWah3VOr/cgyiKfrz+CsV1xjGADT9tWMUyPppehNBX
 SC0wy/PcQSuekQwM7g/y6t2SL8B/Gkosz5mtmibN43bNv0b1mD4tCXB0banPcItFJwfc
 i54CE0XoHTzA+jAmoTtBHleO+mnp2xAR7FyjhdHzEDNwwY9TdNXm+ghb8j6ArobpiwRR
 9hn30hxFYj4ol+bMYzOz9KNKlsouP5G6WIVr/nA+qavbwuBMicrP2QKe1d5rCLF7jiXP
 ViLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oliUtLWESo3lQu6iHKqwx+2QOwN2sNCjDu921E6eImU=;
 b=qFbVuvna5XaK0cw/zNkdqxFiObO2DXVwadNECNNQTWduxn5x9lK04jHawPBV4LtP06
 v+nGCIE/xMMBj3eQeOFQHfFP01PR1vwbw4S0y3YSsMXgfgjQHpaZZl9q5gp2vVToG0OG
 9VEAAQXSszGj/cNWZx3/pfZf3I6LGz7wOTzH0hI1WrqCBWhUtogeE0vdJe60SwM9dzTl
 zsLDVvcp4JBdzbwJrqURF0O1NuuF2Gz2Z9tYyCis+072BdxJmx/xR33n9knj04wgFm6h
 s4YKIbEL6OtkpAK/OCFTkq4QjzThqb6KXhtVaA00TWz9ndVV/jwnGOSAXYM4MK+ipK3E
 7NZg==
X-Gm-Message-State: AO0yUKVOTWo4ID7sIjnHXGBVQFbBuIhbhs8PSP0ANRQOGXlKF0jZ6Ap7
 t4x+wLicjzNikt2nT2A8DhzrKg==
X-Google-Smtp-Source: AK7set8hvfzN5yvSx0vn3SHDYBE0Cu37jFl12DeSADMr5lTBdrNCrV6wJaZ+esFXBrp8t+sFKTfd2w==
X-Received: by 2002:a05:600c:4395:b0:3df:9858:c02c with SMTP id
 e21-20020a05600c439500b003df9858c02cmr4411370wmn.1.1675427409090; 
 Fri, 03 Feb 2023 04:30:09 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a05600c2cbb00b003db12112fcfsm2871505wmc.4.2023.02.03.04.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 04:30:08 -0800 (PST)
Message-ID: <e50fe7d3-0c73-d4af-9a61-74d1279202cc@linaro.org>
Date: Fri, 3 Feb 2023 12:30:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] tree-wide: trivial: s/ a SPI/ an SPI/
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230203101624.474611-1-tudor.ambarus@linaro.org>
 <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
 <Y9z0bQ8TeFROA0Fj@sirena.org.uk>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Y9z0bQ8TeFROA0Fj@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 06 Feb 2023 14:35:03 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 trivial@kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2/3/23 11:47, Mark Brown wrote:
> On Fri, Feb 03, 2023 at 11:28:03AM +0100, Geert Uytterhoeven wrote:
>> On Fri, Feb 3, 2023 at 11:17 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>>> The deciding factor for when a/an should be used is the sound
>>> that begins the word which follows these indefinite articles,
>>> rather than the letter which does. Use "an SPI" (SPI begins
>>> with the consonant letter S, but the S is pronounced with its
>>> letter name, "es.").
> 
>> While I agree with your pronunciation, I believe the SPI maintainer
>> (which you forgot to CC) pronounces it in James Bond-style, i.e. rhymes
>> with "spy" ;-)
> 
> Yes, I do.  To the best of my knowledge most people just say "spy"
> rather than pronouncing the letters or anything.
> 
> In any case as I said in reply to one of the individual patches English
> isn't regular enough to go with hard and fast rules on anything, and the
> letter rule is much more commonly used where something is needed.  Using
> an here looks wrong to me, and the fact that a is so widely used does
> suggest that usage has escaped whatever rule there is.

Indeed:
$ git grep " a SPI" | wc -l
131
$ git grep " an SPI" | wc -l
88

Ok, let's drop this patch.

Cheers,
ta
