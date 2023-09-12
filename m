Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C6179CF61
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7378E96;
	Tue, 12 Sep 2023 13:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7378E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694516902;
	bh=QKG1SWF3HKhPRUequWYKXhEJas6cFzK5Ex3YtJRhqkw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ENHY+Pk0Pdu9wL4K3D9v+qn6qepzuXmIaYMeYzToXzMS23LECCMyiHzzUAu2xF4Gl
	 ggCBSRb3phWkGP7Z6vvuD/Iad95bhBHFsutDKm9S84p5jiO2DHlaI7VGmOV6SeFGLM
	 ALPVBzxWVUryUb5/hhA1yIIn5LZX8ELiAS1+p/w4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1DA8F80578; Tue, 12 Sep 2023 13:07:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0EF1F8047D;
	Tue, 12 Sep 2023 13:07:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2CCFF8047D; Tue, 12 Sep 2023 13:05:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AAC6F80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 13:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AAC6F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ng+y0V0V
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d7f0a60a159so4766885276.0
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Sep 2023 04:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694516708; x=1695121508;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FMoBWtmvLq6bgdekThyp6v4fhBAV0YiqC8BS8aCPcE=;
        b=ng+y0V0V/LPHafQzkCt/FjVLRJX0vcb/BHrz86RogRuy1FIjxSvJ0QqSi6LuRqrkvG
         6ARYj9tFXUjfJm7eRBz8ivLosp2cdsQTjYEv6oeH6Q0dz3srpdEqORvFspHu5Pa0FMXN
         XuEsajdZzR344QZzLXltYm02HOvVW50tgp9H3N20Q9nygknwuJR1Ktl6+8YiU4aj2xrZ
         Tj8jMKdJiqk569nVNLigRKbXmCuCpUaXV70F+7LxO6Txp7wZ+SzyFTI+8P1q5+oIW7Hq
         fW7KEDRbZLj74LJh8SdqOqQt3hbrSYpfHLfFIC/MS9sn6MOmX686nYzBgUKZnh0046OV
         bjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694516708; x=1695121508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FMoBWtmvLq6bgdekThyp6v4fhBAV0YiqC8BS8aCPcE=;
        b=IwnQkZltVzDSuF77JHGs1a/LdYnzVRg6fay1Ri8Psa2gI+X3C75Ktfbcw7PC0QvM91
         WpjRCsySUZMbGPQxTUgBkdULBICU2UrxmwCFgIkQwx/ILYmy0afXN0R6wPgka5DQZngv
         cUfIKvKc7OCk9a4zBsaapV7E53SXDcwJ/tvFKi3NxIFOgFCkxtGIoreHycHUc66KNI+o
         jsPvhkyaQ8ThKquj6Wr+/Kag4ZTJdRteSV/1lgtlRHlJkxEZphZ+c8OcetVLDpJ3rXWS
         K5Qq3gFrqrv/cdTlnfDNQ4RknHIZ7/HIagJC+mQedy7+blOdu5R4rATMmOfcje3e1giU
         H4KQ==
X-Gm-Message-State: AOJu0YxH47frHV9K3DO4cPAcsK4As9EiUhJMUUW9LODxo9y8Ue+Q91wB
	JmF0Teuyqe+rwJYDZXMtoXW0E95nw30HkYcIjzaHZA==
X-Google-Smtp-Source: 
 AGHT+IHWFG9XShCR9EYCQbjpGN6Qxg22q5tUHNLhGUJSf212PqAwCH8zHTtn0AYfPfJADbtFAnVTC3aGLAvqi8JMMgU=
X-Received: by 2002:a25:d695:0:b0:d62:6514:45b7 with SMTP id
 n143-20020a25d695000000b00d62651445b7mr11205815ybg.37.1694516708153; Tue, 12
 Sep 2023 04:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101505.225899-1-herve.codina@bootlin.com>
In-Reply-To: <20230912101505.225899-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 13:04:56 +0200
Message-ID: 
 <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
Subject: Re: [PATCH v5 28/31] pinctrl: Add support for the Lantic PEF2256
 pinmux
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AF72XXATDGZ4T3IPEYZ27AFMTPMW7Y46
X-Message-ID-Hash: AF72XXATDGZ4T3IPEYZ27AFMTPMW7Y46
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AF72XXATDGZ4T3IPEYZ27AFMTPMW7Y46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

thanks for your patch!

On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:

> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
>
> This kind of component can be found in old telecommunication system.
> It was used to digital transmission of many simultaneous telephone calls
> by time-division multiplexing. Also using HDLC protocol, WAN networks
> can be reached through the framer.
>
> This pinmux support handles the pin muxing part (pins RP(A..D) and pins
> XP(A..D)) of the PEF2256.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Nice to see this as a proper pin control driver!

>  drivers/pinctrl/pinctrl-pef2256-regs.h |  65 ++++++
>  drivers/pinctrl/pinctrl-pef2256.c      | 308 +++++++++++++++++++++++++

Do you really need a separate header just for some registers?
But it's a matter of taste so I'm not gonna complain if you want
it this way.

> +config PINCTRL_PEF2256
> +       tristate "Lantiq PEF2256 (FALC56) pin controller driver"
> +       depends on OF && FRAMER_PEF2256
> +       select PINMUX

select PINCONF

> +       select GENERIC_PINCONF

This brings it in implicitly but I prefer that you just select it.

> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*

I think SPDX mandates that you start the tag with C99 comments

// SPDX-License-Identifier: GPL-2.0-only

> +       /* We map 1 group <-> 1 pin */

Also known as "the qualcomm trick", but hey: it's fine.

> +static int pef2256_register_pinctrl(struct pef2256_pinctrl *pef2256)
> +{
> +       struct pinctrl_dev      *pctrl;
> +
> +       pef2256->pctrl_desc.name    =3D dev_name(pef2256->dev);
> +       pef2256->pctrl_desc.owner   =3D THIS_MODULE;
> +       pef2256->pctrl_desc.pctlops =3D &pef2256_pctlops;
> +       pef2256->pctrl_desc.pmxops  =3D &pef2256_pmxops;
> +       if (pef2256->version =3D=3D PEF2256_VERSION_1_2) {
> +               pef2256->pctrl_desc.pins  =3D pef2256_v12_pins;
> +               pef2256->pctrl_desc.npins =3D ARRAY_SIZE(pef2256_v12_pins=
);
> +               pef2256->functions  =3D pef2256_v12_functions;
> +               pef2256->nfunctions =3D ARRAY_SIZE(pef2256_v12_functions)=
;
> +       } else {
> +               pef2256->pctrl_desc.pins  =3D pef2256_v2x_pins;
> +               pef2256->pctrl_desc.npins =3D ARRAY_SIZE(pef2256_v2x_pins=
);
> +               pef2256->functions  =3D pef2256_v2x_functions;
> +               pef2256->nfunctions =3D ARRAY_SIZE(pef2256_v2x_functions)=
;
> +       }
> +
> +       pctrl =3D devm_pinctrl_register(pef2256->dev, &pef2256->pctrl_des=
c, pef2256);
> +       if (IS_ERR(pctrl)) {
> +               dev_err(pef2256->dev, "pinctrl driver registration failed=
\n");
> +               return PTR_ERR(pctrl);
> +       }
> +
> +       return 0;

You could use
return dev_err_probe(...);

> +       pef2256_reset_pinmux(pef2256_pinctrl);
> +       ret =3D pef2256_register_pinctrl(pef2256_pinctrl);
> +       if (ret)
> +               return ret;

Or you could use it down here.

With or without these changes (because they are nitpicks)
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
