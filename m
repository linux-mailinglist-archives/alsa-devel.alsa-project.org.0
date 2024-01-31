Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8807C8440E5
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 14:43:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18A71B71;
	Wed, 31 Jan 2024 14:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18A71B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706708592;
	bh=rNDiQg/0u3pLXkbL7csdAnsOg1ou8bFEsbWHOOg35m8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cOpdUUlp59t/2IkCeNL+ekUHIP7HvEoZzt/BRURDnBjhbpsx5B2OmT+uAm0mCUtMm
	 XpnhCsauHIltBsy6uOvab7v5XLHn2UQ04hE4BzAJ86O0hjJgkclH+h2EmC3Bbd4Yg4
	 pPAC7JDkluy8peVGCmVz40eYTkZixsL4WBgO5YqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 519FAF8055B; Wed, 31 Jan 2024 14:42:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6179EF80568;
	Wed, 31 Jan 2024 14:42:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 446C1F8055C; Wed, 31 Jan 2024 14:42:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64B07F80149
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 14:42:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64B07F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B3Ycaz/2
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dc6a631a90dso1447206276.2
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706708549; x=1707313349;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNDiQg/0u3pLXkbL7csdAnsOg1ou8bFEsbWHOOg35m8=;
        b=B3Ycaz/2oMfQAhnZwhi+hOy94iiV7OdVWjCJ0y14NPLoazcpOYM5uJQ7iCWBLbulGn
         7wC5ST9CdzKi6E6XuTs3h89xla/YnumXPiMYV20y4XsZcovahiF7JBWg/sVZJWwjRo+j
         DkYOF098rBiCH2hkKOJ2uFQ+SaCQeiVpBDdZ/AClcrmmSVpqPjTfQWcaKSOGns8ywoZ7
         MN3CbLcx1OMFJtpuXPYnkI3OVPprZY0EnCl1rdCeAkbIYA11auvxTE0RGpexRMT/iJ7Y
         Ep9tYKYEfkmV4q2sfMzGcMvlH81mGnpBQu961Nu8yCETLtUXXI+8zh9YcQS3iY7lw5ug
         5Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706708549; x=1707313349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNDiQg/0u3pLXkbL7csdAnsOg1ou8bFEsbWHOOg35m8=;
        b=W9VCEQmj8fimyodNRvhSSdNLK+UcRP8MdUbYivC+PrPpTFWRfi+2DDlYbom4nmvnau
         NRKgeqCcj/WxybA5TOUeVW2mlC+h1+LYVe5nfYjBWsc1DjCKsYP++v6cyIA31/PJSjXz
         LEFxuR6JINwhrnny7SiJ3DjC/4/tYPWRKPnfCq1LK4ZcgkfM+w1S8zN3nwAGcFL7IZ60
         pIdoQM97ZQBa6zdRY4Pcm6ClSJQZS1EElENGz0E9it/d2R79Mfv4yGQMiz+l0nXAuZKd
         kbD+1OrRPq1+32t3SIOey4ckuqDD8GrFNat8feIEaNjrdCPYmGQFU76AJQc6gMzrQZac
         EsXQ==
X-Gm-Message-State: AOJu0Ywr+bFsvHKBKlLysDpreLFV9M5bt+I+jdB3SV0F+As/Bb8CG+sc
	VXM5FoeY1RljPF7gigC22Lps7NtDjWxfRH6cMeNZ+c2fcNmc21EJuWnGvdkhao+0XfiC0YTAcCS
	sBo5lv2WtnUP5SHDNr8Cml83oZlxyZL6Gkvi3ig==
X-Google-Smtp-Source: 
 AGHT+IHskTXYXxhxPI1CgyG/kvHZeTnVrHblP91LDRSUCVYbyamup48H0wM9rtBK+kf6LdjtM5XNyL3x8PSddYdkrYk=
X-Received: by 2002:a25:6f83:0:b0:dc6:4b7e:d7e with SMTP id
 k125-20020a256f83000000b00dc64b7e0d7emr1623063ybc.24.1706708548654; Wed, 31
 Jan 2024 05:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
 <CACRpkdbaxqTzwL9L02vCpMMdBYsubNP1VkNuJ8mXB_=4E3Kjaw@mail.gmail.com>
 <5ef64082-0b44-4bb2-bd4c-654c96f4a9bb@linaro.org>
In-Reply-To: <5ef64082-0b44-4bb2-bd4c-654c96f4a9bb@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 14:42:17 +0100
Message-ID: 
 <CACRpkdYa0nj6PK1FecBpQfOfkXhetwRmAyDgWNjJxcf4xgExMA@mail.gmail.com>
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
Message-ID-Hash: BICMTRENPNRONID4QGHQR6Y7WVFRR3XQ
X-Message-ID-Hash: BICMTRENPNRONID4QGHQR6Y7WVFRR3XQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BICMTRENPNRONID4QGHQR6Y7WVFRR3XQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 31, 2024 at 2:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The non-exclusive GPIO was made explicitly for regulators, so it is
> working fine there, but it is broken everywhere else, where the drivers
> do not handle it in sane way as regulator core does.

I looked at it, it's 8 users in the entire kernel that aren't regulators,
so let's put it on the TODO to get rid of those.

> To make it working, either GPIO should be enable-count-aware, to which
> Bartosz was opposing with talks with me, or the subsystem should mimic
> regulators approach. In some way, my patchset is the second way here -
> reset framework subsystem being aware of shared GPIO and handles the
> enable-count, even though it is not using non-exclusive flag.

That's nice, I was thinking if it could be abstracted so the regulator
core can move away from this too?

I guess it may be an issue that regulators are not using Device Tree
exclusively, but also has to deal with a slew of platform_devices:s :/
IIRC that was one of the reasons why it looks as it does.

Maybe reset can only solve this in an elegant way if the solution is
tightly coupled with DT and you have the advantage that you can require
it from day one? (It looks a bit like that to me.)

Yours,
Linus Walleij
