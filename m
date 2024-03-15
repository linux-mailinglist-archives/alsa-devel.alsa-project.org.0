Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7608F87CB13
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 11:02:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0111E22AD;
	Fri, 15 Mar 2024 11:02:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0111E22AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710496945;
	bh=gacD0vR1r8l6qYGtakyqNg/sNRdABilWR9geZMBzIqY=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a59KoD1ROWrYOPjW2TFPP5ccyRt0wBkq4cutlNlNSyomre0J9xVfmk+/tIzqXU4Z4
	 UO9khLQOtYohfyhl3y5nuc2JklT7WWj+Zi86iS6l9N2ddf2tqK9RHwD4qTmRbzBfoY
	 kQwhRuPv9enieQ+jICSaLltt6Rlq0h60SkLSAkek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71B3DF80588; Fri, 15 Mar 2024 11:01:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 255E8F805A0;
	Fri, 15 Mar 2024 11:01:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD448F804B2; Fri, 15 Mar 2024 11:01:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83970F8025F
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 11:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83970F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=DL5LhyEg
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-414008713beso2728045e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Mar 2024 03:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710496884;
 x=1711101684; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=fWhlUz33vWZPgCe1jVxjs/Yq8Zn8UQqggbMUOeu+zYA=;
        b=DL5LhyEgZxdWq8zz/SOhpFvQc0W+wCjUeAAXgGj7138FAcM663X2ioN6kqDl/JOuYq
         3IsTcBlKm2/ILHkR4wCbEH2C6Uwm3npQbo5umOI2TDXfz1Sk3yhOsNC6Lnr7TFlDAoVq
         xlry29wbLd2IdgINPUNPCLYp4c/xc+W8dkl+bfTHdZhiuxVsEtwPtW7muht2Tu5si7L0
         cJ1r5zDFR4tf7mfLjbKqtbutG/CJ/rOQVVq8970E1FVlispgTFw4khH1ooZA8cu9+iPS
         fT3y24f4u9rlSXu+wiykthC3PyavY9gH4YyW6pxPa89b9lmtlyYZabSMTGlHLh8BP4a/
         N9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710496884; x=1711101684;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWhlUz33vWZPgCe1jVxjs/Yq8Zn8UQqggbMUOeu+zYA=;
        b=dhwkVZ8RcxtSJw5zbjAl6dvKxvdmKLXtiHSyznTvDe6ikQ6sxuuwMrXcYWHEbDJyEi
         OzFQAPuWbYslKfcK+1hfEcjdyHS2g76/lv+kVrlz7RkC/Rrerp8hjOnRywK1aOZzeXdG
         GswChDYJ8QjVRGKwPlzd4z5iVbgzHbHPHwWYmpu5kL1LU+Tmcbog31gP+PNph3fie6bX
         Toq6DZFfHshih45ccSTON0odznXPuworAQH6KA7tELVTLTnXcfKta1nJZ6YQejjkR+da
         aECJisV6mmGY7PD7HTE5rg8QyGICzT2zLlVpmBJhGWbwp8qeCj3JIGmqC3oWdZhfqexy
         80JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Ra94+4wvrdEIk68gE5N5o9lagZV8tM12Hfe++X49+wDituikkrTcU6GI/rTBVsDdVMAPohScnqeQ3DLBhy1YoMedGRsQ3ht5KB8=
X-Gm-Message-State: AOJu0YyDQGHUB9YGLX553/hmWYC04b3P/9MVY8ToVomJA+6HPuH/BprN
	bmR9ntu/LZBn3zigViJy0qHKlP0Zelmp8mrwP5+OXFTxTDhnVTzA/4IiWd8plL4=
X-Google-Smtp-Source: 
 AGHT+IEcDrisOCqCMJOmaLRgZQyAaHTXXz8anuBHbakkxYTiPreghhV1D06Sq2gYrDwj1MifnJt7yg==
X-Received: by 2002:a05:600c:4706:b0:413:25c6:1981 with SMTP id
 v6-20020a05600c470600b0041325c61981mr3480578wmo.20.1710496884073;
        Fri, 15 Mar 2024 03:01:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b00413f76fe7b0sm3887726wmo.21.2024.03.15.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:01:23 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-7-jan.dakinevich@salutedevices.com>
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
Subject: Re: [PATCH 06/25] ASoC: meson: g12a-toacodec: fix "Lane Select" width
Date: Fri, 15 Mar 2024 11:00:35 +0100
In-reply-to: <20240314232201.2102178-7-jan.dakinevich@salutedevices.com>
Message-ID: <1jzfuzhkzw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: CF2QSUVW4EVQJALNW4DRUNUMUPIV7573
X-Message-ID-Hash: CF2QSUVW4EVQJALNW4DRUNUMUPIV7573
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CF2QSUVW4EVQJALNW4DRUNUMUPIV7573/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri 15 Mar 2024 at 02:21, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> For both G12A and SM1 the width of "Lane Select" should be 2, not 3.
> Otherwise, it overlaps with "Source".
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

Missing a Fixes tag.

Ideally fixes should be sent first in a series - or even separately in
this case

> ---
>  sound/soc/meson/g12a-toacodec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3e..b92de2235627 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -229,11 +229,11 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  };
>  
>  static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 2, 0),
>  };
>  
>  static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 2, 0),
>  };
>  
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {


-- 
Jerome
