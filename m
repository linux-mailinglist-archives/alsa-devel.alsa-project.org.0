Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B952851FAD
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 22:34:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 101249F6;
	Mon, 12 Feb 2024 22:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 101249F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707773643;
	bh=UccBZcWyRgHb8CdqI4SfdswhlCvqeiofHLzpJGOSCIM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B2D5mxiRzQW6n13BMbUglnooYwzci3iwW9zZDj+zzgAErXoQlhgtbMllSlxvelBT0
	 XFdfPuNbatqK2yJDTk8+7Rz/55Xb1gBZOkc6ycsdGYTIn8PIQZnlpYKuxa4OVk3BId
	 iOuLN7q3mZpvjKtwL6KP92VOg7zOd2Smg4qThy+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42C4AF805B1; Mon, 12 Feb 2024 22:33:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38C55F80588;
	Mon, 12 Feb 2024 22:33:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C112FF80238; Mon, 12 Feb 2024 22:33:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3E4CF800BF
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 22:33:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3E4CF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=s8AU7wRa
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4c021a73febso674708e0c.2
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 13:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707773588;
 x=1708378388; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJH2iY95UEJbzAWLAhKcrIml1wV+F91i2EVUBYNcdJo=;
        b=s8AU7wRajxmAVkTduQk/PNgjPVQJ8F0Wu1sJFWeYi/11v3wlajfob6dZghlfxC0eL7
         Ge9L5iWR4SRCp0LIwfXFqw99zO/5slLB4D5WckUpVebkKk8lAmCbAu2F9/kvXb+oS2DL
         j2kEH1SF6iDaNdJRLEnyXlAA57P6oyuxiHQV0SYj8SRg7T3Ueooh1o3bafP44yVlUPZr
         ZPdyoOOk6jUKJ/ritXORYOz/QyGWVySlAnEKXXSOcAA2HcVYvJQ74scrofSPuZ9aGrfk
         54Sf13O7pfDPpmflZp+7aG8C2wPafnzNonvKBAw6Inz4Ev6NbInuokrSYn9tITiLsZUP
         wUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707773588; x=1708378388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJH2iY95UEJbzAWLAhKcrIml1wV+F91i2EVUBYNcdJo=;
        b=pawxyNQ1apu/AaaceOOSudQAY7mgABL2x/sXcdkb+N8mCtCV757nTDzNAy8FRiXJ5y
         RB8B4fLtKYfxLq/9RiW5mm/xQUTechwgmc/Jrdm9rhRlxDIs5LANWVq2vYWRXZjvUf3P
         nQsV0KiYcenlcGnPuSblN1pAThSGtYxJRZv752TjFpUbWvvfsUNejfa4RxGZOTsySsC2
         oE6ByDhSW/Y/bUrdGuhMMlzVTmp7YerjHdaJ3Un02NYSdVhpPOLF6X7G4YDyZYURmpAP
         DlAtJJH5ibkQR/5hf1d9gLmYQCsv1Y+gp7TYEutBV7V3If4XyUNGs/u2tbAW3daGnX0j
         Ghng==
X-Gm-Message-State: AOJu0Yz/VwHQBP49a7amCu8CKZwWj1CaZzlQZ/uKt/AbEgLvPbGKwfb/
	ThgWie+krPUmgQwaQOFOinxu1jOpUkMKeCxlAL3npd+eLzWX3T+KLElgChnSfsr31v5+14+qAat
	ygPodDOx0WpOMZS2bSsGcrqmh/hPodlOFS092Mw==
X-Google-Smtp-Source: 
 AGHT+IG9JhWk1ypXImx7gtdukOOrn/OVeJ91OyJ0AaFvoBMaRZsO4e81KwtlPywmU6wMBSTdbrnt6I7BaNpH/6tSHa8=
X-Received: by 2002:a1f:e7c3:0:b0:4c0:21c4:3a9b with SMTP id
 e186-20020a1fe7c3000000b004c021c43a9bmr4103383vkh.15.1707773587581; Mon, 12
 Feb 2024 13:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdbMFHPK0SBSxiZ3FOqChQFCBdOny0yYG--6V+1S=CKgiw@mail.gmail.com>
In-Reply-To: 
 <CACRpkdbMFHPK0SBSxiZ3FOqChQFCBdOny0yYG--6V+1S=CKgiw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Feb 2024 22:32:56 +0100
Message-ID: 
 <CAMRc=MeEPvhB1nTwBT5fG7p0G4L2J5FjJfM0GMusQuDnnEN35g@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WDXGELLHNUYVLM46MAD2G6J6CQ6GXNSH
X-Message-ID-Hash: WDXGELLHNUYVLM46MAD2G6J6CQ6GXNSH
X-MailFrom: brgl@bgdev.pl
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WDXGELLHNUYVLM46MAD2G6J6CQ6GXNSH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 12, 2024 at 9:48=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Mon, Jan 29, 2024 at 12:53=E2=80=AFPM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>
> > Devices sharing a reset GPIO could use the reset framework for
> > coordinated handling of that shared GPIO line.  We have several cases o=
f
> > such needs, at least for Devicetree-based platforms.
> >
> > If Devicetree-based device requests a reset line, while "resets"
> > Devicetree property is missing but there is a "reset-gpios" one,
> > instantiate a new "reset-gpio" platform device which will handle such
> > reset line.  This allows seamless handling of such shared reset-gpios
> > without need of changing Devicetree binding [1].
> >
> > To avoid creating multiple "reset-gpio" platform devices, store the
> > Devicetree "reset-gpios" GPIO specifiers used for new devices on a
> > linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
> > controller, GPIO number and GPIO flags) is used to check if reset
> > controller for given GPIO was already registered.
> >
> > If two devices have conflicting "reset-gpios" property, e.g. with
> > different ACTIVE_xxx flags, this would allow to spawn two separate
> > "reset-gpio" devices, where the second would fail probing on busy GPIO
> > request.
> >
> > Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ =
[1]
> > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Sean Anderson <sean.anderson@seco.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> I can't think of anything better, that is reasonable to ask for.
>
> I feel slightly icky about the way the code reaches into gpiolib, and I t=
hink

As long as it doesn't include gpiolib.h, I'm fine with it.

> regulators should be able to reuse the code, but unfortunately only the d=
ay
> they have no board files left :/
>
> I do feel the core code handling "reset-gpios" could as well have been
> used to handle "enable-gpios" in regulators, just that the regulator code
> has more requirements, and would be really hard to rewrite, and deals
> with descriptors passed in from drivers instead of centralizing it.
>
> Like regulators, reset grows core support for handling GPIO for resets
> which is *long due*, given how common it must be. We really need
> something like this, and this is certainly elegant enough to do the job.
>
> Yours,
> Linus Walleij

Agreed.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I will pick up the stub patches tomorrow and send a tag for Philipp to pull=
.

Bartosz
