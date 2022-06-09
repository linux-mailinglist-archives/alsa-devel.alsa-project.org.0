Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC41C544D4A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73A19188A;
	Thu,  9 Jun 2022 15:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73A19188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654780639;
	bh=adIY73cUSCNwOEj4s+9TfwrvjgCT5vabHNIojXe/1uY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8Yvht+tVsjPKAY8Ob6p9v4LmiU8pSz8IIB8APGSBCdOxItFO/QWz+NxpuOocnHzY
	 MoXdbgrNupMg31auyjmLEcB2CjJhsLRcWGGn/NttdMi9E6AQ4/eJFwA9H/4bbYBDyA
	 IYeMBh9UNzLDD+iEp8w277kf3FTkufHlpZAkdN3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4E8DF801F5;
	Thu,  9 Jun 2022 15:16:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DC89F8019D; Thu,  9 Jun 2022 15:16:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13BB7F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13BB7F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WYPI/dFW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE878B82D85;
 Thu,  9 Jun 2022 13:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F2FC34114;
 Thu,  9 Jun 2022 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654780570;
 bh=adIY73cUSCNwOEj4s+9TfwrvjgCT5vabHNIojXe/1uY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WYPI/dFW/4u4zTXC/IoaW+gqiph/U3f8dUrIV74OlJs0SAnkbFcVND+snhWDy+MYh
 6ioLbFofSxMV7wfxsQubzFcp7eTHg3LR3D+RM3LC975VPbwms9sD1u0fzMbkuK+7aZ
 Hq6J0DhKtzTC3IsvGKX9eswrN40xD110OJDrNfNDsCNKB94cTJL53JgZBEcnqbkddT
 lLTbP/uNM2VCh5PIs/E4J25prK2pS1ggzPizFluCG2fNfVAlxsCvzIncZN5RMqgVXo
 sxWPPRxk2eVKbDsvcyXmElZHZvHsWOE8mcZOC/F3x32x/sWUjeGTGdnynKF84hiXFL
 9k55FZrg5hBdg==
Date: Thu, 9 Jun 2022 14:16:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 5/5] ASoC: apple: Add macaudio machine driver
Message-ID: <YqHylN3xba9XFrF8@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-6-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zP4ArPesiXfS095U"
Content-Disposition: inline
In-Reply-To: <20220606191910.16580-6-povik+lin@cutebit.org>
X-Cookie: Space is limited.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--zP4ArPesiXfS095U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:19:10PM +0200, Martin Povi=C5=A1er wrote:

> + *  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90       =E2=94=8C=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA =E2=94=8C=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90
> + *  =E2=94=82 Primary  =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=A4                 =E2=94=82 Mux =E2=94=82 =
=E2=94=80=E2=94=80=E2=96=BA =E2=94=82 Speakers =E2=94=82
> + *  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98       =E2=94=82    =E2=94=8C=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=96=BA =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> + *                =E2=94=8C=E2=94=80=E2=94=80=E2=94=80 =E2=94=82 =E2=94=
=80=E2=94=80=E2=94=80=E2=94=98             =E2=96=B2
> + *  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90  =E2=94=82    =E2=94=82         =
         =E2=94=82
> + *  =E2=94=82Secondary =E2=94=9C=E2=94=80=E2=94=80=E2=94=98    =E2=94=82=
     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=90
> + *  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98       =E2=94=9C=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=96=BA=E2=94=82Plug-in Demux=E2=94=82
> + *                     =E2=94=82     =E2=94=94=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=AC=E2=94=98
> + *                     =E2=94=82                  =E2=94=82
> + *                     =E2=94=82                  =E2=96=BC
> + *                     =E2=94=82                 =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=90
> + *                     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=96=BA =E2=94=82 Mux =E2=94=82 =E2=94=80=E2=94=80=
=E2=96=BA =E2=94=82Headphones=E2=94=82
> + *                                       =E2=94=94=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98

As far as I can tell this demux is entirely software based - why not
just expose the routing control to userspace and let it handle
switching (which I suspect may be more featureful than what's
implemented here)?

> +static int macaudio_jack_event(struct notifier_block *nb, unsigned long =
event,
> +                               void *data)
> +{
> +       struct snd_soc_jack *jack =3D data;
> +       struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(jack->c=
ard);
> +
> +       ma->jack_plugin_state =3D !!event;
> +
> +       if (!ma->plugin_demux_kcontrol)
> +               return 0;
> +
> +       snd_soc_dapm_mux_update_power(&ma->card.dapm, ma->plugin_demux_kc=
ontrol,
> +                                     ma->jack_plugin_state,
> +                                     (struct soc_enum *) &macaudio_plugi=
n_demux_enum, NULL);
> +
> +       return 0;
> +}

This should be integrated with the core jack detection stuff in
soc-jack.c and/or the core stuff that's wrapping - that way you'll
ensure that events are generated and status readable via all the
interfaces userspace might be looking for.  The ASoC stuff also has some
DAPM integration for turning on/off outputs which might DTRT for you if
you do need it in kernel.

--zP4ArPesiXfS095U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKh8pQACgkQJNaLcl1U
h9A35AgAhc/b4LJ2GElO9+hrXTNIF0hkl2AmactD2FfUXkE/CAfoLDtaK/5RtjeR
4ybKT5miFOnvG5bzMVTQV8BtLKiT9AI3ABDsuj2QMvaTZ95Y3tgqZh738EQAYB5l
Qrie4m9HHqjp1dLdqvNcgVTg1QWzIddKaMB7bI0FHITUZVqgcq5qZiAtAZ3GGBeP
ZIdkYMVLhyEIUpjXpYOlHjgxo2wKs+ixIyN9BonMvX6aSOLNXmI/vuqVPYp8uuvn
u+WXjidw0QlG2gU2kgnncbugvKNMKm4YcCd+CcQ7q4wrwQbH12DT7uD0X2m1/kVE
py9WhKEDlJiKgkRkR7GjmWGf2OmarA==
=P1Mm
-----END PGP SIGNATURE-----

--zP4ArPesiXfS095U--
