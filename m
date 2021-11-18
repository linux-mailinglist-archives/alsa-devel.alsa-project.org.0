Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2577455D04
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 14:51:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77B0E184E;
	Thu, 18 Nov 2021 14:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77B0E184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637243485;
	bh=EHKSkKOrT01rZkYPW4UuImNyGa7Bn6ryCr5Bieip2ns=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Da2gAZQ6XA54BSGEhHRzXdNCDqMk/hXMF80g94ZozvR69j0jC2NYwpIyT/+Eee9il
	 apdG8Mqa1pZgeV6Kt9wTUt0uKtM5itbxSdbXJStRftMgpm5PtrlOvERU8B8rm+xQ7W
	 YfHwW+USgeztn3agdorTOlqJArue0pga43QbA4Mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D28BDF800FA;
	Thu, 18 Nov 2021 14:50:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1B98F80272; Thu, 18 Nov 2021 14:50:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24599F800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 14:49:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24599F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BND+dl5n"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E032261A55;
 Thu, 18 Nov 2021 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637243394;
 bh=EHKSkKOrT01rZkYPW4UuImNyGa7Bn6ryCr5Bieip2ns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BND+dl5nE0O9ftOYY91HxJfmFIo5zY5u6blBHoeIBAfPkhmBYBf2YrJZEPHrO/1W4
 mbsK8jeuqc/Gd7qDyvul5KyVKdtyMnrqbXbjPIutxFg7URfsT0HWdGnOgpXzm6Abai
 J349q2ySUxxhC7TqS3qrnYQv7StSQNNpEoAzLoANJWLOKh1Bz1mway82MSlHRAS4mH
 7Vc7jsbB8fs9rjS5QbhOBHi/q9jEq/n8DtP5vvQBlMjzAPVoWMOOc6Nnu2JN1uZGy3
 weJ468p45cEGPax8dYY0nbi68tgMdFyAZqDEL7lK06yTbSnPXNvbJC5oUW4psoqgvi
 RxLknQozTP2Rg==
Date: Thu, 18 Nov 2021 13:49:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3 12/16] ASoC: tegra: Fix kcontrol put callback in MVC
Message-ID: <YZZZ/Qk2/XX20qSS@sirena.org.uk>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
 <1637219231-406-13-git-send-email-spujar@nvidia.com>
 <s5hzgq1io88.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3p2xpiMr+J6zdqeh"
Content-Disposition: inline
In-Reply-To: <s5hzgq1io88.wl-tiwai@suse.de>
X-Cookie: People respond to people who respond.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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


--3p2xpiMr+J6zdqeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 02:32:07PM +0100, Takashi Iwai wrote:
> Sameer Pujar wrote:

> > +	old_mask =3D (value >> TEGRA210_MVC_MUTE_SHIFT) & TEGRA210_MUTE_MASK_=
EN;
> > +	new_mask =3D ucontrol->value.integer.value[0];
> > +
> > +	if (new_mask =3D=3D old_mask) {
> > +		err =3D 0;
> > +		goto end;
> > +	}
> > =20
> >  	err =3D regmap_update_bits(mvc->regmap, mc->reg,
> >  				 TEGRA210_MVC_MUTE_MASK,
> > -				 mute_mask << TEGRA210_MVC_MUTE_SHIFT);
> > +				 new_mask << TEGRA210_MVC_MUTE_SHIFT);

> I guess this test-and-update procedure can be simplified with
> regmap_update_bits_check().

Yes, this is exactly the application that _update_bits_check() was
written for.

--3p2xpiMr+J6zdqeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGWWf0ACgkQJNaLcl1U
h9D8jAf7BVgrmUDkAqGQIkedLOdK24v1N/Gp53lTao7cwUgUy+beBW3YsQU0w7Bg
r1BcXrjWpusKLTBgo6Y/8mr2bzktqToKmlne3trxVUS/EWSGWWq4JINEw8SajpqT
GcSmqwJ6BpF3giLyFPUTE7jJBGsv19qEohP3OUrW7Kph1GP+pm+LV/epWBmHamwN
XVTyPHxk0bmxtsOXOTHi3+14iD0CwpyO8AWsxFxx70ZKjtL89v5IthEZzy98ZQV7
4uZyh/GXN97rNizvH5k1DCjwnfyAUxvkP8L2ksIQ00RRfqDv2TmBujw1AetHsJ+g
j3GyV0p/jUwFxXiSZ8t2+Vho2oUucg==
=u/ik
-----END PGP SIGNATURE-----

--3p2xpiMr+J6zdqeh--
