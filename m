Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 721C678E282
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 00:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 217E1203;
	Thu, 31 Aug 2023 00:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 217E1203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693435607;
	bh=c8ij3BGvC7kzuvLSZjvMrrZh/NVUSlWn6CBvQxqPxkk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k/XjZkvr5QecSjJ+cl/Vx39pAEf7thgiFDX0Y7R6XikVIGTuLN6SDEq1xYkH8xwWR
	 8jiN/Mz8EWBFLOvV2f82qaK2UH0KH4j3nIWzk3ywS+Nb1QcgmQGNxin3meDD2vRnvb
	 wpNOmFV+54iQQJyyYIcMUAbEM926013O21Ep3+8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60F32F800D1; Thu, 31 Aug 2023 00:45:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E52F800F5;
	Thu, 31 Aug 2023 00:45:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D002EF80005; Thu, 31 Aug 2023 00:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F47CF80005
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 00:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F47CF80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=FXPKV35E
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-573912a7b14so161159eaf.1
        for <alsa-devel@alsa-project.org>;
 Wed, 30 Aug 2023 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693435303; x=1694040103;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMOv6qvYP7lBaNx84hgmzC8pacn6S2d4a2n9nMkFP+I=;
        b=FXPKV35Eh7qshtHgTaZ7f10k7vUK5hfYjAgpD0MPZqzE3jQ7TgZTkvKa0X8KpMbJs0
         +/WZYoPjvE4djCguryLbEYBC48FEV7Cv+b+PEs6I5pCVJkoYKZ95czXYBAcpbn7exDhz
         mpyBsTuqRAdxfWyFSUzbdVYL1+OMjUiuiAcub8fwbuVehLcVYxfGGrrsLy5rP1pei2zT
         PUBvSdN7kaytSRUhhSx/EZ79NSwxTRVd0gb+JqTOjmQtDdnALFr5O7BhPp6ynrJM+KuK
         3CF6Kar1CVgiLMwNM2Y+e2mtBM8S5MgteQlp72ewjd4x2C06yOVmRSvorn/A/yGE1WCn
         wrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693435303; x=1694040103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMOv6qvYP7lBaNx84hgmzC8pacn6S2d4a2n9nMkFP+I=;
        b=let/Kr4In8icjmASU/dr1SLaLrEg55hlxCaQXZJISZtH9Tz/yL+8Y23z8CSHd2n38d
         pfQWiPy7igUzWYcUboCBL4BonA1qZZKDCONK5HiDHKasIlbTmdVw8j3nPkqM921ESM5v
         7ADGT4bRXJvSUXTxKK/zETMkrFY+GLC6sKMtK7zx2KYUx5ImOxuqc8X/vsW0a5EZpIdk
         StNaEFzcuVxSU6JKcYsyWf4zN/Oeum4q5GEILZOCAJ47T6O5UgJw/gfOt1QWAGN/5PJ7
         CC+JOVVL/2w79agpJwpj9HJN6CEA2dffsWI+WSDNYlHAwSlOxxiHlwAGlhU20gZ84Uz+
         LCzQ==
X-Gm-Message-State: AOJu0YxTuSzX656bs00KP+NGcR1E/mVJEvn8koQeMLNCWcVxJ2sKxoaD
	BozRHg/CSjg2NRjyTEY8WHRcQxeadxW96w+GPTg=
X-Google-Smtp-Source: 
 AGHT+IGC6113P61pMKmFK6kYqPE5Y00Uskr76w1E9mrq1hQd/Tb1Z/aUESY4i5L3LDKXGG16v8KuHO1GK9P5jaE0Xhs=
X-Received: by 2002:a05:6358:6383:b0:132:ce36:ee31 with SMTP id
 k3-20020a056358638300b00132ce36ee31mr3510119rwh.6.1693435303155; Wed, 30 Aug
 2023 15:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230827023155.467807-1-aford173@gmail.com>
 <20230827023155.467807-3-aford173@gmail.com>
In-Reply-To: <20230827023155.467807-3-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 30 Aug 2023 17:41:31 -0500
Message-ID: 
 <CAHCN7xK9TKuQshtdzY8-zFL-Ho5oGDjOQYo2gjsvTC3ooPvx9Q@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] arm64: dts: imx8mp: Add micfil node
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XUIGUHWSBUZE3UEPBS4Y5CVIJGSGJMGQ
X-Message-ID-Hash: XUIGUHWSBUZE3UEPBS4Y5CVIJGSGJMGQ
X-MailFrom: aford173@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUIGUHWSBUZE3UEPBS4Y5CVIJGSGJMGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Aug 26, 2023 at 9:32=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The i.MX8MP has a micfil controller which is used for interfacing
> with a pulse density microphone. Add the node and mark it as
> disabled by default.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---

Nak.  I guess I'll Nak myself.

> V2:  No Change
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 79cdd4c066c8..b44851a2f579 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1473,6 +1473,27 @@ easrc: easrc@30c90000 {
>                                         fsl,asrc-format =3D <2>;
>                                         status =3D "disabled";
>                                 };
> +
> +                               micfil: audio-controller@30ca0000 {
> +                                       compatible =3D "fsl,imx8mp-micfil=
";
> +                                       reg =3D <0x30ca0000 0x10000>;
> +                                       #sound-dai-cells =3D <0>;
> +                                       interrupts =3D <GIC_SPI 109 IRQ_T=
YPE_LEVEL_HIGH>,
> +                                                    <GIC_SPI 110 IRQ_TYP=
E_LEVEL_HIGH>,
> +                                                    <GIC_SPI 44 IRQ_TYPE=
_LEVEL_HIGH>,
> +                                                    <GIC_SPI 45 IRQ_TYPE=
_LEVEL_HIGH>;
> +                                       clocks =3D <&audio_blk_ctrl IMX8M=
P_CLK_AUDIOMIX_PDM_IPG>,
> +                                                <&audio_blk_ctrl IMX8MP_=
CLK_AUDIOMIX_PDM_ROOT>,

After a bunch of attempts to get this working on real hardware, it
turns out that IMX8MP_CLK_AUDIOMIX_PDM_ROOT doesn't really exist.  Its
real name is IMX8MP_CLK_AUDIOMIX_PDM_SEL.  I'll submit a patch to
remove this from imx8mp-clock.h and and a V3 of this series to update
the clock reference in this node.

> +                                                <&clk IMX8MP_AUDIO_PLL1_=
OUT>,
> +                                                <&clk IMX8MP_AUDIO_PLL2_=
OUT>,
> +                                                <&clk IMX8MP_CLK_EXT3>;
> +                                       clock-names =3D "ipg_clk", "ipg_c=
lk_app",
> +                                                     "pll8k", "pll11k", =
"clkext3";
> +                                       dmas =3D <&sdma2 24 25 0x80000000=
>;
> +                                       dma-names =3D "rx";
> +                                       status =3D "disabled";
> +                               };
> +
>                         };
>
>                         sdma3: dma-controller@30e00000 {
> --
> 2.39.2
>
