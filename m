Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EA06BDCCA
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 00:18:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E8441041;
	Fri, 17 Mar 2023 00:17:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E8441041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679008710;
	bh=0OHLvMHZsCu3tuo1mxCMwGF88ZDkoo1SSOKq4ysw61s=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IggWUpO8OZZ32G9SmzGkDljVfRvt0Jaqv4DZr7A39FMwqQe6V6V7BuWT4vUJptgDG
	 emLf7X0neLDEFCCvXUuoVBC2cp0uSzbgKoQSpAOmiKBqJ/KBRGfBZpHgqpuHbaaYQi
	 U+kAMiQYUJz1y0SgKrxLpyAG2W/7Wolh74teUOkk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A26EF8032D;
	Fri, 17 Mar 2023 00:17:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80BDEF80423; Fri, 17 Mar 2023 00:17:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47560F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 00:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47560F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RQ3o180H
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-54184571389so62165187b3.4
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Mar 2023 16:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679008644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OHLvMHZsCu3tuo1mxCMwGF88ZDkoo1SSOKq4ysw61s=;
        b=RQ3o180HwM/DzMh4AstB3LGaZSTbwtTn5owsDYUf4Hi6bHpcGzDFArozCUewDAwZeg
         eewQnK34FFVf/sAHFGQjg6c/s9t844x9zbtbLFlboviCKOP1h9aRfzmPS2UF7QDXSG4q
         P3JHsGdUxU/RbOEC6GoMkjcFZY0R+3O7O+GX4q+nTLdXiPHIIn2HImXc0YgfFQmz3FH/
         uIRe/3TmRgXpCrZX99Ur4dkHpHaDeQf943BerqFTJLcUUV7QmSx4fR2r0SKpny4uPL1k
         3PL6HZ7wg70xZEF2dcKsP06HnKtjYsp7sKGslh6Hd3ITaldPWXl6hEg+nAg7HMbR4ubY
         c2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679008644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OHLvMHZsCu3tuo1mxCMwGF88ZDkoo1SSOKq4ysw61s=;
        b=Gr2HU1GE7FzDfav+exrqvkYEvfz5MoXdn1fpcBVfNu7FdjoH2oCGOrz9zKrCibRQKW
         lyUBRyJ0XwCIzFqS10FNaCAP9JmUfM4wkajscvhtUrs6rhXblT79sevMlUNmlOquK1KD
         14FjY2XI1sSTbArkjBW4ngnsVlWmNR5Wsa7maET+rqOuQVWzzgk+f2uVPgx4Sr5XmKwc
         IAcxsEQ0Q8ZKbRTPnxhnn0gGmJBC56Y1mhCxQyLs+2gsCZHpw1KAgzbM/d1hgcGRKage
         srxgpZNSXFr2Pu0tW3GYU0oKBBj+YFto11VOV/erB7nmZZfCC4NR2mHW0AmZb3+jJiDh
         fhYA==
X-Gm-Message-State: AO0yUKWR1bp/x4rx+SzHQQwnX5N8n8X4upQD5RV8E4Y7jhyLLsAoyCiF
	AJHW5Zc/2jRWZEyaNdneUYN0uRTg0mbCCPuaZAVqFA==
X-Google-Smtp-Source: 
 AK7set9jkA8RkwiEbpe2sEtNk7wgKUvds0Ao7u2gcUQ4rdS715MzcoDPKfEqotCVke+ZTgD8GphLew8BY6lCqP4sm7A=
X-Received: by 2002:a81:b703:0:b0:541:a0ab:bd28 with SMTP id
 v3-20020a81b703000000b00541a0abbd28mr701395ywh.4.1679008644482; Thu, 16 Mar
 2023 16:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-169-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-169-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Mar 2023 00:17:12 +0100
Message-ID: 
 <CACRpkdawAvp=a8ERC5fDz27eJB=KKT7n4gzJeTD64BPpZcev6Q@mail.gmail.com>
Subject: Re: [PATCH 168/173] ASoC: ux500: ux500_msp_dai: Convert to platform
 remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: J32BM3IU3VOB74BCECFOFTTVJYXFZZEJ
X-Message-ID-Hash: J32BM3IU3VOB74BCECFOFTTVJYXFZZEJ
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J32BM3IU3VOB74BCECFOFTTVJYXFZZEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 15, 2023 at 4:08=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
