Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C27AE844183
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 15:12:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A73B2B71;
	Wed, 31 Jan 2024 15:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A73B2B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706710369;
	bh=fy67XFG440oNqKNoOyKdiRXwM4wMoj/X9XerGknRkFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L5M2QVpxRWb+AMRajln2fXkPkvJSGaJYhVBfXZrfXprG2Ig7jzL1Sv9uyAMZ2f0t1
	 hMw7z5kCQvFjXbNQzRl+fWHesWZnTmm/hAANyc+ZDJZnGD9x7ZIdvhUTNL5o9zVgo2
	 dUCJvcA8BMhPGBC7GSLqxNNS91rYoFpcmToDwJ/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBF22F8058C; Wed, 31 Jan 2024 15:12:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC659F805A1;
	Wed, 31 Jan 2024 15:12:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5054FF8055C; Wed, 31 Jan 2024 15:12:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCCDAF80149
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 15:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCCDAF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=P5dU+G9X
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-4bddb27e90cso1403067e0c.3
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 06:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706710326;
 x=1707315126; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fy67XFG440oNqKNoOyKdiRXwM4wMoj/X9XerGknRkFM=;
        b=P5dU+G9X+AHFvGuZFQR1PNLLlvhuADeZVJNtq0ucjtXxkQVYu01Ev3Knp/8I2GtJ6X
         wB0vq1yZm1+Uw70RxT6ZRwgRl2KNrAko1Lz4SOB3Da5H1kQFAjCihXPD1+ELFUfl43J/
         FmhvaDJScnqTX1OCzzkUt+DKyCbAi/TVcFVScG4Pw4f5gL9kfkkOWr5C3eA9tSHigazJ
         FV3+g5k4/opkEChX6gbdCHW8dXR4nm0J6YxZCMna6QFSKeSOPp3aIgiMQ6Q6ADFnXA0f
         d2LWmjq1kfylPqVvOBnsLoH49NRfypmpTY5luqgwRHOgCmfeQVn2nIhBhsgo24f3zYEf
         3Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706710326; x=1707315126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy67XFG440oNqKNoOyKdiRXwM4wMoj/X9XerGknRkFM=;
        b=hKyCCp46ZzRjb6ExBgZ7Rh2qz+5P068ul0wk08kvoBHtsi3Vu/mQ+HY4rDyLqJ79XH
         cmkdeILh+PSJj/DtujWgL/zI1cQ+LatD2LSQzhm3Jq1YFeueW0/HoyC0IzYUOy+Cz1tJ
         uBdCMQDqW/cqag2MHUGzwwlB38elwyycIWWLWa7fhqAez0vgkgGgOkRnhilvN1jSpNHb
         VyLOeQkI9X3OiS5CDOeplQcOMIoON3801pBSKR9yLZBVerKbDZnqhz8RnAxdrZHdTi7H
         rojQYbZe4tqT0cNngWDQOBWKRM4h7tGJDcRDkKXmdijRShJylPfL2tyRRuL48FzoKicU
         0Mdg==
X-Gm-Message-State: AOJu0Yx8Jry16lpVlxoVimQfcUCNycn+QlApni9gZTN9EDAjbIXC737/
	aKDaJsccodSK5Sg0SMNazVVAYEcLGhr5Ge4gzo8IND2o8sSPnwvuhvkAUcElzuEFUrMQGbbWvwC
	s9RoSku4uFUJr8hTZRm7UVqLxfANqgcbX+98/7w==
X-Google-Smtp-Source: 
 AGHT+IHw+5LJCo4zP77ngTsk1zmxdOx6fkUQPNqVAurEYXrfnmeT5FR7RaZ6Ra6HK3KzPd2ohkdgXC4v/gfXwwIUBNk=
