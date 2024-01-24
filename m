Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F25183B36C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 21:59:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29DA5857;
	Wed, 24 Jan 2024 21:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29DA5857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706129950;
	bh=oRZyBk4xN+U2BmP37TiRzcG4wQHneKczqa+lVweiFV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AqZ/7LTRpL3DlXf80GQMjf4CQPx1KiQ6mVT00glZSucY38RtDA4RaLdojMfrkN3cW
	 uvexeue4QQId3p5jJCrelvHyy7megtC5GE1yX84aoxJ25ADI4ipDaC41gtksswRYU2
	 LyWUWgzIPAabH0oI2QixqLYfps6UtzDFhG6yDk7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B40FF8057C; Wed, 24 Jan 2024 21:58:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43710F8057E;
	Wed, 24 Jan 2024 21:58:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E660FF8028D; Wed, 24 Jan 2024 21:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B86AF8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 21:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B86AF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BySBw5jg
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a2d7e2e7fe0so16040266b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Jan 2024 12:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706129906; x=1706734706;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvIma4Hp1tTx3eIr9boX1gjmScOYBle3eU0PR0ZkDAs=;
        b=BySBw5jgBJ77l3MrzY8E1fcVFS1iRDqUBG7KbSlsurFxC4WlB7srxrLDoWisL2uaIc
         3TMS2dWABpbOBNc1GI0gRqJUnWdswlw8UCLVYS2HTsOUTL98fj9RlEE7ewd/SfqOe5yJ
         yyUQElqUeZC8dp49ahN43eEdOxmZ+cNFNTPI7iZ92PVdRlsQ59JXG2avkmu9MWvhEf9H
         /p9eO4SEFE5NikYY3fUeqndtMn+tZoDPdTh50snh7P/jQe8be93/BHMhD028XpReFVGY
         1i9DohCfYE3AjyB1NHTjyCmwfJ2G1Igp6DexFesPVe0YPm7bJo2u8PSdzyCw0kiJ8BpG
         rJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706129906; x=1706734706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvIma4Hp1tTx3eIr9boX1gjmScOYBle3eU0PR0ZkDAs=;
        b=Bw/X19hbqoe2llCpBNwjlpYNZIFcAkKyxetaktw9ONARl0grWwPUAde6zBXMMcMUAC
         +P/tyzcBaXVsXr0GgWgkxXYh0m+aUfQ6ft6kfw9ZVnqT+/q4r8hgrkpBxpIP8bB5LHSp
         Wm9X1NHhkPc9ei/Y/JYtBPGqz1KpJ9mSyXNHyR+Xjt1cKs1dsCsVv9OdKAitNcK91BlA
         1rb38F+tSHOK2zHaP2oKymuh1JorA+7KmQC4gn+nk/9uiQLTs8865Xfa590wl7f+RUa2
         q7B4nmkO9nfyeNktBHv1vUy7UefiBaqCDkqKmGeBzzEAZ2vf4bR7tCt2J4pOnApo3JEI
         fyhA==
X-Gm-Message-State: AOJu0Yy5Vogmivrg4AaBMYC+DTWCVTC01WYFMmd8hQFCem7R52PQ4I14
	hSXvZOHdsYep/XRt3Nnkd23oGV88XOlKWFi7/g9RDF8JYxRh1oz1ZzuSMJPmprRuH4K2NC5vUGA
	XNBCk9fV3RgUxHthp+IF6Er0qAHs=
X-Google-Smtp-Source: 
 AGHT+IE4lTolYWHa99lJvZsscH4sVwoa/SEtVdWBjozI0Wnb+XMG10MlRl6sH5qzu3xXFTTwxAjMS7QN/w5TxVyLKVs=
X-Received: by 2002:a17:906:858:b0:a31:3417:218e with SMTP id
 f24-20020a170906085800b00a313417218emr214223ejd.77.1706129905580; Wed, 24 Jan
 2024 12:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
 <20240124153016.1541616-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124153016.1541616-2-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jan 2024 22:57:49 +0200
Message-ID: 
 <CAHp75Vea6odZHUKQrFuOg-Nj1UXuj_+X9qKJZJ58dQa+R78OFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] mfd: cs42l43: Tidy up header includes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, broonie@kernel.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SX2L5YFPN7XZLRCTHNN3F2DRW2OYSAVT
X-Message-ID-Hash: SX2L5YFPN7XZLRCTHNN3F2DRW2OYSAVT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SX2L5YFPN7XZLRCTHNN3F2DRW2OYSAVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 5:30=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Use more forward declarations, move header guards to cover other
> includes, and rely less on including headers through other headers.

Thanks for doing this!
My comments below.

...

> +++ b/drivers/mfd/cs42l43.h

> -#include <linux/pm.h>
> -#include <linux/regmap.h>

> +struct dev_pm_ops;
> +struct reg_default;
> +
>  extern const struct dev_pm_ops cs42l43_pm_ops;
>  extern const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS];

As far as I understand C, these two changes are incorrect as the
header _is_ the user of them, i.e. it needs to know the definitions of
the used data types because they are not POD (plain old data) types.
But I will learn something new if I'm mistaken.

--
With Best Regards,
Andy Shevchenko
