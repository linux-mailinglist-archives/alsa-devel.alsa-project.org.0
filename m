Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7872C7A8
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29189820;
	Mon, 12 Jun 2023 16:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29189820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686579301;
	bh=ZSd5KzFtiVHjaHZ2vsVc85ehHJaNW1jzDJJ3OJI/itY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XHn1JGf9yKYhaJbLXJAQ/iVnSiieX0ek2PNoRtuTwGCx0cLSO13KcPHSDerZv2mcj
	 EMFYw4/JwDChUYfyfIHNzBVP3pPC8ClVKTCEXv4A5jSuY3Tf2T6iS0dUFlPsNl8tsa
	 cshX0pBQbvdYNneDheeOhMLnYrVumJAbP4++btNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAD6AF80246; Mon, 12 Jun 2023 16:14:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC16F80132;
	Mon, 12 Jun 2023 16:14:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6650CF80149; Mon, 12 Jun 2023 16:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20395F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20395F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=M7WfC4yC
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-39cd084ea62so819159b6e.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686579243; x=1689171243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuzmliRM3Z6qQlxotmDo0oeWU8xNbS6I5a97pZAhtyE=;
        b=M7WfC4yCwJ2YDGJJkD823r9fRUt+8aurr+lqzVcujSa3THtOwVpEsauT2ReCI3vaxB
         UzjRvgiCpxx//v8/4/1K3hioZ6pIZJgzdbc4RgMxLyxFxlbrlxxuBsE5nw98I5v8IAOw
         dFSUMAMR2bZA8DxUDhkrgn0RoHpyX/qzMPJaY2pJZSr3iy6nC/F5pnOW+O2Op9tmqw5N
         lgyjDD78zDLCkiJe3AfEiWea934oy4EP7n9HvcfcGQin3Iq6w33c1kcGR2ZUUVwxxBlO
         WFxGwcBmXX1I5hNli8luDPTegSvRPAa7nCsb4QA9k+nl0ZG0ZuzIu6cOMYOZvyipMcpQ
         4R4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686579243; x=1689171243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuzmliRM3Z6qQlxotmDo0oeWU8xNbS6I5a97pZAhtyE=;
        b=PLgEmIqDyh8ALO1Gf+vNTLfI5MFNONDKzaLjU6aSdz+JlxpK7owfDMNmg7hN57jDQ7
         KgynVp310DS2IraLpTwn/dbMNhqXSwFdxr+wl4UqdfWeSnESoDI4s4m3RlEe9SbQvr3e
         HgWiYi0mrtp1tYoF46Ntr0rs+TTN80yXIuJy1i50ytGio22OAfqWkkA80u+VpUFgB/zR
         J1kYfZbbB74fB8limrupsPBGdpxIKhxsb3Rd/PlOjfHp6xxU2bApwiDsBT+nmwM+hf7s
         RgJxyvHSPYTpv8jmp3a8AvYf7Lag0GOXkLSQTaiwINtnFe36ICIzmpoqtXVAbE+0EKaI
         ycIQ==
X-Gm-Message-State: AC+VfDzEr++cH+vFLD5U+ceV6gSgUUQVNBrYoWKgoCoWaSuBDAN2onRG
	LxEKS/SGmrYjLvDlABdp4gthb8O9pu0WriFMt3w=
X-Google-Smtp-Source: 
 ACHHUZ6GDjRB6a7GeZmGws/Bjkr9EkSN//3dhbcM8V2dDNq7CI1HSltpWh9yz2Kq73NpxUogHj4+EvOYTQJkwZpySUQ=
X-Received: by 2002:a05:6808:1a10:b0:39c:6a30:cc7f with SMTP id
 bk16-20020a0568081a1000b0039c6a30cc7fmr5331405oib.21.1686579241636; Mon, 12
 Jun 2023 07:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-8-herve.codina@bootlin.com>
 <CAHp75Ve8BVO50TqhUV9YWkRBvYARNOAapZ21X=FehaBBfcC2jw@mail.gmail.com>
In-Reply-To: 
 <CAHp75Ve8BVO50TqhUV9YWkRBvYARNOAapZ21X=FehaBBfcC2jw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jun 2023 17:13:25 +0300
Message-ID: 
 <CAHp75VcrXhwa19yg328L9vAhCB3vzk4Dy--fEpWd9qZR7oZ-AA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] iio: inkern: Use max_array() to get the maximum
 value from an array
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
Message-ID-Hash: X6O2GSINLRZP3CLDIHQIXPWUWVFAZXY7
X-Message-ID-Hash: X6O2GSINLRZP3CLDIHQIXPWUWVFAZXY7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6O2GSINLRZP3CLDIHQIXPWUWVFAZXY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 12, 2023 at 5:12=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Jun 12, 2023 at 3:30=E2=80=AFPM Herve Codina <herve.codina@bootli=
n.com> wrote:

...

> >  #include <linux/property.h>
> >  #include <linux/slab.h>
> >  #include <linux/mutex.h>
> > +#include <linux/minmax.h>

But can you try to preserve order (to some extent, perhaps invisible
here context is even better, I would assume mutex was added
unordered)?

> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/iio-opaque.h>

--=20
With Best Regards,
Andy Shevchenko
