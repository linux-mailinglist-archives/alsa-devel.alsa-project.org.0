Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C10C7692AE
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 12:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EDEC886;
	Mon, 31 Jul 2023 12:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EDEC886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690797925;
	bh=J3oc0wjemL0carx5VDVmCzC3ohqA3t9ovq2Tkpwxm0k=;
	h=References:From:To:Subject:Date:In-reply-to:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oaMstdewLEkbM0nUIrzFMCrLXPF9rnPDCekRYGhz0ZcO8V/NExBwN1JDAlrv9Dg/B
	 reb1QRj1XOnmL9WnrMG3HcUadDGckTuRqpk97unSwOn6dgw/CF3pUZCbj7mG+1UXVa
	 F3vdYuf4jNHtYowvWMSDXhGMVkYh+OlUz4XLLhi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99C3AF80425; Mon, 31 Jul 2023 12:04:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BBF8F8015B;
	Mon, 31 Jul 2023 12:04:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E088CF80163; Mon, 31 Jul 2023 12:04:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1097F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 12:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1097F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=Vz8bn6xt
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31763b2c5a4so4489070f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690797843;
 x=1691402643;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=xmu3IjUQ2taW3zTxDp9/zo0P78kimt745EhKwmVkMfQ=;
        b=Vz8bn6xtRr9ajaVL2BYH/aU5C5qeoqk0tN1tW8v5Bz3+absmnMeoDLPOTrnC4mkk/M
         9+D9rninKuwW61xhv+cDJcG0P33QMQ5HZz1mfs7UiwCXi6dIM/vsZyh3HjQ9922kj/4s
         +jIin1qddCBn41gsu0Eo3jA+DxF8aM+9VZV6koeVX4ph6OqSYHlQ54AaEJNN4iEc1wD8
         3yclrtFuxve6PCVDn+11GlYIJWc0Ha3DyBodOsez5rv8FHqjZNRq2htMQzNF9Ho13HT8
         h/RrB+CklDlcmR7qAzMy0Ink/xkNE7JCgUqwrQsDQYYWQ6E9D+lOkpmzCoYZNzO26OPs
         82ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797843; x=1691402643;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmu3IjUQ2taW3zTxDp9/zo0P78kimt745EhKwmVkMfQ=;
        b=GP1T+Y70+RPH3TurYG+wr/+uDUlp0RnSyY4QR7drT61HC8FcMVhCzhLjrwq0/qRmJx
         AAZ2uqQkAO/U1p/IDMGS3OHyfa8x9JPrwy2mWec3pqgKkKIojei96gociUPYTzedKo4V
         0mpfbbLukJN3tv23MKewNxGdvXVV2P6rWqMl+YLwy5rfoERIWZwZkA9EyznyX/I+RrN6
         wNo3lodUyeGGf532R6YyrBJSrXtG8KLs4P0z8t4LOvji5cBkbh97cUAVTzDK9dODji3h
         R5TYbNi/Tqk+8Ixe8shcDn2ed+KVEt8VXYh8z9oIH+UAYvMUkEfPtVqmuEHQQbBHjxcc
         BJzQ==
X-Gm-Message-State: ABy/qLZ19EHHVoHK+bpKV6rAVxRSTrycg89EcwbTfnJR8L01XQFtkbZx
	q2VpwE0zcYFSTYRVQgUKpwVuqQ==
X-Google-Smtp-Source: 
 APBJJlG/6YtIJ2PZyWt5JPzeSkuVMJs1cDNhO+1x9k/xAk4VYOxr9uirGMxr5kOpAVkpkBapLLbIcQ==
X-Received: by 2002:adf:f681:0:b0:314:46af:e1e7 with SMTP id
 v1-20020adff681000000b0031446afe1e7mr8192622wrp.34.1690797842657;
        Mon, 31 Jul 2023 03:04:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:686f:cc54:f527:35c0])
        by smtp.gmail.com with ESMTPSA id
 f11-20020adff58b000000b003143aa0ca8asm12553696wro.13.2023.07.31.03.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:04:02 -0700 (PDT)
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-2-krzysztof.kozlowski@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Rohit kumar
 <quic_rohkumar@quicinc.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Rao
 Mandadapu <srivasam@codeaurora.org>, Judy Hsiao <judyhsiao@chromium.org>,
 Trevor Wu <trevor.wu@mediatek.com>, Jonathan Bakker <xc-racer2@live.ca>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 01/12] ASoC: dt-bindings: amlogic,gx-sound-card: correct
 maxItems constraints
Date: Mon, 31 Jul 2023 11:52:53 +0200
In-reply-to: <20230731094303.185067-2-krzysztof.kozlowski@linaro.org>
Message-ID: <1jr0oowg6m.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: YX4NHLPV4QNX2NAMRCGXJNBOJTJZBMHW
X-Message-ID-Hash: YX4NHLPV4QNX2NAMRCGXJNBOJTJZBMHW
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YX4NHLPV4QNX2NAMRCGXJNBOJTJZBMHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 31 Jul 2023 at 11:42, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> minItems without maxItems implies upper limit, so add some high maxItems
> to fix dtbs_check warnings like:
>
>   meson-gxm-s912-libretech-pc.dtb: sound: audio-routing: ['AU2 INL', 'ACODEC LOLN', 'AU2 INR', 'ACODEC LORN', '7J4-14 LEFT', 'AU2 OUTL', '7J4-11 RIGHT', 'AU2 OUTR'] is too long

The only contraints is that values come in pair and there is no upper
limit to the number of routes a device (using this driver) may have.

The upper limit of 8 might work now but is very likely to be wrong for
the next device to come.

Is there way to correctly describe this "pair" contraint with DT schema ?

If not, then I guess the most adequate solution is to drop minItems and
give no bound, like simple-card is doing for the same type of properties.

Same goes for the audio-widgets property

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> index b358fd601ed3..45d6202d9730 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> @@ -21,6 +21,7 @@ properties:
>    audio-routing:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>      minItems: 2
> +    maxItems: 32
>      description: |-
>        A list of the connections between audio components. Each entry is a
>        pair of strings, the first being the connection's sink, the second
> @@ -29,6 +30,7 @@ properties:
>    audio-widgets:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>      minItems: 2
> +    maxItems: 8
>      description: |-
>        A list off component DAPM widget. Each entry is a pair of strings,
>        the first being the widget type, the second being the widget name

