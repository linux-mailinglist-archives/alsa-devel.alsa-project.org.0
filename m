Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4317BD413
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 09:10:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3E5482B;
	Mon,  9 Oct 2023 09:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3E5482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696835452;
	bh=cAmCym8HwcgfF2R80wzcYBLGRZWY9/+Q9CDvlZ53QMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OzrfX6N/uG4GCaK/OT+M0b3K1Y1HsZPuy/LEEEldZ87e/N/GXFG7reWS1V0NvyiN7
	 7Rk5UwaCaCPrv9YGyud4AoSapsP4dJvlElmWCbtoZ2SouDRwKQQlG8197PbefWSRm6
	 TPGIlvEz1hi+zOgVuF7+eozD8WU51iSzGrktROzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29219F8027B; Mon,  9 Oct 2023 09:10:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB27EF8027B;
	Mon,  9 Oct 2023 09:10:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94000F802BE; Mon,  9 Oct 2023 09:09:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B44D4F80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 09:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B44D4F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=GIjLXvdQ
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-4576946ce96so441021137.0
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 00:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696835388;
 x=1697440188; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhLRpwsuxmOsvcZ8fYOZy3OVA1IUIC5Nv3spoy9OsQY=;
        b=GIjLXvdQr7EaUoifPa4IOGD4VakRzNmGpN1fZe2OUfaJveVVjRI3AOo1Wicj/yzP0S
         7E1AATZx6yaN+XQRXzBfXbvgvqv9aZpRCNNl2cJANK19Xuueq0RdU2d5mg6lLIWbxg5x
         5M7ICqp/aQqi4YbE/klHuAP2LMp9pXG9Zr72nINR5qyPS+klMp2i3+YSsBKnekoVkKFN
         JIPTkGYDw9HwIrFSd+Y2Lgfy6LORHHTAsfsK+jh3phm7KhWJwJ6nevUzYB762cQcZco1
         iVxIUxyzFPuc4FYuIcwOTQmMuMUoVxzjzrfpJ8LBi5aZ336Tjgoea3IHizv3RYnXsy9T
         c8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696835388; x=1697440188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhLRpwsuxmOsvcZ8fYOZy3OVA1IUIC5Nv3spoy9OsQY=;
        b=aJi49lIKTSX6DNoW/zc6qLWHO0FU0Hb2RB6Puh/DIjAdcoXNVERp4xqwPZrK4Fo/Rm
         Sutpjh7IEp/dVZH9eRvfrNEoyBqZ4M9cnc3e+RMna3AQwUrwdYpb4DMYRv3SY0Th0K7Y
         WcNdZ+3ZLoheX4bvZW0hRu+6UoBz/gcFBRVHYoGRGbT/00eUymENMvBXjbiMka7BPDD5
         3PMHXZvo0aeZxeibazQuh1WI+AkJiWPAshoG9Z3AD71UJqxA5QRvp9JeSqAgoV50W17N
         rKf/wz0tKparPmEDZkAdIYhFY9uiJrvPczlnYfwHWNZ+1Y07IyDNoKkpHnj8eESH3QkP
         mxIA==
X-Gm-Message-State: AOJu0YwL3awxjPgYDLoQferMld2OKQhg/16bEfumtTPAx6hohOVryiSM
	i2NsayJ9Mi11Ly1XMQFPLaImpV0ACvYZEi1wSqoxxw==
X-Google-Smtp-Source: 
 AGHT+IFVM96RtaqXDXXuEbO13aoAbWj6cTZzjGKLV4l0Aye+LflqahSU0J82oWNmTnQq4Qz8tRzJ+5XZbtX86Rgify4=
X-Received: by 2002:a05:6102:f09:b0:457:79e5:50df with SMTP id
 v9-20020a0561020f0900b0045779e550dfmr2089711vss.33.1696835387451; Mon, 09 Oct
 2023 00:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Oct 2023 09:09:36 +0200
Message-ID: 
 <CAMRc=MdY2DU1R5_Ntkhw6UP0Vp+uhyUvti72KChBQqSF1ruWPw@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZC36FAPN5UMYB5XGTERFQFSI3NSSHH2R
X-Message-ID-Hash: ZC36FAPN5UMYB5XGTERFQFSI3NSSHH2R
X-MailFrom: brgl@bgdev.pl
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZC36FAPN5UMYB5XGTERFQFSI3NSSHH2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 6, 2023 at 3:46=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> These gpio names are due to old DT bindings not following the
> "-gpio"/"-gpios" conventions. Handle it using a quirk so the
> driver can just look up the GPIOs.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-of.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 531faabead0f..d9525d95e818 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -512,6 +512,10 @@ static struct gpio_desc *of_find_gpio_rename(struct =
device_node *np,
>  #if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
>                 { "reset",      "cirrus,gpio-nreset",   "cirrus,cs42l56" =
},
>  #endif
> +#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
> +               { "i2s1-in-sel-gpio1",  NULL,   "mediatek,mt2701-cs42448-=
machine" },
> +               { "i2s1-in-sel-gpio2",  NULL,   "mediatek,mt2701-cs42448-=
machine" },
> +#endif
>  #if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
>                 { "reset",      "gpio-reset",   "ti,tlv320aic3x" },
>                 { "reset",      "gpio-reset",   "ti,tlv320aic33" },
>
> --
> 2.34.1
>

I suppose this is a run-time dependency only for the other patches?
Can I just pick it up into my tree?

Bart
