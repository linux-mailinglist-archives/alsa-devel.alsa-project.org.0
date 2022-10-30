Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D486612A78
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Oct 2022 12:58:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADE96162F;
	Sun, 30 Oct 2022 12:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADE96162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667131092;
	bh=MWBDmxl/ZOgUGYTl2catXD6ap/fflbvvxZGsP7TTLhg=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPMtYwKOmjv9MES12Ih69WGOTEVDQyjBwJJf+mywoh9O//5LD5cjJoLccW9Jh12FW
	 1fTIxsEZKMlRO2Exg3/x6/F/tpd1iGhlzSWCxtA3rPEecROzqTPUY2V5BJD7ShhDBG
	 lC8siMSaYKOD5zXJe8s20mNngXWScTGIAuAa86Dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8C0F80166;
	Sun, 30 Oct 2022 12:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 099B6F80217; Sun, 30 Oct 2022 12:57:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7D5BF800CC
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 12:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7D5BF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="Z/Ghtw9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667131028; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7jkshNTb9CiYN6d6S/xxo0roUtTTADG65mtz+EOG7s=;
 b=Z/Ghtw9wVpX8bc8gyui25gXnYgcieXCx+emBBtV/CVXNSv+4CVH1zPs77tDzAlr6nYOfb2
 KQAOKKcD5r4m0i/qCCafwJ2SQPkaFzUfY8OxhkHfK9TX5CpYS/ie6PC5hKwgq43FUDcOVo
 15SN73ZxIgqV25P8yQ0jcAz+lEFdM1M=
Date: Sun, 30 Oct 2022 11:56:58 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v1 1/3] dt-bindings: ingenic,aic: Remove unnecessary
 clocks from schema
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <YIEKKR.ZFP16J137HGC3@crapouillou.net>
In-Reply-To: <20221028103418.17578-2-aidanmacdonald.0x0@gmail.com>
References: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
 <20221028103418.17578-2-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-mips@vger.kernel.org
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

Hi,

Le ven. 28 oct. 2022 =E0 11:34:16 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> The AIC needs only the first two clocks: "aic" is a gate that's used
> for gating the I2S controller when it's suspended, and "i2s" is the
> system clock, from which the bit and frame clocks are derived. Both
> clocks are therefore reasonably part of the AIC and should be passed
> to the OS.
>=20
> But the "ext" and "pll half" clocks are a little more questionable.
> It appears these bindings were introduced when the schema was first
> converted to YAML, but weren't present in the original .txt binding.
> They are intended to be the possible parent clocks of "i2s".
>=20
> The JZ4770 actually has three parents for its "i2s" clock, named
> "ext", "pll0", and "pll1" in the Linux driver. The JZ4780 has two
> parents but it doesn't have a "pll half" clock, instead it has an
> "i2s_pll" clock which behaves much differently to the actual
> "pll half" clock found on the JZ4740 & JZ4760. And there are other
> Ingenic SoCs that share the JZ4780's clock layout, eg, the X1000.
>=20
> Therefore, the bindings aren't really adequate for the JZ4770 and
> a bit misleading for the JZ4780. Either we should fix the bindings,
> or remove them entirely.
>=20
> This patch opts to remove the bindings. There is a good case to be
> made that "ext" and "pll half" don't belong here because they aren't
> directly used by the AIC. They are only used to set the parent of
> the "i2s" clock; they have no other effect on the AIC.
>=20
> A good way to think of it is in terms of how the AIC constrains
> clocks. The AIC can only generate the bit & frame clocks from the
> system clock in certain ratios. Setting the sample rate effectively
> constrains the frame clock, which, because of the clock dividers
> controlled by the AIC, translates to constraints on the "i2s" clock.
> Nothing in the AIC imposes a direct constraint on the parents of
> the "i2s" clock, and the AIC does not need to enable or disable
> the parents directly, so in principle the AIC doesn't need to be
> aware of the parent clocks at all.
>=20
> The choice of parent clock is still important, but the AIC doesn't
> have enough information to apply such constraints itself. The sound
> card does have that information because it knows how the AIC is
> connected to other components. We need to use other DT mechanisms
> to communicate those constraints at the sound card level, instead
> of passing the clocks through to the AIC, and inventing ad-hoc ways
> to plumb the constraints around behind the scenes.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Yes, it makes sense also because from a DT point of view, these clocks=20
were redundant information. It's enough to know the i2s clock to also=20
know its parents.

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  .../devicetree/bindings/sound/ingenic,aic.yaml         | 10=20
> ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml=20
> b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
> index d607325f2f15..c4f9b3c2bde5 100644
> --- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
> +++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
> @@ -37,15 +37,11 @@ properties:
>      items:
>        - description: AIC clock
>        - description: I2S clock
> -      - description: EXT clock
> -      - description: PLL/2 clock
>=20
>    clock-names:
>      items:
>        - const: aic
>        - const: i2s
> -      - const: ext
> -      - const: pll half
>=20
>    dmas:
>      items:
> @@ -82,10 +78,8 @@ examples:
>        interrupts =3D <18>;
>=20
>        clocks =3D <&cgu JZ4740_CLK_AIC>,
> -               <&cgu JZ4740_CLK_I2S>,
> -               <&cgu JZ4740_CLK_EXT>,
> -               <&cgu JZ4740_CLK_PLL_HALF>;
> -      clock-names =3D "aic", "i2s", "ext", "pll half";
> +               <&cgu JZ4740_CLK_I2S>;
> +      clock-names =3D "aic", "i2s";
>=20
>        dmas =3D <&dmac 25 0xffffffff>, <&dmac 24 0xffffffff>;
>        dma-names =3D "rx", "tx";
> --
> 2.38.1
>=20


