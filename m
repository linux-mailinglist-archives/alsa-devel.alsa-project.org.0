Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2438D88A420
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 15:19:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 447D01945;
	Mon, 25 Mar 2024 15:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 447D01945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711376347;
	bh=jbD2Lb5wA/eUCNXCJLVthr6/MzEiKX6SqxWZxnTuOnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KI2JRgwVuCPPBKOnJ6izDsY8vmRgW3j5k0I4mfqY5M9Kyz0L3+NLAy+FEoQhCG5AH
	 foW1vCYzbR5ruHZdVVp/k8JBIZLUFXqc34YmMLNzHHiOOm/4PUjkSU4gV7t33+i2xt
	 25RnMgzCs52Za23d5IiuKI4bYOqHt9e3frg0q51s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E10FAF80589; Mon, 25 Mar 2024 15:18:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CAA2F8057A;
	Mon, 25 Mar 2024 15:18:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8572F80236; Mon, 25 Mar 2024 15:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54655F80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 15:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54655F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SIJBcOZw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8E8561028;
	Mon, 25 Mar 2024 14:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551B6C3278D;
	Mon, 25 Mar 2024 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711376298;
	bh=jbD2Lb5wA/eUCNXCJLVthr6/MzEiKX6SqxWZxnTuOnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIJBcOZwUhINwFcGdCy+3ok576TN9S810xuZ8ZzXc+YsDCkkdm2aFq4Rb/QQx0lUi
	 1wCvxXFctAcTrEW1JWL8HrusNRZ090ozLa1y+/4W1HSAvRJjjagI3SeojbTeSEOpth
	 JVqpRvqwRP4xMipGrKVSugC394E0I0wHmQz9uqnRmKjiVb/ma5GFpOxfhYS80hw1VN
	 kVa+H456ovUt/aptnwA12NIMQRD+kFb7iLum3bA1g0EF9EYSVIOthLrTUNXqEuuQBR
	 8qkEq2K1UK+3Qux+vNE58QmXDQuoGAu7RuT+3ssdB6orI+bYKjCVexSqifI7VacJfd
	 +OE8pqjMaaDuA==
Date: Mon, 25 Mar 2024 14:18:08 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com,
	amergnat@baylibre.com, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, dianders@chromium.org,
	frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com, ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com, nfraprado@collabora.com,
	alsa-devel@alsa-project.org, shane.chien@mediatek.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 05/22] ASoC: mediatek: Add common machine soundcard
 driver probe mechanism
Message-ID: <6b9dd2ad-a24e-497a-8a5c-c7c04475cf5d@sirena.org.uk>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
 <20240313110147.1267793-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HA8wmAlBS5gx6s1i"
Content-Disposition: inline
In-Reply-To: 
 <20240313110147.1267793-6-angelogioacchino.delregno@collabora.com>
X-Cookie: Is it clean in other dimensions?
Message-ID-Hash: L46O53AF7MXF3I4T7RYJVZ5ON3ZVIODF
X-Message-ID-Hash: L46O53AF7MXF3I4T7RYJVZ5ON3ZVIODF
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L46O53AF7MXF3I4T7RYJVZ5ON3ZVIODF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HA8wmAlBS5gx6s1i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 12:01:30PM +0100, AngeloGioacchino Del Regno wrote:
> Add a common machine soundcard driver probe function that supports both
> DSP and AFE-direct usecases and also provides a hook for legacy machine
> soundcard driver probe mechanisms.
>=20
> Note that the hook is there because, even for legacy probe, a lot of the
> actual code can still be commonized, hence still reducing duplication
> for the legacy devicetree retrocompatibility cases.
>=20
> This common probe function deprecates all of the inconsistent previous
> probe mechanisms and aims to settle all of the MediaTek card drivers on
> consistent and common devicetree properties describing wanted DAIs,
> device specific DAI configuration and DAI links to codecs found on
> each device/board.

This breaks allmodconfig builds:


/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_dai_link_fixup=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:18:41: er=
ror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointer=
 target type [-Werror=3Ddiscarded-qualifiers]
   18 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_card_probe=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:58:41: er=
ror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointer=
 target type [-Werror=3Ddiscarded-qualifiers]
   58 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_find_tplg_be=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:76:41: er=
ror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointer=
 target type [-Werror=3Ddiscarded-qualifiers]
   76 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_check_tplg_be_dai_link_fixup=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:116:41: e=
rror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointe=
r target type [-Werror=3Ddiscarded-qualifiers]
  116 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_card_late_probe=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:147:41: e=
rror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointe=
r target type [-Werror=3Ddiscarded-qualifiers]
  147 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
cc1: all warnings being treated as errors

--HA8wmAlBS5gx6s1i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYBh58ACgkQJNaLcl1U
h9Dw2Qf+OK6uEVJdUDAeL+cRMOtxJ5v8lWJ4kCDEd4EzMY8PITg8YZaxDb1HJs18
yfD4+oR2f/uMSGayxCnuRgzBthSs96xOJ34EkRpUgsB81RrC1Jjv5zWwIP1SCQlN
e2rKPS4ccBdE5uowKduc5TIbqbgbjLCArqTpqHDX6IBQP4A3SqYkcv/tOwFHuC/t
kE6+fH8gG7hQ9no9cE3WumRCLDyE8rRca6smAENrfcco8/5DCg2LqJ+SOEC64X+o
TYw0mmtRwPdObNmdHyrCtfk9XppdDLh21bKZrQvpj7WW2+EqSzbYLdyxvArVbzMq
bEqhwUbisC0nv6/RJbKsKWZy/N3IUA==
=6CF1
-----END PGP SIGNATURE-----

--HA8wmAlBS5gx6s1i--
