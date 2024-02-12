Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E09851EE3
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 21:48:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FE231CF;
	Mon, 12 Feb 2024 21:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FE231CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707770931;
	bh=sMYBJYjLm8YsiiGaWfwhHa/Xio+UaZ439FcuhwQ9JVg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vqIY7rUUyhplOD0CEl+da4zm1IVF3Y4Rpkz3qQrXl+tB2k6fF6pZxtDFF4SGBmevN
	 kwnNG8/EM2uyk25i4E6y7Vnucct7HpUzh93QYpVMf6dBKMveA4fXMq/YXoLVNtQQ4j
	 MEvdFvTuJsXBrRU2rkymOTFuJU6leUOyGary+lhY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F05C2F805A8; Mon, 12 Feb 2024 21:48:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35B88F805A1;
	Mon, 12 Feb 2024 21:48:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1C4DF80238; Mon, 12 Feb 2024 21:48:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E216F8015B
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 21:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E216F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y8KQzbcq
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-dc6d8bd618eso3702148276.3
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 12:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707770881; x=1708375681;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY3cqSsBwNpTxKZXjc6hWsn0tIs/KUkTAVHRiL48yE4=;
        b=Y8KQzbcqsRQoMW+0o7pyb5SLnxN3rlurEnToMhk4WSxYI6dg+VDoEskbDp8FsQppqv
         MLuTlXe/PVoqay5tSVu0ZcSj/79FoMLwsDoA/BaEV0poApNnKHW8cZJoZq7PfYupQuX7
         mOWeiS1OkjH4cpvP45KorUKLJ8/GpbJDvTq7RThVTJGfiDHsSVdn7qignMu9Kmz2L231
         dZhltMuwO1eaj4qYxCLyDdgNxtgk6x4rU2d9skm9saXs0uWU8uP3dg/lNWoSLlaSkN1Q
         ImuF3y8rSMmJrSSMMrGGucCAlNGeuX6qwcusE72qyqGCcKNQUBvFqfq1SHvSc57vtIhb
         kqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707770881; x=1708375681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY3cqSsBwNpTxKZXjc6hWsn0tIs/KUkTAVHRiL48yE4=;
        b=GWX8uycn/wxpJFoXzzsmQ5VzQEGOXYuiqLguOCgRy1sBsJ83WkqKJ6U4S03KGLC8HA
         +oW2K7oLRapqWFWie9HK1psbugug+iMU9GMYpw+HklIfFJ8H3ZnNiA8NOaB2P3eP3Bpl
         kYrqA5trA6dcMbHGpHYXIYXx7a1dLKPrrz1aFvuj5o4kbMOIOYCgX5ayjcpa4s3VwZyN
         aV9kfH+VvbBu1jAU8Aiu8HrES9wLTKNrEZR7a8+wUmVLGM0qItud4AnM8Lqzys1sNg1v
         FwpdM12usrTYR2S80iY2KXQL1+oJLvtqC9lCe5G59/9EdZAQvpwhTbrdRDu4aStM9V7k
         sh+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+2lmkIr6TvQKffhR0r2zAbCDz/FJefEoRIJydN6SUHaRSqpMkzqSyisaayrC8xPRlCSMHjdJQ2raOyes7+m4M0K1k0Wp9jBcIpgs=
X-Gm-Message-State: AOJu0YzW3htbEGNrJVaXzs0QFPeDgyOhwKkUXdF7j/HqwDxjlatRJWoo
	GqfXqkk70dexNU+CjjovHiLAVP48khkxW+ehs1MgaDoMFFGlvkFAVRUP5xdG4qrR3uvrv/ANv2O
	dDh+t4pxNoh1VDH7FzZmmM5QZaoKFh2qpxsOuEg==
X-Google-Smtp-Source: 
 AGHT+IHpuGZC6SrLdNnZki7WawOfEUwxb557/rUhxkGHMzuDzurgn+uKQ9WrdUdXaiN7gnBNgrqdYeHN6a/77FI22dc=
X-Received: by 2002:a25:ad82:0:b0:dc2:2f4f:757 with SMTP id
 z2-20020a25ad82000000b00dc22f4f0757mr6478822ybi.7.1707770880839; Mon, 12 Feb
 2024 12:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 Feb 2024 21:47:49 +0100
Message-ID: 
 <CACRpkdbMFHPK0SBSxiZ3FOqChQFCBdOny0yYG--6V+1S=CKgiw@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
	linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YZWWYV3IBHWDXWU4YCGDTTCFQBBCVG7F
X-Message-ID-Hash: YZWWYV3IBHWDXWU4YCGDTTCFQBBCVG7F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZWWYV3IBHWDXWU4YCGDTTCFQBBCVG7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I can't think of anything better, that is reasonable to ask for.

I feel slightly icky about the way the code reaches into gpiolib, and I thi=
nk
regulators should be able to reuse the code, but unfortunately only the day
they have no board files left :/

I do feel the core code handling "reset-gpios" could as well have been
used to handle "enable-gpios" in regulators, just that the regulator code
has more requirements, and would be really hard to rewrite, and deals
with descriptors passed in from drivers instead of centralizing it.

Like regulators, reset grows core support for handling GPIO for resets
which is *long due*, given how common it must be. We really need
something like this, and this is certainly elegant enough to do the job.

Yours,
Linus Walleij
