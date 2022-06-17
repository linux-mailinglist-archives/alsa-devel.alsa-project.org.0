Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433A54F012
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 06:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B58B41B58;
	Fri, 17 Jun 2022 06:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B58B41B58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655439792;
	bh=AoVZzawrrLohmhLumhK6uL79YwlY5IU8FzKSYHvCjoU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VpkrwnNTXY2yj4YtR3h5xy6NnxTrBUEjsn2dLxhpe7LtLx7qp+jg5DM55S8CI1cCc
	 by6lyj9OFbuxfm1DfDGSNsakGUR17/aEK7Gtng4+4gKYGk4TW/MsJOcq2oYhdDzcgc
	 Y9Wk0ndi7tvrXCisY4ngcEw3tgVY9bZB7c71ptc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15A0EF8019D;
	Fri, 17 Jun 2022 06:22:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01D7CF800D3; Fri, 17 Jun 2022 06:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1DB4F800D3
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 06:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1DB4F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="K+++cDQd"
Received: by mail-wm1-x329.google.com with SMTP id
 l126-20020a1c2584000000b0039c1a10507fso1786435wml.1
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 21:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QzjBrAgNA1AZjNa+pTInhm7i5DXtxxCJmOaoCVhc67o=;
 b=K+++cDQdr9cYej3ks+qHgpRRO9cxfb7XdyeS8sjTpNBayehaxo6EJtoyuIU2xwI69L
 gx6rZ8BvrkJsYfiM6qT+H6b7ZC6Y4iB70vsimWPatpV5/yNeD7umpUHHG1Eq4x8S5xlk
 V1qHnN3rFJGfWJodZ5SfBe7q5+5+j4aBJrdKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QzjBrAgNA1AZjNa+pTInhm7i5DXtxxCJmOaoCVhc67o=;
 b=h+T1gUFyCYcFUUozVu/GZbRS3MP6sh01t/0JfbI2iT2RPv2IQ4nJVV1R8iCyn1ogu6
 mmegcZoBkUk0LcPyh3T8XzkwI4kw3IQGIfL1i0YcddxG9KXuDwSmWaluzyHcbqVUsxeh
 zhBbLmZ4dV7bd6mzLQdM5IiIsDcm+5+O6GGW71GkawYIX/OQdo23MuhXFukLLtv1sh7o
 qLYuLEJympI0k++VtxmYD8zHHkhGt5sXx9UuHJo1nxuL4tdBVaBKsPTP/JjGr1elCdzH
 OUVQR+pKsZO6TXXqlS+zenS6Ac71Ay1O2Feh1KuhWCLAAqKvNBYGVEx9siVZxmKBZjpw
 xdSw==
X-Gm-Message-State: AJIora+yjUqOn19SreYASMX6jhbHmBlIcbXk6JVp9kEqtSWmpp3gPZUd
 SOVog3WbC8befUescMl95umF8sjZELatOScVNHhqhQ==
X-Google-Smtp-Source: AGRyM1v3sERgOBqTQVjBxagXczYgYpertg9OLvxMVM+dhQu2SW0N8tDt41W3pagb/zDh/CM+9EhiOjkIxW0HRWr5Uq0=
X-Received: by 2002:a7b:c5da:0:b0:39c:542a:a07b with SMTP id
 n26-20020a7bc5da000000b0039c542aa07bmr8159751wmk.83.1655439723483; Thu, 16
 Jun 2022 21:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
 <20220616155836.3401420-2-judyhsiao@chromium.org>
 <YquXEgHkw08TkNuG@google.com>
In-Reply-To: <YquXEgHkw08TkNuG@google.com>
From: Judy Hsiao <judyhsiao@chromium.org>
Date: Fri, 17 Jun 2022 12:21:52 +0800
Message-ID: <CAJXt+b_n=B9VBvgP8hy7g48Bo2VTPXqi+qKHTX1BiwpEgUrOUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
To: Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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

> It feels like a lot of the noise in this patch is due to adding
> additional error handling, unrelated to the real change you're making.
> Maybe that deserves a separate patch?
The error handling is to detect the failure of switching LRCLK.
If LRCLK is OFF, we don=E2=80=99t want the BCLK to be ON. So the error
handling in the patch is relevant.

> I mentioned this off-list, but the 2nd-line indentation alignment *used*
> to be in a very particular style, and you've moved that around a lot. To
> match the previous style, it should be:
>
>                 ret =3D regmap_update_bits(i2s->regmap, I2S_DMACR,
>                                          I2S_DMACR_TDE_ENABLE,
>                                          I2S_DMACR_TDE_ENABLE);
>
> (BTW, if you're using Gmail to view this, you're going to have no idea
> what I'm talking about, since it doesn't do whitespace or monospace font
> correctly...)
>
> The same applies throughout; most of the 2nd-line, 3rd-line, ...
> indentation is a little weird.
Yes, let me fix the indentation in V3, thanks!
