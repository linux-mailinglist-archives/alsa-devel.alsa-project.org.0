Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C14AF83B499
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 23:24:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 426A61E7;
	Wed, 24 Jan 2024 23:23:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 426A61E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706135046;
	bh=3Vr69uK7BSFYNxz796gYHrPqlNXsnLg7NbuafXrMkj4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lqGMru/aukgyDSQuNymxbmHWWxiP+TvvEobqHPuuSeU4pJVcrAFCkKTbKoNi8m3ao
	 o3s8sR25nLByJa3JCsbEODaL+4ZYof/zysXuBpnw2w6l6IymGkaqi+uqbyPlEp+Cdi
	 LluoTTpHp0ML2skCo1Jws+h4ARUq7/YK/e6yUPh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5595AF8057A; Wed, 24 Jan 2024 23:23:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82D45F80494;
	Wed, 24 Jan 2024 23:23:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B588F8028D; Wed, 24 Jan 2024 23:23:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D09CFF8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 23:23:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09CFF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j9wLzc7x
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a2c179aa5c4so642131066b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Jan 2024 14:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706134998; x=1706739798;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMj5uLqktj5HGUUTmToIqV4KLUAc7XfkVocVV9e55Ls=;
        b=j9wLzc7xWRM/2LMkzF/sacAeEev0bfz+eiP+2WM1hJId6r1lo2ZdJToQ1r73WMjCsS
         hbSiqSAwJgWxxpxFvYZhJM5GE7tSGA2B526cvUbmSI1XScgFgStfo7S58xDLT6a7DGAb
         caKtSqNNnq1mYoWk+UpsFAITGRW4r6Bj1yLvv6Y2Ua+QoWPA/xr4h1ibBO+vaLOuv+Vb
         TAnAQfhirfLTsi66BQagr2tVHbJxKdiR+0n2KzvpdrxgPKWm49xvxykxFjSO1l2tcd1s
         OQuMlYG4d6HKp5QY8fQV9W6/rIJKGiIv5yWYH9JnjxJfK3OJpi6NU3avGGE1013t24+M
         cFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706134998; x=1706739798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMj5uLqktj5HGUUTmToIqV4KLUAc7XfkVocVV9e55Ls=;
        b=E4rzHtKoIhoaP9UAcdr7cOqfgUL26MDc5BH4IKPbfZbSP7PtVw6572gmPTtu9Rju6Q
         YuId/PEJAg5htMyLSQkMvU8SA0bLMf4K4Tn+YEzP2pX/IWkV3VK+eCXtX/l0fUAfbldg
         WKrNEEbaU96xFAy8HrbzXVuYIXeE4tYRICnsPRRLLgxiLjEcd1mqhovLv5tygIrGY0hV
         opacEetLUfwlRNHdbqKTdVP8+agFtlgFu6J/IyUfvdrqIum9HOYbzENKTd3YyCPQzZer
         B7BHhgvS2nSmC427yQXOgzIBLSQ2z92C2t05AXVTJhcCI0YY4esiYEcafRo7BmlK7+hx
         13AA==
X-Gm-Message-State: AOJu0YwSduQXM7rRreY1zhoraazTpFZmoNwlTRPQdsZRNBDVKV64ub3X
	Zgfud8/WgF3oufjG2wxwa/09FR8x2DNDxMGP6bVolSaczrmY6f4V9mgp7hUKcTQo/FC7ebTKo4j
	ISSwY+UBSY+qJT25BWRKJ2y7DDV4=
X-Google-Smtp-Source: 
 AGHT+IFtD5HkkCuLmgQzJuf+b1WbI7rMbvdgg+fisAgWCI2O9wkRxuHSTOcyXgzRViTsGgwtQM0d65TY2hSq+KPLMos=
X-Received: by 2002:a17:906:7da:b0:a2e:99c4:c61d with SMTP id
 m26-20020a17090607da00b00a2e99c4c61dmr10531ejc.106.1706134997896; Wed, 24 Jan
 2024 14:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
 <20240124165558.1876407-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-2-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:22:41 +0200
Message-ID: 
 <CAHp75VdHD-8QMvFgfmfhnkLKJgaTTAJvAXXEJ+cvx-1bmDOERg@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: cs42l43: Minor code tidy ups
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TARJVRBGTPC4AVNGWZGKRQKOX67AWUCJ
X-Message-ID-Hash: TARJVRBGTPC4AVNGWZGKRQKOX67AWUCJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TARJVRBGTPC4AVNGWZGKRQKOX67AWUCJ/>
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
> Add some missing commas, refactor a couple small bits of code.

...

> -       BUILD_BUG_ON(ARRAY_SIZE(cs42l43_jack_override_modes) !=3D
> -                    ARRAY_SIZE(cs42l43_jack_text) - 1);
> +       static_assert(ARRAY_SIZE(cs42l43_jack_override_modes) =3D=3D
> +                     ARRAY_SIZE(cs42l43_jack_text) - 1);

Now you can move this closer to the both array definitions (as
static_assert() can be global, and basically that is the idea behind
it, besides nicer error messaging).

--=20
With Best Regards,
Andy Shevchenko
