Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE3427FF0
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 09:54:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1AF7169C;
	Sun, 10 Oct 2021 09:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1AF7169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633852486;
	bh=HX5WY3mhIf7k5elYOoF7yRyy+o2XvlMWPpRKE7xr7PA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J31pt6CrJuIfXsi/LiNH4HXZA8NwyT8bB1zKsXcNIWl7G+VdY2NdSXZrWwxeKv/8A
	 Whqx6bmoK+HxeIY5kUF6/mL7qsD8u3kkTnpAV0Wag3wVulJVBsZghYNURVNEpAO5AU
	 qECb0eZt+1qmVPQIjVBK4zCC+2tV6yks1AXLCi3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F116F80528;
	Sun, 10 Oct 2021 09:49:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC9FBF801F7; Sun, 10 Oct 2021 09:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 416B2F800F0
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 09:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 416B2F800F0
Received: from bagend.localnet (86-126-20-31.ftth.glasoperator.nl
 [31.20.126.86]) (Authenticated sender: didi.debian@cknow.org)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 47F8D60006;
 Sun, 10 Oct 2021 07:47:22 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] ASoC: simple-card: Fill in driver name
Date: Sun, 10 Oct 2021 09:47:12 +0200
Message-ID: <4974503.Y8KB3sNASq@bagend>
Organization: Connecting Knowledge
In-Reply-To: <YNGe3akAntQi8qJD@qwark.sigxcpu.org>
References: <YNGe3akAntQi8qJD@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5876364.1uclEOo45F";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Mailman-Approved-At: Sun, 10 Oct 2021 09:49:30 +0200
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

--nextPart5876364.1uclEOo45F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] ASoC: simple-card: Fill in driver name
Date: Sun, 10 Oct 2021 09:47:12 +0200
Message-ID: <4974503.Y8KB3sNASq@bagend>
Organization: Connecting Knowledge
In-Reply-To: <YNGe3akAntQi8qJD@qwark.sigxcpu.org>
References: <YNGe3akAntQi8qJD@qwark.sigxcpu.org>

On Tuesday, 22 June 2021 10:27:09 CEST Guido G=FCnther wrote:
> alsa-ucm groups by driver name so fill that in as well. Otherwise the
> presented information is redundant and doesn't reflect the used
> driver. We can't just use 'asoc-simple-card' since the driver name is
> restricted to 15 characters.
>=20
> Before:
>=20
>  # cat /proc/asound/cards
>  0 [Devkit         ]: Librem_5_Devkit - Librem 5 Devkit
>                       Librem 5 Devkit
> After:
>=20
>  0 [Devkit         ]: simple-card - Librem 5 Devkit
>                       Librem 5 Devkit
>=20
> Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>
> ---
> This came out of a discussion about adding alsa-ucm profiles for the
> Librem 5 Devkit at https://github.com/alsa-project/alsa-ucm-conf/pull/102
>=20
>  sound/soc/generic/simple-card.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/soc/generic/simple-card.c
> b/sound/soc/generic/simple-card.c index 0015f534d42d..a3a7990b5cb6 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -621,6 +621,7 @@ static int asoc_simple_probe(struct platform_device
> *pdev) card->owner		=3D THIS_MODULE;
>  	card->dev		=3D dev;
>  	card->probe		=3D simple_soc_probe;
> +	card->driver_name       =3D "simple-card";
>=20
>  	li =3D devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
>  	if (!li)

Unfortunately this change broke multichannel audio on my Rock64 device runn=
ing=20
Debian. My Rock64 is connected to my AVR (Pioneer SC-1224) via a HDMI cable.

Before/without this change, pulseaudio correctly identifies my AVR and give=
s me=20
hdmi-stereo/hdmi-surround/hdmi-surround71 output profiles via the HDMI card=
 and=20
iec958-stereo/iec958-ac3-surround-51 on my SPDIF card.
After/with this change, I only have a stereo-fallback output profile on bot=
h=20
HDMI and SPDIF card.
I reported this to Debian at https://bugs.debian.org/995923
I have verified that reverting this commit on a self-built 5.14.10 brought =
back=20
multichannel audio.

On LibreELEC's current nightly builds (version 11) with kernel 5.14 on=20
a(nother) Rock64 device (also connected via HDMI cable), I hear no sound at=
=20
all. Previous nightly builds (version 11) with I _assume_ kernel < 5.14,=20
worked fine. As I didn't keep previous nightly builds, I can't verify that.
I reported that at https://github.com/LibreELEC/LibreELEC.tv/issues/5734
I have NOT verified whether reverting this commit would also restore audio =
with=20
LibreELEC as I'm not familiar with their build system.

This is the first time I'm reporting an issue to the upstream Linux kernel,=
 so=20
I hope I did it correctly (DL-ed mbox file and did Reply-to-All). If not,=20
apologies and I hope you'll point me to the correct place/way.
(I don't know if others need to be notified too as it is part of 5.14 relea=
ses)

Cheers,
  Diederik
--nextPart5876364.1uclEOo45F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCYWKagAAKCRDXblvOeH7b
btKJAP94HDQVbxFH7oeZReoLAa9c33hWAkhsXvRR0RgKBsCXlAD/eNwTTabMI5Cy
U1Wsg+p38twgt/m85qPOO2Vwgkfwqgk=
=aGUG
-----END PGP SIGNATURE-----

--nextPart5876364.1uclEOo45F--



