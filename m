Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FF77BDCF1
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 14:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D293FDEF;
	Mon,  9 Oct 2023 14:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D293FDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696856352;
	bh=Z+RwZsbweJwV+s5ObvTuJAPnm5Kk1r/W3wiWeW/Ex0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TEP5UQ4ju7dgq7hRAnVZf1sTHTTUQ6kqnXu7uQ8Klc/EkqODEI8lQMWfSbnIhc4bX
	 /25lshxdiMknCtkksEml8pkxVMXQpkE8oCEkVwzD/bDHI0pCdTTPtUGrKp51uYUfPz
	 G0YydhqnFz0AmBm+SiKDSvMxCeZzzEI7qnhW8Ml0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11010F80553; Mon,  9 Oct 2023 14:58:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F666F80130;
	Mon,  9 Oct 2023 14:58:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4416F802BE; Mon,  9 Oct 2023 14:58:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4503EF8015B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 14:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4503EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=hqo4gfrL
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-4576946ce96so576028137.0
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696856289;
 x=1697461089; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+gpkzJfNccB5gH7cb9zDfW4Fonw1ieJ8gLDBd6viIU=;
        b=hqo4gfrLdKLsZ/HldHyqngmH1mMUKZxfjQ5iR8kXPM6gkarwCj91udfMku9oa3aTf1
         H+kmq9BUw93nM5JaSVnms0mBscSNNIaWmYBa5ILDAgE4AGtpWEjDBpFkXgZ7IQfK5biF
         y8XlVkY6ap1cKMRXl9RiN2fQglINxaabVIbD1nYvc+RPyWffyftiZLF+CL5OcmWwLwnv
         ZNC09tetH+OnSIGOum1/s0/vaTEslkaxB+ZPvzX1CyCxYvVNyHleQIJm91EQ/Eb4Q0Me
         QhnW+lc0Ze7niRVn3NL7IIsa/FQvVYZ9h5yOdN1k9pFJzFNClZYbzcMnUV1pQGSOt/vh
         P4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696856289; x=1697461089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+gpkzJfNccB5gH7cb9zDfW4Fonw1ieJ8gLDBd6viIU=;
        b=qudxqORBaabkk0XslEkDZ+eMy4yw1mX8j+t7ZZyMH3HC2b+lSkY7pCz8t4x8AsUt8K
         YbHQfbVuA0dXmSUkoKn6M1lrQTabveosfTAA/fKEEK1ynB64nPSLffUfME7XrGLClMIj
         ThyuSx+4n2FV5AWaXPuKYkdBBFXk5E3QgY3huRfoDZwBHpwGmTn8Ap2JsQJSkTBOvLcQ
         rU+OYGzWaaw09JXljQPu5GPTZHPQzme114wkHu54dT2JuPCTTwQ8qUGNoET+L2fU6jVZ
         7YCtK5twXqx6AwUP8ikbkzTqPX0yd54tTNWC7r7b2fDsPR6bS2Dzy4pYp2qOR2BlsqzP
         C/Nw==
X-Gm-Message-State: AOJu0Yyi8XHPukqPW1LGOAl2cnRHD9CYHoNawrnS+rM2i9hIToqHXMfT
	ZBq0N9Sq1kVdqd9nBAwHPYTTxVZv/RTHSOjRWmlVUQ==
X-Google-Smtp-Source: 
 AGHT+IFTAUfR1gTCm3D3XIrQD4F8FLARNjqBeGoPGST/5Xw+zvNixlquzd8Fm22XUFH6FlagNBuFNjaFz/vVg4Z8bjw=
X-Received: by 2002:a67:fdc1:0:b0:454:640e:58cb with SMTP id
 l1-20020a67fdc1000000b00454640e58cbmr14963468vsq.9.1696856289019; Mon, 09 Oct
 2023 05:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
 <CAMRc=MdY2DU1R5_Ntkhw6UP0Vp+uhyUvti72KChBQqSF1ruWPw@mail.gmail.com>
 <CACRpkdb9fQUUq5_AOwXewiWfUjmu9r2SHHy-RSjfR_33znLiFQ@mail.gmail.com>
In-Reply-To: 
 <CACRpkdb9fQUUq5_AOwXewiWfUjmu9r2SHHy-RSjfR_33znLiFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Oct 2023 14:57:58 +0200
Message-ID: 
 <CAMRc=MdKRf5aZt3sYjPD_+CUR-prsN_JTDVP9fDdu5tRzNHvvg@mail.gmail.com>
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
Message-ID-Hash: P7ZYLVGEEUR56XRM7ULPA3BVWIYUGVNP
X-Message-ID-Hash: P7ZYLVGEEUR56XRM7ULPA3BVWIYUGVNP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7ZYLVGEEUR56XRM7ULPA3BVWIYUGVNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 9, 2023 at 9:33=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Mon, Oct 9, 2023 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > > +#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
> > > +               { "i2s1-in-sel-gpio1",  NULL,   "mediatek,mt2701-cs42=
448-machine" },
> > > +               { "i2s1-in-sel-gpio2",  NULL,   "mediatek,mt2701-cs42=
448-machine" },
> > > +#endif
> >
> > I suppose this is a run-time dependency only for the other patches?
> > Can I just pick it up into my tree?
>
> You can, I was just thinking about bisectability and the low risk of coll=
isions
> with other patches. (Actually no-one gets hurt if it's applied to both tr=
ees
> either, which IMO is perfectly fine in cases like this.)
>

Nah, Stephen Rothwell will auto-yell at you for that. I'm fine either way.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If we get any conflicts in next, then we'll deal with it with immutable tag=
s.

Bart
