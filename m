Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6D4A6450
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 19:57:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A96617D4;
	Tue,  1 Feb 2022 19:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A96617D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643741866;
	bh=c/IJGNmj/Ex6/82Ta/ipeCiMP2mjbmkO9Yx3XqM+Ro8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U3UrxipjolviQxqvam1UXG3z1kOWjG6hV9GLNfnVtsqzOTykj0MAHfXBbxsUrMm+d
	 i3PTNTM79oUvkIKTlGcJOzmZfwW22T3u2C/USMsTyLRVGTTxF5GhxWwa3Z/TfdcL7R
	 glGfDAZghtfieOD+umgJpLuzWoXmwRbDIsXjuTmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62FC3F800F8;
	Tue,  1 Feb 2022 19:56:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54FB7F80130; Tue,  1 Feb 2022 19:56:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B17CBF800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 19:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B17CBF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sqWc/UnE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37DFD614B5;
 Tue,  1 Feb 2022 18:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA79C340EB;
 Tue,  1 Feb 2022 18:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643741791;
 bh=c/IJGNmj/Ex6/82Ta/ipeCiMP2mjbmkO9Yx3XqM+Ro8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sqWc/UnElgcA1V/zabH0Upd2dRIuZ7XfcXx1LltnpaEQjmwXG1244xqct7HfsPGfz
 EAzqU/AuH8RaTAZKaeGXrPsnZslxkl0Ly1rAyiNIu9Lhe5VyS6iE9GhDWgdWocVqnz
 SZ1mHEG90cIQbPEzGGQo0kowIy8rr/uCZKaS8eAt43OPv3QA0mmwlJUbrDngbhFIVu
 nF+aGAlE9lhtGeZBBwhDKigfv5PaECp2wT3ehSwNeGmBTcYXU1GzTZaxHXj4BUwH+Q
 aOrxAdh61l+tn8SGCG1rpmrRmfmfajV+Xjydx95MHC/B8QnpG19Y9HLkDJNy9HQ0jg
 6fbMtSjLMiC6Q==
Date: Tue, 1 Feb 2022 18:56:26 +0000
From: Mark Brown <broonie@kernel.org>
To: V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Set gpio_spkr_en to None for max speaker
 amplifer in machine driver
Message-ID: <YfmCWuD88sT8YxfG@sirena.org.uk>
References: <20220131203225.1418648-1-vsujithkumar.reddy@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lIess6m8PaiZ+06b"
Content-Disposition: inline
In-Reply-To: <20220131203225.1418648-1-vsujithkumar.reddy@amd.com>
X-Cookie: All's well that ends.
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 ajitkumar.pandey@amd.com, Curtis Malainey <cujomalainey@google.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com
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


--lIess6m8PaiZ+06b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 01, 2022 at 02:02:15AM +0530, V sujith kumar Reddy wrote:

> Maxim codec driver already enabling/disabling spk_en_gpio in form of sd_m=
ode gpio
> hence remove such gpio access control from machine driver to avoid confli=
ct


> -	.gpio_spkr_en =3D EN_SPKR_GPIO_NK,
> +	.gpio_spkr_en =3D EN_SPKR_GPIO_NONE,
>  };
> =20
>  static struct acp_card_drvdata sof_rt5682s_rt1019_data =3D {
> @@ -56,7 +56,7 @@ static struct acp_card_drvdata sof_rt5682s_max_data =3D=
 {
>  	.hs_codec_id =3D RT5682S,
>  	.amp_codec_id =3D MAX98360A,
>  	.dmic_codec_id =3D DMIC,
> -	.gpio_spkr_en =3D EN_SPKR_GPIO_NK,
> +	.gpio_spkr_en =3D EN_SPKR_GPIO_NONE,
>  };

This looks like a good fix for the immediate issue which fixes the
MAX9360A systems without breaking the RT1019 ones, however as I said in
the thread about Curtis' revert it's not clear what the ideal thing is
here.  There's no documentation about the RT1019 that I can find so it's
not clear to me what exactly the GPIO is controlling, if it's part of
the RT1019 or something else.  That influences where the most tasteful
place to control this GPIO is.  Curtis noted that the RT1019 driver
includes gpiolib headers but that could just as easily be cut'n'paste as
intentional.  What's the story here?

I do also note that the current code just turns the GPIO on and leaves
it on which presumably isn't great from a power management point of
view.

--lIess6m8PaiZ+06b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH5glkACgkQJNaLcl1U
h9AWMwf9H+pMGHYSfKLyGrqqxX98un/or66MjUsxkpLtvaChtZ4NO/N29ZVH1IyH
Yq7+PCSINajjV8pmxYKpPHgrjDjWCdSRk9cLHivHG7SmazMwjBGrKPYg7TLxr0r4
WkupsCucq91p+BPGZ8oUsFoEMILPHI+w0tka+AflnUfXlhYtG/qqZBa+QbJ1wEd3
ZvOwac6lbfzu2sf9vQgTJig1h9lUyRT1l+y4aFkFfQRZKQZc6YGGLzoHRawWQqxY
8m5IabZxP/3KcpMcZ6GZDMNa47nDWKu7PLQZo0OUEAUlgfffY7mO/4HBRaeJlIMc
KuFmmP9uNYoYHd+VSDPeMoD4UVBwMA==
=DVHf
-----END PGP SIGNATURE-----

--lIess6m8PaiZ+06b--
