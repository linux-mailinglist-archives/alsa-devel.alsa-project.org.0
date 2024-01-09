Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 765A78287E5
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 15:17:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD5FE7D;
	Tue,  9 Jan 2024 15:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD5FE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704809821;
	bh=bEUIyacTRUl2UeAbazfoL2KrKIlvlAHSWVIZ2KVw8Ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bHMOraXci/KddNBmRbFPHpNRtxSRC1qwgD6MHMOG8HQouE5mdC3VkdSLQC9W6itjF
	 uIHoJstlqfNWfx2MPykY6x8O68QBRiZ7HKNFjQuGcDGlz/d7yRn56qFQHoDL33Ix4S
	 BjjPKX7DV6a/VVaGFs6dd3Oh4X5VI80+NUhSzhf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B3A4F80246; Tue,  9 Jan 2024 15:16:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D7D0F8057F;
	Tue,  9 Jan 2024 15:16:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 689A1F80254; Tue,  9 Jan 2024 15:16:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E43B6F80086
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 15:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E43B6F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dnC97x+g
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a294295dda3so339067566b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Jan 2024 06:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704809779; x=1705414579;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfKKmsgrBNevkxdWqBtR6SySOi1WLHhsxeOVYSFipik=;
        b=dnC97x+gMcJN0QJnSA0wK4t7EYxmoYA3lUuuhs44C5hGNyScNoDOJ7z+t6X0bJfYtA
         7jTI4edtWh9OFoCOoMy32m/9mUiu7s5FVWvPqHcZcMMJgOXvMV2PTChdcJxdt6Y/QDYr
         BnSW5BSadiMIdixhj98XeDwirDRiwtaf1OJXcEwhbfw5ByX7OGvDxL+OwgKf7Kn+PxzB
         ABCZnoTeKUurEOBMhrWGufPIB/uAQ5JV2uvDftxtR4nIGWGn3hipIEB1gQI1qy6tivba
         Hjd/XnWyh83ecFzXD7qqiBe1CxqmJS8+AwmLCozc5e8hdxb9EgAeoRyOJzYB5V6tp1OI
         yCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704809779; x=1705414579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfKKmsgrBNevkxdWqBtR6SySOi1WLHhsxeOVYSFipik=;
        b=U0xR73GXVEkkD53Z9b294aHV85cVtuGSHCxpGsCffGuumh93je11XmFHHkyqLqfT4f
         E5PkPOpjt4/q5gvZ4YPK7lYBwZzNjiB6zeJBM6YiYriAsHk+YcAKbXInNmU/egFshC1T
         MOnbwB9RF8MygDA1GdeWGleZnWmnqE6PWLj5GZYJuEXGA7ON4vojz1t6sV15Oii1i/wn
         hLn/mUtdLdSNsZMaiBj70+wjXLHOcrhVWxLYNM4oEWWbXGKRBWkS6aJy+r6XrtTFPqu3
         p47+lS7QCllrzSX9wRnSKeszzrDt2HmsrF+Co0WkQLNl/wruRL5rXN8Auka/cWFaCfdd
         9++g==
X-Gm-Message-State: AOJu0Yz1Yz/S5X2mPo5qVoJic2ai3Nm87nY04iJGPiueYfKUfZTctOE4
	WPaPh7maF12PN/ZXo9CuRC5RXb5rhe1Je/AxKAE=
X-Google-Smtp-Source: 
 AGHT+IHrnXDoXiFmgZB8pnUib0FZSixSpHYIUBlJTfVPoTkImZsXEmElnr3lXwcWDIqgM9foKbqDkNseDvscZLyDkgE=
X-Received: by 2002:a17:907:2d09:b0:a29:1419:f522 with SMTP id
 gs9-20020a1709072d0900b00a291419f522mr330417ejc.72.1704809778626; Tue, 09 Jan
 2024 06:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20240109075551.870001-1-chancel.liu@nxp.com>
 <20240109075551.870001-4-chancel.liu@nxp.com>
In-Reply-To: <20240109075551.870001-4-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Jan 2024 16:16:06 +0200
Message-ID: 
 <CAEnQRZAgwmNZ8ruV6rPJ_OTzjLHL0jgPLFNbBeW1fXYG+QjAbw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: fsl,micfil: Add compatible string
 for i.MX95 platform
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: K5RX7OCRKHUBJU6WMSP4TOZPLAODC5DT
X-Message-ID-Hash: K5RX7OCRKHUBJU6WMSP4TOZPLAODC5DT
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K5RX7OCRKHUBJU6WMSP4TOZPLAODC5DT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 9, 2024 at 9:58=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Add compatible string "fsl,imx95-micfil" for i.MX95 platform.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,micfil.yaml     | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,micfil.yaml
> index b7e605835639..f0d3d11d07d2 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> @@ -15,10 +15,17 @@ description: |
>
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mm-micfil
> -      - fsl,imx8mp-micfil
> -      - fsl,imx93-micfil
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx95-micfil
> +          - const: fsl,imx93-micfil
> +
> +      - items:
> +          - enum:
> +              - fsl,imx8mm-micfil
> +              - fsl,imx8mp-micfil
> +              - fsl,imx93-micfil

My yaml knowledge is very limited. Can you describe in natural
language in the commit what exactly we are doing here.

Why something like this:


>    compatible:
>     enum:
>       - fsl,imx8mm-micfil
>       - fsl,imx8mp-micfil
>       - fsl,imx93-micfil
+        - fsl,imx95-micfil

Isn't enough?
