Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AE51334F
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 14:03:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 183F415CA;
	Thu, 28 Apr 2022 14:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 183F415CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651147398;
	bh=z/rcuQ6bVDZnTEpAnS4QlRzB5Yc+lFfj8TR9qyt755Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bedm+jEpX4V6Xcucm4n+gaO0fA3KJNahtmYAdSZJwa/hHeM/K0SBwx8sRk0OwyCWr
	 0vpeaAACIWnS+g+EHJe0Sf5bmGGjlmj0+/V02YqHVN1EiQngVOuBamw1JzIo6D/qsY
	 MLap1xmb75KWT0SV4uojsLpCO9iWeGF0wMt/lEOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 842EBF800F2;
	Thu, 28 Apr 2022 14:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3171BF8012B; Thu, 28 Apr 2022 14:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8704F8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 14:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8704F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="si2hzBVd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05A1D61FBE;
 Thu, 28 Apr 2022 12:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92278C385A0;
 Thu, 28 Apr 2022 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651147327;
 bh=z/rcuQ6bVDZnTEpAnS4QlRzB5Yc+lFfj8TR9qyt755Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=si2hzBVdSNFEBs1SgfQe/IMiNDmiaAebPForIezTbJrYcMWx8DUqOFoD3nbKycvFX
 xJVX5eLCianPJHhpZCYyFuJrVdU3zLaVbnFQPLbJtjFrBJBBdHfISwgbSy4weuFDqV
 Yzs1wECbO0Yq+9bvY8V0fhs7z5JbOGPOi6+LhNskOT0L/e8tsXxhMW2tfs3jrsqIDD
 D1ASAm2ReV+JfUbpHHro8c1ZQsD5gBO2zgDQEaqYx9hdphw4k2kLUPM1X35rIGujjq
 3XSOQc2obb2oK11OPs4V/dN6JrLsvw4Lp4m8MpZb2BoLKeRd07bUOsR4MJa66X3GkQ
 bvEvwzh+J+81A==
Date: Thu, 28 Apr 2022 13:02:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v4 13/18] ASoC: mediatek: mt8186: add platform driver
Message-ID: <YmqCORqp6nYuQJZf@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-14-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jdU3xo2gQbe9oqCP"
Content-Disposition: inline
In-Reply-To: <20220428093355.16172-14-jiaxin.yu@mediatek.com>
X-Cookie: Bedfellows make strange politicians.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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


--jdU3xo2gQbe9oqCP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 05:33:50PM +0800, Jiaxin Yu wrote:
> Add mt8186 platform and affiliated driver.
>=20
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  sound/soc/mediatek/Kconfig                    |   44 +
>  sound/soc/mediatek/Makefile                   |    1 +
>  sound/soc/mediatek/mt8186/Makefile            |   22 +
>  sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
>  .../soc/mediatek/mt8186/mt8186-afe-control.c  |  261 ++
>  sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3005 +++++++++++++++++
>  .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
>  .../soc/mediatek/mt8186/mt8186-misc-control.c |  294 ++
>  .../mediatek/mt8186/mt8186-mt6366-common.c    |   59 +
>  .../mediatek/mt8186/mt8186-mt6366-common.h    |   17 +
>  sound/soc/mediatek/mt8186/mt8186-reg.h        | 2913 ++++++++++++++++
>  11 files changed, 6920 insertions(+)

This looks mostly good though it is enormous so I might've missed some
things.  The patch series is already very large but it might still be
worth splitting this up a bit more, perhaps split the code and data
tables/register definitions into separate patches?

A few relatively minor issues with the controls.

> +/* this order must match reg bit amp_div_ch1/2 */
> +static const char * const mt8186_sgen_amp_str[] =3D {
> +	"1/128", "1/64", "1/32", "1/16", "1/8", "1/4", "1/2", "1" };
> +static const char * const mt8186_sgen_mute_str[] =3D {
> +	"Off", "On"
> +};

On/off controls should be normal Switch controls not enums so userspace
can display things sensibly.

> +static int mt8186_sgen_set(struct snd_kcontrol *kcontrol,
> +			   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cmpnt =3D snd_soc_kcontrol_component(kcontrol=
);
> +	struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8186_afe_private *afe_priv =3D afe->platform_priv;
> +	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> +	int mode;
> +	int mode_idx;
> +
> +	if (ucontrol->value.enumerated.item[0] >=3D e->items)
> +		return -EINVAL;

=2E..

> +				   0x3f << INNER_LOOP_BACK_MODE_SFT);
> +	}
> +
> +	afe_priv->sgen_mode =3D mode;
> +
> +	return 0;
> +}

This should return 1 if the value is different from the previous value
so event generation works, please run mixer-test against a system using
the driver to help spot issues like this.  The same issue applies to at
least some of the other custom controls.

> +static int mt8186_sgen_mute_set(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cmpnt =3D snd_soc_kcontrol_component(kcontrol=
);
> +	struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt);
> +	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> +	int mute;
> +
> +	if (ucontrol->value.enumerated.item[0] >=3D e->items)
> +		return -EINVAL;
> +
> +	mute =3D ucontrol->value.integer.value[0];
> +
> +	dev_dbg(afe->dev, "%s(), kcontrol name %s, mute %d\n",
> +		__func__, kcontrol->id.name, mute);
> +
> +	if (strcmp(kcontrol->id.name, SGEN_MUTE_CH1_KCONTROL_NAME) =3D=3D 0) {
> +		regmap_update_bits(afe->regmap, AFE_SINEGEN_CON0,
> +				   MUTE_SW_CH1_MASK_SFT,
> +				   mute << MUTE_SW_CH1_SFT);
> +	} else {
> +		regmap_update_bits(afe->regmap, AFE_SINEGEN_CON0,
> +				   MUTE_SW_CH2_MASK_SFT,
> +				   mute << MUTE_SW_CH2_SFT);
> +	}
> +
> +	return 0;
> +}

I can't tell why some of these are done with custom code rather than
using a normal SOC_SINGLE()?

--jdU3xo2gQbe9oqCP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJqgjgACgkQJNaLcl1U
h9AdWgf/f48ddKYw5UEk9XqJetzu+AKnHMJdiGhcXVL8VJHS8NjNHgAIEkf7OtdR
IViyQ7xxZBoVqVIdFG6R9agx3aFmdzL4xB1pujeQBINZxBU9AUsNZYVYvoPcOCVE
1mTboTs+xpDB6w2l8wWS5LSep9LWUHZbNCVhjuauariDNPMIE1PtIsLdwrbFFn98
TfLbVeGSNsabtkj1gp8Uy+7vMz8EyhsCZ+vVYLTbY9+vrFtMkKHo9kmNn/AfFSQE
w4q2Jl2ktlwuhsQ3PYl+436ODLdrmUtBoV6RjRUn30TbpnGW2Z5qtR8+eMUR5PzZ
nmzRcM5BGt4HvdA3tf5kTA6VLsD2Dw==
=uhVL
-----END PGP SIGNATURE-----

--jdU3xo2gQbe9oqCP--
