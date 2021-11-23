Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5109459E2E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:34:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8016F1699;
	Tue, 23 Nov 2021 09:33:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8016F1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656477;
	bh=74a1yw3Wfml6huxJ8bOUi/m1NZ8B9nzqL05RSjvCY6I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vfu5kBBEMXaB/Z+K2G1aqDXnuH1ZFEH/Bj4wa/yERhGLn0RxAZwZqPhduBozazufz
	 BtVK5GbMMsrP2T2HsgpZ+oS/QVw4OgU+57cuJsMDVYbBci5QtIGL9UK5cMNEpIr2jl
	 w0Z2VZxL4S0IhLm9paKk171MJGl4du6Da79eK3ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 128BFF80601;
	Tue, 23 Nov 2021 09:22:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81F1CF80212; Tue, 23 Nov 2021 02:52:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E32FF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 02:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E32FF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org
 header.b="EMJHfp61"
Received: by mail-io1-xd36.google.com with SMTP id k21so25916592ioh.4
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 17:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7Oi7YYe6mXZ9qFhiItC3cT+zBCj+1FGQIOXFSu9z5Og=;
 b=EMJHfp61byAPVM0d+YSPglX9cQhq+7ayPyr9zRTzuSPcvvgnxyLMG1ltK8vjfaD0FU
 tlPYxbO7NtBZeDgMPNcJJoHVx+Je8+bWQnN+DVWW1NrLrqmC5gQjAph9/LWH4uiuxcYY
 wd41pmLNfefVdVvVpoPO9twaon39sVO4IspOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Oi7YYe6mXZ9qFhiItC3cT+zBCj+1FGQIOXFSu9z5Og=;
 b=pu1cfTjaZ3VhlnP7OJWPlKQNriPclrytbift8GdkktS4ZLvnXpNN6ieRTlEu9yJ6yg
 C+r/YQQ8pikE/5igjaSh4K8ar++FNFk5h8dqbTSqZlI9EalW44zJo3uBQDxI9fAn5FMB
 PCWvMNjDeJ3A1mmn0LZ7OidzBMt3GUNxTsPxbYW2vEBXnkbeAM7tekdATuoz7rb/ukoE
 Ci9WR9V7cvQuxL4AyCEEpf7iuKUKx8yFjNUEtNO6dZNS95yMeC6JOfUHdHNuH8EW3klx
 VXzA3OxyfjY9wtSchLdtpo9VEESsSrMmw4kuPY8FQ3BYSDrTKVZYMGiNK1ntY3u0YVvm
 ekIA==
X-Gm-Message-State: AOAM533BFn8tSH0wtkHknhnQOTnVc35X6zMY+kJ3JwubPcBuF/+BkxbZ
 s6EmAs6nPsB8QHyBkV2/66i6FA==
X-Google-Smtp-Source: ABdhPJwFYEXqq9O3YpMuHp49czIlbhiXDJHljcLoM+vErOaDm/O2cJ+JlOI+DmxoJkJ4K5f7Ve5+nA==
X-Received: by 2002:a05:6638:14ca:: with SMTP id
 l10mr1120728jak.107.1637632367373; 
 Mon, 22 Nov 2021 17:52:47 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id d137sm6102931iof.16.2021.11.22.17.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 17:52:47 -0800 (PST)
Message-ID: <5936f811-fa48-33e9-2a1a-66c68f74aa5e@ieee.org>
Date: Mon, 22 Nov 2021 19:52:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rajendra Nayak <rnayak@codeaurora.org>, Paul Walmsley <paul@pwsan.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tero Kristo <kristo@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Eduardo Valentin <edubezval@gmail.com>,
 Keerthy <j-keerthy@ti.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:58 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11/22/21 10:32 AM, Johannes Berg wrote:
> On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
>> The existing FIELD_{GET,PREP}() macros are limited to compile-time
>> constants.  However, it is very common to prepare or extract bitfield
>> elements where the bitfield mask is not a compile-time constant.
>>
> 
> I'm not sure it's really a good idea to add a third API here?
> 
> We have the upper-case (constant) versions, and already
> {u32,...}_get_bits()/etc.

I've used these a lot (and personally prefer the lower-case ones).

Your new macros don't do anything to ensure the field mask is
of the right form, which is basically:  (2 ^ width - 1) << shift

I really like the property that the field mask must be constant.

That being said, I've had to use some strange coding patterns
in order to adhere to the "const only" rule in a few cases.
So if you can come up with a satisfactory naming scheme I'm
all for it.

					-Alex



> Also, you're using __ffs(), which doesn't work for 64-bit on 32-bit
> architectures (afaict), so that seems a bit awkward.
> 
> Maybe we can make {u32,...}_get_bits() be doing compile-time only checks
> if it is indeed a constant? The __field_overflow() usage is already only
> done if __builtin_constant_p(v), so I guess we can do the same with
> __bad_mask()?
> 
> johannes
> 

