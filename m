Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BBE46DD3C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 21:42:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0252A2648;
	Wed,  8 Dec 2021 21:41:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0252A2648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638996139;
	bh=qS1YFNi0D65kir09x3DJYrKReoP5VFnl6iuSSTE4i8w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bJK36y1ZV5CEAxtl6/pfKys3sMda6j6TWhfAItfzQ6T6+1XSoY99MtcZlexURxGYq
	 CuzYxBiBd38XsOOtevl4FRzq7UBMV/Bie/YT8Ax2kGW3qadWhkIw8/PyQ3TPPNIxao
	 Uh9/HtE0aTMDExxhNldFtEvp30HmZmMA8Lbgm854=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 310DCF804E5;
	Wed,  8 Dec 2021 21:41:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 377C3F804E5; Wed,  8 Dec 2021 21:41:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC0DFF80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 21:41:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC0DFF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i053DmNd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4116B82285;
 Wed,  8 Dec 2021 20:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C3AC00446;
 Wed,  8 Dec 2021 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638996059;
 bh=qS1YFNi0D65kir09x3DJYrKReoP5VFnl6iuSSTE4i8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i053DmNdMcrKb983aRWSIpYU+wEI7ALCzQBJxFF59F+kwRVA8/NXmbuwb/iBJvdj4
 oi/sYTC7f/BXE8XpUOPw6Nfl4v6NTDcPefQXPK71ADF9m9HjAa004CSxM6HyIUNw4j
 0A9klDy+TumTHYeBo9iI7t7TFEenb2J4E+SnW6OnzzDYb4eQlQ5sKyrllijOWKn11F
 sydLxDmQFC+nYBsdLqluNudfOsvb98PrDagaxls8lX8YQJtCTRpDSKx6fLpHHTrPAN
 8RR6Q2gKA6f8BWHb2GrfSGDVHwWQnajttQC2Ic9ZQo/gUwKbxMz60b7cvOagIGO3xG
 70yJ+fidRMNGQ==
Date: Wed, 8 Dec 2021 20:40:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH] ASoC: max98357a: Add mixer control to mute/unmute speaker
Message-ID: <YbEYVq+uvIcoxqko@sirena.org.uk>
References: <20211208185850.1555996-1-AjitKumar.Pandey@amd.com>
 <YbETxcwa83U8WXTO@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vxKfQpHFiM/DHo+x"
Content-Disposition: inline
In-Reply-To: <YbETxcwa83U8WXTO@sirena.org.uk>
X-Cookie: Alex Haley was adopted!
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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


--vxKfQpHFiM/DHo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 08:21:31PM +0000, Mark Brown wrote:
> On Thu, Dec 09, 2021 at 12:28:49AM +0530, Ajit Kumar Pandey wrote:
>=20
> > +static int speaker_mute_put(struct snd_kcontrol *kcontrol,
> > +			    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *component =3D snd_soc_kcontrol_component(kc=
ontrol);
> > +	struct max98357a_priv *max98357a =3D snd_soc_component_get_drvdata(co=
mponent);
> > +	int mode =3D ucontrol->value.enumerated.item[0];
> > +
> > +	max98357a->sdmode_switch =3D mode;
> > +	gpiod_set_value_cansleep(max98357a->sdmode, mode);
> > +	dev_dbg(component->dev, "set sdmode to %d", mode);
>=20
> This looks like it should just be a DAPM widget - it's just a generic
> GPIO control, there's no connection with the CODEC that I can see so it
> definitely shouldn't be in the CODEC driver.  Often trivial stuff like
> this is done in the machine driver, though the simple-amplifier driver
> is probably a good fit here.

Actually now I look again the only control interface this driver has is
GPIOs but it does expose a digital interface with constraints as input
so doesn't fit within simple-amplifier.  However this is just powering
off the amplifier to achieve mute rather than a separate mute control so
it'd probably be better to use a SND_SOC_DAPM_PIN_SWITCH() for the
Speaker widget to do this, this would also end up addressing Jaroslav's
thing with the naming as a side effect.  Sorry about the confusion there.

--vxKfQpHFiM/DHo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGxGFUACgkQJNaLcl1U
h9D/aQf/S3ZOBoeRlFrMlyiqHO6GldTqaps0Jb0ZtH6Cq6Zxle1FBwo+UMSq+lgK
zUa5D/Xfn0xptu0aRx+ylL9kuA6Nj//6bhOaLuLiAguPKB0KPfZFs3IwUKLc1oJ9
D+DkVfurjSOJE6bbz/YzPqVUiMkv6aT8ZpFqcyN8juTBqOoY2xoETmTfH0vM71lD
zYgZuXClqlocT5RijlKQ31rdAnyWxuOSCm7Q/MCgOJAUiR//z90wVurKzgUnie2i
W7E5Q3VJQIT5NWhNea56eWOLCXIxMq5QZArSpCIT0ycjiIsOXmLbE1REU+UK2SEV
+kr5IxEznvYKyl93LgUJiw/SCdMqxA==
=Gh2o
-----END PGP SIGNATURE-----

--vxKfQpHFiM/DHo+x--
