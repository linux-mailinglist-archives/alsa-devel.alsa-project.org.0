Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2BC72227D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 11:47:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2AB574C;
	Mon,  5 Jun 2023 11:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2AB574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685958426;
	bh=k2jGWbNAMSJgvvMS4OIf83LG7kgH58pHgM7ZdSs7SSk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XYlLsyE46PG1/xOUoDbZqKN5TaDfZIGFeoZLKpZYKesCcIaaGNclPVUNj355v/VhO
	 wy8W1xbtZNJwCvlxPtQO2GrYUQCtCMRpX/RZSbFQbEQWIN9Ajfj2ZZ8zN2ugBRbW7Y
	 TEREGo2lIUwIsL/d6E98Uvwzss98nH2zZW6ZhX2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42A8BF804DA; Mon,  5 Jun 2023 11:46:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD9FBF8016C;
	Mon,  5 Jun 2023 11:46:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 751E1F80199; Mon,  5 Jun 2023 11:46:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 385C3F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 11:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 385C3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=mXTdR4Cc
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-75eba89e373so16594885a.0
        for <alsa-devel@alsa-project.org>;
 Mon, 05 Jun 2023 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685958361; x=1688550361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJsWxNn+ehAzikAnLEGHSuhlWphRfQgau36mI159SV8=;
        b=mXTdR4CcVVVjT/Qc4hbfsPVKcGa4qvFMqokLP3mWACF+hehi0eYEZCAAh8Mly5xqZ7
         OdQwB9RvK466dKJPm3Xf14I/MnPDyaCEMucCpze46I6jU9fvPWEb2aq14aedRxI+v71L
         TatFHLdGo2Rg1oJUNQjsOVwuVVSXFfr1tYysFr1hPhQ8oRe1Onf2jM19DMhv6J33siK3
         MA4w8+18ByiU8GJrrUTFvaO66wdv/esL455cAs/VlnjO2Ru0vdNnpq+ioNINk5v+s/oX
         ncCrSSB+ynRvBjn9sofTSltEuX0eoaDFtr/j37ETRRGdEjxUSuGc4aCgLaXRDtGYzKJ2
         3oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685958361; x=1688550361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJsWxNn+ehAzikAnLEGHSuhlWphRfQgau36mI159SV8=;
        b=GSzxubSfWsyyN6QJ5q7++/kQDj362pg/iWLi8LPB8pUJoYX9aOilw7pmLwlBb7xgw2
         0z76dwLZJhp7jOBUW4a6YWPURTdLz4RcPL1J5qRVUwCw5/9bpXNJbhde5TrFh4G1jcII
         iUvAE1KQSq47QKU8F2ikum+BWboVMEuE18iK8DNQjSbFQ9l9BB78U9qbDWV/FQuCppU4
         fDTEQyCdYkKeNSCEc3m63R5QIOTeVaA5FFbYAwUiZbuaTZoXH2IpiPIOKyvSlgCTM6gM
         I1U4Iy0XkVB3vStkGV4uLJDKKS97jaFf/dIYL+DpiJNYhNv2T9iGksteg6SsjdNip3e/
         tuEw==
X-Gm-Message-State: AC+VfDwnXoc8RfiKFwL2Ui+zLlWMhCYrOah4LqZeyvSsd8mQ3FR1Pq+b
	vbY/mRpfw1Nd+WNNJJeyILT54URfZpHsI1AAXL4=
X-Google-Smtp-Source: 
 ACHHUZ7rEj10g7ikWyZ3KsOkINRJ5HpW1dgRXnpiCle+k7JUOkhRh3Ttxy58uWLS7jcOMUJiInZ1F65FYFqKngGaa+w=
X-Received: by 2002:a05:620a:46a2:b0:75b:23a1:d847 with SMTP id
 bq34-20020a05620a46a200b0075b23a1d847mr15874844qkb.9.1685958360822; Mon, 05
 Jun 2023 02:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230523151223.109551-1-herve.codina@bootlin.com>
 <20230523151223.109551-6-herve.codina@bootlin.com>
 <ZHtIdTZbULl6t4RT@surfacebook>
 <20230605094637.7615b689@bootlin.com>
In-Reply-To: <20230605094637.7615b689@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Jun 2023 12:45:24 +0300
Message-ID: 
 <CAHp75Vec3fXT6phqvLGSn0c09USCXXF6ZoE+X1VNJGM6jyf=aQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] iio: inkern: Add a helper to query an available
 minimum raw value
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
Message-ID-Hash: M6XMDZ57NISVLGTM776PRGBIWON3VT3D
X-Message-ID-Hash: M6XMDZ57NISVLGTM776PRGBIWON3VT3D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6XMDZ57NISVLGTM776PRGBIWON3VT3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 5, 2023 at 10:46=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
> On Sat, 3 Jun 2023 17:04:37 +0300
> andy.shevchenko@gmail.com wrote:
> > Tue, May 23, 2023 at 05:12:19PM +0200, Herve Codina kirjoitti:

...

> > > +           case IIO_VAL_INT:
> > > +                   *val =3D vals[--length];
> >
> > > +                   while (length) {
> >
> >                       while (length--) {
> >
> > will do the job and at the same time...
> >
> > > +                           if (vals[--length] < *val)
> > > +                                   *val =3D vals[length];
> >
> > ...this construction becomes less confusing (easier to parse).
>
> Indeed, I will change in the next iteration.

And looking into above line, this whole construction I would prefer to
have a macro in minmax.h like

#define min_array(array, len) \
{( \
  typeof(len) __len =3D (len); \
  typeof(*(array)) __element =3D (array)[--__len]; \
  while (__len--) \
    __element =3D min(__element, (array)[__len]); \
  __element; \
)}

(it might need more work, but you got the idea)

> > > +                   }
> > > +                   break;

...

> > > +           default:
> > > +                   /* FIXME: learn about min for other iio values */
> >
> > I believe in a final version this comment won't be here.
>
> We have the same FIXME comment in the iio_channel_read_max() function I
> copied to create this iio_channel_read_min() and, to be honest, I
> don't really know how to handle these other cases.
>
> In this series, I would prefer to keep this FIXME.

I see, Jonathan needs to be involved here then.

> > > +                   return -EINVAL;

--=20
With Best Regards,
Andy Shevchenko
