Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8497E72A2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 21:08:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B8E774C;
	Thu,  9 Nov 2023 21:07:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B8E774C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699560509;
	bh=I1fVX8uMEWLbngax5RO9Mk3Spu8E+gbeLS6hzF34F4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KakX5tpO6PiEZhHXkJekwZKT0Mu17eATtj2vKWD1mqjxwLrC709yy4SZYiVZ5pkv5
	 Y2iHYx9cOVOMbAwkwpRYdQndMwuvQrbKe1PrP1Grg/jSpTMl0933zpCrBvpk4WHQ/S
	 nUz6SiZVvhcufaEg4oLJDs+C5+/WRpYfPh0Z9bLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD689F80549; Thu,  9 Nov 2023 21:07:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA85FF800ED;
	Thu,  9 Nov 2023 21:07:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EAC4F80169; Thu,  9 Nov 2023 21:07:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FE06F800ED
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 21:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE06F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=klrN8k7P
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-59b5484fbe6so15318367b3.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Nov 2023 12:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699560421; x=1700165221;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxfBT9XrSRT5nrDSafWJh9sd+I3zu8gAVwzWVP+isuk=;
        b=klrN8k7P7GqjFkqq/aDBCKm/Acl32Y9aTzj1GP3TA6qdcwOwTUzp+NJqVdMM4Ai566
         SIuVO3k7aVg5OrrTAbEpTG0ji9fyRgu0fJ8bocjlrvu+qRDKL2c+qrF6ZMYyhTtjDv8d
         sfGikX21Z5UrDFRRUFQJCUz7nPkjr0m8oxwQaTbzYXTJ2ggbXPfB+7/OPlarwrw0A9yk
         v1/p0PrPsa6IASfYkrV4N6+fmTD3Dqar1Fs5UsyHFb6Dq8omBjn+2FDm2piTQmW7eaPb
         laOVqtneay6AbEv2zwnkI3QXIc/enzdaoepitqygg1175NG28D7RN/o7FjrS8jgiqEbg
         Gv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699560421; x=1700165221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxfBT9XrSRT5nrDSafWJh9sd+I3zu8gAVwzWVP+isuk=;
        b=KcdubxTLprBuMIluNEJoTcGt/o0WZbZhzW8tGbC3pnBTQnNmst2jwtmtbIC1h3W+iQ
         3O/AoXXGadxQsGrd2Tl27cNUaealRBYLuIOcKK3PqIPVGCJj1P1AdlF06UWHHdYHHd6Q
         yW9jYHyJj1ofGbcnJ10cwfEgH9JoqI2wP11J3VwDSIC1zEfjTjbf3R3psnFF1OHw3QcO
         V0JgeTZBGvWMz9jj5MP9VI6F0TWNiGXGd1GoGpVwA8q/BmA+kNsHIhNKU11XfGK826S4
         eBv6julcW0z53VfmiGZNr6EfbZFRY95NcFyC+tXFqGQScCEv2tW1gYohDYGBcSq7F7mc
         J6yA==
X-Gm-Message-State: AOJu0YxznZC+xAk1zeMOrK2E7EXvtzMJkJSikSA70onprEpyByZaMERB
	5RjubusNz6H/1sbS0zNvtFsjTHXE/Sghfqt9p8OyCw==
X-Google-Smtp-Source: 
 AGHT+IEXBKt+FURrtNfddWlqR3gL5F6B4MyNTpLeCgYWcpg+lWu9UphB2hG1mn1lgkc9/kt9ZZeKnj4In3j2CaEDK+8=
X-Received: by 2002:a81:df01:0:b0:5ae:c35a:807a with SMTP id
 c1-20020a81df01000000b005aec35a807amr5649968ywn.48.1699560421299; Thu, 09 Nov
 2023 12:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Nov 2023 21:06:50 +0100
Message-ID: 
 <CACRpkdbAwOfjbD_CjC4Aqi_A2+pghTBeWyV7mPMZv25BXMPStw@mail.gmail.com>
Subject: Re: [PATCH 03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add specific
 compatibles for existing SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VLBHXW3Q5NT66RLEQLMWMTEUNFEMNA5T
X-Message-ID-Hash: VLBHXW3Q5NT66RLEQLMWMTEUNFEMNA5T
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLBHXW3Q5NT66RLEQLMWMTEUNFEMNA5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 8, 2023 at 11:44=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Makes perfect sense to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
