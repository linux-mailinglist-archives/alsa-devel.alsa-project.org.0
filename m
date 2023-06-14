Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC3730A62
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 00:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D42C3E8;
	Thu, 15 Jun 2023 00:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D42C3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686780441;
	bh=mvgoqwPJW304KhEtSAwgxVjAD/uVoTpuZ4hGkNASPSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AaL2hrmSzty0incdK0cpTB9CzzS5NkonYvEh8V9Fy037Wj8TK//jrzlEMGUtbnj6L
	 vBrhv0IT8bpS0T/PfUe4+AI1V+9JN2xq2hFHaXFRWWMirmV54A5UEzd8sxfgWy0WaU
	 Xn3avmANGdu+FH7NnDXm6ZgFVLUJVnFC4t61wOho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2FF4F80130; Thu, 15 Jun 2023 00:06:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62A10F80130;
	Thu, 15 Jun 2023 00:06:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE0CBF80149; Thu, 15 Jun 2023 00:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 732C8F800BA
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 00:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 732C8F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=O5SLdcqp
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-3f9d8aa9025so22377701cf.0
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Jun 2023 15:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686780377; x=1689372377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt0E+gE2c9tWb/FVFSjcNFqAVT4Jc03x3okyqywpWl4=;
        b=O5SLdcqpfWwpVOckirFEmrcRZlcJj77388x4poZQKK/D06VAYUEuHV2EyAt209z5+T
         s+RSwLwuZymPaNUVfdzs1ZyQRJbv+5jAuusJig/2tVNs2h/L9rTCwYcYPNyPzK61utjK
         gAGoSQ9k5ooGmDMNt2JxBHzOUfbPY8ezsJX4pepO8WfGUMV9MMZKCDoZRc67DbZUHMeU
         GUSydhmVFoq1Z+91lyF3rYRzD0RWGRV3wRbb7Nt4icogluBOBeWheve7UhvyaLkwulLl
         rHxnEFjaj4rB+e0/JkZMhK49D7gDfcBd7cyequtKtZ76x8tAxf9xfnwAX703+1K/rU/2
         4Xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686780377; x=1689372377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt0E+gE2c9tWb/FVFSjcNFqAVT4Jc03x3okyqywpWl4=;
        b=XHSvXPBtRuF4HriHktpY8U/hSfIMPvVfRVWxOOzd+5fnu3Vmf6+Tuc1vXmiNfluJFz
         LmBAvio/84xNVogbXwQPqu8YnW80B+PfXuRn73fiA8XCbJ7CXWcl+HubavolC+t4eU10
         zd5d/QUVP+LixwjicB9WQHQMMHMdSFxzCbWsNG9Mrdn5EmiytkdadOecE158Zxh8MD/h
         2Q8K5CCuS7/FXe0A7Bxq27AZD6s2ixXBFtax163Dr1laKrGO4PW2PjjlZ7RnCVruD9II
         WVAgAjVmv1DgzP6nFtJGSjkZYxPWa6pg5VsNCWjUORvwYqmpNM5ordhI2GSbZq/h1+fB
         zp4g==
X-Gm-Message-State: AC+VfDztQFBnJnwzP+nSF+uv9UqRjomutEYPGMart8ZDL5Shr1YVx8Vo
	HuaxVAZGdvKEmJxo+grtFy4+9RQCXLTxj2SATvY=
X-Google-Smtp-Source: 
 ACHHUZ7QSUKHz6eXKVGjn16hSJRIcttn0Cs9hdfy+fflsRqL6m/Cu2KmL77E7KQyQdWpf2q+eOyHfZdmyWR1J0JjSb8=
X-Received: by 2002:a05:6214:2a83:b0:62b:6615:22ce with SMTP id
 jr3-20020a0562142a8300b0062b661522cemr20081429qvb.33.1686780377150; Wed, 14
 Jun 2023 15:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230614074904.29085-1-herve.codina@bootlin.com>
 <20230614074904.29085-8-herve.codina@bootlin.com>
 <CAHp75Vcur=H_2mBm5Ztuvd7Jnvmr6+tvCbEkFtmaVLsEjXr8NQ@mail.gmail.com>
 <20230614114214.1371485e@bootlin.com>
 <CAHp75VcmW2StPqb_LtKFyNyJ2+jz3c19zNRDiSuGs06Bseq04w@mail.gmail.com>
 <20230614223418.0d7e355d@bootlin.com>
