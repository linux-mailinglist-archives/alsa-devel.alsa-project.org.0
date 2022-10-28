Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D76E461103F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 13:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6838321D5;
	Fri, 28 Oct 2022 13:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6838321D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666958345;
	bh=8RLwq8ki1h1dxKk0NdgzIrd5GZ/cNm4zsawgcittnDY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=smQqR/eit7Z7OccDduqIZAybfQnKPzwkvPohSfJzmVoc1T7Xa9+bNlu6A3Fm5orqV
	 SYB2W3TmrkDpsqc7XoDcIMwskOXjbYFJ6WJYk6FeoGxfBTiaJpY4T3Mh0JngGzPnjc
	 CW6KAwrcG8WIgjtKmCeZTCCRypXLpeuCnDzORsK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D87E3F80095;
	Fri, 28 Oct 2022 13:58:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 668E6F8024C; Fri, 28 Oct 2022 13:58:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 296C4F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 13:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 296C4F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BWh7/JiV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4C6E62800;
 Fri, 28 Oct 2022 11:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEA9C433C1;
 Fri, 28 Oct 2022 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666958285;
 bh=8RLwq8ki1h1dxKk0NdgzIrd5GZ/cNm4zsawgcittnDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BWh7/JiVpgOVYE3svGcPrILvMKVCQg3xZW8Dx1t5Vnlwo5bRVQtPS1IVydoks8WcW
 lpYJnV4vm2/NMmsqzlOMWtPyPPxKpGxM7G8hVBa8V639B3ajbTprSCDH+J7eU4lDeS
 jGB1XWSy8JHRPMH+DsizQeG5clgASCJzCwLXH1TaM3uOH3slehxOchh6B8zS9A6u67
 GNZYlLS7Dusr/UKFlc6lvWQP97aFIY1bsG24nsICYL9H0Hrc35nc4Q5Mcpvuk/ibbo
 yMvKFqTB06ed2OZpzYw7u3Ze/1yHHwOOHhw2xZlhHwUXQxiflZEGfoplCkwvTuaQ7H
 3BkQfVHPVhF1Q==
Date: Fri, 28 Oct 2022 12:57:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1 2/2] ASoC: dmic: Add optional dmic selection
Message-ID: <Y1vDxtdNGURAT850@sirena.org.uk>
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GFVHecDBq3J8AQvA"
Content-Disposition: inline
In-Reply-To: <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
X-Cookie: Life -- Love It or Leave It.
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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


--GFVHecDBq3J8AQvA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 06:24:50PM +0800, Ajye Huang wrote:

> +	dmic->dmic_sel =3D devm_gpiod_get_optional(component->dev,
> +						"dmic_sel", GPIOD_OUT_LOW);
> +	if (IS_ERR(dmic->dmic_sel))
> +		return PTR_ERR(dmic->dmic_sel);
> +
>  	snd_soc_component_set_drvdata(component, dmic);
> =20
>  	return 0;
> @@ -125,10 +172,15 @@ static const struct snd_soc_dapm_widget dmic_dapm_w=
idgets[] =3D {
>  			       SND_SOC_NOPM, 0, 0, dmic_aif_event,
>  			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
>  	SND_SOC_DAPM_INPUT("DMic"),
> +	SND_SOC_DAPM_MIC("DMIC", NULL),
> +	SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &dmic_mux_control),

If we are doing this then adding the mux needs to be conditional on
having the GPIO, without the GPIO the control is at best confusing to
users.

--GFVHecDBq3J8AQvA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNbw8YACgkQJNaLcl1U
h9CYCgf+MWaEyyoOOBqvu/7ws9X2k2O/7vrpIy4ywmtMQiwtox/kaUZhHBVGeOpA
mLhySDFOd/cfzRbOQoGr0UU3//+cBLhPNiIIynPX9yuPJELkezuH9r4ncjOEfilv
97kU9XGGND6BGzLYmn99vmc2x7CAtVQKQsY8tEhMWD9SMaWnBk0ynqHZ9BpiKjhy
yw8XAkIz+VDE0SbTzRxk/YH5Z/CeQfVrM+CAjUaubhQ1615qZgWL20/dlq/SzX3Y
CQs/QkiA+U00mcNy/n99wWCxclIh0v8FHWhvqkIMxzNmoEhcemnG5UMUTa8O68WC
69KDHTwoPpaO/X7k/S7WmN73wEPV+w==
=iidS
-----END PGP SIGNATURE-----

--GFVHecDBq3J8AQvA--
