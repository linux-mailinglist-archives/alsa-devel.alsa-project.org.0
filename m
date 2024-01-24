Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 331E183B4F6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 23:49:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6710F84D;
	Wed, 24 Jan 2024 23:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6710F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706136545;
	bh=2k1/oB1b1xsSx/hwwozwCabonaX31FYcHee9Ghg3YQM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rFD9PFPeJ30Atfw/S/78reCGfq9zadIkeJ1HWCxNUtUVciDI732xKH1TpIWEyqYW5
	 54T0sXtY8djgSV6R7T0wuiPJ/odVnzZuJZfEW6k4rohO8NGWj6gObAe0VGCiAFISnA
	 cp87tAsvnBd9Z4t9N6cknyc4Czpc+7nQwoWwpafM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6954AF8057D; Wed, 24 Jan 2024 23:48:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2B7F804E7;
	Wed, 24 Jan 2024 23:48:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54A29F8028D; Wed, 24 Jan 2024 23:48:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C2F4F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 23:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C2F4F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TmvDUrcS
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a27733ae1dfso632984166b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Jan 2024 14:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706136504; x=1706741304;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2lDJfHqgAnsylYiJMOYGwOrJ3u54Vpc6bMpn+gMMhE=;
        b=TmvDUrcSYvi+XknQld21NuxqF7PXx9Hun43qXY1CxgW5kQbna6GI7jUz98eodX+utz
         dKzgxXdZrosgdBYuc1Mq2bdGQh1Rx65nH1WDyxxZnQ9DT08YhfOAgA9xVQcxOlu7SGV3
         0PCZGmA8lULMPMm1Rkg+/U5boQJp44+VvLMle+mGcsO0BkKxkKgDMWlyCRfTmV2Bg0sM
         IrLGowuCuCae12XBfGzr1kltrdECCMIQOHE9R3aXffZJN3zExRze76VoqtAmb61FqxE+
         N/hTqI5rQsykjQn8VVTgkCRsSh9ACZl728kjEt8kHpOYXhFEYMRbpgK5Upr/yHDsnTHU
         4KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136504; x=1706741304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2lDJfHqgAnsylYiJMOYGwOrJ3u54Vpc6bMpn+gMMhE=;
        b=PWy6zAOW6vg01a+HIE/9uu+szoxqo89xg1ONiqIvIhxSYYj2bcGtEb8mK/yKri9Ty8
         niLRzbaTf9OMDdKR7oiM5vMyHNige7H2G/clBT6p3I7wQz+bOWcyuLLvpXDETdVj5bcW
         GMYFxesXFbNvKfwrc1XyzqoPM00MEYrL781rPUK/Y96tvOcixrckN7sJVVqCrvcLXCeG
         2/1fobxHdC3GHRdRpQdV9hC8gDS8fen6K3epr0pfnyjGSs1c9l+2UxZKSPH9FxubajF5
         c3vxDx2+6NY6Si8/VZlN5bCshatMYU7gVHs/K1OCPQ7/ZVzqxkClaDPH1tWBA+lDYM/m
         BQ7w==
X-Gm-Message-State: AOJu0Yx+ystnykagFZ/bJKRmL2lF1mNFohnCmFTqdrJuAYL4fDLjwiw+
	l3Kr3FuELHsTnZgl4XCHc0scd9qsP4/rXTD0g9TybeWqcAN6TdQf627+oBSAnErLMredtXJVJDx
	1D14bYoxnvD5NJle/0PFTwA4xHIpwObq58dM=
X-Google-Smtp-Source: 
 AGHT+IHCheky8a8aA5K3Tecr1RkqI1DhEGpvVY5LyYTE7NlgxQkdJF+1lmYlOIPa6iL2VLYE6/P702J1Ts8m9SoehM8=
X-Received: by 2002:a17:906:4091:b0:a2e:81c3:80c4 with SMTP id
 u17-20020a170906409100b00a2e81c380c4mr17143ejj.159.1706136504221; Wed, 24 Jan
 2024 14:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
 <20240124165558.1876407-7-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-7-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:47:48 +0200
Message-ID: 
 <CAHp75VfbgJMvOgjgEU49y5zPV4RPPPR5e-nKv+oqP7ED6AsndA@mail.gmail.com>
Subject: Re: [PATCH 7/7] ASoC: cs42l43: Use fls to calculate the pre-divider
 for the PLL
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZJTFKGGIBYDZQ7HBGWVB6J3THTNV4WO5
X-Message-ID-Hash: ZJTFKGGIBYDZQ7HBGWVB6J3THTNV4WO5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJTFKGGIBYDZQ7HBGWVB6J3THTNV4WO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

Commit message?

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

...

> +       div =3D fls(freq) -
> +             fls(cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1=
].freq);
> +       freq /=3D 1 << div;

  freq >>=3D div;


--=20
With Best Regards,
Andy Shevchenko
