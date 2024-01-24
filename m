Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7483B4E1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 23:43:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE7D826;
	Wed, 24 Jan 2024 23:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE7D826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706136213;
	bh=Qukh6NM4WCRaJv0AHT7llBYLpgcSaOJfBHV+ajCKoe0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BjlzN2jfJndw9UV44QGcnfOXPSknF9ycMQ7hXcwq10XnYkPQsKq+4bY4SY97UCBIz
	 0ONRraoMw9hmL9yMLxtP0XvIdRzSW2DY7a7e9lwynjyhFpY1D3Ly8FFvV76AZ+G3Z0
	 7Ul2VrO7CzaVbxmyPIn+RmYXIcpiymt6kopyEhPQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D7FEF8057E; Wed, 24 Jan 2024 23:43:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7CDAF80520;
	Wed, 24 Jan 2024 23:43:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18870F8028D; Wed, 24 Jan 2024 23:42:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4D39F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 23:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4D39F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GAYnxkEU
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a311e9cca0cso129064366b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Jan 2024 14:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706136170; x=1706740970;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ue8zgG0OGtGYIx4fDzhlZnBCUkiqmZh3yBn/xzVgujc=;
        b=GAYnxkEUHis3kYy3vsFM2T8BJnjxBxxiQ4wTfgKNjioieJs+GsqCi5yQPhMaSWFKuo
         UMfHduLXbq2FuYJ0N85XZQ5dh2CkWxePacEJNQ5gOkpVRpzdanGdzh9xulAL7Xeobk8O
         OlcXUBrGQSoBJJrCxYwba1T/1cYTEuFBS/kiMDi2ozSAOTCgQEYJRI/oITUHoymqsPmE
         n7/HBMFFXchXA80h+YTSUsT7OZ9fqEB5MuSwBCY93TKifBIc9vDsunL8h6d/Gy8WyiWe
         NjO+0+n4SQTScrjf7KPjVacZwiIBtS8FknsEuiSPc5kfTf/3JwpKJJJmadC/wev14srt
         MdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136170; x=1706740970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ue8zgG0OGtGYIx4fDzhlZnBCUkiqmZh3yBn/xzVgujc=;
        b=gXHPZtfJ+nGsylOq4l+jisIsqdPDQNRkqpWKOS2I2WzzGeBj86KusqK3LLpcGZ8Wxq
         N9kcV8GjzOOW1l6sMhIa9AcL6cPVBvTmW9tJy8TOCGW8IhZPlQVqyamTcWe5sg32aUZZ
         u+XtvKl8hSa6wGDIN4Yp/qA4wiuVONCHGUiaeb/hxIL1lufcsHAAKggkJZ5chBH180aA
         B6+WdIwroSGsKCNdFJ5TSNbp+O+Y0V0s+LXji7EOBv0e7GHUphiVxFtDMtZWd8eLwsdE
         B7KPunTzcrUxuFKzBHFPx/H1JgQrwf4YsLy6QjOguhEnxjcw1MgBk0uDOkkIO5Y9a7Hl
         EfXA==
X-Gm-Message-State: AOJu0YwX9Dz9L9rvHyHGlXfw7+8CbeTErrQvn2YXBKXqPd/sYOn8ddAa
	v8DUoKq4D1cgTy6y3NVn16Qg4ZAYhiRXOLbC1tfBtfsiczASKZ/F2RfnVT19IwyUbxr/y+P4LI9
	Vy4vVXYrKKLz259qXGSRaTx+hNYg=
X-Google-Smtp-Source: 
 AGHT+IHchyYecXM5b6MLOfUREflDjiLwSN26eIdyuYW7kIh/JLcYrHnz1XXpmgVWcAxmhQD+yFqx0vDmPj+/iAGCXGI=
X-Received: by 2002:a17:906:f6d4:b0:a31:953:5869 with SMTP id
 jo20-20020a170906f6d400b00a3109535869mr23245ejb.53.1706136169789; Wed, 24 Jan
 2024 14:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
 <20240124165558.1876407-6-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-6-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:42:13 +0200
Message-ID: 
 <CAHp75VdmpPXmQTDSJLotiYSxVO=4Fn27tWwQsByzYQuZwmHJ9A@mail.gmail.com>
Subject: Re: [PATCH 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VIDLH63T7HC7X46OS53DL6N7DM2XNHAI
X-Message-ID-Hash: VIDLH63T7HC7X46OS53DL6N7DM2XNHAI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIDLH63T7HC7X46OS53DL6N7DM2XNHAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Refactor the code in cs42l43_mask_to_slots to use for_each_set_bit.

..._bit()

...

>  #include <linux/bitops.h>

> +#include <linux/bits.h>
> +#include <linux/find.h>

No need, it's included by bitops.h (and there is kinda guarantee for these)=
.

...

> +       for_each_set_bit(slot, &mask, sizeof(mask) * BITS_PER_BYTE) {

BITS_PER_TYPE() ?
But actually it's unsigned long, so BITS_PER_LONG should suffice.
BUT. Why not use ..._MAX_CHANNELS here directly as it was in the
original loop? You might need a static_assert() that tells you it's
not longer than bits in the mask, but it probably is an overkill
check.

...

> +               if (i =3D=3D CS42L43_ASP_MAX_CHANNELS) {
> +                       dev_warn(priv->dev, "Too many channels in TDM mas=
k: %lx\n",
> +                                mask);

This is invariant to the loop, you may check even before it (I'm
writing by memory, might have made mistake(s) in the snippet):

  nslots =3D hweight_long(mask);
  if (nslots >=3D ..._MAX_CHANNELS)
    dev_warn(...);

>                         return;
> +               }

--=20
With Best Regards,
Andy Shevchenko
