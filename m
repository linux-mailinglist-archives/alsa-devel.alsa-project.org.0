Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952C132A040
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 14:13:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27FD516EC;
	Tue,  2 Mar 2021 14:12:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27FD516EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614690822;
	bh=U/HHFktYJkmOUhQoJChOT80QJnf4UxQLBjSVqX092jk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LSyt6Yf1k6hjwUTKUaMzNDLndFj01cNGXUeL0arLY6H9k23dVZLc4rWK/CaeV11VT
	 z7BCYQdBMPHGc9/RoaYT1ryThRE9qf815Ebwmph3ad/gabbgvttPgxVSF3cz3/9LTG
	 wbbDDv7B/0GXZYmMugcyI2t2KXrTc6MNT5ob6dFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CFBFF80227;
	Tue,  2 Mar 2021 14:12:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CACF9F80269; Tue,  2 Mar 2021 14:12:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37968F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 14:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37968F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JTvVoeEp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B27D64F1E;
 Tue,  2 Mar 2021 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614690717;
 bh=U/HHFktYJkmOUhQoJChOT80QJnf4UxQLBjSVqX092jk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JTvVoeEpFguErPefguu/02LK3NL3Ix5VbEuvH48mU7qZ+duUShqmLL4NSdASbqvkf
 FXzrRexQHyD0hzVYxl0tMsUGlzIbV/auRVPnlc50WIHkT1+EXGkjVd8tTtCUfwBuew
 80/DX/mYYLi/fpHwANdOCbR7aMlWSHzsTpu2D/snUZfq49xJ75WVEmgQs4McEO4DKs
 in6bAigtLzTLwCGf8TCLSor1Rv4uQYqpeJN5J6R9aik7KOm3XUouNMDrHDeK0kBSgk
 uHsi2CaveaGwwfQmF1WNKCuBASxW3qhQWa75DOr3xKjSwokTqAet8H/EeOEICdbh0G
 +KRj+deFL7kEA==
Date: Tue, 2 Mar 2021 13:10:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 4/8] ASoC: soc-pcm: add soc_pcm_care_symmetry()
Message-ID: <20210302131051.GE4522@sirena.org.uk>
References: <87tupuqqc8.wl-kuninori.morimoto.gx@renesas.com>
 <87o8g2qqaw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline
In-Reply-To: <87o8g2qqaw.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 10:48:07AM +0900, Kuninori Morimoto wrote:

> -static bool soc_pcm_has_symmetry(struct snd_pcm_substream *substream)
> +static void soc_pcm_care_symmetry(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substream);
>  	struct snd_soc_dai_link *link =3D rtd->dai_link;
> @@ -423,7 +423,8 @@ static bool soc_pcm_has_symmetry(struct snd_pcm_subst=
ream *substream)
>  			dai->driver->symmetric_channels ||
>  			dai->driver->symmetric_sample_bits;
> =20
> -	return symmetry;
> +	if (symmetry)
> +		substream->runtime->hw.info |=3D SNDRV_PCM_INFO_JOINT_DUPLEX;

The idea makes sense but I'm not sure about the name here - perhaps
soc_pcm_update_symmetry() might work better?  It's not super clear but
does look more natural.

>  }
> =20
>  static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bit=
s)
> @@ -735,8 +736,7 @@ static int soc_pcm_open(struct snd_pcm_substream *sub=
stream)
>  	/* Check that the codec and cpu DAIs are compatible */
>  	soc_pcm_init_runtime_hw(substream);
> =20
> -	if (soc_pcm_has_symmetry(substream))
> -		runtime->hw.info |=3D SNDRV_PCM_INFO_JOINT_DUPLEX;
> +	soc_pcm_care_symmetry(substream);
> =20
>  	ret =3D -EINVAL;
>  	if (!runtime->hw.rates) {
> @@ -1681,8 +1681,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_subst=
ream *fe_substream,
>  	int i;
> =20
>  	/* apply symmetry for FE */
> -	if (soc_pcm_has_symmetry(fe_substream))
> -		fe_substream->runtime->hw.info |=3D SNDRV_PCM_INFO_JOINT_DUPLEX;
> +	soc_pcm_care_symmetry(fe_substream);
> =20
>  	for_each_rtd_cpu_dais (fe, i, fe_cpu_dai) {
>  		/* Symmetry only applies if we've got an active stream. */
> @@ -1707,8 +1706,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_subst=
ream *fe_substream,
>  		if (rtd->dai_link->be_hw_params_fixup)
>  			continue;
> =20
> -		if (soc_pcm_has_symmetry(be_substream))
> -			be_substream->runtime->hw.info |=3D SNDRV_PCM_INFO_JOINT_DUPLEX;
> +		soc_pcm_care_symmetry(be_substream);
> =20
>  		/* Symmetry only applies if we've got an active stream. */
>  		for_each_rtd_dais(rtd, i, dai) {
> --=20
> 2.25.1
>=20

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+OVoACgkQJNaLcl1U
h9BypQf+L/2ERGTTNBqfmaE0sfhiTudm8mydnahf2l7jEp0G1pM4Bevcefylcddh
GNMwo4JS76Hgey3f1zcRYr0iMRlhaLTbSOZASvduuogPVfBQZd8LEqr0e2NDLaD/
NM+KF/bhfaE1BjyJDhZbS668b3Hw/56EbQVwjkAm47FxHzJre2rKt44pSfsmVbYH
IB/5LbJ14pda1T3YIxP6RjhtEGZ8gfV0k36FtPGZMFfPotAE0AJgDQ+w+vTb1rI7
04OjKd0ZSxXX3ErBaSmrtNKKUAtmRnOPfyfEvDm1H+BwaAuT8SeTsIuWw1Ij6j8x
kYf+CcTFUgq6Egkz0EE5oBV7vhktzA==
=1bdc
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--
