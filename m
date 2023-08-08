Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B8B773935
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 11:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28F3982C;
	Tue,  8 Aug 2023 11:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28F3982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691485353;
	bh=XQW1Um4HbPstW/1zALIOgdd++usPmgJ1uvTV0KvHH5o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eBoOHNMizhD6LGflrWkRbuHekXOJB20bVNPLdoP9h9M/To05+MyY8xJbiKZGQoRpb
	 FhdE5Wy2v87yijJq/+hVc/ImTIxGPjqdKV3LsYoevr7C57VnEgpbpZBiZ1QPdMbWwb
	 470CU+3up1kgwu2fYhLGn4SRRi9lRSqiyvgwDWMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 985CAF80549; Tue,  8 Aug 2023 11:01:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 229BAF80154;
	Tue,  8 Aug 2023 11:01:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C276DF80534; Tue,  8 Aug 2023 11:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA015F80107
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 11:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA015F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XgVkUGBp
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d3522283441so4475638276.0
        for <alsa-devel@alsa-project.org>;
 Tue, 08 Aug 2023 02:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691485265; x=1692090065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1jWjdgcMtkS8z/zWGRD8ihE010a+ozHwBFvKhqo23k=;
        b=XgVkUGBp1nctkpgdjCXvFvdDGF0+Z1WDm33gz7rg6/H+T2ZRZTX9DxPn0KoMIiD3dY
         xNbMa6eJ2AyOWnJjLuasts7tvJVQ3Dg6YvPrh3Nri4G1wxDHL4uL10ym9Gs0oUs9Fo6u
         hhFEkClARPAwGARHkfSsOs6ygfDKz4pHU6ENmDzgyXPloNMWEPIglMU8Jnr//pNSj0PQ
         giUvr8Nz3r3fWDS6mCSd41BxLhziUV2Mfm4s1hZHymOnuGE1hF2wcLbUM+bf+6eeDCa8
         st8J9cEYVQSjFpMM93yMRDXB0l2P7dkPxXuT2dICoJHsW1dfve9XDBjZ06qXqBXQEQu6
         Ih+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691485265; x=1692090065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1jWjdgcMtkS8z/zWGRD8ihE010a+ozHwBFvKhqo23k=;
        b=D1X4R2GLPW4cSVeOrG0JgV6a4u8kvmIJ66uDGT6cQ/E/3RVtseBzAjsKeB1Io5rMgI
         NwjLC5ueienR2cJMAO25nplC3X5U2NYr0Mz49js3se3z+brXB6lPlljfjLVjgzSBBEpX
         2Ya/lsRsUbn2a3a2orxwGa9k1KgcT6b8AciozUNE/KeS8S0W4sKqX4y2xEe9GHk9P08g
         CDk/i5Qiabr8NNk+yf+GAMhiqyt2h+HumbbQLA/oKiRTpZVn4EZFGrJ2FPwkpw6qUz4H
         Xdo6fvoS4KGQmt4cBjfikMzLIGfsBCC2iY6adTA1Y2Tq8KSUdGuNEMzCSj2PP5E7jvVH
         bxVw==
X-Gm-Message-State: AOJu0YxZX/E0QkcdBK0QxM/7Rwc+gb9qT3H7MJE1DcgOrDYezb1D3cgi
	gyjXHFjrk+uFLrxZxJZ3zz82BoVjDM8xCKnXX4ZfIA==
X-Google-Smtp-Source: 
 AGHT+IE/m/O86+1kRO0A1smGtafOuu/t8la0fmfi5L2yurMCmbtwgtH9QAEdX4VoPwi2Z4+7B32cwpghwJP0TuXuQTc=
X-Received: by 2002:a25:5083:0:b0:d47:5994:c0fd with SMTP id
 e125-20020a255083000000b00d475994c0fdmr6301271ybb.49.1691485264866; Tue, 08
 Aug 2023 02:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-25-herve.codina@bootlin.com>
 <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
 <8f80edf2-c93d-416f-bcab-f7be3badf64a@sirena.org.uk>
In-Reply-To: <8f80edf2-c93d-416f-bcab-f7be3badf64a@sirena.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Aug 2023 11:00:53 +0200
Message-ID: 
 <CACRpkdYuJ+4hccip+m9SDv63DZQ1+knFnUm431Ki-K5qi49ExQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/28] pinctrl: Add support for the Lantic PEF2256
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
	alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SKFM2RGFQ2EH5QX2KF4PPNASXNK4YUXZ
X-Message-ID-Hash: SKFM2RGFQ2EH5QX2KF4PPNASXNK4YUXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKFM2RGFQ2EH5QX2KF4PPNASXNK4YUXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 7, 2023 at 3:10=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
> On Mon, Aug 07, 2023 at 03:05:15PM +0200, Linus Walleij wrote:
> > On Wed, Jul 26, 2023 at 5:04=E2=80=AFPM Herve Codina <herve.codina@boot=
lin.com> wrote:
>
> > > +#include "linux/bitfield.h"
>
> > Really? I don't think there is such a file there.
>
> > Do you mean <linux/bitfield.h> and does this even compile?
>
> #include "" means "try the local directory first then fall back to
> system includes" so it'll work, it picks up extra stuff on top of what
> <> does.  There's a stylistic issue though.

Wow that's a neat trick, I learn something new every day!

But we probably wanna be sure to get the system include.

Yours,
Linus Walleij
