Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC3862DDDC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 15:22:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEC2816DD;
	Thu, 17 Nov 2022 15:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEC2816DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668694940;
	bh=bRFiV0IK68T+8Bj4KbrLd1uR8KkVjRCTlcM1BvYjx5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YBD1BBiZCRZlhozW0Bvnm2vQxdlwSbyMtexMKB8lhZcKLeWFstKX54WtLrovfdMg7
	 AsoTtJa5qpHGY34vL6y98aYOObCrYPFQylq5EEY6HeOFT1tlYom6yhzTJKACVEOSog
	 y3g+ZybLQv0Zadzq89a2B7lfEIXYbzyde3KFOQ+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A8F6F800B5;
	Thu, 17 Nov 2022 15:21:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B599F8025A; Thu, 17 Nov 2022 15:21:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 PRX_BODY_26,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03734F800B5
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 15:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03734F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ON5nxt/9"
Received: by mail-wr1-x434.google.com with SMTP id cl5so4079717wrb.9
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 06:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5h6cyxnhZrFtGL17RTtLsvznlRHQrl1XvENpkP8t5+8=;
 b=ON5nxt/9DSGmDjVpheXx8uIXtWLoJ0qe79AGL4GY8TepcX7T3ORokLb/PrGPuH/ot8
 f9vxlpRxZJtHR5tkvj5wFV3r3hOBGytpvrjFcZ6+eI91exu4lg85RCXaBOPDm/TRoqMd
 65SOAAEJULYT4q10kVAB7COUYpnY6EEMzKGEz4sqKp+xrb0Bm07I0dT4D6bJuE4WjeN4
 ac6XWqR3GjKzJx6P8jxI4bWZYfTo5u/ahJ1Obeu+z3ibCrsN1+K5zoc59vP+J2jd7A6x
 O5VVIXGWNLM/CdlexDxTkH3wwj9e2ZNgPb7P+nrU/JTcWTINTbM+oUgey9Gac6Y24JY6
 D0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5h6cyxnhZrFtGL17RTtLsvznlRHQrl1XvENpkP8t5+8=;
 b=Oe5LDSdiK4R0y3OL2+ppWneZGbpocL4iTwoOSTJJWJyKUoKY1g1FmVW6GX4Pl4mhhZ
 Vbi/jE5dayJQZH20rNbbYIcFhmu8pkHhpjbXK0UBu8Ov/R9L3WNhZRY9ikrTUQ7MozuT
 wjk/tWrzjLgSnivLik9+o0fnmtjJz44140DfFsPV5gh1CghpCxZGxlGSOki92UI8MH+x
 K/uAHskmIjtjQVLfCG555PT+1gyoLW+eOHBelglavExMjtIpCUGNLxtECWgFn6TgtOfQ
 FLVV+bwRAxEsnrI0fGbflTdv61qdPlRCGi449R01mVsa9fe6eVDReaiNImZVmjIgfQ+S
 R0Dw==
X-Gm-Message-State: ANoB5pmszQHJJ4yTJ63MlPVegorh8bUNAKl5xV9NdCn+EZUWJaI3R7z0
 0hntkPFV8IgiwP0t9q78rEiGUKaNld4tgSMxpQ==
X-Google-Smtp-Source: AA0mqf4vxBPBN7wpmGjafFD6bYv2PxvDbcmxZTPz5qlrqg/MXv201oB8f/7ReI6mFJYRZuuiZdy9np/UKUAtNdaPze4=
X-Received: by 2002:a5d:68ce:0:b0:236:518d:f2b4 with SMTP id
 p14-20020a5d68ce000000b00236518df2b4mr1669981wrw.397.1668694874391; Thu, 17
 Nov 2022 06:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20221116034621.37762-1-samuel@sholland.org>
In-Reply-To: <20221116034621.37762-1-samuel@sholland.org>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Thu, 17 Nov 2022 22:21:03 +0800
Message-ID: <CAE=m61-UuexpSx_VTvkEcU-mDOgjqon-2_Ndx4viaZ8Z_a-OHg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: sun50i-dmic: Add D1 compatible string
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Samuel Holland <samuel@sholland.org> =E4=BA=8E2022=E5=B9=B411=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=B8=89 11:46=E5=86=99=E9=81=93=EF=BC=9A

> The Allwinner D1 SoC has a DMIC codec like the one in the H6. It appears
> to be register-compatible with the H6 variant, and the existing Linux
> driver has been tested on a D1-based board, the Lichee RV 86 Panel.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  .../bindings/sound/allwinner,sun50i-h6-dmic.yaml           | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git
> a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> index 2f12cabe4c71..0920f2f81a1c 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.ya=
ml
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.ya=
ml
> @@ -11,7 +11,12 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: allwinner,sun50i-h6-dmic
> +    oneOf:
> +      - items:
> +          - enum:
> +              - allwinner,sun20i-d1-dmic
> +          - const: allwinner,sun50i-h6-dmic
> +      - const: allwinner,sun50i-h6-dmic
>
>    "#sound-dai-cells":
>      const: 0
> --
> 2.37.3
>
>
Acked-by: Ban Tao <fengzheng923@gmail.com>
