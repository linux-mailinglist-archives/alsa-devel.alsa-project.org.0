Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9023B8B971B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 11:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 222D8DFA;
	Thu,  2 May 2024 11:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 222D8DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714640662;
	bh=lEtKJxXSlmQvsqd7yCKAQ50PVGAGqW5J4DYlQOjkAc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hYRDdTzhr6WTJ5t4AS+q08Oqiw0LZi5zi80k+44C6LGF7WhtmucoB8bjhS2LJD8CO
	 UhNyiVyKhtyuiBu8StFKGHcTBmOZWh56EcAjHTDlTC9TKVOUlvBU/AqHay2dkeBnJI
	 epPO6Q1SDVIquAu37oUfFTcRyE5Ws3UWMQLP2Jgg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08C3FF8057C; Thu,  2 May 2024 11:03:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D36D0F800AE;
	Thu,  2 May 2024 11:03:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B50F6F80266; Thu,  2 May 2024 11:03:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2F49F800AE
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 11:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2F49F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DcXjggBL
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a596cb8a7dbso44578766b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 02 May 2024 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714640606; x=1715245406;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEtKJxXSlmQvsqd7yCKAQ50PVGAGqW5J4DYlQOjkAc0=;
        b=DcXjggBLe55xFBM4SRhVs+iOYXY7xhzBJRW3yJVSEXwgjbb5yIL2QLmwNwy6hH75f+
         TkGsOgcv/nE6i2xftarfDk9sfcApeQbrh9emb4rp+ddTXdOSDmpf0hAU0rDW2/cLZ4Ca
         z9CcRKNu2D0G9ggC+Joxm/0YbElzvqH4pIgqzEZY8QvF/R5lzx1OI4+BeCxir75ZyJn9
         Mils0hDOL3djyp1QhX8HgvIHgc0yuowb1Mnhhyudc8tpoSICM59pexwzeDNDnZXdXUBF
         mcJ0SRn6HNccffYsfl2TdzRFMqe+VX5i54xvTW0g4uIy4QzmqyslV/9B5fPpq4E7vJz6
         Chcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714640606; x=1715245406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEtKJxXSlmQvsqd7yCKAQ50PVGAGqW5J4DYlQOjkAc0=;
        b=czRq8u3qPs1hfB1JlIzQMk0mNq8vWTjlb/xViM8CeEu1yiFpxy2ZXIWdIZ5LzfKkiV
         Jaqfr6kt4LxtmvvAOytG/fqvbBKCDuR5DmdPCXucEiZNjWB886HWNDLOazRvVf6D993E
         ibwrXndIBSj3Po6svr5BUZN3WcG6LfJbOixKL1OU2Ly5JLxFXkcyfOs/YBQmnYIoOVUM
         uAqjlUnKQLzh0mfn4AzqfqG+PMJAOYSwsk+neHumNAXQ8oSdRGy1JTFFpz68Jq110OtY
         w2f7sTdqoyY6H5zRhS1reOASwV63Lm7NJ1Vqsj8bV6XzOFqaHX5lIXcEHTHXN/hceKNx
         zXkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmHRnC9udG9A2uRan4yGQVsOw82KVh8AA/zQJU2jfpBn9cKuyZecoAbQz8VRAx2/kZShOc1tsJ2oOljx9OguJcXgfkGbXHSQAxuv8=
X-Gm-Message-State: AOJu0YyQ6dtA6nGHyewUHp9M8P7wvOV6/oPh9QMimmaSzn4EBOKP4MXJ
	Yl7fQEs4fJ8kZ27WsaD8lwF2YAUWX/U6oSruYAIsaTXejLceVyGx+EPtgJb8L/M1ZOwn4ctlNCa
	gr0EeYkm7jPXwAPNZVO/AzWm7uqU=
X-Google-Smtp-Source: 
 AGHT+IGw94Wmij15AjtKfmzjYu/+fDi97bU83JzDlqFnLK4MVTKfhR6YGZCnHgrja/O5jnNNaC6YaeBpl+sPbJB9VJQ=
X-Received: by 2002:a17:906:40c9:b0:a58:e4d9:618b with SMTP id
 a9-20020a17090640c900b00a58e4d9618bmr2903169ejk.19.1714640606290; Thu, 02 May
 2024 02:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 May 2024 12:02:50 +0300
Message-ID: 
 <CAHp75VfTzbQaU-i5VTeh3aZ0KSyNu8Xnbkr1PMvAty=rLQ0oVQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KPB2YRCTCWQQTIKJY7555BUMV75GPHCF
X-Message-ID-Hash: KPB2YRCTCWQQTIKJY7555BUMV75GPHCF
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPB2YRCTCWQQTIKJY7555BUMV75GPHCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 2, 2024 at 10:47=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.

There are some drivers that have other (than I=C2=B2C) ID tables, which
follow the same format. Can you also do the same with them for the
sake of consistency?

--=20
With Best Regards,
Andy Shevchenko