X-Received: by 2002:a05:6122:179c:b0:4bd:5328:b20f with SMTP id
 o28-20020a056122179c00b004bd5328b20fmr1596779vkf.14.1706710326488; Wed, 31
 Jan 2024 06:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
 <CACRpkdbaxqTzwL9L02vCpMMdBYsubNP1VkNuJ8mXB_=4E3Kjaw@mail.gmail.com>
 <5ef64082-0b44-4bb2-bd4c-654c96f4a9bb@linaro.org>
In-Reply-To: <5ef64082-0b44-4bb2-bd4c-654c96f4a9bb@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 Jan 2024 15:11:55 +0100
Message-ID: 
 <CAMRc=MfNNdJzbxsihNd94LhqzhZiL2H2-z=grEFoNmOxpua5JA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
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
Message-ID-Hash: AOURFIFJ2K4MM6RNBJQU2XOK4QYASMVK
X-Message-ID-Hash: AOURFIFJ2K4MM6RNBJQU2XOK4QYASMVK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AOURFIFJ2K4MM6RNBJQU2XOK4QYASMVK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 31, 2024 at 2:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/01/2024 14:17, Linus Walleij wrote:
> > On Wed, Jan 31, 2024 at 10:37=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> >
> >> [Me]
> >>> reset -> virtual "gpio" -> many physical gpios[0..n]
> >>
> >> This is a different problem: it supports many users enabling the same
> >> GPIO (in Krzysztof's patch it's one but could be more if needed) but -
> >> unlike the broken NONEXCLUSIVE GPIOs in GPIOLIB - it counts the number
> >> of users and doesn't disable the GPIO for as long as there's at least
> >> one.
> >
> > I don't know if the NONEXCLUSIVE stuff is broken, if you mean reference
> > counting isn't working on them, then that is by design because they wer=
e
> > invented for regulators and such use cases that do their own reference
> > counting. It's also used for hacks where people need to look up a desc =
in
> > a second spot, (perhaps we can fix those better).
> >
> > As I say in commit b0ce7b29bfcd090ddba476f45a75ec0a797b048a
> > "This solution with a special flag is not entirely elegant and should i=
deally
> > be replaced by something more careful as this makes it possible for
> > several consumers to enable/disable the same GPIO line to the left
> > and right without any consistency."
> >
> > I think for regulators (which is the vast majority using it) it isn't b=
roken
> > because the regulator reference counting is working.
> >
> > So if we solve that problem for reset, we probably should put it in
> > drivers/gpio/* somewhere so we can reuse the same solution for
> > regulators and get rid of NONEXCLUSIVE altogether I think?
> >
> > The NONEXCLUSIVE stuff was prompted by converting regulators to
> > gpio descriptors, so it was for the greater good one can say. Or the
> > lesser evil :( my judgement can be questioned here.
>
> I discussed the non-exclusive GPIOs with Bartosz quite a lot, who was
> Cced since beginning of this patchset, because that was my first
> approach, which was rejected:
>
> https://lore.kernel.org/all/b7aeda24-d638-45b7-8e30-80d287f498f8@sirena.o=
rg.uk/
>
> The non-exclusive GPIO was made explicitly for regulators, so it is
> working fine there, but it is broken everywhere else, where the drivers
> do not handle it in sane way as regulator core does.
>
> To make it working, either GPIO should be enable-count-aware, to which
> Bartosz was opposing with talks with me, or the subsystem should mimic

For the record: I'm not 100% opposed to the enable-count-awarness of
GPIOs but don't want it to be the standard. I'm open for introducing a
wrapper built around the core, low-level GPIO API but I've just
dropped a big patchset addressing the access control and serialization
issues for the GPIO consumer API and I would rather work towards
making it at least more-or-less correct in the first place before we
start overcomplicating it again.

Bartosz

> regulators approach. In some way, my patchset is the second way here -
> reset framework subsystem being aware of shared GPIO and handles the
> enable-count, even though it is not using non-exclusive flag.
>
> Best regards,
> Krzysztof
>
