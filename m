Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BE8843B44
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 10:38:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63F74F51;
	Wed, 31 Jan 2024 10:38:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63F74F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706693927;
	bh=6g/9wBTl6BPCWec9Q4PfBb1jAfx/QsrhO21o+nVjTVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uZRg7zKpTsi2/RRCFtsp8zdpfD1yVWebFy6/G6fNfjc6DBSnf3bxSPEKAG+5QTwtW
	 9Yx/92Ogvlo2H8nWY3jZ2X/5ybtWh/CtcDbvQINREkMxQ2eGjOz0YdXlVEW0c/1X/j
	 L4WOgO89WTJpiB0whgZOU4mmfcyPIbqcayYy7rdM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8E25F8057E; Wed, 31 Jan 2024 10:38:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 477BCF8057A;
	Wed, 31 Jan 2024 10:38:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E8B1F8055C; Wed, 31 Jan 2024 10:37:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12896F804E7
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 10:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12896F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Ak+xlFzN
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-4bd91d89fbeso1391831e0c.2
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 01:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706693861;
 x=1707298661; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmHeh0AnnU8R6/8VaEZIi+vqbQkcVNAn6pqy7RHvRQI=;
        b=Ak+xlFzN8pD2t9ZZR4NjXL05fGLID8wjcWmPzRbB4kGnJF8Ma5r/roxaBWRCu+Nnjk
         IlsBRHNcCOaOMSZpPb4zToDPILHlm5tLhyftYZQDpI/6PSR+2/b9WCJjZMu8zndiYUxL
         hSF01kwAljNz8A9udT8EM3QH68s/1EH/JmbytBol0SmgJtaFADLW/ngYs6Yl6stxQZ3j
         vbhjTuUvix1HAqLiC60jEY2Ls1uETaxdkXUAGwrwiOPXqi6jfiNtanwwQi1WjLUkWA9X
         6OMn3rvz9eWCfU1qf1kBXApjRq9mB2/dSZkmxnUnx1kLHjPxLRj+mYxX8YlnU+wat9sA
         +umA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706693861; x=1707298661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmHeh0AnnU8R6/8VaEZIi+vqbQkcVNAn6pqy7RHvRQI=;
        b=HXH8VAqiIcy30t8m3nitPWBOF39JAeooWcW45Lcr4bV9FFiEcaSPEVYjjoRmHA1el5
         RVD75SS384DJPcHd+aiW3Y4h6M892hkaYCnB7YrG15ff8UG53dEZVkhik7Qr5Y6uYNTB
         73L/+uVAFKvzYCxltE1qG9wE8QkO8NcECv13dyz9TRLqC6eKdgVsvzdmWYVJXSxbfP1S
         u7WYUaSBdYKKaogesmiDtLoBrdr+a5duTG0wkqdjU76TRmR8+c+DoyF/XJDAk0fzIt7i
         f7DCKba7sWqwdIq+xkq7O8myPt7RZ19CIZs3hWEZylfVyuiEKo57PdLSoIWtqGR8ToLi
         ZD8A==
X-Gm-Message-State: AOJu0YwX594s8gYhdLftee1ct5awDe4fNPB3N3Ef+5gMU4Ck7mBAFaUm
	OYWTAmBtpA3ZijIGiA5gh5u1brFuxTzUp5sNbD+Lkbjp/q4fJpmOwrThB9ryTDWLiNuxMkSqcUp
	lOB2X4jMDqNc+Pxj2J+Cy69LJR8M2t3GZl+Cj3A==
X-Google-Smtp-Source: 
 AGHT+IGYiHwBdTOPDnoFpMk4wG2qn9o70lLB7qc/tMqoiGXQQ1hR03EibuQ3mFexsetD4ArcCOazY4KDA9aeRUgU3NE=
X-Received: by 2002:a05:6122:4693:b0:4bf:dbbd:37aa with SMTP id
 di19-20020a056122469300b004bfdbbd37aamr937831vkb.15.1706693860441; Wed, 31
 Jan 2024 01:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
In-Reply-To: 
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 Jan 2024 10:37:29 +0100
Message-ID: 
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Message-ID-Hash: SHYBIWGJY2NZ24JQUJDHMJDLQO2RN5KD
X-Message-ID-Hash: SHYBIWGJY2NZ24JQUJDHMJDLQO2RN5KD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHYBIWGJY2NZ24JQUJDHMJDLQO2RN5KD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 31, 2024 at 9:57=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Hi Krzysztof,
>
> something is odd with the addresses on this patch, because neither GPIO
> maintainer is on CC nor linux-gpio@vger, and it's such a GPIO-related
> patch. We only saw it through side effects making <linux/gpio/driver.h>
> optional, as required by this patch.
>
> Please also CC Geert Uytterhoeven, the author of the GPIO aggregator.
>
> i.e. this:
> > 2. !GPIOLIB stub:
> >    https://lore.kernel.org/all/20240125081601.118051-3-krzysztof.kozlow=
ski@linaro.org/
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
> (...)
>
> In my naive view, this implements the following:
>
> reset -> virtual "gpio" -> many physical gpios[0..n]

This is a different problem: it supports many users enabling the same
GPIO (in Krzysztof's patch it's one but could be more if needed) but -
unlike the broken NONEXCLUSIVE GPIOs in GPIOLIB - it counts the number
of users and doesn't disable the GPIO for as long as there's at least
one.

Bart

>
> So if there was already a way in the kernel to map one GPIO to
> many GPIOs, the framework could just use that with a simple
> single GPIO?
>
> See the bindings in:
> Documentation/devicetree/bindings/gpio/gpio-delay.yaml
>
> This is handled by drivers/gpio/gpio-aggregator.c.
>
> This supports a 1-to-1 map: one GPIO in, one GPIO out, same offset.
> So if that is extended to support 1-to-many, this problem is solved.
>
> Proposed solution: add a single boolean property such as
> aggregate-all-gpios; to the gpio-delay node, making it provide
> one single gpio at offset 0 on the consumer side, and refuse any
> more consumers.
>
> This will also solve the problem with induced delays on
> some GPIO lines as I can see was discussed in the bindings,
> the gpio aggregator already supports that, but it would work
> fine with a delay being zero as well.
>
> This avoids all the hackery with driver stubs etc as well.
>
> Yours,
> Linus Walleij
