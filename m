Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B686459E26
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F86316FB;
	Tue, 23 Nov 2021 09:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F86316FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656419;
	bh=ztIIYU3zzXT+BNVkVntbs7tP28S0TalcmnSmCNdo0gU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r1UCvJ+sR5v8ZT0y4YVusJN0SA/hpheS8GJbv63GGP22NVx804dpFBng3/SGD8qUi
	 pJR+wJTiN3+dXWhG/Vj+gKRZZK8jgbF/b2lMJA8MumV3c2TQwPP9kkcd1Bnt17RFVo
	 jeqrGs1xk+Gz90FqaqtvA0op32c0526cAUABAiFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F679F804E7;
	Tue, 23 Nov 2021 09:22:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A04D6F80212; Mon, 22 Nov 2021 19:38:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 366C1F800E7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 19:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 366C1F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iF32sjGr"
Received: by mail-ot1-x32c.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso30164557otr.2
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 10:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UHFB4okDolhXrN2KtXNKGXY4xx9A6ENlJZJpcpYJSa4=;
 b=iF32sjGrzSvaDDiDrzm4Jn8+gNbGxPrbBxZFxi4uCknK7CkuUHGcqoOD65h4RyWxyF
 y+wOmbGDPKkCG8jIqPGxKaFK0D3GvGCi7E7vj/rSSTElZKQ4I+sO6sAsXlhvWm4LJdnp
 2KvDVCusXICAOU/8p8E70quXduhRoLziMS5wtCLJdF0xE54KuxD1Hx/LXZJoPAM3DNL1
 BkvRF4pmS6od3lYRUbwlZMx97PcjFnI9HdmkEczPsl3ta8bzsAye+LybTN6gfUn7gNW8
 MLS92ARh+GguAjdL9uq+LetI8B96GaD9Vc3Ip4BN7Uy3BSXQIu3jgX7O1p5U0Obaav48
 V51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UHFB4okDolhXrN2KtXNKGXY4xx9A6ENlJZJpcpYJSa4=;
 b=rYnXS9h8VqbgGGHTY3LpaZKUm/yvooEdx2ac90ZZSosOG82XdnilVST/ypieWFotxa
 dahYPqWtkyf4vjtPfcJylv43SLkbUTnIaa7ZbXWvo++xaCsAs9w3zHY/nXSkf/Bz4yLY
 vsGi24Ge2w070uZY6pf0Cz98cBMZV7MrxfYFpGRCXU/2wKoe7NLPB392/m/XqCY03MYI
 JzPq/JUWfRtK9KesPCD9VNcR5/YuJ91izIIevJhjfxF9uMKVRFgY4DGELFeci+94E4/+
 8gMz33cg7MCGSjvorkKjcoK7sdWAJo9BAArsiVVL3LbYGn2SYMfIvOEMedUS2VYcHf8P
 pVWw==
X-Gm-Message-State: AOAM531FIXq1sKNWH4Z5uKiaeXhilaVdzrYYnbyoQLt9INPId9QzpLqN
 xPFlqqnQDfsqB+8SYkM9SpM=
X-Google-Smtp-Source: ABdhPJwfr5gWpFAYZtUOP0l+WeTUOCLuMHjoxvBl19lgRYsYRNjGQbRkBWj0P0bUDebnG/bzTCmu0Q==
X-Received: by 2002:a9d:5190:: with SMTP id y16mr27309322otg.364.1637606329228; 
 Mon, 22 Nov 2021 10:38:49 -0800 (PST)
Received: from [10.62.118.101] (cpe-24-31-246-181.kc.res.rr.com.
 [24.31.246.181])
 by smtp.gmail.com with ESMTPSA id f18sm1729016otl.28.2021.11.22.10.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 10:38:48 -0800 (PST)
