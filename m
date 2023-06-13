Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A113572E40E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2A2DDEB;
	Tue, 13 Jun 2023 15:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2A2DDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686662808;
	bh=2MDXSwhQw3/zppmy6zapeC3KwvSBcdDyln5BcCutQFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dpbNcleg7BHL7CxebLs8eVphZa+sMlfLOXgDjHndxY49zH111M9Qf90zPyGMxlrfN
	 M0+nFJLGB9MX6IamAtNOjKSL/Xz3rwbeJY3Em2vcJxgN0mGsYDqNgEBmEPcYIRrrRD
	 tBHRpTahcA+QMTGBo/4Qa+d1Y2pq3G8+uwaznwQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBAE6F80149; Tue, 13 Jun 2023 15:25:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D29F80132;
	Tue, 13 Jun 2023 15:25:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53541F80155; Tue, 13 Jun 2023 15:25:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15A21F80132
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 15:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15A21F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=HWfrF9Tf
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-62df4cc47d4so6899296d6.0
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Jun 2023 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686662735; x=1689254735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGWVSRLSWiSQmgCzVp1crJX1PaYgdtyOOFzd4KI8WPY=;
        b=HWfrF9TfgiK84XltXfvEgJRiai43zOeGut8vINME/9REh2L3cElV8+jnFD9w1O4hCa
         DOSLZRxfWQrvdXAonKLk4FnRb2jIBi7XLmGQgeF3fpheKhw1QiiaXteIPU65Z3BHmabx
         PVBvMLCKFvLvZsn1uFcP9OKv5ZYU/OmETC3D8hALocTj1s02fudpY9GutoTjtLQSfq8N
         BUM19YwPqIKRWmM0hed8lbHmYSNn4IXrLcq6JgCKGChoNCZKD5uyNWifQfBXN5dmMNiy
         tgkqxWiCu53VpV40XJc5vCbXO37JudVTGjb4hjVI4J48uy6frPRTHL4AhmzHS8eD/2WY
         EzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686662735; x=1689254735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGWVSRLSWiSQmgCzVp1crJX1PaYgdtyOOFzd4KI8WPY=;
        b=iQHKpv/31C6eWtZ6peSTJOTKpdagVKyj/TJ6d2V9E9+mzSyZdbveD+uFgqc0XL3EXm
         ZNC38/DA/dw71O/qG/SPjY1Z0AtWrmdA4VVRqacT5GCxF4isOfqUq1lHpY0Svjn0wjjl
         K5BiDrBD131y0brbVvji3roXb7WqRNQtUzCh/WbMck2DTyMuLs8KEFagMuYnaCacPDgT
         kkcG2zGf2ojVnOAdfEkbqNiYCzqcGgXI+Dn6A2Nmu6IAh6z627KRHXR3BA3/WE4NFn1X
         BCbGl9E02ZuKjlVx+aTluh7D3kJF7SBbZ+K/rohdKy8bjxwh0grsy/vADfcxGPeXciis
         QXdg==
X-Gm-Message-State: AC+VfDxTRpMw2ykbpGYXnopEfhQSAq2Gu0EE1JYjBO8zbWriQrZ3j8ek
	X7b2E7BUhinupZYgHqlZQZH2pdlVnW85+fSNgZM=
X-Google-Smtp-Source: 
 ACHHUZ5kz189tnuVuyMuffOhKxE4YMOwXJzuYUWwxct+eUXsThGzOBu6ItCuKQ3mJGC+D7Re2VsLvEk8QpOGwIlN9E8=
X-Received: by 2002:a05:6214:1cce:b0:62d:fddb:1856 with SMTP id
 g14-20020a0562141cce00b0062dfddb1856mr392857qvd.43.1686662734879; Tue, 13 Jun
 2023 06:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-12-herve.codina@bootlin.com>
 <CAHp75Vfz+vSJ7rQ4sxb0R+zRbrjipXUX3VpaHyvOWWePdPxejQ@mail.gmail.com>
 <20230613113707.0b5d9648@bootlin.com>
In-Reply-To: <20230613113707.0b5d9648@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Jun 2023 16:24:58 +0300
Message-ID: 
 <CAHp75Vd0SNY6XgKwS5j74VftY46MDQ9=Zc3wXwGLOiMc_ZX8Ow@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] ASoC: codecs: Add support for the generic IIO
 auxiliary devices
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
Message-ID-Hash: CAHOLFS5Z52XEHJUQ3TGY5LTSBUCIWMU
X-Message-ID-Hash: CAHOLFS5Z52XEHJUQ3TGY5LTSBUCIWMU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAHOLFS5Z52XEHJUQ3TGY5LTSBUCIWMU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 13, 2023 at 12:37=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
> On Mon, 12 Jun 2023 17:37:00 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...

> > > +       struct snd_kcontrol_new control =3D {0};
> >
> > 0 is not needed.
>
> Not for this one.
>
> The variable is in stack.
> Some of the structure members will be set in the code but we need to ensu=
re
> that all others are set to 0.

Yes, and as I said, 0 is not needed. Compiler assumes that if you just
use plain {}.

--=20
With Best Regards,
Andy Shevchenko
