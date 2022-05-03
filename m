Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D496518F30
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 22:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 043D910E;
	Tue,  3 May 2022 22:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 043D910E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651610724;
	bh=6bWKdbsEXPz49sGZeunIdmzckF0jfpJgBh7mhHoKyhk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nue2OKNYXG4fHGl/tPYY7E7TFXEvO6H0WCzco4Zu8L85VYxOFwPUrpQFcoPYQ8vrK
	 D1bbhPVie4tChb61bP1f+qCAublxIyn3L5xfMrJZFr/6H6hVbczSwifu1ZxZhZVaGe
	 ujMjjaHZaHo7PMVs2dkCIwRxwy4jamAU1R6HWhqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71ECEF8025E;
	Tue,  3 May 2022 22:44:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C370F80236; Tue,  3 May 2022 22:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D26FF800D2
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 22:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D26FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LgVonAns"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 160DFB82033;
 Tue,  3 May 2022 20:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C357BC385A9;
 Tue,  3 May 2022 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651610658;
 bh=6bWKdbsEXPz49sGZeunIdmzckF0jfpJgBh7mhHoKyhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LgVonAnsfiXhii0zNxUkdIYYhPToiGIE89Air899S4PqzWJ1Ka+uHV99gSJaq1TSp
 WYQz5q7dzwFNQROTBWLbKXMdwC/H0dLstxEojsvQfFsZahhB2s3OGxqDpl27JdqOAu
 6GYvTjT9GASgNb07qlyS66lZn9zyTGTQhye6GQDajjysXl5wl3WHqClrET8CtN1nBR
 wA6GAR0WYSwUBNWtDsvj+iMqgYGmMAXvQx/XH1U55I+FGqQDpWhHEJbYWUwjWUtGo8
 jsRhA/GN2yAnTTXAl0RAwCTjhdsjW+hdYJefibXGSflStopXEtF3QCV11YpdDWGAaw
 Auymd2eo1yL5Q==
Date: Tue, 3 May 2022 21:44:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: Add option for ELD bypass
Message-ID: <YnGUHcFOYrvcA2Ol@sirena.org.uk>
References: <20220430134006.v2.1.Ide2a04ad0c123cc6990a63632e6f9bb7d7f9be13@changeid>
 <20220503083852.be2aihvkd3gestdw@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OsPWNiu3lmWmo4dw"
Content-Disposition: inline
In-Reply-To: <20220503083852.be2aihvkd3gestdw@houat>
X-Cookie: Drop that pickle!
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Dmitry Osipenko <digetx@gmail.com>
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


--OsPWNiu3lmWmo4dw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2022 at 10:38:52AM +0200, Maxime Ripard wrote:

> I think some more documentation is needed there to describe how it's
> going to be used.
>=20
> Like, you mention that it's relevant when the EDID is not valid. But if
> the EDID is valid, is bypass still allowed or not?

I'd expect so given that it's explicitly an override and that it's not
like it's unknown for people to put nonsense in ID information.

> > +static int hdmi_codec_eld_bypass_put(struct snd_kcontrol *kcontrol,
> > +				     struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> > +	struct hdmi_codec_priv *hcp =3D snd_soc_component_get_drvdata(compone=
nt);
> > +
> > +	if (hcp->eld_bypass =3D=3D ucontrol->value.integer.value[0])
> > +		return 0;
> > +
> > +	hcp->eld_bypass =3D ucontrol->value.integer.value[0];
> > +
> > +	return 1;
> > +}

> If the ELD bypass is set, how does it affect the hdmi_codec_params being
> passed to the codec?

Presumably we should tell the CODEC what we're trying to play (looks
like that's what the current code does)?

> Also, what is being returned to the userspace by hdmi_eld_ctl_get once
> the bypass is enabled?

My first thought would be that we'd always read whatever is there
rather than trying to make something up, bypass just says we're not
enforcing it.

> And shouldn't we call get_eld when we remove the bypass?

Or given what I just said above should we not change any get_eld() calls
but instead only change things so that we don't look at the ELD data
when setting constraints during startup() and during channel map
operations?  In that case we wouldn't need to read again.

--OsPWNiu3lmWmo4dw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJxlBwACgkQJNaLcl1U
h9D1BAf+Ki9P/Di674dAQK1c9cYTrHMivYqtlXs4E07WqWCuoQYF9hgTVXln3dLx
frSjVN3r0eDL+/GRtV3Nr5n9aL/LU/vRxVDGKLKXxDOKxDxaiIk/S256fcFLt1sE
OZV9MGFiexyaQQhVCdOhGpxNWGPAt99ytMhWjNrlejNf1IpdVVG7raAkdYRQdyE0
THsaHeU741+6mVXb8pinIU8R3dSF01zO3xGuovHVCuL+NWFn9xuPqccrs1HCvYjE
Zhs7X9OvnWbo2ae7Pa9rz87G2KEyHYndtfElFgHA5fZ5bl4+ram85gpSdSXxf1Dl
RzLY60zVq2ppkeLBuEDt3djb2+GYMQ==
=7Z++
-----END PGP SIGNATURE-----

--OsPWNiu3lmWmo4dw--
