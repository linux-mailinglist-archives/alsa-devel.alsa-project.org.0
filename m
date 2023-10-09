Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BA47BD468
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 09:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7764084A;
	Mon,  9 Oct 2023 09:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7764084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696836906;
	bh=uXlQSAfmtArxI0wO8qNKWV2PEJcM6NSiMmxFOuoCz+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZNZMEYvnnB9Sg+NERK182jh72xe9JeN3O/lQoKVYX90wxTgPnwZj0h+td6+L+eIWR
	 08FdjGc2JU/K/8nINZxBfiypRqtAxHodpguB5DqDv7od6R0prOHFK6QNbMEaB5WMUl
	 wqEOjqvVxkJ1mnhIASRGev5IfGKZVzR7+WIQnRsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D783F80310; Mon,  9 Oct 2023 09:34:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 277B3F8027B;
	Mon,  9 Oct 2023 09:34:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B3B1F802BE; Mon,  9 Oct 2023 09:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B4FBF80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 09:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B4FBF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Pnq9RGse
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-59c215f2f4aso51257547b3.1
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696836832; x=1697441632;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP7xqMhAKNqUEZKvD5L9l4hvT2pSYO7u42JTWvOuPhA=;
        b=Pnq9RGsejkwsU8/0RaHdTx7VgwWghmuDAhC4/qUAldIkGhXrKRco6f4JNjjEjPeAen
         nVjIlo5li7Yi8Eb6+kbRFUbBOEshDz/YZu78ChcM68c28KajwWlUIRQUJuUX0o1OB7Wc
         0y+MJ/5hej1vyqAOXOexKiD3ggljOdMxWmng3olSNorKPHmXCIRFEDzCCy+RIWXpXV/C
         Uz48iUg+dxhXy+xtwJGqhM7c9mps+FUrO942qNM3/9undXduoEhWEu+3heowmX0AZRwO
         5KOEhegvj+dfsytnif8WB4k39mZczzuqDCW8BRpdj0D3YFCAx4ITV2ue7XZCmpup27pQ
         NttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696836832; x=1697441632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP7xqMhAKNqUEZKvD5L9l4hvT2pSYO7u42JTWvOuPhA=;
        b=SGqO4fsaf18qrhCfck8x0KMB9cOHMRB+FWtnqqxRuTJ68iHtiWCtE/3sUqAOG0XmUq
         S5JkzfhWDWPgq6b9upkCtjvuOvUUQLe8H0bkzk9wm0wmKUWEXBX8v4nTe/EomrVsLPMP
         S00QWtZRMQ0+9VevyCcCy9fWxnzEGUM5fJAUlWEJNfXcH1hHFdYZ/+Ecgncu+w7Q5Ik+
         NXUHj/V2ywLfW//w9gX6rDxObNGGRcXsqksWRdkj/i6snS/8aTPPMZu7FBrCvE6HXmit
         2/Yjmt1F3iVqBYn7It4flkvv4yzHQnIvqWYARW8HKlmSuTv+TtO0dL+Bp707YYIDcxHg
         FwDw==
X-Gm-Message-State: AOJu0YwChxp4oYEY3OgpU4dVxizlIf5cGn+d5q/Xt/GspBUVmYY837wW
	rhD9+Lfz/7zONQbpN3um84NnempX2PW14h+uAUek9A==
X-Google-Smtp-Source: 
 AGHT+IEDf+tWdei5nh9+KrKswBou7fmYuReydda8UjjPzL2odlFWlTYW4DCNoTjmggrOubAGLysy56eT9xq/AxYA+4k=
X-Received: by 2002:a81:840e:0:b0:589:ca07:c963 with SMTP id
 u14-20020a81840e000000b00589ca07c963mr15807832ywf.42.1696836831997; Mon, 09
 Oct 2023 00:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
 <CAMRc=MdY2DU1R5_Ntkhw6UP0Vp+uhyUvti72KChBQqSF1ruWPw@mail.gmail.com>
In-Reply-To: 
 <CAMRc=MdY2DU1R5_Ntkhw6UP0Vp+uhyUvti72KChBQqSF1ruWPw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Oct 2023 09:33:40 +0200
Message-ID: 
 <CACRpkdb9fQUUq5_AOwXewiWfUjmu9r2SHHy-RSjfR_33znLiFQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: A3KFV2JC5I2CBT25HZTWKWEKVTPACQMJ
X-Message-ID-Hash: A3KFV2JC5I2CBT25HZTWKWEKVTPACQMJ
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3KFV2JC5I2CBT25HZTWKWEKVTPACQMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 9, 2023 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> > +#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
> > +               { "i2s1-in-sel-gpio1",  NULL,   "mediatek,mt2701-cs4244=
8-machine" },
> > +               { "i2s1-in-sel-gpio2",  NULL,   "mediatek,mt2701-cs4244=
8-machine" },
> > +#endif
>
> I suppose this is a run-time dependency only for the other patches?
> Can I just pick it up into my tree?

You can, I was just thinking about bisectability and the low risk of collis=
ions
with other patches. (Actually no-one gets hurt if it's applied to both tree=
s
either, which IMO is perfectly fine in cases like this.)

Yours,
Linus Walleij
