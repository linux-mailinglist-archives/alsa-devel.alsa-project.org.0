Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CC2777374
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 10:55:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A0AD1DF;
	Thu, 10 Aug 2023 10:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A0AD1DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691657699;
	bh=8CynBnMXpUYc4aMechozTJxqBXCPClB9wkWXkRuAhC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SgWWtH8+FuTuhlJoAzMpgM2tui/vVbH8JPVT/QkkgZeSewM96rgAR4Fo5cgRb5VgU
	 RkNfyNUYEux4wUn0FnaY2jWhVK3UUwa3Arqj94wS2ceQds8AIEnNcAhm/ZEKjQTc3l
	 HNyRdIKnDubQorzQ7friCD7Zgc9fl8h0Rx5rlv0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C592F8016E; Thu, 10 Aug 2023 10:53:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8ABF80166;
	Thu, 10 Aug 2023 10:53:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCD40F8016E; Thu, 10 Aug 2023 10:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC04EF800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 10:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC04EF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cSx8JAyG
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-589878e5b37so8613627b3.2
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691657595; x=1692262395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISTwavJo5QNRA0ml/ZYkxWD9JkMB48oJk0Oc/hedKZY=;
        b=cSx8JAyGkOmdsAHLDtARFe5E+bmkrOnNzYHajkz/Im644aeTTP5xiTIfbcqyJUfyjM
         BWgv30uk2EgU3NPHpdPaFDcXp2dzkL5bmF7NQmKV/xk5hAbfSYA57I9FdoiPX6WTL5If
         h8yELZgSUyiI3o+78nsOuxVjK4znn77Cp/xnizFqIcinv/C96+9SADDtYu+wfKZEfO+c
         SqPxyPVMe1oUATXZyDVrBSxCsWaPgJv7fXDcSfajqF2J1NY6VnqOYeDWrWZNxrkG5oMc
         N+HtOZtTumcoJfYCMGjZR0FJqXZUsdejxxhXhj932VOqQMh7f/xkPB2IVDQbVJYtd2yb
         kJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691657595; x=1692262395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISTwavJo5QNRA0ml/ZYkxWD9JkMB48oJk0Oc/hedKZY=;
        b=j//e5mof0bEfKBEaV7dJ3OCLqtfzAn8Rz1rGyhZ/fd9blE1kZ2QURnBvKNy6fdCIUq
         P0qvacnUTK/xd2hYdxd1phHl40UKS4s7Y+8tn/MdFBOwtpniB+eqeS4j8Di2iuU/RL6H
         spsFqALAKOKuo1NcYfNslMJXXDCbQ5MEdX7Yzv8mzHsLqmsRiV9F4FtkEDVFmlGHmixo
         SMEQEdDnt++Y0c5N0ZPSg2Eh/cgNFjgBBLX+uq5FwZngoiFNRgqkqEpCbe4VrYYkfRyC
         q302zz2qIAJ0uSm8aeBaTObFrM0aENIHvOWTdEc1eq48a5IAOAg9EqSKnmGbpCPDAEj5
         zNVQ==
X-Gm-Message-State: AOJu0YyfQkk/YTf86O637jCh5+FIr/7EWcryb0pTFTeJI+47HQ5dfnun
	cw1xLxWmnucMbRZ+tEzaWSlMjDWvN+BUV3vKxAMDsw==
X-Google-Smtp-Source: 
 AGHT+IHR3OcxJgk9HIqvUQ98dw3GrFDpfjo2OZ3Zn5ukK1Ej8qavilwui19M8MLrNbXgTNYPBDiu1AU0FMOIqqB8uTs=
X-Received: by 2002:a25:6993:0:b0:d63:5e7:4e1b with SMTP id
 e141-20020a256993000000b00d6305e74e1bmr2168294ybc.26.1691657595551; Thu, 10
 Aug 2023 01:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
 <20230809132757.2470544-23-herve.codina@bootlin.com>
In-Reply-To: <20230809132757.2470544-23-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:53:04 +0200
Message-ID: 
 <CACRpkdZWHw7sL6EKe0EP0hX5TEsdhzgkPSdVtPPYhS3LqJRHFg@mail.gmail.com>
Subject: Re: [PATCH v3 22/28] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
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
Message-ID-Hash: 5ICDKX6GKFJEWSUZWNI23G5KE3YPCTE2
X-Message-ID-Hash: 5ICDKX6GKFJEWSUZWNI23G5KE3YPCTE2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ICDKX6GKFJEWSUZWNI23G5KE3YPCTE2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

thanks for your patch!

On Wed, Aug 9, 2023 at 3:28=E2=80=AFPM Herve Codina <herve.codina@bootlin.c=
om> wrote:

> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
(...)
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#

Shouldn't that be pinmux-node.yaml?

> +        additionalProperties: false
> +
> +        properties:
> +          pins:
> +            enum: [ RPA, RPB, RPC, RPD, XPA, XPB, XPC, XPD ]
> +
> +          function:
> +            enum: [ SYPR, RFM, RFMB, RSIGM, RSIG, DLR, FREEZE, RFSP, LOS=
,
> +                    SYPX, XFMS, XSIG, TCLK, XMFB, XSIGM, DLX, XCLK, XLT,
> +                    GPI, GPOH, GPOL ]
> +
> +        required:
> +          - pins
> +          - function

Because those are certainly defined in that file.

Yours,
Linus Walleij
