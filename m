Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207675C24B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABBC5E7F;
	Fri, 21 Jul 2023 10:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABBC5E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929944;
	bh=XZtvmENofUvIZcnMGQcfnj1cvin4Pz33/qNIhAG8UiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HZq5V2KDsPEXmKkbAUnuV9qefWQXqopf4JRhifkN1syhK44uDUekjjXktwsqRp1RV
	 7GLkMayY7DuGiJXoxtStVrkKToeEdZo/3kXYIhAxNu7vF7NVmz7f858wo5ukzd+reL
	 veYEwQ/b/o9Iz2lxwvsGJwBUIBc0O6GAKorOpWoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBDB6F80636; Fri, 21 Jul 2023 10:54:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 326D7F80637;
	Fri, 21 Jul 2023 10:54:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B06B2F8047D; Thu, 20 Jul 2023 19:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32C3EF80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 19:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32C3EF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=MK+qmNNO
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-666edfc50deso756145b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jul 2023 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689873435; x=1690478235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0uAt1FpVvgdk69DWGVo/B/WilumnjHo3ckls2wQj2c=;
        b=MK+qmNNORXwB0I5M1ECJrML+kKdViRer5kBwEH13jqFqWPrvH9qpVwD+NCq/1d018c
         dmHLfc1tu6kO/ikoIBoIR1krTQBsGZ3+q9u5v3XSZyYbOkyC67YXvHVlcxgsQWsqZgtm
         4SH2TD93EzA0VP1rFamx/Cxpixhc1xvinZAjcekhOe3ngbMxphygvDdsOviDfTtnsbmZ
         umZ7UPenNo+uzSz1TkMIjeWQt9QLKY1ACnKSlpgNnzP7MRX/LNX+PoEOdVdbQQ+Lidiy
         cOGFq119CJN/FS7RftR/9pmwUsBDbw0jIdcDb2SJf2KjVezldwj7jUFTSW8pAI6VW6KZ
         ONLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689873435; x=1690478235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0uAt1FpVvgdk69DWGVo/B/WilumnjHo3ckls2wQj2c=;
        b=dHP8XWgCVr2bmfVUcN2va+4X0TWuzrK+KR6wLTJXcwBvq4JjqLxPFYWOvPwkQxAjre
         7S2KhQ7HN3/vCzIh9dOZfUPBjsQ2cha7UvACRWwD/TuCAtccvihplPmXvv7VnHhibUvG
         z77xOzLyuKGK62576zWYexq7fSarfGJPRiegN/lFB/rsOwp5ujpzozv5h/H9kVDfQ7Pa
         EtxguG6q3U5XFT3NR4xvljvbbr8q5QnBP3BUq+x8OALnr9GqexgBl4ZjIk/HQtF3aDOf
         S6fwX0OlVhq7/2PLLvktzONkrWPTJ+rT0M0oDjlKvBLs+eNQQAgUsuN+k59a8wJhJX90
         s0dg==
X-Gm-Message-State: ABy/qLZwlQoDf4VH4R8HJC+X67SQT5Dif3S3lPBa1GZpdETw5N7S6/YZ
	lP+W35pvp8VINmCDRnUHys8=
X-Google-Smtp-Source: 
 APBJJlEkTI4A4ZrOCc+WXlC2nBipWy2JSRmd1c5HMwU8MruA6yjpC2qz2tfZemAEl4HUzSYjKYO5qQ==
X-Received: by 2002:a05:6a00:24d1:b0:668:8ad5:778f with SMTP id
 d17-20020a056a0024d100b006688ad5778fmr10559001pfv.17.1689873434754;
        Thu, 20 Jul 2023 10:17:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e754:74d1:c368:67a2])
        by smtp.gmail.com with ESMTPSA id
 h18-20020a62b412000000b00682a75a50e3sm1502944pfn.17.2023.07.20.10.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 10:17:14 -0700 (PDT)
Date: Thu, 20 Jul 2023 10:17:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 28/42] input: keypad: ep93xx: add DT support for
 Cirrus EP93xx
Message-ID: <ZLlsFTe2nvFw698l@google.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-28-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-28-3d63a5f1103e@maquefel.me>
X-MailFrom: dmitry.torokhov@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: ZV3XXFULC5G3GUP5UULUCOWSTECKT7V2
X-Message-ID-Hash: ZV3XXFULC5G3GUP5UULUCOWSTECKT7V2
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZV3XXFULC5G3GUP5UULUCOWSTECKT7V2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 20, 2023 at 02:29:28PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> - drop flags, they were not used anyway
> - add OF ID match table
> - process "autorepeat", "debounce-delay-ms", prescale from device tree
> - drop platform data usage and it's header
> - keymap goes from device tree now on
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

This is awesome, thank you!

>  
>  #include <linux/bits.h>
>  #include <linux/module.h>
> +#include <linux/of.h>

Are you sure you need this? I think the only OF-specific structure that
is being used is of_device_id, which comes from mod_devicetable.h that
you include below.

Otherwise:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry
