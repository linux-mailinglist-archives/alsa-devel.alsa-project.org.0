Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D672E90E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 19:09:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 640B884D;
	Tue, 13 Jun 2023 19:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 640B884D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686676185;
	bh=6UPTVvOwDOeB8/GZlG4rKLyuSM7kr2hGftINHz4jTHU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oEVJkoGSga/TLriCh3uDfwF2IQKwGpFH/Yb+rksSL346ZYk1zmJgIA/+BxSc1/pO0
	 ett3SfDXMUth9cjXb1GYc/qW3sx5XzT4803/USZHfxZJ08k1495mzaaJaNqKMHsEtx
	 hANWQFXbfY+WXE1TNQL+IUMLtwNjNu6BFBEO8qKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1440F80132; Tue, 13 Jun 2023 19:08:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D0BCF80132;
	Tue, 13 Jun 2023 19:08:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B095F80149; Tue, 13 Jun 2023 19:08:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A14E9F80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 19:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A14E9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=A7iJAOhz
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6261367d2f1so9404726d6.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Jun 2023 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686676124; x=1689268124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEOxPjyq7cbAhN04VkJQjCBC+cXkSTNShgxgFc1N+zA=;
        b=A7iJAOhzjDARsMdLXql0k2OXLHNTpaLZtqbaTeS51zwUgfBoKoHEAdgUwftZtXPkrr
         yoch6gF7JjAlWDOjG9dCbPyLz8wl0KVf9c+xRea0NqOAttdciVtvu9j6oDNptpSoLsj9
         Zy2SsuRT8B3s9C49maijvvGSEb+p2wwuiM3MOY4xvubIKWPb7NMQiueXnt/hLkbjK0Qb
         3LtbtFYpKySGZMPmCO9Y9boRNazVRe3Uc/G0fFHOUGSADUajXULr45dvsJlbVNfhFBg9
         p8NL/UmHMg3bEGWslK4cFSxYbVrEFwIk7cpDgWfblmckcgIaWKaQUoTTNxaMLSZLEVhL
         2Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686676124; x=1689268124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEOxPjyq7cbAhN04VkJQjCBC+cXkSTNShgxgFc1N+zA=;
        b=jary/Xcsp5IZ1P6uB1anRWhiZdksC9Jpf2PnximMeyni4gNua+sc5MKfbpOCZTJAnx
         eq7XlOziF6b+T11JwvLCJUvMkopPHscze7vnPqq8PqUwKVwhqFJl0dDw/xGmfOzXR2Ju
         xET41gEHW9zuwjEUQnLNXfBTMwvfkUeBZIZrE4PqwMxsMiE+qo1veRK8WS5EbfnlUMyd
         3KfMN6doBERQlf0e2eDz81wajTDjGgt7YomE8I8Vuh5Y7TUBPEZnzA2wulbfa5UqwEYq
         LNP4+4NmHYAPEqdikjqyJuwJnMnLHb7KppeVUT1VZq7NNU/+svU5/qG2Me2iEv4EYve4
         ubtw==
X-Gm-Message-State: AC+VfDyvrXS2W5VZnMS6zgqj3PqWOfmaJTc1FdG5O1rIXbUCrvszvm8g
	GpWJIWVDi8kYlsd/FRKOUCIIz6mRUndnsSTM0X6oI/rB4X5iew==
X-Google-Smtp-Source: 
 ACHHUZ6IVHYtr6EhQ8zxzJ7cZgPX29yPpTxMs+tJlNote6SRNod+g3s8Q+j1rgTEV1/Gp9V+uz2mkZmDpuA7/u9qgnM=
X-Received: by 2002:a05:6214:2468:b0:626:1e6b:4785 with SMTP id
 im8-20020a056214246800b006261e6b4785mr15074240qvb.6.1686676124471; Tue, 13
 Jun 2023 10:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-7-herve.codina@bootlin.com>
 <CAHp75Vf2dmAS9VD-pgyZwVopVCFy8yFjhPWEj8sym=pfE7uxSA@mail.gmail.com>
 <20230613100000.6bd9e690@bootlin.com>
In-Reply-To: <20230613100000.6bd9e690@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Jun 2023 20:08:08 +0300
Message-ID: 
 <CAHp75Vcr5Owjn0HK-+D0mpPJAkAxG7F8bEO=sqvhT8w=_xnF7w@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] minmax: Introduce {min,max}_array()
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
Message-ID-Hash: 5IRCWSR4ASHWG2EA2TW6Y6KDFCGCXPS3
X-Message-ID-Hash: 5IRCWSR4ASHWG2EA2TW6Y6KDFCGCXPS3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IRCWSR4ASHWG2EA2TW6Y6KDFCGCXPS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 13, 2023 at 11:00=E2=80=AFAM Herve Codina <herve.codina@bootlin=
.com> wrote:
> On Mon, 12 Jun 2023 17:10:40 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Jun 12, 2023 at 3:30=E2=80=AFPM Herve Codina <herve.codina@boot=
lin.com> wrote:
> > >
> > > Introduce min_array() (resp max_array()) in order to get the
> > > minimal (resp maximum) of values present in an array.
> >
> > Some comments below, after addressing them,
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

...

> > > +       typeof(array) __array =3D (array);                        \
> >
> > We have __must_be_array()
>
> Using __must_be_array() will lead to some failure.
> Indeed, we can have:
>   --- 8< ---
>   int *buff
>   ...
>   min =3D min_array(buff, nb_item);
>   --- 8< ---
>
> In this case, __must_be_array() will report that buff is not an array.

Oh, I missed that.

> To avoid any confusion, what do you think if I renamed {min,max}_array()
> to {min,max}_buffer() and replace __array by __buff and use *(__buff + xx=
x)
> instead of array[xxx] in the macro.

But functionally it's still against an array.

I would stick with "array" in the name, but add a comment why
__must_be_array() is not used. If we need a stricter variant, we may
add a new wrapper with that check. That said, I think we can use
__array[0] and similar indexed accesses.


--
With Best Regards,
Andy Shevchenko
