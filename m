Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51898731A85
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 15:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D348827;
	Thu, 15 Jun 2023 15:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D348827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686837218;
	bh=yWgLFFz608H58J6i9dbhtW+KAnQtvz/VKoDJwdoPo08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U0R+nRpEPsMCs7D/rRHBCBGGIQRdsHNfJEbN7WJjBLFdV3MIva8poHwpLjF7WUFd/
	 aHOCLmvRarLTb3J5zju6nVaarfp5vLz99wqtfznLixAtF/U70njGj6DdU5eCBkC1F1
	 wnrTfOBMh25E6XIil790wApIGXGPuV1glK9d4x+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9C76F80301; Thu, 15 Jun 2023 15:52:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27EAAF80130;
	Thu, 15 Jun 2023 15:52:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 213E2F80149; Thu, 15 Jun 2023 15:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D01BFF80130
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 15:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D01BFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=RZs0H0co
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-62ff4f06b3cso3009126d6.1
        for <alsa-devel@alsa-project.org>;
 Thu, 15 Jun 2023 06:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686837129; x=1689429129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTISzDzB0vgzRtUm+XOEwGTMkJ6kple5Xm92txPcOLI=;
        b=RZs0H0colKUY6LS5gf+N4I7AdqC+9xX4y/bW1RwfN8MKvImH+r1v1PQZOrCjrU5nDt
         FsUk19iGS4qcdIpaKZBzfFzR90IEsZjP/cmgrWjolhyNxJIjCNveCNZt5MBpOU6tmDR+
         +lKN+lRE7dBIjY+mEzP6T6/JzM1D6LKxM0hknfDMhsLHyLi59tSfMVeO2QADLNAmbJBA
         prgMVlzi1fUMkU5k9DAMfS7U60GbueV0mN084FuSbM5Fs11usiozcJdhfNJ/QaSQF9od
         tStbo7OYeHdy+A81I+BiQVRSrQaWoEASjqWMpT/A2DIg2Nowe1MxBxKkdvOhs07UtdaH
         SxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686837129; x=1689429129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTISzDzB0vgzRtUm+XOEwGTMkJ6kple5Xm92txPcOLI=;
        b=kZEVn6S5kuiIuevyf4xtbgS6F0WNviGMpY0snn8QoXq/oXQEYN5KNEZUQEmbEMGqum
         V/DGAiGepm1+InoSkVNJTE8E3YgkCm3IERoFN8f2T97D8m3cVC5hjZHy1h17b5bCndYo
         2cohYZ25VI7j+76cxPSqCqZySZJhGWPc7DP14zwCl9HNkjyCNpOJ+KuKvfPK9xxXHXKS
         KW7OyJWFGCt7vr+w4nac5fcKTrCGDQ+6VMQhEglcMkbrPM7acfM5HZs2GEA5KliAuGoy
         a6SYTI0bHFYPgz56V/4vx/tW+q4qE3KStS9zAHeEyxc+96VwOiu8JowsocCJ3kIPFIKo
         KEdg==
X-Gm-Message-State: AC+VfDymf8/3xeI5DhZrAMmHKcgUS83FSpyOyA4Ilh52h/8rMFP69neg
	gylmalI4AVbuTH4JE9YfHdQBvCi9OEIprfdezIU=
X-Google-Smtp-Source: 
 ACHHUZ7wjjBG8VxmyvEb3k5iTRCIsao8mEEup0Ly3jqvyGSn+EjEgNrTRbdDIWOSsKwflUDuWQFak/maSvKiVTp6mqQ=
X-Received: by 2002:ad4:5de3:0:b0:62f:ea09:7088 with SMTP id
 jn3-20020ad45de3000000b0062fea097088mr3600822qvb.27.1686837128707; Thu, 15
 Jun 2023 06:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230614074904.29085-1-herve.codina@bootlin.com>
 <20230614074904.29085-8-herve.codina@bootlin.com>
 <CAHp75Vcur=H_2mBm5Ztuvd7Jnvmr6+tvCbEkFtmaVLsEjXr8NQ@mail.gmail.com>
 <20230614114214.1371485e@bootlin.com>
 <CAHp75VcmW2StPqb_LtKFyNyJ2+jz3c19zNRDiSuGs06Bseq04w@mail.gmail.com>
 <20230614223418.0d7e355d@bootlin.com>
 <CAHp75VfFyDzr4qHNssXZ8RLy0gxMWdjBgac4JLd7grRLEG-vyw@mail.gmail.com>
 <20230615113512.07967677@bootlin.com>