Message-ID: <a18f44bf-e590-0ebe-00c0-5658f3a51d86@lwfinger.net>
Date: Mon, 22 Nov 2021 12:38:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH/RFC 17/17] rtw89: Use bitfield helpers
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
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
 <f7b81122f7596fa004188bfae68f25a68c2d2392.1637592133.git.geert+renesas@glider.be>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <f7b81122f7596fa004188bfae68f25a68c2d2392.1637592133.git.geert+renesas@glider.be>
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

On 11/22/21 09:54, Geert Uytterhoeven wrote:
> Use the field_{get,prep}() helpers, instead of open-coding the same
> operations.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> Marked RFC, as this depends on [PATCH 01/17], but follows a different
> path to upstream.
> ---
>   drivers/net/wireless/realtek/rtw89/core.h | 38 ++++-------------------
>   1 file changed, 6 insertions(+), 32 deletions(-)

Tested-by: Larry Finger <Larry,Finger@lwfinger.net>

Larry

> 
> diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
> index c2885e4dd882f045..f9c0300ec373aaf2 100644
> --- a/drivers/net/wireless/realtek/rtw89/core.h
> +++ b/drivers/net/wireless/realtek/rtw89/core.h
> @@ -2994,81 +2994,55 @@ rtw89_write32_clr(struct rtw89_dev *rtwdev, u32 addr, u32 bit)
>   static inline u32
>   rtw89_read32_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask)
>   {
> -	u32 shift = __ffs(mask);
> -	u32 orig;
> -	u32 ret;
> -
> -	orig = rtw89_read32(rtwdev, addr);
> -	ret = (orig & mask) >> shift;
> -
> -	return ret;
> +	return field_get(mask, rtw89_read32(rtwdev, addr));
>   }
>   
>   static inline u16
>   rtw89_read16_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask)
>   {
> -	u32 shift = __ffs(mask);
> -	u32 orig;
> -	u32 ret;
> -
> -	orig = rtw89_read16(rtwdev, addr);
> -	ret = (orig & mask) >> shift;
> -
> -	return ret;
> +	return field_get(mask, rtw89_read16(rtwdev, addr));
>   }
>   
>   static inline u8
>   rtw89_read8_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask)
>   {
> -	u32 shift = __ffs(mask);
> -	u32 orig;
> -	u32 ret;
> -
> -	orig = rtw89_read8(rtwdev, addr);
> -	ret = (orig & mask) >> shift;
> -
> -	return ret;
> +	return field_get(mask, rtw89_read8(rtwdev, addr));
>   }
>   
>   static inline void
>   rtw89_write32_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask, u32 data)
>   {
> -	u32 shift = __ffs(mask);
>   	u32 orig;
>   	u32 set;
>   
>   	WARN(addr & 0x3, "should be 4-byte aligned, addr = 0x%08x\n", addr);
>   
>   	orig = rtw89_read32(rtwdev, addr);
> -	set = (orig & ~mask) | ((data << shift) & mask);
> +	set = (orig & ~mask) | field_prep(mask, data);
>   	rtw89_write32(rtwdev, addr, set);
>   }
>   
>   static inline void
>   rtw89_write16_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask, u16 data)
>   {
> -	u32 shift;
>   	u16 orig, set;
>   
>   	mask &= 0xffff;
> -	shift = __ffs(mask);
>   
>   	orig = rtw89_read16(rtwdev, addr);
> -	set = (orig & ~mask) | ((data << shift) & mask);
> +	set = (orig & ~mask) | field_prep(mask, data);
>   	rtw89_write16(rtwdev, addr, set);
>   }
>   
>   static inline void
>   rtw89_write8_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask, u8 data)
>   {
> -	u32 shift;
>   	u8 orig, set;
>   
>   	mask &= 0xff;
> -	shift = __ffs(mask);
>   
>   	orig = rtw89_read8(rtwdev, addr);
> -	set = (orig & ~mask) | ((data << shift) & mask);
> +	set = (orig & ~mask) | field_prep(mask, data);
>   	rtw89_write8(rtwdev, addr, set);
>   }
>   
> 

