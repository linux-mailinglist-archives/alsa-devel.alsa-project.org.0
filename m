Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 519FB79DA8D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 23:05:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3725A84C;
	Tue, 12 Sep 2023 23:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3725A84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694552747;
	bh=Vn/+r9lrRj3XCF0f1OgbLrVWHe/dDEBlspgHejgs8pM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UfoYgA0tY8MxI5yleHvCatwxMpZ85Ysndgs3JER0cgG94dfCdZqKclVxGiM+8sjav
	 L/f1oScKg7MWM0LtwC0A4J5pLpje8V5U7m0qDloshfGhm/TC4lEFF1xBIRQA4oEhip
	 Lr645pdj03Pd/jHM7dxaPtV60oWaLsn9Q69GUtHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96611F8055B; Tue, 12 Sep 2023 23:04:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECB86F80246;
	Tue, 12 Sep 2023 23:04:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0337F80425; Tue, 12 Sep 2023 23:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D11EF8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 23:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D11EF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K2EiLPrI
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-d80089712e5so357884276.1
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Sep 2023 14:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694552683; x=1695157483;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vn/+r9lrRj3XCF0f1OgbLrVWHe/dDEBlspgHejgs8pM=;
        b=K2EiLPrI+NZK3J9rptGiFbcGbSogr9XTXZA8Cu1nm6kxnQfjGvWPS0syks25xkWoNW
         ZACX2D0yM2dLBHjx7s5hdq2XjopHM3cFOcdPluti9pUJTYvwtqrG0fct05EuhyLduoTG
         F0/0/gUBG6yDFg7yVL/s9VnlvaU5yaiT96usPOQp+1Qyb7BvWIjrCzWX/mCD0T0ehMAN
         xr2mC7cq64pNNs/Bf+HSZ/ADL8OQjfwChd97uSuAeWCPWf4FlhO5uzNw2CDaxgICquhw
         6vdtgW0DCBxKvwSaLt6eqmyZyzU+z9zVALrY7/bLrGo5oT0ofDIyogWAoiReU1zeiPII
         nH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694552683; x=1695157483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vn/+r9lrRj3XCF0f1OgbLrVWHe/dDEBlspgHejgs8pM=;
        b=vJqL3YKWNC5okFAZdOPt5JgiCbJZZmG18jswZ3MLCmqRGJTzQvPT+g7yTypWo3Hrid
         gEZfOHbm+7gHje+E0nuQhTH6BbI+PrJIxl4LGe79gosv2+TfsNpGbNSS1ERuG0hkxmYD
         J9p1GpWvLvS4HZDR1qge8vHckGo4VRDp7jD4+EEoyEP13hGyukk1YbbJhdGekzmkoXYt
         A0+SsDLgaH19AbdzuTx9a0NWmJndpG0jkU3u1W10ztf5rp3UF3R0LyrOj5fw9Dik2ECv
         JEHRRcZTcxu4mRlOp9OTmWOFTXS994y4ZjciATcx3sLlrywySxl8N0rCgf89+mU2UYZl
         pPyg==
X-Gm-Message-State: AOJu0Yxzyw+Jf8fBnSXL+OYDIgumwd5YZODVSl0CGC6W0HPMf+Nxdp3t
	zFwGuZNZrxhJaaYVCfBIVyfQ+hpESgli6U/EiKvrZA==
X-Google-Smtp-Source: 
 AGHT+IGQDuLaoE4eOyZT+Z8hNNsgfwvWorKJwQ3GNnopbwgh3VM6Y+HWcMTMFBMaepKaqB0s4OiEEYQ95/LJVmcUlZY=
X-Received: by 2002:a25:aa6f:0:b0:d78:414d:1910 with SMTP id
 s102-20020a25aa6f000000b00d78414d1910mr4091514ybi.25.1694552683091; Tue, 12
 Sep 2023 14:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101505.225899-1-herve.codina@bootlin.com>
 <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
 <71761f94-14ea-4e2a-a079-c74dfa32387a@sirena.org.uk>
In-Reply-To: <71761f94-14ea-4e2a-a079-c74dfa32387a@sirena.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 23:04:24 +0200
Message-ID: 
 <CACRpkdbZK8GUgOcLA2D=7nDejK9cT=bxwP+HcC0GOKr-0yCJ4w@mail.gmail.com>
Subject: Re: [PATCH v5 28/31] pinctrl: Add support for the Lantic PEF2256
 pinmux
To: Mark Brown <broonie@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZGFZPCVU5WJE2SQUFWZYDUPGIY6XGURM
X-Message-ID-Hash: ZGFZPCVU5WJE2SQUFWZYDUPGIY6XGURM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGFZPCVU5WJE2SQUFWZYDUPGIY6XGURM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 12, 2023 at 4:31=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Tue, Sep 12, 2023 at 01:04:56PM +0200, Linus Walleij wrote:
> > On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@boo=
tlin.com> wrote:
>
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
>
> > I think SPDX mandates that you start the tag with C99 comments
>
> > // SPDX-License-Identifier: GPL-2.0-only
>
> Not for headers, they should use C style since they might be included in
> contexts where C++ isn't supported.

Oh right. Thanks Mark!

Yours,
Linus Walleij
