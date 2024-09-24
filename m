Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF169840DE
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 10:45:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CE37850;
	Tue, 24 Sep 2024 10:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CE37850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727167534;
	bh=/7+bMYTuA0Na85LJSgcUrk8dQliNnDn2crbyZgsy/eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WRjk1Cclz3yV9VnXtk2pRakA4oDPy5pPQnLFZJFeqdrIXAHZU6dYBPt5N1REtsnmC
	 JLr0JmA0j1IzyIJx9JxfkydamdrIl+NIZcMMkqnaJG8RZ0Cp2yPmUJN06Y2ne3JRnU
	 po3BecgOhuQ+BIC9Va/oyi5QPgfbARZNDQHohgKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2372F80508; Tue, 24 Sep 2024 10:45:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7C97F805B0;
	Tue, 24 Sep 2024 10:45:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DD70F802DB; Tue, 24 Sep 2024 10:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46AB8F8010B
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 10:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46AB8F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F9I6i8e7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15B745C5B65;
	Tue, 24 Sep 2024 08:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09984C4CEC5;
	Tue, 24 Sep 2024 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727167493;
	bh=/7+bMYTuA0Na85LJSgcUrk8dQliNnDn2crbyZgsy/eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9I6i8e7vXnHlnkFHY9Q/GBbGdZHCSWJgR0OTXY5gDlvVIkmjvZ00aCI93Utu4RF3
	 /FjaNCCckuA/hJibm/9qweQbam3f1v+JYhjUth3oPsV9nRyB5RPeEfD9cEd376DNT4
	 eGAqwFNXT6q2H4sfY5XxFwuxERc/PYneUa2PHP2qoU/qXaovG99Z766/ufYL9Y+NAb
	 IvFmwXrS/PORZN8ZnQAWWzQeeG22IW62TZKDDGaq4DYJXGbbatUfwvmVyPwRirR70f
	 CJp/Y+hc5zPX/63C69Mkux7/lMS7QpNCD6wDPX9x0nvLIsp4HJkSghFvPTsB2wabm4
	 cIsug72s5jhKw==
Date: Tue, 24 Sep 2024 10:44:38 +0200
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt721-sdca: Add RT721 SDCA driver
Message-ID: <ZvJ79gL6V3uQopO4@finisterre.sirena.org.uk>
References: <dd39b851e5a24aaf9a6866af32fca7eb@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4H/5yovAjkb4tWZw"
Content-Disposition: inline
In-Reply-To: <dd39b851e5a24aaf9a6866af32fca7eb@realtek.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: PWYIC46BT3DO5Z3KAHNM3ACX7TS3KXWQ
X-Message-ID-Hash: PWYIC46BT3DO5Z3KAHNM3ACX7TS3KXWQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWYIC46BT3DO5Z3KAHNM3ACX7TS3KXWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4H/5yovAjkb4tWZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 02:13:24AM +0000, Jack Yu wrote:

> +static const struct reg_default rt721_sdca_mbq_defaults[] = {
> +	{ 0x0900007, 0xc004 },
> +	{ 0x2000001, 0x0000 },
> +	{ 0x2000002, 0x0000 },
> +	{ 0x2000003, 0x0000 },
> +	{ 0x2000013, 0x8001 },
> +	{ 0x200003c, 0x0000 },
> +	{ 0x2000046, 0x3400 },
> +	// { 0x5810000, 0x702d },

Why is there this one commented value?

> +
> +static int rt721_sdca_pde34_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct rt721_sdca_priv *rt721 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(rt721->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12,
> +				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(rt721->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12,
> +				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		break;
> +	}
> +	return 0;
> +}

We should perhaps invent some helpers for these Soundwire events,
there's clearly a common pattern.

--4H/5yovAjkb4tWZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbye/MACgkQJNaLcl1U
h9BNFQf/ZnnjBgwDgWaCMR7fvo+p8icjr5uWQVc+16/YDyD6hcavOIY9x2LKqsZB
0IFtWdFfgZaCzq0lZV2YpvKAA8oT4P8Ihhv+Ae6BcxAu4rDSAkLeyVpxZmo8JIbt
f7sZ1TyrnyTVKlcz6zAwZqCb/DpqXD46znc9LOxewNxb3R1ENFGriCOgJ9W9Y2Jx
dDslCvPP2+hzk8SAh0jnPlG0RWIR96qvs53etTwNFdWLnMAJXO/vCIz/demw9k3Y
zd6FQh4vjHg0yoLuJGZ/XYOcCQs/i//3dtxp47RZQUScP6KMPhyAhhv8EfspwJnd
RalXlOJZjayZoW8f89nPybvUQp+StA==
=tf98
-----END PGP SIGNATURE-----

--4H/5yovAjkb4tWZw--
