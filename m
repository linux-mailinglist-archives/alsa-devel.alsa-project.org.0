Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E603C78200E
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 23:07:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CC3839;
	Sun, 20 Aug 2023 23:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CC3839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692565648;
	bh=ITQBrBvBXbCRX6anxOKmpcGFL8+Kpgc9coH+En4cHpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hKq2FLrf7GTLL/8dnJHj+/nRT2kXsy0itXZl99d9PiWBvbp3BGtaJ0i9a77i0ZQSR
	 9QxnFyO1HqzvWa3C6kCmhtoV2uhe5E9GI2irHZfIEkNnf+nVUBrjf9vY7ZQ9FF9Erb
	 OddFh/TpsNkw+//pr+snNVb9yh/BTEUwl4Wzu3Uo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21EBDF80272; Sun, 20 Aug 2023 23:06:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA31FF80199;
	Sun, 20 Aug 2023 23:06:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 499F1F80199; Sun, 20 Aug 2023 23:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 738A1F8016C
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 23:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 738A1F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EkbIjelb
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d665467e134so2807256276.2
        for <alsa-devel@alsa-project.org>;
 Sun, 20 Aug 2023 14:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692565587; x=1693170387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD9cyaHgSU7OecxP7U/v+MRhNN5iRGNEtNN5f+NxK3E=;
        b=EkbIjelbdLkuzIuqi8lN2IaFia7QROWlfjiI7q7zlP6jDAvGYdauZr5rWGeP5TyNj/
         FTLwzTAVecCKL3BibvaoUCvO+gGncYmRqvynbSCU/H9CSnnaBpgnH1tOwcSw/jhwlTNE
         yxf9olC181R4u63D7T09ydG+I3s3ZtZ/u2PVgFULhzS48dJpD5wb5F9dF3a9Y+PsFYj+
         NHgSZ9uwlOzKa4/KiVA0h3lpcev49Jt9Lvu2vbMboOBUQF5Ovmhefg1ifsF1lEHMhDCm
         MbXMx2vz3Or/EDK9+/FBko1YDMvcoaLkgfWLakufV6DztPp4m3w4Zu6/QJHcRw+4VVzp
         LubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692565587; x=1693170387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD9cyaHgSU7OecxP7U/v+MRhNN5iRGNEtNN5f+NxK3E=;
        b=N/Il1EhMe4l/LJ3WjlNZ0gBkaQnbz2vMa+602248dv5h7RFmk9HhcnEbY9BsX21ZgO
         603b0JHqjv8/q+8zgx7hKFjPW4skVawxA9e7l0bwRgB+8tyF80DZhHRHg94OzWB98aib
         Z6On9B0c9qimAzxLCVkRZJU3Z0Sccyp/hP0ps7BfO6/NG9K6BytLttACqMpAaMXi5krN
         oS11HYzNWYdAivN3KMn0CBnCiltzb7NzjU5NyY08f8mC7c/V9AzvLxskrcNP4OnW3bb6
         1ciTiqa50UPR/fubph7lE/0F+V0rLtLWKb3eu0skhvJIUlukO2fxcz7hAd0hiHrSj6ij
         mkwA==
X-Gm-Message-State: AOJu0YxMJQi8wkoEgGZIO87jdTZH7brsvCtT63yxV1PnbdhqJ3RoIMoK
	qX7IcoTV/0xx6jRLYpEqvDWq/GcsgNM4P77u5gOngQ==
X-Google-Smtp-Source: 
 AGHT+IFUaS1hymFHjE/AoExPooLhJU9s7gYCM4hD5xHtjEpweKryYFaY4soUhFjoyRUlcRmul8KDvXSLKE35vGSqXJ8=
X-Received: by 2002:a81:7283:0:b0:589:8b55:f8cf with SMTP id
 n125-20020a817283000000b005898b55f8cfmr4756130ywc.50.1692565587414; Sun, 20
 Aug 2023 14:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
In-Reply-To: 
 <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Aug 2023 23:06:16 +0200
Message-ID: 
 <CACRpkdamyFvzqrQ1=k04CbfEJn1azOF+yP5Ls2Qa3Ux6WGq7_A@mail.gmail.com>
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WPU4SE5PXTN6I2SIHIVLVAAVSBBXSALM
X-Message-ID-Hash: WPU4SE5PXTN6I2SIHIVLVAAVSBBXSALM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WPU4SE5PXTN6I2SIHIVLVAAVSBBXSALM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 18, 2023 at 6:41=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> From: Herve Codina <herve.codina@bootlin.com>
>
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
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I had these review comments, you must have missed them?
https://lore.kernel.org/netdev/CACRpkdZQ9_f6+9CseV1L_wGphHujFPAYXMjJfjUrzSZ=
RakOBzg@mail.gmail.com/

Yours,
Linus Walleij
