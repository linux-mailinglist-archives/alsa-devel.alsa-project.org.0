Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D97776B3
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 13:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FCC3826;
	Thu, 10 Aug 2023 13:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FCC3826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691666305;
	bh=FMBHaFchInXo2MGaUbXkfUM8b2tb//sQWxqalG2z0Fo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B7bQP3dH+MNQ9s4cjiVocmSbAEIATd4dbsAdLUjg73j0DhM2G/f40W6BCmDUY+csW
	 l6+TJN3jMdpbQ7gGywrzxpnPFS0BHPRGU4ob/LdDk4RvDpeEv6cb2I4UKyFgDpOsN+
	 9G1IwZiP5f1VFKOdhY6WPNp5fKo7X5tt3PJH9ZKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D2F0F80166; Thu, 10 Aug 2023 13:17:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D197F800FB;
	Thu, 10 Aug 2023 13:17:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D693F8016E; Thu, 10 Aug 2023 13:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B65DF800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 13:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B65DF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QFhKu9tk
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-586bacac98aso9750717b3.2
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691666241; x=1692271041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADRnTf+HtriZ7mqwDU3wWvmXrT7FB+Ztxvgw7H2KXeU=;
        b=QFhKu9tkFZ+fkU1lcY4zVfF0dk/FWoUgZD0eH36Sz7H5E6vylleVAxrx4pnTaXqwhk
         0+gy/gZj3JZk12Km6iz/EZoWzKbi128l5ProuMk6rD8PXzxfQdAWHaHfYFH+hT3tRM5T
         JhuEe8IlHx2uTiKvZWsgQrv6fkFqrBx0+2vETEZCqjNX/pWDMRwL/0BRd5MvDHtFVvKa
         BM/Lp+D9Uqm7WCUrVCer3WiE1OLLbVSPYEz4lyAydeXxxun5B/2ka3EMFk7a+ErH42db
         gw2/aA6IBStBu2S2LDjrdyts3q5jk/zxoySCSTATECPSlKOeat6hCKBGV6ZorzoWY9HV
         DN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691666241; x=1692271041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADRnTf+HtriZ7mqwDU3wWvmXrT7FB+Ztxvgw7H2KXeU=;
        b=kV2v8MbRqKrWHVtujtVJlhohLywerJwTP1PNRpsxWnGdwTAyC4md/RK6PDXs8dcN4W
         +PMv4l2j4K+jm9fwPpEQ0U2kNUv1IiiZNBDxoy6Yd3bk83dHyvpzMWiI8T0iwaGIsm/O
         kbf15dvmMV6abMeiqqH4ZzmUQdgMhvKnO8D0Tl3oiMMKM6Bdy994MVw3Iph/wB2SsVPV
         FEzcSDQZqHY2VXdQBRk+4g8tOiOiQiJjdgVLlKUpWW5Ncmyno+Yn15jIa3+VOdSyuD86
         +HtGRHjkNMd1QZBT2BNmJ0HKKVbBvfQf7l+HH8MPKCZpxe17l5+eeX4S/zt66jk1LHrS
         npXw==
X-Gm-Message-State: AOJu0Yy5sUaSOMyJOAfDMdEWpP/Pd9WzXMheNE0lA5mCvNKQHSUEZF3b
	cUlV0n7EYT/4PP7ImL3Ekw//ImfWv97UQLRcjD6FXw==
X-Google-Smtp-Source: 
 AGHT+IG0cc60EKwg6aO/Vl/FWx+h3xKBM7qpk0WTUOrKZYJlTlQ3xEW/05G+n7KdFt0H+qP3lFIXHa3H2q7KcJby2j8=
X-Received: by 2002:a25:250f:0:b0:cea:6760:d2c6 with SMTP id
 l15-20020a25250f000000b00cea6760d2c6mr2046852ybl.41.1691666241474; Thu, 10
 Aug 2023 04:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
 <20230809132757.2470544-22-herve.codina@bootlin.com>
In-Reply-To: <20230809132757.2470544-22-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 13:17:09 +0200
Message-ID: 
 <CACRpkdZQ9_f6+9CseV1L_wGphHujFPAYXMjJfjUrzSZRakOBzg@mail.gmail.com>
Subject: Re: [PATCH v3 21/28] net: wan: Add framer framework support
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: V2SGX7NGG2LYFT6X5BET2KDST5EMQHIE
X-Message-ID-Hash: V2SGX7NGG2LYFT6X5BET2KDST5EMQHIE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V2SGX7NGG2LYFT6X5BET2KDST5EMQHIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

On Wed, Aug 9, 2023 at 3:28=E2=80=AFPM Herve Codina <herve.codina@bootlin.c=
om> wrote:

> A framer is a component in charge of an E1/T1 line interface.
> Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> frames. It also provides information related to the E1/T1 line.
>
> The framer framework provides a set of APIs for the framer drivers
> (framer provider) to create/destroy a framer and APIs for the framer
> users (framer consumer) to obtain a reference to the framer, and
> use the framer.
>
> This basic implementation provides a framer abstraction for:
>  - power on/off the framer
>  - get the framer status (line state)
>  - be notified on framer status changes
>  - get/set the framer configuration
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I love it, very clear commit message telling us what it is all
about.

The placement in the WAN subsystem also hints that this has
something to do with long distance links (relative to something)
so maybe mention that?

> +menu "Framer Subsystem"
> +
> +config GENERIC_FRAMER
> +       bool "Framer Core"
> +       help
> +         Generic Framer support.
> +
> +         This framework is designed to provide a generic interface for f=
ramer
> +         devices present in the kernel. This layer will have the generic
> +         API by which framer drivers can create framer using the framer
> +         framework and framer users can obtain reference to the framer.
> +         All the users of this framework should select this config.

But this description just says this is a framing framer that frames frames =
;)

So please copy some of the nice description from the commit message
into this Kconfig helptext.

Is "long distance link time division multiplexing (TDM) framer" more
to the point for example? Or is the ambition to frame other multiplexing
techniques as well with this subsystem? Such as FDM? Then mention
that.

Yours,
Linus Walleij
