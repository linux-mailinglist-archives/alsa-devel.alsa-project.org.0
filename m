Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDD7544FEE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 16:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5CBC193D;
	Thu,  9 Jun 2022 16:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5CBC193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654786575;
	bh=AOpvTt54PuE89iqQ4kJmFjW8Pgnd73ja/e1F4g3SwNs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fl/CwHBcQrljzWBIuK1yRDFQIvBETe0FqS15kRVi9U5CBgMPM8DjztOKIpFLc5M+e
	 Vud4KRLYalBd+Q1IOj3oNBOOoZss868RfskqewKmZoJb2T03mDaIHfMhGcaGOfY5XD
	 rZxu5vLZ8kij3+JWW0z2aEUIVqPOUghD25VYO1jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D909F801F5;
	Thu,  9 Jun 2022 16:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E6A2F8019D; Thu,  9 Jun 2022 16:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F987F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 16:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F987F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ejWLBQry"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57EB761D9D;
 Thu,  9 Jun 2022 14:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3741EC34114;
 Thu,  9 Jun 2022 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654786504;
 bh=AOpvTt54PuE89iqQ4kJmFjW8Pgnd73ja/e1F4g3SwNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ejWLBQryQkA8YsegAT4heDiZLrWlayXzh5iGbuSSt8zvKlMlJ0f1kNoPjf8t+4CHe
 qz3+OYiO0yu9aq8y6LPCXnMoH1a1+d6dlJJkOmoWSnDjcSpkkgE5x2fEHfNndh/QXW
 fl4lTvk2s1eg/VI7VwjAnOsdrI6/Vx2JQEYqlWXx25M6wOgLKcb0qxafQVoMtSpoR6
 7izsHQXJy5rdpEIobznEHW03Y2uUTHDiZpIlj4uJwz/67mH09E4/gMN+7FNjlik+t8
 cNE0VF+1y4V46M1L2yy4xVXai4tqeodS5fZ7We91HjEVl9WdhPcRBy/dPNh/bs6uMf
 HiNaq8IRVYy4w==
Date: Thu, 9 Jun 2022 15:55:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 11/11] ASoC: codecs: rt298: Fix jack detection
Message-ID: <YqIJxPFwwsbAPJ14@sirena.org.uk>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
 <20220609133541.3984886-12-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NiWV1fROEGmrnV65"
Content-Disposition: inline
In-Reply-To: <20220609133541.3984886-12-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Space is limited.
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--NiWV1fROEGmrnV65
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 03:35:41PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On our RVP platforms using rt298 with combojack we've seen issues with
> controls being in incorrect state after suspend/resume cycle. This is
> caused by codec driver not setting pins to correct state and causing
> codec suspend method to not be called. Which on resume caused codec
> registers to be in undefined state. Fix this by setting pins correctly
> in jack detect function.

Again fixes should go before cleanups.  Could you be more specific about
what was wrong with the existing code and how this fixes it? =20

>  static int rt298_mic_detect(struct snd_soc_component *component,
>  			    struct snd_soc_jack *jack, void *data)
>  {
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
>  	struct rt298_priv *rt298 =3D snd_soc_component_get_drvdata(component);
> -	struct snd_soc_dapm_context *dapm;
> -	bool hp =3D false;
> -	bool mic =3D false;
> -	int status =3D 0;
> =20
>  	rt298->jack =3D jack;
> =20
> -	/* If jack in NULL, disable HS jack */
> -	if (!jack) {
> +	if (jack) {
> +		/* enable IRQ */
> +		if (rt298->jack->status & SND_JACK_HEADPHONE)
> +			snd_soc_dapm_force_enable_pin(dapm, "LDO1");
> +		if (rt298->jack->status & SND_JACK_MICROPHONE) {
> +			snd_soc_dapm_force_enable_pin(dapm, "HV");
> +			snd_soc_dapm_force_enable_pin(dapm, "VREF");
> +		}
> +		regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x2);
> +		enable_irq(rt298->i2c->irq);
> +		snd_soc_jack_report(rt298->jack, rt298->jack->status,
> +				    SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);

It looks rt298_jack_detect() already forces the pins on?  It's not clear
to me what the relationship between this code and the existing code is.

--NiWV1fROEGmrnV65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKiCcMACgkQJNaLcl1U
h9C2Xwf+Mnr+dmbspVzPcjR6Hk5riTTuwtYA9+50NnSJcOJj81xc5kToWeHXFsQ5
caBTnivGkcGg7K+3NnMFax+OO/FFxP5LHev3Jlt51AyksfDjvPl8mfY6u6S2cHwD
qayVUI3oqfhq+PENab1L8lpucXC7OymzYL7Ol3mQhy/SEEz0ct6RfAA3HQL5v90D
mWVhrcv6du/vCshSp4I1wW+6gjX/WtvwwmUA+5VA0k+DyRnRJnsHksfbH1zgLoOc
Oyja0y9qwGDz0uJAMNynu78yjAHpxIxWbcLNrlwW/YEdIWb/5VP3FygLWh9DKmvW
8IIsoRtzBdHLBrfJ0yYuUrUmbrGF6Q==
=zCkW
-----END PGP SIGNATURE-----

--NiWV1fROEGmrnV65--
