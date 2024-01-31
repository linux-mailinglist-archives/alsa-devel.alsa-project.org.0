Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3658439EE
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 09:58:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F6C314F2;
	Wed, 31 Jan 2024 09:57:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F6C314F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706691485;
	bh=i/0xGVWxmLGZ/l4MKKj0oTxK2I+o2zUxh3bsKs/n+Iw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O+gYW+eqlPoa2YVaVNNa4/tvPxRb15Oob1rCupeTy9nEdPWDni0moyBCP2vaG3kDu
	 DBLFhVEMQPdkrZ07seh6F83C8cP6BxBdEhf+8GriMjqqW+IjJ59zN2aA45MqBT0laZ
	 bZ0/vzoDj+YDBaX7O59ZTj+sT2vr6ttGK7ZJQPx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D551F805A1; Wed, 31 Jan 2024 09:57:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C61B6F805A1;
	Wed, 31 Jan 2024 09:57:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2E5DF8055C; Wed, 31 Jan 2024 09:57:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0038F804E7
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 09:57:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0038F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=znVPll+T
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-dc6b69f0973so710603276.2
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 00:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706691432; x=1707296232;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19iyMKPgVV/OnzcKafV91f/kV0b2fJZ+DHL/skL3AYc=;
        b=znVPll+TFy3BgGvtV+h+Nd80S5fQH4bs/54LIpWkBpw1cp3thUu5m6i5XtkshaX75H
         lhSjJ2Dl5DOU2PIIpS0pWAznwzUUYSA3wJ//zFQs0nv+21vTM5j4RWXfGJNB5vT7+KCF
         skuJdsXFG+UGP4GfEHIRT3YvYpVJf4tPcG+PUpOSPxW7mtv6bCRw7ULG5RoIwKP6qoXh
         R2i86ofMSwKJr54oru3LLbdbIkordMdF3GIWLDhOzjPHo/Fh7M+pv8pZKE2cy4QB3XW0
         HWolCtMb1bhuS0CPLxM9s0DTzBl19JgwUMcjOqL+hFP1EYnbd+RLy9WVQcvqOSiOH/pL
         UKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706691432; x=1707296232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19iyMKPgVV/OnzcKafV91f/kV0b2fJZ+DHL/skL3AYc=;
        b=i6/OIZCcWQc80n+v+ruTjCSyWHAmJ5JtYZ1LhQcUT/iZBnVJFGUj6sH1H0ysi0QDr8
         lr+f8yMuPJerpZwyqa86R3MQtzqYe3AnmsGk2JMX75WxrMPvNOcZmL3+rBPN0boqD1L8
         MRP4IPa0RmXO66jYpmtoMS4wtNg7fkqFwGFU9JcFeSqIPf7Q1on6v/u3Cbjg8Fq84KAi
         Ee41GI7eSUCiskzZNjZRiENdQFZbjlWFBg9UBSU7OOeVdZQmpbhxGtkeRI04bPB69mUc
         ClXgHcZG4wfwzRzBPtO125kH6o7QzE0QljlyKp3R7J7tTplVGSZsQ0CvHS0RelyM/Fwa
         Nutg==
X-Gm-Message-State: AOJu0Yz4tF3tRR0EKYhl/Y5Mrpe9lhB/7/7AZkEex+Gk2+AkbrfC59bI
	mxCsLjVM2iXvkbkJw7M7kdFkIMCloLUNLBr2Ha+fRhvP55EzFkH7gsc08KNrfYVco/iVv/j5hDB
	eQh9mUxe/fqf7QPypmb9+Ek0lC62of5ppuN/jaQ==
X-Google-Smtp-Source: 
 AGHT+IF+kfDZ/YF7mxYh80knn1UBEiVlr7hp7DfiTZ/EqM7NpiukfxSx7V7h2n9hbAXhnmqW7UvF5OBBTxTaOE6Q4vE=
X-Received: by 2002:a25:7904:0:b0:dc6:7e97:ae62 with SMTP id
 u4-20020a257904000000b00dc67e97ae62mr1105679ybc.21.1706691431753; Wed, 31 Jan
 2024 00:57:11 -0800 (PST)
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 09:57:00 +0100
Message-ID: 
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
Message-ID-Hash: G7UZZ6Z2NU6CKLGYXYZQ3EMBJI4CUSLZ
X-Message-ID-Hash: G7UZZ6Z2NU6CKLGYXYZQ3EMBJI4CUSLZ
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

something is odd with the addresses on this patch, because neither GPIO
maintainer is on CC nor linux-gpio@vger, and it's such a GPIO-related
patch. We only saw it through side effects making <linux/gpio/driver.h>
optional, as required by this patch.

Please also CC Geert Uytterhoeven, the author of the GPIO aggregator.

i.e. this:
> 2. !GPIOLIB stub:
>    https://lore.kernel.org/all/20240125081601.118051-3-krzysztof.kozlowsk=
i@linaro.org/

On Mon, Jan 29, 2024 at 12:53=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Devices sharing a reset GPIO could use the reset framework for
> coordinated handling of that shared GPIO line.  We have several cases of
> such needs, at least for Devicetree-based platforms.
>
> If Devicetree-based device requests a reset line, while "resets"
> Devicetree property is missing but there is a "reset-gpios" one,
> instantiate a new "reset-gpio" platform device which will handle such
> reset line.  This allows seamless handling of such shared reset-gpios
> without need of changing Devicetree binding [1].
>
> To avoid creating multiple "reset-gpio" platform devices, store the
> Devicetree "reset-gpios" GPIO specifiers used for new devices on a
> linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
> controller, GPIO number and GPIO flags) is used to check if reset
> controller for given GPIO was already registered.
>
> If two devices have conflicting "reset-gpios" property, e.g. with
> different ACTIVE_xxx flags, this would allow to spawn two separate
> "reset-gpio" devices, where the second would fail probing on busy GPIO
> request.
>
> Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1=
]
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
(...)

In my naive view, this implements the following:

reset -> virtual "gpio" -> many physical gpios[0..n]

So if there was already a way in the kernel to map one GPIO to
many GPIOs, the framework could just use that with a simple
single GPIO?

See the bindings in:
Documentation/devicetree/bindings/gpio/gpio-delay.yaml

This is handled by drivers/gpio/gpio-aggregator.c.

This supports a 1-to-1 map: one GPIO in, one GPIO out, same offset.
So if that is extended to support 1-to-many, this problem is solved.

Proposed solution: add a single boolean property such as
aggregate-all-gpios; to the gpio-delay node, making it provide
one single gpio at offset 0 on the consumer side, and refuse any
more consumers.

This will also solve the problem with induced delays on
some GPIO lines as I can see was discussed in the bindings,
the gpio aggregator already supports that, but it would work
fine with a delay being zero as well.

This avoids all the hackery with driver stubs etc as well.

Yours,
Linus Walleij
