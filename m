Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A5787CA67
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 10:07:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB3622AB;
	Fri, 15 Mar 2024 10:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB3622AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710493633;
	bh=VYYch6XeureEVUpN2Mw2LknizCfpr7ksjmijCa7rU1g=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KlOcpOhB+CAdaiIjYuDDwd6No+qI90ZaXsTO3voxPpmqy6ezDV4ydZnhMXLmyimSZ
	 6An6livd6ki4mW4VMNUHnddFmsSBtNtmlkNoVbXI9Rx2jOotTtqSWuCUo8c1NfDEtG
	 /mk4hUzgIDDIY6EZnUWMGyEGf3BXTx6XSePIqSUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0524F8059F; Fri, 15 Mar 2024 10:06:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4154F8057B;
	Fri, 15 Mar 2024 10:06:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C46AEF8028D; Fri, 15 Mar 2024 10:06:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE4CFF8014B
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 10:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE4CFF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=c19IpF/0
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412e784060cso17594495e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Mar 2024 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710493565;
 x=1711098365; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpMSBa9vXitkcuu7vgMM3w3/yA6IqPigK2dGLCTN5uc=;
        b=c19IpF/0sKqP4epuiQ4zL2KvsN9VeqDorxvWd/QnNgz88a6rYW2adkFH+mwbo3O7AW
         J61+s9uwHKPx/XXPN4DM+jwZTxvmDdl30UJKtYBBegT1I/i30yTcB46lthIW8JrxFtCu
         FMlANyA+l3mMTsX/PcdS0T7urqWhHhvAx4R20oFHxlNfxpo+ZWxC+fKdScGtfEgjTuhH
         TsIC1qaMi+aAW+KcHUAlEGYzq3XtYr8wqQH5DTVXHQ5/5Sp6QtBzllEw5pipFWW0WxsZ
         T5QQhwKWTfTIhlYve2i35yycc4/+zbgVlYvslq/eTjTXeHx+VskfnPqrJDnFQz1ylmQa
         XPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710493565; x=1711098365;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpMSBa9vXitkcuu7vgMM3w3/yA6IqPigK2dGLCTN5uc=;
        b=pK/U8gfd2kflk4xr1knXXOGbtU+KyFgRV8djyJS3zbmmFYxOg+oPIA1TM+EUk1Dho9
         X+DibQSUT1nT5JU7JOpOjhCceS0zC9erl9HVs5G0SNRlzXo53L6FNT4Wvpe43R1gGiiE
         aTgjsbGYtlYpsYX4ymomHkwL9DvfGw2pwqZtDXpZU8npApYagh2eamw3jmFm9F45bA6m
         ZU6muCH7ZXpAw6Y2oli7BooQqbIkPXevUAOa9nFafbqzRFACTgjzOV5GZg2jzP1mH5NT
         YYOKurSizwrsUPSL3fXYMqpxtav+W1U7sVIPvbE2GyVyljZV9c1QoZWsRyFXRcEBWtf+
         hi4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsEe5WCFICGO6Tnk2UBiVcQGF1YiJkZV1vw/W00c+FCyHQU1+zNXb6Dw7u8ryozCP+clEIKKU0BmjLMxVlhZCxA3xuUfWWfd9ojuY=
X-Gm-Message-State: AOJu0YzaWvoPMJrJ+miSHLxSdmEMr7DUN1jk09+ymzh7jnnaeWJXsYjn
	IuqJAAr3kPgZZRkZnI1Co4kCraoDJTo7K2QL2Pa3jjXhSAbn2BAupmcq2uBZLVI=
X-Google-Smtp-Source: 
 AGHT+IGv2qeT4+XV+fkhSqD7rZTLCUTw8RubHWgYTp3yu9LMq3zgewNkauR43y7qOB4OhUkwae7l8g==
X-Received: by 2002:a05:600c:4f11:b0:414:37f:2798 with SMTP id
 l17-20020a05600c4f1100b00414037f2798mr483210wmq.6.1710493564904;
        Fri, 15 Mar 2024 02:06:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id
 fj6-20020a05600c0c8600b00414024b2f49sm900044wmb.0.2024.03.15.02.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 02:06:04 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Michael  Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob  Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 01/25] clk: meson: a1: restrict an amount of 'hifi_pll'
 params
Date: Fri, 15 Mar 2024 09:58:50 +0100
In-reply-to: <20240314232201.2102178-2-jan.dakinevich@salutedevices.com>
Message-ID: <1j8r2jj24k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 35XXD6IF6Z6GJWKUHHNDJJ2WED57K3F7
X-Message-ID-Hash: 35XXD6IF6Z6GJWKUHHNDJJ2WED57K3F7
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35XXD6IF6Z6GJWKUHHNDJJ2WED57K3F7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Existing values were insufficient to produce accurate clock for audio
> devices. New values are safe and most suitable to produce 48000Hz sample
> rate.

The hifi pll is not about 48k only. I see no reason to restrict the PLL
to a single setting.

You've provided no justification why the PLL driver can't reach the same
setting for 48k. The setting below is just the crude part. the fine
tuning is done done with the frac parameter so I doubt this provides a
more accurate rate.

>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  drivers/clk/meson/a1-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 4325e8a6a3ef..00e06d03445b 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -74,9 +74,9 @@ static struct clk_regmap fixed_pll = {
>  	},
>  };
>  
> -static const struct pll_mult_range hifi_pll_mult_range = {
> -	.min = 32,
> -	.max = 64,
> +static const struct pll_params_table hifi_pll_params_table[] = {
> +	PLL_PARAMS(128, 5),
> +	{ },
>  };
>  
>  static const struct reg_sequence hifi_init_regs[] = {
> @@ -124,7 +124,7 @@ static struct clk_regmap hifi_pll = {
>  			.shift   = 6,
>  			.width   = 1,
>  		},
> -		.range = &hifi_pll_mult_range,
> +		.table = hifi_pll_params_table,
>  		.init_regs = hifi_init_regs,
>  		.init_count = ARRAY_SIZE(hifi_init_regs),
>  	},


-- 
Jerome
