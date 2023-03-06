Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD36ACD65
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 20:00:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8224119E;
	Mon,  6 Mar 2023 19:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8224119E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678129229;
	bh=RKFFV1IR8UjpXrXbhSm+33OxxfDK8SFhUxXEKBVJwIc=;
	h=In-Reply-To:References:Subject:From:To:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vbnet70sg7fAZXYa5jhwkPXpV4GAy2ALaCW7OpliOcqndgPNsHtH32oVGzIwceVaY
	 RYl2Yy21ChL5hbkxRejDDlwPELgQ1/3mCliDnsb5a2Ij3vj6un9Dqin9xAj32Ab4co
	 y+ddykb2fmwMR7MaS+jHWF0fQzb8IirgN8QBWbqc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E9E1F80236;
	Mon,  6 Mar 2023 19:59:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A581DF8042F; Mon,  6 Mar 2023 19:59:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92F97F8007E
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 19:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92F97F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GfVttMpS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8EA761058;
	Mon,  6 Mar 2023 18:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D53FC433D2;
	Mon,  6 Mar 2023 18:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678129164;
	bh=RKFFV1IR8UjpXrXbhSm+33OxxfDK8SFhUxXEKBVJwIc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GfVttMpS/dI2JLuswomdzv/r3ivGw3fgObyvOBPVm89UPT/Oj/LTlZ9GWvE6O+9qE
	 l1hBRRj9rAzoi1Gyf9UPgteDLNIZVXvb8b9A8dcrxO6Qm3WhlLFeTgAqzGdnI8cAkz
	 uZkYD7+QlMSZTZBrDdCC1o1XncFeAwM6BqYbxZyBT+duuOQARX2xufPt72ra5V/XwO
	 p3L5yf5KobJqTue39z/Qxk3+Q1flD7KbUxYBF3xLmgh4C3+gvoKRuOU140xo8wqlxf
	 zGo52h9uFwSNLnsySt80/onn5HC2OYXSazdEAUWljvOQuECK/0O6VX63qUeQnjDzFb
	 yL6IF5agzZ8dA==
Message-ID: <3f3c8bd83ddaac760f25fde2681d3a61.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
References: <20230303214223.49451-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment
 '#'
From: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date: Mon, 06 Mar 2023 10:59:22 -0800
User-Agent: alot/0.10
Message-ID-Hash: B27ZN2WUPRYZDIBML7YRAOY4EH77E26O
X-Message-ID-Hash: B27ZN2WUPRYZDIBML7YRAOY4EH77E26O
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S.Miller" <davem@davemloft.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infrad, ead.org@alsa-project.org, linux-gpio@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B27ZN2WUPRYZDIBML7YRAOY4EH77E26O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Rob Herring (2023-03-03 13:42:23)
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/D=
ocumentation/devicetree/bindings/clock/qcom,a53pll.yaml
> index 525ebaa93c85..64bfd0f5d4d0 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> @@ -45,14 +45,14 @@ required:
>  additionalProperties: false
> =20
>  examples:
> -  #Example 1 - A53 PLL found on MSM8916 devices
> +  # Example 1 - A53 PLL found on MSM8916 devices
>    - |
>      a53pll: clock@b016000 {
>          compatible =3D "qcom,msm8916-a53pll";
>          reg =3D <0xb016000 0x40>;
>          #clock-cells =3D <0>;
>      };
> -  #Example 2 - A53 PLL found on IPQ6018 devices
> +  # Example 2 - A53 PLL found on IPQ6018 devices
>    - |
>      a53pll_ipq: clock-controller@b116000 {
>          compatible =3D "qcom,ipq6018-a53pll";
