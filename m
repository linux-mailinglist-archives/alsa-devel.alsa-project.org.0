Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A49AA83CBFB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 20:13:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30E0374C;
	Thu, 25 Jan 2024 20:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30E0374C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706209990;
	bh=mWQXownpH5H9R8/P5+iuEQp/UesRsl7bUMqYRhFDxv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TXkQeisVprpJHzaJcHNoGobSDSM4G2boZMjj7lpDBkAH1/oPd+QN1pcNWGPz5cWpQ
	 9RVh3XSuaIQq7UgbB9Te2oQJWlNtwIrOfOMVGMIWp5MRD52zA38Mm1726JOl22sAYa
	 uW3DylZLiWlZZQrT3owMx1mTJktGCqrGgpEnM7CE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 924ADF8057E; Thu, 25 Jan 2024 20:12:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64546F8057E;
	Thu, 25 Jan 2024 20:12:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32578F8028D; Thu, 25 Jan 2024 20:12:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40F26F800C1
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 20:12:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40F26F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EijiNlym
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5101f2dfd97so1147336e87.2
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jan 2024 11:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706209942; x=1706814742;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTuffw53HA6ugoDRsGQyD4P85l0Jg5fzNwB6j2+kgK0=;
        b=EijiNlymBFFueWYiJa5Z8Jz0bLHaFiyOz9LszMOaW2skv9wHPndj744VqxPWEa2uKa
         UfqhM0sE0pEpUCAwSUfbAUjCLNh6dWvGfKLf1vi77DqsCraQOsvkGvNIWMAq564/xb7w
         Qofogu7KBuAgjueL/i2peKTFZVPrIxLQA4QcrcNTM+8yP4Itq8uexvbQoQQ/TXvPDpB3
         Lawh0iELibgbS3JZr4EFLezl1msrTDCfDs5IqnsviBpHhMGZbohzOhxXxnJ5ZwVP6Pmn
         tjdHJyrnR9DYqTiCOyuzJLGSDmoISEpVITy+YD1UbgiVQKfczlHMn2x8L0mZdHOTcYPf
         0Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706209942; x=1706814742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTuffw53HA6ugoDRsGQyD4P85l0Jg5fzNwB6j2+kgK0=;
        b=GtUkTe1t/u8Q7Kf9fNj2XoqxvlDJlSU5CKjHqNMAf31EAkRtX+u3P/ID2RQXDJ71Rg
         iyPRGRd08JhuJB2foYSAa9ovXE8RzvfGXp+QPt/ktxKqC70dQ7Ahhb3fdlsyGXUgG+T6
         1rUJne1q5dvwxwV/nEpWzDQNYwdiHbCi4GLmzOWlSSBKf/4oGK7FFusVZ4HFy0z2UZt5
         WCWwT5h+xZlGf6hBHyWGla1d1vA6Fc9/8hQAI572vAUyV4YMDqOlvDwf0X2of1HnYkjK
         ZcRHz9H7DPJN8In6UyQ1gO07OdS/S+YFEAtm4WerNmQaBNNr4KFhPnbEvaC14O86C5du
         S40g==
X-Gm-Message-State: AOJu0YzAscoF0EjX7+BQZmzknJDjBZnsNgCxlmTSJ59pqfix1lkt4tNX
	g1wLeTrU3lTdUnyNZymtredR7cEiYqckuynNi4AOJ8Nq9CjF6PPfedWoiJSlNfEFifmC/pEpdcC
	yP7RNrh4vwxGAWcOShvoT/M4DMW8=
X-Google-Smtp-Source: 
 AGHT+IFzbr2DgW8GIVJNnbV1+DHjrXhqslg/F6avzBMWVrzX3kV9kfUPfDfG5RJGEOHPur+i+8iecnXjYbDLbHXJDk4=
X-Received: by 2002:a19:4f52:0:b0:510:e05:435a with SMTP id
 a18-20020a194f52000000b005100e05435amr146518lfk.26.1706209941469; Thu, 25 Jan
 2024 11:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
 <20240125103117.2622095-6-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240125103117.2622095-6-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 21:11:44 +0200
Message-ID: 
 <CAHp75Ver-NMTtHmeE9+sdnt1FVH2iGhXQxQf21jjDGOn+6mbhw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit()
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MYM3COYTX7NDGKZTLIH2FHA4PVZBF2OJ
X-Message-ID-Hash: MYM3COYTX7NDGKZTLIH2FHA4PVZBF2OJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYM3COYTX7NDGKZTLIH2FHA4PVZBF2OJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 25, 2024 at 12:31=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Refactor the code in cs42l43_mask_to_slots() to use for_each_set_bit().

...

> +#include <linux/bits.h>

> +#include <linux/find.h>

Of course you can leave them, but I think we more or less _guarantee_
their inclusion by bitops.h, otherwise bitops.h will require those two
in _each_ instance of use which sounds not such a clever decision.
That said, I would avoid adding them here as the compiler would need
to mmap() the first page of each header, check the guard and unmap,
and repeat for each header. This will slow down the build for no
particular reason.

...

Adding nslots parameter is a good idea, but I still think the code can
be refactored better (have you checked the code generation, btw? I
believe my version would be better or not worse).

> +       for_each_set_bit(slot, &mask, BITS_PER_TYPE(mask)) {
> +               if (i =3D=3D nslots) {
> +                       dev_warn(priv->dev, "Too many channels in TDM mas=
k: %lx\n",
> +                                mask);
>                         return;
> +               }
>
> +               slots[i++] =3D slot;
>         }

       i =3D 0;
       for_each_set_bit(slot, &mask, CS42L43_ASP_MAX_CHANNELS)
               slots[i++] =3D slot;

       if (hweight_long(mask) >=3D CS42L43_ASP_MAX_CHANNELS)
               dev_warn(priv->dev, "Too many channels in TDM mask\n");

The code is simpler and behaviour is not changed.

--=20
With Best Regards,
Andy Shevchenko
