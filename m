Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F73D64D18B
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 21:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24B8C1F9E;
	Wed, 14 Dec 2022 21:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24B8C1F9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671051433;
	bh=FT+rlT7sHUzUjf2o/MOvXlHg0Ptne0g9Np5hCREpUpY=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tLzsuJNkAuaWbytwmTCmBxNa3SriRpM1UkfYZ8q+QuoJUM5ggKaVGYAHqiWsp7bVG
	 BIC1iibeAwoa2BOixKp8Vp8DmnSqDA2cdAOof1ahc1ztIjiB0cQ8jMpeUaOBlcgkDu
	 OEyBlCBEEybWWpQm+HEj2AqqRf8NvUdTCr2lBZ8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCE87F80141;
	Wed, 14 Dec 2022 21:56:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14957F804D7; Wed, 14 Dec 2022 21:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F149F80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 21:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F149F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=Vhc3CVKe
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1E3AF8431A;
 Wed, 14 Dec 2022 21:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671051371;
 bh=l4X5mrrurV5FCHmaDwbWTyicKv53nSj1BodSjxEXerY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vhc3CVKeGlJBGvC6Idb8K5OoyMC5inVVARSkksPVbP2VU93bCKGFxMbQkVqDXBjuz
 9VZMOthFb8x6V2+6W4qsVmyyxqtQt351zYlY5woNfDvFUgz1e6vKcZNepqbKR1za2d
 r9a0rov41Jv5P5jaQNK7ywQIFShm7VYlrMBL3CYya6K71tMs3mdHt9XxOFeu8LW54P
 tZs9JWuD+/GkrL3zHUPzm0vf75eSiBK0TBwnTCvY5lBND1K3MD6hdbE/NYDqO93htV
 P1IO6xR+Eatna7Wo4apU3Pou47XlbFDPy2v2Jc9OSe+xyabZs7aQfd/DQeNu9cdSfG
 yWPMOXQye1+2Q==
Date: Wed, 14 Dec 2022 21:55:46 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: wm8940: Mute also the speaker output
Message-ID: <20221214215546.657a04f3@wsk>
In-Reply-To: <Y5nbf72ksywcXK65@sirena.org.uk>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221214123743.3713843-4-lukma@denx.de>
 <Y5nbf72ksywcXK65@sirena.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pua.gfK73puRtpwqm2giex9";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--Sig_/pua.gfK73puRtpwqm2giex9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> On Wed, Dec 14, 2022 at 01:37:42PM +0100, Lukasz Majewski wrote:
> > Without this change the BTL speaker produces some
> > "distortion" noise when test program
> > (speaker-test -t waw) is ended with ctrl+c. =20
>=20
> > As our design uses speaker outputs to drive BTL speaker,
> > it was necessary to also mute the speaker via the codec
> > internal WM8940_SPKVOL register with setting
> > WM8940_SPKMUTE bit. =20
>=20
> > @@ -465,9 +465,18 @@ static int wm8940_mute(struct snd_soc_dai
> > *dai, int mute, int direction) { =20
>=20
> > +	spkvol_reg &=3D ~WM8940_SPKMUTE;
> > +	if (mute) {
> >  		mute_reg |=3D 0x40;
> > +		spkvol_reg |=3D WM8940_SPKMUTE;
> > +	}
> > +
> > +	ret =3D snd_soc_component_write(component, WM8940_SPKVOL,
> > spkvol_reg);
> > +	if (ret)
> > +		return ret;
> > =20
> >  	return snd_soc_component_write(component, WM8940_DAC,
> > mute_reg); =20
>=20
> In addition to the issue Charles raised this is simply not what the
> mute callback should do, the mute callback should specifically mute
> the digital input (with the goal of masking any glitching on there
> while clocks are started/stopped).=20

Ok

> Looking at the driver the device
> supports analogue bypass paths to the speaker - these will be broken
> by your patch

I was not aware about this side effect. I just wanted to be sure that
the speaker is muted.

> so if you genuinely need some workaround in this area
> I'd be looking at the Speaker Mixer PCM Playback Switch rather than
> muting the speaker as a whole.

I would be more than happy if I could use for example the 'amixer'
command to setup the audio correctly without this patch.=20

For example - on this system - before I run any speaker test I need to
call: amixer -d set 'Speaker Mixer PCM',0 on

to unmute the system.

>  If the device just can't cope without
> an input then ignore_mdown_time might be what you're looking for, it
> looks like the device doesn't have any lengthy sleeps in the power
> up/down paths so that should be fine so long as it doesn't pop/click.
>=20

Ok. I will check this as well.

> I'd also check there's not some other system configuration issue here
> which is more obvious when the input from the DAC stops getting input,
> check that you don't see similar issues when silence is played for
> example.  It might be worth checking that none of the analogue bypass
> paths are enabled.

Thanks for your hints. I will investigate it further.

It looks like this patch is some kind of a hack, to fix my system
configuration and shall be dropped in v2.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/pua.gfK73puRtpwqm2giex9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmOaOFIACgkQAR8vZIA0
zr3r7gf+JJEoZ1l46O2qdDS8vRVF97kEnEFeTTC5zZ2pz8azjnZjc31YMXAdnM0d
Gm2AQ0cQrg4E3mSqedFE/XB+9kCrlRXbYoqvFCf8eJrSZJMOv6FDs5O1aRsL945+
bds52k+gCnnrG9/AFCYBvkouwRYP4rQXK55oFkJMM3vofLMhQmjfqMlVn6z+QcUA
0PNlpDi00kPRC4s5DbsNnlaNzLbjiKgf8ToO/xHsgHoPkjzUXZmTK9j/DugB9xJU
D9XfYNzEOcMMOnOrKUznpv6/dQfAjMfjkx1iKu16jgPNtXSnlv2ywlR6cycNzm1h
d7PeKwQELJG973Ig7ddujVcaZoIQvA==
=P500
-----END PGP SIGNATURE-----

--Sig_/pua.gfK73puRtpwqm2giex9--
