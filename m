Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3AF843FB7
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 13:51:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB1CBB76;
	Wed, 31 Jan 2024 13:51:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB1CBB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706705499;
	bh=yebtIyQCYDZ5e+sLn4mg7pl47yIXsLOdVhcRWu+i57I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uTwuOoObx2k3iJRpgyDZ475nJ/HciiuMBKI1Dqcl1NDib51REIRrHq4lJhJvraVM2
	 U6Qy2TfmtGazA45NAedTWSUp9vYdY4nm74B6II9mbqweeO+ocSi4NoDhDRh0RVr46C
	 16BpLol5Kn3rcQh6HlayZbPqVnP5O/CZOTeBtKkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02997F805AD; Wed, 31 Jan 2024 13:51:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 750C6F805A8;
	Wed, 31 Jan 2024 13:51:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20C3FF8055C; Wed, 31 Jan 2024 13:50:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63CBDF80149
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 13:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63CBDF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bspRkv1l
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6040d33380cso6074647b3.1
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 04:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706705447; x=1707310247;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yebtIyQCYDZ5e+sLn4mg7pl47yIXsLOdVhcRWu+i57I=;
        b=bspRkv1lnS62s00xEHaV6I/qnYn10Y7Eve40VxfXgNVu2euMSTPf+37CcVu3A0qGId
         1PLgOREaRowy0yPE/lCNoWn+KNEXeXWRPMYfZfRlO+TzAtBdWTrPTD2eUtIreATxhgfy
         v87E4tJCQm7VfNhclQtOjbne1Bt3DzDdlAMIx8/K91ZNwVXO9yuJARaeYDBS/lI4ZSWg
         q61IIuGrIVwcva00xbL6BH5h/3VikS/tlPGoJtXhv4ayDQvqJ1lr2ZwD6fhrGC7FYDN3
         Ly4qvrdUXZqRRy9W4IOH5pjCVKJ3KjTWVORKaF53GLEt+XZhp9um64bnrNwhQx41zbWC
         zxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706705447; x=1707310247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yebtIyQCYDZ5e+sLn4mg7pl47yIXsLOdVhcRWu+i57I=;
        b=jiBYVopiEn0chNF5w7AYfAPI2aQeYwIUi5pJyahGdv7T1cRF618WIiMJUBBe43N3W/
         /Wdx7ZQPv/FXOP80K5twoPzS15mRWfr1LfuzFmG68UENgz3dF0ClPBt/PIjZgjvnojSC
         gZnId1kmSmwWw1+P0UhDd5fhq8fFuueTezInnOV/C878VhEw34oOCU6Y0RYvRB1iMnex
         JxHKdbox6ORQV8yiA6PndUdCQ694CrSH4PnupZGoAc5rYehe50vjnOYxlfekmrA8N2Bl
         ecKtu1NQwZz5mzLSRDSEOdV49WQNlnqnYYDFWj8NbB7b1frZygjMKVUGEE7HpkcuwM6F
         xgoQ==
X-Gm-Message-State: AOJu0YyEkYpHtJ7Qfbkune9JF6yuJH9Wf8cD5V6f6PtsMDj1n2IHRIQ9
	YTtlxW2MDRWXAvy8HdS6a1SEFYXgwhykZEhOVCA/kQrpNvDKVyedHmtXWWowWhZenX8WdCAu9lK
	z+NFrpNu6G7fkiSA9fV/Svk9lPNTHD627Xg5A4A==
X-Google-Smtp-Source: 
 AGHT+IFRSU9w1zRrdHbJcJCYqCSrYAoOV1MiQgaqBk9Y+Gvph7b4F0E+eyUKljpNB45qUnX3uDUarVJh+rLHzPjrEnc=
X-Received: by 2002:a25:6943:0:b0:dbd:7491:368f with SMTP id
 e64-20020a256943000000b00dbd7491368fmr1373182ybc.7.1706705447230; Wed, 31 Jan
 2024 04:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <6473952d-893d-4591-9bfd-dd983313bee9@linaro.org>
In-Reply-To: <6473952d-893d-4591-9bfd-dd983313bee9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 13:50:35 +0100
Message-ID: 
 <CACRpkdZ6GH94EdBsoB61FbEW5dV1+dRCV9O7TUFCMBBdVJBPuQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
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
Message-ID-Hash: 4ZGSLWRMIZYAYOWADLBMVKOLHSNLFC3W
X-Message-ID-Hash: 4ZGSLWRMIZYAYOWADLBMVKOLHSNLFC3W
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZGSLWRMIZYAYOWADLBMVKOLHSNLFC3W/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 31, 2024 at 10:50=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Nothing is odd - I use get_maintainers.pl which just don't print your
> names. I can add your addresses manually, no problem, but don't blame
> the contributor that get_maintainers.pl has a missing content-regex. If
> you want to be Cced on usage of GPIOs, you need to be sure that
> MAINTAINERS file has appropriate pattern.

I think that is over-reliance on tooling, I think if I author a patch
creating a struct gpio_chip it's natural to CC the GPIO maintainers,
just by intuition. Maybe that's just me.

I guess if one wants to automate maybe get_maintainers should
CC GPIO maintainers on patches that has a + #include <linux/gpio/driver.h>
in the patch body but it seems like stretching it to me, it's just too
much process.

> > reset -> virtual "gpio" -> many physical gpios[0..n]
>
> It does not, there is no single GPIO here. There is a single reset
> controller, though, but still multiple GPIOs in DTS.

Aha so this is problem similar to what regulators are doing,
where they had this problem that a single GPIO can contain a
regulator used by many devices?

There the solution is something along the line that the first
consumer turns on the light when it arrives and the last consumer
turns it off when it leaves, at least that is the idea.

That solution isn't the pretties either :/

But if we find a solution for the reset controller, it appears to
me that the pattern should be re-usable for regulators too?

I think Bartosz says in another reply that *_NONEXCLUSIVE that
the regulators are using is broken so if we are to invent something
new we should make it available for everyone.

> > This supports a 1-to-1 map: one GPIO in, one GPIO out, same offset.
> > So if that is extended to support 1-to-many, this problem is solved.
>
> It does not match the hardware thus I don't know how to implement it in
> DTS while keeping the requirement that we are describing hardware, not
> OS abstractions.

OK fair enough I got it wrong.

(the rest of comments are probably fallouts from the misunderstanding).

> So none of these ideas were posted in previous threads, just because you
> were not CCed (except one thread)?
>
> https://lore.kernel.org/lkml/20191030120440.3699-1-peter.ujfalusi@ti.com/
> https://lore.kernel.org/all/9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.o=
rg/
> https://lore.kernel.org/all/20231018100055.140847-1-krzysztof.kozlowski@l=
inaro.org/
> https://social.treehouse.systems/@marcan/111268780311634160
>
> Please implement some custom lei filter, so you will get such
> notifications earlier. We keep discussing this for many months on
> various attempts and this specific attempt already reached v6.

Yeah I should really look at lei!

I just haven't had time to get into it, because it appears it appeals
most to people who use local clients like mutt. And I use gmail
(yeah ...) I guess I would have to change my whole workflow to
accomodate for lei, but it may very well be the right thing to do, I
did change everything for b4 already.

Yours,
Linus Walleij