In-Reply-To: <20230615113512.07967677@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 15 Jun 2023 16:51:32 +0300
Message-ID: 
 <CAHp75Vf2aR1x-Nf2+uUySyGH-p12YbP2Z=Ezbspqg==pCpRbOg@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] minmax: Introduce {min,max}_array()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TS7KH2YWZJJEQYQVVJQUPDCN3XMGCOIH
X-Message-ID-Hash: TS7KH2YWZJJEQYQVVJQUPDCN3XMGCOIH
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TS7KH2YWZJJEQYQVVJQUPDCN3XMGCOIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 15, 2023 at 12:35=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
> On Thu, 15 Jun 2023 01:05:40 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...

> Did the job using _Generic().

Cool! Keep my tag for that version and thank you for pursuing the
implementation that works for everybody.

> This lead to:
> --- 8< ---
> /*
>  * Remove a const qualifier

...from integer types

>  * _Generic(foo, type-name: association, ..., default: association) perfo=
rms a
>  * comparison against the foo type (not the qualified type).
>  * Do not use the const keyword in the type-name as it will not match the
>  * unqualified type of foo.
>  */
> #define __unconst_type_cases(type)              \

__unconst_integer_type_cases() ?

>         unsigned type:  (unsigned type)0,       \
>         signed type:    (signed type)0
>
>

Single blank line is enough.

> #define __unconst_typeof(x) typeof(                     \

__unconst_integer_typeof() ?

>         _Generic((x),                                   \
>                 char: (char)0,                          \
>                 __unconst_type_cases(char),             \
>                 __unconst_type_cases(short),            \
>                 __unconst_type_cases(int),              \
>                 __unconst_type_cases(long),             \
>                 __unconst_type_cases(long long),        \
>                 default: (x)))
>
> /*
>  * Do not check the array parameter using __must_be_array().
>  * In the following legit use-case where the "array" passed is a simple p=
ointer,
>  * __must_be_array() will return a failure.
>  * --- 8< ---
>  * int *buff
>  * ...
>  * min =3D min_array(buff, nb_items);
>  * --- 8< ---
>  *
>  * The first typeof(&(array)[0]) is needed in order to support arrays of =
both
>  * 'int *buff' and 'int buf[N]' types.
>  *
>  * The array can be an array of const items.
>  * typeof() keeps the const qualifier. Use __unconst_typeof() in order to
>  * discard the const qualifier for the __element variable.
>  */
> #define __minmax_array(op, array, len) ({                               \
>         typeof(&(array)[0]) __array =3D (array);                         =
 \
>         typeof(len) __len =3D (len);                                     =
 \
>         __unconst_typeof(__array[0]) __element =3D __array[--__len];     =
 \
>         while (__len--)                                                 \
>                 __element =3D op(__element, __array[__len]);             =
 \
>         __element; })
>
> /**
>  * min_array - return minimum of values present in an array
>  * @array: array
>  * @len: array length
>  *
>  * Note that @len must not be zero (empty array).
>  */
> #define min_array(array, len) __minmax_array(min, array, len)
>
> /**
>  * max_array - return maximum of values present in an array
>  * @array: array
>  * @len: array length
>  *
>  * Note that @len must not be zero (empty array).
>  */
> #define max_array(array, len) __minmax_array(max, array, len)
> --- 8< ---
>
> Do you think it looks good ?

Yes!

> For, the KUnit tests, I agree, it would be nice to have something.
> I need some more substantial work to implement and run the test in KUnit
> and the first task will be learning the KUnit test system.
> I will do that but out of this series.

Thank you, it's fine with me.

--=20
With Best Regards,
Andy Shevchenko
