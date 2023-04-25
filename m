Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE76F2EC6
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:41:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC81D1767;
	Mon,  1 May 2023 08:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC81D1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923312;
	bh=sHHGirqRgROqc/ELCgMIx6RfVhO0g7cqy0E2rYbU/Eg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XaM/1AqJZv2etGJeVMCewejX9Wbc+W24kAHx69x8R2sTnRaVQPxk/Mfkr9t5Of1Vf
	 Ou+kVJhCmv4caJJUnIkMVpJH8zejnEs1ZAFsgWQ/VtVuWsxwAHP6fahssSruE640nx
	 4YccXYkRwsi7n+IyAuM+go3Xw8bJdDjCBpfTNFvo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFF30F8051B;
	Mon,  1 May 2023 08:40:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98CA2F80236; Tue, 25 Apr 2023 11:20:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADC4DF800F8
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 11:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC4DF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wOvkX2oC
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-958bb7731a9so558863566b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Apr 2023 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682414449; x=1685006449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsdCNQzIoPz+lH63xj1YaKKNKo3iDm5pfw23qiYoBOQ=;
        b=wOvkX2oC5ZHyFMdylx8IkrryNZeg23DU/Ch9AChLKbcB/sx0DFV8Yb/H7vUSsHm/ay
         6vKeAhZHqi4KvKzBL9RsojhjUK4oU8lb+V+mupjRsr3d4Ozv9ezhvySx+DHEhqR+hjMA
         gaiJOqLYT51c8eBo6o+cG8x82KOH/6WDLxVffZqZup0JrvMaRV4XDFiPQxHmTy81GMpM
         QIfjcv/pPcyMi1TiLUVU+h31xU2FfOzqmTSR6PnZ45uP7vvaFC3j0EA3bBbvXBOdzaR3
         fHRbyuMSy1Dp046zUXSSm/0Gjosdxp/aEC/NPYM4X7lNjpFDITb7o57bkR9W209v9XtR
         w4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682414449; x=1685006449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WsdCNQzIoPz+lH63xj1YaKKNKo3iDm5pfw23qiYoBOQ=;
        b=VJE0UxDwOZ8lvetECJFK3en9TTtCJHl7PlEHtNsmBMM+umfhLp4rPRxupUtLWcRpy5
         oeh0xIuOrrMwdX0IwoZ4Tu4b1YegPOBXjExmrdPdN1TDhJS+QbWfcz68pgzrB8orFCyT
         du4jlvizcmWK1oMPxIzuuiD6yS95bqfM05V0fUbM66KlZ7ScE9kkZl37TmnuDFe97wrz
         X9Jsd/g0yxroMifpYqvBLH5ltAkxOHxcLhF2ngB5clGe8p9i3EnADMAWYtKqWM5+7jp7
         K+CESAhrLbcfWSzdFKtTh9tiFlLeQkKq9nhr28Msh5UcxDX+n41m3geX80TGeHIwEKJp
         jLww==
X-Gm-Message-State: AAQBX9cOP1DHaSPrZyVrjRuAJi/89k4Kwt9EPRLTX7UfduL+Xh02jhuj
	3C2yPqFSiAWlQCJ2Lr+XAt5a1w==
X-Google-Smtp-Source: 
 AKy350YuXymrw7So4UOjZjef+iEPyi/CshywTQ5AjTJZJr/4WaSMcccmVMSSXrgcRBO0CsBCTlwDVg==
X-Received: by 2002:a17:907:b9d9:b0:94f:1a23:2f1c with SMTP id
 xa25-20020a170907b9d900b0094f1a232f1cmr14815686ejc.50.1682414449568;
        Tue, 25 Apr 2023 02:20:49 -0700 (PDT)
Received: from [192.168.9.102] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id
 h11-20020a170906828b00b0094f23480619sm6620286ejx.172.2023.04.25.02.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 02:20:48 -0700 (PDT)
Message-ID: <0210316b-9e21-347c-ed15-ce8200aeeb94@linaro.org>
Date: Tue, 25 Apr 2023 11:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <8101c53e-e682-4dc3-95cc-a332b1822b8b@app.fastmail.com>
 <20230424152933.48b2ede1@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230424152933.48b2ede1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: NFZJGDDRMXDHBYZZETLPQ5A4OIFBMXBL
X-Message-ID-Hash: NFZJGDDRMXDHBYZZETLPQ5A4OIFBMXBL
X-Mailman-Approved-At: Mon, 01 May 2023 06:38:46 +0000
CC: Nikita Shubin <nikita.shubin@maquefel.me>,
 Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Brian Norris <briannorris@chromium.org>,
 Chuanhong Guo <gch981213@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Jean Delvare <jdelvare@suse.de>, Joel Stanley <joel@jms.id.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Mark Brown <broonie@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>,
 Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Sebastian Reichel <sre@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Stephen Boyd <sboyd@kernel.org>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 soc@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFZJGDDRMXDHBYZZETLPQ5A4OIFBMXBL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/04/2023 00:29, Jakub Kicinski wrote:
> On Mon, 24 Apr 2023 13:31:25 +0200 Arnd Bergmann wrote:
>> Thanks a lot for your continued work. I can't merge any of this at
>> the moment since the upstream merge window just opened, but I'm
>> happy to take this all through the soc tree for 6.5, provided we
>> get the sufficient Acks from the subsystem maintainers. Merging
>> it through each individual tree would take a lot longer, so I
>> hope we can avoid that.
> 
> Is there a dependency between the patches?

I didn't get entire patchset and cover letter does not mention
dependencies, but usually there shouldn't be such. Maybe for the next
versions this should be split per subsystem?

Best regards,
Krzysztof