In-Reply-To: <20230614223418.0d7e355d@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 15 Jun 2023 01:05:40 +0300
Message-ID: 
 <CAHp75VfFyDzr4qHNssXZ8RLy0gxMWdjBgac4JLd7grRLEG-vyw@mail.gmail.com>
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
Message-ID-Hash: PWEDVNPHL7B2AUIR2U533O6J6TVMARTG
X-Message-ID-Hash: PWEDVNPHL7B2AUIR2U533O6J6TVMARTG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWEDVNPHL7B2AUIR2U533O6J6TVMARTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 14, 2023 at 11:34=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
> On Wed, 14 Jun 2023 14:51:43 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jun 14, 2023 at 12:42=E2=80=AFPM Herve Codina <herve.codina@boo=
tlin.com> wrote:
> > > On Wed, 14 Jun 2023 12:02:57 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Wed, Jun 14, 2023 at 10:49=E2=80=AFAM Herve Codina <herve.codina=
@bootlin.com> wrote:

...

> > > > > +       typeof(__array[0] + 0) __element =3D __array[--__len];   =
 \
> > > >
> > > > Do we need the ' + 0' part?
> > >
> > > Yes.
> > >
> > > __array can be an array of const items and it is legitimate to get th=
e
> > > minimum value from const items.
> > >
> > > typeof(__array[0]) keeps the const qualifier but we need to assign __=
element
> > > in the loop.
> > > One way to drop the const qualifier is to get the type from a rvalue =
computed
> > > from __array[0]. This rvalue has to have the exact same type with onl=
y the const
> > > dropped.
> > > '__array[0] + 0' was a perfect canditate.
> >
> > Seems like this also deserves a comment. But if the series is accepted
> > as is, it may be done as a follow up.
> >
>
> Finally not so simple ...
> I did some deeper tests and the macros need to be fixed.
>
> I hope this one (with comments added) is correct:
> --- 8 ---
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
>  * typeof(__array[0] + 0) used for __element is needed as the array can b=
e an
>  * array of const items.
>  * In order to discard the const qualifier use an arithmetic operation (r=
value).


>  * This arithmetic operation discard the const but also can lead to an in=
teger

discards

>  * promotion. For instance, a const s8 __array[0] lead to an int __elemen=
t due

leads

>  * to the promotion.
>  * In this case, simple min() or max() operation fails (type mismatch).
>  * Use min_t() or max_t() (op_t parameter) enforcing the type in order to=
 avoid
>  * the min() or max() failure.

This part perhaps can be avoided. See below.

>  */
> #define __minmax_array(op_t, array, len) ({                     \
>         typeof(&(array)[0]) __array =3D (array);                  \
>         typeof(len) __len =3D (len);                              \
>         typeof(__array[0] + 0) __element =3D __array[--__len];    \
>         while (__len--)                                         \
>                 __element =3D op_t(typeof(__array[0]), __element, __array=
[__len]); \

But can't we instead have typeof(+(array[0])) in the definition of __elemen=
t?
There are also other possible solutions: a) _Generic() with listed
const types to move them to non-const, and b) __auto_type (which is
supported by GCC 4.9 and clang, but not in the C11 standard).

>         __element; })

...

> Can you give me your feedback on this last version ?

Sure!

> If you are ok, it will be present in the next iteration of the series.
> Otherwise, as a last ressort, I will drop the {min,max}_array() and switc=
h
> back to the specific min/max computation in IIO inkern.c
>
> Sorry for this back and forth and this last minute detected bug.

It's good that we have some tests (perhaps you can add something to
unit test these)? Perhaps move your code to lib/test_minmax.c as KUnit
module?

--=20
With Best Regards,
Andy Shevchenko
