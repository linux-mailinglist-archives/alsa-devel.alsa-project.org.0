Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E609372F880
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 10:59:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3192822;
	Wed, 14 Jun 2023 10:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3192822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686733186;
	bh=bE1UY9YSHyMdNK+RQzd/Qu5lzYMaouRgszeaHk+gNsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QNclPH3M/DCWRv2OwH4WOnDrmTJKm9Ke0ANlCzWFH1ErUsfNg1XFN5L1lQmmDJYaJ
	 6ec75X969J2PC3PR75d/bph6IrKR24SybYhcCqh+EQUNz4o3txwxit4RRWdBy9ea/3
	 bwYO/p17fto/Ll/WMbYImsdtC5geIlJD+X/Clu4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B717F80533; Wed, 14 Jun 2023 10:58:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7613F80132;
	Wed, 14 Jun 2023 10:58:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD944F80149; Wed, 14 Jun 2023 10:58:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F4C3F80093
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 10:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F4C3F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Ot/DCOyS
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-762092e1fb7so26477585a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Jun 2023 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686733128; x=1689325128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lgodkIswJohX+x8mkZUQSVnPLlX7YVIZMkuNAfb1yk=;
        b=Ot/DCOySikas+7rkq9f+ucVQGP5RLs4JvwNAN08bzMSgmzNOZWwtiOlpyll/CPZoP4
         r06VlOMyHPX0o61/vy8vD7gFFh5VYMd4FYbBpPPrBhe8qWHQ74gfmO++A5er7aflsSml
         +4mj+GezQNZwn/LQFSRzqvP3AYPgJgLpFFjFA8wJCyfNsAfzg5jQ23hZDToLuE0HR2ei
         le5oHs4kTxcLbU6i0tYdEjevnhdOOxH60q6QAm79lzsuJuS6vYoibzvp7WHJn5jBlPJy
         68VVNWpAUgtM+njfqX8lZhBaZPGCihw5zHtMKSD0l3RSlJvNSPJOaFoq54L6bvMRxadg
         Yotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686733128; x=1689325128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lgodkIswJohX+x8mkZUQSVnPLlX7YVIZMkuNAfb1yk=;
        b=EDeILcKyN0/3o0bAI3rn2Ypyiy6ilDbmn/bCTWaVV63TLK8VljO6OESBMMqa3JzsTT
         fUiijqxpf2YE57wQnHH0H8/alOKYdExyjrw5tY0wMkrFNfeDQcmrvicaZKf9TLTsm4pT
         +d+nOn7P87zkSqj1kiLF8SMoCjHjdsunKWmPu3OyV3ZBBe0MF6XNGowhIVb1cqSuEGYm
         ZC3GIfWVdhXN9FWhciZHos9caYS3e5Omk79swbO+osYv68djSCxLLIHcWzqfoMT4sNbW
         mx7wsQA3obhj6nqegaDiIr3kWed92khy5TkdRz55Gq5Kn1OzVvf1VUwWRI/NogLDAHtB
         p+hg==
X-Gm-Message-State: AC+VfDy1kGDgq/K2FWud/3acWcH607zqgD68+iNmVWe3/WoTVZODYmfE
	KirWxtFXGOUjYBGo/QAIARrw1NKXLU/bpJQL1LA=
X-Google-Smtp-Source: 
 ACHHUZ4ZorPUczsp9ix2/keVyiyoZtFgcXOfaVRuLOYDEDZVZmZGMU/Xk+uzbP2wXmnsIw2NKXwjUng/0RLfK066E+8=
X-Received: by 2002:ad4:5aeb:0:b0:62b:4590:78d6 with SMTP id
 c11-20020ad45aeb000000b0062b459078d6mr17824250qvh.25.1686733127774; Wed, 14
 Jun 2023 01:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230614074904.29085-1-herve.codina@bootlin.com>
 <20230614074904.29085-7-herve.codina@bootlin.com>
In-Reply-To: <20230614074904.29085-7-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 14 Jun 2023 11:58:10 +0300
Message-ID: 
 <CAHp75VcF09xKQuCjW3HTRauG+geRE0fdd+y8t7LrCYRRYN1WSg@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] iio: inkern: Fix headers inclusion order
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
Message-ID-Hash: RY522ZTPH36Z66P774MUQDBSKSYHKS5Z
X-Message-ID-Hash: RY522ZTPH36Z66P774MUQDBSKSYHKS5Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RY522ZTPH36Z66P774MUQDBSKSYHKS5Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 14, 2023 at 10:49=E2=80=AFAM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> Sort headers inclusion in alphabetic order.

More precisely fix mutex.h inclusion order as it seems to be the only
one misplaced.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/iio/inkern.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index ce537b4ca6ca..71d0424383b6 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -5,9 +5,9 @@
>   */
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> -#include <linux/mutex.h>
>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/iio-opaque.h>
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
