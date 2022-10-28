Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0408161175F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 18:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8850D1DF4;
	Fri, 28 Oct 2022 18:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8850D1DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666973928;
	bh=MPN/lPTpCXpy+0PRxdY8GXPpytF3KfULUfkRjnBwUpE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m9LaYiyaegnhBIQFvEBqoi/QcpUS7K90SpkfcH34tRIj5TF/g/lSmsmeaW+tHwqw2
	 GzaUMEzHKNI7NcdEFx3qohBQ5Ewfb1+aTLNJdddABmbV1mzjpPGqB3R/FSh3GIrko4
	 lougxpOD9j7wsr9bHOxYO7mLuN0n3hHeIcf/OSAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1662F80095;
	Fri, 28 Oct 2022 18:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C3A8F80095; Fri, 28 Oct 2022 18:17:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 789DDF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 18:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 789DDF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U4jN1aqr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0FB6B82AF5;
 Fri, 28 Oct 2022 16:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5BBC433C1;
 Fri, 28 Oct 2022 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666973867;
 bh=MPN/lPTpCXpy+0PRxdY8GXPpytF3KfULUfkRjnBwUpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U4jN1aqrPtVpL4VSh4NG5IKIR0V5D/7XGlmxImplMYfIF2nvv4TCI3FNBmihmGZEx
 V9fP0Zer515uPmI0ZDdCMLln/GOWnTRqQLKZua/VEzttslPumufiygnfvpQkIRwWcN
 TFV8I7d6Xb1VlRUUJUGFLovN1ITdLhP++IPi3/9/Kzb4u/eEdSZhq4pEuihKYZtYWY
 oSwO3C8T7BU3xoCKInl61SsWHX7yvHNbaSMiProzM44CvwTnhalM6/ts6sIf7QvvPU
 nFmLKoj7eJeHyGNZJqrQcw5BQOiUVpp/hiTtP1rzYhOLWD7zppUH9YgIc8Xpo08WMx
 HBiUwucVzAr2A==
Date: Fri, 28 Oct 2022 17:17:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1 2/2] ASoC: mediatek: mt8186-rt5682: Modify machine
 driver for two DMICs case
Message-ID: <Y1wApOeV7OoQzkt5@sirena.org.uk>
References: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
 <20221028160733.1390230-3-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Cw3lWstGeVw1b8Ns"
Content-Disposition: inline
In-Reply-To: <20221028160733.1390230-3-ajye_huang@compal.corp-partner.google.com>
X-Cookie: Life -- Love It or Leave It.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


--Cw3lWstGeVw1b8Ns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 29, 2022 at 12:07:33AM +0800, Ajye Huang wrote:

> +static const char * const dmic_mux_text[] = {
> +	"FrontMic",
> +	"RearMic",
> +};

> +	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
> +					ARRAY_SIZE(dmic_widgets));
> +	if (ret) {
> +		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
> +		/* Don't need to add routes if widget addition failed */
> +		return ret;
> +	}

> +       if (of_property_read_bool(pdev->dev.of_node, "dmic-gpios")) {
> +               mach_priv->dmic_sel = devm_gpiod_get_optional(&pdev->dev,
> +                                                       "dmic", GPIOD_OUT_LOW);

My prior comments about it being nicer to make the addition of the
control depend on the property being there and the description of the
options configurable do stand (I appreciate that the other driver might
not have done this which was probably an oversight).

Also do we really need the of_property_read_bool() there?  I'd have
expected that devm_gpiod_get_optional() would be handling that for us.

--Cw3lWstGeVw1b8Ns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNcAKQACgkQJNaLcl1U
h9Dszgf/VXVqdAt6y4Tux5PXD9zW+9i23ZFaCs1y/E0zse4AyVDDvo+BtL+IrkcL
z9i6r9EqrQuX6SBUCup87nUu3s4aIwtlCvH3Li2znhZWKfY1PEN7xWA7IB6eZDrp
nWBO4wPITY3ftUoLGTEpv2ZgQ3QIFm4B/rQpNEkfxbwF91kv/JPK2VzAL2Q0zbck
ahvvraHhPGI+2MkDjcufrlzqUke/MteuKH+zKgZjDLYDicXFaj0gHhS/0n7s46Nw
Uq2pcLsOFtU8yBm9LVBeC2CDk134qJH4h81Pen/yF/v2+7Pyz5uJD1X2PqXqVRDF
Et13wKZD5oDLUdFdlZhs82B5gcdQ4g==
=Qv/e
-----END PGP SIGNATURE-----

--Cw3lWstGeVw1b8Ns--
